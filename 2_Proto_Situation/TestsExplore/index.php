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
 
    $defaultDir = __DIR__ ; // Dossier par defaut
 
    if (empty($_GET['dir']))  {
        $list = ScanDirectory($defaultDir, "");
    } else {
        $dir = $_GET['dir'];
        $list = ScanDirectory($defaultDir, $dir);
    }    
?>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Cinématographie</title>
    <link rel="stylesheet" type="text/css" media="screen" href="css/default.css">
</head>
<body>
    <div class="container">
        <div class="content">
 
            <div class="subContent">
            <?php 
                foreach ($list as $value) {       
                    $SplFile = new SplFileInfo($value);   
                    if (empty($SplFile->getExtension())) { // pas d'extension == dossier
                    echo ("<a href='index.php?dir=$value'><img src='img/folder.png'/>$value</a>");
                    //var_dump($value);
 
                    }             
                }
            ?>
            </div>
            <div class="subContent">
 
            <?php
                foreach ($list as $value) {
                    $SplFile = new SplFileInfo($value);
                    if (!empty($SplFile->getExtension())) { // pas d'extension == dossier
                        echo("$value <br>"); 
                    }
                }
            ?>
            </div>
 
        </div>
    </div>
 
</body>
</html>