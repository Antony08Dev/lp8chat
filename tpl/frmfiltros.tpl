<div class="card">
    <div class="card-header">
        <h3>Filtos publicaciones</h3>
    </div>
    <div class="card-body m-2">
        <form name="frmfiltros" id="frmfiltros" action="/filtros" method="POST" class="needs-validation" enctype="multipart/form-data" novalidate>
            <input type="hidden" name="Categoria" id="categoria" value="S" required/>	
                <div class="form-group row">
                    <label for="lblcategoria" class="col-sm-2 col-form-label">Categoria.:</label>
                    <div class="col-sm-10">
                        <select name="categoria" id="categoria" class="custom-select campocorto" required>
							<option value="" disabled selected>Seleccione</option>
							<option value="0">Telefonos</option>
							<option value="1">Vehiculos</option>
						</select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="Marcas" class="col-sm-2 col-form-label">Marcas.:</label>
                    <div class="col-sm-5">
                        <select multiple class="form-control" id="exampleFormControlSelect2">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div>
                    <label for="modelos" class="col-sm-0 col-form-label"></label>
                    <div class="col-sm-5">
                        <select multiple class="form-control" id="exampleFormControlSelect2">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div> 
                </div> 
                <div class="form-group row">
                    <label for="Agregar" class="col-sm-2 col-form-label">Agregar.:</label>
                    <div class="col-sm-5">
                        <input class="form-control" type="text" placeholder="Default input">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label"> </label>
                    <button type="submit" name="Enviar" id="Enviar" class="col-sm-2 btn-sm btn-success btn ml-2">Agregar Mas</button>
                </div>
                <hr>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label"> </label>
                    <button type="submit" name="Enviar" id="Enviar" class="col-sm-4 btn btn-success btn-lg mr-2">Actualizar</button>
                </div>
        </form>
    </div>
</div>