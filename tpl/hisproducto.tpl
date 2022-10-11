<tr>
    <th colspan="9">
        <h3>Historial de Productos (<?=Config::$totalRegistros;?>)</h3>
    </th>
</tr>
<tbody>
    <tr>
        <th>ID</th>
        <th>Estatus</th>
        <th>Fecha solicitud<br>Fecha Procesado</th>
        <th>Valor<br>Desc<br>Total</th>
        <th>Cantidad</th>
        <th>Forma de pago<br>Tasa Dolar</th>
        <th>Accion</th>
    </tr>
<?php 
foreach($tplBloquedos as $arrRegistro) { 
    $clase = ($arrRegistro['PRIORIDAD'] == 'A') ? "danger" : "active";
    $clase = "class=\"<?=$clase}\"";
?>
    <tr <?=$clase;?>>
        <td><?=$arrRegistro['ID'];?></td>
        <td><?=$arrRegistro['ESTATUS'];?></td>
        <td><?=$arrRegistro['FECHA'];?> (<?=$arrRegistro['PROCESADO'];?>)</td> 
        <td><?=$arrRegistro['CANTIDAD'];?></td>
        <td><?=$arrRegistro['VALOR'];?> (<?=$arrRegistro['DESCUENTO'];?>) (<?=$arrRegistro['MONTO']; $arrRegistro['MONEDA'];?>)</td>
        <td><?=$arrRegistro['FORMAPAGO'];?><?="{$arrRegistro['TASA'];$arrRegistro['MONEDA']} / {$arrRegistro['MONTO']; $arrRegistro['MONEDA']}"?></td>
        <td><?=$retirar;?><br><a href="javascript:;" class="cambia" id="<?=$arrRegistro['ID'];?>">Mensajes</a></td>?>
    </tr>

<?php } ?>
