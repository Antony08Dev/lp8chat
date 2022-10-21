<div class="item">
	<div class="bg-white">
		<?php include("view/frmadmfaq.tpl"); ?>
		<div class="table table-responsive">
			<table class='table table-striped table-hover bg-white'>
				<thead>
                    <tr>
                        <th>ID</th>
                        <th class='col-md-6'>Topico</th>
                        <th class='col-md-4'>Respuesta</th>
                        <th>enlace</th>
                        <th class='col-md-1'>status</th>
                    </tr>
				</thead>
				<tbody>
					<?php 
                    foreach($tplBloqueuno as $arrRegistro) { 
                        //parr($arrRegistro);
                    ?>
								<tr id="tr<?=$arrRegistro['ID'];?>" rel="<?=$arrRegistro['ID'];?>">
									<td class="recoger-data"><?=$arrRegistro['ID'];?></td>
									<td class="topico recoger-data"><?=$arrRegistro['TOPICO'];?></td>
									<td class="respuesta recoger-data"><?=$arrRegistro["DESCRIPCION"]?><input type="hidden" id="respuesta-<?=$arrRegistro['ID'];?>" value='<?=$arrRegistro["DESCRIPCION"];?>'>
									<span class="categorias hidden" id="cat-<?=$arrRegistro['ID'];?>" rel="<?=$arrRegistro["CATEGORIA"];?>"><?=$textCategorias?></span>
									
									</td>
									
									<td> 

									<input type="text"  onclick="this.select(); document.execCommand('Copy');" value="https://www.lapulga.com.do/ayuda/<?=Funciones::depuraurl($arrRegistro['TOPICO']);?>_<?=$arrRegistro['ID'];?>.html"/>
									</td>
									
									<td align='center'>
										<input type="checkbox" onchange="estatus('faq-<?=$arrRegistro['ID'];?>');" value="FAQ_ESTATUS_" id="faq-<?=$arrRegistro['ID'];?>" <?= ($arrRegistro["ESTATUS"] == "A") ? "checked" : "" ; ?>>
									</td>
								</tr>                    
                    <?php } ?>
				</tbody>
			</table>
		</div>
	</div>
</div>