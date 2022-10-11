
<div class="item">
    <div class="bg-white">
        <div class="table table-responsive">
            <table class='table table-striped table-hover bg-white'>

            
                <thead>

                <tr>
                            <th width="20" align="left">CK</th>
								<th>Foto</th>
								<th class="col-md-5">Info General</th>
								<th class="col-md-3">Estadistica</th>
								<th>Acciones</th>
							</tr>                

                </thead>
                <tbody>

                    <?php 

                    foreach($tplBloqueuno as $arrRegistro) { 
                    ?>
                    <tr>
                    <td><input type="checkbox" name="field name" value="Initial value"></td> 
                    <td><?=$arrRegistro['FOTOS'];?></td>
                    <td><?=$arrRegistro['ARTICULO'];?><br><b>Precio.:</b><?=$arrRegistro['PRECIOF'];?><br><?="{$arrRegistro['CATEGORIA_ID']} - {$arrRegistro['SUBCATEGORIA_ID']}";?><br><b>ID.:</b><?="{$arrRegistro['ID']}, <b>Fotos.:</b>{$arrRegistro['FOTOS']}";?></td>
                    <td><b>Pub.:</b><?=$arrRegistro['FECHA']?><br><b>Vis.:<b/><?=$arrRegistro['VISITADO'];?><br><b>Visitas.:</b><?=$arrRegistro['VISITAS'];?><b>Acum.:</b><?=$arrRegistro['ACUMULADAS'];?></td>
                    <td align=\"center\">{$accionRetirar}<br>{$accionFotos}<br>{$accionEditar}<br>{$accionAdwords}</td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>