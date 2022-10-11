<div class="item">
    <div class="lpub bg-white">
        <div class="table table-responsive">
            <table class='table table-striped table-hover bg-white'>
                <thead>
                    <tr align="center">
                        <!-- <th>ID</th> -->
                        <th class='col-md-4'>Nombre (publicaciones)<br>Email (pines)<br>Usuario (plan)</th>
                        <th width='20%'>Teléfonos</th>
                        <th class='col-md-3'>Creada<br>Login<br>Activado</th>
                        <th width='10%'>Municipio<br>Provincia<br>Direccion IP</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>

<?php 
// fotos totales permitida para este usuario
$totalFotos = Config::$arrProductos[$_SESSION['lp_usuplann']]['fotos'];

$clase = "";
$ceropub;
$paga = "";
$clasetel = "";
$municipio = "";
$retirar = "";
$seguimiento = "";
$opciones ="";
$textareas = "";
$bloquea = "";
$ceropub = "";
$inactivo = "";
$usuhasta = "";
$inactivolnk = "";
$provincia = "";



foreach($arrRegistros as $arrRegistro) { 
    //parr($arrRegistro);

    if (isset($arrRegistro['COMENTARIO'])) {
        // LIMITA A QUE SOLO LOS COMENTARIOS SIN SEGUIMIENTO TENGAN ESO ADICIONAL
        $txtseg = (substr($this->ob,0,1) == 'C') ? "<br>Seguimiento.: <B>{$arrRegistro['SEGUIMIENTO']}</b>" : "";
        $seguimiento = "<tr><td colspan=\"6\">Comentario.: <b>{$arrRegistro['COMENTARIO']}</b><br>Operador.: <b>{$arrOperadores[$arrRegistro['OPERADOR_ID']]}</b><br>Prioridad.: <b>{$arrRegistro['PRIORIDADF']}</b><br>Viene de.: <b>{$arrRegistro['CFECHAF']}</b>{$txtseg}</td></tr>";
    }
    $paga = ($arrRegistro['PAGA'] == 'S') ? "<span class=\"verde\">Paga</span>" : "<span class=\"text-danger\">No Paga</span>";
    if ($arrRegistro['USUPLAN'] != "PB") $usuhasta = "<br><strike><b>{$arrRegistro['USUHASTA']}</b></strike>";
    else $usuhasta = "";
    $textareas = "";
    $nombre = explode(" ",$arrRegistro['NOMBRE']);

    $publicaciones = ($arrRegistro['PUBLICACIONES'] != 0) ? " y la publicacion que hiciste no se mostrara hasta que actives" : "";
    if (($arrRegistro['ESTATUS'] == 'A') or ($arrRegistro['ESTATUS'] == 'I') or ($arrRegistro['ESTATUS'] == 'R')) {
        $arrTel = array($arrRegistro["TELEFONO1"], $arrRegistro["TELEFONO2"], $arrRegistro["TELEFONO3"]); 
        $br = (isset($arrRegistro["TELEFONO2"])) ? "<br>" : "";
        $opciones = "";
        $mensaje = 
    "Hola {$nombre[0]}, tienes una cuenta con este email *{$arrRegistro['EMAIL']}* en La Pulga Virtual de fecha {$arrRegistro['CREADAF']}, si no recuerdas tu clave cambiala dando click al enlace

    https://www.lapulga.com.do/cambiaclave/{$arrRegistro['SESSION']}?pwd={$arrRegistro['PASSWORD']}

    *Nota Importante.* siempre es mejor usar la cuenta mas vieja por seguridad y confianza a los usuarios, si tienes dudas escribenos primero.

    Gracias por utilizar nuestros servicios
    *Este no es un mensaje automatico*
    La Pulga Virtual";

        foreach($arrTel as $tel) $opciones .= Funciones::mensajeWame($tel, $mensaje, "Cambia clave");


        // entrar a mi pulga
        $mensaje = 
    "Para entrar a tus publicaciones directamente usa este enlace https://www.lapulga.com.do/mipulga_{$arrRegistro['SESSION']}";

        foreach($arrTel as $tel) $opciones .= Funciones::mensajeWame($tel, $mensaje, "Enlace a mi pulga");
        // fecha registro
        $fecharegistro = "";
        /*
        if ($arrRegistro['DIASREGISTRADO'] >= 2) {
            $fecharegistro = "*el {$arrRegistro['CREADA']} hace {$arrRegistro['DIASREGISTRADO']} dias* ";
            // activa cuenta inactivo viejo
            $urlinactivo = 
    "Hola {$arrRegistro['NOMBRE']} 

    Te escribe el Administrador de La Pulga Virtual, te registraste {$fecharegistro} y por alguna razon no activaste la cuenta, *hicimos una revision y activamos por ti*.

    Puedes empezar a usarla, si tienes alguna duda u olvidaste tu clave usa este enlace:

    https://www.lapulga.com.do/olvideclave

    Gracias por utilizar nuestros servicios.

    Recuerda *quedarte en casa*

    *Este no es un mensaje automatico*

    Equipo LP.";	

            foreach($arrTel as $tel) $opciones .= Funciones::mensajeWame($tel, $urlinactivo, "Usuario Inactivo viejo!");
        } else {
            
            */
            // activacion cuenta reciente
            $urlinactivo = 
        
    "Hola {$nombre[0]}, la cuenta que creaste en *La Pulga Virtual* con el email *{$arrRegistro['EMAIL']}* esta inactiva todavia{$publicaciones}.

    click en este enlace para activar, si no confias en el enlace escribenos primero. 

    si no te funciona nos dejas saber

    *Gracias por utlizar los servicios de La Pulga Virtual*";	

            // linnk cuenta reciente
            $urlinactivolnk = 
        
    "www.lapulga.com.do/activausuario/{$arrRegistro['SESSION']}?act={$arrRegistro['ID']}";	

            foreach($arrTel as $tel) $opciones .= Funciones::mensajeWame($tel, $urlinactivo, "Usuario Inactivo nuevo!");
            foreach($arrTel as $tel) $opciones .= Funciones::mensajeWame($tel, $urlinactivolnk, "Link Usuario Inactivo nuevo!");

            // mensaje nueva version
            $msgversion = 
        
    "Hola {$nombre[0]}, en los proximos dias tendremos una nueva verion con muchas mejoras e innovaciones por lo que nos gustaria visites nuestro blog para mas informacion en https://blog.lapulga.com.do

    Tu cuenta esta registrada con el email *{$arrRegistro['EMAIL']}*, si no recuerdas la clave usa este enlace https://www.lapulga.com.do/cambiaclave/{$arrRegistro['SESSION']}?pwd={$arrRegistro['PASSWORD']}.

    *Gracias por utlizar los servicios de La Pulga Virtual*";	


            foreach($arrTel as $tel) $opciones .= Funciones::mensajeWame($tel, $msgversion, "Mensaje version nueva");
            
            
    //	}
        // mensaje solo de saludo y no tiene publicaciones
        $urlsaludo = 
    "Hola {$nombre[0]} 

    Te escribe el Administrador de La Pulga Virtual veo que no tienes publicaciones y me gustaria saber si hubo algun problema al momento de publicar. 

    Estare esperando tus comentarios por si en algo te podemos ayudar.

    *Este no es un mensaje automatico*

    Equipo LP";				

        foreach($arrTel as $tel) $opciones .= Funciones::mensajeWame($tel, $urlsaludo, "Saludar no publicaciones!");

        // mensaje seguimiento a no activacion 
        $urlsaludo = 
    "Hola {$nombre[0]} 

    Vemos que aun no has activado la cuenta en *La Pulga Virtual*, queremos saber si has tenido problemas con el enlace anterior?. 

    Estare esperando tus comentarios por si en algo te podemos ayudar.

    *Este no es un mensaje automatico*

    Equipo LP";				

        foreach($arrTel as $tel) $opciones .= Funciones::mensajeWame($tel, $urlsaludo, "Seguiento no activacion!");

        $textareas.= "<b style=\"display:block;\">Saludos</b><textarea id=\"s{$arrRegistro['ID']}\" cols=\"60\" rows=\"2\" class=\"textamsjpred\" onclick=\"this.select(); document.execCommand('Copy');\">{$urlsaludo}</textarea><br>";

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
        
        foreach($arrTel as $tel) $opciones .= Funciones::mensajeWame($tel, $urlgomas,"Armas");
        $textareas.= "<b style=\"display:block;\">Gomas</b><textarea cols=\"60\" rows=\"2\" class=\"textamsjpred\" onclick=\"this.select(); document.execCommand('Copy');\">{$urlgomas}</textarea><br>";
        // pulibcaiones excedidas
        $texto = 
    "Saludos {$nombre[0]}, le escribo de La Pulga Virtual para indicarle que ha excedido el limite de publicaciones para el plan básico. Para mas información favor comunicarse por esta misma vía. 

    Gracias por utilizar nuestros servicios 

    *Este no es un mensaje automatico*

    Equipo LP";	

        foreach($arrTel as $tel) $opciones .= Funciones::mensajeWame($tel, $texto, "¡Está excedido!");

        $textareas.= "<b style=\"display:block;\">¡Usuario Excedido!</b><textarea cols=\"60\" rows=\"2\" class=\"textamsjpred\" onclick=\"this.select(); document.execCommand('Copy');\">{$texto}</textarea><br>";
        // usuario para plan
        $texto = 
    "Saludos {$nombre[0]} 

    Le escribe el Administrador de La Pulga Virtual para notificarle que usted aplica y es candidato para tener un plan de usuario con nosotros.

    Para mas información favor comunicarse por esta misma vía.

    Gracias por utilizar nuestros servicios

    *Este no es un mensaje automatico*

    Equipo LP";

        foreach($arrTel as $tel) $opciones .= Funciones::mensajeWame($tel, $texto, "Usuario para plan");
        // $textareas.= "<b style=\"display:block;\">¡Usuario Potencial!</b><textarea cols=\"60\" rows=\"2\" class=\"textamsjpred\" onclick=\"this.select(); document.execCommand('Copy');\">{$texto}</textarea><br>";
        // plan expirado 
        $texto = 
    "Saludos {$nombre[0]} 

    Le escribo de La Pulga Virtual para notificarle que su plan expiró. Para mantener el excedente de publicaciones al plan basico es recomendable que su plan este activo. Puede renovar por varios meses y obtener descuento.

    Para mas información favor comunicarse por esta misma vía.

    haga su solicitud de renovacion en este enlace https://www.lapulga.com.do/planes

    *Este no es un mensaje automatico*

    Equipo LP";

        foreach($arrTel as $tel) $opciones .= Funciones::mensajeWame($tel, $texto, "¡Plan Expirado!");

        // solicita extension 
        $texto = 
    "Saludos {$nombre[0]} 

    Le escribe el Administrador de La Pulga Virtual para saber si necesitas hacer mas publicaciones. Dejanos saber para hacerte una extension *totalmente gratuita*, estaremos a la espera de tus comentarios.

    Gracias por utilizar nuestros servicios.

    *Este no es un mensaje automatico*

    Equipo LP";

        foreach($arrTel as $tel) $opciones .= Funciones::mensajeWame($tel, $texto, "¡Para extension!");

        //$textareas.= "<b style=\"display:block;\">¡Plan Expirado!</b><textarea cols=\"60\" rows=\"2\" class=\"textamsjpred\" onclick=\"this.select(); document.execCommand('Copy');\">{$texto}</textarea><br>";	
    } else $opciones="<td align=\"center\" colspan=\"2\"><h3>Usuario Retirado, no aplica para mensaje</h3></td>";
    $retirar = "<a href=\"javascript:;\" class=\"ccampo verde\" id=\"USU_ESTATUS_R_{$arrRegistro['ID']}\">Retirar</a>";
    $municipio = isset(Config::$arrMunicipios[$arrRegistro['MUNICIPIO']]) ? Config::$arrMunicipios[$arrRegistro['MUNICIPIO']] : "N/D";
    $retirar = ($arrRegistro['ESTATUS'] == 'A') ? $retirar : (($arrRegistro['ACTIVADA'] != '0000-00-00 00:00:00') ? "<a href=\"javascript:;\" class=\"ccampo text-danger\" id=\"USU_ESTATUS_A_{$arrRegistro['ID']}\">Activar</a>" : "<a href=\"javascript:;\" class=\"ccampo text-danger\" id=\"USU_ACTIVARN_A_{$arrRegistro['SESSION']}\">Activar N</a><br>{$retirar}<br><a href=\"javascript:;\" class=\"ccampo \" id=\"USU_EMAACTIVA_A_{$arrRegistro['SESSION']}\">Email A</a>");

    // "<input type=\"text\" onclick=\"this.select(); document.execCommand('Copy');\" value=\"{$proturl}www.lapulga.com.do/activausuario/{$arrRegistro['SESSION']}\" size=\"5\"/><br>{$retirar}");
    $retirar = ($arrRegistro['ESTATUS'] == 'R') ? "" : $retirar;
    // $perfilfb = ($arrRegistro[')  https://www.facebook.com/profile.php?id=100016497753520
    $clase = ($arrRegistro['ESTATUS'] == 'R') ? "danger" : (($arrRegistro['ESTATUS'] == 'I') ? "warning" : "active");
    $clase = "class=\"{$clase}\"";
    $provincia = isset(Config::$arrProvincias[$arrRegistro['PROVINCIA']]) ? Config::$arrProvincias[$arrRegistro['PROVINCIA']] : "No disponible";
    // agrega cantidad de cuentas por el telefono
    $cuentas = ($arrRegistro['CUENTAS'] > 1) ? " <span class=\"text-danger\">Ctas({$arrRegistro['CUENTAS']})</span>" : "";
    $bloquea = ($_SESSION['lp_admusuplann'] == 'OP1') ? "<a href=\"javascript:;\" id=\"{$arrRegistro['TELEFONO1']}\" title=\"Bloque telefono\" class=\"admnotel\">Block</a> {$cuentas}" : "{$cuentas}";
    // $clasetel = (!in_array(explode(" ", $arrRegistro["TELEFONOS"])[0], $arrTelPermitidos)) ? "danger" : "";
    $clasetel = (!in_array(substr($arrRegistro["TELEFONO1"],1,3), Config::$arrTelPermitidos)) ? "danger" : "";
    if($arrRegistro['PUBLICACIONES'] <= 0 and $arrRegistro["ESTATUS"] == "A") {
        $ceropub = "<a target=\"_blank\" href=\"/admin.klk?uid={$arrRegistro["ID"]}\" class=\"klkmin\"></a> &nbsp;";
        //$ceropub .= whatsapptel($arrRegistro["TELEFONO1"], $urlsaludo, "<i class=\"fa fa-whatsapp\"></i>", false);
        $ceropub ="<span class=\"pull-right\">{$ceropub}</span>";
    } else $ceropub = "";
    $inactivo = $inactivolnk = "";
    if ($arrRegistro['ESTATUS'] == 'I') {
        //foreach($arrTel as $tel) $inactivo .= whatsapptel($tel, $urlinactivo, ($arrRegistro['DIASREGISTRADO'] >= 2) ? "Msg activo V" : "Contacta");
        foreach($arrTel as $tel) $inactivo .= Funciones::mensajeWame($tel, $urlinactivo,"Mensaje Activo",10);
        foreach($arrTel as $tel) $inactivolnk .= Funciones::mensajeWame($tel, $urlinactivolnk,"Link Activo",10);
    }
?>
                    <tr <?=$clase;?>>
                        <!-- <td><-?=//$arrRegistro['ENLACE'];?-></td> -->
                        <td>
                            <?="{$arrRegistro['NOMBRE']} - {$arrRegistro['ENLACE']}";?>
                            <?=$arrRegistro['PUBLICACIONESF'];?><?=$ceropub;?>
                            (<?=$arrRegistro['REGISTRADO'];?>)<br>
                            <a href="mailto:<?=$arrRegistro['EMAIL'];?>"><?=$arrRegistro['EMAIL'];?></a> (<a
                                href="/admin-perfilusuario?tipo=historialPines&uid=<?=$arrRegistro['ID'];?>"
                                target="/admin-perfilusuario" title="Ver historial pines"
                                class="ttb"><?=$arrRegistro['BALANCE'];?></a>)<br>
                            <?=$arrRegistro['USUENLACE'];?> (<a
                                href="/admin-perfilusuario?tipo=historialPlanes&uid=<?=$arrRegistro['ID'];?>"
                                target="/admin-perfilusuario" title="Ver historial planes"
                                class="ttb"><?=$arrRegistro['USUPLAN'];?></a>) | <a
                                href="/admin-perfilusuario?uid=<?=$arrRegistro['ID'];?>&tipo=modificaUsu"
                                target="admin.perfilusuario">MU</a> | <?=$paga;?>
                        </td>
                        <td class="<?=$clasetel;?>">
                            <?=$arrRegistro['TELEFONOS'];?><br><?=$bloquea;?><br><?=$inactivo;?><br><?=$inactivolnk;?>
                        </td>
                        <td><?=$arrRegistro['CREADA'];?><br><?=$arrRegistro['FECHALOGINF'];?><br><?=$arrRegistro['ACTIVADAF'];?><?=$usuhasta;?>
                        </td>
                        <td><?=$municipio;?><br><?=$provincia;?><br><?=$arrRegistro['IPADDRESS'];?></td>
                        <td><?=$retirar;?><br><a href="javascript:;" class="cambia"
                                id="<?=$arrRegistro['ID'];?>">Mensajes</a></td>
                    </tr>
                    <?=$seguimiento;?>
                    <tr class="hidden" style="display: table-row;">
                        <td colspan="2">Solo dar click y pegar en Whatsapp<br><?=$opciones;?></td>
                        <td colspan="3"><?=$textareas;?></td>
                    </tr> 
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>