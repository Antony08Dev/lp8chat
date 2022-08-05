<div class="card-group chat-app">
    <div class="col-izq d-flex card people-list no-lista">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Buscar conversacion..." id="buscarklk">
        </div>
        <div id="bloque1" class="bloques">
            <ul class="list-unstyled chat-list mt-2 mb-3" id="chats">
                <?php include "include/cardklk.inc.php"; ?>
            </ul>
        </div>
    </div>
    <!-- fin de la lista  -->
    <script type="text/javascript">
        var mid = 1055
    </script>

    <!-- columna derecha -->
    <div class="chat col-der d-flex card no-chat1">
        <div class="chat-header clearfix">
            <div class="card-title cabecera">
                <a href="/" data-toggle="modal" data-target="#view_info">
                    <img src="http://192.168.1.109:8090/cache/180/6795115-1.jpg" alt="">

                </a>
                <div class="card-title">
                    <div class="m-b-0">RICARDO MARTINEZ
                        <a type="button" class="menu btn btn-light btn-sm float-right fixed-start" aria-hidden="true"
                            data-toggle="dropdown" aria-haspopup="false" aria-expanded="false"><i
                                class="fa fa-bars"></i>
                        </a><br>

                        <div class="dropdown-menu bordes">
                            <a class="dropdown-item" href="#">No leido</a>
                            <a class="dropdown-item" href="#">Archivar</a>
                            <a class="dropdown-item" href="#">Eliminar</a>
                            <a id="reportar" class="dropdown-item" href="#">Reportar</a>
                        </div>

                        <a id="asunto" href="/asunto_5870218.html">Gomas 205/50/16 nuevas y usadas</a>
                    </div>
                    <small>Visto: hace pocos minutos </small>
                </div>
            </div>
        </div>

        <div id="bloque2" class="bloques card-body chat-history">

            <ul class="m-b-0" id="conversacion">
                <?php include ("include/cardklkmsg.inc.php");?>
            </ul>
        </div>
        <div class="chat-message card-footer clearfix">
            <form name="frmklkmsgr" id="frmklkmsgr">
                <div class="input-group mb-0">

                    <input type="text" name="klkmsg" id="klkmsg" class="form-control bordes"
                        placeholder="Escriba su mensaje aqui...">



                    <button name="Enviar" type="submit" id="Enviar" data-usu="3" data-mensajeria="1055"
                        data-hora="9:35 AM" class="btn btn-success bordes" disabled><i class="fa fa-send"></i>
                    </button>


                </div>
            </form>
        </div>
    </div>


</div>
