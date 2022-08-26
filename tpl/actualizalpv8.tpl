<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Subir archivos yomovil</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<body> 
	<form action="/actualizalpv8.php" method="post" name="frmactualizalpv8" id="frmactualizalpv8" enctype="multipart/form-data">	
		<select name="directorio" id="directorio" >
			<option value="0">Seleccione Directorio.:</option>
			<option value="css/">CSS</option>
			<option value="js/">JS</option>
			<option value="i/">Imagenes<option>
			<option value="f/">Fotos de articulos<option>
			<option value="view/">view<option>
		</select>
		<input type="file" id="archivo" name="archivo"  />	
		<input name="Subir" type="submit" id="Subir" value="Subir" />
		<input name="principal" type="button" id="principal" value="Pagina Principal" onclick="location.href='/';" />		
	</form>
</body>
</html>