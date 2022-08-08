<li class="clearfix bordes <?=($arrRegistro['ID'] == $midSelected) ? "active"  : "";?> <?=($arrRegistro['MENSAJELEIDO'] == 'N') ? "bold"  : "";?>" id="chat_<?=$arrRegistro['ID'];?>">

    <?=($arrRegistro['ESCRIBE'] != "") ? "<script>$(\"#{$arrRegistro['ESCRIBETITULO']}\").html('Escribiendo');</script>" : "";?>

    <div class="avatar iconos">
        <i class="fa fa-user fa-lg" aria-hidden="true"></i>
    </div>
    
    <div class="about" role="row">
        <div class="filaNombre" aria-colindex="2">
            <div class="nombre">

                <a href="<?=$arrRegistro['URL'];?>" class="conversacion" data-mid="<?=$arrRegistro['ID'];?>"  data-sufijo="<?=$arrRegistro['KLKSUFIJO'];?>" ><?=$arrRegistro['NOMBRECHAT'];?> </a> <?=$arrRegistro['ESCRIBETITULO'];?>
                
            </div>

            <div class="ultimomsg">

                <?=($arrRegistro['ESCRIBE'] != "") ? $arrRegistro['ESCRIBE'] : $arrRegistro['FECHAF'];?>
                <a href="javascript:;" class="eliminarchat" data-mid="<?=$arrRegistro['ID'];?>" data-sufijo="<?=$arrRegistro['KLKSUFIJO'];?>" data-asunto="<?=$arrRegistro['ASUNTO'];?>" data-nombre="<?=$arrRegistro['NOMBRECHAT'];?>" class="btn-sm"><i class="fa fa-times" aria-hidden="true"></i></a> 

            </div>
        </div>
        <div class="filaAsunto" aria-colindex="2">
            <div class="asunto">

                <?=$arrRegistro['ASUNTO'];?>

            </div>
            <div class="opciones">

                <span id="msgnuevo_<?=$arrRegistro['ID'];?>" class="msgnuevo badge badge-success"><?=($arrRegistro['MENSAJES'] > 0) ? $arrRegistro['MENSAJES'] : "";?></span>      
            </div>
        </div>
    </div>   
</li>
