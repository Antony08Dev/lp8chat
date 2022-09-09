
<div class="modal modal-fullscreen-xl" id="madmfotos" role="dialog" tabindex="-1" aria-labelledby="titulomodal" aria-hidden="true" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="tituloadmfotos">&nbsp;</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<span id="lbmmofotos" class="mt-2">Cantidad de imagenes: 5 de 5</span>
			<div class="modal-body">
				<form method="post" name="frmadmfotos" id="frmadmfotos" class="needs-validation" novalidate >
					<input type="hidden" name="resaltararticulo_id" id="resaltararticulo_id" value="" >
					<input type="hidden" name="uid" id="uid" value="<?=isset($_SESSION['lp_uid']) ? $_SESSION['lp_uid'] : 0;?>" >
					<input type="hidden" name="Enviar" id="Enviar" >
					<div id="fotos" class="fotos">
                    </div>
					<br>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>						
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
