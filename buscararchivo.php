<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Buscar archivo</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>

    <body>
        <form action="buscararchivo.php" method="post">
            <select name="select" class="form-control col-sm-5">
                <option selected>seleccionar directorio</option>
                <option value="css/">css</option>
                <option value="js/">js</option>
                <option value="tpl/">view</option>
                <option value="include/">imagenes</option>
                <option value="assets/">Fotos de articulos</option>
                <option value="/trabajos/lp8chat/">Raiz</option>
            </select>
            <input type="submit" id="qdir" name="buscar" value="Buscar">
        </form>
    </body>
</html>
<?php
//Creamos Nuestra Función
if ($_POST) {
    $carpeta = $_POST['select'];;
    function listArchivo($directorio){ //La función recibira como parametro un directorio
        if (is_dir($directorio)) { //Comprobamos que sea un directorio Valido
            if ($dir = opendir($directorio)) {//Abrimos el directorio
            // if (isset($_POST['enviar'])){
    
    
                echo '<ul>'; //Abrimos una lista HTML para mostrar los archivos
    
                while (($archivo = readdir($dir)) !== false){ //Comenzamos a leer archivo por archivo
     
                    if ($archivo != '.' && $archivo != '..'){//Omitimos los archivos del sistema . y ..
     
                        $nuevaRuta = $directorio.$archivo.'/';//Creamos unaruta con la ruta anterior y el nombre del archivo actual 
     
                        echo '<li>'; //Abrimos un elemento de lista 
     
                        if (is_dir($nuevaRuta)) { //Si la ruta que creamos es un directorio entonces:
                            echo '<b>'.$nuevaRuta.'</b>'; //Imprimimos la ruta completa resaltandola en negrita
                            listArchivo($nuevaRuta);//Volvemos a llamar a este metodo para que explore ese directorio.
     
                        } else { //si no es un directorio:
                            $ruta_archivo = $directorio.$archivo;
                            echo "<a href='$ruta_archivo'>Archivo: $archivo</a>";
                            //echo 'Archivo: '.$archivo; //simplemente imprimimos el nombre del archivo actual
     
                        }
     
                        '</li>'; //Cerramos el item actual y se inicia la llamada al siguiente archivo
     
                    }
     
                }//finaliza While
                echo '</ul>';//Se cierra la lista
     
                closedir($dir);//Se cierra el archivo
             }
        }else{//Finaliza el If de la linea 12, si no es un directorio valido, muestra el siguiente mensaje
            echo 'No Existe el directorio';
        }
        }//Fin de la Función	
     
        //Llamamos a la función y le pasamos el nombre de nuestro directorio.
        listArchivo($carpeta);
}    
?>