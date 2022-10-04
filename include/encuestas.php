
<div class="panel panel-default ">
    <p></p>
    <div class="panel-heading">
                    <h3>Manejo de Encuestas</h3>
    </div>
    <div class="panel-body">
                    <form action="/formularios.php?id=polls" name="frmadminpolls" id="frmadminpolls" method="POST"
                        class="form-horizontal">
                        <input type="hidden" name="frm" id="frm" value="polls" />
                        <div class="col-sm-12">
                            <div class="form-group">
                                <select name="pregunta" id="Preguntas" class="form-control">
                                    <option value="">Selecciona pregunta</option>
                                    <option value="1">1 - Estatus.: A, Horas.: 3, Fecha.: 16/10/2017 04:18 PM,
                                        Pregunta.: Que te parece el nuevo formulario para publicar?</option>
                                    <option value="2" selected>2 - Estatus.: A, Horas.: 1, Fecha.: 23/09/2022 12:13 PM,
                                        Pregunta.: Publicar ahora es m&aacute;s r&aacute;pido?</option>
                                    <option value="3">3 - Estatus.: A, Horas.: 0, Fecha.: 09/12/2016 12:00 AM,
                                        Pregunta.: Publicar ahora es m&aacute;s r&aacute;pido?</option>
                                    <option value="4">4 - Estatus.: A, Horas.: 3, Fecha.: 16/10/2017 05:24 PM,
                                        Pregunta.: Que tal las categor&iacute;as</option>
                                    <option value="5">5 - Estatus.: A, Horas.: 0, Fecha.: 09/12/2016 12:00 AM,
                                        Pregunta.: Sabes que son los PINES?</option>
                                    <option value="6">6 - Estatus.: A, Horas.: 0, Fecha.: 09/12/2016 12:00 AM,
                                        Pregunta.: Sabes como resaltar una publicaci&oacute;n?</option>
                                    <option value="7">7 - Estatus.: A, Horas.: 0, Fecha.: 09/12/2016 12:00 AM,
                                        Pregunta.: Sabes que es el area VIP?</option>
                                    <option value="8">8 - Estatus.: A, Horas.: 0, Fecha.: 09/12/2016 12:00 AM,
                                        Pregunta.: Sabes que son las RENOVACIONES AUTOMATICAS?</option>
                                    <option value="9">9 - Estatus.: A, Horas.: 10, Fecha.: 16/10/2017 05:26 PM,
                                        Pregunta.: Sabes que son los ENLACES PATROCINADOS?</option>
                                    <option value="10">10 - Estatus.: A, Horas.: 0, Fecha.: 26/12/2016 12:00 AM,
                                        Pregunta.: Te gustaria tener un ADMINISTRADOR DE PRECIOS para ofertas?</option>
                                    <option value="11">11 - Estatus.: I, Horas.: 10, Fecha.: 23/10/2017 05:54 PM,
                                        Pregunta.: Te gusta como se muestran las fotos en pagina principal?</option>
                                    <option value="12">12 - Estatus.: A, Horas.: 48, Fecha.: 25/02/2018 10:55 PM,
                                        Pregunta.: Confias en las publicaciones sin precios reales (ej. RD$1)?</option>
                                    <option value="13">13 - Estatus.: I, Horas.: 48, Fecha.: 13/06/2018 02:07 PM,
                                        Pregunta.: Que te parece el sistema KLK Messenger?</option>
                                    <option value="14">14 - Estatus.: I, Horas.: 48, Fecha.: 22/03/2019 09:36 AM,
                                        Pregunta.: Antes de comprar cualquier articulo lees las medidas de precaución?
                                    </option>
                                    <option value="15">15 - Estatus.: A, Horas.: 25, Fecha.: 30/04/2019 07:46 PM,
                                        Pregunta.: Estas de acuerdo se prohiba la importacion de gomas usadas?</option>
                                    <option value="16">16 - Estatus.: A, Horas.: 18, Fecha.: 05/06/2019 01:53 PM,
                                        Pregunta.: ¿Apoya usted que en las escuelas se enseñe política de género?
                                    </option>
                                    <option value="17">17 - Estatus.: A, Horas.: 1, Fecha.: 22/09/2022 10:22 AM,
                                        Pregunta.: Estamos preparados para las clases presenciales?</option>
                                    <option value="18">18 - Estatus.: A, Horas.: , Fecha.: 00/00/0000 12:00 AM,
                                        Pregunta.: Publicas bien?</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="nuevap" class="col-sm-3 control-label">Nueva Pregunta.:</label>
                                <div class="col-sm-9">
                                    <input name="nuevap" type="text" id="nuevap" class="form-control" />

                                </div><br><br>
                                <select name="respuestas" id="respuestas" class="form-control">
                                    <option value="">Selecciona Respuestas</option>
                                    <option value="1">
                                        <pre>Array
                                            (
                                                [1] => Muy Bueno
                                                [2] => Bueno
                                                [3] => Regular
                                                [4] => No me gusta
                                                )
                                            </pre>
                                        </option>
                                        <option value="2" selected>
                                            <pre>Array
                                                (
                                                    [1] => Si
                                                    [2] => No
                                                    )
                                                </pre>
                                            </option>
                                            <option value="3">
                                                <pre>Array
                                                    (
                                                        [1] => Fácil
                                                        [2] => Dificil
                                                        [3] => Igual al anterior
                                                        [4] => Nunca habia publicado
                                                        )
                                                    </pre>
                                                </option>
                                                <option value="4">
                                                    <pre>Array
                                                        (
                                                            [1] => Están bien
                                                            [2] => Faltan algunas
                                                            [3] => Hay muchas de más
                                                            )
                                                        </pre>
                                                    </option>
                                                    <option value="5">
                                                        <pre>Array
                                                            (
                                                                [1] => Si claro
                                                                HOLA
                                                                [2] => Quizas
                                                                [3] => No por ahora
                                                                [4] => Nunca
                                                                )
                                                            </pre>
                                    </option>
                                    <option value="6">
                                        <pre>Array
                                                                (
                                                                    [1] => Excelente
                                                                    [2] => Muy bien
                                                                    [3] => Bien
                                                                    [4] => Regular
                                                                    [5] => No me gusta
                                                                    [6] => La anterior mas
                                                                    )
                                                                </pre>
                                    </option>
                                    <option value="7">
                                        <pre>Array
                                                                    (
                                                                        [1] => Diaria
                                                                        [2] => Semanal
                                                                        [3] => Mensual
                                                                        [4] => Muy poco
                                                                        [5] => Primera vez
                                                                        )
                                                                    </pre>
                                    </option>
                                    <option value="8">
                                        <pre>Array
                                                                        (
                                                                            [1] => Busco para comprar
                                                                            [2] => Busco para re-vender
                                                                            [3] => Busco servicios
                                                                            [4] => Comparo precios
                                                                            [5] => Publico mis ventas
                                                                            [6] => Publico ventas a otros
                                                                            [7] => Solo mirar cosas
                                                                            )
                                                                        </pre>
                                    </option>
                                    <option value="9">
                                        <pre>Array
                                                                            (
                                                                                [1] => Mi cuenta de Facebook
                                                                                [2] => Mi correo electronico
                                                                                [3] => No me registro nunca
                                                                                )
                                                                            </pre>
                                    </option>
                                    <option value="10">
                                        <pre>Array
                                                                                (
                                                                                    [1] => Estan bien
                                                                                    [2] => Estan mal
                                                                                    [3] => Eso es legal
                                                                                    [4] => Eso es ilegal
                                                                                    [5] => No me importa
                                                                                    )
                                                                                </pre>
                                    </option>
                                    <option value="11">
                                        <pre>Array
                                                                                    (
                                                                                        [1] => Muy bien
                                                                                        [2] => Regular
                                                                                        [3] => No me gusta
                                                                                        [4] => No se lo que es
                                                                                        )
                                                                                    </pre>
                                    </option>
                                    <option value="12">
                                        <pre>Array
                                                                                        (
                                                                                            [1] => Si
                                                                                            [2] => No
                                                                                            [3] => Nunca la he visto
                                                                                            )
                                                                                        </pre>
                                    </option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select name="horas" id="horas" class="form-control">
                                    <option value="">Horas a mostrarse</option>
                                    <option value="1" selected>1 Horas</option>
                                    <option value="2">2 Horas</option>
                                    <option value="3">3 Horas</option>
                                    <option value="4">4 Horas</option>
                                    <option value="5">5 Horas</option>
                                    <option value="6">6 Horas</option>
                                    <option value="7">7 Horas</option>
                                    <option value="8">8 Horas</option>
                                    <option value="9">9 Horas</option>
                                    <option value="10">10 Horas</option>
                                    <option value="11">11 Horas</option>
                                    <option value="12">12 Horas</option>
                                    <option value="13">13 Horas</option>
                                    <option value="14">14 Horas</option>
                                    <option value="15">15 Horas</option>
                                    <option value="16">16 Horas</option>
                                    <option value="17">17 Horas</option>
                                    <option value="18">18 Horas</option>
                                    <option value="19">19 Horas</option>
                                    <option value="20">20 Horas</option>
                                    <option value="21">21 Horas</option>
                                    <option value="22">22 Horas</option>
                                    <option value="23">23 Horas</option>
                                    <option value="24">24 Horas</option>
                                    <option value="25">25 Horas</option>
                                    <option value="26">26 Horas</option>
                                    <option value="27">27 Horas</option>
                                    <option value="28">28 Horas</option>
                                    <option value="29">29 Horas</option>
                                    <option value="30">30 Horas</option>
                                    <option value="31">31 Horas</option>
                                    <option value="32">32 Horas</option>
                                    <option value="33">33 Horas</option>
                                    <option value="34">34 Horas</option>
                                    <option value="35">35 Horas</option>
                                    <option value="36">36 Horas</option>
                                    <option value="37">37 Horas</option>
                                    <option value="38">38 Horas</option>
                                    <option value="39">39 Horas</option>
                                    <option value="40">40 Horas</option>
                                    <option value="41">41 Horas</option>
                                    <option value="42">42 Horas</option>
                                    <option value="43">43 Horas</option>
                                    <option value="44">44 Horas</option>
                                    <option value="45">45 Horas</option>
                                    <option value="46">46 Horas</option>
                                    <option value="47">47 Horas</option>
                                    <option value="48">48 Horas</option>
                                    <option value="49">49 Horas</option>
                                    <option value="50">50 Horas</option>
                                    <option value="51">51 Horas</option>
                                    <option value="52">52 Horas</option>
                                    <option value="53">53 Horas</option>
                                    <option value="54">54 Horas</option>
                                    <option value="55">55 Horas</option>
                                    <option value="56">56 Horas</option>
                                    <option value="57">57 Horas</option>
                                    <option value="58">58 Horas</option>
                                    <option value="59">59 Horas</option>
                                    <option value="60">60 Horas</option>
                                    <option value="61">61 Horas</option>
                                    <option value="62">62 Horas</option>
                                    <option value="63">63 Horas</option>
                                    <option value="64">64 Horas</option>
                                    <option value="65">65 Horas</option>
                                    <option value="66">66 Horas</option>
                                    <option value="67">67 Horas</option>
                                    <option value="68">68 Horas</option>
                                    <option value="69">69 Horas</option>
                                    <option value="70">70 Horas</option>
                                    <option value="71">71 Horas</option>
                                    <option value="72">72 Horas</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <button type="submit" name="Inserta" class="btn btn-success">Inserta Pregunta</button>
                                <button type="submit" name="Resultados" class="btn btn-success">Ver Resultados</button>
                                <button type="submit" name="Publicar" class="btn btn-success">Correr Encuesta
                                    Seleccionada</button>
                                <button type="submit" name="Parar" class="btn btn-success">Parar Encuesta</button>
                            </div>
                        </div>
                    </form>
                    <div class="col-sm-12">
                    </div>
    </div>
</div>
