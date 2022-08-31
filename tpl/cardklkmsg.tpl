<li class="clearfix">
    <div class="message-data <?=($arrMensaje['USUARIO_ID'] == $_SESSION['lp_uid']) ? "text-right" : "";?>">
        <span class="message-data-time"><?=$arrMensaje['FECHAF'];?></span>
    </div>
    <div class="message  <?=($arrMensaje['USUARIO_ID'] == $_SESSION['lp_uid']) ? "my-message float-right" : "other-message";?> "><?=$arrMensaje['MENSAJEF'];?></div>
</li>   