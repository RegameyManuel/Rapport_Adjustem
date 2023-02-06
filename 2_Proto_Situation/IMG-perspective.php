<?php
include("perspective.php");

$fichier = "brasilia.jpg";

$image = __DIR__ . "/" . $fichier;

$info = getimagesize($image);

switch ($info["mime"]) {
    case "image/png";
        // ouvre le png
        $imgsource = imagecreatefrompng($image);
        $imgsource=perspective($imgsource,0.8,LEFT,0xFFFFFF,0,2);
        imagepng($imgsource, __DIR__ . "/persp-" . $fichier);
        break;
    case "image/jpeg";
        // ouvre le jpeg
        $imgsource = imagecreatefromjpeg($image);
        $imgsource=perspective($imgsource,0.8,LEFT,0xFFFFFF,127,2);
        imagejpeg($imgsource, __DIR__ . "/persp-" . $fichier);
        break;
    case "image/bmp";
        // ouvre le bmp
        $imgsource = imagecreatefrombmp($image);
        $imgsource=perspective($imgsource,0.8,LEFT,0xFFFFFF,127,2);
        imagebmp($imgsource, __DIR__ . "/persp-" . $fichier);
        break;
    case "image/webp";
        // ouvre le webp
        $imgsource = imagecreatefromwebp($image);
        $imgsource=perspective($imgsource,0.8,LEFT,0xFFFFFF,127,2);
        imagewebp($imgsource, __DIR__ . "/persp-" . $fichier);
        break;
    case "image/gif";
        // ouvre le gif
        $imgsource = imagecreatefromgif($image);
        $imgsource=perspective($imgsource,0.8,LEFT,0xFFFFFF,127,2);
        imagegif($imgsource, __DIR__ . "/persp-" . $fichier);
        break;
    default:
        die("Format d'image incorrect");
}


// destruction des images en mémoire


imagedestroy($imgsource);