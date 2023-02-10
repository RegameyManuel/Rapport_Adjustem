/************************** Déclaration de variables courantes **************************/

var xMousePos,
  yMousePos,
  xStart,
  yStart,
  xEnd,
  yEnd,
  xInit,
  yInit = 0,
  dataURL,
  objRatio = 0,
  vueRatio = 0,
  isProportionel,
  isPersonnalise,
  isParPoint,
  isFlip,
  toRefresh,
  selection,
  cansaved,
  drawned,
  test = false,
  autosave = false, // option initialement prévue pour sauvegarder les options de l'application via submit à chaque changement de configuration
  // désactivé à la demande de Donatien pour alleger le processus

  tactile = isTouchDevice(),
  monQuad = new Array(), // monQuad est le conteneur pour les coordonées du quadrilataire dessiné par point
  mesObjets = new Array(); // mesObjets est le conteneur des objets dessinés sur le canvas (non implémenté pour le moment)

var btnFlip = document.getElementById("btnFlip");
var btnProp = document.getElementById("btnProp");
var btnPerso = document.getElementById("btnPerso");
var btnPoint = document.getElementById("btnPoint");

var btnDelObj = document.getElementById("btnDelObj");
var btnExport = document.getElementById("btnExport");

var inpVueGet = document.getElementById("inpVueGet");
var inpObjGet = document.getElementById("inpObjGet");

var btnupVue = document.getElementById("btnupVue");
var btnupObj = document.getElementById("btnupObj");

var canvas0 = document.getElementById("canvas0");

var ctx2 = document.getElementById("canvas1").getContext("2d");

var divMention = document.getElementById("divMention");

var rectangle = document.getElementById("rectangle");

var imgVue = new Image();
imgVue.src = document.getElementById("path_vue").value;

var imgObj = new Image();
imgObj.src = document.getElementById("path_objet").value;



var browserName = (function (agent) {       
  switch (true) {
  case agent.indexOf("edge") > -1: return "MS Edge";
  case agent.indexOf("edg/") > -1: return "Edge (chromium based)";
  case agent.indexOf("opr") > -1 && !!window.opr: return "Opera";
  case agent.indexOf("chrome") > -1 && !!window.chrome: return "Chrome";
  case agent.indexOf("trident") > -1: return "MS IE";
  case agent.indexOf("firefox") > -1: return "Mozilla Firefox";
  case agent.indexOf("safari") > -1: return "Safari";
  default: return "other";
}
})(window.navigator.userAgent.toLowerCase());




/**************************    EventListener    **************************/

document.addEventListener("DOMContentLoaded", startup);

/** Gestion de window **/

window.addEventListener("load", () => {
  objRatio = imgObj.naturalWidth / imgObj.naturalHeight; // definition du ratio de l'img Objet
  vueRatio = imgVue.naturalWidth / imgVue.naturalHeight; // definition du ratio de l'img Vue
  let sitHeight = window.innerHeight - 35; // definition de la hauteur allouable au Canvas0 

  canvas0.width = document.getElementById("Situation_view").offsetWidth;

  // Ici on défini la zone d'affichage du Canvas0 pour que l'image de la vue soit toujours affichée au bon ratio (sans déformation)
  if (
    (imgVue.naturalHeight / imgVue.naturalWidth) * canvas0.width >
    sitHeight
  ) {
    canvas0.height = sitHeight;
    canvas0.width = sitHeight * (imgVue.naturalWidth / imgVue.naturalHeight);
  } else {
    canvas0.height = canvas0.width / vueRatio;
  }


  isProportionel = true; // mode par defaut ce chargement surcharge l'affectation par le biais de PHP 
                         //(pour éviter un disfonctionnement lorsque que l'on ne recharge pas la page)
  isPersonnalise = false;
  isParPoint = false;
  isFlip = btnFlip.checked;


  // Ici on affiche la miniature de l'img Objet en mirroir ou sens original en fonction de l'état de la checkbox btnFlip
  // la checkbox elle-même est affecté par le chargement des données en PHP !!! Fonction désactivé et donc inaccessible pour le moment
  if (isFlip) {
    document.getElementById("img_obj").style.transform = "scaleX(-1)";
  } else {
    document.getElementById("img_obj").style.transform = "scaleX(1)";
  }

  initVue(); // Chargement Canva0 et mention
  activemention(false);
  btnExport.disabled = true; // impossible d'exporter la mise en situation tant qu'aucun objet n'a été posé dessus
});

window.onmouseup = function () {
  /*** fin de la sélection alors que le curseur est sorti de la zone Canva0 : on annule la sélection ***/
  if (!isParPoint) {
    delRectangle();
    selection = false;
  }
};

/** Gestion du changement des inputs de la vue, de l'objet, du mode et du flip **/

inpVueGet.addEventListener("change", (event) => {
  inpVueGet.form.submit();
});

inpObjGet.addEventListener("change", (event) => {
  inpObjGet.form.submit();
});

/** Gestion de la Mention "Photo non contractuelle" **/

/* gestion du texte de la mention */

document.getElementById("mention").addEventListener("change", (event) => {
  document.getElementById("divMention").innerHTML =
    document.getElementById("mention").value;
});

/* gestion de la position de la mention */

document.getElementById("menPosTL").addEventListener("click", function () {
  divMention.style.top = canvas0.offsetTop + "px";
  divMention.style.left = canvas0.offsetLeft + 10 + "px";
  document.getElementById("dropMentionPos").innerHTML = this.innerHTML;
});

document.getElementById("menPosTR").addEventListener("click", function () {
  divMention.style.top = canvas0.offsetTop + "px";
  divMention.style.left =
    canvas0.offsetWidth +
    canvas0.offsetLeft -
    divMention.offsetWidth -
    10 +
    "px";
  document.getElementById("dropMentionPos").innerHTML = this.innerHTML;
});

document.getElementById("menPosBR").addEventListener("click", function () {
  divMention.style.top = canvas0.offsetHeight + canvas0.offsetTop - 38 + "px";
  divMention.style.left =
    canvas0.offsetWidth +
    canvas0.offsetLeft -
    divMention.offsetWidth -
    10 +
    "px";
  document.getElementById("dropMentionPos").innerHTML = this.innerHTML;
});

document.getElementById("menPosBL").addEventListener("click", function () {
  divMention.style.top = canvas0.offsetHeight + canvas0.offsetTop - 38 + "px";
  divMention.style.left = canvas0.offsetLeft + 10 + "px";
  document.getElementById("dropMentionPos").innerHTML = this.innerHTML;
});

/* gestion de la couleur de la mention */

/******************************************************************************************/
/*   a revoir avec les balises selects

document.getElementById("mentionCol").addEventListener("click", function () {
  var selectElmt = document.getElementById("mentionCol");
  var valeurselectionnee = selectElmt.options[selectElmt.selectedIndex].value;

  var textselectionne = selectElmt.options[selectElmt.selectedIndex].text;

  if (valeurselectionnee === "None") {
    if (cansaved) {
      restoreVue();
      cansaved = false;
    }
    divMention.hidden = true;
  } else {
    if (!cansaved) {
      sauveVue();
      cansaved = true;
    }
    document.getElementById("dropMention").innerHTML = textselectionne;
    divMention.hidden = false;
    divMention.style.color = valeurselectionnee;
  }

});
*/

function activemention(mavalue) {
  document.getElementById("mention").disabled = !mavalue;
  document.getElementById("dropMentionPos").disabled = !mavalue;
}

document.getElementById("dropNone").addEventListener("click", function () {
  document.getElementById("dropMention").innerHTML = this.innerHTML;
  if (cansaved) {
    cansaved = false;
  }
  divMention.hidden = true;

  activemention(false);
});

document.getElementById("dropWhite").addEventListener("click", function () {
  if (!cansaved) {
    cansaved = true;
  }
  activemention(true);
  document.getElementById("dropMention").innerHTML = this.innerHTML;
  divMention.hidden = false;
  divMention.style.color = this.value;
  
});

document.getElementById("dropBlack").addEventListener("click", function () {
  if (!cansaved) {
    cansaved = true;
  }
  activemention(true);
  document.getElementById("dropMention").innerHTML = this.innerHTML;
  divMention.hidden = false;
  divMention.style.color = this.value;
});

document.getElementById("dropRed").addEventListener("click", function () {
  if (!cansaved) {
    cansaved = true;
  }
  activemention(true);
  document.getElementById("dropMention").innerHTML = this.innerHTML;
  divMention.hidden = false;
  divMention.style.color = this.value;
});

document.getElementById("dropYellow").addEventListener("click", function () {
  if (!cansaved) {
    cansaved = true;
  }
  activemention(true);
  document.getElementById("dropMention").innerHTML = this.innerHTML;
  divMention.hidden = false;
  divMention.style.color = this.value;
});

document.getElementById("dropLime").addEventListener("click", function () {
  if (!cansaved) {
    cansaved = true;
  }
  activemention(true);
  document.getElementById("dropMention").innerHTML = this.innerHTML;
  divMention.hidden = false;
  divMention.style.color = this.value;
});

document.getElementById("dropAqua").addEventListener("click", function () {
  if (!cansaved) {
    cansaved = true;
  }
  activemention(true);
  document.getElementById("dropMention").innerHTML = this.innerHTML;
  divMention.hidden = false;
  divMention.style.color = this.value;
});

document.getElementById("dropBlue").addEventListener("click", function () {
  if (!cansaved) {
    cansaved = true;
  }
  activemention(true);
  document.getElementById("dropMention").innerHTML = this.innerHTML;
  divMention.hidden = false;
  divMention.style.color = this.value;
});

document.getElementById("dropMagenta").addEventListener("click", function () {
  if (!cansaved) {
    cansaved = true;
  }
  activemention(true);
  document.getElementById("dropMention").innerHTML = this.innerHTML;
  divMention.hidden = false;
  divMention.style.color = this.value;
});
/******************************************************************************************/

btnFlip.addEventListener("click", function () {
  setImgObjFlip();

  if (autosave) {
    inpObjGet.form.submit();
  }
});

/*************************************************************************/

/** Gestion event des bouttons **/

/*********************************************************/

/** bouttons pour le mode proportionnel ou personnalisé **/

btnProp.addEventListener("click", function () {
  isProportionel = true;
  isPersonnalise = false;
  isParPoint = false;
  setImgObjFlip(false);
  document.getElementById("check-flip").hidden = true;
  if (autosave) {
    inpObjGet.form.submit();
  }
});

btnPerso.addEventListener("click", function () {
  isProportionel = false;
  isPersonnalise = true;
  isParPoint = false;
  setImgObjFlip(false);
  document.getElementById("check-flip").hidden = true;
  if (autosave) {
    inpObjGet.form.submit();
  }
});

btnPoint.addEventListener("click", function () {
  isProportionel = false;
  isPersonnalise = false;
  isParPoint = true;
  setImgObjFlip();
  document.getElementById("check-flip").hidden = true;
  if (autosave) {
    inpObjGet.form.submit();
  }
});

/* Boutons Choisir Vue et Obj permettant de piloter les inputFile  */

btnupVue.addEventListener("click", function () {
  inpVueGet.click();
});

btnupObj.addEventListener("click", function () {
  inpObjGet.click();
});

/* Bouton d'export de la vue  */

btnExport.addEventListener("click", function () {
  setcanvas1();
  if (!divMention.hidden) {
    chargeMention(divMention.style.color);
  }
  let maintenant = new Date();

  let canvaFinal = canvas1
    .toDataURL("image/jpeg", 1)
    .replace("imageVue/jpeg", "image/octet-stream");

  var link = document.createElement("a");
  link.setAttribute("id", "windowVue");
  link.setAttribute("href", canvaFinal);
  link.setAttribute(
    "download",
    "Mise En Situation" +
      maintenant.toLocaleDateString("fr") +
      "-" +
      maintenant.getHours() +
      "h" +
      maintenant.getMinutes() +
      "m"
  );
  link.click();

});

/* Bouton de suppression de l'objet */

btnDelObj.addEventListener("click", function () {
  initVue();
  btnExport.disabled = true;
});

/**************************    Event canvas0    **************************/

/**************************    Event Tactile    **************************/



function startup() {
  canvas0.addEventListener("touchstart", handleStart);
  canvas0.addEventListener("touchend", handleEnd);
  canvas0.addEventListener("touchcancel", handleCancel);
  canvas0.addEventListener("touchmove", handleMove);
}





function handleStart(evt) {
  document.getElementById("warnlab").style.visibility = "hidden";

  xStart = evt.touches[0].clientX;
  yStart = evt.touches[0].clientY;
  xInit = xStart - getOffset(canvas0).left;
  yInit = yStart - getOffset(canvas0).top;

  if (!isParPoint) {
    /*** début de la sélection ***/

    selection = true;
    if (window.scrollY === 0) {
      initRectangle(xStart, yStart);
    }

  } else {
    evt.preventDefault(); // pour éviter la génération de points multiples
    setcanvas1();
    chargeRefresh();
    document.getElementById("canvas1").style.visibility = "visible";

    if (monQuad.length < 8) {
      btnExport.disabled = true;

      monQuad.push(xInit);
      monQuad.push(yInit);
      setPoint(xStart, yStart);
      if (monQuad.length >= 8) {
        document.getElementById("canvas1").style.visibility = "hidden";

        if (setQuadPerspective()) {
          drawImageInPerspective(
            imgObj, //srcImg,
            canvas0, //targetCanvas,

            monQuad[0], //topLeftX,
            monQuad[1], //topLeftY,
            monQuad[6], //bottomLeftX,
            monQuad[7], //bottomLeftY,
            monQuad[2], //topRightX,
            monQuad[3], //topRightY,
            monQuad[4], //bottomRightX,
            monQuad[5], //bottomRightY,
            btnFlip.checked,
            false
          );

          drawned = true;
          btnExport.disabled = false;
        } else {
          document.getElementById("warnlab").style.color = "red";
          document.getElementById("warnlab").innerText =
            "Attention vos points ne forment pas un quadrilatère valide";
          document.getElementById("warnlab").style.visibility = "visible";
        }
        unsetPoint();
        monQuad = [];
      }
    }
  }
}


function handleEnd(evt) {
  /*** fin de la sélection ***/
  //
  if (!isParPoint) {
    delRectangle();
    selection = false;

    if (drawned) {
      chargeVide(imgVue.src);
      drawned = false;
    }

    if (window.scrollY === 0) {
      xEnd = evt.changedTouches[0].clientX - getOffset(canvas0).left;
      yEnd = evt.changedTouches[0].clientY - getOffset(canvas0).top;

      charge(
        canvas0.getContext("2d").src,
        imgObj.src,
        xInit,
        yInit,
        xEnd,
        yEnd
      );
    }
  }
}

function handleCancel(evt) {}

function handleMove(evt) {
  evt.preventDefault(); // pour désactiver le défilement lors du touch du canvas0
  if (!isParPoint) {
    xMousePos = evt.changedTouches[0].clientX - getOffset(canvas0).left;
    yMousePos = evt.changedTouches[0].clientY - getOffset(canvas0).top;
    /*** sélection en cours ***/
    if (window.scrollY === 0) {
      if (selection === true) {
        setRectangle(
          xStart,
          yStart,
          evt.touches[0].clientX,
          evt.touches[0].clientY,
          objRatio
        );
      }
    }
  }
}


/**************************    Event mouse down dans la vue    **************************/

canvas0.onmousedown = function (e) {
  document.getElementById("warnlab").style.visibility = "hidden";
  if (!isParPoint) {
    xInit = e.clientX;
    yInit = e.clientY;
    xStart = xMousePos;
    yStart = yMousePos;

    /*** début de la sélection ***/

    selection = true;
    if (window.scrollY === 0) {
      initRectangle(xInit, yInit);
    }

  } else {
    setcanvas1();
    chargeRefresh();
    document.getElementById("canvas1").style.visibility = "visible";

    if (monQuad.length < 8) {
      btnExport.disabled = true;
      monQuad.push(e.clientX - getOffset(canvas0).left);
      monQuad.push(e.clientY - getOffset(canvas0).top);
      setPoint(e.clientX, e.clientY);
      if (monQuad.length >= 8) {
        document.getElementById("canvas1").style.visibility = "hidden";

        if (setQuadPerspective()) {
          drawImageInPerspective(
            imgObj, //srcImg,
            canvas0, //targetCanvas,

            monQuad[0], //topLeftX,
            monQuad[1], //topLeftY,
            monQuad[6], //bottomLeftX,
            monQuad[7], //bottomLeftY,
            monQuad[2], //topRightX,
            monQuad[3], //topRightY,
            monQuad[4], //bottomRightX,
            monQuad[5], //bottomRightY,
            btnFlip.checked,
            false
          );
          drawned = true;
          btnExport.disabled = false;
        } else {
          document.getElementById("warnlab").style.color = "red";
          document.getElementById("warnlab").innerHTML =
            "Attention vos points ne forment pas un quadrilatère valide";
          document.getElementById("warnlab").style.visibility = "visible";
        }
        unsetPoint();
        monQuad = [];
      }
    }
  }
};

/**************************    Event mouse up dans la vue    **************************/

canvas0.onmouseup = function () {
  /*** fin de la sélection ***/
  if (!isParPoint) {
    delRectangle();
    selection = false;

    if (drawned) {
      chargeVide(imgVue.src);
      drawned = false;
    }

    if (window.scrollY === 0) {
      xEnd = xMousePos;
      yEnd = yMousePos;

      charge(
        canvas0.getContext("2d").src,
        imgObj.src,
        xStart,
        yStart,
        xEnd,
        yEnd
      );
    }
  }
};

/**************************    Event déplacement du curseur dans la vue    **************************/

canvas0.onmousemove = function (e) {
  if (!isParPoint) {
    xMousePos = e.clientX - getOffset(canvas0).left;
    yMousePos = e.clientY - getOffset(canvas0).top;

    /*** sélection en cours ***/
    if (window.scrollY === 0) {
      if (selection === true) {
        setRectangle(xInit, yInit, e.clientX, e.clientY, objRatio);
      }
    }
  }
};

/**************************    Event rectangle    **************************/

rectangle.onmousemove = function (e) {
  if (!isParPoint) {
    if (selection === true) {
      setRectangle(xInit, yInit, e.clientX, e.clientY, objRatio);
    }
  }
};

rectangle.onmouseup = function (e) {
  if (!isParPoint) {
    canvas0.onmouseup();
  }
};



/********************************************* FONCTIONS DESSIN *******************************************************/


/**************************    Fonctions des points  **************************/

function setPoint(x, y) {
  // mise en place d'un point pour le mode par point
  if (monQuad.length > 0) {
    var point = document.getElementById("pointA");
    if (monQuad.length > 2) {
      point = document.getElementById("pointB");
      if (monQuad.length > 4) {
        point = document.getElementById("pointC");
      }
    }
    point.style.visibility = "visible";
    point.style.left = x + "px";
    point.style.top = y + "px";
  }
}

function unsetPoint() {
  document.getElementById("pointA").style.visibility = "hidden";
  document.getElementById("pointB").style.visibility = "hidden";
  document.getElementById("pointC").style.visibility = "hidden";
}
/**************************    Fonctions du rectangle de sélection    **************************/

function initRectangle(x, y) {
  // initialisation du rectangle de sélection au démarrage
  document.body.style.cursor = "crosshair";

  rectangle.style.visibility = "visible";
  rectangle.style.width = 0 + "px";
  rectangle.style.height = 0 + "px";
  rectangle.style.left = x + "px";
  rectangle.style.top = y + "px";
}



/****************************************************/

/*
La fonction setRectangle utilise les valeurs xStart et yStart pour définir le point de départ de la sélection et utilise les valeurs xCourant et yCourant pour définir la position actuelle du curseur. Le ratio est utilisé pour maintenir la proportion des dimensions en cas d'utilisation de la fonctionnalité de proportionnalité.

La fonction utilise des conditions if pour vérifier si le curseur est actuellement 
en haut à gauche, 
en bas à gauche, 
en haut à droite, 
ou en bas à droite par rapport au point de départ de la sélection. 

Selon la position du curseur, la hauteur et la largeur du rectangle sont redimensionnées en conséquence, ainsi que sa position (top et left). Il utilise également la variable isProportionel pour vérifier si la proportionnalité est activée ou pas. Si la proportionnalité est activée, les dimensions du rectangle sont ajustées en fonction du ratio.

Il est important de noter que cette fonction est destinée à être utilisée avec un élément HTML <div> défini avec l'ID rectangle et qui est utilisé pour afficher le rectangle de sélection. 

Il y a aussi des commentaires facultatifs qui affiche la position du rectangle de sélection.
*/

function setRectangle(xStart, yStart, xCourant, yCourant, ratio) {
  // Fonction permettant de redimensionner le rectangle en fonction du déplacement de curseur
  if (yStart > yCourant && xStart > xCourant) {
    //dessin en haut et à gauche du point de départ
    rectangle.style.height = yStart - yCourant + "px";
    rectangle.style.top = yCourant + "px";

    if (isProportionel === true) {
      rectangle.style.width = (yStart - yCourant) * ratio + "px";
      rectangle.style.left = xStart - (yStart - yCourant) * ratio + "px";
    } else {
      rectangle.style.width = xStart - xCourant + "px";
      rectangle.style.left = xCourant + "px";
    }
  }

  if (yStart < yCourant && xStart > xCourant) {
    //dessin en bas et à gauche du point de départ
    rectangle.style.height = yCourant - yStart + "px";
    rectangle.style.top = yStart + "px";

    if (isProportionel === true) {
      rectangle.style.width = (yCourant - yStart) * ratio + "px";
      rectangle.style.left = xStart - (yCourant - yStart) * ratio + "px";
    } else {
      rectangle.style.width = xStart - xCourant + "px";
      rectangle.style.left = xCourant + "px";
    }
  }

  if (yStart > yCourant && xStart < xCourant) {
    //dessin en haut et à droite du point de départ
    rectangle.style.height = yStart - yCourant + "px";
    rectangle.style.top = yCourant + "px";

    if (isProportionel === true) {
      rectangle.style.width = (yStart - yCourant) * ratio + "px";
      rectangle.style.left = xStart + "px";
    } else {
      rectangle.style.width = xCourant - xStart + "px";
      rectangle.style.left = xStart + "px";
    }
  }

  if (yStart < yCourant && xStart < xCourant) {
    //dessin en bas et à droite du point de départ
    rectangle.style.height = yCourant - yStart + "px";
    rectangle.style.top = yStart + "px";

    if (isProportionel === true) {
      rectangle.style.width = (yCourant - yStart) * ratio + "px";
      rectangle.style.left = xStart + "px";
    } else {
      rectangle.style.width = xCourant - xStart + "px";
      rectangle.style.left = xStart + "px";
    }
  }
}

function delRectangle(e) {
  // masquage du rectangle
  if (selection === true) {
    rectangle.style.height = 0 + "px";
    rectangle.style.width = 0 + "px";
    rectangle.style.visibility = "hidden";
    document.body.style.cursor = "auto";
  }
}

/***************************TODO imgFlip pour le dessin avec retournement sur axe vertical de l'Objet indépendement du mode   **************/

/**************************    Fonction de retournement d'image   **************************/

function imgFlip(srcImg, flipH = true, flipV = false) {
  var tmpCanvas = document.createElement("canvas");
  tmpCanvas.width = srcImg.width;
  tmpCanvas.height = srcImg.height;
  var tmpContext = tmpCanvas.getContext("2d");

  let img = new Image();
  img.src = srcImg.src;
  img.onload = function () {
    tmpContext.translate(
      flipH ? tmpCanvas.width : 0,
      flipV ? tmpCanvas.height : 0
    );

    tmpContext.scale(
      (flipH ? -1 : 1) * tmpCanvas.width,
      (flipV ? -1 : 1) * tmpCanvas.height
    );
    tmpContext.drawImage(srcImg, 0, 0);
  };
  //img = tmpContext.toDataURL();
  return img;
}

/************************************************************************/

/**************************    Fonction de réorganisation des points du quadrilatère    **************************/

/*
La fonction "setQuadPerspective" vérifie si un quadrilatère est convexe en utilisant une méthode par force brute : en calculant les produits croisés des vecteurs formés par ses côtés pour chaque combinaison de quatre points d'un tableau "monQuad". Elle vérifie également que les quatre points du quadrilatère sont distincts et 
que le point en haut à gauche a une valeur y plus élevée que le point en bas à gauche, 
que le point en haut à droite a une valeur y plus élevée que le point en bas à droite, 
que le point en haut à gauche a une valeur x plus basse que le point en haut à droite et 
que le point en bas à gauche a une valeur x plus basse que le point en bas à droite.
Elle crée plusieurs boucles et vérifie un grand nombre de combinaisons.

A optimiser
*/

function setQuadPerspective() {
  let i, j, k, l;

  let topLeftX = -1,
    topLeftY = -1,
    bottomLeftX = -1,
    bottomLeftY = -1,
    topRightX = -1,
    topRightY = -1,
    bottomRightX = -1,
    bottomRightY = -1;

  compoint = 0;

  /******************************** on vérifie que chaque point est bien distinct ****************************/
  /*
  pour vérifier que les diagonales d'un quadrilatère se coupent en son sein ( === quadrilatère convexe)

  [(xC-xA)(yB-yA)-(yC-yA)(xB-xA)]*[(xD-xA)(yB-yA)-(yD-yA)(xB-xA)]
  [(xA-xC)(yD-yC)-(yA-yC)(xD-xC)]*[(xB-xC)(yD-yC)-(yB-yC)(xD-xC)]

  Au minimum 
  -le point TL doit être plus haut que le point BL
  -le point TR doit être plus haut que le point BR
  -le point TL doit être à gauche du point TR
  -le point BL doit être  à gauche du point BR

  */

  for (i = 0; i < 7; i = i + 2) {
    for (j = 0; j < 7; j = j + 2) {
      if (j != i) {
        for (k = 0; k < 7; k = k + 2) {
          if (k != j && k != i) {
            for (l = 0; l < 7; l = l + 2) {
              if (l != i && l != j) {
                if (l != k) {
                  var cond1 =
                    ((monQuad[j] - monQuad[i]) *
                      (monQuad[k + 1] - monQuad[i + 1]) -
                      (monQuad[j + 1] - monQuad[i + 1]) *
                      (monQuad[k] - monQuad[i])) *
                    ((monQuad[l] - monQuad[i]) *
                      (monQuad[k + 1] - monQuad[i + 1]) -
                      (monQuad[l + 1] - monQuad[i + 1]) *
                      (monQuad[k] - monQuad[i]));
                  var cond2 =
                    ((monQuad[i] - monQuad[j]) *
                      (monQuad[l + 1] - monQuad[j + 1]) -
                      (monQuad[i + 1] - monQuad[j + 1]) *
                      (monQuad[l] - monQuad[j])) *
                    ((monQuad[k] - monQuad[j]) *
                      (monQuad[l + 1] - monQuad[j + 1]) -
                      (monQuad[k + 1] - monQuad[j + 1]) *
                      (monQuad[l] - monQuad[j]));

                  if (cond1 < 0 && cond2 < 0) {
                    if (
                      monQuad[i + 1] < monQuad[l + 1] && //le point TL doit être plus haut que le point BL
                      monQuad[j + 1] < monQuad[k + 1] //le point TR doit être plus haut que le point BR
                    ) {
                      if (
                        monQuad[i] < monQuad[j] && //le point TL doit être à gauche du point TR
                        monQuad[l] < monQuad[k] //le point BL doit être  à gauche du point BR
                      ) {
                        if (
                          monQuad[i + 1] < monQuad[k + 1] && //le point TL doit être à gauche du point TR
                          monQuad[j + 1] < monQuad[l + 1] //le point BL doit être  à gauche du point BR
                        ) {
                          /**************************** Assignation des valeurs triées*/
                          bottomRightX = monQuad[k];
                          bottomRightY = monQuad[k + 1];

                          topRightX = monQuad[j];
                          topRightY = monQuad[j + 1];

                          bottomLeftX = monQuad[l];
                          bottomLeftY = monQuad[l + 1];

                          topLeftX = monQuad[i];
                          topLeftY = monQuad[i + 1];

                          /******************* */
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  monQuad = [];
  monQuad.push(topLeftX);
  monQuad.push(topLeftY);
  monQuad.push(topRightX);
  monQuad.push(topRightY);
  monQuad.push(bottomRightX);
  monQuad.push(bottomRightY);
  monQuad.push(bottomLeftX);
  monQuad.push(bottomLeftY);

  for (var xy in monQuad) {
    if (monQuad[xy] === -1) {
      return false;
    }
  }
  return true;
}

/**************************    Fonction du dessin en perspective    **************************/

function crossProduct(v0, v1) {
  return v0.y * v1.x - v0.x * v1.y;
}



/* Cette fonction permet de déterminer si un point M est dans le secteur défini par les points O (centre) et A, B (extrémités du secteur). Pour cela, elle utilise le produit vectoriel (appelé "crossProduct" dans le code) entre les vecteurs OA, OB, OM et AM, BM. Si le produit vectoriel entre OA et OB est positif, elle vérifie si les produits vectoriels entre OA et OM, et entre OB et OM sont respectivement positif et négatif. Si c'est le cas, elle renvoie true, sinon false. Si le produit vectoriel entre OA et OB est négatif, elle vérifie si les produits vectoriels entre OA et OM, et entre OB et OM sont respectivement négatif et positif. Si c'est le cas, elle renvoie true, sinon false. */
function inSector(M, O, A, B) {
  var cpAB, cpAM, cpBM;
  cpAB = crossProduct(
    { x: A.x - O.x, y: A.y - O.y },
    { x: B.x - O.x, y: B.y - O.y }
  );
  cpAM = crossProduct(
    { x: A.x - O.x, y: A.y - O.y },
    { x: M.x - O.x, y: M.y - O.y }
  );
  cpBM = crossProduct(
    { x: B.x - O.x, y: B.y - O.y },
    { x: M.x - O.x, y: M.y - O.y }
  );
  if (cpAB > 0) {
    if (cpAM > 0 && cpBM < 0) return true;
    else return false;
  } else {
    if (!(cpAM < 0 && cpBM > 0)) return true;
    else return false;
  }
}



/*Cette fonction permet de déterminer si un point (dont les coordonnées sont données par les arguments unPointX et unPointY) appartient à un quadrilatère défini par les coordonnées des quatres sommets : topLeftX, topLeftY, bottomLeftX, bottomLeftY, topRightX, topRightY, bottomRightX, bottomRightY.

Pour cela, elle utilise la fonction "inSector" en lui donnant les coordonnées des quatres sommets du quadrilatère ainsi que les coordonnées du point à tester. Elle vérifie si ce point est dans les secteurs définis par les sommets D-A-B, A-B-C, B-C-D et C-D-A. Si c'est le case pour tous les quatres secteurs, elle renvoie true, sinon false. 
*/
function pointDansQuad(
  topLeftX,
  topLeftY,
  bottomLeftX,
  bottomLeftY,
  topRightX,
  topRightY,
  bottomRightX,
  bottomRightY,
  unPointX,
  unPointY
) {
  var appartient = false;
  var A = { x: topLeftX, y: topLeftY };
  var B = { x: topRightX, y: topRightY };
  var C = { x: bottomRightX, y: bottomRightY };
  var D = { x: bottomLeftX, y: bottomLeftY };
  var M = { x: unPointX, y: unPointY };

  if (inSector(M, D, A, B) && inSector(M, A, B, C)) {
    if (inSector(M, B, C, D) && inSector(M, C, D, A)) {
      appartient = true;
    }
  }

  return appartient;
}


/* Cette fonction permet de dessiner une image (donnée par l'argument srcImg) sur un canvas (donné par l'argument targetCanvas) en utilisant une transformation de perspective pour adapter l'image aux coordonnées des quatres coins (topLeftX, topLeftY, bottomLeftX, bottomLeftY, topRightX, topRightY, bottomRightX, bottomRightY) du quadrilatère souhaité sur le canvas.

Elle commence par définir la taille de l'image d'origine en utilisant les propriétés naturalWidth et naturalHeight de l'image. Ensuite, elle calcule les marges et les tailles du quadrilatère cible en utilisant les coordonnées des quatres coins.

Ensuite, elle crée un nouveau canvas temporaire, et utilise un contexte 2D pour y dessiner l'image d'origine en utilisant les transformations de translation, de miroir (si flipHorizontally ou flipVertically est vrai) et de mise à l'échelle pour adapter l'image aux dimensions du quadrilatère cible.

Enfin, elle utilise la méthode getImageData pour obtenir un tableau unidimensionnel contenant les données des pixels de l'image temporaire, et parcoure ce tableau pour mettre à jour les pixels correspondants sur le canvas cible. */

function drawImageInPerspective(
  srcImg,
  targetCanvas,
  //Définir où sur le canva l'image doit être dessinée :
  //coordonnées des 4 coins du quadrilatère sur lesquels l'image rectangulaire d'origine sera transformée :

  topLeftX,
  topLeftY,
  bottomLeftX,
  bottomLeftY,
  topRightX,
  topRightY,
  bottomRightX,
  bottomRightY,

  //Facultativement retourner l'image d'origine horizontalement ou verticalement *avant* de transformer l'image rectangulaire d'origine en quadrilatère convexe :
  flipHorizontally,
  flipVertically
) {
  var srcWidth = srcImg.naturalWidth;
  var srcHeight = srcImg.naturalHeight;

  var targetMarginX = Math.min(topLeftX, bottomLeftX, topRightX, bottomRightX);
  var targetMarginY = Math.min(topLeftY, bottomLeftY, topRightY, bottomRightY);

  var targetTopWidth = topRightX - topLeftX;
  var targetTopOffset = topLeftX - targetMarginX;
  var targetBottomWidth = bottomRightX - bottomLeftX;
  var targetBottomOffset = bottomLeftX - targetMarginX;

  var targetLeftHeight = bottomLeftY - topLeftY;
  var targetLeftOffset = topLeftY - targetMarginY;
  var targetRightHeight = bottomRightY - topRightY;
  var targetRightOffset = topRightY - targetMarginY;

  var tmpWidth = Math.max(
    targetTopWidth + targetTopOffset,
    targetBottomWidth + targetBottomOffset
  );

  var tmpHeight = Math.max(
    targetLeftHeight + targetLeftOffset,
    targetRightHeight + targetRightOffset
  );

  var tmpCanvas = document.createElement("canvas");
  tmpCanvas.width = tmpWidth;
  tmpCanvas.height = tmpHeight;
  var tmpContext = tmpCanvas.getContext("2d");

  tmpContext.translate(
    flipHorizontally ? tmpWidth : 0,
    flipVertically ? tmpHeight : 0
  );

  tmpContext.scale(
    (flipHorizontally ? -1 : 1) * (tmpWidth / srcWidth),
    (flipVertically ? -1 : 1) * (tmpHeight / srcHeight)
  );
  tmpContext.drawImage(srcImg, 0, 0);

  var tmpMap = tmpContext.getImageData(0, 0, tmpWidth, tmpHeight);
  var tmpImgData = tmpMap.data;

  var targetContext = targetCanvas.getContext("2d");
  var targetMap = targetContext.getImageData(
    targetMarginX,
    targetMarginY,
    tmpWidth,
    tmpHeight
  );
  var targetImgData = targetMap.data;
  var targetX, targetY, tmpPoint, targetPoint, tmpY, tmpX;

  // Passer le rectangle contenant notre image en perspective en négatif
  /*
  for (var i = 0; i < targetImgData.length; i += 4) {
    targetImgData[i] = 255 - targetImgData[i];
    targetImgData[i + 1] = 255 - targetImgData[i + 1];
    targetImgData[i + 2] = 255 - targetImgData[i + 2];
  }
*/

  for (var tmpY = 0; tmpY < tmpHeight; tmpY++) {
    for (var tmpX = 0; tmpX < tmpWidth; tmpX++) {
      tmpPoint = (tmpY * tmpWidth + tmpX) * 4;

      //Index dans le tableau context.getImageData(...).data.

      //Ce tableau est un tableau unidimensionnel qui réserve 4 valeurs pour chaque pixel (rouge, vert, bleu, alpha)
      //et stocke tous les points dans une seule dimension, pixel après pixel, ligne après ligne :

      //calculer les coordonnées du point sur l'image en perspective.

      //Prenez la coordonnée X du point d'origine et traduisez-la en coordonnée cible (oblique): le trapèze de transformation part de 0).

      //Calculez la taille d'un % de srcWidth (x non asymétrique) tmpX, puis obtenez la moyenne de ce % de targetTopWidth et targetBottomWidth (inclinés),
      //en pondérant les deux à l'aide de la coordonnée Y du point et en tenant compte du décalage asymétrique (à quelle distance topLeft et
      //bottomLeft du trapèze de transformation partent de 0).
      targetX =
        (targetTopOffset + (targetTopWidth * tmpX) / tmpWidth) *
        (1 - tmpY / tmpHeight) +
        (targetBottomOffset + (targetBottomWidth * tmpX) / tmpWidth) *
        (tmpY / tmpHeight);

      targetX = Math.round(targetX);

      //Prenez la coordonnée Y du point d'origine et traduisez-la en coordonnée cible (perspective):
      targetY =
        (targetLeftOffset + (targetLeftHeight * tmpY) / tmpHeight) *
        (1 - tmpX / tmpWidth) +
        (targetRightOffset + (targetRightHeight * tmpY) / tmpHeight) *
        (tmpX / tmpWidth);

      targetY = Math.round(targetY);

      targetPoint = (targetY * tmpWidth + targetX) * 4;

      // Décalage de pixel pour couvrir les pixels morts

      if (targetPoint >= 4 && targetPoint < targetImgData.length - 5) {
        if (targetX != 0) {
          targetImgData[targetPoint - 4] = tmpImgData[tmpPoint]; //rouge
          targetImgData[targetPoint + 1 - 4] = tmpImgData[tmpPoint + 1]; //vert
          targetImgData[targetPoint + 2 - 4] = tmpImgData[tmpPoint + 2]; //bleu
          targetImgData[targetPoint + 3 - 4] = tmpImgData[tmpPoint + 3]; //alpha
        }
      }

      // Pixels cibles
      targetImgData[targetPoint] = tmpImgData[tmpPoint]; //rouge
      targetImgData[targetPoint + 1] = tmpImgData[tmpPoint + 1]; //vert
      targetImgData[targetPoint + 2] = tmpImgData[tmpPoint + 2]; //bleu
      targetImgData[targetPoint + 3] = tmpImgData[tmpPoint + 3]; //alpha
    }
  }
  targetContext.putImageData(targetMap, targetMarginX, targetMarginY);
  ctx2.drawImage(canvas0, 0, 0);
}

/********************************************************************************************************************/

/**************************    Fonction d'initialisation de la vue    **************************/

// Chargement par défaut du canva0 avec la Vue et positionnement par défaut de la mention en bas à gauche de la Vue
function initVue() {
  chargeVide(imgVue.src); 
  divMention.style.top = canvas0.offsetHeight + canvas0.offsetTop - 38 + "px";
  divMention.style.left = canvas0.offsetLeft + 10 + "px";
}

/**************************    Fonction de chargement du canvas0    **************************/

function charge(
  maVue,
  monObj,
  monStartX,
  monStartY,
  monEndX,
  monEndY,
  monFlip = false
) {
  let ctx = canvas0.getContext("2d");
  let obj = new Image();

  if (!drawned) {
    obj.src = monObj;
    obj.onload = function () {
      if (monStartY > monEndY && monStartX > monEndX) {
        //dessin en haut et à gauche du point de départ
        if (isProportionel === true) {
          drawMonObj(
            ctx,
            this,
            monStartX - (monStartY - monEndY) * objRatio,
            monEndY,
            (monStartY - monEndY) * objRatio,
            monStartY - monEndY
          );
        } else {
          rectangle.style.width = monStartX - monEndX + "px";
          rectangle.style.left = monEndX + "px";
          drawMonObj(
            ctx,
            this,
            monEndX,
            monEndY,
            monStartX - monEndX,
            monStartY - monEndY
          );
        }
      }

      if (monStartY < monEndY && monStartX > monEndX) {
        //dessin en bas et à gauche du point de départ
        if (isProportionel === true) {
          drawMonObj(
            ctx,
            this,
            monStartX - (monEndY - monStartY) * objRatio,
            monStartY,
            (monEndY - monStartY) * objRatio,
            monEndY - monStartY
          );
        } else {
          drawMonObj(
            ctx,
            this,
            monEndX,
            monStartY,
            monStartX - monEndX,
            monEndY - monStartY
          );
        }
      }

      if (monStartY > monEndY && monStartX < monEndX) {
        //dessin en haut et à droite du point de départ
        if (isProportionel === true) {
          drawMonObj(
            ctx,
            this,
            monStartX,
            monEndY,
            (monStartY - monEndY) * objRatio,
            monStartY - monEndY
          );
        } else {
          drawMonObj(
            ctx,
            this,
            monStartX,
            monEndY,
            monEndX - monStartX,
            monStartY - monEndY
          );
        }
      }

      if (monStartY < monEndY && monStartX < monEndX) {
        //dessin en bas et à droite du point de départ
        if (isProportionel === true) {
          drawMonObj(
            ctx,
            this,
            monStartX,
            monStartY,
            (monEndY - monStartY) * objRatio,
            monEndY - monStartY
          );
        } else {
          drawMonObj(
            ctx,
            this,
            monStartX,
            monStartY,
            monEndX - monStartX,
            monEndY - monStartY
          );
        }
      }
    };
    ctx2.drawImage(canvas0, 0, 0);
    btnExport.disabled = false;
    drawned = true;
  }
}

function chargeVide(maVue) {
  let ctx = canvas0.getContext("2d");
  let vue = new Image();
  vue.src = maVue;
  vue.onload = function () {
    drawMonObj(ctx, this, 0, 0, canvas0.width, canvas0.height);
    ctx2.drawImage(canvas0, 0, 0);
  };
  drawned = false;
}

function chargeRefresh() {
  if (monQuad.length == 0 && drawned) {
    chargeVide(imgVue.src); //lorsque que le quadrilatère monQuad ne contient plus de point on reinitialise le canvas0 avec la vue vierge
  }
}

/**************************    Fonction de chargement de la mention    **************************/

function chargeMention(maCoul) {
  //TODO à éclaircir le margebass selon navigateur
  
  let ctx = canvas1.getContext("2d");
  let margebasse = 10;
  let x, y;
  ctx.fillStyle = maCoul;
  ctx.font = "25px arial";

  var browserName = function (agent) {
    if (agent.indexOf("firefox") > -1) {
      margebasse = 10;
    }
  };
  x = 100;
  y = 100;

  let maval = document.getElementById("dropMentionPos").innerText;
console.log(maval);
  switch (maval) {
    case "Haut-Gauche":
      x = 10;
      y = divMention.offsetHeight - 10;
      break;

    case "Haut-Droite":
      x = canvas0.offsetWidth - divMention.offsetWidth - 10;
      y = divMention.offsetHeight - 10;
      break;

    case "Bas-Droite":
      x = canvas0.offsetWidth - divMention.offsetWidth - 10;
      y = canvas0.offsetHeight - margebasse;
      break;

    case "Bas-Gauche":
      x = 10;
      y = canvas0.offsetHeight - margebasse;
      break;

    default:
  }

  ctx.fillText(document.getElementById("divMention").innerHTML, x, y);
}

/**************************    Fonction de sauvegarde du calque objet    **************************/

function sauveVue() {
  dataURL = canvas0.toDataURL();
}

/**************************    Fonction de suppression du calque objet    **************************/

function restoreVue() {
  let image = new Image();
  image.src = dataURL;

  image.onload = function () {
    chargeVide(image.src);
    ctx2.drawImage(canvas0, 0, 0);
  };
}

/**************************    Fonction de suppression du calque objet    **************************/

function drawMonObj(monCtx, monThis, monX, monY, monWidth, monHeight) {
  monCtx.drawImage(monThis, monX, monY, monWidth, monHeight);
}

/**************************    Fonction d'initialisation du canvas1    **************************/

function setcanvas1() {
  var img = new Image();

  document.getElementById("canvas1").width = canvas0.width;
  document.getElementById("canvas1").height = canvas0.height;
  document.getElementById("canvas1").top = canvas0.top;
  document.getElementById("canvas1").left = canvas0.left;

  var ctx2 = document.getElementById("canvas1").getContext("2d");

  ctx2.drawImage(canvas0, 0, 0);
}

/********************************************* FONCTIONS DIVERSES *******************************************************/

/********************************************************************************************************************/

/*****Fonction de montée en charge pour test  */

function heavyComputation() {
  // Allouer un grand tableau de données
  const data = new Array(100000000);

  // Initialiser chaque élément du tableau avec une valeur aléatoire
  for (let i = 0; i < data.length; i++) {
    data[i] = Math.random();
  }

  // Trier le tableau de données
  data.sort((a, b) => a - b);

  // Retourner le premier élément du tableau trié
  return data[0];
}

//console.log(heavyComputation());

/********************************************************************************************************************/

function testObjet(monObj) {
  //  testeur

  let out = "";
  for (let i in monObj) {
    if (monObj[i] != "") {
      out += i + ": " + monObj[i] + "|| \n";
    }
  }
  //document.getElementById("out").innerHTML = out;

  alert(out);

  //console.log(out);
}

/********************************************************************************************************************/

function isTouchDevice() {
  try {
    document.createEvent("TouchEvent");
    return true;
  } catch (e) {
    return false;
  }
}

/**************************    Fonction getOffset    **************************/

function getOffset(el) {
  const rect = el.getBoundingClientRect();
  return {
    left: rect.left + window.scrollX,
    top: rect.top + window.scrollY,
  };
}

/**************************    Fonction elementPosition    **************************/

function elementPosition(el) {
  var b = el.getBoundingClientRect();
  return {
    clientX: el.offsetLeft,
    clientY: el.offsetTop,
    viewportX: b.x || b.left,
    viewportY: b.y || b.top,
  };
}

/**************************    Fonction pour changer le curseur de la souris    **************************/

function changeCursor(monCurseur) {
  canvas0.style.cursor = monCurseur;
}

/**************************    Fonction pour afficher la miniature de l'objet selon le flip    **************************/

function setImgObjFlip(monBool = true) {
  if (document.getElementById("btnFlip").checked && monBool) {
    document.getElementById("img_obj").style.transform = "scaleX(-1)";
  } else {
    document.getElementById("img_obj").style.transform = "scaleX(1)";
  }
}

