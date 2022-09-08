function crearVista(file) {
    var imgNombre = URL.createObjectURL(file);
    var img = $('<div class="col-xl-3 col-lg-3 col-md-4 col-sm-5 col-xs-13"><div class="image-container"> <figure> <img src="' + imgNombre + '" alt="Foto del usuario"> <figcaption> <i class="icon-cross"></i> </figcaption> </figure> </div></div>');
    $(img).insertBefore("#add-photo-container");
}