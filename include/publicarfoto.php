<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reinventar la rueda</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="/estilos.css">

</head>

<body>
    <section>
        <form method='post' action="" enctype="multipart/form-data">
            <div class="col-sm-4">
                <input type="file" class="custom-file-input" id="inputImg" name="files[]" multiple="multiple" size="4"
                    onchange="validarExt ()" />
                <span class="inf__btn custom-file-label">Selecciona una imagen...</span>
            </div>
            
            <input type='submit' name='submit' value='Guardar'>
        </form>
        <br>
        <div class="container m-auto">

            <div id="preview" class="row"></div>
            <div id="info" class="row"></div>
        </div>
    </section>
</body>

</html>
<script>
    function validarExt() {
        var inputImg = document.getElementById("inputImg");
        var imgRuta = inputImg.value;
        var extPermitidas = /(.PNG|.png|.jpg|.JPG|.JPEG|.jpeg)$/i;
        var message = "";
        var info = document.getElementById("info");
        if ('files' in inputImg) {
            if (inputImg.files.length == 0 || !extPermitidas.exec(imgRuta)) {
                message = "Por favor eliga uno o más archivos.";
                if (!extPermitidas.exec(imgRuta)) {
                    message = "Por favor, asegurese de que eliga una imagen";
                }
            } else {
                if (inputImg.files.length) {
                    document.getElementById('preview').innerHTML = '';

                    for (let i = 0; i < 10; i++ ) {
                        let visor = new FileReader();
                        var file = inputImg.files[i];
                        visor.onload = function (e) {
                            document.getElementById('preview').innerHTML +=
                                '<div class="col-sm-2 m-2 imagen"><img src="' + e.target.result + '" width="150" height="100"/ ><div class="borrar fa-lg fa fa-times"></div></div>';
                            // document.getElementById('info').innerHTML += ' <label class="col" id="info" style="margin-top:30px">' + (i + 1)+' '+ file.name + '</label>';
                        };
                        visor.readAsDataURL(inputImg.files[i]);
                    }
          }
            }
        } else {
            if (inputImg.value == "") {
                message += "Selecciona una o más imagenes.";
                message += "<br />Use el control o shift para seleccionar varias imagenes";
            } else {
                message += "Tu navegador no soporta el programa";
                message += "<br />Fila seleccionada " + inputImg.value;
            }
        }

    }
</script>
<?php
if(isset($_POST['submit'])){
    $countfiles = count($_FILES['files']['name']);
    for($i=0;$i<$countfiles;$i++){
        $filename = $_FILES['files']['name'][$i];
        // $sql = "INSERT INTO fileup(id,name) VALUES ('$filename','$filename')";
        // $db->query($sql);
        move_uploaded_file($_FILES['files']['tmp_name'][$i],'upload/'.$filename);
    }
}
?>