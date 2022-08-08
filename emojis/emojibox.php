<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>emojis</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

</head>
<style>
    .grid-container {
        width: 50vh;
        display: grid;
        /* display: inline-grid; */
        grid-template-columns: 40px 40px 40px 40px 40px 40px 40px 40px;
        background-color: gray;
        padding: 5px;
    }
    .grid-item {
        /* background-color: #fff; */
        border: .1px solid #efefef;
        border-radius: .55rem;
        margin: 5px;
        font-size: 20px;
        text-align: center;
    }

</style>
<body>
    <div class="container">
        <header class="cabecera">
        <nav class="menu">
            <ul>
                <li><a href="#caras">&#128512;</a></li>
                <li><a href="#animales">&#128062;</a></li>
                <li><a href="#comida">&#127822;</a></li>
                <li><a href="#deportes">&#127952;</a></li>
                <li><a href="#transporte">&#128661;</a></li>
                <li><a href="#otros">&#128173;</a></li>
            </ul>
        </nav>
    </header>

        <div id="caras" class="grid-container active">
            <div class="grid-item">&#128512;</div>
            <div class="grid-item">&#128513;</div>
            <div class="grid-item">&#128518;</div>
            <div class="grid-item">&#128514;</div>
            <div class="grid-item">&#129299;</div>
            <div class="grid-item">&#129300;</div>
            <div class="grid-item">&#128517;</div>
            <div class="grid-item">&#128521;</div>
            <div class="grid-item">&#128522;</div>
            <div class="grid-item">&#128523;</div>
            <div class="grid-item">&#128519;</div>
            <div class="grid-item">&#128520;</div>  
            <div class="grid-item">&#128527;</div>
            <div class="grid-item">&#128526;</div>
            <div class="grid-item">&#128525;</div>
            <div class="grid-item">&#129321;</div>
            <div class="grid-item">&#128528;</div>  
            <div class="grid-item">&#128530;</div>
            <div class="grid-item">&#128543;</div>
            <div class="grid-item">&#128542;</div>
            <div class="grid-item">&#128532;</div>
            <div class="grid-item">&#128531;</div>  
            <div class="grid-item">&#128546;</div>
            <div class="grid-item">&#128534;</div>
            <div class="grid-item">&#128557;</div>
            <div class="grid-item">&#128533;</div>
            <div class="grid-item">&#128535;</div>  
            <div class="grid-item">&#128536;</div>
            <div class="grid-item">&#128539;</div>
            <div class="grid-item">&#128540;</div>
            <div class="grid-item">&#128541;</div>
            <div class="grid-item">&#128544;</div>  
            <div class="grid-item">&#128545;</div>
            <div class="grid-item">&#128553;</div>
        </div>
        <div id="animales" class="grid-container">
            <div class="grid-item">&#128512;</div>
            <div class="grid-item">&#128513;</div>
            <div class="grid-item">&#128518;</div>
            <div class="grid-item">&#128514;</div>
            <div class="grid-item">&#129299;</div>
            <div class="grid-item">&#129300;</div>
            <div class="grid-item">&#128517;</div>
        </div>
    </div>
    <script>
        let pestañas = document.querySelectorAll('.grid-container');

// Función para mostrar solo el que corresponde al enlace y ocultar los demás
    function mostrarPestañas(enlace) {
    // Ocultar todos los contenedores
        pestañas.forEach(container => container.classList.remove('active'));
    // Obtener ID a buscar
        let selector = enlace.getAttribute('href');
    // Buscar contenedor
        let container = document.querySelector(selector);
    // Solo si existe
        if(container) {
        // Agregar clase para mostrar
            container.classList.add('active');
        }
    }

// Escuchar clics en la barra de navegación
    document.querySelector('.respmen .menu').addEventListener('click', e => {
    // e.target es el elemento que recibió clic
    // Asegurar que se trata de un enlace
        if(e.target.tagName == 'A') {
        // Ejecutar función para mostrar enviando el enlace como parámetro
            mostrarPestañas(e.target);
        }
    });
    </script>
</body>
</html>