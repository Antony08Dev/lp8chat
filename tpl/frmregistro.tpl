<script src="https://www.google.com/recaptcha/api.js?render=<?=Config::$arrRecaptcha['sitekey'];?>"></script>
<script>
	grecaptcha.ready(function () {
		grecaptcha.execute('<?=Config::$arrRecaptcha['sitekey'];?>', { action: 'contact' }).then(function (token) {
			var recaptchaResponse = document.getElementById('recaptcha_response');
			recaptchaResponse.value = token;
		});
	});
</script>
<div class="card ">
    <div class="card-header">
        <h4><?=$tplTitulo;?>, <a href="/login">si ya tienes una entra aqu&iacute;</a>  | <a href="javascript:;" title="Compartir via codigo QR" class="moqrcodigo ">Compartir con QR</a></h4>
    </div>
    <div class="card-body">
		<form action="/registro" name="frmregistro" id="frmregistro" method="POST" class="needs-validation" novalidate>
			<input type="hidden" name="recaptcha_response" id="recaptcha_response">
			<input type="hidden" name="confirma" id="confirma" value="S" />
			<?=Funciones::campoSpambot();?>
			
      		<?php if ($tplReferidor != "") { ?>
				<input type="hidden" name="referidor" id="referidor" value="<?=Config::$arrParametrosmvc['param2']["referidor"];?>" />
			<?php } ?>

			<div class="form-group row ">
				<label for="nombre" class="col-sm-2 col-form-label" >Nombre</label>
				<div class="col-sm-10">
					<input class="form-control campocorto" name="nombre" placeholder="Nombre completo" id="nombre" type="text" autofocus required>           
					<div class="invalid-feedback">
						Necesita colocar su nombre
					</div>
				</div>
			</div>	
			
			<div class="form-group row ">
				<label for="telefono1" class="col-sm-2 col-form-label" >Tel&eacute;fono</label>
				<div class="col-sm-10">
					<input class="form-control phone_us campocorto" name="telefono1" id="telefono1" type="text" required>           
					<div class="invalid-feedback">
						Necesita colocar su telefono
					</div>
				</div>
			</div>	
			
			<div class="form-group row ">
				<label for="email" class="col-sm-2 col-form-label" >Email</label>
				<div class="col-sm-10">
					<input class="form-control campocorto" name="email" id="email" type="email" data-bv-emailaddress-message="Este no es un email valido, favor revisar" required>           
					<div class="invalid-feedback" id="emailregistrado">
						Necesita colocar un email valido
					</div>
				</div>
			</div>	
			
			<div class="form-group row ">
                <label for="provincia" class="col-sm-2 col-form-label">Provincia</label>
                <div class="col-sm-10">
                <select name="provincia" class="custom-select campocorto" id="provincia" required >
                    <option value="" disabled selected>Seleccione...</option>
                    <?php
                        foreach (Config::$arrProvincias as $k => $v) {
							if ($k == 30) continue;
							              //$v = Encoding::fixUTF8($v);
                            //$selected = ($k == 30) ? "selected" :"";
                            echo "<option value='$k'>$v</option>\n";
                        }
                    ?>
                </select>
                    <div class="invalid-feedback">
                        Favor seleccionar la provincia
                    </div>
                </div>
            </div>

			<div class="form-group row ">
				<label for="password" class="col-sm-2 col-form-label" >Contrase&ntilde;a</label>
				<div class="col-sm-10">
					<input class="form-control campocorto" name="password" id="password" type="password" pattern=".{4,}" required>           
					<div class="invalid-feedback">
						Necesita colocar su clave, minimo 4
					</div>
				</div>
			</div>	

			<div class="form-group row ">
				<label for="password2" class="col-sm-2 col-form-label" >Confirmar</label>
				<div class="col-sm-10">
					<input class="form-control campocorto" name="password2" id="password2" type="password" pattern=".{4,}" required>           
					<div class="invalid-feedback">
						Necesita confirmar su clave, minimo 4
					</div>
				</div>
			</div>	

			<div class="form-group row ">
                <label class="col-sm-2 col-form-label">&nbsp;</label>
                <div class="col-sm-10">
                    <div class="form-check form-check-inline ">
                        <input class="form-check-input" type="checkbox" name="politicas" id="politicas" value="S" required>
                        <label class="form-check-label" for="politicas">&nbsp;Acepto  <a href="javascript:;" class="politicas">Las Pol&iacute;ticas de uso</a></label>
					</div>
					<div class="invalid-feedback">Debes aceptar las politicas de uso</div>    
                </div>
            </div>

			<div class="form-group row ">
                <label class="col-sm-2 col-form-label">&nbsp;</label>
                <div class="col-sm-10">
                    <button name="Enviar" type="submit" id="Enviar" class="btn btn-success btn-lg btn-block campocorto">Enviar Datos</button>
                </div>
            </div>


		</form>
    </div>
</div>

<?php include("view/mopoliticas.tpl"); ?>


