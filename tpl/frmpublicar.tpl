<?php
//parr($tplArticulo);
if (isset($tplArticulo)) {

    $dataId = "{$tplArticulo['id']}_{$tplArticulo['usuario_id']}_{$tplArticulo['articulo']}_{$tplArticulo['fechaf']}_{$tplArticulo['estatus']}_PU";
    $totalFotos = Config::$arrProductos[$_SESSION['lp_usuplann']]['fotos'];
    // cantidad de fotos que tiene subidas
    if ($tplArticulo['fotos'] != "") $cantFotos = count(explode(",",$tplArticulo['fotos']));
    else $cantFotos = 0;

    // fotos restantes, total por plan menos subidas 
    $restaFotos = $totalFotos - $cantFotos;    

}
?>
<link rel="stylesheet" href="<?=Config::$cdn;?>/css/filer.css" >
<?=(isset($fotosfiles) and !empty($fotosfiles)) ? Funciones::jsScripts("var filerfiles=[{$fotosfiles}];\n") : "";?>
<div class="card " >
    <div class="card-header <?=$tplColorbg;?>">
        <h4><?=($_SESSION['lp_estatus'] == "I") ? "<b>CUENTA INACTIVA, NO PUEDES PUBLICAR</b>" : $tplTitulo;?></h4>
    </div>
    <div class="card-body">

        <?php if ($_SESSION['lp_estatus'] == "I") { ?>

            <div class="jumbotron bg-light">
                <h1 class="display-4">Hola, <?=$_SESSION['lp_nombre'];?>!</h1>
                <p class="lead">Debes activar tu cuenta para poder realizar publicaciones y otras opciones.  Aunque tu usuario y clave funcionan falta validar el correo electronico para activar la cuenta.</p>
                <hr class="my-4">
                <p class="lead">
                    <a href="/emailactivacion" class="btn btn-primary btn-lg" href="#" role="button">Reenvia Activaci&oacute;n</a>
                </p>
            </div>

        <?php } else { ?>

            <form action="/publicar" name="frmpublicar" id="frmpublicar" method="POST" class="needs-validation" novalidate enctype="multipart/form-data">
                <?php if (isset($tplArticulo['id'])) { ?> 
                <input type="hidden" name="id" id="id" value="<?=$tplArticulo['id'];?>" />
                <input type="hidden" name="modifica" id="modifica" value="Modificar" />
                <?=Funciones::camposAnteriores($tplArticulo);?>
                <?php } ?> 

                <input type="hidden" name="confirma" id="confirma" value="S" />

                <input type="hidden" name="uid" id="uid" value="<?=isset($_SESSION['lp_uid']) ? $_SESSION['lp_uid'] : 0;?>" />
                <input type="hidden" name="ssid" id="ssid" value="<?=isset($_SESSION['lp_session']) ? $_SESSION['lp_session'] : 0;?>" />
                <input type="hidden" name="pines" id="pines" value="<?=isset($_SESSION['lp_pines']) ? $_SESSION['lp_pines'] : 0;?>" />


                <div class="form-group row ">
                    <label for="categoria" class="col-sm-2 col-form-label">Categoria</label>
                    <div class="col-sm-10">
                    <select name="categoria" class="custom-select campocorto" id="categoria" required >
                        <option selected  value="">Seleccione...</option>
                        <?=$tplOpcionescat;?>
                    </select>
                        <div class="invalid-feedback">
                            Favor seleccionar la categoria
                        </div>
                    </div>
                </div>


                <div class="form-group row hide" id="fldgomaaro">
                    <label for="gomaaro" class="col-sm-2 col-form-label" id="lblgoma">Numeraci&oacute;n</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control campocorto gomas" id="gomaaro" name="gomaaro" placeholder="Formato 999/99/99" maxlength="9" data-toggle="tooltip" data-placement="right" title="Coloca la informacion en el formato indicado para que el sistema pueda filtrar mejor."> 
                        <div class="invalid-feedback">
                            Favor colocar la informacion requerida
                        </div>
                    </div>
                </div>

                <div class="form-group row ">
                    <label for="articulo" class="col-sm-2 col-form-label">T&iacute;tulo</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control campocorto" id="articulo" name="articulo" placeholder="Titulo de tu publicacion" required autofocus maxlength="60"> 
                        <div class="invalid-feedback">
                            Favor colocar el titulo articulo
                        </div>
                    </div>
                </div>

                <div class="form-group row ">
                    <label for="precio" class="col-sm-2 col-form-label">Precio</label>
                    <div class="col-sm-10">
                        <div class="form-check form-check-inline ">
                            <input type="number" class="form-control" name="precio" id="precio" placeholder="Precio real" min="25" max="99999999" required >
                            <div class="custom-control custom-switch ml-2" id="precioini">
                                <input class="custom-control-input " type="checkbox" name="precioini" id="precioini1" value="S">
                                <label class="custom-control-label" for="precioini1">Inicial</label> 
                            </div>
                        </div>


                        <div class="invalid-feedback">
                            Favor colocar el precio real no igual a 0, no colocar comas ni puntos
                        </div>
                    </div>
                </div>

                <div class="form-group row ">
                    <label for="moneda1" class="col-sm-2 form-check-label" id="lblmoneda">Moneda</label>
                    <div class="col-sm-10">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="moneda" id="moneda1" value="R" checked required>
                            <label class="form-check-label" for="moneda1">&nbsp;RD$</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="moneda" id="moneda2" value="U" required>
                            <label class="form-check-label" for="moneda2">&nbsp;US$</label>
                        </div>
                    </div>
                </div>


                <div class="form-group row " id="tipo" style="display:none;">
                    <label for="tipo1" class="col-sm-2 form-check-label" id="lbltipo">Tipo</label>
                    <div class="col-sm-10">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="tipo" id="tipo1" value="V" checked>
                            <label class="form-check-label" for="tipo1">&nbsp;Venta</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="tipo" id="tipo2" value="C" >
                            <label class="form-check-label" for="tipo2">&nbsp;Compra</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="tipo" id="tipo3" value="A" >
                            <label class="form-check-label" for="tipo3">&nbsp;Alquiler</label>
                        </div>
                    </div>
                </div>            

                <div class="form-group row " id="condicion">
                    <label for="condicion1" class="col-sm-2 form-check-label">Condici&oacute;n</label>
                    <div class="col-sm-10">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="condicion" id="condicion1" value="1" required>
                            <label class="form-check-label" for="condicion1">&nbsp;Nuevo</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="condicion" id="condicion2" value="2" required>
                            <label class="form-check-label" for="condicion2">&nbsp;Usado</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="condicion" id="condicion3" value="3" required>
                            <label class="form-check-label" for="condicion3">&nbsp;Renovado</label>
                        </div>
                        <div class="invalid-feedback">
                            Favor seleccionar la condicion
                        </div>                    
                    </div>
                </div>
                
                <div class="form-group row ">
                    <label for="articulo" class="col-sm-2 col-form-label">Video</label>
                    <div class="col-sm-10">
                        <input type="url" class="form-control campocorto" id="urlvideo" name="urlvideo" placeholder="Youtube ej. https://www.youtube.com/watch?v=xxxxxxxxx "  > <a href="https://www.youtube.com" target="_blank" class="youtube" id="lnkyoutube"><small style="line-height: 34px;">Buscar en YouTube</small></a>
                        <div class="invalid-feedback">
                            Favor colocar una direccion valida de YouTube
                        </div>                         
                    </div>
                </div>


                <div class="form-group row">
                
                    <label class="col-sm-2 col-form-label" for="fotos">Fotos</label>
                    <div class="col-sm-10">
                    <?php if (!isset($tplArticulo)) { 

                        include("view/campofotos.tpl");

                    } else { ?>

                        <a href="javascript:;" class="admfotos" data-aid="<?=$tplArticulo['id'];?>" data-titulo="<?=$tplArticulo['articulo'];?>" data-fotos="<?=$tplArticulo['fotos'];?>" style="line-height: 2.4;" id="admfotos_<?=$tplArticulo['id'];?>">Administrar mis <?=$cantFotos;?> Fotos </a>

                    <?php }  ?>

                    </div>                    
                </div>
            

                <div class="form-group row ">
                    <label for="descripcion" class="col-sm-2 col-form-label">Descripci&oacute;n</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" name="descripcion" id="descripcion" rows="5" minlength="35" data-bv-stringlength-message="Debes colocar  una descripcion mas larga"  required></textarea>
                        <div class="invalid-feedback">
                            Favor colocar la descripcion por lo menos con 35 caracteres
                        </div>
                    </div>
                </div>

            <div class="form-group row ">
                    <label for="enviar" class="col-sm-2 col-form-label">&nbsp;</label>
                    <div class="col-sm-10">
                        <button name="Enviar" <?=($_SESSION['lp_estatus'] == "I") ? "disabled" : "";?> id="enviar" type="submit" id="Enviar" class="btn btn-success btn-lg">Enviar Datos</button>
                        <?php if (isset($tplArticulo['id'])) { // boton solo para modificar e ir a mi pulga?> 
                            <button name="Cancelar" id="cancelar" type="button" id="Cancelar" onclick="location.href='/mipulga';" class="btn btn-secondary btn-md">Cancelar</button>
                        <?php } ?>
                    </div>
                </div>

            </form>
        <?php }  ?>
    </div>
</div>
<?php if (isset($tplArticulo)) { 
    include("view/moadmfotos.tpl");
} ?>