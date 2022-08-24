<link rel="stylesheet" href="/css/filer.css" >
<style>
#fotos {
	display: block !important;
	right: 1px;
	top: 1px;
	height: 34px;
    width: 100%;
    opacity: 0;
	background: none;
	position: absolute;
    overflow: hidden;
    z-index: 2;
}

.control-fileupload {
	display: block;
	border: 1px solid #d6d7d6;
	background: #FFF;
	border-radius: 4px;
	width: 100%;
	height: 45px;
	line-height: 45px;
	padding: 0px 10px 2px 10px;
    overflow: hidden;
    position: relative;
    margin-bottom: 3px;
}
 </style>


<form action="/publicar" class="form-horizontal" method="post" id="frmpublicar" enctype="multipart/form-data">
        <div class="panel panel-default ">
            <div class="panel-heading">
                <h3><?=$tituloaccion;?> Publicación</h3>
            </div>
            <div class="panel-body">
            <noscript><h2>Estimado usuario, debes habilitar el javascript para poder usar este formulario</h2></noscript>
            <?=($eshtml) ? balert("alert_warning","Descripci&oacute;n con Formato","Estimado {$_SESSION['lp_nombre']} esta publicacion fue creada con un editor para formatos.  Si modificas se perder&aacute;n dichos formatos y la descripci&oacute;n quedar&aacute; solo con el texto.  Deseas tener el editor? <a href='/planes'>click aqu&iacute</a>.  Equipo LP.") : "";?>
            <?=$tplmensaje;?>
            <h5><strong>Recuerda no repetir, <a href="javascript:;" onclick="$('#msugerenciaspub').modal();" >ver sugerencias.</a></strong></span></h5>
            <hr />
                <?php	if (isset($_GET['msgp'])) {?>
                <input type="hidden" name="msgp" value="S" />
                <?php } ?>
                <?=camposAnteriores($arrPublicar);?>
                <?=campospambot();?>
                <input type="hidden" name="datoscategoria" id="datoscategoria" value="<?=isset($arrPublicar['tipocomp']) ? $arrPublicar['tipocomp'] : "";?>" />
                <input type="hidden" name="uid" id="uid" value="<?=isset($_SESSION['lp_uid']) ? $_SESSION['lp_uid'] : 0;?>" />
                <input type="hidden" name="ssid" id="ssid" value="<?=isset($_SESSION['lp_session']) ? $_SESSION['lp_session'] : 0;?>" />
                <input type="hidden" name="pines" id="pines" value="<?=isset($_SESSION['lp_pines']) ? $_SESSION['lp_pines'] : 0;?>" />
                <!--Categorias-->
                <div  class="form-group">
                    <label class="col-sm-2 control-label" for="categoria">Categor&iacute;a.:</label>
                    <div class="col-sm-6">
                        <select  class="form-control" name="categoria" id="categoria" >
                            <option value="" selected>Seleccione</option>
                            <optgroup label="Empleos" >
                                <option value="7-240" <?=isset($arrPublicar['categoria']) and ($arrPublicar['categoria'] == "7-240") ? "selected" : "";?>>Oferta de Empleo (Empresas)</option>
                                <option value="7-168" <?=isset($arrPublicar['categoria']) and ($arrPublicar['categoria'] == "7-168") ? "selected" : "";?>>Solicitud de Empleo (Cantidatos)</option>
                            </optgroup>
                            <!-- <optgroup label="Servicios" >
                                <option value="S">Publicación de Servicios Varios</option>
                            </optgroup> -->
                            <?=$publicar->selectCategorias();?>
                        </select>
                    </div>
                </div>
                <!--Campos para cada categoria-->
    
                    <div class="form-group add hide s_CE s_VE">
                        <label for="marca" class="col-sm-2 control-label col-sm-offset-2">Marca.: </label>
                        <div class="col-sm-4">
                            <select  class="form-control" name="marca" id="marca">
                                <option value="">Seleccione</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group add hide s_CE s_VE">
                        <label for="modelo" class="col-sm-2 control-label col-sm-offset-2">Modelo.: </label>
                        <div class="col-sm-4">
                            <select  class="form-control" name="modelo" id="modelo">
                                <option value="">Seleccione</option>
                            </select>
                        </div>
                    </div>
    
    
                    <div class="form-group add hide s_VE">
                        <label for="anio" class="col-sm-2 control-label col-sm-offset-2">Año.:</label>
                        <div class="col-sm-3">
                            <select name="anio" id="anio" class="form-control">
                                <option value="" selected>Seleccione</option>
                                <?php	for($i = date("Y"); $i >= 1950; $i--) { ?>
                                    <option value="<?=$i;?>"><?=$i;?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group add hide s_VE">
                        <label for="combustible" class="col-sm-2 control-label col-sm-offset-2">Combustible.:</label>
                        <div class="col-sm-3">
                            <select name="combustible" id="combustible" class="form-control">
                                <option value="" selected>Seleccione</option>
                                <?php	foreach($arrCombustible as $k => $v) { ?>
                                    <option value="<?=$k;?>"><?=$v;?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group add hide s_go">
                        <label for="gomaaro" class="col-sm-2 control-label" id="lblgoma"></label>
                        <div class="col-sm-3">
                            <input name="gomaaro" id="gomaaro" class="form-control ttb" title="<?=$tplformatoga;?>"/>
                        </div>
                    </div>
            <!--campos s_IN-->
                    <div class="form-group add s_IN s_in-ap s_in-app s_in-sfm hide">
                        <label for="brprovincia" class="col-sm-2 control-label col-sm-offset-2">Provincia.:</label>
                        <div class="col-sm-4">
                            <select name="brprovincia" id="brprovincia" class="form-control" >
                                <option value="" selected>Seleccione</option>
                                <?php foreach ($arrProvincias as $k => $v) { echo "<option value='$k'>" . $v . "</option>\n";
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group add s_IN s_in-ap s_in-app s_in-sfm hide">
                        <label for="brsector" class="col-sm-2 control-label col-sm-offset-2">Sector.:</label>
                        <div class="col-sm-4">
                            <select name="sector" id="brsector" class="form-control" >
                                <option value="" selected>Primero seleccione provincia</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group add s_IN s_in-app hide">
                        <label for="habitaciones" class="col-sm-2 control-label col-sm-offset-2">Habitaciones.:</label>
                        <div class="col-sm-3">
                            <select name="habitaciones" id="habitaciones" class="form-control" >
                                 <option value="" selected>Seleccione</option>
                                 <?php
                                     $optionsel = "";
                                     for($i = 1;$i < 8;$i++) {
                                             //label para el option de los banios Ej.: 1 banio, 2 banios,...
                                             $optionsel .= "<option value=\"$i\"";
                                             $optionsel .= $arrPublicar['habitaciones'] == $i ? "selected=\"selected\"" : "";
                                             $optionsel .= ">$i</option>";
                                     }
                                     echo $optionsel;
                                    ?>
                                    <option value="99">Mas de 7 Habitaciones</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group add s_IN s_in-app hide">
                        <label for="banos" class="col-sm-2 control-label col-sm-offset-2">Baños</label>
                        <div class="col-sm-3">
                            <select name="banos" id="banos" class="form-control" >
                                 <option value="">Seleccione</option>
                                 <?php
                                     $optionsel = "";
                                     for($i = 1;$i < 8;$i++) {
                                             //label para el option de los banios Ej.: 1 banio, 2 banios,...
                                             $optionsel .= "<option value=\"$i\"";
                                             $optionsel .= $arrPublicar['banos'] == $i ? "selected=\"selected\"" : "";
                                             $optionsel .= ">$i</option>";
                                     }
                                     echo $optionsel;
                                    ?>
                                    <option value="99">Mas de 7 Baños</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group add s_IN s_in-app hide">
                        <label for="parqueos" class="col-sm-2 control-label col-sm-offset-2">Parqueos.:</label>
                        <div class="col-sm-3">
                            <select name="parqueos" id="parqueos" class="form-control" >
                                 <option value="" selected>Seleccione</option>
                                 <?php
                                     $optionsel = "";
                                     for($i = 0;$i < 8;$i++) {
                                             //label para el option de los banios Ej.: 1 banio, 2 banios,...
                                             $optionsel .= "<option value=\"$i\"";
                                             $optionsel .= $arrPublicar['parqueos'] == $i ? "selected=\"selected\"" : "";
                                             $optionsel .= ">$i</option>";
                                     }
                                     echo $optionsel;
                                    ?>
                                     <option value="99">Mas de 7 Parqueos</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group add s_IN s_in-app hide">
                        <label for="mconstruidos" class="col-sm-3 control-label col-sm-offset-1">Metros ^2 Construidos.:</label>
                        <div class="col-sm-3">
                            <select name="mconstruidos" id="mconstruidos" class="form-control" >
                                 <option value="" selected>Seleccione</option>
                                 <?php
                                     $optionsel = "";
                                     foreach($arrMconstruidos as $k => $v) {
                                             $optionsel .= "<option value=\"$k\"";
                                             $optionsel .= $arrPublicar['mconstruidos'] == $k ? "selected=\"selected\"" : "";
                                             $optionsel .= ">de $v</option>";
                                     }
                                     echo $optionsel;
                                    ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group add s_IN hide"  >
                        <label for="mterreno" class="col-sm-3 control-label col-sm-offset-1">Metros ^2 Terreno.:</label>
                        <div class="col-sm-3">
                            <select name="mterreno" id="mterreno" class="form-control" >
                                 <option value="" selected>Seleccione</option>
                                 <?php
                                     $optionsel = "";
                                     foreach($arrMterreno as $k => $v) {
                                             $optionsel .= "<option value=\"$k\"";
                                             $optionsel .= $arrPublicar['mterreno'] == $k ? "selected=\"selected\"" : "";
                                             $optionsel .= ">de $v</option>";
                                     }
                                     echo $optionsel;
                                    ?>
                            </select>
                        </div>
                    </div>
                <!--fin campos s_IN-->
                <!--Radios Tipo-->
                <div  class="form-group add hide s_IN s_in-sfm s_in-app s_in-ap s_VE">
                    <label class="col-sm-2 control-label ">Tipo.:</label>
                    <div class="col-sm-9">
                        <div class="radio" id="tipo">
                            <label  for="venta">
                                <input type="radio" name="tipo"  id="venta" value="V" checked>Venta
                            </label>&nbsp;&nbsp;
                            <label for="compra">
                                <input  type="radio" name="tipo"  id="compra"  value="C">Compra
                            </label>
                            <label  for="alquiler">
                                <input  type="radio" name="tipo"  id="alquiler" value="A">Alquiler
                            </label>
                            <label  for="empleo" style="display:none;">
                                <input  type="radio" name="tipo"  id="empleo" value="E" style="display:none;">Empleo
                            </label>
                        </div>
                    </div>
                </div>
                <div  class="form-group"  id="condicion">
                    <label class="col-sm-2 control-label" for="condicion">Condici&oacute;n.:</label>
                    <div class="col-sm-9">
                        <div class="radio">
                            <label for="nuevo">
                                <input type="radio" name="condicion" id="nuevo" value="1" checked>Nuevo
                            </label>
                            <label for="usado">
                                <input type="radio" name="condicion" id="usado" value="2">Usado
                            </label>
                            <label for="renovado">
                                <input type="radio" name="condicion" id="renovado" value="3">Renovado</label>
                        </div>
                    </div>
                </div>
                <div  class="form-group">
                    <label class="col-sm-2 control-label" for="articulo">T&iacute;tulo.:</label>
                    <div class="col-sm-9">
                        <input maxlength="70" name="articulo" id="articulo" value="<?=$arrPublicar['articulo']?>" class="form-control" type="text" >
                    </div>
                </div>
                <div  class="form-group hide"  id="moneda">
                    <label class="col-sm-2 control-label" for="precio"><span id="lblprecio">Precio.:</span></label>
                    <div class="col-sm-3">
                        <input class="form-control ttb " title="Recomendacion <br/> No es necesario agrega puntos (.) o comas (,) al precio, el sistema lo hace por ti." type="number"  name="precio" id="precio"  >
                    </div>
                    <div class="col-sm-3 col-xs-12">
                        <div class="radio">
                            <label for="peso">
                                <input type="radio" name="moneda" id="peso" value="R" checked>RD$
                            </label>
                            <label for="dolar">
                                <input type="radio" name="moneda" id="dolar" value="U">US$
                            </label>
                        </div>
                    </div>
                </div>
                <div  class="form-group">
                    <label class="col-sm-2 control-label"  for="descripcion">Descipci&oacute;n.:</label>
                    <div class="col-sm-9">
                        <textarea class="form-control" name="descripcion" id="descripcion" rows="5" ></textarea>
                    <label class="text-danger hide"> <span id="caracteress">1000</span>&nbsp;<span>Carácteres Máximo</span></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="urlvideo" class="col-sm-2 control-label">Video.:</label>
                        <div class="col-sm-6">
                            <input class="form-control tt" name="urlvideo" id="urlvideo" title="Este campo es opcional por si tienes un video de YouTube">
                        </div>
                        <div class="col-sm-4">
                            <span><a href="http://www.youtube.com" target="_blank" class="youtube" id="lnkyoutube"><strong style="line-height: 34px;">Buscar en YouTube</strong></a></span>
    
                        </div>
                </div>
    
                <div class="form-group">
                    
                    <label class="col-sm-2 control-label" for="fotos">Foto(s).:</label>
                    <div class="col-sm-9">
                        
                        <span class="control-fileupload tt" title="Selecciona multiples de fotos en caso de ser mas de 1">
                            <label for="fotos" id="lblfotos"><i class="fa fa-upload" aria-hidden="true"></i> Selecciona de 1 a <?=$arrCantFotosXPlan[$plan];?> fotos.</label>
                            <input name="fotos[]" type="file" id="fotos"  multiple="multiple" accept=".jpg, .jpeg, .png" data-cantidad="<?=$arrCantFotosXPlan[$plan];?>"  >
                        </span>
                       
                        <div class="jFiler-items jFiler-row">
                            <ul class="jFiler-items-list jFiler-items-grid" id="preview"></ul>                            
                        </div>
                        
                    </div>
                    
                </div>
                <?php if (isset($_SESSION['lp_uid'])) { ?>
                <h4 class="azul">Destaca tu publicacion &dArr; &dArr; &dArr; <span class="rojo">(No es obligatorio).</span></h4>
                <div class="form-group">
                    <label for="opcional" class="col-sm-2 control-label">Resaltar.:</label>
                    <div class="col-sm-6">
                        <select name="opcional" size="1" id="opcional" class="cmbformularios form-control">
                            <option value="N"><?=($hasta != "") ? $hasta : "Seleccione (opcional)"; ?></option>
                            <option value ="1"><?=$adicionar . $diasopcional;?> Dias - 1 PIN</option>
                            <option value ="2"><?=$adicionar . ($diasopcional*2);?> Dias - 2 PINES</option>
                            <option value ="3"><?=$adicionar . ($diasopcional*3);?> Dias - 3 PINES</option>
                            <option value ="4"><?=$adicionar . ($diasopcional*4);?> Dias - 4 PINES</option>
                            <option value ="5"><?=$adicionar . ($diasopcional*5);?> Dias - 5 PINES</option>
                            <option value ="MI">Mas informaci&oacute;n y ejemplo uso pines</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="vip" class="col-sm-2 control-label">Colocar VIP.:</label>
                    <div class="col-sm-<?=($hastavip=="") ? "6" : "9";?>">
                        <select name="vip" size="1" id="vip" class="cmbformularios form-control">
                            <option value="N"><?=($hastavip != "") ? $hastavip : "Seleccione (requiere foto)"; ?></option>
                            <option value="V">1 Dia en pagina principal = 1 PIN</option>
                            <option value="VC">2 Dias en seccion categoria = 1 PIN</option>
                            <option value="VVC">1 pagina principal y 2 seccion categoria = 2 PINES</option>
                            <option value ="MI">Mas informacion y ejemplo uso pines</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-12 flexr flexw flexbt">
                    <span><strong style="line-height: 34px;"><a href="javascript:;" onclick="$('#mresaltar').modal();" target="_blank">¿Qu&eacute; son resaltados?</a></strong></span>
                    <span><strong style="line-height: 34px;"><a href="javascript:;" onclick="$('#mvip').modal();" target="_blank">¿Dónde están los VIP?</a></strong></span>
                    <span><strong style="line-height: 34px;"><a style="color:rgba(0,0,0,.7);" href="/pines" target="_blank" id="lnkpines">Balance.: <span id="balancepines" <?=($_SESSION['lp_pines'] == 0) ? "class='rojo'" : '';?>><?=$_SESSION['lp_pines'];?></span> Pines, agregar?</a></strong></span>
                </div>				
                <?php } ?>
            </div>
        </div>
        <?php if (!isset($_SESSION['lp_uid'])) { ?>
        <div class="panel panel-default ">
            <div class="panel-heading">
                <h3>Crea cuenta nueva o <a href="/login">accede a existente</a></h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Correo.:</label>
                    <div class="col-sm-6">
                        <input name="email" class="form-control" id="email" size="50" value="" maxlength="60" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="nombre" class="col-sm-2 control-label">Nombre.:</label>
                    <div class="col-sm-6">
                        <input name="nombrecompleto" type="text" class="maskalpha form-control" id="nombre" maxlength="45" size="50" value=""  />
                    </div>
                </div>
                <div id="camposclave" class="hide">
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">Clave.:</label>
                        <div class="col-sm-6">
                            <input name="password" class="form-control"  type="password" id="password"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password2" class="col-sm-2 control-label">Confirmar.:</label>
                        <div class="col-sm-6">
                            <input name="password2" class="form-control"  type="password" id="password2"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="telefono1" class="col-sm-2 control-label">Telefono.:</label>
                    <div class="col-sm-3">
                        <input name="telefono1" type="tel" class="masktel form-control" id="telefono1"  />
                    </div>
                    <div class="col-sm-3">
                        <div class="checkbox">
                            <label for="whatsapp">
                                <input name="whatsapp" type="checkbox" id="whatsapp" value="S" />&nbsp;<strong class="text-success">WhatsApp</strong>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="provincia" class="col-sm-2 control-label">Provincia.:</label>
                    <div class="col-sm-6">
                        <select name="provincia" size="1" id="provincia" class="cmbformularios form-control" >
                            <option value="">Seleccione</option>
                            <?php foreach ($arrProvincias as $k => $v) { echo "<option value='$k'>" . utf8_encode($v) . "</option>\n";
                            } ?>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
        <div class="form-group">
            <div class="col-sm-6 col-sm-offset-2">
            <input name="Publicar" type="submit" id="Publicar" value="Publicar" class="btn btn-success btn-lg" />
            <input name="Cancelar" type="button" value="Cancelar" class="btn btn-success btn-lg" onclick="location.href='/';" />
            <span id="llenar">*Completar campos</span>
            </div>
        </div>
    </form>
