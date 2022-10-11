<?php 
/**
 * Clase admin (hereda de la clase @link Lista)
 * @version 7.0
 * @since v1.0
 * @author Ricardo Martinez 
 */
class Admin extends Mipulga {
	/**
	  * @var int $i conteo de registros de la lista actual
	  */
	var $i;
	
	private $registros;
	
	/**
	* @method void __construct() metodo constructor de la clase
	*/
	function __construct() {
		parent::__construct();
		$this->lineas = 30;
		$this->titulo = "";
	}		 
	/**
	* @method void __destruct() metodo descturctor de la clase
	*/
	function __destruct() {
		parent::__destruct();
	}
	/**
	* @method void __call() llama funciones de registros
	*/	
	// public function __call($method, $args) {
		// $this->registros->$method($args[0]);
	// }	
	/**
	 * @method bool|string publicaciones() Metodo que listara las publicaciones para su administracion
	 * @return string en caso de que el parametro "return" este false (true si trae publicaciones, false si no trae o se produce un error)
	 */
	function Publicaciones() {
		global $arrCategorias;		
		global $cdnimagenes;		
		$fila = $condicion = $enplan = $localidad = "";
		$arrJson = array();
		$totalvisitas = $this->calculaVisitas();
		$arrResVip = array();
		$intervalohoras = ($_SESSION['lp_plan'] == "P") ? (5*24) : (1*24);
		$arrRegistros = array();
		while ($row = $this->result->fetch_assoc()) {
			$arrRegistros[] = $row;
			$arrResVipValores = array("vip"=>"N","foto"=>"N","reshasta"=>"");
			$porcentaje = ($totalvisitas != 0) ? number_format(($row['VISITAS']/$totalvisitas)*100,2) : 0;
			$masinfo = "";
			$masinfo .= ($row['ACUMULADAS'] != 0) ? "<li><b>Visitas Acumuladas.:</b> {$row['ACUMULADAS']}</li>" : "";
			if (isset($row['TIPOVIP'])) {
				$masinfo .= ($row['TIPOVIP'] == "V") ? "<li><b>VIP Principal Hasta.:</b> {$row['HASTA']}</li>" : "";
				$masinfo .= ($row['TIPOVIP'] == "VC") ? "<li><b>VIP Sección Hasta.:</b> {$row['HASTA']}</li>" : "";
				$arrResVipValores["vip"] = "S";
			}				
			if ($row['RESALTADO'] == "R") {
				$masinfo .= "<li><b>Resaltado Hasta.:</b> {$row['RESHASTA']}</li>";
				$arrResVipValores["res"] = "S";
				$arrResVipValores["reshasta"] = $row['RESHASTA'];
			} 
			if ($row['URLVIDEO'] != "") {
				$yid = id_youtube($row['URLVIDEO']);
				$urlvideo = "/video?yid={$yid}&vuid={$row['USUARIO_ID']}";							
				$urlvideo = "<a href=\"{$urlvideo}\" target=\"\blank\">Ver?</a>";
				$masinfo .= "<li><b>Tiene Video.:</b> Si {$urlvideo}</li>";
			}
			// favoritos
			if (isset($row['USUFAVORITO']) and ($row['USUFAVORITO'] != "")) {
				$masinfo .= "<li><b>En favoritos del usuario.:</b> {$row['USUFAVORITO']}</li>";
			}
			// procesa foto sin llamado a funcion
			if ($row['FOTOS'] != "") {
				$arrFotos = explode(",",$row['FOTOS']);
				$fotos = count($arrFotos);
				$arrResVipValores["foto"] = "S";
			} else {
				$fotos = 0;
				$arrFotos[0] = "fotodefecto.jpg";			
			}
			// determina si renova o no

			
			if ($row['HORASPUBLICADO'] > $intervalohoras) {
				$claserenovar = "mpor";
				$onclickrenovar = "";
			} else {
				$diff = ($intervalohoras - $row['HORASPUBLICADO']);
				$onclickrenovar = "onclick=\"alertify.wAlert('{$row['ARTICULO']}','No puede ser renovada ahora, puedes hacerlo en {$diff} horas o mas.<br><br>Los usuarios con planes pueden renovar cada 24 horas los que no cada 5 dias.<br><br>Te recomendamos <a href=\'/renovaciones\'>Renovaciones Automaticas</a> o <a href=\'/planes\'>ver Planes de Usuarios</a>, Equipo LP.');\"";
				$claserenovar = "";	
			}
			
			$arrResVip[$row['ID']] = $arrResVipValores;
			
			$colorv = ($row['VISITAS'] == 0) ? "red" : "green";
			$srcfoto = foto($row['FOTOS'],"120",'S');
			$resaltado = ($row['RESALTADO'] == 'R') ? "resal" : "";
			$srcfoto = "<img src=\"{$srcfoto}\" />";
			$flista = "<a href=\"/f/{$arrFotos[0]}\" class=\"pubimg fancybox\">$srcfoto</a>";

			//CAMBIOS POR WILFRE
			$textFotos = implode(',',$arrFotos);
			//buscamos la moneda indicada dentro del PRECIOF
			$arrMoneda = explode('$',$row['PRECIOF']);
			$moneda = $arrMoneda[0] . "$";
			//hallamos la otra opcion para el select de la moneda
			$optMoneda = ($moneda == 'RD$') ? "value='U'>US$" : "value='R'>RD$";

			$fila.="
				<div class=\"col-md-12 mtop fotos\" >
					<h4 align=\"left\"><b>Escoge la imagen principal.</b></h4>		
					<input type=\"hidden\" id=\"arrFotos_{$row['ID']}\" value='' class=\"arrFotos form-control\">
					<script>
						 $('#arrFotos_{$row['ID']}').attr('value','{$textFotos}');
					</script> 
			";
			//Ciclo que recorre todas lasfotos y genera el html que recibe que las muestra
			 foreach($arrFotos as $k => $v) { 	
				$visible =  ($k==0)? "style='visibility:visible'" : "";
				$checked = ($k==0)? "checked": "";

				$fila .= "
					<div class=\"miniaturas\">
						<a  href=\"f/{$v}\" class=\"fancybox\" >
							<img width=\"100%\"  src=\"cache/80/{$v}\" />
						</a>
						<div  class=\"radiob\">
							<span {$visible}></span>
							<input type=\"radio\" value=\"{$v}\" name=\"{$row['ID']}\" {$checked}/>
						</div>
					</div>			
						";
			}
			//iniciamos cerrando el div que contiene todas las miniaturas
			$fila .= "
			</div>
			<form class=\"form-vertical col-md-6 frm\" id='frm_{$row['ID']}'>
				<input type=\"hidden\" name='id' value=\"{$row['ID']}\">
				<!-- ant_ -->
				<input type=\"hidden\" name='ant_articulo' value=\"{$row['ARTICULO']}\">
				<input type=\"hidden\" name='ant_moneda' value=\"{$row['MONEDA']}\">
				<input type=\"hidden\" name='ant_precio' value=\"{$row['PRECIO']}\">
				<input type=\"hidden\" name='ant_subcategoria_id' value=\"{$row['SUBCATEGORIA_ID']}\">
				<input type=\"hidden\" name='ant_categoria_id' value=\"{$row['CATEGORIA_ID']}\">
				<input type=\"hidden\" name='urlvideo' value=\"{$row['URLVIDEO']}\">
				<input type=\"hidden\" name='condicion' value=\"{$row['CONDICION']}\">
				<input type=\"hidden\" class='id_subcat' value=\"PONERVALOR\">
				<input type=\"hidden\" name=\"tipo\" value=\"{$row['TIPO']}\">

				<div class=\"form-group\">
					<label for=\"\">Título</label>
					<input type=\"text\" class=\"pub-titulo form-control w100p\" name=\"articulo\" id=\"articulo\" value=\"{$row['ARTICULO']}\" required>
				</div>
				<div class=\"form-group\">
					<label for=\"categoria[6097023]\">Categoria</label>
					<select  class=\"form-control pubcategoria\" name=\"categoria_id\" id=\"categoria_id\" required>
					</select>
				</div>
				<div class=\"form-group col-md-4 no-padding\">	
					<label for=\"\" >Moneda</label>
					<select   name=\"moneda\" id=\"moneda\" class=\"pubmoneda form-control \" required>
						<option value=\"{$row['MONEDA']}\">{$moneda}</option>
						<option {$optMoneda}</option>
					</select>
				</div>
					
				<div class=\"form-group col-md-8 no-padding\">
					<label for=\"\" >Precio</label>
					<input  type=\"text\" class=\"pubprecio form-control col-md-3 \"  name=\" precio\" id=\"precio\" value=\"{$row['PRECIO']}\" required>
				</div>

				<div  class=\"form-group col-md-12\">
					<!--Mandar el id de la publicacion a la funcion -->
					<input type=\"submit\"  class=\"btn btn-success modifica_pub\" value=\"Modificar\" >
				</div>
			</form>

			<ul class=\"col-md-6 col-2 \" >
				<li><b>ID.:</b> {$row['ID']} 	</li>
				<li><b>Fecha.: 	</b>{$row['FECHA']} </li>
				<li><b>Visitas.:</b> {$row['VISITAS']} <span class=\"badge bgverde\">{$porcentaje}</span></li>
				<li><b>Expira.:</b> {$row['EXPIRA']} </li>
				<li><b>Fotos.:	</b>  {$fotos}  <a href=\"/modificapublicacion/{$row['ID']}\"> Elimina?</a></li>
				<li><b>Visitado.:</b> {$row['VISITADO']} </li>
				<li><b>VIP.:</b>Activo</li>
				<li><b>Video.:</b><a href=\"PONERVALOR\">ver</a> </li>
				<li><b>Expira VIP.:</b> 25-10-2017 09:02</li>
					
			</ul>
										
			<div class=\" col-md-6 opciones pull-right\">
				<a href=\"javascript:;\" id=\"r_{$row['USUARIO_ID']}\" class=\"moopcional bgverde btn btn-success btn-xs\">Poner en Adsword</a>
				<a href=\"javascript:;\" title=\"\" id=\"{$row['ID']}_{$row['USUARIO_ID']}_RU\" class=\"mpo bgrojo btn btn-danger     tt\"><i class=\"fa fa-trash-o\"></i> Quitar Adsword</a>
				<a href=\"javascript:;\" id=\"r_{$row['ID']}\" class=\"moopcional btn btn-primary \">Agregar Resaltado</a>
				<a href=\"javascript:;\" id=\"v_{$row['ID']}\" class=\"moopcional btn btn-primary \">Agregar a VIP</a>
				<a href=\"javascript:;\" id=\"{$row['ID']}_{$row['USUARIO_ID']}_RN\"  class=\"hidden-xs ttn  btn btn-primary  mpor\" ><i class=\"fa fa-refresh\"></i> Renovar</a>
				<a href=\"javascript:;\" title=\"\" id=\"{$row['ID']}_{$row['USUARIO_ID']}_RU\" class=\"mpo  btn btn-danger     tt bgrojo\"><i class=\"fa fa-trash-o\"></i> Eliminar</a>
			</div>
			
			<div class=\"borderb\"></div>";	
		}
		// $arrRegistros = serialize($arrRegistros);
		// $fp = fopen (RUTA . "include/registrospublicaciones.inc.php", "wb");
		// fwrite($fp,$arrRegistros,strlen($arrRegistros));
		// fclose($fp);		
		
		
		
		$fila = jscripts("var arrResVip = " . json_encode($arrResVip) . ";") . $fila;
		 return $fila;
	}
	/**
	 * @method bool|string listaUsuarios() Metodo que listara los usuarios registrados para su administracion
	 * @return string en caso de que el parametro "return" este false (true si trae usuarios, false si no trae o se produce un error)
	 */
	function listaUsuarios() {
		global $arrProvincias;		
		global $arrMunicipios;		
		global $cdnimagenes;	
		global $proturl;
		$fila = $condicion = $enplan = $localidad = "";
		$arrJson = array();
		$totalvisitas = $this->calculaVisitas();
		$masinfo = $seguimiento = "";
		$arrOperadores = $this->listaOperadores();
		$arrTelPermitidos = array("809","829","849");
		while ($row = $this->result->fetch_assoc()) {
			//parr($row);
			if (isset($row['COMENTARIO'])) {
				// LIMITA A QUE SOLO LOS COMENTARIOS SIN SEGUIMIENTO TENGAN ESO ADICIONAL
				$txtseg = (substr($this->ob,0,1) == 'C') ? "<br>Seguimiento.: <B>{$row['SEGUIMIENTO']}</b>" : "";
				$seguimiento = "<tr><td colspan=\"6\">Comentario.: <b>{$row['COMENTARIO']}</b><br>Operador.: <b>{$arrOperadores[$row['OPERADOR_ID']]}</b><br>Prioridad.: <b>{$row['PRIORIDADF']}</b><br>Viene de.: <b>{$row['CFECHAF']}</b>{$txtseg}</td></tr>";
			}
			$paga = ($row['PAGA'] == 'S') ? "<span class=\"verde\">Paga</span>" : "<span class=\"rojo\">No Paga</span>";
			if ($row['USUPLAN'] != "PB") $usuhasta = "<br><strike><b>{$row['USUHASTA']}</b></strike>";
			else $usuhasta = "";
			$textareas = "";
			$nombre = explode(" ",$row['NOMBRE']);

			$publicaciones = ($row['PUBLICACIONES'] != 0) ? " y la publicacion que hiciste no se mostrara hasta que actives" : "";
			if (($row['ESTATUS'] == 'A') or ($row['ESTATUS'] == 'I') or ($row['ESTATUS'] == 'R')) {
				$arrTel = array($row["TELEFONO1"], $row["TELEFONO2"], $row["TELEFONO3"]); 
				$br = (isset($row["TELEFONO2"])) ? "<br>" : "";
				$opciones = "";
				$mensaje = 
"Hola {$nombre[0]}, tienes una cuenta con este email *{$row['EMAIL']}* en La Pulga Virtual de fecha {$row['CREADAF']}, si no recuerdas tu clave cambiala dando click al enlace

https://www.lapulga.com.do/cambiaclave/{$row['SESSION']}?pwd={$row['PASSWORD']}

*Nota Importante.* siempre es mejor usar la cuenta mas vieja por seguridad y confianza a los usuarios, si tienes dudas escribenos primero.

Gracias por utilizar nuestros servicios
*Este no es un mensaje automatico*
La Pulga Virtual";

				foreach($arrTel as $tel) $opciones .= mensajewame($tel, $mensaje, "Cambia clave");


				// entrar a mi pulga
				$mensaje = 
"Para entrar a tus publicaciones directamente usa este enlace https://www.lapulga.com.do/mipulga_{$row['SESSION']}";

				foreach($arrTel as $tel) $opciones .= mensajewame($tel, $mensaje, "Enlace a mi pulga");
				// fecha registro
				$fecharegistro = "";
				/*
				if ($row['DIASREGISTRADO'] >= 2) {
					$fecharegistro = "*el {$row['CREADA']} hace {$row['DIASREGISTRADO']} dias* ";
					// activa cuenta inactivo viejo
					$urlinactivo = 
"Hola {$row['NOMBRE']} 

Te escribe el Administrador de La Pulga Virtual, te registraste {$fecharegistro} y por alguna razon no activaste la cuenta, *hicimos una revision y activamos por ti*.

Puedes empezar a usarla, si tienes alguna duda u olvidaste tu clave usa este enlace:

https://www.lapulga.com.do/olvideclave

Gracias por utilizar nuestros servicios.

Recuerda *quedarte en casa*

*Este no es un mensaje automatico*

Equipo LP.";	

					foreach($arrTel as $tel) $opciones .= mensajewame($tel, $urlinactivo, "Usuario Inactivo viejo!");
				} else {
					
					*/
					// activacion cuenta reciente
					$urlinactivo = 
				
"Hola {$nombre[0]}, la cuenta que creaste en *La Pulga Virtual* con el email *{$row['EMAIL']}* esta inactiva todavia{$publicaciones}.

click en este enlace para activar, si no confias en el enlace escribenos primero. 

si no te funciona nos dejas saber

*Gracias por utlizar los servicios de La Pulga Virtual*";	

					// linnk cuenta reciente
					$urlinactivolnk = 
				
"www.lapulga.com.do/activausuario/{$row['SESSION']}?act={$row['ID']}";	

					foreach($arrTel as $tel) $opciones .= mensajewame($tel, $urlinactivo, "Usuario Inactivo nuevo!");
					foreach($arrTel as $tel) $opciones .= mensajewame($tel, $urlinactivolnk, "Link Usuario Inactivo nuevo!");

					// mensaje nueva version
					$msgversion = 
				
"Hola {$nombre[0]}, en los proximos dias tendremos una nueva verion con muchas mejoras e innovaciones por lo que nos gustaria visites nuestro blog para mas informacion en https://blog.lapulga.com.do

Tu cuenta esta registrada con el email *{$row['EMAIL']}*, si no recuerdas la clave usa este enlace https://www.lapulga.com.do/cambiaclave/{$row['SESSION']}?pwd={$row['PASSWORD']}.

*Gracias por utlizar los servicios de La Pulga Virtual*";	


					foreach($arrTel as $tel) $opciones .= mensajewame($tel, $msgversion, "Mensaje version nueva");
					
					
			//	}
				// mensaje solo de saludo y no tiene publicaciones
				$urlsaludo = 
"Hola {$nombre[0]} 

Te escribe el Administrador de La Pulga Virtual veo que no tienes publicaciones y me gustaria saber si hubo algun problema al momento de publicar. 

Estare esperando tus comentarios por si en algo te podemos ayudar.

*Este no es un mensaje automatico*

Equipo LP";				

				foreach($arrTel as $tel) $opciones .= mensajewame($tel, $urlsaludo, "Saludar no publicaciones!");

				// mensaje seguimiento a no activacion 
				$urlsaludo = 
"Hola {$nombre[0]} 

Vemos que aun no has activado la cuenta en *La Pulga Virtual*, queremos saber si has tenido problemas con el enlace anterior?. 

Estare esperando tus comentarios por si en algo te podemos ayudar.

*Este no es un mensaje automatico*

Equipo LP";				

				foreach($arrTel as $tel) $opciones .= mensajewame($tel, $urlsaludo, "Seguiento no activacion!");

				$textareas.= "<b style=\"display:block;\">Saludos</b><textarea id=\"s{$row['ID']}\" cols=\"60\" rows=\"2\" class=\"textamsjpred\" onclick=\"this.select(); document.execCommand('Copy');\">{$urlsaludo}</textarea><br>";

			/*	$urlgomas = 

"Hola {$nombre[0]} 

Te escribe el Administrador de La Pulga Virtual, quiero ayudarte con las publicaciones de gomas que haces.

Tenemos en la pagina un nuevo buscador y seccion solo para gomas de vehiculos y si puedes envianos el listado de todo tu inventario para publicarlo gratis.

Lo haces en word o excel donde pones el numero de la goma en ejemplo 255/60/15 y el precio.  Si vendes aros dejame saber tambien, estare atenta, esto te puede ayudar mucho.

Mira un ejemplo de como quedan https://www.lapulga.com.do/publicaciones/jasonchistophelouis/265362

*Este no es un mensaje automatico*

Equipo LP
";				*/

// usado para las armas temporalmente

$urlgomas = 

"Hola {$nombre[0]} 

Debido a las políticas de las redes sociales y buscadores de bloquear los sitios con contenido y publicaciones de armas de fuego y relacionados tendremos que detener las publicaciones.  Hasta el momento somos el único portal que acepta este tipo de publicaciones por lo que ya en los próximos días tendremos que no permitir dichas publicaciones.

Hemos estado considerando alternativas para que sus publicaciones puedan ser vistas pero deben ser solo para usuarios registrados los cuales puedan hacer login y ver esa categoría aunque hasta el momento no está definido si será así o no.

Si tiene algún comentario nos deja saber y así buscar una solución para que puedan continuar con sus publicaciones en el portal en caso de que de la manera que se piense no afecte.

*Este no es un mensaje automatico*

Equipo LP
";				
				
				foreach($arrTel as $tel) $opciones .= mensajewame($tel, $urlgomas,"Armas");
				$textareas.= "<b style=\"display:block;\">Gomas</b><textarea cols=\"60\" rows=\"2\" class=\"textamsjpred\" onclick=\"this.select(); document.execCommand('Copy');\">{$urlgomas}</textarea><br>";
				// pulibcaiones excedidas
				$texto = 
"Saludos {$nombre[0]}, le escribo de La Pulga Virtual para indicarle que ha excedido el limite de publicaciones para el plan básico. Para mas información favor comunicarse por esta misma vía. 

Gracias por utilizar nuestros servicios 

*Este no es un mensaje automatico*

Equipo LP";	

				foreach($arrTel as $tel) $opciones .= mensajewame($tel, $texto, "¡Está excedido!");

				$textareas.= "<b style=\"display:block;\">¡Usuario Excedido!</b><textarea cols=\"60\" rows=\"2\" class=\"textamsjpred\" onclick=\"this.select(); document.execCommand('Copy');\">{$texto}</textarea><br>";
				// usuario para plan
				$texto = 
"Saludos {$nombre[0]} 

Le escribe el Administrador de La Pulga Virtual para notificarle que usted aplica y es candidato para tener un plan de usuario con nosotros.

Para mas información favor comunicarse por esta misma vía.

Gracias por utilizar nuestros servicios

*Este no es un mensaje automatico*

Equipo LP";

				foreach($arrTel as $tel) $opciones .= mensajewame($tel, $texto, "Usuario para plan");
				// $textareas.= "<b style=\"display:block;\">¡Usuario Potencial!</b><textarea cols=\"60\" rows=\"2\" class=\"textamsjpred\" onclick=\"this.select(); document.execCommand('Copy');\">{$texto}</textarea><br>";
				// plan expirado 
				$texto = 
"Saludos {$nombre[0]} 

Le escribo de La Pulga Virtual para notificarle que su plan expiró. Para mantener el excedente de publicaciones al plan basico es recomendable que su plan este activo. Puede renovar por varios meses y obtener descuento.

Para mas información favor comunicarse por esta misma vía.

haga su solicitud de renovacion en este enlace https://www.lapulga.com.do/planes

*Este no es un mensaje automatico*

Equipo LP";

				foreach($arrTel as $tel) $opciones .= mensajewame($tel, $texto, "¡Plan Expirado!");

				// solicita extension 
				$texto = 
"Saludos {$nombre[0]} 

Le escribe el Administrador de La Pulga Virtual para saber si necesitas hacer mas publicaciones. Dejanos saber para hacerte una extension *totalmente gratuita*, estaremos a la espera de tus comentarios.

Gracias por utilizar nuestros servicios.

*Este no es un mensaje automatico*

Equipo LP";

				foreach($arrTel as $tel) $opciones .= mensajewame($tel, $texto, "¡Para extension!");

				//$textareas.= "<b style=\"display:block;\">¡Plan Expirado!</b><textarea cols=\"60\" rows=\"2\" class=\"textamsjpred\" onclick=\"this.select(); document.execCommand('Copy');\">{$texto}</textarea><br>";	
			} else $opciones="<td align=\"center\" colspan=\"2\"><h3>Usuario Retirado, no aplica para mensaje</h3></td>";
			$retirar = "<a href=\"javascript:;\" class=\"ccampo verde\" id=\"USU_ESTATUS_R_{$row['ID']}\">Retirar</a>";
			$municipio = isset($arrMunicipios[$row['MUNICIPIO']]) ? $arrMunicipios[$row['MUNICIPIO']] : "N/D";
			$retirar = ($row['ESTATUS'] == 'A') ? $retirar : (($row['ACTIVADA'] != '0000-00-00 00:00:00') ? "<a href=\"javascript:;\" class=\"ccampo rojo\" id=\"USU_ESTATUS_A_{$row['ID']}\">Activar</a>" : "<a href=\"javascript:;\" class=\"ccampo rojo\" id=\"USU_ACTIVARN_A_{$row['SESSION']}\">Activar N</a><br>{$retirar}<br><a href=\"javascript:;\" class=\"ccampo \" id=\"USU_EMAACTIVA_A_{$row['SESSION']}\">Email A</a>");
			
			// "<input type=\"text\" onclick=\"this.select(); document.execCommand('Copy');\" value=\"{$proturl}www.lapulga.com.do/activausuario/{$row['SESSION']}\" size=\"5\"/><br>{$retirar}");
			$retirar = ($row['ESTATUS'] == 'R') ? "" : $retirar;
			// $perfilfb = ($row[')  https://www.facebook.com/profile.php?id=100016497753520
			$clase = ($row['ESTATUS'] == 'R') ? "danger" : (($row['ESTATUS'] == 'I') ? "warning" : "active");
			$clase = "class=\"{$clase}\"";
			$provincia = isset($arrProvincias[$row['PROVINCIA']]) ? $arrProvincias[$row['PROVINCIA']] : "No disponible";
			// agrega cantidad de cuentas por el telefono
			$cuentas = ($row['CUENTAS'] > 1) ? " <span class=\"rojo\">Ctas({$row['CUENTAS']})</span>" : "";
			$bloquea = ($_SESSION['lp_plan'] == 'OP1') ? "<a href=\"javascript:;\" id=\"{$row['TELEFONO1']}\" title=\"Bloque telefono\" class=\"admnotel\">Block</a> {$cuentas}" : "{$cuentas}";
			// $clasetel = (!in_array(explode(" ", $row["TELEFONOS"])[0], $arrTelPermitidos)) ? "danger" : "";
			$clasetel = (!in_array(substr($row["TELEFONO1"],1,3), $arrTelPermitidos)) ? "danger" : "";
			if($row['PUBLICACIONES'] <= 0 and $row["ESTATUS"] == "A") {
				$ceropub = "<a target=\"_blank\" href=\"/admin.klk?uid={$row["ID"]}\" class=\"klkmin\"></a> &nbsp;";
				$ceropub .= whatsapptel($row["TELEFONO1"], $urlsaludo, "<i class=\"fa fa-whatsapp\"></i>", false);
				$ceropub ="<span class=\"pull-right\">{$ceropub}</span>";
			} else $ceropub = "";
			$inactivo = $inactivolnk = "";
			if ($row['ESTATUS'] == 'I') {
				//foreach($arrTel as $tel) $inactivo .= whatsapptel($tel, $urlinactivo, ($row['DIASREGISTRADO'] >= 2) ? "Msg activo V" : "Contacta");
				foreach($arrTel as $tel) $inactivo .= mensajewame($tel, $urlinactivo,"Mensaje Activo",10);
				foreach($arrTel as $tel) $inactivolnk .= mensajewame($tel, $urlinactivolnk,"Link Activo",10);
			}
			// temporal borrar text area
			$textareas = "";
			$fila .= "<tr {$clase}>
						<td>{$row['ENLACE']}</td>
						<td>
							{$row['NOMBRE']} {$row['PUBLICACIONESF']}{$ceropub} ({$row['REGISTRADO']})<br>
							<a href=\"mailto:{$row['EMAIL']}\">{$row['EMAIL']}</a> (<a href=\"/admin.perfilusuario?tipo=historialPines&uid={$row['ID']}\" target=\"/admin.perfilusuario\" title=\"Ver historial pines\" class=\"ttb\">{$row['BALANCE']}</a>)<br>
							{$row['USUENLACE']} (<a href=\"/admin.perfilusuario?tipo=historialPlanes&uid={$row['ID']}\" target=\"/admin.perfilusuario\" title=\"Ver historial planes\" class=\"ttb\">{$row['USUPLAN']}</a>) | <a href=\"/admin.perfilusuario?uid={$row['ID']}&tipo=modificaUsu\" target=\"admin.perfilusuario\">MU</a> | {$paga}
						</td>
						<td class=\"{$clasetel}\">{$row['TELEFONOS']}<br>{$bloquea}<br>{$inactivo}<br>{$inactivolnk}</td>
						<td>{$row['CREADA']}<br>{$row['FECHALOGINF']}<br>{$row['ACTIVADAF']}{$usuhasta}</td>
						<td>{$municipio}<br>{$provincia}<br>{$row['IPADDRESS']}</td>
						<td>{$retirar}<br><a href=\"javascript:;\" class=\"cambia\" id=\"{$row['ID']}\">Mensajes</a></td>
					</tr>
					{$seguimiento}
					<tr class=\"apaga\">
						<td colspan=\"2\">Solo dar click y pegar en Whatsapp<br>{$opciones}</td><td colspan=\"4\">{$textareas}</td>
					</tr>";				
		}
		return $fila;
	}	
	/**
	 * @method bool|string Comentarios() Metodo que listara los comentarios de un usuario
	 * @return string en caso de que el parametro "return" este false (true si trae usuarios, false si no trae o se produce un error)
	 */
	function comentariosUsu() {
		$fila = "";
		while ($row = $this->result->fetch_assoc()) {
			$clase = ($row['PRIORIDAD'] == 'A') ? "danger" : "active";
			$clase = "class=\"{$clase}\"";
			$fila .= "<tr {$clase}>
						<td>{$row['COMENTARIO']}</td>
						<td>{$row['FECHAF']}</td>
						<td>{$row['OPERADOR']}</td>
						<td>{$row['SEGUIMIENTO']} ({$row['DIAS']} dias)</td>
					</tr>";				
		}
		return $fila;
	}	
	/**
	 * @method bool|string cambiosUsu() Metodo que listara los cambios a registros hechos por el usuario
	 * @return string en caso de que el parametro "return" este false (true si trae usuarios, false si no trae o se produce un error)
	 */
	function cambiosUsu() {
		$fila = "";
		while ($row = $this->result->fetch_assoc()) {
			$valor ="";
			if ($row['TABLA'] == "{$this->prefijo_tabla}ARTICULOS") {
				$arrCampo = explode("|",$row['CAMPO']);
				$campo = $arrCampo[0];
				$idpub = isset($arrCampo[1]) ? $arrCampo[1] : "N/A";
				$campo = "{$campo}<br>ID.: <a href=\"/?id={$idpub}\" target=\"/\">{$idpub}</a>";
			} else {
				switch($row['CAMPO']) {
					case 'TELEFONO1':
					case 'TELEFONO2':
					case 'TELEFONO3':
						$campo = $row['CAMPO'];
						$valor = "<a href=\"/admin.usuarios?q={$row['VALOR']}\" target=\"/admin.usuarios\">{$row['VALOR']}</a>";
					break;
					default:
						$campo = $row['CAMPO'];
						$valor = $row['VALOR'];
					break;
						
				}
			}
			if ($row['USUARIO'] == $this->uid) {
				$row['USUARIO'] = "Mismo";
			} else $row['USUARIO'] = "<a href=\"/admin.perfilusuario?uid={$row['USUARIO']}&tipo=comentariosUsu\" target=\"/admin.perfilusuario\">{$row['USUARIO']}</a>";
			$fila .= "<tr>
						<td>{$row['TABLA']}</td>
						<td>{$campo}</td>
						<td>{$valor}</td>
						<td>{$row['FECHAF']}</td>
						<td>{$row['IPADDRESS']}</td>
						<td>{$row['USUARIO']}</td>
					</tr>";				
		}
		return $fila;
	}	
	/**
	 * @method bool|string entradasUsu() Metodo que listara las entradas o logins de un usuario
	 * @return string en caso de que el parametro "return" este false (true si trae usuarios, false si no trae o se produce un error)
	 */
	function entradasUsu() {
		$fila = "";
		while ($row = $this->result->fetch_assoc()) {
			$fila .= "<tr>
						<td>{$row['FECHAF']}</td>
						<td>{$row['IPADDRESS']}</td>
						<td>{$row['HOST']}</td>
					</tr>";				
		}
		return $fila;
	}	
	/**
	 * @method bool|string historialPublicaciones() Metodo que listara historial publicaciones de un usuario
	 * @return string en caso de que el parametro "return" este false (true si trae usuarios, false si no trae o se produce un error)
	 */
	function historialPublicaciones() {
		global $arrCategorias;
		$fila = "";
		$id = 0;
		while ($row = $this->result->fetch_assoc()) {
			$id = $row['ID'];
			$clase = $reshasta = "";
			// $arrRegistros[] = $row;
			$categoria = isset($arrCategorias[$row['CATEGORIA_ID']]) ? $arrCategorias[$row['CATEGORIA_ID']] : "No aplica";
			//input con array de fotos
			$inputArrf = "<input type=\"hidden\" id=\"arrFotos_{$row['ID']}\" value='{$row['FOTOS']}' class=\"arrFotos form-control\">";
			// nueva funcion fotoLista para generar el html de cada imagen, solo usada aqui mientras
			$flista = $this->fotoLista($row['FOTOS'],120);
			$row['FOTOS'] = count(explode(",",$row['FOTOS']));
			// acciones
			$accionRetirar = ($row['ESTATUS'] == 'A') ? "<a href=\"javascript:;\" class=\"ccampo verde\" id=\"ART_ESTATUS_RO_{$row['ID']}\">Retirar</a>" : "<a href=\"javascript:;\" class=\"ccampo rojo\" id=\"ART_ESTATUS_A_{$row['ID']}\">Activar</a>";
			$accionFotos = "<a href=\"javascript:;\" name=\"admresfot\" id=\"admresfot-{$row['ID']}\" title=\"Eliminar todas las fotos de esta publicaci&oacute;n\" class=\"admresfot\">E. Fotos</a>";

			$accionEditar = "<a href=\"/modificapublicacion/{$row['ID']}\" name=\"admmodtitulo\" id=\"". urlencode("{$row['CATEGORIA_ID']}-{$row['SUBCATEGORIA_ID']}|{$row['ARTICULO']}|{$row['PRECIO']}|{$row['MONEDA']}|{$row['TIPO']}|{$row['CONDICION']}") ."\" title=\"{$row['ARTICULO']}\" rel=\"{$row['ID']}\" class=\"momodificapu\">Editar{$inputArrf}</a>";

			$accionAdwords = ($row['PUBLICIDAD'] == 'S') ? "<a href=\"javascript:;\" name=\"admpublicidad\" id=\"admpublicidad-{$row['ID']}-N\" title=\"Quitar de Adwords\" class=\"admpublicidad\">Q. Adwords</a>" : "<a href=\"javascript:;\" name=\"admpublicidad\" id=\"admpublicidad-{$row['ID']}-S\" title=\"Añadir a Adwords\" class=\"admpublicidad\">P. Adwords</a>";
			if ($row['RESALTADO'] == 'R') {
				$clase = " class=\"resal\""; 
				$reshasta = "<b>Res.: </b>{$row['RESHASTA']}<br>";
			}
			$estatus = ($row['ESTATUS'] != 'A') ? "Estatus.: {$row['ESTATUS']}" : "";
			$fila .= "<tr {$clase} id=\"pART_ESTATUS_RO_{$row['ID']}\">
						<td align=\"center\"><label for=\"{$row['ID']}\"><input id=\"{$row['ID']}\" type=\"checkbox\" name=\"sel[]\" rel=\"{$row['USUARIO_ID']}\" value=\"{$row['ID']}\"></td>
						<td align=\"center\">{$flista}</td>
						<td><a href=\"/?id={$row['ID']}\" target=\"/\">{$row['ARTICULO']}</a><br>
							<b>Precio.: </b>{$row['PRECIOF']}<br>
							{$categoria} > {$row['SUBCATEGORIA']}<br>
							<b>ID.: </b>{$row['ID']}, <b>Fotos.: </b>{$row['FOTOS']}
						</td>
						<td><b>Pub.: </b>{$row['FECHA']}<br><b>Vis.: </b>{$row['VISITADO']}<br>{$reshasta}<b>Visitas.: </b>{$row['VISITAS']}, <b>Acum.: </b>{$row['ACUMULADAS']}<br>{$estatus}</td>
						<td align=\"center\">{$accionRetirar}<br>{$accionFotos}<br>{$accionEditar}<br>{$accionAdwords}</td>
					 </tr>";		
		}
		$this->buscaPublicacion($id,-2);
			// $arrRegistros = serialize($arrRegistros);
			// $fp = fopen (RUTA . "include/registrospublicaciones.inc.php", "wb");
			// fwrite($fp,$arrRegistros,strlen($arrRegistros));
			// fclose($fp); 
		return $fila;
	}
	/**
	 * @method str|string histEstatusPub() Metodo que recuenta la forma o estado de publiaciones
	 * @param   	uid id del usuario
	 * @return int cantidad penalidades
	 */
	function histEstatusPub($uid) {
		$qryString = "SELECT PUBLICACIONES-(PUBLICACIONESRO+PUBLICACIONESRU) AS A, PUBLICACIONESRO AS RO, PUBLICACIONESRU AS RU FROM {$this->prefijo_tabla}USUARIOS WHERE ID='{$uid}'";
		$result = $this->db->query($qryString);
		if (!$result){
			$this->qryError($qryString,__FUNCTION__);
			return "";
		} 
		$lista = "Resumen por Estatus:<br>";
		$row = $result->fetch_assoc();
		$lista .= "A = {$row['A']}<br>";
		$lista .= "RU = {$row['RU']}<br>";
		$lista .= "RO = {$row['RO']}";
		return $lista;
		
	}	
	/**
	 * @method bool|string historialPlanes() Metodo que listara historial planes
	 * @return string en caso de que el parametro "return" este false (true si trae usuarios, false si no trae o se produce un error)
	 */
	function historialPlanes() {
		$fila = "";
		global $arrFormaPago;
		while ($row = $this->result->fetch_assoc()) {
			$moneda = ($row['FORMAPAGO'] == 'PP') ? "US\$" : "RD\$";
			$totaldesc = ($row['VALOR'] * $row['CANTIDAD'])  - (($row['VALOR'] * $row['CANTIDAD']) * $row['DESCUENTO'] / 100);
			$totaldesc = number_format($totaldesc,2);
			
			$fila .= "<tr>
						<td><a href=\"javascript:;\" class=\"cambia\" id=\"{$row['ID']}\">{$row['ID']}</a></td>
						<td align=\"center\">{$row['TIPO']}</td>
						<td align=\"center\">{$row['CANTIDAD']}</td>
						<td align=\"right\">{$row['VALORF']}<br>{$row['DESCUENTO']}%</td>
						<td align=\"right\">{$moneda}{$row['TOTALF']}<br><b>{$moneda}{$totaldesc}</b></td>
						<td>{$arrFormaPago[$row['FORMAPAGO']]}</td>
						<td>{$row['FECHAF']}<br>{$row['PROCESADOF']}<br>{$row['HASTA']} {$row['VIGENTE']}</td>
						<td>{$row['ESTATUSF']}</td>
					 </tr>
					 <tr class=\"apaga\">
						<td colspan=\"8\">{$row['TRANSACCION']}</td>
					 </tr>";		
		}
		return $fila;
	}	
	/**
	 * @method bool|string historialPenalidades() Metodo que listara historial de penalidades y preavisos
	 * @return string en caso de que el parametro "return" este false (true si trae usuarios, false si no trae o se produce un error)
	 */
	function historialPenalidades() {
		$fila = "";
		global $arrPenalidad;
		while ($row = $this->result->fetch_assoc()) {
			$row['ULTIMOF'] = ($row['INTENTOS'] > 0) ? "<br>{$row['ULTIMOF']} ({$row['INTENTOS']})" : "";
			$fila .= "<tr>
						<td>{$row['ID']}</td>
						<td>{$row['FECHAF']}</td>
						<td><a href=\"javascript:;\" class=\"cambia\" id=\"{$row['ID']}\">{$arrPenalidad[$row['PENALIDAD']]}</a></td>
						<td>{$row['DIAS']}</td>
						<td>{$row['HASTAF']}{$row['ULTIMOF']}</td>
						<td>{$row['ESTATUSF']}</td>
					 </tr>
					  <tr class=\"apaga\">
						<td colspan=\"6\">{$row['COMENTARIO']}</td>
					 </tr>";		
		}
		return $fila;
	}	
	/**
	 * @method bool|string penalidades() Metodo que cuenta cuantas penalidades ha tenido el usuario 
	 * @param   	uid id del usuario
	 * @return int cantidad penalidades
	 */
	function penalidades($uid) {
		$qryString = "SELECT COUNT(*) AS CUANTOS FROM {$this->prefijo_tabla}PENALIDADES WHERE USUARIO_ID='{$uid}'";
		$result = $this->db->query($qryString);
		if (!$result){
			$this->qryError($qryString,__FUNCTION__);
			return "";
		} else return $result->fetch_object()->CUANTOS;
	}	
	/**
	 * @method bool|string listadoExtensiones() Metodo que listara productos para procesar
	 * @return string en caso de que el parametro "return" este false (true si trae usuarios, false si no trae o se produce un error)
	 */
	function listadoExtensiones() {
		$fila = "";
		while ($row = $this->result->fetch_assoc()) {
			//parr($row);
			$opciones = "";
			if ($row['ESTATUS'] == 'P') {
				$row['PROCESADOF'] = "No procesado";
				// para whatsapp
				$mensaje = "Hola {$row['NOMBRE']} soy {$_SESSION['lp_nombre']} de La Pulga Virtual hablemos sobre su solicitud de extension de publicaciones.";
				
				$subject = "Informacion solicitud de EXTENSION No. {$row['ID']}";
				$accion =  "<a href=\"javascript:;\" id=\"{$row['ID']}_{$row['USUARIO_ID']}_{$row['USUARIO']}_A\" class=\"procesaext \" title=\"Aprobar solicitud\">Apr</a> | <a href=\"javascript:;\" id=\"{$row['ID']}_{$row['USUARIO_ID']}_{$row['USUARIO']}_C\" class=\"procesaext rojo\" title=\"Cancelar solicitud\">Can</a> | <a href=\"mailto:{$row['EMAIL']};m.german@lapulga.com.do&subject={$subject}\" title=\"Envia mensaje\">Msg</a>";
				$accion .= " |<br>" . whatsapptel($row['USUTEL'], $mensaje,$row['USUTEL'], false);				
				
			} else $accion = "No requiere";
			$row['PENALIDADES'] = $this->penalidades($row['USUARIO_ID']);
			$extension = 
				"<select id=\"ext{$row['ID']}\">
					<option value=\"0\" selected>Seleccione</option>
					<option value=\"5\">5 Publicaciones</option>
					<option value=\"10\">10 Publicaciones</option>
					<option value=\"15\">15 Publicaciones</option>
					<option value=\"20\">20 Publicaciones</option>
					<option value=\"25\">25 Publicaciones</option>
					<option value=\"30\">30 Publicaciones</option>
					<option value=\"50\">50 Publicaciones</option>
					<option value=\"100\">100 Publicaciones</option>
				</select>";
				// mensajes via whatsapp
			$nombre = explode(" ",$row['NOMBRE']);			

				$aprobado = 
"Hola {$nombre[0]}, la extension de publicaciones que solicitó *FUE APROBADA*, puede continuar publicando, le enviamos mas informacion al correo {$row['EMAIL']}.

https://www.lapulga.com.do/publicar/{$row['SESSION']}

Gracias por utilizar nuestros servicios
*Este no es un mensaje automatico*
La Pulga Virtual";

				$opciones .= mensajewame($row['USUTEL'], $aprobado, "Aprobado",15);

				$cancelado = 
"Hola {$nombre[0]}, la extension de publicaciones que solicitó *NO FUE APROBADA*, puede revisar las publicaciones actuales y eliminar las que ya no esten vigentes o repetidas en *mipulga*.

https://www.lapulga.com.do/mipulga

Gracias por utilizar nuestros servicios
*Este no es un mensaje automatico*
La Pulga Virtual";

				$opciones .= mensajewame($row['USUTEL'], $cancelado, "Cancelado",15);


			
			$fila .= "<tr>
						<td><a href=\"javascript:;\" class=\"cambia ttb\" id=\"{$row['ID']}\" title=\"Ver comentario agregado\">{$row['ID']}</a></td>
						<td><a href=\"/admin.perfilusuario?op=adperusu&uid={$row['USUARIO_ID']}\" title=\"Ver perfil\" target=\"_blank\">{$row['NOMBRE']}</a></td>
						<td align=\"right\"><a href=\"/admin.perfilusuario?tipo=historialPublicaciones&ob=Activas&fld=art&orde=asc&uid={$row['USUARIO_ID']}\" target=\"_blank\">{$row['PUBLICACIONES']}</a></td>
						<td align=\"right\"><a href=\"/admin.perfilusuario?tipo=historialPenalidades&uid={$row['USUARIO_ID']}\" target=\"_blank\">{$row['PENALIDADES']}</td>
						<td align=\"right\">{$extension}{$opciones}</td>
						<td>{$row['FECHAF']}<br>{$row['PROCESADOF']}</td>
						<td>{$accion}</td>
					 </tr>
					 <tr class=\"apaga\">
						<td colspan=\"7\">{$row['COMENTARIO']}</td>
					 </tr>";		
		}
		return $fila;
	}		
	/**
	 * @method bool|string listadoPrestamos() Metodo que listara solicitudes de perstamos
	 * @return string en caso de que el parametro "return" este false (true si trae usuarios, false si no trae o se produce un error)
	 * @global arrFases
	 */
	function listadoPrestamos() {
		$fila = "";
		global $arrFases;
		global $brwa;
		/* valor estatus
		I - incompletos
		S - solicitud completar
		C - SOLICITUD CANCELADA
		P - SOLICITUD APROBADA POR FINANCIERA
		D - SOLICITUD DESEMBOLSADA
		*/
		/// listado de estadisticas por semanas, opcion en select listado
		if(isset($_GET["tipo"]) and $_GET["tipo"] == "estadisticas") {
			$arrColors = array("P"=>"bg-info","D"=>"bg-success","C"=>"bg-danger","I"=>"bg-warning","S"=>"bgazul");
			$arrNombres = array("P"=>"procesadas","D"=>"desembolsadas","C"=>"canceladas","I"=>"incompletas","S"=>"recibidas");
			$total = 0;
			$arrId = array();
			$montoTotal = 0;
			$valorTotal = 0;
			$datosES = "<ul class=\"col-sm-12\">";
			$fila.="<div class=\"estadisticas\">";
			while ($row = $this->result->fetch_assoc()) {
				$tam = $row["TOTAL"];
				$total += $row["TOTAL"];
				$montof = number_format($row["MONTO"]);
				$valorf = number_format($row["VALOR"]);
				$arrId[] = "#es{$row["ID"]}";
				$montoTotal += $row["MONTO"];
				$valorTotal += $row["VALOR"];
				$fila.= "
					<div class=\"cont_barra\">
						<div class=\"{$arrColors[$row['ESTATUS']]} ttb\" rel=\"{$tam}\" target='{$montof}' id=\"es{$row["ID"]}\"></div>
						<span>{$row["TOTAL"]} {$arrNombres[$row['ESTATUS']]}</span>
					</div>";
				$fmin = fechaCastellano($row['FMIN']);
				$fmax = fechaCastellano($row['FMAX']);
				$datosES .= "<h4><b>Desde.:</b> {$fmin}<b> -Hasta.:</b> {$fmax}</h4>";
				$datosES .= "<li><b>Solicitudes {$arrNombres[$row["ESTATUS"]]}.:</b> {$row["TOTAL"]}</li>";
				$datosES .= "<li><b>Monto {$arrNombres[$row["ESTATUS"]]}.:</b> RD$ {$montof}</li>";
				$datosES .= "<li><b>Valor en vehículos {$arrNombres[$row["ESTATUS"]]}.:</b> RD$ {$valorf}</li>";
			}
			$datosES .= "<h4>Totales:</h4>";
			$datosES .="<li><b>Monto Total.:</b>  RD$ ".number_format($montoTotal)."</li>";
			$datosES .="<li><b>Valor de Vehiculos total.:</b> RD$ ".number_format($valorTotal)."</li>";
			foreach($arrId as $id) $fila.=jscripts("var tam = $('".$id."').attr('rel'); var monto = $('".$id."').attr('target'); $('".$id."').height(tam / ".$total."*100 + '%'); $('".$id."').attr('title', tam / ".$total."*100 + '% de todas las solicitudes de esa semana. <br> RD$'+monto+' total solicitado.');",0);
			$fila.= "<div class=\"flexr flexch\" style=\"position:absolute; top:10px; right:10px; font-weight:bold; max-width:400px; display:inline;\"><span>Monto total.: <br> RD$ ". number_format($montoTotal)."</span> &nbsp; <span>Total Vehiculos.: <br> RD$ ". number_format($valorTotal)."</span></div>";
			$fila.="</div>";
		} else {
			// listado de prestamos
			while ($row = $this->result->fetch_assoc()) {
				$acciones = (isset($_GET["estatus"]) and $_GET["estatus"] == "D") ? "" : "<td  style=\"width:5px;\"><a onclick=\"ajaxcambiacampo('PRT_ESTATUS_D_{$row["ID"]}', '', '','prt{$row["ID"]}');ajaxcambiacampo('PRT_FASE_5_{$row["ID"]}','no');\" href=\"javascript:;\" style=\"line-height:25px;\" title=\"Desembolsado!\"><i class=\"fa fa-check verde\"></i></a><a onclick=\"ajaxcambiacampo('PRT_ESTATUS_P_{$row["ID"]}', '', '','prt{$row["ID"]}');\" href=\"javascript:;\" style=\"line-height:25px;\" title=\"Aprobado financiera\"><i class=\"fa fa-arrow-right azul\"></i></a><a onclick=\"ajaxcambiacampo('PRT_ESTATUS_C_{$row["ID"]}', '', '','prt{$row["ID"]}');\" href=\"javascript:;\" title=\"Declinar\"><i class=\"fa fa-times rojo\"></i></a></td>";
				$comentario = "";
				if($row["ESTATUS"] == "C")  $clase= "bg-danger";
				elseif($row["ESTATUS"] == "P") $clase = "bg-info";
				elseif($row["ESTATUS"] == "D") $clase = "bg-success";
				elseif(isset($row["ESTATUS"]) == "I") $clase = "bg-warning";
				else $clase = "";
				foreach (explode("|",$row["COMENTARIO"]) as $k => $cmts) {
					if($k == 0) continue;
					$comentario .= "<br>" . $cmts;
				}
				$row['NOMBRE'] = trim(ucwords(strtolower($row['NOMBRE'])));
				$mensaje = "Favor verificar la siguiente solicitud de financiamiento.\n\n";
				$mensaje .= "Numero solicitud: {$row["ID"]}\n";
				$mensaje .= "Fecha...........: {$row["FECHA"]} \n";
				$mensaje .= "Nombre..........: {$row['NOMBRE']}\n";
				$mensaje .= "Cedula..........: {$row['CEDULA']}\n";                   
				$mensaje .= "Email...........: {$row['EMAIL']}\n";
				$mensaje .= "Telefono........: {$row['TELEFONO1']}\n";   
				$mensaje .= "Celular.........: {$row['TELEFONO2']}\n";       
				if ($row['TIPO'] == 'VEH') {
					$mensaje .= "Marca, Modelo y Año..: ". ucwords($row['TIPOINFO']) ."\n";				 
					$mensaje .= "Valor...........: RD\$" . $row['VALOR'] . "\n";                   
				} 
				$mensaje .= "Monto Solicitado: " . $row['MONTO'] . "\n";    
				$mensaje .= "Comentario......: " . explode("|",$row["COMENTARIO"])[0] . "\n\n"; 
				$mensaje .= "Evaluacion del solicitante:\n\n";
				$msjw = ($row["ESTATUS"] == "S") ? "Saludos {$row["NOMBRE"]},{$brwa} Le escribe {$_SESSION['lp_nombre']} de La Pulga Virtual, es con relación a la solicitud de financiamiento que realizo, me gustaría saber si aun esta interesado para continuar con el proceso." : "Saludos {$row["NOMBRE"]}, Le escribe {$_SESSION['lp_nombre']} de La Pulga Virtual, es con relación a su solicitud de financiamiento, necesitamos completar sus datos para referirlo a nuestras financieras afiliadas, nos gustaría saber si continua interesado para proceder con el evnio de sus datos.";

				$msjw1 = "Saludos {$row["NOMBRE"]}, le escribimos de La Pulga Virtual, es con relación a la solicitud de financiamiento que realizó No. {$row["ID"]} por un monto de RD\${$row['MONTO']} en fecha {$row["FECHA"]}. Queremos pedir excusas por no haberle respondido antes, tenemos un cúmulo de solicitudes muy alto.  Nos gustaría saber si aun esta interesado en continuar con el proceso o cancelamos esta por el momento?.  En caso de que no desee agradecemos el utilizar nuestros servicios.";

				$nombre = whatsapptel($row["TELEFONO1"],$msjw,$row["NOMBRE"],false,true);
				$disculpa = whatsapptel($row["TELEFONO1"],$msjw1,"disculpa",false,false);
				$r = number_format(str_replace(",", "",$row["MONTO"]) * 0.05 * 0.50);
				$m = number_format(str_replace(",", "",$row["MONTO"]) * 0.05 * 0.30);
				$w = number_format(str_replace(",", "",$row["MONTO"]) * 0.05 * 0.20);
				$options = "";
				
				for ($i=0;$i<count($arrFases);$i++) {
					// $desembolsado = (isset($_GET["estatus"]) and $_GET["estatus"] == "D") ? true : false;
					$selected = (isset($row["FASE"]) and $row["FASE"] == $i ) ? "selected": "";
					$options .= "<option value=\"{$i}\" {$selected}>{$arrFases[$i]}</option>";
				}
				$fases = "<select class=\"form-control\" onchange=\"ajaxcambiacampo('PRT_FASE_'+this.value+'_{$row["ID"]}','no'); if(this.value==5) ajaxcambiacampo('PRT_ESTATUS_D_{$row["ID"]}','no','','prt{$row["ID"]}');\">
							{$options}
						</select>
						";
	 			$fila .= "
					<tr id=\"prt{$row["ID"]}\" class=\"{$clase}\">
						<td align=\"center\"><a href=\"javascript:;\" style=\"color:#000;\" class=\"cambia asunto\" id=\"pr{$row["ID"]}\">{$row['ID']} </a></td>
						<td>{$nombre} | <input type=\"text\" value=\"{$disculpa}\" onclick=\"this.select(); document.execCommand('Copy');\"><br>{$fases}</td>
						<td>{$row['CEDULA']}</td>
						<td>{$row['MONTO']}<br><b>RM.: </b>{$r}<br><b>MG.: </b>{$m} <br><b>WP.: </b>{$w}</td>
						<td>{$row['TELEFONO1']}<br>{$row['TELEFONO2']}</td>
						<td>{$row['FECHA']}</td>
						{$acciones}
						<td class=\"prtcoment\"><a id=\"PRT_COMENTARIO_A_{$row['ID']}\" rel=\"{$_SESSION["lp_nombre"]}!\"><i class=\"fa fa-comments fa-2x\" style=\"line-height:45px\"></i></a></td>
					</tr>";
					$fila.= (isset($row["EVALUACION"])) ? "<tr class=\"apaga\"><td colspan=\"7\"><textarea cols=\"70\" rows=\"10\" onclick=\"this.select(); document.execCommand('Copy');\"> {$mensaje}" . $row['EVALUACION'] . ".\n\n Esperamos encarecidamente que nos comunique su decisión para con la solicitud.</textarea><span class=\"pull-right\" style=\"word-wrap:break-word; width:250px;\">{$comentario}</span></td></tr>" : "<tr class=\"apaga\"><td colspan=\"7\"><span class=\"pull-right\" style=\"word-wrap:break-word; width:250px;\">{$comentario}</span></td></tr>"; 
			}
		}
		return (isset($datosES)) ? $datosES . $fila : $fila;
	}		
	/**
	 * @method bool|string listadoExcedidos() Metodo que listara usuarios excedidos
	 * @return string en caso de que el parametro "return" este false (true si trae usuarios, false si no trae o se produce un error)
	 */
	function listadoExcedidos() {
		$fila = "";
		while ($row = $this->result->fetch_assoc()) {
			$mensaje = "Hola {$row['NOMBRE']} soy {$_SESSION['lp_nombre']} de La Pulga Virtual quiero informarte que has excedido el numero de publicaciones que tiene el plan basico,  si necesitas ayuda para continuar publicando dejame saber y con gusto te colaboro.";
			
			$opciones = "";
			$mensaje = 
"Hola {$row['NOMBRE']} 

Vemos que has excedido el limite de publicaciones, te invitamos a que revises si hay repeticiones y en caso de, eliminarlas.

Si realmente necesitas tener mas publicaciones ponte en contacto con nosotros por esta misma via.
    
Gracias por utilizar nuestros servicios

*Este no es un mensaje automatico*

La Pulga Virtual";

			$opciones .= mensajewame($row['USUTEL'], $mensaje, "Usuario Excedido",15);			
			$accion = "<a href=\"javascript:;\" class=\"extensionpub\" id=\"{$row['USUARIO_ID']}\">Sol extension</a><br>{$opciones}";
			$fila .= "
				<tr>
					<td align=\"center\"><a href=\"/admin.perfilusuario?tipo=historialPublicaciones&ob=Activas&fld=art&orde=asc&uid={$row['USUARIO_ID']}\" target=\"_blank\">{$row['USUARIO_ID']}</a></td>
					<td>{$row['NOMBRE']} (<a href=\"/admin.perfilusuario?tipo=historialPublicaciones&ob=Activas&fld=art&orde=asc&uid={$row['USUARIO_ID']}\" target=\"_blank\" title=\"Ver publicaciones\">{$row['CANTIDAD']}</a>)</td>
					<td><a href=\"mailto:{$row['EMAIL']}&subject=Excedido de publicaciones {$row['CANTIDAD']}\" title=\"Envia mensaje a {$row['EMAIL']}\">Email</a><br>{$row['TELEFONOS']}</td>
					<td>{$row['FECHAF']}<br>{$row['CREADAF']}</td>
					<td>{$accion}</td>
				</tr>";
		}	
		return $fila;
	}		
	/**
	 * @method bool|string listadoExcedidos() Metodo que listara usuarios excedidos
	 * @return string en caso de que el parametro "return" este false (true si trae usuarios, false si no trae o se produce un error)
	 */
	function listadoRecurrentes() {
		$fila = "";
		while ($row = $this->result->fetch_assoc()) {
			$mensaje = "Saludos {$row['NOMBRE']} soy {$_SESSION['lp_nombre']} de La Pulga Virtual quiero recordarte el pago de la cuota del plan que tienes con nosotros. que has excedido el numero de publicaciones que tiene el plan basico,  puedes hacer una solicitud de extension y si aplicas la aprobamos con gusto totalmente gratis.";				
			$accion = "<br>" . whatsapptel($row['USUTEL'], $mensaje,$row['USUTEL'], false);			
			$fila .= "
				<tr>
					<td align=\"center\"><a href=\"/admin.perfilusuario?tipo=historialPublicaciones&ob=Activas&fld=art&orde=asc&uid={$row['USUARIO_ID']}\" target=\"_blank\">{$row['USUARIO_ID']}</a></td>
					<td>{$row['NOMBRE']} (<a href=\"/admin.perfilusuario?tipo=historialPublicaciones&ob=Activas&fld=art&orde=asc&uid={$row['USUARIO_ID']}\" target=\"_blank\" title=\"Ver publicaciones\">{$row['PUBLICACIONES']}</a>) ({$row['USUPLAN']})</td>
					<td>{$row['COMENTARIO']}</td>
					<td>{$row['INICIOF']}<br>{$row['INICIOF']}</td>
					<td><a href=\"mailto:{$row['EMAIL']}&subject=Excedido de publicaciones {$row['DIA']}\" title=\"Envia mensaje\">Msg</a>{$accion}</td>
				</tr>";
		}	
		return $fila;
	}		
	/**
	 * @method bool|string listadoProductos() Metodo que listara productos para procesar
	 * @return string en caso de que el parametro "return" este false (true si trae usuarios, false si no trae o se produce un error)
	 */
	function listadoProductos() {
		global $arrPlanUsuario;
		$fila = "";
		while ($row = $this->result->fetch_assoc()) {
			$moneda = ($row['FORMAPAGO'] == 'PP') ? "US\$" : "RD\$";
			if ($row['ESTATUS'] == 'P') {
				$telefono = preg_replace("/\(|\)|\-|\ +/","",$row['TELEFONO1']);
				$row['PROCESADOF'] = "No procesado";
				$subject = "Informacion sobre solicitud de producto No. {$row['ID']}";

				$mensajews = 

				"Hola {$row['NOMBRE']} la solicitud de {$arrPlanUsuario[$row['TIPO']]} No. {$row['ID']} que hiciste en La Pulga Virtual esta pendiente de pago para ser procesada, dejame saber si necesitas ayuda.";
	
				$mensajews = mensajewame($telefono, $mensajews, "Pendiente de pago", 15);

				$subject1 = "Hola {$row['NOMBRE']} soy {$_SESSION['lp_nombre']} de La Pulga Virtual, te escribo para indicarte que hiciste la solicitud de Plan o Pines No. {$row['ID']} y esta pendiente de pago para ser procesada, dejame saber si necesitas ayuda";

				$accion =  "<a href=\"javascript:;\" id=\"{$row['ID']}_{$_SESSION['lp_uid']}_A\" class=\"procesa \" title=\"Aprobar solicitud\">Apr</a> | 
				<a href=\"javascript:;\" id=\"{$row['ID']}_{$_SESSION['lp_uid']}_C\" class=\"procesa rojo\" title=\"Cancelar solicitud\">Can</a> | 
				<a href=\"mailto:{$row['EMAIL']}&subject={$subject};\" title=\"Envia mensaje\">Msg</a> | {$mensajews}";
				
			} else $accion = "No requiere";			
			
			
			
			$fila .= "<tr>
						<td><a href=\"javascript:;\" class=\"cambia\" id=\"{$row['ID']}\" title=\"Ver detalles transaccion\">{$row['ID']}</a></td>
						<td><a href=\"/admin.perfilusuario?op=adperusu&uid={$row['USUARIO_ID']}\" title=\"Ver perfil\">{$row['USUARIO']}</td>
						<td align=\"center\">{$row['TIPO']}</td>
						<td align=\"right\">{$row['CANTIDAD']}</td>
						<td align=\"right\">{$moneda}{$row['TOTALF']}<br>{$row['DESCUENTO']}%<br><b>{$moneda}{$row['TOTALD']}</b></td>
						<td align=\"center\">{$row['FORMAPAGO']}</td>
						<td>{$row['FECHAF']}<br>{$row['PROCESADOF']}</td>
						<td>{$accion}</td>
					 </tr>
					 <tr class=\"apaga\">
						<td colspan=\"8\">{$row['TRANSACCION']}</td>
					 </tr>";		
		}
		return $fila;
	}		
	/**
	 * @method bool|string listadoMensajeria() Metodo que listara mensajes de mensajeria para monitoreo y acciones
	 * @return string en caso de que el parametro "return" este false (true si trae mensajes, false si no trae o se produce un error)
	 */
	function listadoMensajeria() {
		$fila = "";
		while ($row = $this->result->fetch_assoc()) {
			$arrNombres = explode("|",$row['NOMBRE']);
			if (($row['ESTATUSDE'] != 'I') or ($row['ESTATUSPARA'] != 'I')) {
				$accion =  "<a href=\"javascript:;\" id=\"{$row['MID']}\" class=\"eklk\" title=\"Eliminar\">Eliminar</a>";
				// envio de mensaje whatsapp para notificar mensaje
				$url = "https://www.lapulga.com.do/mensajes/{$row['SESSION']}";				
				$mensaje = "Hola {$arrNombres[1]} te escribo de La Pulga Virtual quiero informarte que tienes un mensaje nuevo en KLK Messenger de alguien interesado en {$row['ASUNTO']}. 
				 Para ver tu mensaje da click en este enlace {$url}";				
				//$accion .= "<br>" . whatsapptel($row['USUTEL'], $mensaje,"Notificar", false);
				$accion .= "<br>" . mensajewame($row['USUTEL'], $mensaje, "¡Notificar",15);
			} else $accion = "No requiere";
			
			// MSG.TIPO,',',MSG.ESTATUS,',',MSG.DISPOSITIVO,',',DATE_FORMAT(MSG.FECHA,'%d-%m-%y %h:%i %p'),',',MSG.MENSAJE
			$arrMensaje = explode("|",$row['MENSAJES']);
			$lineaMensaje = "<ul>";
			$i = 1;
			foreach($arrMensaje as $k) {
				$arrElementos = explode("&",$k);
				$lineaMensaje .= "<li>Msg #{$i} {$arrElementos[0]} via {$arrElementos[1]} el {$arrElementos[2]}<br>{$arrElementos[3]}</li>";
				$i++;
			}
			$lineaMensaje .= "</ul>";
			
			// parr($arrMensaje);
			$clase = (($row['ESTATUSDE'] == 'I') and ($row['ESTATUSPARA'] == 'I')) ? "danger" : (($row['DE'] == -10) ? "warning" : "active");
			$clase = "class=\"{$clase}\"";
			$de = ($row['DE'] == -10) ? "{$row['DE']}&tipo={$row['TELEFONO']}" : $row['DE'];
			$fila .= "<tr {$clase}>
						<td><a href=\"javascript:;\" class=\"cambia\" id=\"{$row['MID']}\" title=\"Ver mensajes\">{$row['MID']}</a></td>
						<td><a href=\"/admin.klk?uid={$de}\" title=\"Ver mensajes de este usuario\" class=\"ttb\">{$row['DE']}<br>
						<a href=\"/admin.klk?uid={$row['PARA']}\" title=\"Ver mensajes de este usuario\" class=\"ttb\">{$row['PARA']}</td>
						<td><a href=\"/?id={$row['ARTICULO_ID']}\">{$row['ASUNTO']} ({$row['CANTIDAD']})</a></td>
						<td align=\"center\">{$row['ESTATUSDE']}<br>{$row['ESTATUSPARA']}</td>
						<td><a href=\"/admin.perfilusuario?uid={$row['DE']}\" target=\"blank\">{$arrNombres[0]}</a><br><a href=\"/admin.perfilusuario?uid={$row['PARA']}\" target=\"blank\">{$arrNombres[1]}</a></td>
						<td>{$row['FECHAF']}<br><a href=\"/admin.klk?tipo={$row['TELEFONO']}\" title=\"Ver con este telefono\" class=\"ttb ttop\">{$row['TELEFONO']}</a></td>
						<td>{$accion}</td>
					 </tr>
					 <tr class=\"apaga\">
						<td colspan=\"7\">{$lineaMensaje}</td>
					 </tr>";		
		}
		return $fila;
	}		
	/**
	 * @method bool|string historialPines() Metodo que listara historial pines
	 * @return string en caso de que el parametro "return" este false (true si trae usuarios, false si no trae o se produce un error)
	 */
	function historialPines() {
		$fila = "";
		global $arrFormaPago;
		while ($row = $this->result->fetch_assoc()) {
			$moneda = ($row['FORMAPAGO'] == 'PP') ? "US\$" : "RD\$";
			$totaldesc = ($row['VALOR'] * $row['CANTIDAD'])  - (($row['VALOR'] * $row['CANTIDAD']) * $row['DESCUENTO'] / 100);
			$totaldesc = number_format($totaldesc,2);			
			$fila .= "<tr>
						<td><a href=\"javascript:;\" class=\"cambia\" id=\"{$row['ID']}\">{$row['ID']}</td>
						<td align=\"center\">{$row['BALANCE']}</td>
						<td align=\"right\">{$row['VALORF']}<br>{$row['DESCUENTO']}%</td>
						<td align=\"center\">{$row['CANTIDADF']}</td>
						<td align=\"right\">{$moneda}{$row['TOTALF']}<br><b>{$moneda}{$totaldesc}</b></td>
						<td>{$arrFormaPago[$row['FORMAPAGO']]}</td>
						<td>{$row['FECHAF']}<br>{$row['PROCESADOF']}</td>
						<td>{$row['ESTATUSF']}</td>
					 </tr>
					 <tr class=\"apaga\">
						<td colspan=\"8\">{$row['TRANSACCION']}</td>
					 </tr>";		
		}
		return $fila;
	}		
	/**
	 * @method bool|string historialUsoPines() Metodo que listara historial uso de pines pines
	 * @return string en caso de que el parametro "return" este false (true si trae usuarios, false si no trae o se produce un error)
	 */
	function historialUsoPines() {
		$fila = "";
		//tipo modulo que utilizan pines
		$tipoModuloPines = array(1=>"VIP Pantalla Principal",
								 2=>"VIP Categoría",
								 3=>"Resaltado",
								 4=>"Foto en lista",
								 5=>"Enlaces Patrocinados",
								 6=>"Plan en Lista",
								 7=>"Linkaplan"
							);		
		global $arrFormaPago;
		while ($row = $this->result->fetch_assoc()) {
			$fila .= "<tr>
						<td>{$row['ID']}</td>
						<td>{$row['CANTIDAD']}</td>
						<td>{$row['IDTIPO']}</td>
						<td>{$tipoModuloPines[$row['TIPO']]}</td>
						<td>{$row['FECHAF']}</td>
						<td>{$row['AUTOR']}</td>
					 </tr>";
		}
		return $fila;
	}	
	/**
	 * @method bool|string insertaComUsu() Metodo que inserta el comentario o nota a los usuarios  en el admin
	 * @return string en caso de que el parametro "return" este false false si no trae o se produce un error)
	 */
	function insertaComUsu() {
		if ($_POST['asignado'] != $_SESSION['lp_uid']) $_POST['comentario'] .= " (<b>Asignado por.: {$_SESSION['lp_nombre']}</b>)";
		$qryString = "INSERT INTO {$this->prefijo_tabla}COMUSU (OPERADOR_ID,USUARIO_ID,COMENTARIO, PRIORIDAD, SEGUIMIENTO, FECHA) VALUES ('{$_POST['asignado']}','{$_POST['uid']}','{$_POST['comentario']}','{$_POST['prioridad']}',{$_POST['seguimiento']},NOW())";
		$result = $this->db->query($qryString);
		if (!$result) {
			$this->qryError($qryString,__FUNCTION__);
			return false;
		} else return true;
	}	
	/**
	 * @method string filtrosMp() Metodo que crea lista de enlaces para filtros en mi pulga por secciones varias, visitasdos, vip, con videos, etc
	 * @return string HTML <li> de los enlaces de vip
	 */		
	function filtrosMp() {
		$lista = "";
		$url = "<a href=\"/mipulga\">Todas las publicaciones</a>";
		$lista .= "<li class=\"list-group-item\">$url</li>";			
		$url = "<a href=\"?tipo=vip\">Vip Página Principal</a>";
		$lista .= "<li class=\"list-group-item\">$url</li>";			
		$url = "<a href=\"?tipo=vipc\">Vip Secciones o Categorías</a>";
		$lista .= "<li class=\"list-group-item\">$url</li>";	
		$url = "<a href=\"?tipo=masv\">Más visitados (5)</a>";
		$lista .= "<li class=\"list-group-item\">$url</li>";	
		$url = "<a href=\"?tipo=video\">Con Videos</a>";
		$lista .= "<li class=\"list-group-item\">$url</li>";			
		return $lista;
	}	
	/**
	 * @method string adOpciones() Metodo que crea lista de enlaces para opciones en los admin mi pulga , usuario y perfil usuaario 
	 * @return string HTML <li> de los enlaces de vip
	 */		
	function adOpciones($tipo = "") {
		$lista = "";
		if ($tipo == "general") {
			$url = "<a class=\"list-group-item\" href=\"/admin.lp\"><i class=\"fa fa-home\"></i>Inicio Administrador</a>";
			$lista .= "<li>$url</li>";			
			$url = "<a class=\"list-group-item\" href=\"/admin.usuarios\"><i class=\"fa fa-users\"></i>Administrador de Usuarios</a>";
			$lista .= "<li>$url</li>";			
			$url = "<a class=\"list-group-item\" href=\"#\"><i class=\"fa fa-clipboard\"></i>Administrador de Publicaciones</a>";
			$lista .= "<li>$url</li>";
			$url = "<a class=\"list-group-item\" href=\"/admin.crm\"><i class=\"fa fa-random\"></i>CRM LP</a>";
			$lista .= "<li>$url</li>";			
			$url = "<a class=\"list-group-item\" href=\"/admin.procesa\"><i class=\"fa fa-cart-arrow-down\"></i>Procesa Productos</a>";
			$lista .= "<li>$url</li>";				
			$url = "<a class=\"list-group-item\" href=\"/admin.prestamos\"><i class=\"fa fa-handshake-o\"></i>Prestamos</a>";
			$lista .= "<li>$url</li>";				
			$url = "<a class=\"list-group-item\" href=\"/admin.financieras\"><i class=\"fa fa-address-book\"></i>Financieras</a>";
			$lista .= "<li>$url</li>";				
			$url = "<a class=\"list-group-item\" href=\"/admin.cintillos\"><i class=\"fa fa-address-book\"></i>Cintillos</a>";
			$lista .= "<li>$url</li>";				
			$url = "<a class=\"list-group-item\" href=\"/admin.extensiones\"><i class=\"fa fa-arrows-alt\"></i>Procesa Extensiones</a>";
			$lista .= "<li>$url</li>";						
			$url = "<a class=\"list-group-item\" href=\"/admin.excedidos\"><i class=\"fa fa-angle-double-up\"></i>Usuarios Excedidos</a>";
			$lista .= "<li>$url</li>";						
			$url = "<a class=\"list-group-item\" href=\"/admin.recurrentes\"><i class=\"fa fa-angle-double-up\"></i>Usuarios Recurrentes</a>";
			$lista .= "<li>$url</li>";							
			$url = "<a class=\"list-group-item\" href=\"/admin.klk\"><i class=\"fa fa-comments\"></i>KLK Messenger</a>";
			$lista .= "<li>$url</li>";			
			$url = "<a class=\"list-group-item\" href=\"/admin.aofertas\"><i style=\"transform:rotate(-30deg);\"class=\"fa fa-bullhorn\"></i>Administra Area de Ofertas</a>";
			$lista .= "<li>$url</li>";			
			$url = "<a class=\"list-group-item\" href=\"/admin.marcas\"><i class=\"fa fa-tags\"></i>Administra Marcas - Modelos</a>";
			$lista .= "<li>$url</li>";
			$url = "<a class=\"list-group-item\" href=\"/admin.faq\"><i class=\"fa fa-question-circle\"></i>Administra FAQ</a>";
			$lista .= "<li>$url</li>";			
			$url = "<a class=\"list-group-item\" href=\"javascript:;\" class=\"moadcmbpalabra\"><i class=\"fa fa-asterisk\"></i>Cambia Palabras</a>";
			$lista .= "<li>$url</li>";
			$url = "<a class=\"list-group-item\" href=\"/admin.registro\"><i class=\"fa fa-wpforms\"></i>Registro de Usuario</a>";
			$lista .= "<li>$url</li>";			
		} else {
			switch($this->tipolistado) {
				// estas opciones no agregan bloque de opciones
				case 'adlp':
				case 'adusu':
				break;
				case 'adperusu':
					// modifica activa retira
					$url = "<a class=\"list-group-item\" href=\"/admin.perfilusuario?uid={$this->uid}&tipo=msjpred\"><i class=\"fa fa-comments\"></i>Mensajes</a>";
					$lista .= "<li>$url</li>";
					$url = "<a class=\"list-group-item\" href=\"/admin.perfilusuario?uid={$this->uid}&tipo=modificaUsu\"><i class=\"fa fa-edit\"></i>Modifica Usuario</a>";
					$lista .= "<li>$url</li>";
					
					$url = "<a class=\"list-group-item\" href=\"/admin.perfilusuario?uid={$this->uid}&tipo=agregaProducto\"><i class=\"fa fa-plus\"></i>Agrega Producto</a>";
					$lista .= "<li>$url</li>";					
									
					$url = "<a href=\"javascript:;\" class=\"ccampo list-group-item\" id=\"USU_ESTATUS_A_{$this->uid}\"><i class=\"fa fa-check\"></i>Activar Usuario</a> ";
					$lista .= "<li>$url</li>";					
					$url = "<a class=\"list-group-item ccampo\" href=\"javascript:;\" id=\"USU_ESTATUS_R_{$this->uid}\"><i class=\"fa fa-times-circle\"></i>Retirar Usuario</a>";
					$lista .= "<li>$url</li>";					
					$url = "<a class=\"list-group-item moadpenalidades\" href=\"javascript:;\"><i class=\"fa fa-eye-slash\"></i>Penalizar Usuario</a>";
					$lista .= "<li>$url</li>";
					
					$url = "<a class=\"list-group-item\" href=\"/admin.perfilusuario?uid={$this->uid}&tipo=agendaRenovaciones\"><span class=\"fa fa-calendar\"></span>Agenda Renovaciones</a>";
					$lista .= "<li>$url</li>";					
					
					$url = "Publicaciones.: <a href=\"/admin.perfilusuario?uid={$this->uid}&tipo=historialPublicaciones&ob=Activas&fld=art&orde=asc\">Activas</a> | <a href=\"/admin.perfilusuario?uid={$this->uid}&tipo=historialPublicaciones&ob=Retiradas&fld=art&orde=asc\">Retiradas</a>";
					$lista .= "<li class=\"list-group-item\">$url</li>";
					// solo si esta activo aplica para AO
					if ($this->Usuario['ESTATUS'] == 'A') {
						$url = "<a class=\"list-group-item\" href=\"/admin.aofertas?uid={$this->uid}\"><i style=\"transform:rotate(-30deg);\"class=\"fa fa-bullhorn\"></i>Agregar a AO</a>";
						$lista .= "<li>$url</li>";
					}
					$url = "<a class=\"list-group-item\" href=\"/admin.perfilusuario?uid={$this->uid}&tipo=comentariosUsu\">Lista Comentarios</a>";
					$lista .= "<li>$url</li>";
					$url = "<a class=\"list-group-item\" href=\"/admin.perfilusuario?uid={$this->uid}&tipo=cambiosUsu\">Lista Cambios a Registros</a>";
					$lista .= "<li>$url</li>";
					$url = "<a class=\"list-group-item\" href=\"/admin.perfilusuario?uid={$this->uid}&tipo=entradasUsu\">Lista Entradas</a>";
					$lista .= "<li>$url</li>";
					$url = "<a class=\"list-group-item\" href=\"/admin.perfilusuario?uid={$this->uid}&tipo=historialPlanes\">Lista historial Planes</a>";
					$lista .= "<li>$url</li>";					
					$url = "<a class=\"list-group-item\" href=\"/admin.perfilusuario?uid={$this->uid}&tipo=historialPines\">Lista historial Pines</a>";
					$lista .= "<li>$url</li>";
					$url = "<a class=\"list-group-item\" href=\"/admin.perfilusuario?uid={$this->uid}&tipo=historialUsoPines\">Lista historial uso Pines</a>";
					$lista .= "<li>$url</li>";					
					$url = "<a class=\"list-group-item\" href=\"/admin.perfilusuario?uid={$this->uid}&tipo=historialPenalidades\">Lista Penalidades</a>";
					$lista .= "<li>$url</li>";
					$url = "<a class=\"list-group-item ccampo\" href=\"javascript:;\" id=\"USU_PASSWORD_\$1\$DS..Qc5.\$MVMVq5flb4azHSdQUNtez1_{$this->uid}\"><i class=\"fa fa-asterisk\"></i>Recuperar contraseña</a>";
					$lista .= "<li>$url</li>";
				break;
			}
		}
		return $lista;
	}	
	/**
	 * @method string adFiltros() Metodo que crea lista de enlaces para filtros varios en los admin mi pulga , usuario y perfil usuaario 
	 * @return string HTML <li> de los enlaces de vip
	 */		
	function adFiltros() {
		$lista = "";		
		switch($this->tipolistado) {
			case 'adlp':
			break;
			// listado de usuarios
			case 'adusu':
			case 'adcrm':
				$url = "<a class=\"list-group-item\" href=\"/admin.usuarios?tipo=A\">Usuarios Activos</a>";
				$lista .= "<li>$url</li>";			
				$url = "<a href=\"/admin.usuarios?tipo=I&orde=asc\">Usuarios Inactivos Viejos</a> | <a href=\"/admin.usuarios?tipo=I&orde=desc\">Nuevos</a> ";
				$lista .= "<li class=\"list-group-item\">$url</li>";				
				$url = "<a class=\"list-group-item\" href=\"/admin.usuarios?tipo=R\">Usuarios Retirados</a>";
				$lista .= "<li>$url</li>";				
				$url = "<a class=\"list-group-item\" href=\"/admin.usuarios?tipo=PAGA\">Usuarios que Pagan</a>";
				$lista .= "<li>$url</li>";	
				// $lista .= "<li class=\"list-group-item\"><select name=\"seguimiento\" id=\"seguimiento\"><option value=\"\">hola</option></select></li>";
				// lista de usuarios con comentarios  de seguimiento  SEG-0, SEG-1, SEG-2, SEG-3
				$url = "<a href=\"/admin.usuarios?ob=SEG_-3\"" . (($this->ob == "SEG_-3") ? "class=\"rojo\"" : "") . ">-3</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=SEG_-2\"" . (($this->ob == "SEG_-2") ? "class=\"rojo\"" : "") . ">-2</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=SEG_-1\"" . (($this->ob == "SEG_-1") ? "class=\"rojo\"" : "") . ">-1</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=SEG_0\"" . (($this->ob == "SEG_0") ? "class=\"rojo\"" : "") . ">Hoy</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=SEG_1\"" . (($this->ob == "SEG_1") ? "class=\"rojo\"" : "") . ">1</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=SEG_2\"" . (($this->ob == "SEG_2") ? "class=\"rojo\"" : "") . ">2</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=SEG_3\"" . (($this->ob == "SEG_3") ? "class=\"rojo\"" : "") . ">3</a>";
				$lista .= "<li class=\"list-group-item\">Seg.: $url</li>";					
				// lista de usuarios con comentarios sin COMuimiento COM-0, COM-1, COM-2, COM-3
				$url = "<a href=\"/admin.usuarios?ob=COM_-3\"" . (($this->ob == "COM_-3") ? "class=\"rojo\"" : "") . ">-3</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=COM_-2\"" . (($this->ob == "COM_-2") ? "class=\"rojo\"" : "") . ">-2</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=COM_-1\"" . (($this->ob == "COM_-1") ? "class=\"rojo\"" : "") . ">-1</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=COM_0\"" . (($this->ob == "COM_0") ? "class=\"rojo\"" : "") . ">Hoy</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=COM_1\"" . (($this->ob == "COM_1") ? "class=\"rojo\"" : "") . ">1</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=COM_2\"" . (($this->ob == "COM_2") ? "class=\"rojo\"" : "") . ">2</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=COM_3\"" . (($this->ob == "COM_3") ? "class=\"rojo\"" : "") . ">3</a>";
				$lista .= "<li class=\"list-group-item\">Com.: $url</li>";				
				// lista de planes por fechas PLA_-0,PLA_-1,PLA_-2
				$url = "<a href=\"/admin.usuarios?ob=PLA_-3\"" . (($this->ob == "PLA_-3") ? "class=\"rojo\"" : "") . ">-3</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=PLA_-2\"" . (($this->ob == "PLA_-2") ? "class=\"rojo\"" : "") . ">-2</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=PLA_-1\"" . (($this->ob == "PLA_-1") ? "class=\"rojo\"" : "") . ">-1</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=PLA_0\"" . (($this->ob == "PLA_0") ? "class=\"rojo\"" : "") . ">Todos</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=PLA_1\"" . (($this->ob == "PLA_1") ? "class=\"rojo\"" : "") . ">1</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=PLA_2\"" . (($this->ob == "PLA_2") ? "class=\"rojo\"" : "") . ">2</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=PLA_3\"" . (($this->ob == "PLA_3") ? "class=\"rojo\"" : "") . ">3</a>";
				$lista .= "<li class=\"list-group-item\">Plan.: $url</li>";				
				// tiendas virtuales
				$url = "<a href=\"/admin.usuarios?ob=UPA_T\"" . (($this->ob == "UPA_T") ? "class=\"rojo\"" : "") . ">Activas</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=UPI_T\"" . (($this->ob == "UPI_T") ? "class=\"rojo\"" : "") . ">Inactivas</a>";
				$lista .= "<li class=\"list-group-item \">Tiendas.: $url</li>";		
				// dealers de vehiculos
				$url = "<a href=\"/admin.usuarios?ob=UPA_D\"" . (($this->ob == "UPA_D") ? "class=\"rojo\"" : "") . ">Activos</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=UPI_D\"" . (($this->ob == "UPI_D") ? "class=\"rojo\"" : "") . ">Inactivos</a>";
				$lista .= "<li class=\"list-group-item\">Dealers.: $url</li>";		
				// inmobliarias
				$url = "<a href=\"/admin.usuarios?ob=UPA_I\"" . (($this->ob == "UPA_I") ? "class=\"rojo\"" : "") . ">Activas</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=UPI_I\"" . (($this->ob == "UPI_I") ? "class=\"rojo\"" : "") . ">Inactivas</a>";
				$lista .= "<li class=\"list-group-item\">Inmobiliarias.: $url</li>";
				// Promotores expreso
				$url = "<a class=\"list-group-item\" href=\"/admin.usuarios?ob=X\">Promotores Expreso</a>";
				$lista .= "<li>$url</li>";
				// planes LP+
				$url = "<a class=\"list-group-item\" href=\"/admin.usuarios?ob=L\">Planes LP+</a>";
				$lista .= "<li>$url</li>";
				// LOGIN HOY, ayer antes de ayer
				$url = "<a href=\"/admin.usuarios?ob=LGH\"" . (($this->ob == "LGH") ? "class=\"rojo\"" : "") . ">Hoy</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=LGA\"" . (($this->ob == "LGA") ? "class=\"rojo\"" : "") . ">Ayer</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=LGT\"" . (($this->ob == "LGT") ? "class=\"rojo\"" : "") . ">Antes Ayer</a>";
				$lista .= "<li class=\"list-group-item\">Login.: $url</li>";	
				// penalizados
				$url = "<a href=\"/admin.usuarios?ob=R\"" . (($this->ob == "R") ? "class=\"rojo\"" : "") . ">Rep</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=PP\"" . (($this->ob == "PP") ? "class=\"rojo\"" : "") . ">Pago</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=LE\"" . (($this->ob == "LE") ? "class=\"rojo\"" : "") . ">Exc</a>";
				$lista .= "<li class=\"list-group-item\">Penalizados.: $url</li>";					
				// preavisados
				$url = "<a href=\"/admin.usuarios?ob=PAR\"" . (($this->ob == "PAR") ? "class=\"rojo\"" : "") . ">Rep</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=PAPP\"" . (($this->ob == "PAPP") ? "class=\"rojo\"" : "") . ">Pago</a>";
				$url .= " | <a href=\"/admin.usuarios?ob=PALE\"" . (($this->ob == "PALE") ? "class=\"rojo\"" : "") . ">Exc</a>";
				$lista .= "<li class=\"list-group-item\">Preavisos.: $url</li>";
				
					
					// Usuarios Activos
					// Usuarios Inactivos
					// Usuarios Retirados
					// Tiendas Virtuales Activos | Inactivos
					// Dealers de Vehiculos Activos | Inactivos
					// Inmobiliarias Activos | Inactivos
					// Planes LP+ Activos | Inactivos
					// Usuarios Recurrentes (en proceso)
					// Login Hoy | Ayer | Antes ayer
					// Penalizados Repetidor | Pago | Fotos | Limite
					// Preavisados Repetidor | Pago | Fotos | Limite
						// "R"=>"Colocar Repeticiones",
						// "C"=>"Publicar Categorias Incorrectas",
						// "PP"=>"Pendiente pago Plan o pines",
						// "FE"=>"Colocar fotos con etiquetas",
						// "LE"=>"Limite publicaciones excedido",
						// /*  mensajes preavisos */
						// "PAR"=>"Preaviso Colocar Repeticiones",
						// "PAC"=>"Preaviso Publicar Categorias Incorrectas",
						// "PAPP"=>"Preaviso Pendiente pago Plan o pines",
						// "PAFE"=>"Preaviso Colocar fotos con etiquetas",
						// "PALE"=>"Preaviso Limite publicaciones excedido"
			break;
			// el perfil no tiene filtros
			case 'adperusu':	
				return "";
			break;
			case 'admp':
				$url = "<a href=\"{$_SERVER['REDIRECT_URL']}\">Todas las publicaciones</a>";
				$lista .= "<li class=\"list-group-item\">$url</li>";			
				$url = "<a href=\"{$_SERVER['REDIRECT_URL']}?tipo=vip\">Vip Página Principal</a>";
				$lista .= "<li class=\"list-group-item\">$url</li>";			
				$url = "<a href=\"{$_SERVER['REDIRECT_URL']}?tipo=vipc\">Vip Secciones o Categorías</a>";
				$lista .= "<li class=\"list-group-item\">$url</li>";	
				$url = "<a href=\"{$_SERVER['REDIRECT_URL']}?tipo=masv\">Más visitados (5)</a>";
				$lista .= "<li class=\"list-group-item\">$url</li>";	
				$url = "<a href=\"{$_SERVER['REDIRECT_URL']}?tipo=video\">Con Videos</a>";
				$lista .= "<li class=\"list-group-item\">$url</li>";			
			break;
			// procesa producto
			case 'adpp':
			// extensiones de publicidad
			case 'adext':
				$url = "<a href=\"{$_SERVER['REDIRECT_URL']}?tipo=P\">Solicitudes Pendientes</a>";
				$lista .= "<li class=\"list-group-item\">$url</li>";			
				$url = "<a href=\"{$_SERVER['REDIRECT_URL']}?tipo=A\">Solicitudes Aprobadas</a>";
				$lista .= "<li class=\"list-group-item\">$url</li>";			
				$url = "<a href=\"{$_SERVER['REDIRECT_URL']}?tipo=C\">Solicitudes Canceladas</a>";				
				$lista .= "<li class=\"list-group-item\">$url</li>";	
			break;
		}
		return $lista;
	}		
	/**
	 * @method bool|string calculaVisitas() Metodo que calcula total visitas de un usuario para mi pulga
	 * @return int  total de visitas
	 */
	function calculaVisitas() {	
		if (!isset($_SESSION['lp_uid'])) return 0;
		$qryString = "SELECT SUM(ACUMULADAS + VISITAS) AS TOTAL FROM {$this->prefijo_tabla}ARTICULOS WHERE USUARIO_ID='{$_SESSION['lp_uid']}' AND ESTATUS='A'";
		$result = $this->db->query($qryString);
		if (!$result) {
			$this->qryError($qryString, __FUNCTION__);
			return 0;
		} else {
			return $result->fetch_object()->TOTAL;
		}	
	}
	/**
	 * @method bool|string cambiaTitulo() Metodo que cambia el titulo y categoria en detalles y lista admin mi pulga
	 * @return bool
	 */
	function cambiaTitulo() {	
		if (method_exists($this,"guardaAnteriores")) $this->guardaAnteriores("ARTICULOS");
		$arrCategoria = explode("-",$_POST['categoria']);
		$_POST['categoria_id'] = $arrCategoria[0];
		$_POST['subcategoria_id'] = $arrCategoria[1];		
		$qryString = "UPDATE {$this->prefijo_tabla}ARTICULOS SET ARTICULO='{$_POST['articulo']}', PRECIO='{$_POST['precio']}', MONEDA='{$_POST['moneda']}', CATEGORIA_ID='{$_POST['categoria_id']}',SUBCATEGORIA_ID='{$_POST['subcategoria_id']}' WHERE ID='{$_POST['id']}' AND ESTATUS='A'";
		$result = $this->db->query($qryString);
		if (!$result) {
			$this->qryError($qryString, __FUNCTION__);
			return false;
		} else {
			return true;
		}	
	}	
	/**
	 * @method string buscaPlanes() Metodo que lista de planes para un usuario, plenes ao, renovaciones crea csv para remarketing
	 * @return void
	 */		
	function buscaPlanes() {
		global $arrCategorias;
		$qryString = "SELECT * FROM {$this->prefijo_tabla}ARTICULOS WHERE PUBLICIDAD='S' AND FOTOS != '' AND ESTATUS='A' ORDER BY CATEGORIA_ID";
		$result = $this->db->query($qryString);
		if (!$result) {
			$this->qryError($qryString, __FUNCTION__);
			return false;
		} else {
			// ID,ID2,Item title,Final URL,Image URL,Item subtitle,Item description,Item category,Price,Sale price,Contextual keywords,Item address,Tracking template,Custom parameter,Final mobile URL
			$accion  = isset($_GET['accion']) ? ",Accion" :"";
			$accionvalor  = !empty($accion) ? ",Set" : "";
			$fp = fopen (RUTA . "logs/remarketing.csv", "w");
			$registro = "ID,ID2,Item title,Final URL,Image URL,Item subtitle,Item description,Item category,Price,Sale price,Contextual keywords,Item address,Tracking template,Custom parameter,Final mobile URL{$accion}\n";
			fwrite($fp,$registro,strlen($registro));
			$i = 0;
			while ($row = $result->fetch_assoc()) {
				$moneda = ($row['MONEDA'] == 'R') ? "DOP" : "USD";
				$precio = number_format($row['PRECIO'],0);
				$precio = "\"{$precio} {$moneda}\"";
				$row['ARTICULO'] = substr($row['ARTICULO'],0,25);
				$row['ARTICULO'] = Encoding::fixUTF8($row['ARTICULO']);
				// $url = urlarticulo($row['ARTICULO'],$row['ID']);
				$registro = "{$row['ID']},,{$row['ARTICULO']},https://www.lapulga.com.do/?id={$row['ID']}&tag=rmktpc,https://www.lapulga.com.do/cache/280/{$row['ID']}-1.jpg,{$row['ARTICULO']},{$row['ARTICULO']},{$arrCategorias[$row['CATEGORIA_ID']]},{$precio},{$precio},,,,,https://m.lapulga.com.do/?id={$row['ID']}&tag=rmktmo{$accionvalor}\n";	
				fwrite($fp,$registro,strlen($registro));
				if ((!file_exists($_SERVER['DOCUMENT_ROOT'] . "/cache/280/" . $row['ID'] . "-1.jpg")) and (file_exists($_SERVER['DOCUMENT_ROOT'] . "/f/" . $row['ID'] . "-1.jpg"))) {
					fotosThumbs($row['FOTOS']);	
				}					
				$i++;
			}
			echo "$i registros procesados";
			fclose($fp);  			
		}	
	}	
	/**
	 * @method string reMarketing() Metodo que crea csv para remarketing
	 * @return void
	 */		
	function reMarketing() {
		global $arrCategorias;
		$qryString = "SELECT * FROM {$this->prefijo_tabla}ARTICULOS WHERE PUBLICIDAD='S' AND FOTOS != '' AND ESTATUS='A' ORDER BY CATEGORIA_ID";
		
		// CASO PARA DEALERS
		
		// $qryString = "SELECT A.ID, A.ARTICULO, A.PRECIO, A.MONEDA, A.CATEGORIA_ID, A.FOTOS FROM {$this->prefijo_tabla}ARTICULOS A INNER JOIN {$this->prefijo_tabla}USUARIOS U ON A.USUARIO_ID=U.ID WHERE A.ESTATUS='A' AND FOTOS != '' AND USUPLAN = 'DV1' ORDER BY USUARIO_ID, ARTICULO ";
		
		$result = $this->db->query($qryString);
		if (!$result) {
			$this->qryError($qryString, __FUNCTION__);
			return false;
		} else {
			// ID,ID2,Item title,Final URL,Image URL,Item subtitle,Item description,Item category,Price,Sale price,Contextual keywords,Item address,Tracking template,Custom parameter,Final mobile URL
			$accion  = isset($_GET['accion']) ? ",Accion" :"";
			$accionvalor  = !empty($accion) ? ",Set" : "";
			$fp = fopen (RUTA . "logs/remarketing.csv", "w");
			//$registro = "ID,ID2,Item title,Final URL,Image URL,Item subtitle,Item description,Item category,Price,Sale price,Contextual keywords,Item address,Tracking template,Custom parameter,Final mobile URL{$accion}\n";
			$registro = "ID,Item title,Final URL,Image URL,Item category,Price\n";
			fwrite($fp,$registro,strlen($registro));
			$i = 0;
			while ($row = $result->fetch_assoc()) {
				$moneda = ($row['MONEDA'] == 'R') ? "DOP" : "USD";
				$precio = number_format($row['PRECIO'],0);
				$precio = "\"{$precio} {$moneda}\"";
				$row['ARTICULO'] = substr($row['ARTICULO'],0,25);
				$row['ARTICULO'] = strtolower(Encoding::fixUTF8($row['ARTICULO']));
				// $url = urlarticulo($row['ARTICULO'],$row['ID']);
				$registro = "{$row['ID']},{$row['ARTICULO']},https://www.lapulga.com.do/?id={$row['ID']}&tag=rmktpc_de,https://www.lapulga.com.do/cache/280/{$row['ID']}-1.jpg,{$arrCategorias[$row['CATEGORIA_ID']]},{$precio}\n";	
				fwrite($fp,$registro,strlen($registro));
				if ((!file_exists($_SERVER['DOCUMENT_ROOT'] . "/cache/280/" . $row['ID'] . "-1.jpg")) and (file_exists($_SERVER['DOCUMENT_ROOT'] . "/f/" . $row['ID'] . "-1.jpg"))) {
					fotosThumbs($row['FOTOS']);	
				}					
				$i++;
			}
			echo "$i registros procesados";
			fclose($fp);  			
		}	
	}
	/**
	 * @method bool alertaPenalizados() metodo que alrta en el home del admin los usuarios penalizados o peravisados con intentos de login
	 * @return str  alerta con enlaces
	 */
	function alertaPenalizados() {
		global $arrPenalidad;
		$qryString = "SELECT CONCAT('<a href=\"/admin.perfilusuario?uid=',USUARIO_ID,'&tipo=historialPenalidades\" target=\"/admin.perfilusuario\">',USUARIO_ID,'</a>') AS USUARIO, INTENTOS, PENALIDAD, DATE_FORMAT(ULTIMO, '%d-%m-%Y %h:%i %p') AS ULTIMOF, COMENTARIO FROM {$this->prefijo_tabla}PENALIDADES WHERE INTENTOS > 0 AND ESTATUS='A' AND HASTA > NOW() ORDER BY ULTIMO DESC ";
		$result = $this->db->query($qryString);
		if (!$result){
			$this->qryError($qryString,__FUNCTION__);
			return "";
		}
		$alerta = "";
		while($row = $result->fetch_assoc()) {
			$alerta .= "<p>{$row['USUARIO']} tiene {$row['INTENTOS']} intentos de login, ultimo {$row['ULTIMOF']}, penalizado por {$arrPenalidad[$row['PENALIDAD']]}, (<b>{$row['COMENTARIO']}</b>) </p>";
		}
		return balert("alert_error","Intentos de Login",$alerta);
	}		
	/**
	 * @method bool alertaSeguimiento() metodo que alrta en el home del admin los usuarios con seguimiento en los comentarios
	 * @return str  alerta con enlaces
	 */
	function alertaSeguimiento() {
		global $arrPenalidad;
		$qryString = "SELECT CONCAT('<a href=\"/admin.perfilusuario?uid=',USUARIO_ID,'&tipo=comentariosUsu\" target=\"/admin.perfilusuario\">',USUARIO_ID,'</a>') AS USUARIO, COMENTARIO, CASE WHEN PRIORIDAD = 'A' THEN 'Prioridad Alta' ELSE 'Prioridad Baja' END AS PRIORIDADF FROM {$this->prefijo_tabla}COMUSU WHERE DATE(DATE_ADD(FECHA, INTERVAL SEGUIMIENTO DAY)) = CURDATE() AND OPERADOR_ID = {$_SESSION['lp_uid']} ORDER BY PRIORIDAD ASC";
		$result = $this->db->query($qryString);
		if (!$result){
			$this->qryError($qryString,__FUNCTION__);
			return "";
		}
		$alerta = "";
		while($row = $result->fetch_assoc()) {
			$alerta .= "<p>{$row['USUARIO']} tiene <b>\"{$row['COMENTARIO']}\"</b> con <b>\"{$row['PRIORIDADF']}\"</b></p>";
		}
		return ($alerta) ? balert("alert_success","Seguimiento a Usuarios",$alerta) : "";
	}		
	/**
	 * @method bool alertaProcesa() metodo que alrta en el home productos pendientes de procesar
	 * @return str  alerta con enlaces
	 */
	function alertaProcesa() {
		global $arrPlanUsuario;
		$qryString = "SELECT TIPO, COUNT(*) AS CUANTOS FROM {$this->prefijo_tabla}TRANSACCIONES WHERE ESTATUS='P' GROUP BY TIPO ORDER BY TIPO";
		$result = $this->db->query($qryString);
		if (!$result){
			$this->qryError($qryString,__FUNCTION__);
			return "";
		}
		$alerta = "<ul>";
		$total = 0;
		while($row = $result->fetch_assoc()) {
			if (!isset($arrPlanUsuario[$row['TIPO']])) continue;
			$alerta .= "<li>{$arrPlanUsuario[$row['TIPO']]} hay <b>{$row['CUANTOS']}</b> por procesar</li>";
			$total += $row['CUANTOS'];
		}
		$alerta .= "</ul><p>En total {$total} solicitudes, verificar</p>";
		return balert("alert_warning","Productos <a href=\"/admin.procesa\">por procesar</a>",$alerta);
	}
	function listadomsj(){
		$row = $this->buscaUsuario("ID", $_GET["uid"]);
			if ($row['ESTATUS'] == 'A') {
				$arrTel = array($row["TELEFONO1"], $row["TELEFONO2"], $row["TELEFONO3"]); 
				$br = (isset($row["TELEFONO2"])) ? "<br>" : "";
				$urlopc = "Estimado {$row['NOMBRE']}\n\nCambia tu clave aqui\n\n https://www.lapulga.com.do/cambiaclave/{$row['SESSION']}?pwd={$row['PASSWORD']}\n\nPara publicar usa este\n\nhttps://www.lapulga.com.do/publicar/{$row['SESSION']}\n\nGracias por utilizar nuestros servicios";
				$opciones = "<tr><td>";
				foreach($arrTel as $tel) $opciones .= whatsapptel($tel, $urlopc, $tel) . $br;
				$opciones .= "</td>";				
				$opciones.="<td align=\"center\" >Entrar a cuenta</td></tr>";
				$urlsaludo = "Hola {$row['NOMBRE']} soy {$_SESSION['lp_nombre']} de La Pulga Virtual, le estaré asistiendo en su cuenta por lo que quedo a sus ordenes para cualquier ayuda que requiera con nuestros servicios.  Le recuerdo que estamos en el 809-549-6581, email {$_SESSION['lp_email']} y https://www.lapulga.com.do/soporte.";				
				$opciones .= "<tr><td>";
				foreach($arrTel as $tel) $opciones .= whatsapptel($tel, $urlsaludo, $tel) . $br;
				$opciones .= "</td>";
				$opciones .="<td align=\"center\">Saludos</td></tr>";
				$urlgomas = "Hola {$row['NOMBRE']} soy {$_SESSION['lp_nombre']} de La Pulga Virtual quiero ayudarte con las publicaciones de gomas que haces.  tenemos en la pagina un nuevo buscador y seccion solo para gomas de vehiculos y si puedes envianos el listado de todo tu inventario para publicarlo gratis.  lo haces en word o excel donde pones el numero de la goma en ejemplo 255/60/15 y el precio.  Si vendes aros dejame saber tambien, estare atenta, esto te puede ayudar mucho.  Mira un ejemplo de como quedan https://www.lapulga.com.do/publicaciones/jasonchistophelouis/265362";				
				
				$opciones .= "<tr><td>";
				foreach($arrTel as $tel) $opciones .= whatsapptel($tel, $urlgomas, $tel) . $br;
				$opciones .= "</td>";
				$opciones.="<td align=\"center\">Gomas</td></tr>";
				$texto = "Saludos {$row['NOMBRE']} soy {$_SESSION['lp_nombre']} de La Pulga Virtual. Le escribo para notificarle que usted ha excedido el limite de publicaciones en el plan básico. Para mas información favor comunicarse por esta misma vía.";				
				$opciones .= "<tr><td>";
				foreach($arrTel as $tel) $opciones .= whatsapptel($tel, $texto, $tel) . $br;
				$opciones .= "</td>";
				$opciones.="<td align=\"center\">Excedido</td></tr>";
				$texto = "Saludos {$row['NOMBRE']} soy {$_SESSION['lp_nombre']} de La Pulga Virtual. Le escribo para notificarle que le estamos dando seguimientos a nuestros usuarios y hemos visto que usted aplica y es candidato para tener un plan de usuario con nosotros. Para mas información favor comunicarse por esta misma vía.";				
				$opciones .= "<tr><td>";
				foreach($arrTel as $tel) $opciones .= whatsapptel($tel, $texto, $tel) . $br;
				$opciones .= "</td>";
				$opciones.="<td align=\"center\">Usuario Potencial!</td></tr>";	
				$texto = "Saludos {$row['NOMBRE']} soy {$_SESSION['lp_nombre']} de La Pulga Virtual. Le escribo para notificarle que su plan de tienda ha expirado hace varios meses ya. Estamos interesados en saber si desea renovar su plan. Para mas información favor comunicarse por esta misma vía.";				
				$opciones .= "<tr><td>";
				foreach($arrTel as $tel) $opciones .= whatsapptel($tel, $texto, $tel) . $br;
				$opciones .= "</td>";
				$opciones.="<td align=\"center\">Plan Expirado!</td></tr>";			
			} else $opciones="<td align=\"center\" colspan=\"2\"><h3>Usuario Inactivo o Retirado, no aplica para mensaje</h3></td>";
	
		return $opciones;
	}
	/**
	 * @method listadoFinancieras() metodo que lista la red de financieras en una tabla.
	 * @return str  html con el contenido td y tr de la tabla
	 */
	 function listadoFinancieras() {
	 	$fila = "";
	 	while ($row = $this->result->fetch_assoc()) {
	 		$estatus = ($row["ESTATUS"] == 'I') ? "bg-warning" : '';
	 		$urlnombre = urlencode($row["NOMBRE"]);
	 		$ubicacion = (!empty($row["UBICACION"])) ? $row["UBICACION"] : "https://www.google.com.do/maps/search/{$urlnombre}/";
	 	 	$fila .= "<tr class=\"{$estatus}\">
						<td align=\"center\" class=\"asunto\">{$row["ID"]}</td>
						<td><a href=\"/admin.financieras?tipo=actualizafin&fid={$row['ID']}\" class=\"ttb nombrem\" title=\"Modifica Financiera\">{$row["NOMBRE"]}</a></td>
						<td>{$row["CONTACTO"]}</td>
						<td>{$row["TELEFONO1"]}<br>{$row["TELEFONO2"]}</td>
						<td>{$row["DIRECCION"]}</td>
						<td align=\"center\"><a href=\"{$ubicacion}\" target=\"_blank\" title=\"Ver ubicacion de {$row["NOMBRE"]}\" class=\"tt\">Ver</a></td>
						<td align=\"center\">{$row["ESTATUS"]}</td>
	 	  			</tr>";
	 	}
	 	return $fila;
	 }	
	/**
	 * @method listadoCintillos() metodo que lista la los cintillos a mostrar
	 * @return str  html con el contenido td y tr de la tabla
	 */
	 function listadoCintillos() {
	 	$fila = "";
	 	while ($row = $this->result->fetch_assoc()) {	   
			
			$fila .= "<tr>";
			$fila .= "<td>{$row['ID']}</td>";
			$fila .= "<td><a href=\"/admin.cintillo.php?id={$row['ID']}\">{$row['TITULO']}</a></td>";
			$fila .= "<td><a href=\"/admin.cintillo.php?id={$row['ID']}\">{$row['MENSAJE']}</a></td>";
			$fila .= "<td>({$row['FECHA']}) </td>";
			$fila .= "<td>({$row['HASTADIA']}) </td>";
			$fila .= "<td>{$row['ENLACE']}</td>";
			$fila .= "<td>{$row['URL']}</td>";
			$fila .= "<td>{$row['TIPO']}</td>";
			$fila .= "<td>{$row['ESTATUS']}</td>";
			$fila .= "</tr>";
	

	 	}
	 	return $fila;
	 }	
	/**
	 * @method estadisticas() metodo que mide las estadisticas de las proveniencias de las visitas en la pagina.
	 * @return str  alerta con enlaces
	 * @global $proturl;
	 */
	 function estadisticas() {
	// 	global $proturl;
	// 	$fichero = "{$proturl}{$_SERVER["HTTP_HOST"]}/logs/tagpublicidad.log";
	// 	$doc = fopen($fichero, "r");
	// 	$i = 0;
	// 	$cantidad=0;
	// 	$fb=0;
	// 	$ig=0;
	// 	$ws=0;
	// 	$gp=0;
	// 	$tw=0;
	// 	$manual=0;
	// 	$feed=0;
	// 	$reglas = "";
	// 	$regla= "";
	// 	while (!feof($doc)) {
 //   			$regla = fgets($doc, 4096);
 //  			if (substr($regla,0,1) == '#') continue;
 //   			else $reglas .= $regla . " = ";
 //  		}
	// 	$arrDatos = explode("=",$reglas);
	// 	foreach($arrDatos as $dato) {
	// 		$registro = (isset(explode("|", $dato)[2])) ? explode("|", $dato)[2] : "Nada";
	// 		$fila = str_replace("tag:","",$registro);
	// 		switch($fila) {
	// 		case 'redcomptw': // red compartir twitter
	// 			$tw++;
	// 		break;
	// 		case 'redcompfb': // red compartir facebook	
	// 		case ' fb': // red compartir facebook	
	// 			$fb++;
	// 		break;
	// 		case 'redcompgp': // red compartir google
	// 			$gp++;
	// 		break;
	// 		case 'redcompws': // red compartir whatsapp
	// 			$ws++;
	// 		break;
	// 		case 'redfeed': // red por los feeds
	// 			$feed++;
	// 		break;
	// 		case 'redmanu': // red manual
	// 			$manual++;
	// 		break;
	// 	}
	 }
		
	// 	echo  " Facebook: {$fb} <br> Twitter: {$tw} <br> Instagram: {$ig} <br> Feed: {$feed} <br> Whatsapp: {$ws}" ; 
	// }
}
?>