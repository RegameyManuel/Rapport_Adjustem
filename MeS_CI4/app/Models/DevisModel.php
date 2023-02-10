<?php

namespace App\Models;

use CodeIgniter\Model;
use Config\Database;
use Config\Services;

class DevisModel extends Model
{
        /**
     * Fonction qui va récupérer le dernier Code présent dans la base de donnée et incrémenter de 1
     * @return string
     */
    private function generateId(): string
    {

        $db = Database::connect();

        $row = $db->table('devis')->select('numero_de_devis')->orderBy('numero_de_devis', 'DESC')
            ->get()->getRow();


        if (!empty($row->Code)) {
            $id = $row->Code;
            $newID = $id + 1;
            $nombreChiffre = 6;
            $AddZero = "";
            $nbrzero = $nombreChiffre - strlen($newID);
            for ($i = 0; $i < $nbrzero; $i++) {
                $AddZero .= "0";
            }
            $idNbrZero = $AddZero . $newID;
        } else {
            $idNbrZero = "000001";
        }
        return $idNbrZero;
    }


     /**
     * Insertion dans la table Devis
     * @param $data
     * @return array
     */
    public function createDevis()
    {
        $numero_de_devis = $this->generateId();
        $db = Database::connect();
        $db->table('devis')
            ->set('numero_de_devis', $numero_de_devis)
            ->set('date_creation', date("Y-m-d"))
            ->insert();
        $query = $numero_de_devis;
        return $query;
    }

    public function getLastProduit($numero_de_devis) : int{

        $last = 0;

        $db = Database::connect();
        $row =  $db->table('ligne')
        ->select('produit')->orderBy('produit', 'DESC')
        ->where('numero_de_devis', $numero_de_devis)
        ->get()
        ->getRow();


        if (!empty($row->produit)) {
            $last = $row->produit;
        } 
        return $last;
    }

    public function getLastLigne() : int{

        $last = 0;

        $db = Database::connect();
        $row =  $db->table('ligne')
        ->orderBy('id_ligne', 'DESC')
        ->select('id_ligne')
        ->get()
        ->getRow();
        if (!empty($row->id_ligne)) {
            $last = $row->id_ligne;
        } 
        return $last;
    }

    public function listDevis(){
        $db = Database::connect();
        return $db->table('devis')
        ->join('client', 'client.CODE = devis.id_client')
        ->orderBy('devis.numero_de_devis', 'ASC')
            ->get()
            ->getResult();
    }

    public function getDevis($id){
        $db = Database::connect();
        return $db->table('devis')
            ->join('client', 'client.CODE = devis.id_client')
            ->where('numero_de_devis', $id)
            ->get()
            ->getRow();
    }

    public function getDevisLignes($id){
        $db = Database::connect();
        return $db->table('ligne')
        ->where('numero_de_devis', $id)
        ->where('supprimer', 0)
        ->orderBy('ligne.id_ligne', 'ASC')
        ->orderBy('ligne.ordre', 'ASC')
        ->orderBy('ligne.produit', 'ASC')
            ->get()
            ->getResult();
    }

    public function updateDevisClient($data){
        $db = Database::connect();
        $db->table('devis')

        ->set('id_client', $data['Client'])
        ->set('reference', (!empty($data['Reference']) ? $data['Reference'] : NULL))
        ->where('numero_de_devis ', $data['numero_de_devis'])
        ->update();
    }

    public function updateDevisMontants($numero_de_devis,$montant_HT,$montant_TVA,$montant_TTC){
        $db = Database::connect();
        $db->table('devis')
        ->set('montant_HT', number_format($montant_HT, 2, '.', ''))
        ->set('montant_TVA', number_format($montant_TVA, 2, '.', ''))
        ->set('montant_TTC', number_format($montant_TTC, 2, '.', ''))
        ->where('numero_de_devis ', $numero_de_devis)
        ->update();
    }



    public function ajouterLigne($numero_de_devis,$quantite,$id_ligne_type,$titre,$produit,$libelle,$montant_HT,$montant_TTC,$taux_TVA,$montant_TVA,$type_remise,$remise,$image){
        $db = Database::connect();

        if($taux_TVA == 'all'){
            $taux_TVA = 0;
        }

        $db->table('ligne')
            ->set('numero_de_devis', $numero_de_devis)
            ->set('quantite', $quantite)
            ->set('id_ligne_type', $id_ligne_type)
            ->set('titre', $titre)
            ->set('produit', $produit)
            ->set('libelle', $libelle)
            ->set('montant_HT', (!empty($montant_HT) ? $montant_HT : ''))
            ->set('montant_TTC', (!empty($montant_TTC) ? $montant_TTC : ''))
            ->set('taux_TVA', (!empty($taux_TVA) ? $taux_TVA : ''))
            ->set('montant_TVA', (!empty($montant_TVA) ? $montant_TVA : ''))
            ->set('type_remise', (!empty($type_remise) ? $type_remise : ''))
            ->set('remise', (!empty($remise) ? $remise : ''))
            ->set('image', (!empty($image) ? $image : ''))
            ->set('date_creation', date("Y-m-d"))
            ->insert();
        $query = $db->insertID();
        return $query;
    }

    public function modifierLigne($id_ligne,$titre,$libelle,$montant_HT,$montant_TTC,$taux_TVA,$montant_TVA,$type_remise,$remise,$image){
        $db = Database::connect();

        if($taux_TVA == 'all'){
            $taux_TVA = 0;
        }

        
        $db->table('ligne')
            //->set('id_ligne_type', $id_ligne_type)
            ->set('titre', $titre)
            ->set('libelle', $libelle)
            ->set('montant_HT', (!empty($montant_HT) ? $montant_HT : ''))
            ->set('montant_TTC', (!empty($montant_TTC) ? $montant_TTC : ''))
            ->set('taux_TVA', (!empty($taux_TVA) ? $taux_TVA : ''))
            ->set('montant_TVA', (!empty($montant_TVA) ? $montant_TVA : ''))
            ->set('type_remise', (!empty($type_remise) ? $type_remise : ''))
            ->set('remise', (!empty($remise) ? $remise : ''))
            ->set('image', (!empty($image) ? $image : ''))
            ->where('id_ligne',$id_ligne)
            ->set('date_modification', date("Y-m-d"))
            ->update();
        $query = $db->insertID();
        return $query;
    }

    public function ajouterImageLigne($id_ligne,$image){
        $db = Database::connect();
        $db->table('ligne')
            ->set('image', (!empty($image) ? $image : ''))
            ->where('id_ligne',$id_ligne)
            ->update();
        $query = $db->insertID();
        return $query;
    }

    public function updateLigneQuantite($id_ligne,$quantite){
        $db = Database::connect();
        $db->table('ligne')
            ->set('quantite', (!empty($quantite) ? $quantite : ''))
            ->where('id_ligne',$id_ligne)
            ->update();
        $query = $db->insertID();
        return $query;
    }

    public function delLigne($id){
        $db = Database::connect();
        return $db->table('ligne')
        ->where('id_ligne', $id)
        ->set('date_supression', date("Y-m-d"))
        ->set('supprimer', 1)
        ->update();
    }


    public function getProduits($numero_de_devis){
        $db = Database::connect();
        return $db->table('ligne')
        ->select('produit')
        ->distinct('produit')
        ->orderBy('produit', 'DESC')
        ->where('numero_de_devis', $numero_de_devis)
        ->get()
        ->getResult();
    }

    public function getLignesByProduit($produit,$id){
        $db = Database::connect();
        return $db->table('ligne')
        ->join('ligne_type', 'ligne_type.id = ligne.id_ligne_type')
        ->where('numero_de_devis', $id)
        ->where('produit', $produit)
        ->where('supprimer', 0)
        ->orderBy('produit', 'DESC')
        ->orderBy('ordre', 'ASC')
        ->orderBy('id_ligne', 'ASC')
        ->get()
        ->getResult();
    }

    public function getLigne($id){
        $db = Database::connect();
        return $db->table('ligne')
            ->where('id_ligne', $id)
            ->get()
            ->getRow();
    }




    

    //gestion TVA

    public function getTvas(){
        $db = Database::connect();
        return $db->table('tva')
        ->orderBy('id', 'ASC')
        ->get()
        ->getResult();
    }


      //gestion TVA

    public function getTvasValides($id){
        $db = Database::connect();
        return $db->table('ligne')
        ->select('taux_TVA')
        ->where('numero_de_devis',$id)
        ->where('supprimer',0)
        ->orderBy('taux_TVA', 'ASC')
        ->get()
        ->getResult();
    }


    //gestion ligne mesdechets
    public function createLigneMesDechets($id_ligne,$numero_de_devis,$produit){
        $db = Database::connect();
        $db->table('ligne')
            ->set('id_ligne', $id_ligne)
            ->set('numero_de_devis', $numero_de_devis)
            ->set('id_ligne_type', 4)
            ->set('produit', $produit)
            ->set('quantite', 1)
            ->insert();
        $query = $db->insertID();
        return $query;
    }

    //update contenu pour ligne mesdechets
    public function updateLigneContenu($id_ligne,$contenu){
        $db = Database::connect();
        $db->table('ligne')
            ->set('contenu', (!empty($contenu) ? $contenu : ''))
            ->where('id_ligne',$id_ligne)
            ->update();
        $query = $db->insertID();
        return $query;
    }

    //XML 

    // - Fonction pour sortie XML
    public function contenuXML($id,$matieres,$entreprises)
    {
        //open
        $strXml = "<PRODUIT>";
        $strXml .= "<ID>".$id."</ID>"; 
        // Les matieres
        $strXml .= "<MATIERES>";
        foreach ($matieres as $m)
        {
                $strXml .= $this->matiereXML($m);
        }
        $strXml .= "</MATIERES>";
        // Les entreprises
        $strXml .= "<ENTREPRISES>";
        foreach ($entreprises as $e)
        {
                $strXml .= $this->entrepriseXML($e);
        }
        $strXml .= "</ENTREPRISES>";
        //closing
        $strXml .= "</PRODUIT>";
        return $strXml;
    }

    

    public function matiereXML($data){

        $strXml = "<MATIERE>";
        $strXml .= '<ID valeur="' . $data['ID'] . '" />';
        $strXml .= '<NOM valeur="' . $data['NOM'] . '" />';
        $strXml .= '<QUANTITE valeur="' . $data['QUANTITE'] . '" />';
        $strXml .= '<UNITE valeur="' . $data['UNITE'] . '" />';
        $strXml .= '<PRIX_UNITAIRE valeur="' . $data['PRIX_UNITAIRE'] . '" />';
        $strXml .= '<PRIX_TOTAL valeur="' . $data['PRIX_TOTAL'] . '" />';
        $strXml .= "</MATIERE>";
        return $strXml;

    }

    public function entrepriseXML($data){

        $strXml = "<ENTREPRISE>";
        $strXml .= '<ID valeur="' . $data['ID'] . '" />';
        $strXml .= '<NOM valeur="' . $data['NOM'] . '" />';
        $strXml .= '<RUE1 valeur="' . $data['RUE1'] . '" />';
        $strXml .= '<RUE2 valeur="' . $data['RUE2'] . '" />';
        $strXml .= '<VILLE valeur="' . $data['VILLE'] . '" />';
        $strXml .= '<CODEPOSTAL valeur="' . $data['CODEPOSTAL']. '" />';
        $strXml .= '<TYPE valeur="' . $data['TYPE'] . '" />';
        $strXml .= "</ENTREPRISE>";
        return $strXml;

    }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////gestion ligne mes produits///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



    // - Fonction pour sortie XML
    public function contenuXMLProduit($id_produit,$prix_tarif_HT,$prix_achat_HT,$prix_vente_HT,$stock,$stock_mini,$caracteristiques)
    {
        //open
        $strXml = "<PRODUIT>";
        $strXml .= '<ID_PRODUIT valeur="' . $id_produit . '"/>';
        // Les matieres
        $strXml .= "<PRIX>";
        $strXml .= '<PRIX_TARIF_HT valeur="' . $prix_tarif_HT . '"/>';
        $strXml .= '<PRIX_ACHAT_HT valeur="' . $prix_achat_HT . '"/>';
        $strXml .= '<PRIX_VENTE_HT valeur="' . $prix_vente_HT . '"/>';
        $strXml .= "</PRIX>";
        // Les entreprises
        $strXml .= '<STOCK valeur="' . $stock . '"/>';
        $strXml .= '<STOCK_MINI valeur="' . $stock_mini . '"/>';
        $strXml .= "<CARACTERISTIQUES>";
        foreach ($caracteristiques as $c)
        {
                $strXml .= $this->caracteristiquesXML($c);
        }
        $strXml .= "</CARACTERISTIQUES>";
        //closing
        $strXml .= "</PRODUIT>";
        return $strXml;
    }

    public function caracteristiquesXML($carac){
        $strXml = "<CARACTERISTIQUE>";
        $strXml .= '<LIBELLE valeur="' . (string)$carac->LIBELLE['valeur'] . '" />';
        $strXml .= '<UNITE valeur="' . (string)$carac->UNITE['valeur'] . '" />';
        $strXml .= '<VALEUR valeur="' . (string)$carac->VALEUR['valeur'] . '" />';
        $strXml .= "</CARACTERISTIQUE>";
        return $strXml;
    }

    public function updateTvaMesproduits($id,$taux_TVA,$montant_TVA,$montant_TTC){
        $db = Database::connect();
        $db->table('ligne')
            ->set('taux_TVA', $taux_TVA)
            ->set('montant_TVA', $montant_TVA)
            ->set('montant_TTC', $montant_TTC)
            ->where('id_ligne',$id)
            ->update();
        $query = $db->insertID();
        return $query;
    }

    public function xmlConfig($id, $config)
    {
        //open
        $strXml = "<CONFIGURATION>";
        // Les matieres
        $strXml .= "<PARAMETRES>";
        foreach ($config as $c) {
            $strXml .= $this->xmlParam($c);
        }
        $strXml .= "</PARAMETRES>";
        //closing
        $strXml .= "</CONFIGURATION>";
        return $strXml;
    }

    public function xmlParam($param)
    {
        $strXml = "<PARAMETRE>";
        //gestion item radiogroup
        if ($param['type'] == 1) {
            $strXml .= '<LIBELLE valeur="' . $param['libelle'] . '" />';
            $strXml .= '<VALEUR valeur="' . $param['valeur'] . '" />';
        }
        //gestion item radio-coordonée
        elseif ($param['type'] == 2) {
            $strXml .= '<LIBELLE valeur="' . $param['libelle'] . '" />';
            $strXml .= '<X valeur="' . $param['x'] . '" />';
            $strXml .= '<Y valeur="' . $param['y'] . '" />';
        }
        //gestion item radio-coord-dimensions-couleur
        elseif ($param['type'] == 3) {
            $strXml .= '<LIBELLE valeur="' . $param['libelle'] . '" />';
            $strXml .= '<X valeur="' . $param['x'] . '" />';
            $strXml .= '<Y valeur="' . $param['y'] . '" />';
            $strXml .= '<WIDTH valeur="' . $param['width'] . '" />';
            $strXml .= '<HEIGHT valeur="' . $param['height'] . '" />';
            $strXml .= '<COULEUR valeur="' . $param['couleur'] . '" />';
        }
        //gestion item radio
        elseif ($param['type'] == 4) {
            $strXml .= '<LIBELLE valeur="' . $param['libelle'] . '" />';
            $strXml .= '<VALEUR valeur="' . $param['valeur'] . '" />';
        }
        //gestion item radio-texte
        elseif ($param['type'] == 5) {
            $strXml .= '<LIBELLE valeur="' . $param['libelle'] . '" />';
            $strXml .= '<VALEUR valeur="' . $param['text'] . '" />';
        }
        //gestion item coord
        elseif ($param['type'] == 6) {
            $strXml .= '<LIBELLE valeur="' . $param['libelle'] . '" />';
            $strXml .= '<HAUT valeur="' . $param['haut'] . '" />';
            $strXml .= '<BAS valeur="' . $param['bas'] . '" />';
        }
        //gestion item couleur
        elseif ($param['type'] == 7) {
            $strXml .= '<LIBELLE valeur="' . $param['libelle'] . '" />';
            $strXml .= '<COULEUR valeur="' . $param['couleur'] . '" />';
        }
        $strXml .= "</PARAMETRE>";
        return $strXml;
    }






    

}