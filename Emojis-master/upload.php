<?php

require("db.php");

$Mensaje = $_POST["Mensaje"];

$uploadMessage = $conexion->prepare("INSERT INTO mensajes (Mensaje) VALUES (:Mensaje);");

if ($uploadMessage->execute(array(":Mensaje" => $Mensaje))) {
  echo "true";
}
else {
  echo "Ha surgido un error";
}


 ?>
