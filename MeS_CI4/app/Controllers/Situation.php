<?php

namespace App\Controllers;

class Situation extends BaseController
{
    public function index(): string

    {
        session_start(); 

        $img64Obj = "/assets/images/MiseEnSituation/ObjDefaut.jpg";
        $img64Vue = "/assets/images/MiseEnSituation/VueDefaut.jpg";
        $flip = "false";
        $mode = "proportionnel";

        // chargement du mode 
        if (isset($_POST["mode"])) {
            $_SESSION["mode"] = $_POST["mode"];
        }


        if (isset($_SESSION["mode"])) {
            $mode = $_SESSION["mode"];
        }


        // chargement du retournement horizontal de l'objet 
        if (isset($_POST["flip"])) {
            $_SESSION["flip"] = $_POST["flip"];
        }


        if (isset($_SESSION["flip"])) {
            $flip = $_SESSION["flip"];
        }


        // chargement de l'image de la Vue 
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


        // bloc de chargement de l'image de l'Objet
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
        
    
        $data = [
            'img64Obj' => $img64Obj,
            'img64Vue' => $img64Vue,
            'mode' => $mode,
            'flip' => $flip
        ];

        
        return view('pages/mise_en_situation', $data);
    }
}
