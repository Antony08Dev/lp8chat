<?php

require("db.php");
$getMessages = $conexion->prepare("SELECT * FROM mensajes;");
$getMessages->execute();
$Messages = $getMessages->fetchAll(PDO::FETCH_ASSOC);

 ?>

<!DOCTYPE html>
<html lang="es" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/emojionearea/3.4.1/emojionearea.min.css">
    <!-- CDN de EmojiOne -- >
    <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/emojione@4.0.0/extras/css/emojione.min.css"/>-->
    <link rel="stylesheet" href="styles.css">
    <title>Emojis</title>
  </head>
  <body>
    <!-- HTML(Hex) -->
    <!--<h1>Probando emojis &#x1F601;</h1>-->
    <!-- HTML(Dec) -->
    <!--<h1>Probando emojis &#128513;</h1>-->
    <!-- CSS -->
    <!--<h1>Probando emojis <i class="emoji-angry"></i></h1>-->

    <main>
      <div class="ventana-chat">
        <div class="contenedor-chat" id="contenedor-chat">
          <?php foreach ($Messages as $Message): ?>
            <p><?php echo $Message["Mensaje"] ?></p><br>
          <?php endforeach; ?>
        </div>
        <div class="input-area">
          <form id="SendMessage" action="#" method="post">
            <input type="text" id="TypeAMessage" placeholder="¡Escribe un mensaje!">
            <div class="container1 form-control"></div>
            <button type="button" id="Send">Enviar</button>
            <div class="span6">
              <input type="text" id="emojionearea"/>
            </div>
            <script>
              $(document).ready(function() {
              	$("#emojionearea").emojioneArea({
  	              pickerPosition: "bottom",
  	              filtersPosition: "bottom",
                  shortnames: true,
                  saveEmojisAs : "shortname",
                });
              });
            </script>
          </form>
        </div>
      </div>
    </main>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/emojionearea/3.4.1/emojionearea.min.js" charset="utf-8"></script>
    <!-- CDN de EmojiOne -- >
    <!--<script src="https://cdn.jsdelivr.net/npm/emojione@4.0.0/lib/js/emojione.min.js"></script>-->
    <script src="scripts.js" charset="utf-8"></script>
  </body>
</html>
