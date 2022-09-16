<?php

$conexion = new PDO("mysql:host=localhost;dbname=emojis", "root", "");
$setnames = $conexion->prepare("SET NAMES 'utf8'");
$setnames->execute();

 ?>
