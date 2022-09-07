<div class="modal fade" tabindex="-1" role="dialog" id="mmodificapu">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">Edici&oacute;n R&aacute;pida</h3>
      </div>
      <div class="modal-body" id="pubmobody">
	     <form method="post" name="frmmodificapu" id="frmmodificapu" action="/publicar" class="form-horizontal">
			<?=camposAnteriores(isset($arrPublicar)) ? $campos : '';?>
			<input type="hidden" name="retorno" value="<?=$_SERVER['REQUEST_URI'];?>">
			<input type="hidden" value="<?=(isset($lista->Articulo['TIPO'])) ? $lista->Articulo['TIPO'] : '';?>" name="tipo" id="tipo" />
			<input type="hidden" name="categoria_id" id="categoria_id">
			<input type="hidden" name="subcategoria_id" id="subcategoria_id">
			<input type="hidden" value="<?=$tplid;?>" name="id" id="id" class="id"/>
			<input type="hidden" name="condicion" id="condicion" />
			<div  class="form-group">
				<label class="col-sm-2 control-label" for="categoria">Categor&iacute;a.:</label>
				<div class="col-sm-6">
					<select  class="form-control" name="categoria" id="categoria" >
						<option value="" selected>Seleccione</option>
						<optgroup label="Empleos" >
							<option value="7-240" <?=isset($arrPublicar['categoria']) and ($arrPublicar['categoria'] == "7-240") ? "selected" : "";?>>Oferta de Empleo (Empresas)</option>
							<option value="7-168" <?=isset($arrPublicar['categoria']) and ($arrPublicar['categoria'] == "7-168") ? "selected" : "";?>>Solicitud de Empleo (Cantidatos)</option>
						</optgroup>
						<optgroup label="Servicios" >
							<option value="S">Publicación de Servicios Varios</option>
						</optgroup>
						<?php
							asort($arrCategorias);
							foreach($arrCategorias as $k => $v) {
								if ($k == 17) continue;
								echo "<optgroup label=\"" . $v . "\">";
								$qryString = "SELECT ID, SUBCATEGORIA FROM {$lista->prefijo_tabla}SUBCATEGORIAS WHERE CATEGORIA_ID={$k} ORDER BY SUBCATEGORIA";
								$resultado = $lista->db->query($qryString);
								while($row = $resultado->fetch_row()) {
									$row[1] = utf8_encode($row[1]);
									$selected = ($lista->Articulo['SUBCATEGORIA_ID'] == $row[0]) ? "selected" : "";
									echo "<option value=\"{$k}-{$row[0]}\" {$selected}>{$row[1]}</option>";
								}
								echo "</optgroup>";
							}
						?>
					</select>
				</div>
			</div>
			<div  class="form-group">
				<label class="col-sm-2 control-label" for="articulo">T&iacute;tulo.:</label>
				<div class="col-sm-9">
					<input maxlength="70" name="articulo" id="articulo" value="<?=$lista->Articulo['ARTICULO']?>" class="form-control" type="text" >
				</div>
			</div>
			<div  class="form-group hide"  id="moneda">
				<label class="col-sm-2 control-label" for="precio"><span id="lblprecio">Precio.:</span></label>
				<div class="col-sm-3">
					<input class="form-control tt tbottom" title="Recomendacion <br/> No es necesario agrega puntos (.) o comas (,) al precio, el sistema lo hace por ti." type="number"  name="precio" id="precio"  value="<?=$lista->Articulo['PRECIO']?>" >
				</div>
				<div class="col-sm-3 col-xs-12">
					<div class="radio">
						<?php 
							if (isset($lista->Articulo['MONEDA'])) {
								$peso = ($lista->Articulo['MONEDA'] == 'R') ? "checked" : "";
								$dolar = ($lista->Articulo['MONEDA'] == 'U') ? "checked" : "";
							}
						?>
						<label for="peso">
							<input type="radio" name="moneda" id="peso" value="R" <?=(isset($peso)) ? $peso :"";?>>RD$
						</label>
						<label for="dolar">
							<input type="radio" name="moneda" id="dolar" value="U" <?=(isset($dolar))? $dolar : "";?>>US$
						</label>
					</div>
				</div>
			</div>
            <button  name="Enviar" type="submit" id="Enviar" class="btn btn-success btn-lg" >Actualizar</button>
        </form>
      </div>
      <div class="modal-footer">
		<h4><?=$tplpiemodal;?></h4>
      </div>
    </div>
  </div>
</div>