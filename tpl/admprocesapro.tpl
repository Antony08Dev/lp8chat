<div class="item ">
    <div class="lpub bg-white">
        <div class="table table-responsive">
            <table class="table table-hover table-striped table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th class='col-md-2'>Usuario</th>
                    <th><a href="#tipo">Tipo</a></th>
                    <th>Cant.</th>
                    <th class='col-md-2'>Monto<br>
                        Desc%<br>Total
                    </th>
                    <th class='col-md-1'><a href="#formapago">Forma Pago</a></th>
                    <th class='col-md-3'>Fecha<br>Procesado</th>
                    <th class='col-md-3'>Acción</th>
                </tr>
                </thead>
                <tbody>
                <?=$tpllistado;?>
                <tr>
                    <td colspan="8">
                        <h4><b><a name="tipo">&nbsp;</a>Leyenda Tipos</b></h4>
                        <ul class="ulcol col3 leyenda" id="adperusu1">
                            <?php 
								// imprime la lyenda d elos tipos
								foreach($arrPlanUsuario as $k => $v) {
									if (substr($k,0,1) == "O") continue;
									echo "<li>{$k} = {$v}</li>";
								}
							?>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td colspan="8">
                        <h4><b><a name="formapago">&nbsp;</a>Leyenda Forma Pago</b></h4>
                        <ul class="ulcol col3 leyenda" id="adperusu2">
                            <?php 
								// imprime la lyenda d elos tipos
								foreach($arrFormaPago as $k => $v) {
									if (substr($k,0,1) == "O") continue;
									echo "<li>{$k} = {$v}</li>";
								}
							?>
                        </ul>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>