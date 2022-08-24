<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
    <!-- Booststrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!--  /Booststrap -->

    <link rel="stylesheet" href="css/icons.css">
    <link rel="stylesheet" href="css/estilos.css">
    <!-- <link rel="stylesheet" href="css/grid.css"> -->
    <!-- <link rel="stylesheet" href="css/modal.css"> -->
    <!-- <link rel="stylesheet" href="css/styles.css"> -->
    <title>Vista previa de imágenes</title>
</head>
<body>
<main>
        <div class="container">
            <section id="Images" class="images-cards">
                <form action="upload.php" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-xl-2 col-lg-2 col-md-3 col-sm-4 col-xs-12" id="add-photo-container">
                            <div class="add-new-photo first" id="add-photo">
                                <span><i class="icon-camera"></i></span>
                            </div>
                            <input type="file" multiple id="add-new-photo" name="images[]">
                        </div>
                    </div>
                </form> 
            </section>
        </div>
    </main>

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

    <!-- Bootstrap y jQuery -->
    
    <script src="https://code.jquery.com/jquery-3.4.0.min.js" integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg=" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    
    <!--  /Bootstrap y jQuery -->


    <script src="js/modal.js"></script>
    <script src="js/functions.js"></script>
    <script src="js/scripts.js"></script>
</body>
</html>