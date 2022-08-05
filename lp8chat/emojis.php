<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prueba emojis</title>
</head>
<body>
    <style>
        textarea{
  width:300px;
  margin-top:25px;
  height:50px;
}

#elemento-destino{
  font-size:2em;
  padding-top:5px;
}

.emoji{  
    display:inline-block;
    vertical-align:middle;
    width: 60px;
    height: 60px;
      background: url(https://s-media-cache-ak0.pinimg.com/236x/e9/b3/13/e9b313c5bad0465c6ee1cb51b06e9e2d.jpg); 

  
}

.emoji.lengua{  
  background-position: 0px 0px;
}

.emoji.XD{
 
  background-position: 0px 180px;
}

.emoji.smile{  
  background-position: 60px 0px;
}
    </style>
    <script>
        window.onload = publicar;

function publicar(){
  
  var texto = document.getElementById('texto-origen').value;  
  var elemento_destino =  document.getElementById('elemento-destino');
  
  var emojis = [
    {codigo:':b',class:'emoji lengua'},
    {codigo:'xD',class:'emoji XD'},
    {codigo:':)',class:'emoji smile'}    
  ];   
  
  var result = findById( emojis, 45 );  
  
  for (i = 0; i < emojis.length; i++) { 
    
    var emoji = emojis[i];
    var image = '<div class="' + emoji.class + '"></div>'
        
    texto = replaceAll(texto,emoji.codigo,image);      
    
  }  
  
  elemento_destino.innerHTML = texto;
  
}


function findById(source, id) {
    return source.filter(function( obj ) {
        // coerce both obj.id and id to numbers 
        // for val & type comparison
        return +obj.id === +id;
    })[ 0 ];
}


function replaceAll(str, find, replace) {  
  try{
    return str.replace(new RegExp(find, 'g'), replace);
  }catch(ex){
    return str;
  }
}
    </script>
<strong>Prueba con xD y :b</strong><br/>
<textarea id="texto-origen" class="tarea">Hola xD mundo :b</textarea>
<button onclick="publicar()">Publicar</button>
<div id="elemento-destino"></div>
</body>
</html>