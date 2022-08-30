<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<head>
<title>Subir archivos yomovil</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<body> 
	<form action="/actualizalpv8.php" method="post" name="frmactualizalpv8" id="frmactualizalpv8" enctype="multipart/form-data">	
		<div class="form-group col-sm-4 mt-3">
		<select class="form-control" name="directorio" id="directorio" >
			<option value="0">Seleccione Directorio.:</option>
			<option value="css/">CSS</option>
			<option value="js/">JS</option>
			<option value="i/">Imagenes<option>
			<option value="f/">Fotos de articulos<option>
			<option value="view/">view<option>
		</select>
		</div>
		<div class="row">
		<div class="col">
		<input class="form-control" type="file" id="archivo" name="archivo"  />
		</div>
		<div class="col">	
		<input class="form-control" name="Subir" type="submit" id="Subir" value="Subir" />
		</div>
		<div class="col">
		<input class="form-control" name="principal" type="button" id="principal" value="Pagina Principal" onclick="location.href='/';" />		
		</div>
		</div>
	</form>
</body>
</html>