<?=(Config::$arrParametrosmvc['param2'] == "Productos") ? Funciones::jsScripts("var arrProductos = " . json_encode(Config::$arrProductos)) : "";?>
<?=(Config::$arrParametrosmvc['param2'] == "Productos") ? Funciones::jsScripts("var arrInfoproductos = " . json_encode(Config::$arrInfoproductos)) : "";?>

<?php include("view/moproductos.tpl"); ?>
<div class="card ">
    <div class="card-header">
        <h4>PINES, Planes, etc. <a href="javascript:;" data-toggle="modal" data-target="#staticBackdrop">
		conoce m&aacute;s aqu&iacute;</a>, pagos autom&aacute;ticos v&iacute;a PayPal <i class="fab fa-paypal fa-fw fa-lg"></i></h4>
    </div>
    <div class="card-body">
		<form action="/productos" name="frmproducto" id="frmproducto" method="POST" class="needs-validation" enctype="multipart/form-data" novalidate>

			<input type="hidden" name="confirma" id="confirma" value="S" />	
			
			<div class="form-group row">	
				<label for="producto" class="col-sm-2 col-form-label">Producto</label>
				<div class="col-sm-10">
					<select name="producto" id="producto" class="form-control campocorto" required>
                        <option value="" selected>Seleccione</option>
                        <?php 
                        asort(Config::$arrProductos);
                        foreach(Config::$arrProductos  as $k => $v) {
							$selected = (isset($_GET['ai']) and ($_GET['ai'] == $k)) ? "selected" : "";
							if ($k == "PB") continue; ?>

                            <option value="<?=$k;?>" <?=$selected;?>><?=$v['nombre'];?> = RD$<?=number_format(Config::$arrProductos[$k]['precio'],2);?> &oacute; US$<?=number_format(Config::$arrProductos[$k]['precio']/Config::$tasadolar,2);?> / 
                                <?=Config::$arrProductos[$k]['unidad'];?></option>
                        <?php } ?>
                    </select>
					<small class="form-text text-muted">
						<a href="/historicoproductos">Ver listado de solicitudes de productos previas</a>
					</small>					
                    <div class="invalid-feedback">
                        Favor Seleccionar el producto
                    </div>                    
				</div>
			</div>

			<div class="form-group row" id="divinfoproductos" >	
				<label for="" class="col-sm-2 col-form-label">&nbsp;</label>
				<div class="col-sm-6" id="infoproductos"></div>
			</div>

			<div class="form-group row">	
				<label for="cantidad" class="col-sm-2 col-form-label">Cantidad</label>
				<div class="col-sm-10">
					<select name="cantidad" id="cantidad" class="form-control campocorto" required>
						<option value="" selected>Seleccione</option>
                    </select>
                    <div class="invalid-feedback">
                        Favor seleccione la cantidad
                    </div> 
				</div>
			</div>

			<div class="form-group row">	
				<label for="formapago" class="col-sm-2 col-form-label">Forma Pago</label>
				<div class="col-sm-10 flexr">
					<select name="formapago" id="formapago" class="form-control campocorto" required >
						<option value="">Seleccione</option>
						<optgroup label="Proceso autom&aacute;tico">
							<option value="PP">PayPal, tasa Dolar US$1.00 = RD$<?=number_format(Config::$tasadolar,2);?></option>
						</optgroup>
						<optgroup label="Proceso con espera de aprobaci&oacute;n">
							<option value="TB"><?=Config::$arrFormaPago['TB']?>, Cta. <?=Config::$arrCuentasBancos['BHD']?></option>
							<option value="TP"><?=Config::$arrFormaPago['TP']?>, Cta. <?=Config::$arrCuentasBancos['POPULAR']?></option>
							<option value="TR"><?=Config::$arrFormaPago['TR']?>, Cta. <?=Config::$arrCuentasBancos['RESERVAS']?></option>
							<option value="EF">Efectivo o Cheque</option>  
						</optgroup>
                    </select>
                    <div class="invalid-feedback">
                        Favor seleccione la forma de pago
                    </div>
				</div>
            </div>
            
			<div class="form-group row">	
				<label for="recibo" class="col-sm-2 col-form-label">Recibo Pago</label>
				<div class="col-sm-10">
                    <input name="recibo" id="recibo" type="file" class="form-control border-0 campocorto" accept=".jpg, .jpeg, .png,.pdf" placeholder="Enviarnos recibo en PDF, png o jpg">
					<small class="form-text text-muted">
						Recibo de tu pago en JPG, PNG  o PDF puedes subirlo
					</small>
				</div>					
            </div>

			<div class="form-group row" id="detalles">	
				<label for="transaccion" class="col-sm-2 col-form-label">Detalles</label>
				<div class="col-sm-10">
                    <textarea name="transaccion" id="transaccion" cols="30" rows="4" class="form-control campocorto" placeholder="Coloca copia de la transaccion o transferencia hecha o cualquier informacion que nos ayude a procesar rapido"></textarea>
                    <div class="invalid-feedback">
                        Favor una breve descripcion de su compra o datos de la transferencia si asi lo amerite
                    </div>
                </div>
                
            </div>
            

			<div class="form-group row">	
				<label for="totalTran" class="col-sm-2 col-form-label">&nbsp;</label>
				<div class="col-sm-10">
					<label>A pagar&nbsp;&nbsp;</label><label id="totalTran" style="font-size:1.1em;font-weight:700;";>0.00</label>
				</div>
			</div>
	
			<div class="form-group row ">
                <label for="" class="col-sm-2 col-form-label">&nbsp;</label>
                <div class="col-sm-10">
                    <button name="Enviar" type="submit" id="Enviar" class="btn btn-success btn-lg">Solicitar Producto</button>
                </div>
            </div>
		</form>
	</div>
</div>