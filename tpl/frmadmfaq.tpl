<form class="form-vertical" id="frmadminfaq" method="post" action="/admin.faq">
    <div class="col-md-7">
        <div class="form-group">
            <input type="hidden" name="id" id="id" value="">
            <label for="topico">Tópico:</label>
            <input type="text" placeholder="Coloque la pregunta" name="topico" id="topico" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="respuesta">Respuesta:</label>
            <textarea rows="8" max-height="170" id="respuesta" name="respuesta" class="form-control" required></textarea><br>
        </div>
    </div>
    <div class="col-md-5">
        <?php foreach(config::$arrCategoriasFaq as $k=>$v){ ?>
        <div class="col-md-12 mb-3">
            <div class="checkbox">
                <label for="<?=$k;?>"><input type="checkbox" id="<?=$k;?>" name="categorias[]" value="<?=$k;?>"> <?=$v;?></label>
            </div>
        </div>
        <?php } ?>
    </div>
    <div class="form-group col-md-12 mb-6">
        <input type="submit" class="btn btn-success mb-3" id="Enviar" name="Enviar" value="Agregar">
        <a href="/admin.faq" class="btn btn-info mb-3" id="ir-a" name="ir-a" style="display:none">ir a agregar</a>
        <a class="btn btn-info mb-3" href="javascript:;" onclick="getElementById('respuesta').select(); document.execCommand('Copy');">Copiar texto</a> |
        <a class="btn btn-info mb-3" href="javascript:;" onclick="getElementById('respuesta').value = ''; getElementById('respuesta').focus();">Limpiar campo</a>
    </div>
</form>