<?php



namespace App\Models;

use CodeIgniter\Model;
use Config\Database;

/**********************  non fonctionnel  **************************/


class SituationImg extends Model
{
    /**
     * Fonction qui va récupérer le mode de dessin
     * @return string
     */
    public function getMode(): string
    {
        // chargement du mode 

        $mode = "proportionnel";

        if (isset($_POST["mode"])) {
            $_SESSION["mode"] = $_POST["mode"];
        }


        if (isset($_SESSION["mode"])) {
            $mode = $_SESSION["mode"];
        }
        return $mode;
    }


    /**
     * Fonction qui va récupérer le booléen pour l'option du flip de l'image
     * @return string
     */
    public function getFlip(): string
    {
        // chargement du retournement horizontal de l'objet 

        $flip = "false";

        if (isset($_POST["flip"])) {
            $_SESSION["flip"] = $_POST["flip"];
        }


        if (isset($_SESSION["flip"])) {
            $flip = $_SESSION["flip"];
        }
        return $flip;
    }


    /**
     * Fonction qui va récupérer l'image de la vue dans les variables de Session ou celle par défaut
     * @return string
     */
    public function getVue(): string
    {
        // chargement de l'image de la Vue 

        $img64Vue = "/assets/images/VueDefaut.jpg";

        if (isset($_FILES["fichierVue"])) {
            $_SESSION["fichierVue"] = $_FILES["fichierVue"];
        }


        if (isset($_SESSION["fichierVue"])) {
            $pathV = $_SESSION["fichierVue"]['name'];
            $typeV = pathinfo($pathV, PATHINFO_EXTENSION);
            $pathV = $_SESSION["fichierVue"]['tmp_name'];
            if (file_exists($pathV)) {
                $dataV = file_get_contents($pathV);
                $img64Vue = 'data:image/' . $typeV . ';base64,' . base64_encode($dataV);
                $_SESSION["VueCourante"] = $img64Vue;
            } else {
                if (isset($_SESSION["VueCourante"])) {
                    $img64Vue = $_SESSION["VueCourante"];
                }
            }
        }
        return $img64Vue;
    }


    /**
     * Fonction qui va récupérer l'image de l'objet' dans les variables de Session ou celle par défaut
     * @return string
     */
    public function getObj(): string
    {
        // bloc de chargement de l'image de l'Objet

        $img64Obj = "/assets/images/ObjDefaut.jpg";
        var_dump($img64Obj);
        var_dump($_SESSION);
        if (isset($_SESSION["ObjetDevis"])) {
            $_SESSION["fichierObj"] = $_SESSION["ObjetDevis"];
        } else {
            if (isset($_FILES["fichierObj"])) {
                $_SESSION["fichierObj"] = $_FILES["fichierObj"];
            }
        }


        if (isset($_SESSION["fichierObj"])) {
            $pathO = $_SESSION["fichierObj"]['name'];
            $typeO = pathinfo($pathO, PATHINFO_EXTENSION);
            $pathO = $_SESSION["fichierObj"]['tmp_name'];
            if (file_exists($pathO)) {
                $dataO = file_get_contents($pathO);
                $img64Obj = 'data:image/' . $typeO . ';base64,' . base64_encode($dataO);
                $_SESSION["ObjCourante"] = $img64Obj;
            } else {
                if (isset($_SESSION["ObjCourante"])) {
                    $img64Obj = $_SESSION["ObjCourante"];
                }
            }
        }

        return $img64Obj;
    }
}
