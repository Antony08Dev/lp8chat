<div class="item">
    <div class="bg-white p-2">
        <div class="row mt-4 ml-4">
            <a class="btn btn-info" href="/admin-marcas?tipo=CE">Celulares</a>
            <a class="btn btn-info ml-2" href="/admin-marcas?tipo=VE">Vehiculos</a>
        </div>
        <div class="row">
            <div class="col-sm-4 m-3">
                <input class="m-3 rounded" type="text" id="buscarmarcas" placeholder="Buscar por marcas">
                <select class="form-control rounded" id="listamarcas" size="8">
                    <?php
        $lista = "";
        foreach($tplBloqueuno as $arrRegistro) { 
            echo "<option data-id='{$arrRegistro['ID']}'>{$arrRegistro['MARCA']}</option>";}?>
                </select>
                <input class="m-3 rounded" type="text" id="marca" value="" placeholder="marca">
            </div>
            <div class="col-sm-4 m-3">
                <input class="m-3 rounded" type="text" id="buscarmarcas" placeholder="Buscar por modelo">
                <select class="form-control rounded" id="listamodelos" size="8">
                    <?php
        $lista = "";
        foreach($tplBloqueuno as $arrRegistro) { 
            echo "<option data-id='{$arrRegistro['ID']}'>{$arrRegistro['MARCA']}</option>";
        }
    ?>
                </select>
                <input class="m-3 rounded" type="text" id="modelo" value="" placeholder="modelo">
            </div>
        </div>
        <input class="btn btn-lg btn-warning m-2" type="button" value="Editar">
        <input class="btn btn-lg btn-success m-2" type="button" value="Agregar Marca">
        <input class="btn btn-lg btn-success m-2" type="button" value="Agregar Modelo">
    </div>
</div>