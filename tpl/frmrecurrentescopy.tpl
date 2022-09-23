<div class="panel panel-default ">
    <div class="panel-heading">
        <h3>Pagos Recurrentes</h3>
    </div>
    <div class="panel-body">
        <p>En este formulario podr&aacute;s aplicar para tener tu plan activo por el per&iacute;odo que elijas para realizar los pagos en uno de los dias establecidos para tal. Para mas informaci&oacute;n click aqu&iacute;.</p>
        <hr/>
        <form name="frmformularios" id="frmformularios" action="/recurrentes" method="POST" class="form-horizontal">
            <input type="hidden" name="frm" id="frm" value="rec" />
            <?=campospambot();?>
                <div class="form-group">
                    <label for="duracion" class="col-sm-2 control-label">Duracion.:</label>
                    <div class="col-sm-6">
                        <select name="duracion" id="duracion" class="form-control">
							<option value="0" selected>Seleccione</option>
							<option value="183" <?=($arrDatosRecurrentes['DURACION'] == 183) ? "Selected" : "";?>>6 Meses</option>
							<option value="365" <?=($arrDatosRecurrentes['DURACION'] == 365) ? "Selected" : "";?>>12 Meses</option>
							<option value="548" <?=($arrDatosRecurrentes['DURACION'] == 548) ? "Selected" : "";?>>18 Meses</option>
							<option value="-1" <?=($arrDatosRecurrentes['DURACION'] == -1) ? "Selected" : "";?>>Indefinido</option>
						</select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="dia" class="col-sm-2 control-label">Dia de Pago.:</label>
                    <div class="col-sm-6">
                        <select name="dia" id="dia" class="form-control">
							<option value="0" selected>Seleccione</option>
							<option value="1" <?=($arrDatosRecurrentes['DIA'] == 1) ? "Selected" : "";?>>1 ero. de cada mes</option>
							<option value="16" <?=($arrDatosRecurrentes['DIA'] == 16) ? "Selected" : "";?>>16 de cada mes</option>
						</select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="pagorecu" class="col-sm-2 control-label">Forma Pago.:</label>
                    <div class="col-sm-10">
                        <select name="pagorecu" id="pagorecu" class="form-control">
							<option value="0" selected="selected">Seleccione</option>
							<option value="TP" <?=($arrDatosRecurrentes['FORMAPAGO'] == 'TP') ? "Selected" : "";?>>Dep&oacute;sito a cuenta <?=$arrFormaPago['TP']?>, Cta. <?=$arrCuentasBancos['POPULAR']?></option>
							<option value="TR" <?=($arrDatosRecurrentes['FORMAPAGO'] == 'TR') ? "Selected" : "";?>>Dep&oacute;sito a cuenta <?=$arrFormaPago['TR']?>, Cta. <?=$arrCuentasBancos['RESERVAS']?></option>
							<option value="EF" <?=($arrDatosRecurrentes['FORMAPAGO'] == 'EF') ? "Selected" : "";?>>Efectivo o Cheque (requiere validaci&oacute;n en el banco)</option>  
							<option value="PP" <?=($arrDatosRecurrentes['FORMAPAGO'] == 'PP') ? "Selected" : "";?>>Pago en US$ via PayPal</option>
						</select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="ncf" class="col-sm-2 control-label">Comprobante.:</label>
                    <div class="col-sm-6">
                        <select name="ncf" id="ncf" class="form-control">
							<option value="N" selected>Sin Comprobante Fiscal (NCF)</option>
							<option value="S" <?=($arrDatosRecurrentes['NCF'] == 'S') ? "Selected" : "";?>>Con Comprobante Fiscal (NCF) - Sume el <?=$itbis;?>% de ITBIS</option>
						</select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="municipio" class="col-sm-2 control-label">Comentario.:</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" name="comentario" wrap="physical" id="comentario" placeholder="Comentario Adicional: Si es transferencia bancaria coloque los ultimos 4 digitos de su cuenta para confirmaciones.  Para el caso de paypal el email de la cuenta, y si es cheque notificar si requiere mensajero.  Coloque toda la informacion que pueda agilizar el proceso mes tras mes.  Gracias."><?=$arrDatosRecurrentes['COMENTARIO'];?></textarea>
                    </div>
                </div>

                <div class="col-sm-offset-2">
                    <h4 for="politicas">
                        <input type="checkbox" name="acepto" id="acepto" value="S" /> He leído y acepto <a href="#Politicas" data-toggle="modal" data-target="#Politicas" id="politicasuso">Las Pol&iacute;ticas </a>
                    </h4>
                </div>
                <div class="col-sm-offset-2">
                    <button type="submit" name="Enviar" id="Enviar" class="btn btn-success btn-lg">Solicita Pagos Recurrentes</button>
                </div>

        </form>
        <div class="modal fade" tabindex="-1" role="dialog" id="Politicas">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Politicas La Pulga Virtual</h4>
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
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>