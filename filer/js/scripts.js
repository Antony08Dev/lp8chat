$(document).ready(function(){

    $(document).on("click", "#add-photo", function(){
        $("#add-new-photo").click();
    });

    $(document).on("change",
    "#add-new-photo", function(){

        console.log(Array.from(this.files));
        var files = this.files;
        var elementos;
        var formatos = ["image/jpeg", "image/png", "image/gif", "image/webp"];
        var elementosNoValidos = false;
        if (files.length)
        for (var i =+ 0; i < files.length; i++) {
            elementos = files[i];

            if (formatos.indexOf(elementos.type) != -1){
                crearVista(elementos);
                var h = 1;
            }else {
                elementosNoValidos = true;
            }
        }

        if
        (elementosNoValidos) {
            alert("Debes asegurarte que que sean archivos tipo imagen.")
        }else {
            alert("Todos los archivos se subieron correctamente.")
        }
        console.log(files);
    });

    $(document).on("click", "#Images .image-container", function(e){
        $(this).parent().remove();
    });

});