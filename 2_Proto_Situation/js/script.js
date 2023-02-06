var xMousePos = 0;
var yMousePos = 0;

var xStart, yStart = 0;
var xEnd, yEnd = 0;

img_view.onmousedown = function () {
  xStart = xMousePos -img_view.x;
  yStart = yMousePos -img_view.y;
  document.getElementById("position_start").innerHTML =
    "Start x = " +
    xStart +
    " y = " +
    yStart;
}

img_view.onmouseup = function () {
  xEnd = xMousePos -img_view.x;
  yEnd = yMousePos -img_view.y;


  /*********************/
  if (document.getElementById("calque_obj")) {document.getElementById("calque_obj").remove();}
  var img = document.createElement("img");
  img.id = "calque_obj";
  
  img.src = "brasilia.jpg";
  img.height = yEnd - yStart;
  img.width = xEnd - xStart;
  var block = document.getElementById("Situation_view");
  
  block.appendChild(img);
  /*********************/

  var e = document.getElementById("calque_obj");
  e.style.top = yStart+"px";
  e.style.left = xStart +"px";

  document.getElementById("position_end").innerHTML =
  "End x = " +
  xEnd +
  " y = " +
  yEnd;

  document.getElementById("console_dev").innerHTML =
  "fond x = " +
  block.offsetLeft +
  " y = " +
  block.offsetTop;

  document.getElementById("position_calque").innerHTML =
  "calque x = " +
  img.offsetLeft +
  " y = " +
  img.offsetTop;
}

document.onmousemove = function (e) {
  xMousePos = e.clientX + window.pageXOffset;
  yMousePos = e.clientY + window.pageYOffset;
};

img_view.onmousemove = function () {
  var x = xMousePos ;
  var y = yMousePos ;
  document.getElementById("position_cur").innerHTML =
    "Pos x = " +
    (x-img_view.x) +
    "/" +
    img_view.offsetWidth +
    " y = " +
    (y-img_view.y) +
    "/" +
    img_view.offsetHeight;
};

img_view.onmouseleave = function() {

  /*document.getElementById("position_cur").innerHTML ="";*/

};


function chargeObjet()
{
  var z = new Image();
  
  z.src = "persp-brasilia.jpg";
  document.getElementById("img_obj").setAttribute("src") = z.src;
  document.getElementById("console_dev").innerHTML = z.src;
}

function chargeVue()
{
  alert("chargeVue");

}

function exportVue()
{
  alert("exportVue");

}

function proportionnel()
{
  alert("proportionnel");

}

function personnalise()
{
  alert("personnalise");

}
