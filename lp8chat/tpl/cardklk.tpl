<li class="clearfix bordes <?=($arrRegistro['ID'] == $midSelected) ? "active"  : "";?> <?=($arrRegistro['MENSAJELEIDO'] == 'N') ? "bold"  : "";?>" id="chat_<?=$arrRegistro['ID'];?>">
    <div class="avatar iconos">
        <i class="fa fa-user fa-lg" aria-hidden="true"></i>
    </div>
    <a href="<?=$arrRegistro['URL'];?>" class="conversacion" data-mid="<?=$arrRegistro['ID'];?>"  data-sufijo="<?=$arrRegistro['KLKSUFIJO'];?>" >
        <div class="about" role="row">
            <div class="chat-block" aria-colindex="2">
                <div class="name">
                    <span><?=$arrRegistro['NOMBRECHAT'];?></span>
                </div>
                <div class="ultimomsg">
                    <span id="borrarchat" class="btn-sm"><i class="fa fa-times" aria-hidden="true"></i>
                </div>
            </div>
            <div class="status-block" aria-colindex="2">
                <div class="status">
                    <span class="asunto"><?=$arrRegistro['ASUNTO'];?></span>
                </div>
                <div class="opciones">
                    <span id="msgnuevo_<?=$arrRegistro['ID'];?>" class="msgnuevo badge badge-success"><?=($arrRegistro['MENSAJES'] > 0) ? $arrRegistro['MENSAJES'] : "";?></span>      
                </div>
            </div>
        </div>   
    </a>
</li>
