<?php

// Voir https://www.php.net/manual/fr/ref.image.php  pour les fonctions sur images

function testIMG() { 
//nom image
$fichier = "brasilia.jpg";

$image = __DIR__ . "/" . $fichier;


// infos de l'image

$info = getimagesize($image);


// attributs de l'image

$largeur = $info[0];
$hauteur = $info[1];

// création image vierge

$newimg = imagecreatetruecolor($largeur/2, $hauteur/2);

switch ($info["mime"]) {
    case "image/png";
        // ouvre le png
        $imgsource = imagecreatefrompng($image);
        $imgsource2 = imagecreatefrompng($image);
        break;
    case "image/jpeg";
        // ouvre le jpeg
        $imgsource = imagecreatefromjpeg($image);
        $imgsource2 = imagecreatefromjpeg($image);
        break;
    case "image/bmp";
        // ouvre le bmp
        $imgsource = imagecreatefrombmp($image);
        $imgsource2 = imagecreatefrombmp($image);
        break;
    case "image/webp";
        // ouvre le webp
        $imgsource = imagecreatefromwebp($image);
        $imgsource2 = imagecreatefromwebp($image);
        break;
    case "image/gif";
        // ouvre le gif
        $imgsource = imagecreatefromgif($image);
        $imgsource2 = imagecreatefromgif($image);
        break;
    default:
        die("Format d'image incorrect");
}


// on copie l'img source dans l'img de destination en la reduisant
imagecopyresampled(
    $newimg, //img destination
    $imgsource, //img source
    0, // position x coin supérieur gauche img dest
    0, // position y coin supérieur gauche img dest
    0, // position x coin supérieur gauche img source
    0, // position y coin supérieur gauche img source
    $largeur / 2, //largeur img dest
    $hauteur / 2, //hauteur img dest
    $largeur, //largeur img source
    $hauteur //hauteur img source
);

imageflip($imgsource2, IMG_FLIP_BOTH);

//on enregistre

@unlink(__DIR__ . "/resized-" . $fichier);
@unlink(__DIR__ . "/flipimg-" . $fichier);

switch ($info["mime"]) {
    case "image/png";
        // enregistre le png
        imagepng($newimg, __DIR__ . "/resized-" . $fichier);
        imagepng($imgsource2, __DIR__ . "/flipimg-" . $fichier);
        break;
    case "image/jpeg";
        // enregistre le jpeg
        imagejpeg($newimg, __DIR__ . "/resized-" . $fichier);
        imagejpeg($imgsource2, __DIR__ . "/flipimg-" . $fichier);
        break;
    case "image/bmp";
        // enregistre le bmp
        imagebmp($newimg, __DIR__ . "/resized-" . $fichier);
        imagebmp($imgsource2, __DIR__ . "/flipimg-" . $fichier);
        break;
    case "image/webp";
        // enregistre le webp
        imagewebp($newimg, __DIR__ . "/resized-" . $fichier);
        imagewebp($imgsource2, __DIR__ . "/flipimg-" . $fichier);
        break;
    case "image/gif";
        // enregistre le gif
        imagegif($newimg, __DIR__ . "/resized-" . $fichier);
        imagegif($imgsource2, __DIR__ . "/flipimg-" . $fichier);
        break;
}

// destruction des images en mémoire


imagedestroy($imgsource);
imagedestroy($imgsource2);
imagedestroy($newimg);

}