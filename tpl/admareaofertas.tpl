<?php include("view/frmproductos.tpl"); ?>
<div class="item">
    <div class="bg-white">

        <div class="table table-responsive">
            <table class='table table-striped table-hover bg-white'>

            
                <thead>

                    <tr>
                        <th colspan="9"><h4>Usuarios en AO, Vigentes (gris), Vencidos (rojo) </h4></th>
                    </tr>
                    <tr>
                        <th>ID T</th>
                        <th>UID</th>
                        <th>Tienda/Usuario</th>
                        <th>Meses</th>
                        <th class='col-md-3'>Fecha <br>Hasta</th>
                        <th>Dias</th>
                        <th>Activo</th>
                        <th>Pago</th>
                    </tr>             

                </thead>
                <tbody>

                    <?php 

                    foreach($tplBloqueuno as $arrRegistro) { 
                        //parr($arrRegistro);
                        $clase = ($arrRegistro['ACTIVO'] == 'No') ? "danger" : "";
                        $clase = "class=\"table-{$clase}\"";
                        // determina si editar la transaccion o crear uno nuevo de la lista
                        $accion = ($arrRegistro['ACTIVO'] == 'Si') ? "id={$arrRegistro['ID']}" : "uid={$arrRegistro['USUARIO_ID']}";                        
                    ?>
                        <tr <?=$clase;?>>
                            <td><a href="javascript:;" class="cambia" id="<?=$arrRegistro['ID'];?>" title="Ver detalles transaccion"><?=$arrRegistro['ID'];?></a></td>
                            <td><a href="/admin-areaofertas?<?=$accion;?>"><?=$arrRegistro['USUARIO_ID'];?></a></td>
                            <td><a href="/admin-perfilusuario?uid=<?=$arrRegistro['USUARIO_ID'];?>"><?=$arrRegistro['NOMBRE'];?></a></td>
                            <td align="center"><?=$arrRegistro['CANTIDAD'];?></td>
                            <td><?=$arrRegistro['FECHA'];?><br><?=$arrRegistro['HASTA'];?></td>
                            <td align="right"><?=$arrRegistro['RESTA'];?></td>
                            <td align="center"><?=$arrRegistro['ACTIVO'];?></td>
                            <td align="center"><?=$arrRegistro['FORMAPAGO'];?></td>
                        </tr>
                        <tr class="apaga" id="tr-<?=$arrRegistro['ID'];?>">
                            <td colspan="8"><?=$arrRegistro['TRANSACCION'];?></td>
                        </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>