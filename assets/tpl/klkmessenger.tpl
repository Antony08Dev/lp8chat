
    <link rel="stylesheet" href="/css/klkmsgr.css">
    
    <div class="card-group chat-app">
        <div id="bloqueklk" class="col-izq d-flex card people-list <?=(isset(Config::$arrParametrosmvc['param3'][0]) and (Config::$esMovil) and (Config::$arrParametrosmvc['param3'][0] == 'klk')) ? "novisible" : "";?>">
            <div class="input-group">

                <input type="text" class="form-control" placeholder="Buscar conversacion..." id="buscarklk">
            
            </div>
            <div id="bloque1" class="bloques">

                <ul class="list-unstyled chat-list mt-2 mb-3" id="chats">

                    <?php  
                        foreach($arrRegistros as $arrRegistro) { /* impresion de conversaciones */ 
                            include("view/cardklk.tpl"); 
                            // determina si hay conversacion esribiendo para pasar a js
                            echo $arrRegistro['ESCRIBE'];
                            echo $arrRegistro['KLKSUFIJO'];
                        } 
                    ?>
                    
                </ul>

            </div>
        </div>

        <div class="chat col-der d-flex card no-chat1">
            <img src='/i/klkmsgr.jpg' class="banner <?=(isset(Config::$arrParametrosmvc['param3'][0]) and (Config::$arrParametrosmvc['param3'][0] == 'klk')) ? "novisible" : "";?> <?=(Config::$esMovil) ? "novisible" : "";?>">
        <?php if (isset(Config::$arrParametrosmvc['param3'][0]) and (Config::$arrParametrosmvc['param3'][0] == 'klk')) { 
            /* imprime variable usada en ajax para actualziar mensajes */ 
            echo $arrTitulo['VARJSMID'];
            echo $arrTitulo['VARJSSUFIJO'];
            echo $arrTitulo['VARJSUID'];
        ?> 
       
            <div class="chat-header clearfix">
                <div class="card-title cabecera">
                    <a href="/" data-toggle="modal" data-target="#view_info">
                    <img src="<?=$arrTitulo['URLFOTO'];?>" />
                    </a>
                    <div class="card-title">
                        <h6 class="m-b-0"><?=$arrTitulo['NOMBRECHAT'];?> 

                            <a type="button" class="menu btn btn-light btn-sm float-right fixed-start" aria-hidden="true" data-toggle="dropdown" aria-haspopup="false" aria-expanded="false"><i class="fa fa-bars"></i>
                            </a><br>

                            <div class="dropdown-menu bordes">
                                                                <a class="dropdown-item" href="/klk">Ir a Conversaciones</a>
                                <a class="dropdown-item" href="javascript:;" data-mid="<?=$arrTitulo['ID'];?>">Eliminar Chat</a>
                            </div>

                            <a id="asunto" href="/asunto_<?=$arrTitulo['ARTICULO_ID'];?>.html"><?=$arrTitulo['ASUNTO'];?></a>
                        </h6>
                        <small id="visto_<?=$arrTitulo['KLKSUFIJO'];?>_<?=Config::$arrParametrosmvc['param3'][1];?>"><?=$arrTitulo['VISTO'];?></small>
                    </div>
                </div>
            </div>

            <div id="bloque2" class="bloques card-body chat-history">

                <ul class="m-b-0" id="conversacion">

                    <?php  foreach($arrMensajes as $arrMensaje) { /* impresion de mensajes */

                        include("view/cardklkmsg.tpl"); 

                    } ?>

                </ul>
            </div>
        
            <div class="chat-message card-footer clearfix">
                <form name="frmklkmsgr" id="frmklkmsgr" >
                    <div class="input-group mb-0">
                        <input type="text" name="klkmsg" id="klkmsg" class="form-control bordes" data-mid="<?=Config::$arrParametrosmvc['param3'][1];?>" data-sufijo="<?=$arrTitulo['KLKSUFIJO'];?>" placeholder="Escriba su mensaje aqui...">
                        <button name="Enviar" type="submit" id="Enviar" data-usu="<?=$_SESSION['lp_uid'];?>" data-mid="<?=Config::$arrParametrosmvc['param3'][1];?>" data-hora="<?=date("g:i A");?>" data-sufijo="<?=$arrTitulo['KLKSUFIJO'];?>" class="btn btn-success bordes" disabled><i class="fa fa-send"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <?php } ?>
</div>
