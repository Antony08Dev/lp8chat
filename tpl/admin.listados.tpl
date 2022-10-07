<style>
td {
	position: relative;
}
td label {
	position: absolute;
	left:0px;
	top:0px;
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
<script>
$(document).ready( function() { 
	$("td label").click(function() {
		var checkbox = $(this).children('input[type=checkbox]').prop("checked");
		if ( checkbox ) {
			$(this).closest('tr').addClass("danger");
		} else {
			$(this).closest('tr').removeClass("danger");
		}
	});
	// listado de historial de publicaciones en admin perfilusuario
	
});
</script>
<!--Agregar $tplruta-->
<div class="row">
	<!--cuando sea desktop este div debe tener la clase bflex-->
	<div class="<?=($esmovil == false) ? 'bflex' : ''; ?>">
		<!--de manera condicionada cuando sea desktop a este div se le pone el id colizq-->
		<div id="<?=($esmovil == false) ? 'colizq' : ''; ?>"  class="col-md-3 col-xs-12 item">
			<?php if (($lista->tipolistado == 'adusu') or (($lista->tipolistado == 'adperusu') and !empty($lista->uid)) or ($lista->tipolistado == 'adcrm') or ($lista->tipolistado == 'adlp') or ($lista->tipolistado == 'adklk')) { 
			// determina la accion para busqueda solo estos muestran buscador
			switch ($lista->tipolistado) {
				case 'adusu':
				case 'adperusu':
				case 'adcrm':
				case 'adlp':
					$accion = "/admin.usuarios";
					break;
				case 'adklk':
					$accion = "/admin.klk";
					break;
			}
			?>
			<div id="buscador-izq">
				<form action="<?=$accion;?>" method="get" name="frm" id="frm" class="form-horizontal">
					<div class="input-group col-md-12">
						<input type="text" name="q" id="q" class="campo-buscador-izq form-control" placeholder="Buscar por: Usuario, email o telefono" value="<?=$lista->q;?>" />
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<span class="fa fa-search"></span>
							</button>
						</span>
					</div>
				</form>
			</div>
			<?php } ?>		
			<?=$tplcolizq?>	
		</div>
		<div class="col-md-10 col-xs-12 item <?php echo ($esmovil) ? "mtop" : ""; ?>">
			<div class="lpub bgblanco">
				<div class="borden pull-left">
					<h3 class="tbloque pull-left"><?= $tpltitulolistado; ?> </h3>
					<!-- INICIO ORDENA POR -->
					<?php if ($tplordena) { /* condiciona si lleva ordena o no */ ?>
					<select name="ordenpub" onchange="location.href=this.value;">
						<option selected="selected" disabled="disabled">Ordena por</option>
						<?php if ($lista->tipolistado == "bus") { ?>
						<optgroup label="Relacionada">
							<option value="<?=$tplurlordena;?>&fld=re&orde=desc" <?=(isset($_GET['fld']) and ($_GET['fld'] === 're') and ($_GET['orde'] === 'desc')) ? " Selected" : "";?>>M&aacute;s</option>
							<option value="<?=$tplurlordena;?>&fld=re&orde=asc" <?=(isset($_GET['fld']) and ($_GET['fld'] === 're') and ($_GET['orde'] === 'asc')) ? " Selected" : "";?>>Menos</option>
						</optgroup>
						<?php }	?>
						<optgroup label="Fecha">
							<option value="<?=$tplurlordena;?>&fld=fe&orde=asc" <?=(isset($_GET['fld']) and ($_GET['fld'] === 'fe') and ($_GET['orde'] === 'asc')) ? " Selected" : "";?>>Fecha vieja</option>
							<option value="<?=$tplurlordena;?>&fld=fe&orde=desc"  <?=(isset($_GET['fld']) and ($_GET['fld'] === 'fe') and ($_GET['orde'] === 'desc')) ? " Selected" : "";?>>Fecha reciente</option>
						</optgroup>
						<optgroup label="Precio">
							<option value="<?=$tplurlordena;?>&fld=pe&orde=asc"  <?=(isset($_GET['fld']) and ($_GET['fld'] === 'pe') and ($_GET['orde'] === 'asc')) ? " Selected" : "";?>>Baratos</option>
							<option value="<?=$tplurlordena;?>&fld=pe&orde=desc"  <?=(isset($_GET['fld']) and ($_GET['fld'] === 'pe') and ($_GET['orde'] === 'desc')) ? " Selected" : "";?>>Caros</option>
						</optgroup>
					</select>
					<!-- FIN ORDENA POR -->
					<?php }	?>
				</div>
				<?php 
				// encabezado de listados
				switch($lista->seccion) {
					// usuario
					case  99:
						echo $tpllistado;
					break;
					case 100:
					?>
						<div class="table table-responsive">
							<table class='table table-bordered table-striped table-hover'>
								<tr align='center'>
									<th>ID</th>
									<th class='col-md-4'>Nombre (publicaciones)<br>Email (pines)<br>Usuario (plan)</th>
									<th width='15%'>Teléfonos</th>
									<th class='col-md-2'>Creada<br>Login<br>Activaci&oacute;n</th>
									<th>Municipio<br>Provincia<br>Direccion IP</th>
									<th>Acciones</th>
								</tr>					
								<?=$tpllistado;?>
							</table>
						</div>
					<?php
						// lista las categorias master para replicar en select para cada form
						// echo "<select  class=\"hide\" name=\"categoria_master\" id=\"categoria_master\" >";
						// echo $lista->selectCategorias();
						// echo "</select>";
						echo "entra";
						echo $tpllistado;
					break;
					case 101: ?>
						<div class="table table-responsive">
							<table class='table table-bordered table-striped table-hover'>
								<tr align='center'>
									<th>ID</th>
									<th class='col-md-4'>Nombre (publicaciones)<br>Email (pines)<br>Usuario (plan)</th>
									<th width='15%'>Teléfonos</th>
									<th class='col-md-2'>Creada<br>Login<br>Activado</th>
									<th>Municipio<br>Provincia<br>Direccion IP</th>
									<th>Acciones</th>
								</tr>					
								<?=$tpllistado;?>
							</table>
						</div>
					<?php
					break;
					// admin solicitud productos
					case 103:
						include("tpl/frmproductos.tpl");
					break;
					//    usuario
					case 1011:
						// si fue encontrado o no el usuario
						
						if (!isset($lista->Usuario['ID'])) die($tpllistado); 
					?>
					<ul class="ulcol col3 borderb" id="adperusu1">
						<li>
							<b>Nombre.: </b><?=$lista->Usuario['NOMBRE'];?>
						</li>
						<li>
							<b>Email.: </b><a href="mailto:<?=$lista->Usuario['EMAIL'];?>;<?=$lista->Usuario['EMAILS'];?>"><?=$lista->Usuario['EMAIL'];?></a> | <a href="/admin.perfilusuario?uid=<?=$lista->Usuario['ID'];?>&tipo=modificaUsuEmail" >M</a>
					
						</li>
						<li>
							<b>Telefono(s).: </b>
							<a target="<?=$targetus;?>" href="<?=$targetus;?>?q=<?=$lista->Usuario['TELEFONO1'];?>"><?=$lista->Usuario['TELEFONO1'];?></a>, 
							<a target="<?=$targetus;?>" href="<?=$targetus;?>?q=<?=$lista->Usuario['TELEFONO2'];?>"><?=$lista->Usuario['TELEFONO2'];?></a>, 
							<a target="<?=$targetus;?>" href="<?=$targetus;?>?q=<?=$lista->Usuario['TELEFONO3'];?>"><?=$lista->Usuario['TELEFONO3'];?></a>
						</li>
						<li>
							<b>Provincia.: </b><?=$arrProvincias[$lista->Usuario['PROVINCIA']];?>
						</li>
						<li>
							<b>Dirección.: </b><?=$lista->Usuario['DIRECCION'];?>
						</li>
						<li>
							<b>Usu Creada.: </b><?=$lista->Usuario['CREADAF'];?>
						</li>
						<li>
							<b>Usu Login.: </b><a href="/admin.perfilusuario?tipo=entradasUsu&uid=<?=$lista->Usuario['ID'];?>" title="Ver entradas de este usuario"><?=$lista->Usuario['FECHALOGINF'];?></a>
						</li>						
						<li>
							<b>Pines.: </b><a href="/admin.perfilusuario?tipo=historialPines&uid=<?=$lista->Usuario['ID'];?>"> (<?=$lista->Usuario['BALANCE'];?>) - <?=$lista->Usuario['FECHABALANCEF'];?></a> 
						</li>
						<li>
							<b>Planes.: </b><a href="/admin.perfilusuario?tipo=historialPlanes&uid=<?=$lista->Usuario['ID'];?>">Historial</a>
						</li>
						<li>
							<b>Penalidades.: </b><a href="/admin.perfilusuario?tipo=historialPenalidades&uid=<?=$lista->Usuario['ID'];?>">Historial</a>
						</li>						
						<li>
							<b>Comentarios.: </b><a href="/admin.perfilusuario?tipo=comentariosUsu&uid=<?=$lista->Usuario['ID'];?>">Historial</a>
						</li>
						<li>
							<b>Publicaciones.: </b><a href="/admin.perfilusuario?tipo=historialPublicaciones&ob=Activas&fld=art&orde=asc&uid=<?=$lista->Usuario['ID'];?>">ver <?=$lista->Usuario['PUBLICACIONES'];?></a>
						</li>						
						<li>
							<b>Favoritos.: </b><?=$lista->Usuario['FAVORITOS'];?>
						</li>						
						<li>
							<b>Mensajes.: </b><?=$lista->Usuario['MENSAJES'];?> <a href="/admin.klk?uid=<?=$lista->Usuario['ID'];?>">ver KLK</a>
						</li>	
						<li>
							<b>Procedencia.: </b><a target="_blank" href="http://www.ip-tracker.org/locator/ip-lookup.php?ip=<?=$lista->Usuario['IPADDRESS'];?>"><?=$lista->Usuario['IPADDRESS'];?></a>
						</li>
					</ul>
					<?php if ($lista->Usuario['RENDATOS'] != "") { ?>
					<b>Renovaciones.: </b><?=$lista->Usuario['RENDATOS'];?></a><br>
					<?php } if ($lista->Usuario['USUPLAN'] == "LPE") { ?>
					<h3>Resumen Cuenta</h3>
					<ul class="ulcol col3 borderb">
						<?=$lista->resumenExpreso($lista->Usuario['ID'],true);?>
					</ul>						
					<?php } ?>
					<b>Paga Plan.: </b>
					<label for="si">
						Si&nbsp;<input type="radio" name="paga" id="si" class="ppaga" value="USU_PAGA_S_<?=$lista->Usuario['ID'];?>" <?=($lista->Usuario['PAGA'] == 'S') ? "checked" : "";?>>
					</label>

					<label for="no">
						No&nbsp;<input type="radio" name="paga" id="no" class="ppaga" value="USU_PAGA_N_<?=$lista->Usuario['ID'];?>" <?=($lista->Usuario['PAGA'] == 'N') ? "checked" : "";?>>
					</label>
					<!-- //comentar y penalizar usuario -->
					
					<a href="javascript:;" class="moadcomusu pull-right btn btn-info" style="margin-left:10px;"><i class="fa fa-comments" ></i>Comentario a <?=$lista->Usuario['NOMBRE'];?></a>
					<a href="javascript:;" class="moadpenalidades pull-right btn btn-warning"><i class="fa fa-eye-slash"></i>Penalizar a <?=$lista->Usuario['NOMBRE'];?></a>
					<?php if ($lista->Usuario['PNOMBRE'] != '') { ?>
					<hr>
					<ul class="ulcol col3 borderb" id="adperusu2">
						<li>
							<b>Plan hasta.: </b><?=$lista->Usuario['USUHASTA'];?>
						</li>
						<li>
							<b>Tipo.: </b><?=isset($arrCategorias[$lista->Usuario['TIPO']]) ? $arrCategorias[$lista->Usuario['TIPO']] : "No aplica";?>
						</li>

						<li>
							<b>Plan Nombre.: </b><a href="/tienda/usuario/<?=$lista->Usuario['ID'];?>" target="_blank"><?=$lista->Usuario['PNOMBRE'];?></a>
						</li>						
						<li>
							<b>Visitas.: </b><?=$lista->Usuario['VISITAS'];?>
						</li>						
						<li>
							<b>Visitada.: </b><?=$lista->Usuario['VISITADA'];?>
						</li>						
						<li>
							<b>Descripción.: </b><?=$lista->Usuario['DESCRIPCION'];?>
						</li>						
						<li>
							<b>Video.: </b><?=($lista->Usuario['URLVIDEO']) ? "<a target=\"http://www.youtube.com\" href=\"{$lista->Usuario['URLVIDEO']}\" title=\"{$lista->Usuario['URLVIDEO']}\">Ver</a>" : "No tiene";?>
						</li>						
						<li>
							<b>Facebook.: </b><?=($lista->Usuario['URLFB']) ? "<a target=\"http://www.facebook.com\" href=\"{$lista->Usuario['URLFB']}\" title=\"{$lista->Usuario['URLFB']}\">Ver</a>" : "No tiene";?>
						</li>						
					</ul>
					<?php } elseif(($lista->Usuario['USUPLAN'] != 'PB') and ($lista->Usuario['USUPLAN'] != 'LPE')) echo "<h3>Faltan datos del PLAN <a href=\"javascript:;\" class=\"idplinfo\" id=\"{$lista->Usuario['ID']}\">Agregar defecto</a></h3>"; ?>
					<div class="table table-responsive borderb">
						<table class="table table-bordered table-striped table-hover">
					<?php 
					switch($lista->tipo) {
						// listado de comentarios
						case 'comentariosUsu':
						?>
							<tr>
								<th colspan="4"><h3>Comentarios (<?=$lista->cuantos;?>)</h3></th>
							</tr>
							<tr>
								<th class='col-md-5'>Comentario | <a href="javascript:;" class="moadcomusu"> Agregar</a></th>
								<th>Fecha</th>
								<th>Operador</th>
								<th>Seguimiento</th>
							</tr>
							<?=$tpllistado;?>
						<?php
						break;
						// histotrial publicaciones aqui puedeincluir otro listado ya qu ees comun
						case 'historialPublicaciones':
						?>
							<style>
							td input[type='checkbox'] {
							 transform:scale(2);
							}
							</style>

							<?=$lista->histEstatusPub($lista->uid);?>
							</table>

							<form name="frmhistorialPublicaciones" id="frmhistorialPublicaciones" method="post">
							<input type="hidden" name="retorno" value="<?=$_SERVER['REQUEST_URI'];?>">
							<input type="hidden" name="id" id="id" value="" />
							<input type="hidden" name="uid" id="uid" value="" />
							<input type="hidden" name="accion" id="accion" value="RO" />
							<table class="table table-responsive table-striped table-bordered table-hover">
							<tr>
								<th colspan="5"><h3>Publicaciones <?=$lista->ob;?> (<?=$lista->cuantos;?>)</h3></th>
							</tr>
							<tr>
								<th width="20" align="left"><a href='javascript:;' id="asel">CK</a></th>
								<th>Foto</th>
								<th class='col-md-5'>Info General</th>
								<th class='col-md-3'>Estadistica</th>
								<th>Acciones</th>
							</tr>
							<?=$tpllistado;?>
							<tr>
								<td colspan="5">
									<?php if ($lista->ob == 'Activas') { ?>
										<input type="hidden" name="accion" value="RO">
										<input name="btnProcesar" id="btnProcesar" type="submit" class="btn btn-success btn-lg mpo" title="Eliminar la o las publicaciones seleccionadas" value="Eliminar Seleccion"  />
									<?php } else { ?>
										<input type="hidden" name="accion" value="A">
										<input name="btnProcesar" id="btnProcesar" type="submit" class="btn btn-success btn-lg mpo" title="Activar la o las publicaciones seleccionadas" value="Activar Seleccion"  />
									<?php } ?>
								</td>
							</tr>
							</form>	
						</table>
						<?php
							include("momodificapu.tpl");
						break;
						// Historial de planes -->				
						case 'historialPlanes':
						?>
							<tr>
								<th colspan="9" ><h3>Historial de Planes (<?=$lista->cuantos;?>)</h3></th>
							</tr>
							<tr>
								<th>ID</th>
								<th>Plan</th>
								<th>Meses</th>
								<th>Valor<br>Desc<br>Total</th>
								<th>Total</th>
								<th class='col-md-3'>Forma<br>Pago</th>
								<th class='col-md-3'>Fecha<br/>Procesado<br/>Hasta</th>
								<th class='col-md-1'>Estatus</th>
							</tr>
							<?=$tpllistado;?>
					<?php 
						break;
						// Historial de planes -->				
						case 'historialPines':
					?>				
							<tr>
								<th colspan="9" ><h3>Historial de Pines (<?=$lista->cuantos;?>)</h3></th>
							</tr>
							<tr>
								<th>ID</th>
								<th>Balance</th>
								<th>Valor<br>Desc</th>
								<th>Pines</th>
								<th>Total</th>
								<th class='col-md-3'>Forma<br>Pago</th>
								<th class='col-md-3'>Fecha<br/>Procesado</th>
								<th class='col-md-1'>Estatus</th>
							</tr>
							<?=$tpllistado;?>
					<?php 
						break;
						case 'historialUsoPines':
					?>
							<tr>
								<th colspan="9" ><h3>Historial uso de Pines (<?=$lista->cuantos;?>)</h3></th>
							</tr>
							<tr>
								<th>ID</th>
								<th>Pines</th>
								<th>ID Tipo</th>
								<th>Modulo</th>
								<th>Fecha</th>
								<th>Autor</th>
							</tr>
							<?=$tpllistado;?>							
					<?php 
						break;
						// historico penalidades
						case 'historialPenalidades':
					?>
							<tr>
								<th colspan="6"><h3>Pre-avisos y Penalidades (<?=$lista->cuantos;?>)</h3></th>
							</tr>
							<tr>
								<th>ID</th>
								<th>Fecha</th>
								<th>Acción o aviso</th>
								<th>Días</th>
								<th>Hasta/Intentos/Logins</th>
								<th>Estado</th>
							</tr>
							<?=$tpllistado;?>
					<?php 
						break;
						// cambios o logs registros publicaciones y usuarios
						case 'cambiosUsu':
					?>					
							<tr>
								<th colspan="6"><h3>Cambios registrados (<?=$lista->cuantos;?>)</h3></th>
							</tr>
							<tr>
								<th>Módulo</th>
								<th>Campo</th>
								<th class='col-md-2'>Valor</th>
								<th class='col-md-3'>Fecha</th>
								<th>Dirección IP</th>
								<th>ID Autor</th>
							</tr>
							<?=$tpllistado;?>
					<?php 
						break;
						// log logins solo entradas
						case 'entradasUsu':
					?>	
							<tr>
								<th colspan="3">
									<h3>Entradas Recientes (<?=$lista->cuantos;?>)</h3>
								</th>
							</tr>
							<tr>	
								<th>Fecha</th>
								<th>Dirección IP</th>
								<th>Lugar</th>
							</tr>
							<?=$tpllistado;?>
					<?php 
						break;
						// log logins solo entradas
						case 'msjpred':
					?>	
							<tr>
								<th colspan="3">
									<h3>Mensajes Predefinidos</h3>
								</th>
							</tr>
							<tr>	
								<th>Mensaje</th>
								<th>Tipo</th>
							</tr>
							<?=$tpllistado;?>
					<?php 
						break;	
						// modifica usuarios
						case 'modificaUsu':
						// modifica email
						case 'modificaUsuEmail':
						// agrega productos
						case 'agregaProducto':
						case 'agendaRenovaciones':
							echo "</table>" . $tpllistado;
						break;					
					} // fin case tipo para actividades de planes y demas
					?>	
						</table>
					</div>
					<?php
					break;
					// continua case seccion 
					// procesa productos 
					case '102':
					?>
					<div class="table table-responsive">
						<table class="table table-hover table-striped table-bordered">
							<tr>
								<th>ID</th>
								<th class='col-md-2'>Usuario</th>
								<th><a href="#tipo">Tipo</a></th>
								<th>Cant.</th>
								<th class='col-md-2'>Monto<br>
									Desc%<br>Total	
								</th>
								<th class='col-md-1'><a href="#formapago">Forma Pago</a></th>
								<th class='col-md-3'>Fecha<br>Procesado</th>
								<th class='col-md-3'>Acción</th>
							</tr>
							<?=$tpllistado;?>
							<tr><td  colspan="8"><h4><b><a name="tipo">&nbsp;</a>Leyenda Tipos</b></h4><ul class="ulcol col3 leyenda" id="adperusu1">
							<?php 
								// imprime la lyenda d elos tipos
								foreach($arrPlanUsuario as $k => $v) {
									if (substr($k,0,1) == "O") continue;
									echo "<li>{$k} = {$v}</li>";
								}
							?>
							</ul></td></tr>
							<tr><td  colspan="8"><h4><b><a name="formapago">&nbsp;</a>Leyenda Forma Pago</b></h4><ul class="ulcol col3 leyenda" id="adperusu2">
							<?php 
								// imprime la lyenda d elos tipos
								foreach($arrFormaPago as $k => $v) {
									if (substr($k,0,1) == "O") continue;
									echo "<li>{$k} = {$v}</li>";
								}
							?>
							</ul></td></tr>
									
						</table>
					</div>
						<style>.leyenda {font-size:.7em;}</style>
					<?php
					break;
					// admin registro usuario desde menu principal
					case '108':
						echo "<div class=\"clearfix\"></div>";
						include("tpl/frmregistro.tpl");
					break;
					// monitorea klk messenger
					case '109':
					?>
					<div class="table table-responsive">
						<table class="table table-hover table-striped table-bordered">
							<tr>
								<th class='col-md-1'>ID</th>
								<th class='col-md-1'>Desde<br>Para</th>
								<th class='col-md-3'>Asunto (MSG)</th>
								<th class='col-md-1'>Estatus.D<br>Estatus.P</th>
								<th class='col-md-3'>Nombre.D<br>Nombre.P</th>
								<th class='col-md-3'>Fecha</th>
								<th class='col-md-3'>Acción</th>
							</tr>
							<?=$tpllistado;?>
						</table>
					</div>	
					<?php
					break;
					// procesa extensiones
					case '110':
					?>
					<div class="table table-responsive">
						<table class="table table-hover table-striped table-bordered">
							<tr>
								<th class='col-md-1'>ID</th>
								<th class='col-md-3'>Nombre</th>
								<th>Pub</th>
								<th>Penalidades</th>
								<th class='col-md-2'>Extensión</th>
								<th class='col-md-3'>Fecha<br>Procesado</th>
								<th class='col-md-3'>Acción</th>
							</tr>
							<?=$tpllistado;?>
						</table>
					</div>
						<style>.leyenda {font-size:.7em;}</style>
					<?php
					break;
					// listado prestamos
					case '111':
					?>
					<div class="flexr flexw" style="<?= (!$esmovil) ? 'position:absolute; top:10px; right:10px;': 'position:relative; float:left; margin-bottom:15px;';?>">
						<a href="/admin.prestamos" class="btn btn-default" style="margin-right:5px;">Completas</a>
						<a href="/admin.prestamos?estatus=I" class="btn btn-warning" style="margin-right:5px;">Incompletas</a>
						<a href="/admin.prestamos?estatus=P" class="btn btn-info" style="margin-right:5px;">Pre-aprobadas</a>
						<a href="/admin.prestamos?estatus=D" class="btn btn-success" style="margin-right:5px;">Desembolsadas</a>
						<a href="/admin.prestamos?estatus=C" class="btn btn-danger" style="margin-right:5px;">Canceladas</a>
					</div>
					<form type="get" class="col-md-4 form-horizontal flexcol flexcv"><input type="text" placeholder="Busca solicitudes" class="form-control col-md-4 buscabloque" rel="tblprestamos" name="qf"><input type="submit" class="btn btn-success mtop" value="Buscar"></form>
					<div class="form-group pull-right"  style="margin-right:5px;">
						<select name="danio" class="form-control" onchange="location.href='admin.prestamos?tipo=estadisticas&sm='+this.value">
							<option value="0">Estadisticas</option>
							<?php 
								for ($i=1;$i<=5;$i++) {
									$sm = date("W") -$i;
							?>
								<option value="<?=$sm;?>" <?= (isset($_GET["sm"]) and $_GET["sm"] == $sm) ? "selected": "";?>><?=$i;?> Semanas</option>";
							<?php } ?>
						</select>
					</div>
					<div class="form-group pull-right">
						<select class="form-control" onchange="location.href='admin.prestamos?tipo=fases&fase='+this.value">
							<option value="0">Fases</option>
							<?php 
								for ($i=1;$i<=4;$i++) {
							?>
								<option value="<?=$i;?>" <?= (isset($_GET["fase"]) and $_GET["fase"] == $i) ? "selected": "";?>><?=$arrFases[$i];?></option>";
							<?php } ?>
						</select>
					</div>
						<?=(isset($_GET['sm'])) ? $tpllistado : '' ;?>
					<div class="clearfix"></div><br>
					<div class="table table-responsive">
						<table class="table table-responsive table-hover table-bordered table-striped" id="tblprestamos">
							<tr>
								<th style="width: 50px;">ID</th>
								<th class="col-md-3">Nombre</th>
								<th>Cedula</th>
								<th>Monto</th>
								<th>Telefonos</th>
								<th>Fecha</th>
							</tr>
							<?=(isset($_GET['sm'])) ? "" : $tpllistado ;?>
						</table>
					</div>
					<?php 
					break;
					// listado excedidos
					case '112':
					?>
					<div class="table table-responsive">
						<table class="table table-responsive table-hover table-bordered table-striped">
							<tr>
								<th class="col-md-1">U-ID</th>
								<th>Nombre</th>
								<th class="col-md-3">Email<br>Telefono</th>
								<th>Fecha<br>Creada</th>
								<th>Acci&oacute;n</th>
							</tr>
							<?=$tpllistado;?>
						</table>
					</div>
					<?php 
					break;
					// listado financieras
					case '113':
					?>
					<div class="flexr flexw" style="<?= (!$esmovil) ? 'position:absolute; top:10px; right:10px;': 'position:relative; float:left; margin-bottom:15px;';?>">
						<a href="/admin.financieras?tipo=agregafin" class="<?= (!isset($_GET['tipo']) or $_GET['tipo'] == 'agregafin') ? 'hide' : '' ;?> btn btn-default"><i class="fa fa-asterisk"></i>Agregar nueva</a>&nbsp;
						<a href="/admin.<?=(isset($_GET['tipo'])) ? 'financieras' : 'financieras?tipo=agregafin';?>" class="btn btn-info" style="margin-right:5px;"><?=(isset($_GET['tipo'])) ? '<i class="fa fa-list"></i>Listado' : '<i class="fa fa-wpforms"></i>Formulario';?></a>
					</div>
					<div class="clearfix"></div>
					<?php
						if(isset($_GET['tipo'])) {
							include("tpl/frmfinancieras.tpl");
						}
					?>
					<div class="col-sm-3">
						<label for="qf">Busca por nombre o id</label><input type="text" placeholder="Busca financieras" class="form-control col-sm-4 buscabloque pull-left" rel="tblfinancieras" name="qf" id="qf">
					</div>
					<div class="clearfix"></div>
					<br>
					<div class="table table-responsive">		
						<table class="table table-responsive table-hover table-bordered table-striped" id="tblfinancieras">
							<tr>
							<th style="width: 50px;">ID</th>
								<th class="col-sm-2">Nombre</th>
								<th>Contacto</th>
								<th class="col-sm-2">Telefonos</th>
								<th class="col-sm-3">Dirección</th>
								<th>Ubicación</th>
								<th>Estatus</th>
							</tr>
							<?=$tpllistado;?>
						</table>
					</div>
					<?php 
					break;
					// listado de usuarios recurrentes
					case '114':
					?>
					<div class="table table-responsive">
						<table class="table table-responsive table-hover table-bordered table-striped">
							<tr>
								<th class="col-md-1">U-ID</th>
								<th>Nombre (PUB) (PLAN)</th>
								<th class="col-md-3">Plan</th>
								<th>Inicio<br>Creada</th>
								<th>Acci&oacute;n</th>
							</tr>
							<?=$tpllistado;?>
						</table>
					</div>	
					<?php
					break;
					// listado cintilos
					case '115':
					?>
					<div class="flexr flexw" style="<?= (!$esmovil) ? 'position:absolute; top:10px; right:10px;': 'position:relative; float:left; margin-bottom:15px;';?>">
						<a href="/admin.financieras?tipo=agregafin" class="<?= (!isset($_GET['tipo']) or $_GET['tipo'] == 'agregafin') ? 'hide' : '' ;?> btn btn-default"><i class="fa fa-asterisk"></i>Agregar nueva</a>&nbsp;
						<a href="/admin.<?=(isset($_GET['tipo'])) ? 'financieras' : 'financieras?tipo=agregafin';?>" class="btn btn-info" style="margin-right:5px;"><?=(isset($_GET['tipo'])) ? '<i class="fa fa-list"></i>Listado' : '<i class="fa fa-wpforms"></i>Formulario';?></a>
					</div>
					<div class="clearfix"></div>
					<?php
						if(isset($_GET['tipo'])) {
							include("tpl/frmcintillos.tpl");
						}
					?>
					<div class="col-sm-3">
						<label for="qf">Busca por nombre o id</label><input type="text" placeholder="Busca financieras" class="form-control col-sm-4 buscabloque pull-left" rel="tblfinancieras" name="qf" id="qf">
					</div>
					<div class="clearfix"></div>
					<br>
					<div class="table table-responsive">		
						<table class="table table-responsive table-hover table-bordered table-striped" id="tblfinancieras">
							<tr>
							<th style="width: 50px;">ID</th>
								<th class="col-sm-2">Nombre</th>
								<th>Contacto</th>
								<th class="col-sm-2">Telefonos</th>
								<th class="col-sm-3">Dirección</th>
								<th>Ubicación</th>
								<th>Estatus</th>
							</tr>
							<?=$tpllistado;?>
						</table>
					</div>
					<?php 
					break;					
					} if(isset($_GET["tipo"]) and isset($_GET["uid"])) { ?>				
						<a href="javascript:;" class="moadcomusu pull-right btn btn-info" style="margin-left:10px;"><i class="fa fa-comments"></i>Comentario a <?=$lista->Usuario['NOMBRE'];?></a>
						<a href="javascript:;" class="moadpenalidades pull-right btn btn-warning"><i class="fa fa-eye-slash"></i>Penalizar a <?=$lista->Usuario['NOMBRE'];?></a>
				<?php } ?>
			<!-- //comentar y penalizar usuario -->
			</div>
			<div class="col-md-12 item pull-left">
				<?=($lista->cuantos > $lista->lineas) ? $tplpaginacion : "";?>
			</div>
		</div>
	</div>
</div>