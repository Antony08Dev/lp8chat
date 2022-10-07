<div class="item">
    <div class="lpub bg-white">
        <div class="table table-responsive">
            <table class='table table-striped table-hover bg-white'>
                <thead>
                    <tr align=''>
                        <th class='col-md-4'>Nombre (publicaciones)<br>Email (pines)<br>Usuario (plan)</th>
                        <th width='15%'>Teléfonos</th>
                        <th class='col-md-2'>Creada<br>Login<br>Activado</th>
                        <th>Municipio<br>Provincia<br>Direccion IP</th>
                        <th>Acciones</th>
                    </tr>
                </thead>

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

?>
                <tbody>
                <?php
                    foreach($arrRegistros as $arrRegistro) { 
                        //parr($arrRegistro);
                    ?>
                    <tr <?=$clase;?>>
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
                    <tr class="apaga">
                        <td colspan="2">Solo dar click y pegar en Whatsapp<br><?=$opciones;?></td>
                        <td colspan="4"><?=$textareas;?></td>
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>