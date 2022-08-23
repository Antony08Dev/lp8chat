<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Previsualizar archivos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<style>
    
</style>
<body>
    <section>
        <div class="col-sm-4 m-auto">
            <input type="file" class="custom-file-input" id="inputImg[]" onchange="return validarExt()">
            <label class="custom-file-label" for="inputImg">Selecciona una imagen...</label>
        </div>
        <div class="container text-center">
            <div id="preview[]" class="row"></div>

        </div>
    </section>
</body>
</html>

<script>
    function validarExt(){
        var inputImg = document.getElementById('inputImg[]'),
        imgRuta = inputImg.value, extPermitidas = /(.jpg)$/i;

            if(!extPermitidas.exec(imgRuta)){
                alert('asegurate de elegir una imagen');
                inputImg.value='';
                return false
            }else
        {
            //PRevio de la imagen
            if (inputImg.files && inputImg.files[0]) 
            {
                var visor = new FileReader();
                visor.onload = function(e) 
                { 
                    document.getElementById('preview[]').innerHTML = 
                    '<embed src="'+e.target.result+'" class="m-auto" width="375" height="250" />';
                };
                visor.readAsDataURL(inputImg.files[0]);
            }
        }
    }
</script>