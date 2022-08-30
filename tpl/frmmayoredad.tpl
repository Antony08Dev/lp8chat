
<div class="card ">
    <div class="card-body">

		<form action="/login" name="frmlogin" id="frmlogin" method="POST" class="needs-validation" novalidate>

			<input type="hidden" name="frm" id="frm" value="Login" />
			<input type="hidden" name="oauthid" id="oauthid" value="" />
			<input type="hidden" name="oauthtipo" id="oauthtipo" value="" />
            <input type="hidden" name="recaptcha_response" id="recaptcha_response">

            <?php if (Config::$esMovil) { ?>

           <div class="form-group row">
                <div class="col-sm-10">
                    <h4>Eres Mayor de Edad?</h4>
                    <p>si quieres acceder a esta categoria debes tener la mayoria de edad. ¿Eres mayor a 18 años?</p>
                </div>
			</div>				

			<div class="form-group row ">
                <label class="col-sm-2 col-form-label">&nbsp;</label>
                <div class="col-sm-10">
                    <div class="form-check form-check-inline ">
                        <input class="form-check-input" type="checkbox" name="chkrecuerdacuenta" id="chkrecuerdacuenta" value="S"/>
                        <label class="form-check-label" for="chkrecuerdacuenta" data-toggle="tooltip" data-placement="right" title="Coteja si solo tu usas este equipo">Confirma ser mayor a 18 años</label>
					</div>
                </div>
            </div>


			<div class="form-group row ">
                <div class="col-sm-10">
                    <button name="Enviar" type="submit" id="Enviar" class="btn btn-success btn-lg btn-block campocorto">Aceptar</button>
                </div>
            </div>          	           

            <?php }  else { // DESKTOP ?>

            <div class="form-group row">
                <div class="col-sm-8">
                    <h4>Categoria de seguridad personal</h4>
                    <p>si quieres acceder a esta categoria debes tener la mayoria de edad. ¿Eres mayor a 18 años?</p>
                </div>
			</div>				

			<div class="form-group row ">
                <label class="col-sm-2 col-form-label">&nbsp;</label>
                <div class="col-sm-10">
                    <div class="form-check form-check-inline ">
                        <input class="form-check-input" type="checkbox" name="chkrecuerdacuenta" id="chkrecuerdacuenta" value="S"/>
                        <label class="form-check-label" for="chkrecuerdacuenta" data-toggle="tooltip" data-placement="right" title="Coteja si solo tu usas este equipo">Confirma ser mayor a 18 años</label>
					</div>
                </div>
            </div>


			<div class="form-group row ">
                <div class="col-sm-5">
                    <button name="Enviar" type="submit" id="Enviar" class="btn btn-success btn-lg btn-block campocorto">Aceptar</button>
                </div>
                <div class="col-sm-5">
                    <button name="Enviar" type="secondary" id="Enviar" class="btn btn-success btn-lg btn-block campocorto">Volver</button>
                </div>
            </div>          		

            <?php } ?>

		</form>
    </div>
</div>
