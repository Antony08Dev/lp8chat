<tr>
    <th colspan="4"><h3>Comentarios (<?=Config::$totalRegistros;?>)</h3></th>
</tr>
<tr>
    <th class='col-md-5'>Comentario</th>
    <th>Fecha</th>
    <th>Operador</th>
    <th>Seguimiento</th>
</tr>
<?php 
foreach($tplBloquedos as $arrRegistro) { 
    $clase = ($arrRegistro['PRIORIDAD'] == 'A') ? "danger" : "active";
    $clase = "class=\"<?=$clase}\"";
?>
    <tr <?=$clase;?>>
        <td><?=$arrRegistro['COMENTARIO'];?></td>
        <td><?=$arrRegistro['FECHAF'];?></td>
        <td><?=$arrRegistro['OPERADOR'];?></td>
        <td><?=$arrRegistro['SEGUIMIENTO'];?> (<?=$arrRegistro['DIAS'];?> dias)</td>
    </tr>

<?php } ?>

