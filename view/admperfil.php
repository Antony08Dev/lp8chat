<link rel="stylesheet" href="../css/adminlpv8.css">
<div class="item">
    <div class="p-2 float-left bg-white">
        <div class="borden pull-left">
            <h3 class="tbloque float-left pull-left">Usuario.: antonydadada08, ID.: 330112, Estatus.: <span
                    class="text-danger">Retirado</span>, Plan.: PB </h3>
            <!-- INICIO ORDENA POR -->
        </div>
        <ul class="ulcol col3 borderb" id="adperusu1">
            <li>
                <b>Nombre.: </b>jose </li>
            <li>
                <b>Email.: </b><a href="mailto:antonydadada08@gmail.com;">antonydadada08@gmail.com</a> | <a
                    href="/admin.perfilusuario?uid=330112&tipo=modificaUsuEmail">M</a>

            </li>
            <li>
                <b>Telefono(s).: </b>
                <a target="/admin.usuarios" href="/admin.usuarios?q=(805) 456-9464">(805) 456-9464</a>,
                <a target="/admin.usuarios" href="/admin.usuarios?q="></a>,
                <a target="/admin.usuarios" href="/admin.usuarios?q="></a>
            </li>
            <li>
                <b>Provincia.: </b>Santo Domingo </li>
            <li>
                <b>Dirección.: </b>Distrito Nacional </li>
            <li>
                <b>Usu Creada.: </b>27-09-2022 09:33 AM </li>
            <li>
                <b>Usu Login.: </b><a href="/admin.perfilusuario?tipo=entradasUsu&uid=330112"
                    title="Ver entradas de este usuario"><span class="text-danger">Nunca login</span></a>
            </li>
            <li>
                <b>Pines.: </b><a href="/admin.perfilusuario?tipo=historialPines&uid=330112"> (0) - 27-09-2022 09:33
                    AM</a>
            </li>
            <li>
                <b>Planes.: </b><a href="/admin.perfilusuario?tipo=historialPlanes&uid=330112">Historial</a>
            </li>
            <li>
                <b>Penalidades.: </b><a href="/admin.perfilusuario?tipo=historialPenalidades&uid=330112">Historial</a>
            </li>
            <li>
                <b>Comentarios.: </b><a href="/admin.perfilusuario?tipo=comentariosUsu&uid=330112">Historial</a>
            </li>
            <li>
                <b>Publicaciones.: </b><a
                    href="/admin.perfilusuario?tipo=historialPublicaciones&ob=Activas&fld=art&orde=asc&uid=330112">ver
                    0</a>
            </li>
            <li>
                <b>Favoritos.: </b>0 </li>
            <li>
                <b>Mensajes.: </b>0 <a href="/admin.klk?uid=330112">ver KLK</a>
            </li>
            <li>
                <b>Procedencia.: </b><a target="_blank"
                    href="http://www.ip-tracker.org/locator/ip-lookup.php?ip=192.168.1.134">192.168.1.134</a>
            </li>
        </ul>
        <b>Paga Plan.: </b>
        <label for="si">
            Si&nbsp;<input type="radio" name="paga" id="si" class="ppaga" value="USU_PAGA_S_330112">
        </label>

        <label for="no">
            No&nbsp;<input type="radio" name="paga" id="no" class="ppaga" value="USU_PAGA_N_330112" checked>
        </label>
        <!-- //comentar y penalizar usuario -->

        <a href="javascript:;" class="moadcomusu pull-right btn btn-info" style="margin-left:10px;"><i
                class="fa fa-comments"></i>Comentario a jose</a>
        <a href="javascript:;" class="float-right btn btn-warning"><i class="fa fa-eye-slash"></i>Penalizar a jose</a>
        <div class="table table-responsive borderb">
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <th colspan="4">
                        <h3>Comentarios (0)</h3>
                    </th>
                </tr>
                <tr>
                    <th class='col-md-5'>Comentario | <a href="javascript:;" class="moadcomusu"> Agregar</a></th>
                    <th>Fecha</th>
                    <th>Operador</th>
                    <th>Seguimiento</th>
                </tr>
                <tr>
                    <td colspan="3"><b>No registros encontrados<b></td>
                </tr>
            </table>
        </div>

        <a href="javascript:;" class="moadcomusu pull-right btn btn-info" style="margin-left:10px;"><i
                class="fa fa-comments"></i>Comentario a jose</a>
        <a href="javascript:;" class="moadpenalidades pull-right btn btn-warning"><i
                class="fa fa-eye-slash"></i>Penalizar a jose</a>
        <!-- //comentar y penalizar usuario -->
    </div>
    <div class="col-md-12 item pull-left">
    </div>
</div>
</div>
</div>
<div class="modal fade" tabindex="-1" role="dialog" id="madcomusu">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Agregar notas a este perfil</h3>

            </div>
            <div class="modal-body">
                <form method="post" name="frmadcomusu" id="frmadcomusu">
                    <input type="hidden" name="inicio" value="1664899255" /> <input type="hidden" value="330112"
                        name="uid" id="uid" />
                    <div class="form-group">
                        <label for="comentario" class="control-label">Comentario</label>
                        <textarea class="form-control" placeholder="Comentario o nota" name="comentario"
                            id="comentario"></textarea>
                        <label class="text-danger"> <span id="caracteress">200</span>&nbsp;<span>Car&aacute;cteres
                                M&aacute;ximo</span></label>
                    </div>
                    <div class="form-group">
                        <div class="radio">
                            <label for="baja">
                                <input type="radio" name="prioridad" id="baja" value="B" checked>Prioridad Baja&nbsp;
                            </label>
                            <label for="alta">
                                <input type="radio" name="prioridad" id="alta" value="A">Prioridad Alta&nbsp;
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="segdias">Seguimiento en dias.:</label><br>
                        <select id="segdias" class="form-control" name="seguimiento">
                            <option for="cero" value="0">
                                Ninguno.
                            </option>
                            <option value="1">
                                1 dias - Miercoles 05 de Octubre </option>
                            <option value="2">
                                2 dias - Jueves 06 de Octubre </option>
                            <option value="3">
                                3 dias - Viernes 07 de Octubre </option>
                            <option value="6">
                                6 dias - Lunes 10 de Octubre </option>
                            <option value="7">
                                7 dias - Martes 11 de Octubre </option>
                            <option value="8">
                                8 dias - Miercoles 12 de Octubre </option>
                            <option value="9">
                                9 dias - Jueves 13 de Octubre </option>
                            <option value="10">
                                10 dias - Viernes 14 de Octubre </option>
                            <option value="13">
                                13 dias - Lunes 17 de Octubre </option>
                            <option value="14">
                                14 dias - Martes 18 de Octubre </option>
                            <option value="15">
                                15 dias - Miercoles 19 de Octubre </option>
                            <option value="16">
                                16 dias - Jueves 20 de Octubre </option>
                            <option value="17">
                                17 dias - Viernes 21 de Octubre </option>
                            <option value="20">
                                20 dias - Lunes 24 de Octubre </option>
                            <option value="21">
                                21 dias - Martes 25 de Octubre </option>
                            <option value="22">
                                22 dias - Miercoles 26 de Octubre </option>
                            <option value="23">
                                23 dias - Jueves 27 de Octubre </option>
                            <option value="24">
                                24 dias - Viernes 28 de Octubre </option>
                            <option value="27">
                                27 dias - Lunes 31 de Octubre </option>
                            <option value="28">
                                28 dias - Martes 01 de Noviembre </option>
                            <option value="29">
                                29 dias - Miercoles 02 de Noviembre </option>
                            <option value="30">
                                30 dias - Jueves 03 de Noviembre </option>
                        </select>
                    </div>
                    <div class="form-group hide">
                        <label>Asignado a.:</label><br>
                        <select name="asignado" size="1" id="asignado" class="form-control">
                            <option value="293824" selected>YO MISMO</option>
                            <option value="1">Webmaster</option>
                        </select>
                    </div>

                    <button name="Enviar" type="submit" id="Enviar" class="btn btn-success btn-lg">Enviar</button>
                </form>
            </div>
            <div class="modal-footer">
                <h4>La Pulga Virtual, para vender o comprar 100% Dominicana</h4>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="madpenalidades">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Agregar Penalidad a <b>jose(2)</b></h3>

            </div>
            <div class="modal-body">
                <form method="post" name="frmadpenalidades" id="frmadpenalidades">
                    <input type="hidden" name="inicio" value="1664899255" /> <input type="hidden" value="330112"
                        name="uid" id="uid" />
                    <div class="form-group">
                        <label for="penalidad" class="control-label">Penalidad.:</label>
                        <select name="penalidad" size="1" id="penalidad" class="form-control">
                            <option value="">Seleccione</option>
                            <option value='R'>Colocar Repeticiones </option>
                            <option value='C'>Publicar Categorias Incorrectas </option>
                            <option value='PP'>Pendiente pago Plan o pines </option>
                            <option value='FE'>Colocar fotos con etiquetas </option>
                            <option value='LE'>Limite publicaciones excedido </option>
                            <option value='PAR'>Preaviso Colocar Repeticiones </option>
                            <option value='PAC'>Preaviso Publicar Categorias Incorrectas </option>
                            <option value='PAPP'>Preaviso Pendiente pago Plan o pines </option>
                            <option value='PAFE'>Preaviso Colocar fotos con etiquetas </option>
                            <option value='PAVP'>Preaviso Vencimiento producto </option>
                            <option value='PAPV'>Preaviso Producto Vencido </option>
                            <option value='PALE'>Preaviso Limite publicaciones excedido </option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Dias penalidad.:</label><br>
                        <div class="radio">
                            <label for="pen1">
                                <input type="radio" name="dias" id="pen1" value="1" checked>1 dia &nbsp;
                            </label>
                            <label for="pen2">
                                <input type="radio" name="dias" id="pen2" value="2">2 dias &nbsp;
                            </label>
                            <label for="pen3">
                                <input type="radio" name="dias" id="pen3" value="3">3 dias &nbsp;
                            </label>
                            <label for="pen4">
                                <input type="radio" name="dias" id="pen4" value="7">7 dias &nbsp;
                            </label>
                            <label for="pen5">
                                <input type="radio" name="dias" id="pen5" value="15">15 dias &nbsp;
                            </label>
                            <label for="pen6">
                                <input type="radio" name="dias" id="pen6" value="30">30 dias &nbsp;
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="comentario" class="control-label">Comentario</label>
                        <textarea class="form-control" placeholder="Comentario o nota" name="comentario"
                            id="comentario"></textarea>
                        <label class="text-danger"> <span id="caracteress">150</span>&nbsp;<span>Car&aacute;cteres
                                M&aacute;ximo</span></label>
                    </div>

                    <button name="Enviar" type="submit" id="Enviar" class="btn btn-success btn-lg">Enviar</button>
                </form>
            </div>
            <div class="modal-footer">
                <h4>La Pulga Virtual, para vender o comprar 100% Dominicana</h4>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="madcmbpalabra">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Cambia palabras no permitidas</h3>

            </div>
            <div class="modal-body">
                <form method="post" name="frmadcmbpalabra" id="frmadcmbpalabra">
                    <input type="hidden" name="inicio" value="1664899255" />
                    <div class="form-group">
                        <label for="buscar" class="control-label">Buscar.:</label>
                        <input name="buscar" type="text" id="buscar" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="reemplazar" class="control-label">Reemplazar.:</label>
                        <input name="reemplazar" type="text" id="reemplazar" class="form-control" />
                    </div>

                    <button name="Enviar" type="submit" id="Enviar" class="btn btn-success btn-lg">Enviar</button>
                </form>
            </div>
            <div class="modal-footer">
                <h4>La Pulga Virtual, para vender o comprar 100% Dominicana</h4>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>