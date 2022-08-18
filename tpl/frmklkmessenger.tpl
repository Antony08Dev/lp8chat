    <form method="post" name="frmklkmessenger" id="frmklkmessenger" class="needs-validation" novalidate>
        <input type="hidden" name="klkarticulo_id" id="klkarticulo_id" value="<?=$tplDetalle['ID'];?>">
        <input type="hidden" name="klkasunto" id="klkasunto" value="<?=$tplDetalle['ARTICULO'];?>">
        <input type="hidden" name="klknombredepara" id="klknombredepara" value="<?=$_SESSION['lp_nombre'] . "|" . $tplDetalle['USU']['NOMBRE'];?>">
        <input type="hidden" name="klkde" id="klkde" value="<?=$_SESSION['lp_uid'];?>">
        <input type="hidden" name="klkpara" id="klkpara" value="<?=$tplDetalle['USUARIO_ID'];?>">
        <input type="hidden" name="Enviar" id="Enviar">
        <div class="form-group">
            <div class="">
                <textarea class="form-control" name="klkmensaje" id="klkmensaje" required placeholder="Favor redactar mensaje via KLK Messenger"></textarea>           
                <div class="invalid-feedback">
                    Favor colocar su mensaje
                </div>
            </div>
        </div>	                        

        <div class="modal-footer">
        <button type="submit" class="btn btn-success btn-block">Enviar Mensaje</button>
        </div>
    </form>