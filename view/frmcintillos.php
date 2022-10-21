<form action="admin.cintillo.php" method="post" name="frmadmincintillo" id="frmadmincintillo">
    <br /><br />
    <div>
        <input name="titulo" type="text" id="titulo" value="" placeholder="Titulo Mensaje.:" />
    </div>
    <div>
        <textarea name="mensaje" cols="55" rows="5" id="mensaje" placeholder="Mensaje a colocar.:"></textarea><label
            id="caracteres">300 Car&aacute;cteres M&aacute;ximo</label>
    </div>
    <div>
        <input name="enlace" type="text" id="enlace" value="" placeholder="Texto enlace.:" />
    </div>
    <div>
        <input name="url" type="text" id="url" value="" placeholder="Url enlace.:" />
    </div>
    <div>
        <select name="hasta" id="hasta">
            <option value="0">Seleccione dias hasta</option>
            <option value="-10">Retirar</option>
            <option value="1">1 Dia</option>
            <option value="2">2 Dias</option>
            <option value="3">3 Dias</option>
            <option value="4">4 Dias</option>
            <option value="5">5 Dias</option>
            <option value="6">6 Dias</option>
            <option value="7">7 Dias</option>
            <option value="8">8 Dias</option>
            <option value="9">9 Dias</option>
            <option value="10">10 Dias</option>
        </select>
    </div>
    <div>
        <select name="tipo" id="tipo">
            <option value="0">Seleccione tipo mensaje</option>
            <option value="I">Informacion</option>
            <option value="E">Error</option>
            <option value="W">Advertencia</option>
        </select>
    </div>
    <br /><br />
    <input name="Enviar" type="submit" id="Enviar" value="Enviar Mensaje" class="fbtn_n" />
    <input type="button" name="Cancelar" id="btnCancelar" class="fbtn_b" value="Cancelar" />
    <input type="button" name="Nuevo" id="btnCancelar" class="fbtn_b" value="Nueva Entrada"
        onclick="location.href='/admin.cintillo.php';" />
</form>