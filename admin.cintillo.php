<?php
session_start();
/************* Autor: Lic. Ricardo A. Martinez Ced.:001-00085232-2************/
require("include/config.inc.php");
//require("include/validaoperador.inc.php");  
require("classes/class.listan.php");  
require("classes/class.mipulga.php");  
require("classes/class.registros.php");  
require("classes/class.admin.php"); 



// //require("include/validaoperador.inc.php");
// require("classes/class.fechas.php");
require("classes/class.regusuarios.php");
// require("classes/class.paypal.php");
// require("classes/class.micropagos.php");
// require("classes/class.mensajes.php");

$cintillo = new Regusuarios();
$cintillo->open();
$mensaje = "";
if (isset($_GET['id']) and ($_GET['id'] != '')) {
	$qryString = "SELECT ID,TITULO, MENSAJE,HASTA, URL,ENLACE,TIPO, DATE_ADD(FECHA, INTERVAL HASTA DAY) AS HASTADIA FROM {$cintillo->prefijo_tabla}MSGCINTILLO WHERE ID={$_GET['id']}";
	$result = mysql_query($qryString,$cintillo->alink);				
	list($id,$titulo,$mensaje,$hasta,$url,$enlace,$tipo) = mysql_fetch_row($result);
}
if (isset($_POST['Enviar'])) {
// calcular hasta
	if (!isset($_POST['id'])) $qryString = "INSERT INTO {$cintillo->prefijo_tabla}MSGCINTILLO (TITULO,MENSAJE,FECHA,HASTA,URL,ENLACE,TIPO)VALUES ('{$_POST['titulo']}','{$_POST['mensaje']}',NOW(),'{$_POST['hasta']}', '{$_POST['url']}', '{$_POST['enlace']}', '{$_POST['tipo']}') ON DUPLICATE KEY UPDATE MENSAJE='{$_POST['mensaje']}',HASTA='{$_POST['hasta']}',URL='{$_POST['url']}',ENLACE='{$_POST['enlace']}',TIPO='{$_POST['tipo']}',ESTATUS='M';";
	else $qryString = "UPDATE {$cintillo->prefijo_tabla}MSGCINTILLO SET TITULO='{$_POST['titulo']}',MENSAJE='{$_POST['mensaje']}',FECHA=NOW(),HASTA='{$_POST['hasta']}',URL='{$_POST['url']}',ENLACE='{$_POST['enlace']}',TIPO='{$_POST['tipo']}' WHERE ID={$_POST['id']};";
	if (mysql_query($qryString,$cintillo->alink)) {
		$msg = "El mensaje a cintillo fue agregado correctamente.";
		if ($_POST['hasta'] == -10) $location = "/cron.lp.php?op=creacintillo&rt=retorna ";
		else $location = "/admin.cintillo.php";
		die(jscripts("alert('$msg'); location.href='$location';"));
	}else{
		$msg = "Hubo problemas al agregar el mensaje, trate de nuevo y si el problema persiste nos deja saber via Soporte en el menu del tope.  Equipo LP";
		die(jscripts("alert('$msg'); location.href='/admin.cintillo.php';"));
	}
}
$fecha = new Fechas()
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><?=$sitename;?> - Maneja mensajes cintillo</title>
<?php 
include("include/css.inc.php");
include("include/js.inc.php"); 
include("include/ga.inc.php"); 
?>
<script>
$(document).ready(function(){
	$("#mensaje").keypress(function(event){ cuentacaracteres(300,this,event); });
	$("#mensaje").keydown(function(event){ cuentacaracteres(300,this,event); });
	$("#mensaje").keyup(function(event){ cuentacaracteres(300,this,event); });
});
</script>
</head>
<body> 
<?php include("shtml/header.shtml");?>
	<!--Aqui estan las capas que contienen la capa cuerpo del navegador y el contenido del navegador-->
<div id="wrap">  	
	<?php
	$arrRuta[0] = "<a href=\"/\">Inicio</a>";
	$arrRuta[1] = "<a href=\"/lpadmin.php\">Admin</a>";
	$arrRuta[2] = "Manejo del cintillo ";       
	?>  	
	<?=crearuta();?>			

	<div class="formarea">
		<form action="admin.cintillo.php" method="post" name="frmadmincintillo" id="frmadmincintillo">
			<?=(isset($id)) ? "<input name=\"id\" type=\"hidden\" value=\"$id\" />" : "" ?>
			<br/><br/>
				<div>
					<input name="titulo" type="text" id="titulo" value="<?=isset($titulo) ? htmlentities($titulo) : "";?>" placeholder="Titulo Mensaje.:" />
				</div>			
				<div>
					<textarea name="mensaje" cols="55" rows="5" id="mensaje" placeholder="Mensaje a colocar.:"><?=isset($mensaje) ? htmlentities($mensaje) : "";?></textarea><label id="caracteres">300 Car&aacute;cteres M&aacute;ximo</label>
				</div>
				<div>
					<input name="enlace" type="text" id="enlace" value="<?=isset($enlace) ? htmlentities($enlace) : "";?>" placeholder="Texto enlace.:" />
				</div>				
				<div>
					<input name="url" type="text" id="url" value="<?=isset($url) ? $url : "";?>" placeholder="Url enlace.:" />
				</div>
				<div>	
					<select name="hasta" id="hasta">
						<option value="0">Seleccione dias hasta</option>
						<option value="-10" <?=(isset($hasta) and ($hasta == -10)) ? "Selected" : "";?>>Retirar</option>
						<option value="1" <?=(isset($hasta) and ($hasta == 1)) ? "Selected" : "";?>>1 Dia</option>
						<option value="2" <?=(isset($hasta) and ($hasta == 2)) ? "Selected" : "";?>>2 Dias</option>
						<option value="3" <?=(isset($hasta) and ($hasta == 3)) ? "Selected" : "";?>>3 Dias</option>
						<option value="4" <?=(isset($hasta) and ($hasta == 4)) ? "Selected" : "";?>>4 Dias</option>
						<option value="5" <?=(isset($hasta) and ($hasta == 5)) ? "Selected" : "";?>>5 Dias</option>
						<option value="6" <?=(isset($hasta) and ($hasta == 6)) ? "Selected" : "";?>>6 Dias</option>
						<option value="7" <?=(isset($hasta) and ($hasta == 7)) ? "Selected" : "";?>>7 Dias</option>
						<option value="8" <?=(isset($hasta) and ($hasta == 8)) ? "Selected" : "";?>>8 Dias</option>
						<option value="9" <?=(isset($hasta) and ($hasta == 9)) ? "Selected" : "";?>>9 Dias</option>
						<option value="10" <?=(isset($hasta) and ($hasta == 10)) ? "Selected" : "";?>>10 Dias</option>
					</select>
				</div>					
				<div>	
					<select name="tipo" id="tipo">
						<option value="0">Seleccione tipo mensaje</option>
						<option value="I" <?=(isset($tipo) and ($tipo =='I')) ? "Selected" : "";?>>Informacion</option>
						<option value="E" <?=(isset($tipo) and ($tipo =='E')) ? "Selected" : "";?>>Error</option>
						<option value="W" <?=(isset($tipo) and ($tipo =='W')) ? "Selected" : "";?>>Advertencia</option>
					</select>
				</div>						
				<br/><br/>
				<input name="Enviar" type="submit" id="Enviar" value="Enviar Mensaje" class="fbtn_n" />
				<input type="button" name="Cancelar" id="btnCancelar" class="fbtn_b" value="Cancelar" />						
		</form>
		<br/></br/>

	</div>
			<table class="listaslnk">
			<tr>
				<td>ID</td>
				<td>Titulo</td>
				<td>Mensaje</td>
				<td>Fecha</td>
				<td>Hasta</td>
				<td>Enlace</td>
				<td>Url</td>
				<td>Tipo</td>
				<td>Estatus</td>
			</tr>
			<?php
				$qryString = "SELECT *,DATE_ADD(FECHA, INTERVAL HASTA DAY) AS HASTADIA FROM {$cintillo->prefijo_tabla}MSGCINTILLO ORDER BY HASTADIA DESC";
				$result = mysql_query($qryString,$cintillo->alink);				
				while($row = mysql_fetch_array($result,MYSQL_ASSOC)) {
					echo "<tr>";
					echo "<td>{$row['ID']}</td>";
					echo "<td><a href=\"/admin.cintillo.php?id={$row['ID']}\">{$row['TITULO']}</a></td>";
					echo "<td><a href=\"/admin.cintillo.php?id={$row['ID']}\">{$row['MENSAJE']}</a></td>";
					echo "<td>" . $fecha->formatolargodmahmsam($row['FECHA']) . "</td>";
					echo "<td>" . $fecha->formatolargodmahmsam($row['HASTADIA']) . "</td>";
					echo "<td>{$row['ENLACE']}</td>";
					echo "<td>{$row['URL']}</td>";
					echo "<td>{$row['TIPO']}</td>";
					echo "<td>{$row['ESTATUS']}</td>";
					echo "</tr>";
				}
				$cintillo->close();
				unset($cintillo);
			?>
		</table>
</div>
<?php include("shtml/footer.shtml"); ?>	
</body>
<style>.blenul{display:none;}</style>	
</html>