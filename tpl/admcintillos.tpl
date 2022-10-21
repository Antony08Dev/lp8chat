<!-- </?php //include("frmcintillos.php") ?> -->
<div class="card-body">
	<form action="admin.cintillo.php" method="post" name="frmadmincintillo" id="frmadmincintillo">
			<?=(isset($id)) ? "<input name=\"id\" type=\"hidden\" value=\"$id\" />" : "" ?>
		<div class="form-group row"> <label for="titulo" class="col-sm-2 col-form-label">Titulo Mensaje.: </label>
			<div class="col-sm-6">
				<input class="form-control" name="titulo" type="text" id="titulo" value="<?=isset($titulo) ? htmlentities($titulo) : "";?>" placeholder="Titulo Mensaje.:" />
			</div>
		</div>
		<div class="form-group row">
			<label for="mensaje" class="col-sm-2 col-form-label">Mensaje a colocar.: </label>
			<div class="col-sm-6">
				<textarea class="form-control" name="mensaje" cols="55" rows="5" id="mensaje" placeholder="Mensaje a colocar.:"><?=isset($mensaje) ? htmlentities($mensaje) : "";?></textarea><label id="caracteres">300 Car&aacute;cteres M&aacute;ximo</label>
			</div>
		</div>
		<div class="form-group row">
			<label for="enlace" class="col-sm-2 col-form-label">Texto Enlace.: </label>
			<div class="col-sm-6">
				<input class="form-control" name="enlace" type="text" id="enlace" value="<?=isset($enlace) ? htmlentities($enlace) : "";?>" placeholder="Texto enlace.:" />
			</div>
		</div>
		<div class="form-group row">
			<label for="url" class="col-sm-2 col-form-label">Url enlace.: </label>
			<div class="col-sm-6">
				<input class="form-control" name="url" type="text" id="url" value="<?=isset($url) ? $url : "";?>" placeholder="Url enlace.:" />
			</div>
		</div>
		<div class="form-group row">
			<label for="url" class="col-sm-2 col-form-label">Dias Hasta.:</label>
			<div class="col-sm-6">
				<select class="form-control" name="hasta" id="hasta">
					<option value="0">Seleccione dias hasta</option>
						<option value="-10" <?=(isset($hasta) and ($hasta == -10)) ? "Selected" : "";?>>Retirar</option>
						<option value="1" <?=(isset($hasta) and ($hasta == 1)) ? "Selected" : "";?>>1 Dia</option>
						<option value="2" <?=(isset($hasta) and ($hasta == 2)) ? "Selected" : "";?>>2 Dias</option>
						<option value="3" <?=(isset($hasta) and ($hasta == 3)) ? "Selected" : "";?>>3 Dias</option>
						<option value="4" <?=(isset($hasta) and ($hasta == 4)) ? "Selected" : "";?>>4 Dias</option>
						<option value="5" <?=(isset($hasta) and ($hasta == 5)) ? "Selected" : "";?>>5 Dias</option>
						<option value="6" <?=(isset($hasta) and ($hasta == 6)) ? "Selected" : "";?>>6 Dias</option>
						<option value="7" <?=(isset($hasta) and ($hasta == 7)) ? "Selected" : "";?>>7 Dias</option>
						<option value="8" <?=(isset($hasta) and ($hasta == 8)) ? "Selected" : "";?>>8 Dias</option>
						<option value="9" <?=(isset($hasta) and ($hasta == 9)) ? "Selected" : "";?>>9 Dias</option>
						<option value="10" <?=(isset($hasta) and ($hasta == 10)) ? "Selected" : "";?>>10 Dias</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">Tipo Mensaje.:</label>
			<div class="col-sm-6">
				<select class="form-control" name="tipo" id="tipo">
						<option value="0">Seleccione tipo mensaje</option>
						<option value="I" <?=(isset($tipo) and ($tipo =='I')) ? "Selected" : "";?>>Informacion</option>
						<option value="E" <?=(isset($tipo) and ($tipo =='E')) ? "Selected" : "";?>>Error</option>
						<option value="W" <?=(isset($tipo) and ($tipo =='W')) ? "Selected" : "";?>>Advertencia</option>
				</select>
			</div>
		</div>
		<br />
		<div class="form-group row">
			<label class="col-sm-2 col-form-label"> </label>
			<div clase="col-sm-6">
				<input class="btn btn-success btn-lg ml-3" name="Enviar" type="submit" id="Enviar" value="Enviar Mensaje" />
				<input class="btn btn-info btn-lg" type="button" name="Nuevo" id="btnCancelar" value="Nueva Entrada" onclick="location.href='/admin.cintillo.php';" />
				<input class="btn btn-danger btn-lg" type="button" name="Cancelar" id="btnCancelar" value="Cancelar" />
			</div>
		</div>
	</form>
</div>
<div class="item">
	<div class="bg-white">
		<div class="table table-responsive">
			<table class='table table-striped table-hover bg-white'>
				<thead>
					<tr>
						<td>ID</td>
						<td>Titulo</td>
						<td>Mensaje <br> Enlace</td>
						<td>Fecha <br> Hasta</td>
						<td>Tipo</td>
						<td>Etus</td>
					</tr>
				</thead>
				<tbody>
					<?php 
                    foreach($tplBloqueuno as $arrRegistro) { 
                        //parr($arrRegistro);                 
                    ?>
					<tr>
						<!--</?=//$clase;?>-->
						<td><?=$arrRegistro['ID'];?></td>
						<td><a href="/admin-cintillo.php?id=<?=$arrRegistro['ID']?>" target="_blank"><?=$arrRegistro['TITULO'];?></a></td>
						<td><a href="/admin-cintillo.php?id=<?=$arrRegistro['ID']?>" target="_blank"><?=$arrRegistro['MENSAJE'];?></a><br>Url.: <a href="<?=$arrRegistro['URL'];?>" target="_blank"><?=$arrRegistro['ENLACE'];?></a></td>
						<td align="center"><?=$arrRegistro['FECHA'];?><br><br><?=$arrRegistro['HASTADIA'];?></td>
						<td align="center"><?=$arrRegistro['TIPO'];?></td>
						<td align="center"><?=$arrRegistro['ESTATUS'];?></td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
		</div>
	</div>
</div>