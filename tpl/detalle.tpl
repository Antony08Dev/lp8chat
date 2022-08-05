<?php 
// parr($tplDetalle);
    if (isset($tplDetalle['DESCUENTO'])) {
        $precioIni = "";
        if ($tplDetalle['DESCUENTO'] != 0) {
            // viene con descuento 
            $precio2 = $tplDetalle['PRECIOF'];
            $precio1 = $tplDetalle['DESCUENTOF'];
        } elseif($tplDetalle['PRECIOINI'] == 'S') {
            $precio1 = $tplDetalle['PRECIOF'];
            $precio2 = "";
            $precioIni = "Inicial ";
        } else {
            $precio2 = "";
            $precio1 = $tplDetalle['PRECIOF'];
        }
        
    }
?>


<div class="container-custom">

    <?php if ($tplDetalle['IMPRIME']) { ?>

        <?php if (($tplDetalle['ESTATUS'] == 'PA') and ($duenoPendiente)) { ?>

        <div class="alert alert-danger" role="alert">
            <h4 class="alert-heading">Pendiente de aprobaci&oacute;n</h4><br>
                <p><b><?=$_SESSION['lp_nombre'];?></b> Esta publicaci&oacute;n est&aacute; siendo revisada por el <b>Equipo LP</b>, de 1 a 5 minutos estar&aacute; disponible al p&uacute;blico.</p>
                <?php if ($tplDetalle['COMPLEMENTO']) { ?> 

                    <p><b><i class="far fa-eye"></i> Para mejores resultados te recomendamos <a href="/complementos/<?=$tplDetalle['ID'];?>">Agregar Filtros</a> (opcional)</b>.</p>

                <?php } else { ?> 

                    <p>Puedes continuar <a href="/publicar">publicando aqu&iacute;</a>.</p>

                <?php }  ?> 
            <hr>
            <p class="mb-0">Si necesitas alguna ayuda adicional solicita <a href="/soporte">Soporte</a>.</p>
        </div>        

        <?php } ?>

        <div class="product-grid">

            <!--Bradcomb-->
            <nav class="breadcrumb-wrap">

                <ul class="breadcrumb indigo lighten-4">

                    <?php foreach (Config::$arrBreadcrumb as $key => $value) {?>

                        <li class="breadcrumb-item"><?=$value;?></li>
                        
                    <?php } ?>        
                                
                    <li class="breadcrumb-item"><b><?=($tplDetalle['LISTA'] == 'L') ? "Publicado" : "Actualizado";?> <?=$tplDetalle['PUBLICADOF'];?></b></li>
                    <li class="breadcrumb-item"><b>ID <?=$tplDetalle['ID'];?></b></li>

                </ul>

            </nav>	
            
            

            <div class="product-columns flex">
                
				<!--Imagenes & Description(COLUMNA IZQUIERDA)-->
				
                <div class="left-product-column">
                    <!--productos imagenes-->
                    <div id="indicadorcarusel" class="carousel slide" data-ride="carousel">

						<ol class="carousel-indicators">

							<?php 
							// indicadores
							for ($i=0;$i < count($tplDetalle['FOTOS']); $i++) { ?>
								<li data-target="#indicadorcarusel" data-slide-to="<?=$i;?>" <?=($i==0) ? "class=\"active\"" : "";?>></li>
							<?php } ?>						

						</ol>

						<div class="carousel-inner">

                            <?php foreach ($tplDetalle['FOTOS'] as $k => $foto) { ?>
                                
								<div class="carousel-item <?=($k == 0) ? "active" : "";?>">
                                    <?php if ($tplDetalle['ESTATUS'] == 'V') { ?>
                                        <div class="card-tagv tag-V tag-VD"></div>
                                    <?php } ?>

									<img class="d-block w-100" src="<?=Config::$cdnimagenes;?>/f/<?=$foto;?>" alt="<?=$tplDetalle['ARTICULO'];?> Foto <?=$foto;?>">
                                </div>
                                
							<?php } ?>

						</div>
						<a class="carousel-control-prev" href="#indicadorcarusel" role="button" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="sr-only">Anterior</span>
						</a>
						<a class="carousel-control-next" href="#indicadorcarusel" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Pr&oacute;ximo</span>
						</a>
                    </div>

                    

                    <!--botones-social-->
                    <!-- botones opciones y redes  -->
                    <div class="social-buttons" >
                        <ul class="list-unstyled flex">
                            
                            <li><a href="https://www.facebook.com/sharer.php?u=https://lapulga.com.do/?id=<?=$tplDetalle['ID'];?>&tag=redcompfb" target="_blank" class="social facebook"><i class="fa fa-facebook"></i></a></li>

                            <li><a href="http://twitter.com/intent/tweet?text=<?=$tplDetalle['ARTICULO'];?>&amp;url=https://lapulga.com.do/?id=<?=$tplDetalle['ID'];?>&tag=redcomptw" target="_blank" class="social twitter"><i class="fa fa-twitter"></i></a></li>

                            <li><a href="https://wa.me/?text=<?=urlencode("https://www.lapulga.com.do/?id={$tplDetalle['ID']}");?>" target="_blank" class="social whatsapp"><i class="fa fa-whatsapp"></i></a></li>

                        </ul>
                    </div>

                    <?php if ((Config::$tipoMovil == "computer") or (Config::$tipoMovil == "tablet")) { ?>
					<!--producto-descripcion version desktop -->
					
                        <h2 class="product-title">Descripcion Detallada</h2>

                        <div class="description">

                        <?=!strpos($tplDetalle['DESCRIPCION'], ' ') ? wordwrap($tplDetalle['DESCRIPCION'], (Config::$tipoMovil == "computer") ? 70 : 40, "<br>", true) : $tplDetalle['DESCRIPCION'];?>

                        </div>
                    
                    <?php } ?>
					
                </div><!--producto-precio(FINAL COLUMNA IZQUIERDA)-->

                <!--producto-precio(COLUMNA DERECHA)-->
                <div class="right-product-column">	
                    <?php 
                        // este titulo solo es validado para tablet el resto va con 25 caracteres para textos sin espacios
                    ?>
                    <h1 class="product-title"><?=!strpos($tplDetalle['ARTICULO'], ' ') ? wordwrap($tplDetalle['ARTICULO'], (Config::$tipoMovil == 'tablet') ? 16 : 25, "<br>", true) : $tplDetalle['ARTICULO'];?></h1>
                    
					<div class="price-tag">

                    <?=$precioIni;?> <?=$precio1;?> <s class="text-muted text-small"><?=$precio2;?></s>
						
					</div>
					
                    <div class="product-details">

                        <div class="table">		
                            
                            <?php foreach ($tplDetalle['DATOSUSU'] as $arrCampo => $arrValor) { 
                                // no mostrar telefono en movil solo boton marcar
                                if ((Config::$esMovil) and ($arrCampo == 'telefono')) continue;                                
                            ?>
                                
                                <div class="row flex">
                                    <div class="left-cells"><?=$arrValor['label'];?></div>
                                    <div class="right-cells"><?=$arrValor['valor'];?></div>
                                </div>

                            <?php } 
                            if ($tplDetalle['TIPOCOMP'] == 'VE') {
                                foreach ($tplDetalle['DATOSPUB'] as $arrCampo => $arrValor) { 
                                    // no mostrar telefono en movil solo boton marcar
                                    if ((Config::$esMovil) and ($arrCampo == 'telefono')) continue;                                
                                ?>
                                    
                                    <div class="row flex">
                                        <div class="left-cells"><?=$arrValor['label'];?></div>
                                        <div class="right-cells"><?=$arrValor['valor'];?></div>
                                    </div>

                            <?php } } ?>

                            

                        </div>
                        
                    </div>
                    <!--enlaces-util-->
                    <div class="useful-links flex">
                        <?php if ($tplDetalle['URLVIDEO'] != "") { ?>
                        <div class="useful-link" role="group" >
                            <a href="javascript:;" title="Ver video de esta publicacion" class=" bg-primary text-white verVideo" id="<?=$tplDetalle['VIDEO'];?>"><i class="fab fa-youtube fa-lg fa-fw"></i> Ver video</a>
                        </div>
                        <?php } ?>
                        <?php if ($tplDetalle['ESTATUS'] == 'V') { ?>
                        <div class="useful-link" role="group" >
                            <a href="javascript:;" title="Publicacione marcada como VENDIDO" class=" bg-warning"><i class="fas fa-dollar-sign fa-lg fa-fw"></i> Marcada como VENDID@</a>
                        </div>
                        <?php } ?>
                        <div class="useful-link" role="group" >
                            <a href="javascript:;" title="Recomendaciones que te damos a la hora de comprar o vender" class="morecomendaciones bg-warning"><i class="fas fa-exclamation-triangle fa-lg fa-fw"></i> Medidas de Precauci&oacute;n</a>
                        </div>
                        <?php if ($_SESSION['lp_uid'] != $tplDetalle['USUARIO_ID']) { ?>
                            <div class="useful-link" role="group" >
                                <a href="javascript:;" id="btnklkmsgr" data-url="<?=$_SERVER['REQUEST_URI'];?>" data-logueado="<?=(Config::$usuLogueado) ? "S" : "N";?>" class="text-white bg-success" title=""><i class="fa fa-whatsapp fa-lg fa-fw"></i> Contacta v&iacute;a KLK Messenger</a>
                            
                            </div>
                            <div id="bloqueklk">
                                <?php include("view/frmklkmessenger.tpl"); ?>
                            </div>
                        <?php
                        }
                        ?>
                        <div class="useful-link" role="group" >
                            <a href="javascript:;" id="<?="{$tplDetalle['ID']}_{$tplDetalle['TELEFONOWS']}_{$tplDetalle['MENSAJEWS']}";?>" class="text-white bg-success momsgarticulo" title=""><i class="fa fa-whatsapp fa-lg fa-fw"></i> Contacta por WhatsApp</a>
                        </div>
                        <?php if (Config::$esMovil) { ?>

                            <div class="useful-link" role="group" >
                                <a href="tel:<?=$tplDetalle['TELEFONOWS'];?>" class="text-white bg-success" title=""><i class="fa fa-phone fa-lg fa-fw"></i> Llamar a <?=Funciones::verTelefono($tplDetalle['USU']['TELEFONO1'],"t1");?></a>
                            </div>

                            <?php if ($tplDetalle['USU']['TELEFONO2'] != "") { ?>

                                <div class="useful-link" role="group" >
                                    <a href="tel:<?=$tplDetalle['USU']['TELEFONO2'];?>" id="" class="text-white bg-success" title=""><i class="fa fa-phone fa-lg fa-fw"></i> Llamar a <?=Funciones::verTelefono($tplDetalle['USU']['TELEFONO2'],"t2");?></a>
                                </div>

                            <?php } ?>

                        <?php } ?>
                        
                        <div class="useful-link" role="group" >
                            <a href="<?=$tplDetalle['URLMAS'];?>" class="text-white bg-info" title=""><i class="fa fa-list fa-lg fa-fw"></i> Más publicaciones <span class="badge badge-pill badge-dark"><?=$tplDetalle['USU']['PUBLICACIONES'];?></span></a>
                        </div>
                        <div class="useful-link" role="group" >
                            <a href="<?=(Config::$usuLogueado) ? "javascript:;" : "/login/publicacion_{$tplDetalle['ID']}.html";?>" id="<?="{$tplDetalle['ID']}_FA";?>" class="text-white bg-secondary <?=(Config::$usuLogueado) ? "fav" : "nofav";?>" title=""><i class="fas fa-heart fa-lg fa-fw"></i> Poner en Favoritas</a>
                        </div>

                        <div class="useful-link" role="group" >
                            <a href="javascript:;" title="Compartir via codigo QR" class="moqrcodigo text-white bg-info"><i class="fas fa-qrcode fa-lg fa-fw"></i> Compartir con QR</a>
                        </div>                        

                        <div class="useful-link" role="group" >
                            <a href="/soporte?ai=rp&pub=<?=urlencode($_SERVER['REQUEST_URI']);?>" class="text-white bg-secondary" title=""><i class="fas fa-thumbs-down fa-lg fa-fw"></i> Reportar a la Pulga</a>
                        </div>
                    </div>
                    
                    <?php if (Config::$esMovil and (Config::$tipoMovil == 'phone')) { ?>
                        <!--producto-descripcion version movil -->
                        
                        <h2>Descripcion Detallada</h2>

                        <div class="description">

                            <?=!strpos($tplDetalle['DESCRIPCION'], ' ') ? wordwrap($tplDetalle['DESCRIPCION'], 30, "<br>", true) : $tplDetalle['DESCRIPCION'];?>

                        </div>
                    
                    <?php } ?>
                                 
                </div><!--producto-precio(FINAL COLUMNA DERECHA)-->

            </div><!--final product columns-->	

        </div><!--product-grid(fin)-->

    <?php } else { ?>

        <div class="alert alert-warning" role="alert">
            <h4 class="alert-heading"><?=Config::$tituloPagina;?></h4>
                <p>Esta publicaci&oacute;n no est&aacute; disponible, esta pendiente de aprobaci&oacute;n o no existe, favor ver opciones mas abajo o retornar en unos minutos.</p>
            <hr>
            <p class="mb-0">Si necesitas alguna ayuda adicional o deseas reportar esta publicaci&oacute;n usa este enlace <a href="/soporte">https://www.lapulga.com.do/soporte</a>.</p>
        </div>        

    <?php } ?>

    <!--adbanner-->

    <div class="container-custom">

        <div class="rst-banner"><?=Config::$lpbListado_1;?></div>

    </div>

    <!--adbanner-->    

    <!--Publicaciones Relacionadas-->
    <?php if (isset($tplDetalle['RELACIONADAS'])) { ?>
        
        
        <div class="publicaciones-relacionadas-grid">
            
        <hr>
        
            <h2 class="product-title">Publicaciones Relacionadas</h2>

            <div class="flex cards">
                <?php 
                    
                    $arrRegistros = $tplDetalle['RELACIONADAS'];
                    include("view/cards.tpl");

                ?>
            </div><!--cards row-->
            
            <div class="publicaciones-recientes publicaciones-relacionadas">
            
                <a href="<?=$tplDetalle['URLRELACIONADAS'];?>" class="btn btn-primary btn-lg btn-block active" role="button" aria-pressed="true"><i class="fa fa-list fa-lg" aria-hidden="true"></i>&nbsp;  Ver todas las relacionadas</a>

            </div>
            
        </div><!--publicaciones relacionadas (fin)-->

    <?php } 
    
        // modal recomendciones
        include("view/morecomendaciones.tpl");
        include("view/movideo.tpl");
      
        include("view/momsgarticulo.tpl");
    
    ?>

</div>