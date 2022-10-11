/*
 * 
 * @version 8.0
 * @since 1.5s
 * @author Ricardo Martinez
 * @date 01-04-2020
*/


var url = new URL(window.location.href);
var depura = false;
var error = false;
var totalFotos = 5;
/* objeto para los nombres en ajax */
function ajaxFname() {
	this.ppub = "/ajax.ppub.php";
	this.desc = "/ajax.desc.php";
	this.ctrans = "/ajax.ctransaccion.php";
	this.descglobal = "/ajax.descglobal.php";
	this.panclada = "/ajax.panclada.php";
	this.bbalance = "/ajax.bbalance.php";
	this.sarchivo = "/ajax.subearchivo.php";
	this.veriusu = "/ajax.verificausu.php";
	this.updvideo = "/ajax.updvideo.php";
	this.klkmessenger = "/ajax.klkmessenger.php";
	this.ccampo = "/ajax.ccampo.php";
	this.pines = 0;
};
/* funcion objeto pasado via elemento a ID */
function elmentoId() {
	this.valor = "";
	this.arrValor = "";
	this.id = "";
	this.uid = ""; /* uid del dueno de la publicacion    */
	this.articulo = ""; /* titulo de la publicacion    */
	this.fecha = ""; /* fecha renovar la publicacion  u otra fecha*/
	this.accion = ""; /* acction agregar o eliminar */		
}

/* instancia ojetos */ 
ajaxfn = new ajaxFname();
elIdfn = new elmentoId();


// valida los checkbox chequeados
function validaChequeados(campo) {
	j=0;
	$.each($('input[name="' + campo + '"]'),function(key,campo) {
		if (campo.checked) j++;
	});
    /* for */
    if (j==0) return false;
    else return j;
}

/*Le da el formato numerico y agrega la moneda*/
function formatNumber(n, moneda) {
	
	if(n!=0){
		return moneda  + n.toFixed(0).replace(/./g, function(c, i, a) {
        return i > 0 && c !== "." && (a.length - i) % 3 === 0 ? "," + c : c;
			});
	}
}
/*Obtiene un parametro de la url que se requiera*/
function getParam( name, url ) {
    if (!url) url = location.href;
    name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
    var regexS = "[\\?&]"+name+"=([^&#]*)";
    var regex = new RegExp( regexS );
    var results = regex.exec( url );
    return results == null ? null : results[1];
}

/*ACtualiza la url actual con los parametros pasados*/
function updateURLParameter(url, param, paramVal) {
    var TheAnchor = null;
    var newAdditionalURL = "";
    var tempArray = url.split("?");
    var baseURL = tempArray[0];
    var additionalURL = tempArray[1];
    var temp = "";
    if (additionalURL) {
        var tmpAnchor = additionalURL.split("#");
        var TheParams = tmpAnchor[0];
            TheAnchor = tmpAnchor[1];
        if(TheAnchor) additionalURL = TheParams;
        tempArray = additionalURL.split("&");
        for (var i=0; i<tempArray.length; i++) {
            if(tempArray[i].split('=')[0] != param) {
                newAdditionalURL += temp + tempArray[i];
                temp = "&";
            }
        }
    } else {
        var tmpAnchor = baseURL.split("#");
        var TheParams = tmpAnchor[0];
            TheAnchor  = tmpAnchor[1];
        if(TheParams)
            baseURL = TheParams;
    }
    if(TheAnchor) paramVal += "#" + TheAnchor;
    var rows_txt = temp + "" + param + "=" + paramVal;
    return baseURL + "?" + newAdditionalURL + rows_txt;
}


/*funcion que hace procesa la solicitud de agregar en favoritos*/
function ajaxFavoritos(id,accion) {
	$.ajax({
		url: ajaxfn.ppub,
		type: "GET",
		data:({id:id,accion:accion}),
		success: function(data) {
			console.log(data);
			if (depura) console.log(data);
			if (data == '-2') {
                /* parametros */
				alertify.alert("Error", "No se puede ejecutar esta accion, trate de nuevo");
				location.href='/';
			} else if (data == '1') {
				alertify.notify("Fue agregado a la LISTA DE FAVORITOS", 'success', 5);
			} else if (data == '2') {
				alertify.notify("Fue RETIRADA de la LISTA DE FAVORITOS", 'success', 5);
				$("#pub"+id).addClass("descrece");
			} else if (data == '-1') {
                /* no esta logueado */
                alertify.confirm('Iniciar session para favoritos', 'Deseas entrar para colocar esta publicacion?', function(){ location.href="/login/favoritos" }
                , function(){ alertify.error('No agregado')});
				//alertify.alert("Debes hacer login para colocar en favoritas");
			} else {
				alertify.alert("Error desconocido","Si el problema persiste favor reportar. Disculpe los incovenientes.");
			}
		}
	});
}

function ponerElCursorAlFinal(id) {
	var obj = $("#"+id),
	val = obj.val();
	obj.focus().val("").val(val);
	obj.scrollTop(obj[0].scrollHeight);
}
// actualiza los mensajes de  un chat activo
function actualizaKlkbloques() {
	// busca las conversaciones	
	$.ajax({
		url: ajaxfn.klkmessenger,
		type: "GET",
		data:({accion:'LKLK'}),
		success: function(data) {
			if (depura) console.log(data);
			if (data != -1) {
				$("#chats").html(data);
				$("#klk_noti").show("slow");
			} 
		}
	});			
	// lista los mensajes de la conversacion activa
	if (typeof(mid) != 'undefined') {
		// busca lista mensajes
		$.ajax({
			url: ajaxfn.klkmessenger,
			type: "GET",
			data:({id:mid,accion:'LKLKMSGS'}),
			success: function(data) {
				if (depura) console.log(data);
				if (data != -1) {
					$("#conversacion").html(data);
					$('#bloque2').animate({ scrollTop: 100000 }, 'normal');
				}
			}
		});	
		// busca estatus visto 
		// $.ajax({
		// 	url: ajaxfn.klkmessenger,
		// 	type: "GET",
		// 	data:({uid:uid,sufijo:sufijo,accion:'USUKLKVISTO'}),
		// 	success: function(data) {
		// 		if (depura) console.log(data);	
		// 		//var visto = $("#visto_" + sufijo + "_" + mid).html();			
		// 		//console.log(data);				
		// 		//console.log(escribiendo);
		// 		//if (escribiendo == "S") $("#visto_" + sufijo + "_" + mid).html(data + "algo");
		// 		if (data != -1) {

		// 		}
		// 	}
		// });	

	}
}
// funcion eliminar chat llamada desde la x o tab en los moviles
function eliminarChat(e) {
	e.preventDefault();
	var arrParams = new Array($(this).attr("data-mid"),$(this).attr("data-sufijo"));
	alertify.confirm('Eliminar Conversacion',$(this).attr("data-asunto") + ' con <b>' + $(this).attr("data-nombre") +'?</b>',function() {
		$.ajax({
			url: ajaxfn.klkmessenger,
			type: "GET",
			data:({id:arrParams[0],sufijo:arrParams[1],accion:'EKLK'}),
			success: function(data) {
				if (depura) console.log(data);
				actualizaKlkbloques();
			}
		});					
		
	}, function() {
		alertify.error("Accion cancelada..");
	});
}
// function que actualiza un chat com visto al entrar
function actualizaChatvisto(e) {
	e.preventDefault();
	var url = this.href;
	$.ajax({
		url: ajaxfn.klkmessenger,
		type: "POST",
		data:({id:$(this).attr("data-mid"),sufijo:$(this).attr("data-sufijo"),accion:'UKLKLEIDO'}),
		success: function(data) {
			//if (depura) 
			//window.location.href = url;
		}
	});	
}
// function que verifica si el otro usuario esta escribiendo
function escribeChat(_this,estatus,e) {
	e.preventDefault();
	$.ajax({
		url: ajaxfn.klkmessenger,
		type: "POST",
		data:({id:$(_this).attr("data-mid"),estatus:estatus,sufijo:$(_this).attr("data-sufijo"),accion:'KLKESCRIBE'}),
		success: function(data) {
			if (depura) console.log(data);
		}
	});	
}

// funciones manejo de fotos miniaturas edicion en mi pulga

//funcion para cambiar la posicion de las fotos desde mis publicaciones, tambien usada para eliminar y reordenar, actualiza str fotos via ajax
function cambiaPosicionfoto() {
	// determina si elimina foto o no
	var eliminafoto = $(this).hasClass("eliminafoto");
	// id del boton o de eliminafoto de la miniatura
	var id = $(this).attr("id");
	id = "#" + id;
	// nombre de la foto 
	var fotoname = $(this).attr("data-nombre");
	// articulo id 
	var aid = $(this).attr("data-aid");
	// string de las fotos
	//var strfotos = $(this).attr("data-fotos");
	var strfotos = $("#admfotostrfotos").val();
	//arreglo para manejo de posicion de la foto
	var arrFotos = strfotos.split(",");
	// saca la posicion del que sera principal
	var pos = arrFotos.indexOf(fotoname);
	// saca la primera foto
	var primeraFoto = arrFotos[pos];
	var cantFotos = 0;
	// reorganiza arreglo arrFotos sacando la foto a borrar
	arrFotos.splice( pos,1 ); 
	// si es eliminar foto
	if (eliminafoto) {
		alertify.confirm('Eliminacion de foto','Esta seguro de eliminar?',function() {
			fotos = "ART_FOTOS_"+arrFotos.join(',')+ "_"+ aid;
			$( id ).closest("div.miniaturas").hide( "slow" );
			cantFotos = arrFotos.length;
			if (ajaxccampo( fotos )) {
				document.getElementById('lblfotossubidas').innerHTML = cantFotos;
				if ($("#admfotorestafotos").val() == 0) $("#extrafotos, #enviaradmfotos").hide();
				else $("#extrafotos, #enviaradmfotos").show();
				// actualiza la imagen en mi pulga
				if (cantFotos == 0) foto = "fotodefectotn.png";
				else foto = arrFotos[0];
				$("#img" + aid).attr("src","/f/" + foto);
				$("#lblpublicadas" + aid).text(cantFotos);
				// actualiza labels y valores del formulario admfotos
				objEnlace = $("#admfotos_" + aid);
				$(objEnlace).attr("data-fotos",arrFotos.join(','));
				updLbladmfotos(objEnlace);
			}
		}, function() {
			alertify.error('Accion cancelada');
		});		
	} else {
		// reorganiza arreglo
		arrFotos.unshift( primeraFoto );
		fotos = "ART_FOTOS_"+arrFotos.join(',')+ "_"+ aid;
		// oculta la foto seleccionada
		var pic = $( id ).closest("li.unapulgar").clone().hide();
		var contain_fotos = $( id ).closest("ul.fotos");
		// actualiza el campo
		if(ajaxccampo(fotos)) {
			$( id ).closest("li.unapulgar").hide( "slow" );
			contain_fotos.find(".unapulgar").first().before( pic );
			contain_fotos.find(".unapulgar").first().show("slow");
			// cambia la imagen en listado mi pulga
			$("#img" + aid).attr("src","/f/" + primeraFoto);
			$(".cambiafoto i").removeClass("fa fa-home fa-lg").attr("title","Convertir en Principal");	
			$(".cambiafoto i").addClass("fas fa-reply fa-lg");	
			$(id + " i").removeClass("fas fa-reply fa-lg").attr("title","Foto Principal");	
			$(id + " i").addClass("fa fa-home fa-lg");			

		} else {
			// algun error
			alertify.alert("Error en cambio","Algo inesperado sucedio, trate nuevamente");
			return false;	
		} 	
	}
	
}
/* funcion procesa ciertos cambios */
function ajaxccampo(valor) {
	$.ajax({
		url: ajaxfn.ccampo,
        type: "POST",
        data:({valor:valor}),
        success: function(data) {
			if (data == 1) {
				alertify.success('Cambio Realizado');
            } else {
				alertify.error(data);
				error = true;
            }
        }
	});
	if (error) return false;
    else return true;
	
}
// actualiza los labels del modal
function updLbladmfotos(obj) {
	$("#tituloadmfotos").text("Administrar fotos de: " + $(obj).attr("data-titulo"));
	$("#progresofoto").hide();
	$("#progresofoto").attr("style","width: 0%");
	// valores usados en el formulario moadmfotos para posteo y actualizacion
	// campos del formulario modal admfotos total, cantidad, resta, strfotos rota foto
	$("#admfotoarticulo_id").val($(obj).attr("data-aid"));
	$("#admfotostrfotos").val($(obj).attr("data-fotos"));	
	$("#admrotafoto").val($(obj).attr("data-rotafoto"));
	// prende o apaga el check
	$("#admrotafoto").attr("checked", ($(obj).attr("data-rotafoto") == "S"));

	// string con las fotos subidas y arreglo de fotos para crear miniaturas
	var aid = $(obj).attr("data-aid");
	var fotos = $(obj).attr("data-fotos");
	if (fotos != "") var arrFotos = fotos.split(",");
	else var arrFotos = [];
	// cantidad subidas
	var cantFotos =  arrFotos.length;
	// fotos que restan por subir usada para apagar contenedores
	var restaFotos = totalFotos - cantFotos; 
	// actualiza labals en modal con las cantidades
	$("#lbltotalfotos").text(totalFotos);
	$("#lblfotossubidas").text(cantFotos);
	$("#lblrestafotos").text(restaFotos);
	// actualiza atributo data-cantidad en campo fotos determinar maximas agregar
	$("#fotos").attr("data-cantidad",restaFotos);
	// apaga o prende contenedor extra fotos y el boton
	if (restaFotos == 0) $("#extrafotos, #enviaradmfotos").hide();
	else $("#extrafotos, #enviaradmfotos").show();	

	// elemento en modal admfotos
	document.getElementById('admfotos').innerHTML = '';
	$.each(arrFotos, function(k,v) {
		//var texto = (k==0) ? "Principal" : "Hacer Principal"; 
		var texto = (k==0) ? '<i class="fa fa-home fa-lg" title="Foto Principal"></i> ' : '<i class="fas fa-reply fa-lg" title="Convertir en Principal"></i>'; 
		var color = (k==0) ? "" : ""; 			
		var eliminafoto = "eliminafoto" + aid + "_" + (k+1);
		var fotoid = "foto" + aid + "_" + (k+1);
		var urlfoto = "/f/" + v;
		// llama miniatura de filer
		document.getElementById('admfotos').innerHTML += miniaturaAdminfotos(urlfoto,v,aid,eliminafoto,fotoid,texto);
	});				
}
// fin funciones manejo fotos

// inicio documento
$(document).ready(function() {

	/* publicaciones en listados */
	/* debe hacer login para favoritos */
	$("a.nofav").click(function(e) {
		var href = this.href;
		e.preventDefault();
		alertify.confirm('Para colocar en favoritas','Debes iniciar session, deseas ahora?',function() {
			if (href == "javascript:;") href="/login";
			location.href=href;
		}, function() {
			alertify.error('Accion cancelada');
		});

	});	
	/* poner en favoritas */
    $("a.fav").click(function(e) {
		e.preventDefault();
		var valor = this.id;
        var arrValor = valor.split('_');
		var id = arrValor[0];
		var accion = arrValor[1]; /*acction agregar o eliminar*/
		if (accion == "FI") {

			alertify.confirm('Eliminar de favoritas','Deseas quitar de la lista?',function() {
				ajaxFavoritos(id,accion);
			}, function() {
				
			});		

		} else ajaxFavoritos(id,accion);
	});  

	// menejo contenido de botones para movil
	var cont2 = $("#boton2 .side-bar-item").contents();
	$("#boton2").html(cont2);
	$("#boton1 a, #boton2 a").addClass("dropdown-item");


	/* compartir via whatsapp*/
	$("a.wsshare").click(function(e) {
		e.preventDefault();
		var dataws = $(this).attr("data-ws");
		var id = this.id;
		var wsShare = "Hola, mira esta publicacion en La Pulga Virtual (" + dataws + ") https://www.lapulga.com.do/publicacion_" + id + ".html";
		var href = "whatsapp://send?text=" + wsShare;
		location.href = href;
	});		
	/* recomendaciones */
	$(".morecomendaciones").click(function(e) {
		e.preventDefault();
		if($("#mrecomendaciones").length){
			$("#mrecomendaciones").modal("show");
		}
	});	
	$("a.conmsg").mouseover(function() {
		//$(this).attr("title","Click para contactar via WhatsApp");
	});
	/* compartir qr */
	$(".moqrcodigo").click(function(e) {
		e.preventDefault();
		if($("#mqrcodigo").length){
			$("#mqrcodigo").modal("show");
		}
	});	
	/* mensaje enviado por whatsapp click enlace en datalle */
	$(".momsgarticulo").click(function(e) {
		e.preventDefault();
		var valor = this.id;
		console.log(valor);
        var arrValor = valor.split('_');
		var id = arrValor[0];
		console.log($("#logueado").val());
		alert('entonces');
		if($("#mmsgarticulo").length) {
			$("#articulo_id").val(arrValor[0]);
			$("#telefonows").val(arrValor[1]);
			$("#mensaje").val(arrValor[2]);
			$("#mmsgarticulo").modal("show");
			// si el usuario esta logueado sigue
			if ($("#logueado").val() == "S") $("#frmmsgarticulo").submit();
		}
	});	
	// ver video en detalle
	$(".verVideo").click(function(e) {
		e.preventDefault();
		var arrId = e.currentTarget.id.split('|');
		var urlVideo = "https://www.youtube.com/embed/"+arrId[0]+"?autoplay=1";
		if($("#movideo").length > 0 ) {
			$("#movideo #ytplayer").attr("src",urlVideo);
			$("#movideo .modal-title").text(arrId[1]);
			$("#movideo").modal("show");
			if (arrId[2]) {
				$.ajax({
					url: ajaxfn.updvideo,
					type: "GET",
					data:({id:arrId[2]}),
					success: function(data) {
					}
				});				
			}
		}
	});
	// mi pulga manejo de fotos, click en boton y eliminar fotos en admfotos
	$(document).on('click', '.cambiafoto, .eliminafoto', cambiaPosicionfoto);
	/* OPCIONES DE KLK ***************************************/
	// actualiza que se leyo los nuevos
	$(document).on('click', 'li.bold a.conversacion', actualizaChatvisto);	
		// borra las conversaciones llamando call back eliminarChat
	$(document).on('click', '.eliminarchat', eliminarChat);	
	// entra a las conversaciones
	$(document).on('click', '.conversacion', function(e) {
		window.location.href = this.href;
	});	
	// verifica si esta escribiendo 
	$(document).on('focus', '#klkmsg', function(e) {
		escribeChat(this,'S',e);
		//$("#visto_8").html("Esta escribiendo..");
	});	
	$(document).on('blur', '#klkmsg', function(e) {
		escribeChat(this,'N',e);
		//$("#visto_8").html("Visto");
	});	

	// buscador en klk
	$("#buscarklk, #buscarmarcas").keyup(function() {
		_this = this;
		// Show only matching TR, hide rest of them
		$.each($("#chats li, #listamarcas option"), function() {                   
			if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1) $(this).hide();
			else $(this).show();
		});
	});	

	$("#listamarcas option").on("click",function() {
		console.log($(this).attr("data-id"));
	});

    /* formulario modal klkmessegner usado en los detalles  */
    
    $("#frmklkmessenger").submit(function(e) {
        e.preventDefault();
        if (this.klkmensaje.value == "") return false;
        $.ajax({
            type: "POST",
            url: "/klkmessenger", 
            data: $("#frmklkmessenger").serialize(),
            success: function(data) {
                alertify.alert("La Pulga Virtual","Mensaje enviado, ver conversaciones en <a href='/klk'>KLK Messenger</a>");
                document.getElementById("frmklkmessenger").reset();
                $("#bloqueklk").hide("slow");

            },
            error: function(e) {
                alertify.alert("La Pulga Virtual","Ocurrio un error inesperado, trate nuevamente, disculpas");
            }
        });
        return false;
    }); 
    // boton en detalle klk mesesenger para contacto
    $("#btnklkmsgr").click(function(e) {
        e.preventDefault();
        if ($(this).attr("data-logueado") == "N") {
			alertify.confirm('Inicio de Session','Deseas iniciar session para usar KLK Messenger?',function() {
				location.href="/login" + $("#btnklkmsgr").attr("data-url");
            }, function() {
				alertify.error("Accion cancelada..");
            });
        } else if ($(this).attr("data-logueado") == "SD") {
			alertify.alert("La Pulga Virtual","Eres el dueno de esta publicacion, Gracias.");
		} else {
            $("#bloqueklk").toggle("slow");
        }

    }); 

	// actualiza ambos bloques solo si el usuario esta logueado
	if (usulogueado) { 
		if ($("#bloque1, #bloque2 #conversacion").length) {
			setInterval(function() {
				actualizaKlkbloques();
			}, 5000);			
			$('#bloque2').animate({ scrollTop: 100000 }, 'normal');		
		} else {
			// busca nuevos mensajes para notificacion en paginas que no sean el chat
			setInterval(function() {
				$.ajax({
					url: ajaxfn.klkmessenger,
					type: "GET",
					data:({accion:'BKLKNM'}),
					success: function(data) {
						if (data > 0) {
							$("#klk_noti").show("slow");
							//alertify.notify("Alguien te ha enviado un mensaje via KLK", 'warning', 5);				
						}
					}
				});	
			}, 5000);			
		}
	}
	// envia mensajes en sistema klk
    $("#frmklkmsgr #Enviar").click(function(e) {
		e.preventDefault();
		if ($("#klkmsg").val() != "") {
			// solo actualiza el chat en pantalla klk si es en detalle no actualiza
			if ($("#conversacion").length) {
				$("#conversacion").append('<li class="clearfix"><div class="message-data text-right"><span class="message-data-time">' + $(this).attr("data-hora") + '</span></div><div class="message my-message float-right">' + $("#klkmsg").val() +  '</div></li>');
				$('#bloque2').animate({ scrollTop: 100000 }, 'normal');
			}
			// inserta el manesje
			$.ajax({
				url: ajaxfn.klkmessenger,
				type: "POST",
				data:({id:$(this).attr("data-mid"),uid:$(this).attr("data-usu"),sufijo:$(this).attr("data-sufijo"),mensaje:$("#klkmsg").val(),accion:'IM'}),
				success: function(data) {
					$("#klkmsg").val("");
					//$("#klkmsg").blur();

					$("#Enviar").attr("disabled",true);
				}
			});	

		}
	} );		
	// controla no se envie espacio y que haya texto para habilitar envio
	$('#klkmsg').on('keyup paste',function() {
		$("#Enviar").attr("disabled",(($('#klkmsg').val() == "") || (/^\s*$/.test($('#klkmsg').val()))));
	});
	/* FIN OPCIONES KLK MSG ****************************/

	// detiene el video despues de cerrarlo
	$('#movideo').on('hidden.bs.modal', function () {
		$("#movideo iframe").attr("src", "");
	});





	/* mi pulga */
	/* click info para las visitas */
	$(".infvisitas").click(function() {
		alertify.alert('Visitas actuales y acumuladas', 'Actuales son todas las visitas desde que se publica hasta que se renova. Acumuladas son todas las visitas despues de una renovacion.<br><br>Te recomendamos usar <a href="/ayuda">Renovaciones Automaticas</a> o <a href="/productos">ver diferentes productos que tenemos</a>, Equipo LP. ');

	});
	/* click info para publicacion renovada */
	$(".infprenovada").click(function() {
		alertify.alert('Publicacion Renovada', 'Es cuando se actualiza la fecha de la publicacion a la del momento de la renovacion y que hace salga mas arriba en la lista de su categoria.<br><br>Te recomendamos usar <a href="/ayuda">Renovaciones Automaticas</a> o <a href="/productos">ver Planes de Usuarios</a>, o <a href="/reportevisitas">visitas diarias</a>, Equipo LP. ');

	});
	/* agrupar valores en el id de mi pulga para usos varios y listados */
	$(".mpaopc a, .anclarpub, a.resaltarpub").not(".noprevent").click(function(e) {
		e.preventDefault();
		var valor = this.id;
		var arrValor = valor.split('_');
		elIdfn.valor = valor;
		elIdfn.id = arrValor[0];
		elIdfn.uid = arrValor[1]; /* uid del dueno de la publicacion    */
		elIdfn.articulo = arrValor[2]; /* titulo de la publicacion    */
		elIdfn.fecha = arrValor[3]; /* fecha renovar la publicacion    */
		elIdfn.limite = arrValor[4]; /* fecha limite para renovar LNA defect  */	
		elIdfn.accion = arrValor[5]; /* acction agregar o eliminar */	
		//$dataId = "{$arrRegistro['ID']}_{$arrRegistro['USUARIO_ID']}_{$arrRegistro['ARTICULO']}_{$arrRegistro['FECHARENOVAR']}_{$arrRegistro['LIMITE']}";		
	});
	/* no puede renovar Renovar publicacion */
	$("a.noaccion").click(function(e) {
		
		alertify.alert('Esta opcion no puede ser procesada');

	});

	/* puede  Renovar publicacion */
	$("a.mpars").click(function(e) {
		e.preventDefault();
		if (elIdfn.accion == 'RN') {
			alertify.confirm('Renovar Pub ID: ' + elIdfn.id,'Seguro renovar: '+elIdfn.articulo+'?',function() {
				$.ajax({
					url: ajaxfn.ppub,
					type: "GET",
					data:({id:elIdfn.id,uid:elIdfn.uid,accion:elIdfn.accion}),
					success: function(data) {
						if (data == 1) {
							alertify.success('Se ha renovado su publicacion');
							$("#titpub-" + elIdfn.id).text("(Renovada)");
						} else alertify.error('No pudo ser renovada, trate el ' + elIdfn.fecha);
					}
				});
			},function() { alertify.error('Cancelado')})
		} else return true;
	});	
	/* no puede renovar Renovar publicacion */
	$("a.mparn").click(function(e) {
		e.preventDefault();
		alertify.alert('Renovar: ' + elIdfn.articulo ,'<strong>No puede ser renovada ahora</strong><br><br>Puedes renovarla el <strong>' + elIdfn.fecha + '</strong> a cualquier hora u otro dia m&aacute;s  adelante.<br><br>Te recomendamos usar <a href="/productos?ai=RA">Renovaciones Automaticas</a> o <a href="/productos?ai=TIE">ver Planes de Usuarios</a>, Equipo LP. ');
	});		
	/* texto opcion pausar publicacion */
	$("a.pausarp").attr("title","Si este articulo esta agotado puede ser pausado hasta que haya nuevamente y activar.  Con esto evita tener que publicarlo nuevamente y mientras tanto no aparece en las listas.");
	/* texto opcion anclar publicacion */
	$("a.anclarpub").attr("title","Sera colocado en la lista de su categoria de primero y estara ahi mientras reciba los clicks pagados.");
	/* pausar publicacion */
	$("a.pausarp").click(function(e) {
		e.preventDefault();
		if (elIdfn.accion == 'PP') {
			alertify.confirm('Pausar Pub ID: ' + elIdfn.id,'Seguro Pausar: '+elIdfn.articulo+'?',function() {
				$.ajax({
					url: ajaxfn.ppub,
					type: "GET",
					data:({id:elIdfn.id,uid:elIdfn.uid,accion:elIdfn.accion}),
					success: function(data) {
						if (data == 1) {
							alertify.success('Se ha pausado su publicacion');
							location.reload();
						} else alertify.error('No pudo ser pausada, trate nuevamente');
					}
				});
			},function() { alertify.error('Cancelado')})
		} else return true;
	});	
	/* activar publicacion */
	$("a.activarp").click(function(e) {
		e.preventDefault();
		if (elIdfn.accion == 'PA') {
			alertify.confirm('Activar Pub ID: ' + elIdfn.id,'Seguro Activar: '+elIdfn.articulo+'?',function() {
				$.ajax({
					url: ajaxfn.ppub,
					type: "GET",
					data:({id:elIdfn.id,uid:elIdfn.uid,accion:elIdfn.accion}),
					success: function(data) {
						if (data == 1) {
							alertify.success('Se ha activado su publicacion');
							location.reload();
						} else alertify.error('No pudo ser activada, trate nuevamente');
					}
				});
			},function() { alertify.error('Cancelado')})
		} else return true;
	});	
	/* eliminar publicacion */
	$("a.eliminarpub").click(function(e) {
		e.preventDefault();
		var msgeliminar = $(this).attr("data-msgeliminar");
		if ((elIdfn.accion == 'RU') || (elIdfn.accion == 'RUV')) {
			if($("#mmotivoep").length){
				$("#titulomotivoep").text("Eliminar a .: " + elIdfn.articulo);
				$("#frmmotivoep #msgeliminar").text((msgeliminar == "S") ? "Publicacion Anclada, Resaltada o en VIP, verifique bien antes o se perderan los PINES utilizados." : "");
				$("#frmmotivoep #motivoeparticulo_id").val(elIdfn.id);
				$("#frmmotivoep").find('[type="radio"]').prop('checked', false);
				$("#frmmotivoep").find('[type="checkbox"]').prop('checked', false);
				// apaga o enciende eliminar video
				if (elIdfn.accion != 'RUV') $("#frmmotivoep #divelivideo").hide();
				else $("#frmmotivoep #divelivideo").show("slow");
				$("#mmotivoep").modal("show");
			}			

		}
	});	
	/* aplica descuento */
	$("a.adesc").click(function(e) {
		e.preventDefault();
		$("#titulodescuento").multiline("Publicacion: " + elIdfn.articulo + '\nPrecio actual: '+ elIdfn.accion);
		$("#descarticulo_id").val(elIdfn.id);		
		$("#precioactual").val(elIdfn.accion);		
		if($("#mdescuento").length){
			$("#mdescuento").modal("show");
		}			
	});		
	/* aplica descuento global*/
	$("a.descGlobal").click(function(e) {
		e.preventDefault();
		if($("#mdescglobal").length){
			$("#mdescglobal").modal("show");
		}			
	});		
	/* quitar descuento */
	$("a.quitarDesc").click(function(e) {
		e.preventDefault();
		var id = $(this).attr("data-desc");
		alertify.confirm('Retirar descuento Pub ID: ' + id,'Seguro quitar descuento? ',function() {
			$.ajax({
				url: ajaxfn.desc,
				type: "POST",
				data:({descarticulo_id:id,accion:"R"}),
				success: function(data) {
					if (data == 1) {
						alertify.success('Se ha retirado descuento');
						location.reload();
					} else alertify.error('No pudo ser retirado, trate nuevamente');
				}
			});
		},function() { alertify.error('Cancelado')})
	});	
	/* retirar descuento global esta con q*/
	$("a.qdescGlobal").click(function(e) {
		e.preventDefault();
		alertify.confirm('Descuento global','Seguro de retirar? ',function() {
			$.ajax({
				url: ajaxfn.descglobal,
				type: "POST",
				data:({}),
				success: function(data) {
					if (data == 1) {
						alertify.success('Se ha retirado descuento global');
						location.reload();
					} else alertify.error('No pudo ser retirado, trate nuevamente');
				}
			});
		},function() { alertify.error('Cancelado')})
	});	
	/* cancelar transaccion */
	$("a.ctransaccion").click(function(e) {
		e.preventDefault();
		var id = $(this).attr("data-trans");
		alertify.prompt('Cancelar Transaccion ID: ' + id,'Seguro cancelar transaccion?, favor agregar motivo ','',function(e, valor) {
			if (valor) {
				$.ajax({
					url: ajaxfn.ctrans,
					type: "POST",
					data:({transaccion_id:id,comentario:valor}),
					success: function(data) {
						if (data == 1) {
							alert('Se ha cancelado transaccion');
							location.reload();
						} else alertify.error('No pudo ser cancelada, trate nuevamente');
					}
				});

			} else { alertify.error('Motivo no completado, trate nuevamente'); }
		},function() { alertify.error('Cancelado')})
	});		


	/* boton close de los cintillos  */
	$(".close").click(function(e) {
		
		$.get('/ajax.msgsession.php', { id: this.id });

	});	
	/* anclar publicacion en mi pulga */
	$("a.anclarpub").click(function(e) {
		e.preventDefault();
		$("#tituloanclar").text("Anclar: " + elIdfn.articulo);
		$("#anclararticulo_id").val(elIdfn.id);
		if($("#manclarpub").length) {
			$.ajax({
				url: ajaxfn.bbalance,
				type: "GET",
				data:({uid:elIdfn.uid}),
				async: false,
				success: function(data) {
					data = parseInt(data,10);
					balancePines = data;
					$("#lblbalance").text(data);
					$("#lblbalance").addClass((data != 0) ? "text-success" : "text-danger");
					$("#Enviaranclarfrm").attr("disabled",(data <= 0));
				}
			});			
			$("#manclarpub").modal("show");
			$("#lblCategorias").text($("#lblCat-" + elIdfn.id).text());
		}		
	});
    //Hacer click en el span acciona el input
    $(document).on("click", "#agrega", function(){
		$("#agregafoto").click();
	});	
	// admfotos cerrar
	$("#madmfotos .close").click(function(e) {
		location.reload();
	});

	/* resaltar, administrar fotos y vip publicacion en mi pulga */
	$("a.admfotos").click(function(e) {
		e.preventDefault();		
		// cantidad de fotos total a subir (restafotos) usado en publicar y modal admfotos 		
		// blanquea fotos a subir al abrir modal
		$("#frmadmfotos #fotos").val("");	
		// actualiza los labels en modal
		updLbladmfotos(this);

		$("#madmfotos").modal("show");
	});
	/* resaltar y vip publicacion en mi pulga */
	$("a.resaltarpub").click(function(e) {
		e.preventDefault();
		$("#tituloresaltar").text("Resaltar: " + elIdfn.articulo);
		$("#resaltararticulo_id").val(elIdfn.id);
		// indica si tiene algun vip colocado V , VC
		var vip = $(this).attr("data-vip");
		var categoria = $(this).attr("data-categoria");
		var fotos = $(this).attr("data-fotos");
		$("#resaltararticulo_id").val(elIdfn.id);
		// deshabilita select vip por fala de fotos
		$("#lblselectvip").text((fotos == "NO") ? "(Necesita tener Foto)" : "");
		$("#vip").attr("disabled", (fotos == "NO")  ? true : false);
		// deshabilita por armas de fuego portada
		$("#lblselectvip").text((categoria == 5) ? "(VIP Solo en categoria)" : $("#lblselectvip").text());
		$("#vipp").attr("disabled", (categoria == 5)  ? true : false);
		// deshabilita si ya esta en algun vip las opciones de vip
		$("#vip > option").each(function() {
			$opcion = $(this);
			// valor del elemento 
			if (this.value == vip) $opcion.attr("disabled",true);
		});
		$("#resaltado, #vip").val("").change();
		// busca balance y abre modal
		if($("#manclarpub").length) {
			$.ajax({
				url: ajaxfn.bbalance,
				type: "GET",
				data:({uid:elIdfn.uid}),
				async: false,
				success: function(data) {
					data = parseInt(data,10);
					balancePines = data;
					$("#relblbalance").text(data);
					$("#relblbalance").addClass((data != 0) ? "text-success" : "text-danger");
					$("#Enviarresaltarfrm").attr("disabled",(data <= 0));
				}
			});			
			$("#mresaltar").modal("show");
		}		
	});	
	/* publicacion anclada para procesar click y aumentar cantidad hasta llegar a limite */
	$("a.panclada").click(function(e) {
		id = this.id;
		$.ajax({
			url: ajaxfn.panclada,
			type: "GET",
			data:({id:id})
		});
	});
	/* fin mi pulga */ 	
	/* politicas de uso en registro */
	$("a.politicas").click(function(e) {
		e.preventDefault();
		if($("#mpoliticas").length){
			$("#mpoliticas").modal("show");
		}		

	});	
	/* que es referidor */
	$("a.referidor").click(function(e) {
		e.preventDefault();
		if($("#mreferidor").length){
			$("#mreferidor").modal("show");
		}		

	});	
	
	// multiline
	$.fn.multiline = function(text){
		this.text(text);
		this.html(this.html().replace(/\n/g,'<br/>'));
		return this;
	}	
	// mensaje de cookie para el usuario
	//if($.cookie('cookieAceptado')==1) $("#cookieGuardMsg").remove();
	$("#aceptaCookie").on('click',function(e){
		e.preventDefault();
		$("#cookieGuardMsg").remove();
		var d = new Date();
		d.setTime(d.getTime() + (365*24*60*60*1000));
		var expires = "expires="+ d.toUTCString();
		document.cookie = "cookieLpaceptado=1;" + expires + ";path=/;domain=lapulga.com.do";
	});
	
	//console.log(screen.width);
	//console.log(window.innerWidth);
	$('.ir-arriba').click(function() {
		$('body, html').animate({scrollTop: '0px'}, 300);
	});
	/* rango precio para bienes raices */ 
	if($( "#rangoPrecio" ).length > 0) {
		var rangoPrecio = { min: 1 || 1, max : 5000000 || 5000000 };
		var pmin = getParam("pmin", url) ||  rangoPrecio.min;
		var pmax = getParam("pmax", url) ||  rangoPrecio.max;
		var marca = "";
		$( "#rangoPrecio" ).slider({
			range: true,
			min: rangoPrecio.min, /*variable definida en cssjs.inc.php*/
			max: rangoPrecio.max,
			values: [ pmin, pmax ],
			step: 1000,
			slide: function( event, ui ) {
					$( "#lblRPrecio" ).text( formatNumber(ui.values[0] ,"RD$" ) + " - " + formatNumber(ui.values[1] ,"RD$" ));
					//console.log(ui.values[0]);
			},
			change: function( event, ui){
				var newURL = updateURLParameter(window.location.href, 'pmin', ui.values[0]);
				newURL = updateURLParameter(newURL, 'pmax', ui.values[1]);
				window.location.href = newURL;
			}
		});
		$( "#lblRPrecio" ).text( formatNumber($( "#rangoPrecio" ).slider( "values", 0 ),"RD$" ) +
			" - " + formatNumber($( "#rangoPrecio" ).slider( "values", 1 ),"RD$" ));
	}	
	/*rango de anios para los vehiculos*/
	if($( "#rangoAnio" ).length > 0) {
		var danio = getParam("danio", url) || 1945;
		var hanio = getParam("hanio", url) || 2022;	
		$( "#rangoAnio" ).slider({
			range: true,
			min: 1945 || 1945, /*variable definida en cssjs.inc.php*/
			max: 2022 || 2022,
			values: [ danio, hanio ],
			step: 1,
			slide: function( event, ui ) {
				$( "#lblRAnio" ).text( "Entre.: " + ui.values[0] + " - " + ui.values[1]);
			},
			change: function( event, ui){
				var newURL = updateURLParameter(window.location.href, 'danio', ui.values[0]);
				newURL = updateURLParameter(newURL, 'hanio', ui.values[1]);
				window.location.href = newURL;
			}
		});

		$( "#lblRAnio" ).text("Entre.: " + $( "#rangoAnio" ).slider( "values", 0 ) + " - " + $( "#rangoAnio" ).slider( "values", 1 ));
	}
	/* filtros en categorias */ 
	$("#filtro select").change(function(e){
		var newURL = window.location.href;
		var sidparam = getParam("sid", newURL);
		var parametro = e.currentTarget.id
		var valor = ($('#filtro #'+parametro).find("option:selected").val()).split('=')
		if(valor.length > 1 ) valor = valor[1];
		if(parametro in {"provincia":1, "marca":1, "aro":1}) {
			if(getParam("pmin", newURL) != null && getParam("pmin", newURL) != null) {
				newURL = window.location.href.replace(/\?.*/gi, "")
				newURL += "?pmax="+pmax+"&pmin="+pmin;
				
			} else {
				newURL = window.location.href.replace(/\?.*/gi, "")
			}
		}
		//if(getParam("pmin", newURL) != null && sidparam != null) newURL += "&sid="+sidparam;
		//else if(sidparam != null) newURL += "?sid="+sidparam;
		newURL = updateURLParameter(newURL, parametro,valor);
		alertify.notify('Aplico un filtro a los resultados actuales', 'success', 3);
		$(this).prop('disabled', 'disabled');
		window.location.href = newURL;
		
	});
	/* fin filtros */


	$(window).scroll(function() {
		if( $(this).scrollTop() > 300 ) {
			$('.ir-arriba').slideDown(300);
		} else {
			$('.ir-arriba').slideUp(300);
		}
	});

	$(function () {
		$('[data-toggle="tooltip"]').tooltip()
	});
	$(function () {
		$('[data-toggle="popover"]').popover()
	});
});