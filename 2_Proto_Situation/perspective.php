<?php

// exemple d'utilisation : $img=perspective($img,0.5,TOP,0xFFFFFF,127);

// TODO corriger le problème de transparence ( pour png et gif) (?)

define("TOP",0);
define("BOTTOM",1);
define("LEFT",2);
define("RIGHT",3);

function perspective($img,$gradient=0.85,$orientation=RIGHT,$background=0xFFFFFF, $alpha, $coef_qual=2) {
        //le $coef_qual pose des problèmes de taille avec la valeur 5
        $natx = 0;
        $naty = 0;
        if ($coef_qual > 4) {$coef_qual = 4;}
        if ($gradient > 1) {$gradient = 1;}
        if ($gradient < 0.5) {$gradient = 0.5;}
        $largeur=imagesx($img); //Retourne la largeur
        $hauteur=imagesy($img); //Retourne la hauteur
        $coul_fond=imagecolorallocatealpha($img,($background>>16)&0xFF,($background>>8)&0xFF,$background&0xFF,$alpha);

        
        $img_cont=imagecreatetruecolor($largeur*$coef_qual,$hauteur*$coef_qual);
        imagealphablending($img_cont,false);
        imagefilledrectangle($img_cont,0,0,$largeur*$coef_qual,$hauteur*$coef_qual,$coul_fond);
        imagesavealpha($img_cont,true);

        imagecopyresized($img_cont,$img,0,0,0,0,$largeur*$coef_qual,$hauteur*$coef_qual,$largeur,$hauteur);
        imagedestroy($img);
        $largeur*=$coef_qual;
        $hauteur*=$coef_qual;


        $image=imagecreatetruecolor($largeur,$hauteur);
        imagealphablending($image,false);
        imagefilledrectangle($image,0,0,$largeur,$hauteur,$coul_fond);
        imagealphablending($image,true);

        imageantialias($image,true);

        $rdmod=$orientation%2;
        $min=1;
        if($orientation<2){
            for($y=0;$y<$hauteur;$y++){
                $ny=$rdmod? $y : $hauteur-$y;
                $off=round((1-$gradient)*$largeur*($ny/$hauteur));
                $t=((1-pow(1-pow(($ny/$hauteur),2),0.5))*(1-$gradient)+($ny/$hauteur)*$gradient);
                $nt=$rdmod? $t : 1-$t;
                if(abs(0.5-$nt)<$min){
                    $min=abs(0.5-$nt);
                    $naty=$off;
                }
                imagecopyresampled($image,$img_cont,
                                    round($off/2),$y,
                                    0,abs($nt*$hauteur),
                                    $largeur-$off,1,
                                    $largeur,1);
            }
        } else {
            for($x=0;$x<$largeur;$x++){
                $nx=$rdmod? $x : $largeur-$x;
                $off=round((1-$gradient)*$hauteur*($nx/$largeur));
                $t=((1-pow(1-pow(($nx/$largeur),2),0.5))*(1-$gradient)+($nx/$largeur)*$gradient);
                $nt=$rdmod? $t : 1-$t;
                if(abs(0.5-$nt)<$min){
                    $min=abs(0.5-$nt);
                    $natx=$off;
                }
                imagecopyresampled($image,$img_cont,
                                    $x,round($off/2),
                                    abs($nt*$largeur),0,
                                    1,$hauteur-$off,
                                    1,$hauteur);
            }
        }
        imagedestroy($img_cont);

        imageantialias($image,false);
        imagealphablending($image,false);
        imagesavealpha($image,true);

        $img=imagecreatetruecolor(($largeur+$naty)/$coef_qual,($hauteur+$natx)/$coef_qual);
        imagealphablending($img,false);
        imagefilledrectangle($img,0,0,($largeur+$naty)/$coef_qual,($hauteur+$natx)/$coef_qual,$coul_fond);
        imagealphablending($img,true);
        imageantialias($img,true);
        imagecopyresampled($img,$image,0,0,0,0,($largeur+$naty)/$coef_qual,($hauteur+$natx)/$coef_qual,$largeur,$hauteur);
        imagedestroy($image);
        imagealphablending($img,false);
        imageantialias($img,false);
        imagesavealpha($img,true);
        return $img;
    }