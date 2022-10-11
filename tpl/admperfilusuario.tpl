<?php
    $arrRegistro = $tplBloqueuno;
    $arrRegistro['TELEFONO1']
?>
<link rel="stylesheet" href="/css/adminlpv8.css">
<div class="item">
    <div class="p-2 float-left bg-white">
        <ul class="ulcol col3 borderb" id="adperusu1">
            <li>
                <b>Nombre.: </b><?=$arrRegistro['NOMBRE'];?>
            </li>
            <li>
                <b>Email.: </b><a
                    href="mailto:<?=$arrRegistro['EMAIL'];?>;<?=$arrRegistro['EMAILS'];?>"><?=$arrRegistro['EMAIL'];?></a>
                | <a href="/admin-perfilusuario?uid=<?=$arrRegistro['ID'];?>&tipo=modificaUsuEmail">M</a>
            </li>
            <li>
                <b>Telefono(s).: </b>
                <a target="<?=$targetus;?>"
                    href="<?=$targetus;?>?q=<?=$arrRegistro['TELEFONO1'];?>"><?=$arrRegistro['TELEFONO1'];?></a>,
                <a target="<?=$targetus;?>"
                    href="<?=$targetus;?>?q=<?=$arrRegistro['TELEFONO2'];?>"><?=$arrRegistro['TELEFONO2'];?></a>,
                <a target="<?=$targetus;?>"
                    href="<?=$targetus;?>?q=<?=$arrRegistro['TELEFONO3'];?>"><?=$arrRegistro['TELEFONO3'];?></a>
            </li>
            <li>
                <b>Provincia.: </b><?=Config::$arrProvincias[$arrRegistro['PROVINCIA']];?>
            </li>
            <li>
                <b>Dirección.: </b><?=$arrRegistro['DIRECCION'];?>
            </li>
            <li>
                <b>Usu Creada.: </b><?=0//$arrRegistro['CREADAF'];?>
            </li>
            <li>
                <b>Usu Login.: </b><a href="/admin-perfilusuario?tipo=entradasUsu&uid=<?=$arrRegistro['ID'];?>"
                    title="Ver entradas de este usuario"><?=$arrRegistro['FECHALOGINF'];?></a>
            </li>
            <li>
                <b>Pines.: </b><a href="/admin-perfilusuario?tipo=historialPines&uid=<?=$arrRegistro['ID'];?>">
                    (<?=$arrRegistro['BALANCE'];?>) -
                    <!-- <-?=//$arrRegistro['FECHABALANCEF'];?-> --></a>
            </li>
            <li>
                <b>Planes.: </b><a
                    href="/admin-perfilusuario?tipo=historialPlanes&uid=<?=$arrRegistro['ID'];?>">Historial</a>
            </li>
            <li>
                <b>Penalidades.: </b><a
                    href="/admin-perfilusuario?tipo=historialPenalidades&uid=<?=$arrRegistro['ID'];?>">Historial</a>
            </li>
            <li>
                <b>Comentarios.: </b><a
                    href="/admin-perfilusuario?tipo=comentariosUsu&uid=<?=$arrRegistro['ID'];?>">Historial</a>
            </li>
            <li>
                <b>Publicaciones.: </b><a
                    href="/admin-perfilusuario?tipo=historialPublicaciones&ob=Activas&fld=art&orde=asc&uid=<?=$arrRegistro['ID'];?>">ver
                    <?=$arrRegistro['PUBLICACIONES'];?></a>
            </li>
            <li>
                <b>Favoritos.: </b><?=10//$arrRegistro['FAVORITOS'];?>
            </li>
            <li>
                <b>Mensajes.: </b><?=0//$arrRegistro['MENSAJES'];?> <a
                    href="/admin.klk?uid=<?=$arrRegistro['ID'];?>">ver
                    KLK</a>
            </li>
            <li>
                <b>Procedencia.: </b><a target="_blank"
                    href="http://www.ip-tracker.org/locator/ip-lookup.php?ip=<?=0//$arrRegistro['IPADDRESS'];?>"><?=0//$arrRegistro['IPADDRESS'];?></a>
            </li>
        </ul>
        <b>Renovaciones.: </b> <strong>Renovaciones.: </strong> Hasta.: 20-03-2020 12:25 PM Estatus=A, Lun=6 Mar=6
        Mier=6 Jue=6 Vie=6 Sab=6 Dom=6
        <br>
        <b>Paga Plan.: </b>
        Si&nbsp;<input type="radio" name="paga" id="si" class="ppaga" value="USU_PAGA_S_330112">
        </label>
        <label for="no">
            No&nbsp;<input type="radio" name="paga" id="no" class="ppaga" value="USU_PAGA_N_330112" checked>
        </label>
        <!-- //comentar y penalizar usuario -->
        <a href="javascript:;" class="moadcomusu float-right btn btn-info" style="margin-left:10px;"><i
                class="fa fa-comments"></i>Comentario a <?=$arrRegistro['NOMBRE'];?></a>
        <a href="javascript:;" class="moadpenalidades float-right btn btn-warning"><i
                class="fa fa-eye-slash"></i>Penalizar a <?=$arrRegistro['NOMBRE'];?></a>
        <ul class="ulcol col3 borderb" id="adperusu2">
            <li>
                <b>Plan hasta.: </b>2023-05-31 11:30:58 </li>
            <li>
                <b>Visitas.: </b>192370 </li>
            <li>
                <b>Video.: </b>No tiene </li>
            <li>
                <b>Tipo.: </b>Vehículos </li>
            <li>
                <b>Visitada.: </b>27-09-2022 11:47 AM </li>
            <li>
                <b>Facebook.: </b>No tiene </li>
            <li>
                <b>Plan Nombre.: </b><a href="/tienda/usuario/99860" target="_blank">NELSON AUTOS</a>
            </li>
            <li>
                <b>Descripción.: </b>Compramos y vendemos vehiculos
                nuevos y usados y te recibimos
                tu vehiculo
                gran variedades de marcas a los
                mejores precios del mercado
                visitanos y lo comprobaras.
                Atenciones personalizadas. Ven
                y deja de andar a pie. </li>
        </ul>
        <hr>
        <div class="table table-responsive borderb">
            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th colspan="4">
                            <h3>Comentarios (<?=0//$lista->cuantos;?>)</h3>
                        </th>
                    </tr>
                    <tr>
                        <th class='col-md-5'>Comentario | <a href="javascript:;" class="moadcomusu"> Agregar</a></th>
                        <th>Fecha</th>
                        <th>Operador</th>
                        <th>Seguimiento</th>
                    </tr>
                </thead>
                <tr>
                    <td></td>
                    <td>tpllistado</td>
                </tr>
                <?="variable comentada"//$tpllistado;?>
            </table>
        </div>
        <a href="javascript:;" class="moadcomusu float-right btn btn-info" style="margin-left:10px;"><i
                class="fa fa-comments"></i>Comentario a <?=$arrRegistro['NOMBRE'];?></a>
        <a href="javascript:;" class="float-right btn btn-warning"><i class="fa fa-eye-slash"></i>Penalizar a
            <?=$arrRegistro['NOMBRE'];?></a>
    </div>
</div>