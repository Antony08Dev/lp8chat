<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>taphold demo</title>
  <!-- <link rel="stylesheet" href="//code.jquery.com/mobile/1.5.0-alpha.1/jquery.mobile-1.5.0-alpha.1.min.css"> -->
  <!-- <script src="//code.jquery.com/jquery-3.2.1.min.js"></script> -->
  <!-- <script src="//code.jquery.com/mobile/1.5.0-alpha.1/jquery.mobile-1.5.0-alpha.1.min.js"></script> -->
  <style>
  html, body { padding: 0; margin: 0; }
  html, .ui-mobile, .ui-mobile body {
    height: 85px;
  }
  .ui-mobile, .ui-mobile .ui-page {
    min-height: 85px;
  }
  #nav {
    font-size: 200%;
    width:17.1875em;
    margin:17px auto 0 auto;
  }
  #nav a {
    color: #777;
    border: 2px solid #777;
    background-color: #ccc;
    padding: 0.2em 0.6em;
    text-decoration: none;
    float: left;
    margin-right: 0.3em;
  }
  #nav a:hover {
    color: #999;
    border-color: #999;
    background: #eee;
  }
  #nav a.selected,
  #nav a.selected:hover {
    color: #0a0;
    border-color: #0a0;
    background: #afa;
  }
  div.box {
    width: 3em;
    height: 3em;
    background-color: #108040;
  }
  div.box.taphold {
    background-color: #7ACEF4;
  }
  </style>
</head>
<body>
 
<h3>Long press the square for 750 milliseconds to see the above code applied:</h3>
<div class="box"></div>

<button onclick="prueba_notificacion()">Notificame!</button>

<!-- <button id="buttonP">Dar Permisos</button>  
<button id="buttonN">Lanzar notificación</button> -->
<button id="button">Enviar notificacion</button>

<script>
    // var button = document.getElementById("button");

    // button.addEventListener('click', function(){
    //     notify();
    // });

    // function notify(){

    //     if (!("Notification" in window)) {
    //         alert("tu navegador no soporta notificaciones");

    //     }else if(Notification.permission === "granted"){
    //         var notification = new Notification("MI Primer notificacion");
    //     }
    // }
</script>

<script>
// var btnNotificacion = document.getElementById("buttonN"),  
//     btnPermiso = document.getElementById("buttonP")
//     titulo = "Fili Santillán",
//     opciones = {
//         icon: "http://192.168.1.109:8090/cache/180/6795115-1.jpg",
//         body: "Notificación de prueba"
//     };

// function permiso() {  
//         Notification.requestPermission();
// };

// function mostrarNotificacion() {  
//     if(Notification) {
//         if (Notification.permission == "granted") {
//             var n = new Notification(titulo, opciones);
//         }

//         else if(Notification.permission == "default") {
//             alert("Primero da los permisos de notificación");
//         }

//         else {
//             alert("Bloqueaste los permisos de notificación");
//         }
//     }
// };

// btnPermiso.addEventListener("click", permiso);  
// btnNotificacion.addEventListener("click", mostrarNotificacion);

// $(function(){
//   $( "div.box" ).bind( "taphold", function tapholdHandler( event ){
//     $( event.target ).addClass( "taphold" );
//     alert("antony");
//   } );
// });

// var timer;
// $('div.box').on("mousedown",function(){
//     timer = setTimeout(function(){
       
//             // Vamos a ver si ya se han concedido permisos de notificación
//         alert("WORKY");
//     },2*1000);
// }).on("mouseup mouseleave",function(){
//     clearTimeout(timer);
// });
</script>
 
</body>
</html>