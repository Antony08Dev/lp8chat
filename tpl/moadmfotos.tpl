<link rel="stylesheet" href="<?=Config::$cdn;?>/css/filer.css" >
<div class="modal modal-fullscreen-xl" id="madmfotos" role="dialog" tabindex="-1" aria-labelledby="titulomodal" aria-hidden="true" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="tituloadmfotos">&nbsp;</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<span class="mt-2">Cantidad de im&aacute;genes subidas <span id="lblfotossubidas"></span> de <span id="lbltotalfotos"></span></span>
			<div class="modal-body">
				<form method="post" name="frmadmfotos" id="frmadmfotos" enctype="multipart/form-data">
					<input type="hidden" name="admfotoarticulo_id" id="admfotoarticulo_id" value="" >
					<input type="hidden" name="admfotostrfotos" id="admfotostrfotos" value="" >
					<input type="hidden" name="admfotosrestafoto" id="admfotosrestafoto" value="" >

					<input type="hidden" name="uid" id="uid" value="<?=isset($_SESSION['lp_uid']) ? $_SESSION['lp_uid'] : 0;?>" >
					<input type="hidden" name="Enviar" id="Enviar" >

					<div class="jFiler-items jFiler-row ">
            			<ul class="jFiler-items-list jFiler-items-grid fotos" id="admfotos"></ul>                            
        			</div>
		
					<div id="extrafotos" class="extrafotos">

						<?php include("view/campofotos.tpl"); ?>
							
						<br>
						<div class="progress">
  							<div id="progresofoto" class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</div>
					
					<div class="modal-footer">
					<ul class="leyenda">
						<li class="m-auto"><i class="fa fa-home fa-sm"></i>- Principal</li>
						<li class="m-auto"><i class="fas fa-reply fa-sm"></i>- Mover</li>
						<li class="m-auto"><i class="fas fa-trash fa-sm"></i>- Eliminar</li>
					</ul>
						<button name="Enviaradmfotos" id="enviaradmfotos" type="submit" class="btn btn-success extrafotos">Actualizar</button>
						<button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>						
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
