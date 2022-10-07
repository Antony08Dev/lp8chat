<?php
include "include/LP_admin.inc.php";
$admin = 5;
?>
&nbsp;
<!-- inicio columna derecha listados -->
<div class="right-column">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
<!-- LISTADO DE OPCIONES PARA ADMIN-->
<style>
.left-column {
position: none;
}
/* .right-column {
    padding: 0px;
    margin: 0px;
    box-sizing: content-box;
} */
/* .card-group > .card{
    margin-bottom: 0px !important;
}  */

.apaga {
    display: none;
}

</style>
<link rel="stylesheet" href="/css/filer.css" >
<link rel="stylesheet" type="text/css" href="/css/lpfrmv8.css" >
    <!-- <link rel="stylesheet" href="css/klkmsgr.css"> -->
    <?php 
switch($admin) {
    case 0:
        echo "<h2 class=\"cards-header\" >
            Administrador La Pulga Virtual (328522)
        </h2>";
        include "view/adminusu.php";
        break;
    case 1:
        include "view/admfaq.php";
        break;
    case 2:
            include "tpl/filasusuadm.php";
        break;
    case 3:
        echo "<h2 class=\"cards-header\" >
        Solicitudes a <b>Procesar</b>, pines, planes, renovaciones, AO (206)
        </h2>";
            include "view/procesapro.php";
        break;
    case 4:
        echo "<h2 class=\"cards-header\" >
        Tickets a <b>Procesar</b>,  Soporte a usuarios (16)
        </h2>";
            include "view/admticket.php";
        break;
    case 5:
        // echo "<style> ul { columns: 3; -webkit-columns: 3; -moz-columns: 3; list-style: none;}</style>";
        include "view/admperfil.php";
        break;
        case 6:
            echo "<h2 class=\"cards-header\" >
                Administrador La Pulga Virtual (328522)
            </h2>";
            include "tpl/filasusuadm.php";
            break;
}
?>
</div>
</div>
</div>
<!-- <footer class="">
        <div class="container-custom">
        <div class="footer-columns">
            <div class="copyright-text">
                <div class="copyright">La Pulga Virtual&reg; Derechos Reservados desde 2003</div>
                <div class="realizado">
                    Un producto de <a href="http://www.ipsrd.com" target="_blank" id="lnkips" title="Intranet Productos y Servicios">IPS</a> hospedado por <a href="https://www.grupointernet.com" id="lnkgrpint" target="_blank" title="No Importa el lugar, nosotros le contactamos">GrupoInternet.com</a>
                </div>
                <div class="realizado">
                    <a href="/novedades" title="Novedades en La Pulga Virtual">Novedades</a> | <a href="/acerca" >Acerca de Nosotros</a> | <a href="javascript:;" title="Compartir via codigo QR" class="moqrcodigo">Compartir con QR</a> | <a href="/soporte" >Contacto</a>
                </div>
            </div>
        </div>
        
        
    </div>
</footer> -->
</body>
<!-- <script async='async' src='https://www.googletagservices.com/tag/js/gpt.js'></script> -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script src="https://kit.fontawesome.com/a9b590928e.js" crossorigin="anonymous"></script>

<script>
    $(document).ready(function () {

//document.write('\uD83D\uDE01');

$("#klkmsg").emojioneArea({
        container: "#klkmsg",
        inline: true,
        standalone: true
    });

$("#klkmsg").emojioneArea({
  shortnames: true,
  saveEmojisAs : "shortname",
  searchPlaceholder: "¡Busca un emoji!"
});

$("#Enviar").on("click", function () {
  console.log($("#klkmsg").val());

  var data = {
    Mensaje : $("#klkmsg").val()
  }

//   $.post("upload.php", data, function (res) {
//     if (res == "true") {
//       var mensaje = emojione.shortnameToImage($("#klkmsg").val());
//       var p = $('<p>' + mensaje + '</p><br />')
//       $("#contenedor-chat").append(p);
//     }
//     else {
//       alert(res);
//     }
//  });

});

// setTimeout(function () {
//   $("#contenedor-chat p").each(function () {
//     var text = $(this).text();
//     var mensaje = emojione.shortnameToImage(text);
//     $(this).html(mensaje)
//   });
// }, 300);


});

                
</script>
</html>
