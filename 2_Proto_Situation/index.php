<?php


//include("eplorateur.php"); //Fonctions permettant l'ouverture des images dans des dossiers différents
//include("IMG-test.php"); //Fonctions permettant la manipulation des images
//include("perspective.php");
//include("IMG-perspective.php");


$path_vue = "images/IMG_Env/Maison1.jpg";
$path_obj = "images/IMG_Obj/brasilia.jpg";


/*

Ouverture serveur : php -S 127.0.0.1:8000
$nom_dossier = '.';
$dossier = opendir($nom_dossier);
while($fichier = readdir($dossier))
{
if($fichier != '.' && $fichier != '..')
{
echo $fichier.'<br />';
}
}
closedir($dossier);

*/

?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link href="./css/style.css" rel="stylesheet" />

    <title>Mise en Situation</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>

    <div class="container-fluid">
        <div class="container-fluid ml-1">
            <div class="row">

                <!-- zone gauche contenant la vue et son bouton de chargement -->
                <div class="col-md-8 ml-auto">
                    <div id="Situation_view" class="justify-content-sm-center">
                        <img id="img_view" src=<?php echo $path_vue ?> class="img-fluid m-2" draggable="false" alt="Situation View">
                    </div>
                    <div class="row justify-content-center m-2">
                        <button type="button" class="btn btn-primary m-2" onclick="chargeVue()">Charger une Vue</button> <!-- TODO chargeVue() -->
                    </div>

                    <!-- zone info curseur -->
                    <div style="cursor: e-resize;">
                        <fieldset id="position_cur" style="width:388px"></fieldset>
                        <fieldset id="position_start" style="width:388px"></fieldset>
                        <fieldset id="position_end" style="width:388px"></fieldset>
                        <fieldset id="console_dev" style="width:388px"></fieldset>
                        <fieldset id="position_calque" style="width:388px"></fieldset>
                    </div>
                </div>

                <!-- zone droite contenant l'objet et les options d'édition -->
                <div class="col-md-4">
                    <div class="card-body">
                        <div class="justify-content-center m-2">
                            <div id="img_obj" class="row-cols-3"><img src=<?php echo $path_obj ?> class="img-thumbnail" alt="Object View"></div>
                            <button type="button" class="btn btn-primary mt-4 mb-2" disabled onclick="chargeObjet()">Charger un objet</button> <!-- TODO chargeObjet() -->
                            <div class="dropdown-divider"></div>

                            <!-- zone de réglage ratio objet -->
                            <p>Ratio de l'Image</p>
                            <div class="btn-group btn-group-toggle mb-2"  data-toggle="buttons">
                                <label class="btn btn-primary inactive">
                                    <input type="radio" name="options" id="option1" disabled onclick="proportionnel()" checked> Proportionnel
                                    <!-- TODO proportionnel() -->
                                </label>
                                <label class="btn btn-primary">
                                    <input type="radio" name="options" id="option2" disabled onclick="personnalise()"> Personnalisé
                                    <!-- TODO personnalise() -->
                                </label>
                            </div>

                            <div class="dropdown-divider"></div>

                            <!-- zone de definition de la mention -->
                            <p>Mention de l'Image</p>
                            <div class="btn-group  mb-2">
                                <button type="button" class="btn btn-primary dropdown-toggle" disabled data-toggle="dropdown" aria-expanded="false">
                                    Mention
                                </button>
                                <div class="dropdown-menu">
                                    <!-- exemple TODO -->
                                    <a class="dropdown-item" href="#">Aucune</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Photo non contractuelle</a>
                                    <a class="dropdown-item" href="#">Autre</a>
                                </div>
                            </div>
                            <div class="dropdown-divider"></div>

                            <!-- zone d'enregistrement de la mise en situation obtenue' -->
                            <button type="button" class="btn btn-primary mt-2" onclick="exportVue()" disabled>Exporter</button> <!-- TODO exportVue() -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script src="./js/script.js"></script>
</body>

</html>