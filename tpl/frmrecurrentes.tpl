<div class="card">
    <div class="card-header">
        <h3>Pagos Recurrentes</h3>
        <p>En este formulario podr&aacute;s aplicar para tener tu plan activo por el per&iacute;odo que elijas para realizar los pagos en uno de los dias establecidos para tal. Para mas informaci&oacute;n click aqu&iacute;.</p>
    </div>
    <div class="card-body m-2">
        <form name="frmrecurrentes" id="frmrecurrentes" action="/recurrentes" method="POST" class="needs-validation" enctype="multipart/form-data" novalidate>
            <input type="hidden" name="confirma" id="confirma" value="S" required/>	
                <div class="form-group row">
                    <label for="duracion" class="col-sm-2 col-form-label">Duracion.:</label>
                    <div class="col-sm-10">
                        <select name="duracion" id="duracion" class="custom-select campocorto" required>
							<option value="" disabled selected>Seleccione</option>
							<option value="183" <?=($arrDatosRecurrentes['DURACION'] == 183) ? "Selected" : "";?>>6 Meses</option>
							<option value="365" <?=($arrDatosRecurrentes['DURACION'] == 365) ? "Selected" : "";?>>12 Meses</option>
							<option value="548" <?=($arrDatosRecurrentes['DURACION'] == 548) ? "Selected" : "";?>>18 Meses</option>
							<option value="-1" <?=($arrDatosRecurrentes['DURACION'] == -1) ? "Selected" : "";?>>Indefinido</option>
						</select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="dia" class="col-sm-2 col-form-label">Dia de Pago.:</label>
                    <div class="col-sm-10">
                        <select name="dia" id="dia" class="custom-select campocorto" required>
							<option value="" disabled selected>Seleccione</option>
							<option value="1" <?=($arrDatosRecurrentes['DIA'] == 1) ? "Selected" : "";?>>1 ero. de cada mes</option>
							<option value="16" <?=($arrDatosRecurrentes['DIA'] == 16) ? "Selected" : "";?>>16 de cada mes</option>
						</select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="pagorecu" class="col-sm-2 col-form-label">Forma Pago.:</label>
                    <div class="col-sm-10">
                        <select name="pagorecu" id="pagorecu" class="custom-select campocorto" required>
							<option value="" disabled selected>Seleccione</option>
							<option value="TP" <?=($arrDatosRecurrentes['FORMAPAGO'] == 'TP') ? "Selected" : "";?>> <?=$arrFormaPago['TP']?>, Cta. <?=$arrCuentasBancos['POPULAR']?></option>
							<option value="TR" <?=($arrDatosRecurrentes['FORMAPAGO'] == 'TR') ? "Selected" : "";?>> <?=$arrFormaPago['TR']?>, Cta. <?=$arrCuentasBancos['RESERVAS']?></option>
                            <option value="TB" <?=($arrDatosRecurrentes['FORMAPAGO'] == 'TB') ? "Selected" : "";?>> <?=$arrFormaPago['TB']?>, Cta. <?=$arrCuentasBancos['BHD']?></option>  
							<option value="EF" <?=($arrDatosRecurrentes['FORMAPAGO'] == 'EF') ? "Selected" : "";?>>Efectivo o Cheque (requiere validaci&oacute;n en el banco)</option>
							<option value="PP" <?=($arrDatosRecurrentes['FORMAPAGO'] == 'PP') ? "Selected" : "";?>>Pago en US$ via PayPal</option>
						</select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="ncf" class="col-sm-2 col-form-label">Comprobante.:</label>
                    <div class="col-sm-10">
                        <select name="ncf" id="ncf" class="custom-select campocorto" required>
							<option value="N" selected>Sin Comprobante Fiscal (NCF)</option>
							<option value="S" <?=($arrDatosRecurrentes['NCF'] == 'S') ? "Selected" : "";?>>Con Comprobante Fiscal (NCF) - Sume el <?=$itbis;?>% de ITBIS</option>
						</select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="municipio" class="col-sm-2 col-form-label">Comentario.:</label>
                    <div class="col-sm-10">
                        <textarea class="form-control campocorto" rows="5" name="comentario" wrap="physical" id="comentario" placeholder="Comentario Adicional: Si es transferencia bancaria coloque los ultimos 4 digitos de su cuenta para confirmaciones.  Para el caso de paypal el email de la cuenta, y si es cheque notificar si requiere mensajero.  Coloque toda la informacion que pueda agilizar el proceso mes tras mes.  Gracias." required><?=$arrDatosRecurrentes['COMENTARIO'];?></textarea>
                    </div>
                </div>
                <div class="form-group row ">
                    <label class="col-sm-2 col-form-label"> </label>
                    <div class="col-sm-10">
                        <div class="form-check form-check-inline">
                            <input type="checkbox" class="form-check-input" name="acepto" id="acepto" value="S" required/> 
                            <label class="form-check-label" for="politicas">&nbsp;Acepto  <a href="#Politicas" data-toggle="modal" data-target="#Politicas" id="politicasuso" class="politicas">Las Pol&iacute;ticas</a></label>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label"> </label>
                    <button type="submit" name="Enviar" id="Enviar" class="col-sm-4 btn btn-success btn-lg mr-2">Solicita Pagos Recurrentes</button>
                </div>

        </form>
        <div class="modal fade" tabindex="-1" role="dialog" id="Politicas">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Politicas La Pulga Virtual</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <p>
                            Para los pagos recurrentes debes leer y aceptar los siguitenes terminos o pol&iacute;ticas. Estas pudieran ser modificadas en cualquier momento y en caso de afectarle le estaremos notificando. Favor ver a continuacion:
                        </p>
                        <p>
                            Despues del dia elegido para su pago si el mismo no es efectuado se establecera lo siguiente al pasar:
                            <ul>
                                <li>5 días - Se inhabilitará el acceso al sistema (login, su plan se mantiene activo) hasta que sea realizado dicho pago por el método seleccionado, con el pago de una penalidad RD$100.00.</li>

                                <li>8 días - Las publicaciones se mantendrán visibles pero pondrán acceder a los detalles de las mismas, penalidad RD$150.00.</li>

                                <li>10 dias - La tienda no aparecerá en los listados y serán retiradas el excedente de publicaciones que tiene el plan básico. Para restaurar las publicaciones se cobra una penalidad de RD$250.00.</li>

                                <li>15 dias en adelante - Se habilitará el acceso al sistema o login y su plan pasara a básico.</li>
                            </ul>
                        </p>
                        <p class="bg-warning">
                            <b>NOTA:</b> podrá nuevamente obtener el plan por la forma normal y aplicar a esta modalidad pasado los 5 días si es aplicable. Para ese caso nos reservaremos el derecho de adminitir dicho plan o no.
                        </p>
                        <i>Equipo LP</i>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>