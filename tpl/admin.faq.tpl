<!-- te lo puse arriba para que recuerdes mover ese js al codigo de lp.js fuera de  document.ready al comienzo si deseas, para que el funcione el checkbox value de las dos tablas html , faq y marcas modelos --> 
<?php
if (isset($_POST['Enviar'])) {
	arsort($_POST['categorias']);
	$categorias = implode(",", $_POST['categorias']); 
	$did = "";
	$_POST["respuesta"] = $lista->db->real_escape_string($_POST["respuesta"]);
	if ($_POST["id"]=="") {///lo deje así, ya que es para uso interno
		$qryString = "INSERT INTO {$lista->prefijo_tabla}FAQ (CATEGORIA,TOPICO,ESTATUS,DESCRIPCION) VALUES ('{$categorias}','{$_POST["topico"]}','A','{$_POST["respuesta"]}')";
		$did = "AGREGÓ";
	} else {
	 $qryString = "UPDATE {$lista->prefijo_tabla}FAQ SET CATEGORIA='{$categorias}',TOPICO='{$_POST["topico"]}',DESCRIPCION='{$_POST["respuesta"]}' WHERE ID='{$_POST["id"]}'";
		$did = "EDITÓ";
	}
	$result = $lista->db->query($qryString);
	if (!$result){
		$lista->qryError($qryString,__FUNCTION__);
		die(jscripts("alert('Ocurrio un error nopudo ejecutar la operacion'); location.href='/admin.faq';"));
	} else {
		die(jscripts("alert('Operacion " . $did . " ejecutada con exito'); location.href='/admin.faq';"));
	}
}
?>
<style>
th{
text-align: center; /*todos los titulos th centrados*/
}
table td {
text-overflow:ellipsis;
overflow:hidden;
white-space:nowrap;
max-width: 200px;
}
.recoger-data:hover{
cursor:pointer;
color:#337ab7;
text-decoration: underline;
}
</style>
<div class="row">
	<!--cuando sea desktop este div debe tener la clase bflex-->
	<div class="<?=($esmovil == false) ? 'bflex' : ''; ?>">
		<!--de manera condicionada cuando sea desktop a este div se le pone el id colizq-->
		<div id="<?=($esmovil == false) ? 'colizq' : ''; ?>"  class="col-md-3 col-xs-12 item">
			<?php if (($lista->tipolistado == 'adusu') or ($lista->tipolistado == 'adcrm')) { ?>
			<div id="buscador-izq">
				<form action="<?=$_SERVER['REDIRECT_URL'];?>" method="get" name="frm" id="frm" class="form-horizontal">
					<div class="input-group col-md-12">
						
						<input type="text" name="q" id="q" class="campo-buscador-izq form-control" placeholder="Buscar " value="<?=$lista->q;?>" />
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<span class="fa fa-search"></span>
							</button>
						</span>
					</div>
				</form>
			</div>
			<?php } ?>		
			<?=$tplcolizq?>	
		</div>

		<div class="col-md-10 col-xs-12 item <?php echo ($esmovil) ? "mtop" : ""; ?>">
			<div class="lpub bgblanco">
				<div class="borden pull-left">
					<div class="artplista" >
						<div class="col-md-9" id="formulario">
							<form class="form-vertical" id="frmadminfaq" method="post" action="/admin.faq">
								<div class="col-md-7">
									<div class="form-group">
										<input type="hidden" name="id" id="id" value="">
										<label for="topico">Tópico:</label>
										<input type="text" placeholder="Coloque la pregunta" name="topico" id="topico" class="form-control" required>
									</div>
									<div class="form-group">
										<label for="respuesta">Respuesta:</label>
										<textarea rows="8" max-height="170" id="respuesta" name="respuesta" class="form-control" required></textarea><br>
										<a href="javascript:;" onclick="getElementById('respuesta').select(); document.execCommand('Copy');">Copiar texto</a> | <a href="javascript:;" onclick="getElementById('respuesta').value = ''; getElementById('respuesta').focus();">Limpiar campo</a>
									</div>
								</div>
								<div class="col-md-5">
									<?php foreach($arrCategoriasFaq as $k=>$v){ ?>
										<div class="col-md-12">
											<div class="checkbox">
												<label for="<?=$k;?>"><input type="checkbox" id="<?=$k;?>" name="categorias[]" value="<?=$k;?>"><?=$v;?></label>
											</div>
										</div>
									<?php } ?>
								</div>
								<div class="form-group col-md-12">
									<input type="submit" class="btn btn-success" id="Enviar" name="Enviar" value="Agregar">
									<a href="/admin.faq" class="btn btn-info" id="ir-a" name="ir-a" style="display:none">ir a agregar</a>
								</div>
							</form>
						</div>
						<!-- 	tabla de ayudas -->
						<div id="tabla-master" class="table table-responsive borderb">
							<table class="table table-hover table-striped table-bordered">
								<tr>
									<th colspan='8' ><h2>Ayudas</h2></th>
								</tr>
								<tr>
									<th>ID</th>
									<th class='col-md-6'>Topico</th>
									<th class='col-md-4'>Respuesta</th>
									<th>enlace</th>
									<th class='col-md-1'>status</th>
								</tr>
						<?php
						// inicio listados
							$qryString = "SELECT * FROM {$lista->prefijo_tabla}FAQ ORDER BY ESTATUS, ORDEN ASC";
							$result = $lista->db->query($qryString);
							while ($row =$result->fetch_assoc()) {
								$textCategorias = "";
								foreach(explode(",", $row["CATEGORIA"]) as $v) $textCategorias .= $arrCategoriasFaq[$v] . "<br>";
							?>			
								<tr id="tr<?=$row['ID'];?>" rel="<?=$row['ID'];?>">
									<td class="recoger-data"><?=$row['ID'];?></td>
									<td class="topico recoger-data"><?=$row['TOPICO'];?></td>
									<td class="respuesta recoger-data"><?=$row["DESCRIPCION"]?><input type="hidden" id="respuesta-<?=$row['ID'];?>" value='<?=$row["DESCRIPCION"];?>'>
									<span class="categorias hidden" id="cat-<?=$row['ID'];?>" rel="<?=$row["CATEGORIA"];?>"><?=$textCategorias?></span>
									
									</td>
									
									<td> 

									<input type="text"  onclick="this.select(); document.execCommand('Copy');" value="https://beta.lapulga.com.do/ayuda/<?=depuraurl($row['TOPICO']);?>_<?=$row['ID'];?>.html"/>
									</td>
									
									<td align='center'>
										<input type="checkbox" onchange="estatus('faq-<?=$row['ID'];?>');" value="FAQ_ESTATUS_" id="faq-<?=$row['ID'];?>" <?= ($row["ESTATUS"] == "A") ? "checked" : "" ; ?>>
									</td>
								</tr>
							<?php 
							} 
							?>
							</table>
						</div>
					</div>
				</div>
			</div>
</div>
</div>
</div>		
<script>

	$(".recoger-data").on("click", function() {
		var trPadre ="#" + $(this).closest("tr").attr("id");
		var id = $(this).closest("tr").attr("rel");
		var topico = $(trPadre).children('.topico').text(); 
		// var respuesta = $(trPadre).children('.respuesta').text(); 
		var respuesta = $("#respuesta-" + id).val(); 
		// removido al quitar columna categoria 25-08-21  var textCat = $(trPadre).children('.categorias').attr("rel");
		var textCat = $("#cat-" + id).text();
		var arrCat = textCat.split(",");
		console.log($("#respuesta-" + id).val());
		//subimos la pantalla
		$("html").animate({scrollTop:$("#frmadminfaq").offset().top-200},1000);
		//document.querySelectorAll("input[type='checkbox']").checked = false;
		$(".checkbox input[type='checkbox']").prop("checked", false);
		for (var i =0; i<arrCat.length; i++) {
			$("#" +arrCat[i]).prop("checked", true);
		}
		$("#ir-a").show();
		$("#Enviar").val("Editar");
		$("#topico").val(topico);
		$("#respuesta").val(respuesta);
		$("#id").val($(this).closest("tr").attr("rel"));
	});
	//validacion de los checkbox
	$("#frmadminfaq").submit(function() {
			var checkbox = $(".checkbox input:checked");
			if ( checkbox.length <= 0 ) {
				alert("Debes escoger almenos una categoría"); 
				$(".checkbox").parent().parent().css({
					boder: '1px solid crimson',
					"box-shadow": '0px 0px 10px crimson'
				});
				return false;
			} else if ( !confirm("Está todo correcto?") ) {
				return false;
			} else {
				$(".checkbox").parent().parent().css( {
					boder: 'none',
					"box-shadow": 'none'
				} );
			}

	});
		
</script>

			