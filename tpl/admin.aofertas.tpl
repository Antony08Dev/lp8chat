<?php

$mensaje = "";
$fecha = new Fechas();
// busca transaccion
if (!empty($lista->id)) {
	$qryString = "SELECT T.ID, USUARIO_ID AS UID, CANTIDAD, FORMAPAGO, TRANSACCION, U.EMAIL, U.NOMBRE FROM {$lista->prefijo_tabla}TRANSACCIONES T INNER JOIN {$lista->prefijo_tabla}USUARIOS U ON T.USUARIO_ID=U.ID WHERE T.ID={$lista->id}";
	$result = $lista->db->query($qryString);				
	$arrTransaccion = $result->fetch_assoc();
}
// busca usuario
if (!empty($lista->uid)) {
	$qryString = "SELECT ID AS UID, NOMBRE, EMAIL FROM {$lista->prefijo_tabla}USUARIOS WHERE ID={$lista->uid} AND ESTATUS='A'";
	$result = $lista->db->query($qryString);				
	if ($result->num_rows == 0) die(jscripts("alert('Este usuario no puede ser procesado'); location.href='/admin.lp';"));
	$arrTransaccion = $result->fetch_assoc();
}
if (isset($_POST['Enviar'])) {
	$estatus = "";
	if ($_POST['meses'] == -1) {
		// condiciona para remover tienda de ao
		$estatus = ", ESTATUS='C'";
	} else {
		// costo area de ofertas 2000 pesos
		$valor = 2000;
		// se unifico a mes en vez de dias
		// $_POST['meses'] *= 30;
	}
	// inserta
	if (!isset($_POST['id'])) $qryString = "INSERT INTO {$lista->prefijo_tabla}TRANSACCIONES (USUARIO_ID, TIPO, VALOR, DESCUENTO, TASA, CANTIDAD, BALANCE, FORMAPAGO, TRANSACCION, ESTATUS, FECHA, PROCESADO) VALUES ({$_POST['uid']},'AO',{$valor},0,0,{$_POST['meses']},0,'{$_POST['formapago']}','{$_POST['transaccion']}','A',NOW(),NOW())";
	// actualizar info de la transaccion
	else $qryString = "UPDATE {$lista->prefijo_tabla}TRANSACCIONES SET CANTIDAD='{$_POST['meses']}',FORMAPAGO='{$_POST['formapago']}',TRANSACCION=CONCAT(TRANSACCION,'<br>Registro Actualizado.: " . $fecha->fechalargadmahms() .  ", Usuario {$_SESSION['lp_usuario']}', '<br>Cantidad anterior.: ',{$_POST['cantidad']}, '<br>Nueva Transaccion.: ','{$_POST['transaccion']}') {$estatus} WHERE ID='{$_POST['id']}';";
	$result = $lista->db->query($qryString);
	
	if ($result) {
		$msg = "La tienda fue agregada correctamente.";
		mail(EMAILLOGS,"Tienda agregada a AO {$_POST['uid']}",$qryString);
		// uso temporal pagos para insertaplanesinfo
		$pagos = new Pagos();
		$pagos->insertaPlanesInfo($_POST['uid']);
		unset($pagos);
		die(jscripts("alert('$msg'); location.href='admin.aofertas';"));
	} else {
		$lista->qryError($qryString, __FUNCTION__);
		$msg = "Hubo problemas al agregar la tienda al Area de Ofertas, trate de nuevo y si el problema persiste consulta con el Administrador.";
		mail(EMAILLOGS,"Tienda no agregada a AO {$_POST['uid']}",$qryString);
		die(jscripts("alert('$msg'); location.href='/admin.aofertas';"));
	}
}
?>
<!--Agregar $tplruta-->
<div class="row">
	<!--cuando sea desktop este div debe tener la clase bflex-->
	<div class="<?=($esmovil == false) ? 'bflex' : ''; ?>">
		<!--de manera condicionada cuando sea desktop a este div se le pone el id colizq-->
		<div id="<?=($esmovil == false) ? 'colizq' : ''; ?>"  class="col-md-3 col-xs-12 item">
			<?php if (($lista->tipolistado == 'adusu') or ($lista->tipolistado == 'adcrm')) { ?>
			<div id="buscador-izq">
				<form action="<?=$_SERVER['REDIRECT_URL'];?>" method="get" name="frm" id="frm" class="form-horizontal">
					<div class="input-group col-md-12">
						
						<input type="text" name="q" id="q" class="campo-buscador-izq form-control" placeholder="Buscar " value="<?=$lista->q;?>" />
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
				<div>
					<div class="artplista" >
						<div class="col-md-6 pull-left" id="formulario">
							<?php if (!isset($arrTransaccion)) { ?>
							<h3 class="tbloque pull-left">Debes seleccionar un usuario activo o bucarlo en el Administrador de Usuarios</h3>
							<?php } else { ?>
							<h3 class="tbloque pull-left"><?=$tpltitulolistado;?></h3>
							<form action="/admin.aofertas" method="post" name="frmadminaofertas" id="frmadminaofertas">
								<?=(isset($arrTransaccion['ID'])) ? "<input name=\"id\" type=\"hidden\" value=\"{$arrTransaccion['ID']}\" />" : "" ?>
								<?=(isset($arrTransaccion['CANTIDAD'])) ? "<input name=\"cantidad\" type=\"hidden\" value=\"{$arrTransaccion['CANTIDAD']}\" />" : "" ?>
									<br/><br/>
									<div class="form-group">
									<br>
										<label for="usuario">Usuario a <?=!empty($lista->uid) ? "agregar" : "modificar";?></label>
										<input type="hidden" value="<?=$arrTransaccion['UID'];?>" name="uid" id="uid" >
										<input type="text" value="ID.: <?="{$arrTransaccion['UID']} , {$arrTransaccion['NOMBRE']}, {$arrTransaccion['EMAIL']}";?>" name="usuario" id="usuario" class="form-control" readonly>
									
									</div>			
									<div class="form-group">
										<label for="meses">Meses:</label>
										<select name="meses" id="meses" class="form-control" required>
											<option value="">Seleccione meses hasta</option>
											<option value="-1" <?=(!isset($arrTransaccion['ID'])) ? "disabled" : "";?>>Retirar</option>
											<option value="1" <?=(isset($arrTransaccion['CANTIDAD']) and ($arrTransaccion['CANTIDAD'] == 1)) ? "Selected" : "";?>>1 Mes</option>
											<option value="2" <?=(isset($arrTransaccion['CANTIDAD']) and ($arrTransaccion['CANTIDAD'] == 2)) ? "Selected" : "";?>>2 Meses</option>
											<option value="3" <?=(isset($arrTransaccion['CANTIDAD']) and ($arrTransaccion['CANTIDAD'] == 3)) ? "Selected" : "";?>>3 Meses</option>
											<option value="4" <?=(isset($arrTransaccion['CANTIDAD']) and ($arrTransaccion['CANTIDAD'] == 4)) ? "Selected" : "";?>>4 Meses</option>
											<option value="5" <?=(isset($arrTransaccion['CANTIDAD']) and ($arrTransaccion['CANTIDAD'] == 5)) ? "Selected" : "";?>>5 Meses</option>
											<option value="6" <?=(isset($arrTransaccion['CANTIDAD']) and ($arrTransaccion['CANTIDAD'] == 6)) ? "Selected" : "";?>>6 Meses</option>
										</select>				
									</div>			
									<div class="form-group">
										<label for="formapago">Forma de Pago:</label>
										<select name="formapago" id="formapago" class="form-control" required>
											<option value="" selected="selected">Forma de Pago.:</option>
											<option value="TB" <?=(isset($arrTransaccion['FORMAPAGO']) and ($arrTransaccion['FORMAPAGO'] == 'TB')) ? "Selected" : "";?>>Dep&oacute;sito a cuenta <?=$arrFormaPago['TB']?>, Cta. <?=$arrCuentasBancos['BHD']?></option>
											<option value="TP" <?=(isset($arrTransaccion['FORMAPAGO']) and ($arrTransaccion['FORMAPAGO'] == 'TP')) ? "Selected" : "";?>>Dep&oacute;sito a cuenta <?=$arrFormaPago['TP']?>, Cta. <?=$arrCuentasBancos['POPULAR']?></option>
											<option value="TR" <?=(isset($arrTransaccion['FORMAPAGO']) and ($arrTransaccion['FORMAPAGO'] == 'TR')) ? "Selected" : "";?>>Dep&oacute;sito a cuenta <?=$arrFormaPago['TR']?>, Cta. <?=$arrCuentasBancos['RESERVAS']?></option>
											<option value="PP" <?=(isset($arrTransaccion['FORMAPAGO']) and ($arrTransaccion['FORMAPAGO'] == 'PP')) ? "Selected" : "";?>><?=$arrFormaPago['PP']?></option>
											<option value="IC" <?=(isset($arrTransaccion['FORMAPAGO']) and ($arrTransaccion['FORMAPAGO'] == 'IC')) ? "Selected" : "";?>><?=$arrFormaPago['IC']?></option>  
											<option value="EF" <?=(isset($arrTransaccion['FORMAPAGO']) and ($arrTransaccion['FORMAPAGO'] == 'EF')) ? "Selected" : "";?>>Efectivo o Cheque (requiere validaci&oacute;n en el banco)</option>
										</select>				
									</div>
									
									<div class="form-group">
										<label for="transaccion">Transacción:</label>
										<textarea name="transaccion" cols="60" rows="4" wrap="physical" id="transaccion" placeholder="Pegar o escribir detalles de la transaccion.:" class="form-control" required></textarea>
									</div>					
									<input name="Enviar" type="submit" id="Enviar" value="Agregar a AO" class="btn btn-success" />
									<input type="button" name="Cancelar" id="btnCancelar" class="btn btn-success" value="Cancelar" onclick="location.href='/admin.aofertas';" />						
							</form>
							<?php }  ?>
						</div>
						<div id="tabla-master" class="table table-responsive borderb">
							<table class="table table-hover table-striped table-bordered">
								<tr>
									<th colspan="9"><h4>Usuarios en AO, Vigentes (gris), Vencidos (rojo) </h4></th>
								</tr>
								<tr>
									<th>ID T</th>
									<th>UID</th>
									<th>Tienda/Usuario</th>
									<th>Meses</th>
									<th class='col-md-4'>Fecha</th>
									<th class='col-md-4'>Hasta</th>
									<th>Dias</th>
									<th>Activo</th>
									<th>Pago</th>
								</tr>
								<?php
									$qryString = "SELECT ID, T.USUARIO_ID, NOMBRE, CANTIDAD, DATE_FORMAT(FECHA, '%d-%m-%Y %h:%i %p') AS FECHA,DATE_FORMAT(DATE_ADD(FECHA, INTERVAL CANTIDAD MONTH), '%d-%m-%Y %h:%i %p') AS HASTA, DATEDIFF(DATE_ADD( FECHA, INTERVAL CANTIDAD MONTH ),NOW()) AS RESTA, IF (DATE_ADD( FECHA, INTERVAL CANTIDAD MONTH ) > NOW() , 'Si','No') AS ACTIVO, FORMAPAGO, TRANSACCION FROM {$lista->prefijo_tabla}TRANSACCIONES T, {$lista->prefijo_tabla}PLANESINFO P WHERE T.USUARIO_ID=P.USUARIO_ID AND T.TIPO='AO' AND T.ESTATUS='A' ORDER BY T.ID DESC LIMIT 25";
									$result = $lista->db->query($qryString);
									if (!$result) {
										$lista->qryError($qryString, __FUNCTION__);
										return false;
									}
									while ($row = $result->fetch_assoc()) {
										$clase = ($row['ACTIVO'] == 'No') ? "danger" : "";
										$clase = "class=\"{$clase}\"";
										// determina si editar la transaccion o crear uno nuevo de la lista
										$accion = ($row['ACTIVO'] == 'Si') ? "id={$row['ID']}" : "uid={$row['USUARIO_ID']}";
										echo "<tr $clase>";
										echo "<td><a href=\"javascript:;\" class=\"cambia\" id=\"{$row['ID']}\" title=\"Ver detalles transaccion\">{$row['ID']}</a></td>";
										echo "<td><a href=\"/admin.aofertas?{$accion}\">{$row['USUARIO_ID']}</a></td>";
										echo "<td><a href=\"/admin.perfilusuario?uid={$row['USUARIO_ID']}\">{$row['NOMBRE']}</a></td>";
										echo "<td align=\"center\">{$row['CANTIDAD']}</td>";
										echo "<td>{$row['FECHA']}</td>";
										echo "<td>{$row['HASTA']}</td>";
										echo "<td align=\"right\">{$row['RESTA']}</td>";
										echo "<td align=\"center\">{$row['ACTIVO']}</td>";
										echo "<td align=\"center\">{$row['FORMAPAGO']}</td>";
										echo "</tr>";
										echo "<tr class=\"apaga\">
												<td colspan=\"8\">{$row['TRANSACCION']}</td>
											</tr>";
									}
								?>
							</table>	
						</div>			
						<div class="col-md-12 item pull-left">
							<?=($lista->cuantos > $lista->lineas) ? $tplpaginacion : "";?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	//validacion de los checkbox
	$("#frmadminaofertas").submit(function() {
		if ( !confirm("Está todo correcto?") ) {
			return false;
		} else {
			return true;
		}
	});
</script>
