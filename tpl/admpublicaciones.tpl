
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
                        $id = $arrRegistro['ID'];
                        $clase = $reshasta = "";
                        $arrRegistro['ESTATUS'] = "A";
                        // $arrRegistros[] = $arrRegistro;
                        $categoria = isset($arrCategorias[$arrRegistro['CATEGORIA_ID']]) ? $arrCategorias[$arrRegistro['CATEGORIA_ID']] : "No aplica";
                        //input con array de fotos
                        $inputArrf = "<input type=\"hidden\" id=\"arrFotos_{$arrRegistro['ID']}\" value='{$arrRegistro['FOTOS']}' class=\"arrFotos form-control\">";
                        // nueva funcion fotoLista para generar el html de cada imagen, solo usada aqui mientras
                        //$flista = $this->fotoLista($arrRegistro['FOTOS'],120);
                        $arrRegistro['FOTOS'] = count(explode(",",$arrRegistro['FOTOS']));
                        // acciones
                        $flista = '<img src="https://www.lapulga.com.do/cache/120/fotodefecto.jpg">';
                        $arrRegistro['SUBCATEGORIA'] = "subcategorias a revisar";
                        $arrRegistro['ACUMULADAS'] = "200";
                        $arrRegistro['RESHASTA'] = "2022-12-12 14:00:40";
                        $arrRegistro['VISITADO'] = "2022-10-08 14:00:40";
                        $accionRetirar = ($arrRegistro['ESTATUS'] == 'A') ? "<a href=\"javascript:;\" class=\"ccampo verde\" id=\"ART_ESTATUS_RO_{$arrRegistro['ID']}\">Retirar</a>" : "<a href=\"javascript:;\" class=\"ccampo rojo\" id=\"ART_ESTATUS_A_{$arrRegistro['ID']}\">Activar</a>";
                        $accionFotos = "<a href=\"javascript:;\" name=\"admresfot\" id=\"admresfot-{$arrRegistro['ID']}\" title=\"Eliminar todas las fotos de esta publicaci&oacute;n\" class=\"admresfot\">E. Fotos</a>";
                        $arrRegistro['PUBLICIDAD'] = 'N';
                        //$accionEditar = "<a href=\"/modificapublicacion/{$arrRegistro['ID']}\" name=\"admmodtitulo\" id=\"". urlencode("{$arrRegistro['CATEGORIA_ID']}-{$arrRegistro['SUBCATEGORIA_ID']}|{$arrRegistro['ARTICULO']}|{$arrRegistro['PRECIO']}|{$arrRegistro['MONEDA']}|{$arrRegistro['TIPO']}|{$arrRegistro['CONDICION']}") ."\" title=\"{$arrRegistro['ARTICULO']}\" rel=\"{$arrRegistro['ID']}\" class=\"momodificapu\">Editar{$inputArrf}</a>";
                        $accionEditar = "<a href=\"/\" name=\"admmodtitulo\" title=\"{$arrRegistro['ARTICULO']}\" rel=\"{$arrRegistro['ID']}\" class=\"momodificapu\">Editar{$inputArrf}</a>";
                        $accionAdwords = ($arrRegistro['PUBLICIDAD'] == 'S') ? "<a href=\"javascript:;\" name=\"admpublicidad\" id=\"admpublicidad-{$arrRegistro['ID']}-N\" title=\"Quitar de Adwords\" class=\"admpublicidad\">Q. Adwords</a>" : "<a href=\"javascript:;\" name=\"admpublicidad\" id=\"admpublicidad-{$arrRegistro['ID']}-S\" title=\"Añadir a Adwords\" class=\"admpublicidad\">P. Adwords</a>";
                        if ($arrRegistro['RESALTADO'] == 'R') {
                            $clase = " class=\"resal\""; 
                            $reshasta = "<b>Res.: </b>{$arrRegistro['RESHASTA']}<br>";
                        }
                        $estatus = ($arrRegistro['ESTATUS'] != 'A') ? "Estatus.: {$arrRegistro['ESTATUS']}" : "";                        
                    ?>
                        <tr>
                            <!-- <td><input type="checkbox" name="field name" value="Initial value"></td> 
                            <td></?=//$arrRegistro['FOTOS'];?/></td>
                            <td></?=//$arrRegistro['ARTICULO'];?/><br><b>Precio.:</b></?=//$arrRegistro['PRECIOF'];?/><br></?=//"{$arrRegistro['CATEGORIA_ID']} - {$arrRegistro['SUBCATEGORIA_ID']}";?/><br><b>ID.:</b></?=//"{$arrRegistro['ID']}, <b>Fotos.:</b>{$arrRegistro['FOTOS']}";?></td>
                            <td><b>Pub.:</b></?=//$arrRegistro['FECHA']?/><br><b>Vis.:</b></?=//$arrRegistro['VISITADO'];?/><br><b>Visitas.:</b></?=//$arrRegistro['VISITAS'];?/><b>Acum.:</b></?=//$arrRegistro['ACUMULADAS'];?/></td> -->
                            <td align="center"><label for="<?=$arrRegistro['ID']?>"><input id="{$arrRegistro['ID']}" type="checkbox" name="sel[]" rel="{$arrRegistro['USUARIO_ID']}" value="{$arrRegistro['ID']}"></td>
						    <td align="center"><?=$flista;?></td>
						    <td><a href="/?id=$arrRegistro['ID']?>" target="\"><?=$arrRegistro['ARTICULO'];?></a><br>
							<b>Precio.: </b><?=$arrRegistro['PRECIOF']?><br>
							<?=$categoria?> <?=$arrRegistro['SUBCATEGORIA'];?><br>
							<b>ID.: </b><?=$arrRegistro['ID']?>, <b>Fotos.: </b><?=$arrRegistro['FOTOS']?>
						    </td>
                            <td><b>Pub.: </b><?="{$arrRegistro['FECHA']}";?><br><b>Vis.: </b><?=$arrRegistro['VISITADO'];?><br><?=$reshasta?><b>Visitas.: </b><?="{$arrRegistro['VISITAS']}";?>, <b>Acum.: </b><?=$arrRegistro['ACUMULADAS']?><br><?=$estatus?></td>
                            <td align="center"><?=$accionRetirar;?><br><?=$accionFotos;?><br><?=$accionEditar;?><br><?=$accionAdwords;?></td>
                        </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>