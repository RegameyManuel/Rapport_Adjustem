<?php 
 
 function ScanDirectory($pDir, $pData) {   
    // Parcours les fichiers et dossiers du dossier $pDir 
    // Retourne une liste (tableau $listDir) des fichiers(avec extension) et dossier présent
    // $pDir = Dossier par defaut
        if (!empty($pData)) {
            //Si pData n'est pas vide (= cliquer sur un dossier pour passer son nom en GET['dir])
            //Alors ont ajoute le nom du dossier a $pDir pour l'ouvrir 
            $pDir = $pDir.'/'.$pData;
 
        }
        if ($dir = opendir($pDir)) {
 
            $listDir = array();
            $i = 0;
            while($file = readdir($dir)) {
                // Parcours tous le dossier $dir     
                if($file != '.' && $file != '..') {
                    if (!empty($pData)) {
                       //Si $pData n'est pas vide (cf ligne8)
                       //Alors ont ajoute le nom du dossier au nom du fichier
                        $listDir[$i] = $pData.'/'.$file;
 
                    } else {                                       
                        $listDir[$i] = $file;
                    }
                    $i = $i + 1;
 
                }          
            }
        closedir($dir);  
        }
 
        return $listDir;
    }
 
    $defaultDir = __DIR__; // Dossier par defaut
 
    if (empty($_GET['dir']))  {
        $list = ScanDirectory($defaultDir, "");
    } else {
        $dir = $_GET['dir'];
        $list = ScanDirectory($defaultDir, $dir);
    }  