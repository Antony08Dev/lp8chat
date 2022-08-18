/*!
 * 
 * @version 2.0
 * @since 1.5s
 * @author Ricardo Martinez, Wilfred Paulino
 * @date 01-01-2018
*/
function ajaxFilename() {
	this.autocomplete = "/autocompleta.php";
	this.busquedaavanzada = "/ajax.busavan.php";
	this.listadoprovincias = "/ajax.lprovincias.php";
	this.generaOptionsSelect = "/ajax.pub.genOptions.php";
	this.formDatosAdicionales = "/ajax.pub.frmDatosAd.php";
	this.buscapclaves = "/ajax.buscapclaves.php";
	this.cambiapublicacion = "/ajax.cambiapubli.php";
	this.subidor = "/ajax.subidor.php";
	this.envmensajeadministra = "/ajax.admmsg.php";
	this.verificauem = "/ajax.verificaue.php";
	this.admresfot = "/ajax.admrstfotos.php";
	this.admelipub = "/ajax.admelipub.php";
	this.admpreavi = "/ajax.admpreavi.php";
	this.admpena = "/ajax.admpenalidad.php";
	this.admnotel = "/ajax.admnotel.php";
	this.admpubl = "/ajax.admpublicidad.php";
	this.admretusu = "/ajax.admretusu.php";
	this.estatusplanenlista = "/ajax.estatusplanenlista.php";
	this.post_frm_edicionrapida = "/ajax.post.frmedicionrapida.php";
	this.frm_edicionrapida = "/ajax.frmedicionrapida.php";
	this.getDataTransaccion = "/json.datatransaccion.php";
	this.getDescMeses = "/json.descmeses.php";
};
function Config() {
	this.retorno = false;
}

//agrega esta parte en el lp. js fuera de document.ready	
// cambia el estatus usando el checkbox
function estatus(valor) {
	id = valor.split("-");
	id = id[1];
	//el valor que va a tener el campo
	var estado = ($("#"+valor).prop("checked"))? "A": "I";
	//recogemos el id de el topico
	var donde = $("#"+valor).attr("value");
	//alamcenamos el id que contiene el formato para cambiar el campo
	var data = donde+estado+"_"+id;
	//llamamos a la funcion que cambia los campos
	if (!ajaxcambiacampo(data)) {
		if ($("#"+valor).prop("checked") == false) $("#"+valor).prop("checked", true);
		else $("#"+valor).prop("checked", false);
	}
}

/*
funcion trackevent
@desc						funcion que guarda los eventos clicks para google analytics
@param		categoria		area del evento
@param		accion			accion del evento
@param		etiqueta		etiqueta del evento
*/
function trackevent(categoria,accion,etiqueta){
	//alert("categoria: " + categoria + "\n accion: " + accion + "\n etiqueta: " + etiqueta + " valor " + SITIO);
	if (SITIO == 1) gtag('event', accion, {'event_category': categoria,'event_label': etiqueta, 'value': SITIO});
}
//-------------------------';;;;;l--------------------------------------------'
var lnkbprovincias = "Provincias";
var bprovincias = false;
var ajaxfn = new ajaxFilename();
var config = new Config();
/* Decodifica URI */
function urldecode(str) {
   return decodeURIComponent((str+'').replace(/\+/g, '%20'));
}
/*funcion que desencripta un valor enviado en base64encoded*/
function desencript(valor) {
	return window.atob(valor);
}
/*funcion que muestra menu favoritos para usuarios no logueados o con cookie lp_vmt*/
function lp_vmt() {
    $("#lnkfavoritos").addClass('icoo tt badge red');
    $("#lnkfavoritos").html('Ver listado de favoritos');
}
/* funcion que determina si un usuario esta logueao o no usando ajax */
function ajaxlogged(valor) {
	if (valor != 1) {
		usulogged = valor;
		return true;
	}
	$.ajax({url: "/ajax.logged.php", dataType:"text", success: function(data) {ajaxlogged(data);}});
}
/*funcion que hace procesa la solicitud de agregar en favoritos*/
function ajaxfavoritos(id,uid,accion) {
	$.ajax({
		url: "/ajax.pfavoritos.php",
		beforeSend:function(){
			$("#loadingajax").show();
		},
		type: "GET",
		data:({id:id,uid:uid,usrid:usrid,accion:accion}),
		success: function(data) {
			if (data == '-2') {
				alertify.eAlert('No se puede ejecutar esta accion, trate de nuevo');
				location.href='/';
			} else if (data == '1') {
				alertify.notify("<a href=\"/favoritas?fav="+id+"\" class=\"addfav\">Su publicacion fue agregado a la LISTA DE FAVORITOS.  Use el menu MI PULGA -> Publicaciones Favoritas o el para verlas, Equipo LP</a>", 'success', 10);
				return 1;
			} else if (data == '2') {
				$("#p" + id).hide('slow');
				return 2;
			} else if (data == '-1') {
			/*no esta logueado pero inserto registro*/
				if ($("#mologinfavoritos").length) $("#mologinfavoritos").show();
				else alertify.notify("<a href=\"/favoritas?fav="+id+"\" class=\"addfav\">La publicacion fue colocada en Favoritos, puedes verla luego en el menu Mi Pulga</a>",'success', 10);
					return 1;
			} else if (data == '0') {
				alertify.alert('Su publicacion YA estaba en la lista de Favoritos.  Puede consultarlo luego en el menu MI PULGA -> Publicaciones Favoritas o el boton rojo en el tope, Equipo LP');
				return 1;
			} else {
				alertify.eAlert("Error desconocido, si el problema persiste favor reportar. Disculpe los incovenientes que esto le pueda causar.");
			return 0;
			}
		}
	});
}/*funcion que hace procesa la solicitud de productos */
// function ajaxprocesa(id,uid,accion,callback) {
	// $.ajax({
		// url: "/ajax.pprocesa.php",
		// beforeSend:function(){
			// $("#loadingajax").show();
		// },
		// type: "POST",
		// data:({id:id,uid:uid,accion:accion}),
		// success: function(data) {
			// if (data == '-2') {
				// alertify.eAlert('No se puede ejecutar esta accion, trate de nuevo');
				// location.href='/admin.procesa';
			// } else if (data == '1') {
				// callback(data);
				// alertify.notify('Fue procesada la solicitud No. ' + id , 'success', 5);
			// }
		// }
	// });
	// return $valor;
// }
function retajaxprocesa(data) {
	alert(data);
	return data;
}
/*funcion que hace procesa retiro de publicaciones via mi pulga*/
function ajaxpublicaciones(id,uid,accion) {
	return $.ajax({
	 url: "/ajax.ppublicaciones.php",
	 type: "GET",
	 data:({id:id,uid:uid,accion:accion}),
	 success: function(data) {
		 //alert(data);
	 }
	 });
}

/* funcion que hace procesa activa odesativa enlaces p*/
function ajaxcambiacampo(valor, nopreguntar, prt, bye) {
	sleep(500);
	if ((!nopreguntar) ? confirm('Desea procesar esta accion?') : true ) {
		if(typeof(prt)!='undefined' && prt != "") prt =" | " + prt;
		else prt = "";
		$.ajax({
			url: "/ajax.cambiacampo.php",
			type: "POST",
			data:({valor:valor, prt:prt}),
			success: function(data) {
				if (data == '') {
					alertify.success('Operacion exitosa!');
					if(prt == "") $("#"+valor +", #p" + valor).addClass("descrece").hide("600");
					else $("#"+valor +", #p" + valor).closest("tr").next("tr").show().find("span").append("<br />"+prt);
					$(".apaga").hide();
					if(bye != undefined && bye != "" ) $("#"+bye).addClass("descrece");
				} else {
					alertify.error(data);
				}
			}
		});
		return true;
	} else {
		alertify.error('Cancelado');
		return false;
	}
}
/* funcion que hace procesa activa odesativa enlaces p*/
function ajaxenlacesp(id,uid,accion) {
	$.ajax({
		url: "/ajax.enlacesp.php",
		type: "GET",
		data:({id:id,uid:uid,accion:accion}),
		success: function(data) {
			if (data == '0') {
				alertify.warning('No se puede ejecutar esta accion, trate de nuevo');
				location.href='/misenlaces';
			} else if (data == '1') {
				location.href='/misenlaces';
			}
		}
	});
}
function mostrar(idPub) {
	if($("#inf"+idPub).length) {
		$("#inf"+idPub).removeClass('hide');
	}
}
function ponerElCursorAlFinal(id) {
	var obj = $("#"+id),
	val = obj.val();
	obj.focus().val("").val(val);
	obj.scrollTop(obj[0].scrollHeight);
}

/*Area Alertas
		@dependecia alertify.min.js
	*/
if(typeof(alertify)!='undefined') {
	alertify.defaults.transition = "zoom";
	alertify.defaults.theme.ok = "btn btn-primary";
	alertify.defaults.theme.cancel = "btn btn-danger";
	if(!alertify.wConfirm) {
	  alertify.dialog('wConfirm',function factory() {
		return{
				build:function(){
					var errorHeader = '<span class="fa fa-exclamation-triangle fa-2x" '
					+    'style="vertical-align:middle;color:#dee100;">'
					+ '</span>';
					this.setHeader(errorHeader);
				}
			};
		},true,'confirm');
	}
	if(!alertify.eAlert) {
	  alertify.dialog('eAlert',function factory() {
		return{
				build:function(){
					var errorHeader = '<span class="fa fa-times-circle fa-2x" '
					+    'style="vertical-align:middle;color:#e10000;">'
					+ '</span>';
					this.setHeader(errorHeader);
				}
			};
		},true,'alert');
	}
	if(!alertify.wAlert) {
	  alertify.dialog('wAlert',function factory() {
		return{
				build:function() {
					var errorHeader = '<span class="fa fa-exclamation-triangle fa-2x" '
					+    'style="vertical-align:middle;color:#dee100;">'
					+ '</span>';
					this.setHeader(errorHeader);
				}
			};
		},true,'alert');
	}
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
/*Verifica si algun la pantalla actual es de algun formulario y si tiene algo escrito para preguntar al usuario si desea salir*/
function confirmaSalida() {
	window.onbeforeunload =function() {
		var a = document.getElementsByTagName("form");
		var nvacios = true;
		for(campo in arrValidaCampos[a[0].id].validacionDatos.elementos){
			if($("#"+campo).val() != 0) nvacios = false; 
		}
		if(!nvacios) return false;
	}
}

function sleep(milliseconds) {
	var start = new Date().getTime();
	for (var i = 0; i < 1e7; i++) {
	  if ((new Date().getTime() - start) > milliseconds){
		break;
	  }
	}
  }


/*FUNCIONES UTILIZADAS EN ADMIN*/
function adminMpEditarPub(idpub){
	var a = $("#pub"+idpub+" form" ).serialize();
}

//funcion para cambiar la posicion de las fotos desde mis publicaciones
function cambiaposfoto(radio,eliminafoto) {
	(!eliminafoto) ? $(".cambiaft").val('Hacer Principal').removeClass("bgverde"): "";
	(!eliminafoto) ? $(radio).val("Principal").addClass("bgverde") : "";
	var fotos = "";
	var id =$( radio ).attr("name");
	var text = $("#arrFotos_" + id).val();
	var arrFotos = text.split(",");
	var fotoname = $( radio ).attr("rel");
	var pos = arrFotos.indexOf(fotoname);
	var firstPic = arrFotos[pos];
	arrFotos.splice( pos,1 );
	if (eliminafoto) {
		fotos = "ART_FOTOS_"+arrFotos.join(',')+ "_"+ id;
		if (ajaxcambiacampo( fotos, "resumenpublicacion" )) {
			$( radio ).closest("div.miniaturas").hide( "slow" );
			$("#arrFotos_" + id).val(arrFotos);
			return false;
		}
	} 
	arrFotos.unshift( firstPic );
	fotos = "ART_FOTOS_"+arrFotos.join(',')+ "_"+ id;
	var pic = $( radio ).closest("div.miniaturas").clone().hide();
	var contain_fotos = $( radio ).closest("div.fotos");
	if(!ajaxcambiacampo( fotos, "resumenpublicacion" )){
		contain_fotos.find( 'div.miniaturas' ).first().find("span").show("slow");
		$(".fotos input[type=radio]").prop("checked", false);
		return false;	
	} else {
		$( radio ).closest("div.miniaturas").hide( "slow" );
		//$( radio ).closest("div.miniaturas").remove();
		contain_fotos.find(".miniaturas").first().before( pic );
		contain_fotos.find(".miniaturas").first().show("slow");
		
	} 
	
}
//funcion para generar las fotos del modal de editar publicaciones
function generaPosFotos(aid,textFotos) {
		$("#pubmobody .fotos").remove();
		if (textFotos.length <= 0) return false ;
		var arrFotos = textFotos.split(",");
			
		var count=0;
		var fila= "";
		$.each(arrFotos, function(k,v){  	
			var texto = (count==0) ? "Principal" : "Hacer Principal"; 
			var color = (count==0) ? "bgverde" : ""; 	
			count++;
			fila += "<div class=\"miniaturas\">\
					<a href= \"javascript:;\" title=\"Elimina esta foto\" class=\"elimfoto\" rel='"+v+"' name=\""+aid+"\" onclick=\"cambiaposfoto('#elimfoto"+aid+"_"+count+"',true);\" id='elimfoto"+aid+"_"+count+"'><i class=\"fa fa-trash-o\"></i></a>\
					<a  href=\"/f/"+v+"\" class=\"fancybox\" >\
						<img src=\"/cache/120/"+v+"\" />\
					</a>\
					<input type=\"button\" rel='"+v+"' value='"+texto+"' class='"+color+" cambiaft btn btn-info' name=\""+aid+"\" onclick=\"cambiaposfoto('#foto"+aid+"_"+count+"');\" id='foto"+aid+"_"+count+"' /></div>";
		});
		
		$("#pubmobody").prepend("<div class='fotos'>"+fila+"</div>");

	}
	var provincias= [];
	var prov = "";
	otras_prov= "";
	function placeholderPrv (e) {
		if(!$(e).prop("checked")) {	
			var checkbox  = $("#frmprv").find("input[type='checkbox']:checked");
			provincias = [];
			for(var i =0; i<checkbox.length; i++) {
				provincias.push($("#"+checkbox[i].id + " ~ a").text());
			}
			otras_prov = provincias.join(", ");
			prov = otras_prov.split(",");
		} else {
			otras_prov ="";		
			var text = $(e + " ~ a").text();
			if(provincias.length>0) {
				var content = prov.join(",");
				provincias = content + " y " +text; 
				prov =  provincias.split("y");
			} else {
				provincias.push(text);
				prov = provincias;	
			}
		}  
		var text = (otras_prov!="") ? otras_prov :  provincias;
		$(".campoprv").attr("placeholder", "Busca en: " + text);
		
	}
	function volver(quitar, poner) {
		if (quitar.length){
			switch(typeof(quitar)){
				case "string":
					$("#"+quitar+", ."+quitar).removeClass("crece").addClass("descrece");
					setTimeout(function(){$("#"+quitar+", ."+quitar).hide();},500);
				break;
				case "object":
					quitar.removeClass("crece").addClass("descrece");
					setTimeout(function(){quitar.hide();},500);
				break;
			}
		}
		if (poner.length){
			switch(typeof(poner)){
				case "string":
					$("#"+poner+", ."+poner).removeClass("descrece").addClass("crece").show();
				break;
				case "object":
					poner.removeClass("descrece").addClass("crece").show();
				break;
			}
		}
	}
//Aqui empieza el .readyf
$(document).ready(function() {

	// history.replaceState('', 'Articulo de ejemplo', '/test');
	$(".detalle-slide li").css("visibility", "visible");
	//maxcarateres("mensaje");
	
	
	/**Variable para obtener la url actual*/
	var url = new URL(window.location.href);
	
	/*Cambia Select de buscador*/
	var ob = getParam("ob",url) || null;
	if(ob != null && $("#ob").length > 0) {
		$("#ob option[value="+ob+"]").attr("selected",true)
	}
	/**Filtros Colizq celulares y vehiculos**/
	if($( "#rangoPrecio" ).length > 0) {
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
					$( "#lblRPrecio" ).val( formatNumber(ui.values[0] ,"RD$" ) + " - " + formatNumber(ui.values[1] ,"RD$" ));
			},
			change: function( event, ui){
				var newURL = updateURLParameter(window.location.href, 'pmin', ui.values[0]);
				newURL = updateURLParameter(newURL, 'pmax', ui.values[1]);
				window.location.href = newURL;
			}
		});
		$( "#lblRPrecio" ).val( formatNumber($( "#rangoPrecio" ).slider( "values", 0 ),"RD$" ) +
			" - " + formatNumber($( "#rangoPrecio" ).slider( "values", 1 ),"RD$" ));
	}
	/*rango de anios para los vehiculos*/
	if($( "#rangoAnio" ).length > 0) {
		var danio = getParam("danio", url) || 1945;
		var hanio = getParam("hanio", url) || 2017;	
		$( "#rangoAnio" ).slider({
			range: true,
			min: 1945 || 1945, /*variable definida en cssjs.inc.php*/
			max: 2017 || 2017,
			values: [ danio, hanio ],
			step: 1,
			slide: function( event, ui ) {
					$( "#lblRAnio" ).val( "Entre.: " + ui.values[0] + " - " + ui.values[1]);
			},
			change: function( event, ui){
				var newURL = updateURLParameter(window.location.href, 'danio', ui.values[0]);
				newURL = updateURLParameter(newURL, 'hanio', ui.values[1]);
				window.location.href = newURL;
			}
		});
		$( "#lblRAnio" ).val("Entre.: " + $( "#rangoAnio" ).slider( "values", 0 ) +
			" - " + $( "#rangoAnio" ).slider( "values", 1 ));
	}	
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
		if(getParam("pmin", newURL) != null && sidparam != null) newURL += "&sid="+sidparam;
		else if(sidparam != null) newURL += "?sid="+sidparam;
		newURL = updateURLParameter(newURL, parametro,valor);
		alertify.notify('Aplico un filtro a los resultados actuales', 'success', 3);
		window.location.href = newURL;
		
	});

	/* *Fin Filtros* */
	if($('.prv').length){
		$('.prv').click(function(e) {
			e.preventDefault();
			lnkbprovincias= 'Provincias';
			$('#areaprv').toggle( function() {
				$.ajax({ url: ajaxfn.listadoprovincias,
					type: "GET",
					success: function(data) {
						$("#areaprv").html(data);
						$("#busprv li").transpose();
					}
				});
			});
			$('.prv').text(lnkbprovincias);
		});
	}
	if ($("#frm #q").length) {
        $('input#q').result(function() {});
        $("#btnbuscar").click(function() {
            if ($("#q").val() == '') {
                alertify.wAlert("El campo de busqueda esta vacio");
                $(this).focus();
                return false
            } else {
                $("#frm").submit();
                return true
            }
        })
    }
    if ($("#frmprv #q").length) {
        $("#btnprv").click(function(e) {
			e.preventDefault();
            if ($("#frmprv #q").val() == '') {
                alertify.alert(msgAlert.q_blank);
                $("#frmprv #q").focus();
                return false
            } else if (!validaChequeados($("#frmprv"))) {
                alertify.alert('InformaciÃ³n','Debe seleccionar por lo menos una provincia para buscar');
                return false
            } else {
                $("#frmprv").submit();
                return true
            }
        })
    }
	$(".btn-collapse-listaenmovil").click(function() {
		var bloque = $(this).attr("data-target");
		$.each($(".listaenmovil"),function( i, val ){
			if(("#"+val.id) != bloque){
				$("#"+val.id).removeClass('in') 
			}
		})
	});
	/* ****************************************** */
	if($(".lpub").length) {
		$(".lpub .masinfo").each(function() {
			$(this).attr("data-toggle","collapse");
			var pid = $(this).attr("id");
			pid = "#pf"+pid.substring(1,pid.length);
			$(this).attr("data-target",pid);

		});
	}
	$("#tipol, #tipog").click(function(e) {
		e.preventDefault();
		$.get("/ajax.tipolistado.php?tipo="+this.id, function() {
			location.reload(true);
		});
	});
    /* poner en favoritos  12-04-17 */
    $("a.vmt, .pfavoritos").click(function(e) {
		e.preventDefault();
		var valor = this.id;
		var arrValor = valor.split('_');
		var id = arrValor[0];
		var uid = arrValor[1]; /*uid del dueno de la publicacion */
		var accion = arrValor[2]; /*acction agregar o eliminar*/
		if (accion == 'I') {
			
			ajaxfavoritos(id,uid,accion);
			alertify.error('Eliminada');
		}
		if (accion == 'A'){
			ajaxfavoritos(id,uid,accion);
		}
		if (usulogged == "N") {
			lp_vmt();
			$.cookie("lp_vmt", 1, { expires : 2 });
		}
    });
    /* retira publiccion  modificado 25-04-2018 */
    $(".mpo").click(function(e) {
		e.preventDefault();
		var ids = [];
		var tpube = "";
		$("input[type=\"checkbox\"]:checked").each(function() {
			ids.push(this.id);
		});
		if(ids.length > 0){
			ids.join(",");
			var uid = $("input[type=\"checkbox\"]:checked").attr("rel");
		}
		var valor = this.id;
		if(valor != "btnProcesarMp" && valor != "btnProcesar") {
			var arrValor = valor.split('_');
			var id = arrValor[0];
			var uid = arrValor[1]; /* uid del dueno de la publicacion */
			var accion = arrValor[2]; /* acction agregar o eliminar */
			var datosPub = arrResVip[id];
			tpube = "Motivo para eliminar.: " +datosPub.titulo;
			$("input[type=\"checkbox\"]:checked").prop("checked", false);
		} else {
			if (ids.length == 0) {
		 		alertify.alert("La Pulga Virtual", "Debes seleccionar almenos una publicaciÃ³n.");
				return false;
			}
			var publicaciones = $("input[type=\"checkbox\"]:checked").length;
			tpube = "Â¿Por quÃ© quieres eliminar " + publicaciones + " publicaciones?";
		}
		var frmbtn = ($("#btnProcesar").length) ? "#frmhistorialPublicaciones" : "#frmeliartinfo"; 
		$(frmbtn).find("#id").val( (id) ? id : ids );
		$(frmbtn).find("#uid").val(uid);
		if($("#btnProcesar").length) return $("#frmhistorialPublicaciones").submit();
		$("#frmeliartinfo input[type=radio]").prop('checked', false);
		$("#tpube").text(tpube);
		$("#meliartinfo").modal("show");
    });
	/* Renovar publicacion */
	 $("a.mpor").click(function(e) {
		e.preventDefault();
		var valor = this.id;
		var arrValor = valor.split('_');
		var id = arrValor[0];
		var uid = arrValor[1]; /* uid del dueno de la publicacion    */
		var accion = arrValor[2]; /* acction agregar o eliminar */
		if (accion == 'RN') {
			alertify.wConfirm('Renovar publicacion','Seguro renovar la publicacion ID.'+id+'?',function() {
				var retorno = ajaxpublicaciones(id,uid,accion);
				retorno.success(function(data) {
					if (data == 1) alertify.success('Se ha renovado su publicacion');
					else alertify.eAlert('Publicacion ID.: ' +id,'No pudo ser renovada.<br><br>Usuarios con Plan BÃ¡sico 5 dÃ­as o mÃ¡s de publicado<br>Usuarios con Plan Pago una vez por dia.<br><br>Favor revisar la fecha de la publicaciÃ³n.<br><br>Te recomendamos <a href=\'/renovaciones\'>Renovaciones Automaticas</a> o <a href=\'/planes\'>ver Planes de Usuarios</a>, Equipo LP. ');
				});
			},function() { alertify.error('Cancelado')})
		} else return true;

    });
	/* solicitar extension publiaciones */
	$("a.extensionpub").click(function(e) {
		e.preventDefault();
		var uid = this.id;
		alertify.prompt('Solicitar Extension de Publicaciones','Favor agrega un comentario a tu solicitud.:','',function(e,valor) {
			if (valor) {
				$.ajax({
					url: "/ajax.solextension.php",
					type: "POST",
					data:({uid:uid,comentario:valor}),
					success: function(data) {
						if (data == '-3') {
							alertify.eAlert('Tienes una solicitud pendiente, no se puede crear otra, si aplicas sera aprobada en breve.<br>Equipo LP');
						} else if (data == '-2') {
							alertify.eAlert('No se pudo realizar la solicitud de extension, trata nuevamente');
						} else if (data == '1') {
							// alertify.notify('Fue procesada la solicitud No. ' + id , 'success', 10);
							alert('Fue enviada la solicitud, en breve procesaremos si aplicas.');
							location.href='/mipulga';
						}
					}
				});				
			} else alert('Debes colocar un comentario');
		},function() { alertify.error('Cancelado')});
    });	
	/* elimina klk */
	$("a.eklk").click(function(e) {
		e.preventDefault();
		var mid = this.id;
		alertify.prompt('Eliminar mensaje','Favor agrega un comentario para eliminar.:','',function(e,valor) {
			if (valor) {
				$.ajax({
					url: "/ajax.eklk.php",
					type: "POST",
					data:({id:mid,comentario:valor}),
					success: function(data) {
						if (data == '-2') {
							alertify.eAlert('No se pudo realizar la solicitud de extension, trata nuevamente');
						} else if (data == '1') {
							alert('Fue enviada la solicitud, en breve procesaremos si aplicas.');
							location.href='/admin.klk';
						}
					}
				});				
			} else alert('Debes colocar un comentario');
		},function() { alertify.error('Cancelado')});
    });		
	/* lp admin */
	/* procea productos */
	$("a.procesa").click(function(e) {
		
		e.preventDefault();
		var valor = this.id;
		var arrValor = valor.split('_');
		var id = arrValor[0]; /* id transaccion */
		var uid = arrValor[1]; /* uid del operador     */
		var accion = arrValor[2]; /* acction aprobar o cancelar */
		var msg = (accion == 'A') ? 'Aprobar' : 'Cancelar';
		if (accion == 'A' || accion == 'C') {
			alertify.prompt(msg + ' producto','Seguro de ' + msg + ' solicitud ID.'+id+'?,<br><br><b>Nota.</b> Este proceso es irreversible, verifique bien.<br>Favor escribe un comentario antes de procesar.:','',function(e,valor) {
				if (valor) {
					$.ajax({
						url: "/ajax.pprocesa.php",
						type: "POST",
						data:({id:id,uid:uid,accion:accion,comentario:valor}),
						success: function(data) {
							if (data == '-2') {
								alertify.eAlert('No se pudo procesar la solicitud ' + id);
							} else if (data == '1') {
								alert('Fue procesada la solicitud No. ' + id);
								location.href='/admin.procesa';
							}
						}
					});				
				} else alert('Debes colocar un comentario al procesar');
			},function() { alertify.error('Cancelado')});
		} else return false;
    });	
    $(".prtcoment a").click(function(e) {
		e.preventDefault();
		var nombre = this.rel;
		var valora = this.id;
		alertify.prompt('Equipo LP :/',"Escribe un comentario "+ nombre +"",'',function(e,valor) {
				if (valor) {
					ajaxcambiacampo(valora, "ss", valor);
				} else alert('Debes colocar un comentario ' + nombre);
			},function() { alertify.error('Cancelado')});

    });	
	/* inserta planesinfo defecto */
	$("a.idplinfo").click(function(e) {
		e.preventDefault();
		var uid = this.id;  /* uid del usuario */
		alertify.prompt('Datos plan info','Seguro de agregar los datos del plan?,<br><br><b>Nota.</b> Este proceso es irreversible, verifique bien.<br>Favor escribe un comentario antes de procesar.:','',function(e,valor) {
			if (valor) {
				$.ajax({
					url: "/ajax.adidplaninfo.php",
					type: "POST",
					data:({uid:uid}),
					success: function(data) {
						if (data == '-2') {
							alertify.eAlert('No se pudo agregar datos del plan ' + id);
						} else if (data == '1') {
							alert('Fueron actualizados los datos del plan');
							location.href='/admin.perfilusuario?uid='+uid;
						}
					}
				});				
			} else alert('Debes colocar un comentario al procesar');
		},function() { alertify.error('Cancelado');});
    });		
	/* cancela plan */
	$("a.cplan").click(function(e) {
		e.preventDefault();
		var uid = this.id;  /* uid del usuario */
		alertify.prompt('Cancelar plan','Seguro de cancelar plan?,<br><br><b>Nota.</b> Este proceso es irreversible, verifique bien.<br>Favor escribe un comentario antes de procesar.:','',function(e,valor) {
			if (valor) {
				$.ajax({
					url: "/ajax.cplan.php",
					type: "POST",
					data:({uid:uid,comentario:valor}),
					success: function(data) {
						if (data == '-2') {
							alertify.eAlert('No se pudo cancelar el plan ' + id);
						} else if (data == '1') {
							alert('Fue cancelado el plan');
							location.href='/admin.perfilusuario?uid='+uid;
						}
					}
				});				
			} else alert('Debes colocar un comentario al procesar');
		},function() { alertify.error('Cancelado');});
    });		
	/* procea extensiones de publicaciones */
	$("a.procesaext").click(function(e) {
		e.preventDefault();
		var valor = this.id;
		var arrValor = valor.split('_');
		var id = arrValor[0]; /* id transaccion */
		var uid = arrValor[1]; /* uid del usuario     */
		var usuario = arrValor[2]; /* usuario (usado para la notificacion)  */
		var accion = arrValor[3]; /* acction aprobar o cancelar */
		var msg = (accion == 'A') ? 'Aprobar' : 'Cancelar';
		var extension = $("#ext" + id).val();
		if ((accion != 'A') && (accion != 'C')) return false;
		if (((accion == 'A') && (extension != 0)) || ((accion == 'C') && (extension == 0))) {
			alertify.prompt(msg + ' extension','Seguro de ' + msg + ' solicitud ID.'+id+'?,<br><br><b>Nota.</b> Este proceso es irreversible, verifique bien.<br>Favor escribe un comentario antes de procesar.:','',function(e,valor) {
				if (valor) {
					$.ajax({
						url: "/ajax.procesaext.php",
						type: "POST",
						data:({id:id,uid:uid,accion:accion,usuario:usuario,comentario:valor,extension:extension}),
						success: function(data) {
							if (data == '-2') {
								alertify.eAlert('No se pudo procesar la solicitud ' + id);
							} else if (data == '1') {
								// alertify.notify('Fue procesada la solicitud No. ' + id , 'success', 10);
								alert('Fue procesada la solicitud No. ' + id);
								location.href='/admin.extensiones';
							}
						}
					});				
				} else alert('Debes colocar un comentario al procesar');
			},function() { alertify.error('Cancelado')});
		} else {
			alert('Debes seleccionar la cantidad a extender');
			return false;
		}
    });	
	/* fin lp admin poner aparte */
   /* activa o desctiva enlace p  28-04-17 */
    $("a.mep").click(function(e) {
		e.preventDefault();
		var valor = this.id;
		var arrValor = valor.split('_');
		var id = arrValor[0];
		var uid = arrValor[1]; /*uid del dueno de la publicacion  */
		var accion = arrValor[2]; /*acction activar odesactivar*/
		alertify.wConfirm('Esta seguro de esta accion?',function() {
				ajaxenlacesp(id,uid,accion);
				alertify.success('Accion completada');
		},function() { alertify.error('Cancelado')})

    });
	/*controla buscador mantenga tope*/
	var header_mov = ($(".header-mov").length) ? $(".header-mov").offset().top + $(".header-mov").height() : undefined ;
	var filtros_mov =  ($(".group-filtros").length) ? $(".group-filtros").offset().top : undefined;
	filtro_activo =  $(".in");
	$(window).scroll(function () {
		var window_top = $(window).scrollTop();
		var window_bottom = $(window).scrollTop() + window.innerHeight;
		var div_top = $('#sticky-tope').offset();
		var desactiva_stick = ($("*").hasClass("in") || !$("#q").length || $(".bprecio").length) ? true : false;
		var space_body = parseInt($("body").css("padding-top"));
		if (div_top != undefined) {
			div_top = $('#sticky-tope').offset().top;
			if (window_top > div_top) $('#buscador').addClass('stick');
			 else $('#buscador').removeClass('stick');
		}
		if (window_top > $("#footer").offset().top / 2 && !$(".goup-filtros.stick").length && desactiva_stick) $("*").removeClass("in");
		if($("#binfoplan").length) desactiva_stick = false;
		if (header_mov != undefined && !desactiva_stick) {
			var tam_header = $(".header-mov").height();
			if (window_top > header_mov) {
				$("body").css("padding-top", tam_header);
				var tam_filtros = $(".group-filtros").closest("div").height();
				var filtros_bottom = tam_filtros + tam_header -12;  
				$(".header-mov").addClass('stick');
				if (window_top + tam_header > filtros_mov) {
					$(".in").removeClass("in");
					$("body").css("padding-top", tam_header + tam_filtros);
					var tam_lista = window.innerHeight - filtros_bottom;
					$(".group-filtros").addClass("stick").css("top",$(".header-mov").height() -5);
					$(".btn-collapse-listaenmovil").each(function(key,campo) {
						var menu = $(this).attr("data-target");
						$(menu).addClass("stick").css({
							"top":filtros_bottom , 
							"width" : "100%",
							"max-height" : tam_lista,
							"overflow-y" : "scroll"
						});
					});
				} else {
					filtro_activo.addClass("in");
					$("body").css("padding-top", tam_header);
				 	$(".group-filtros").removeClass("stick");
				 	$(".btn-collapse-listaenmovil").each(function(key,campo){ 
				 		var menu = $(this).attr("data-target");
				 		$(menu).removeClass("stick").css({"top": 0, "height" : "auto"});
				 	});
				}
			} else {
				$("body").css("padding-top", 0);
				$(".stick").removeClass('stick');
			}
		}
		// if(window_bottom >= $("#qbuscas").offset().top - 50) {
			// $("#qbuscas").find("h2").addClass("cae");
			// $("#qbuscas").find("input").addClass("movimiento");
			// $("#qbuscas").css("opacity", "1");
		// } else $(".cae,.movimiento").removeClass("cae").removeClass("movimiento");

	});
	/*controla el efecto para el resaltado*/
	$(window).scroll(function () {
		var window_top = $(window).scrollTop();
		var viewportHeight = window.innerHeight;
		var fondo = window_top+viewportHeight;
		var resaltados =$(".resal");
		// console.log(800 + viewportHeight );
		// console.log(fondo);
		//cuando el fondo de el viewport pasa por el articulo + el tamaÃ±o de pantalla se elimina el resaltado
		for(var i = 0 ; i< resaltados.length ; i++) {	
			if(fondo > $(resaltados[i]).offset().top + viewportHeight ) {
				$(resaltados[i]).removeClass('resalt');
				//si el tope esta por encima de el viewport se activa el resaltado
				if(window_top < $(resaltados[i]).offset().top + 50)  $(resaltados[i]).addClass('resalt');
			//de lo contrario si el fondo del viewport pasa por encima de el articulo en cuestion se activa
			}else if(fondo > $(resaltados[i]).offset().top + 50){
				$(resaltados[i]).addClass('resalt'); 
			// si no se dan ninguno de los casos el articulo no estarÃ¡ visible en la pantalla asi que se eliminara el efecto
			}else $(resaltados[i]).removeClass('resalt');
		}
	});
	/*cierra alert*/
	 $('.close').click(function(e) {
		 e.preventDefault();
		 if(!($('.modal').hasClass('in'))){
			$(this).parent("div.alert").hide(500);
			if ($('[class^=alert]').length)
				$.get("/ajax.msgsession.php");
			return false
		 }
    });

	/***********Organiza listados*************/
	$("#fcats li").transpose();
	$("#fprvs li").transpose();
	$("#adperusu1 li").transpose();
	$("#adperusu2 li").transpose();

	/***********Modal*************/
	/*Detalle de servicios en modal*/
	/*depende del js de bootstrap*/
	$(".servicio").click(function() {
		var arrId = urldecode(this.id);
		 arrId = arrId.split("|");
		$("#nombrecia").html(arrId[0]);
		$("#telefonos").html("<b>Tels.: </b>" + desencript(arrId[1]));
		$("#direccion").html("<b>Direcci&oacute;n.: </b>" + arrId[2]);
		$("#descripcion").html("<b>Detalles.: </b>" + arrId[3]);
		if (arrId[5] == "ND") $("#dsvform").hide();
		$("#mservicio").modal('show');
	});
	$("#contacta, .contacta, .momodificapu").click(function(e) {
		e.preventDefault();
		if (this.id != 'contacta') {
		   /*aplica solo para contacta en favoritos*/
			var arrId = urldecode(this.id).split("|");
			var arrCatId = arrId[0].split("-");
			$("#de").val(arrId[0]);
			$("#categoria").find("option[value='"+arrId[0]+"']").prop("selected", true);
			$("#para, #articulo").val(arrId[1]);
			$("#ida, #precio").val(arrId[2]);
			$("#mmodificapu .id").val($(this).attr("rel"));
			(arrId[3] == 'R') ? $("#peso").prop("checked", true) : $("#dolar").prop("checked", true) ; 
			$("#usuario").val(arrId[3]);
			$("#ausuario").html(arrId[3]);
			$("#asunto, #tipo").val(arrId[4]);
			$("#condicion").val(arrId[5]);
			$("#categoria_id").val(arrCatId[0]);
			$("#subcategoria_id").val(arrCatId[1]);
			$("#categoria").change(function(){
				arrCatId = $("#categoria option:selected").val().split("-");
				$("#categoria_id").val(arrCatId[0]);
				$("#subcategoria_id").val(arrCatId[1]);
			});
		}
		generaPosFotos($(this).attr("rel"),$(this).find("input").val());
	});
	$(".morecomendaciones").click(function(e) {
		e.preventDefault();
		if($("#mrecomendaciones").length){
			$("#mrecomendaciones").modal("show");
		}
	});
	// menejo de mapa para las tiendas
	$(".mubicame").click(function(e) {
		if(this.href.substr(0,5) != "https") {
			alertify.alert("La Pulga Virtual","Lo sentimos, no tenemos la ubicaciÃ³n de este local."); return false;
		} else e.preventDefault();
	    var src = $(this).attr("href"); 
	    var nombret = $(this).attr("rel");
	    $("#nombret").text("UbicaciÃ³n de " + nombret);
	    $("#mubicame").find("iframe").attr("src", src);
	    $("#mubicame").find("iframe").load(function(){$(".cont_loader").animate({height:'0px'});});
	    $("#mubicame").modal("show");
	});
	$(".moreportar").click(function(e) {
		e.preventDefault();
		if($("#mreporta").length){
			$("#mreporta").modal("show");
		}
	});
	$(".mocontacta").click(function(e) {
		e.preventDefault();
		var id = this.id;
		var ttl = "";
		if($("#mcontacta").length) {
			$("#mensaje").val("");
			var arrDatos = this.id.split("_");
			// si no esta logueado pregunta 
			ajaxlogged(1);
			setTimeout(function(){
				// console.log("la var tiene el valor de " + usulogged);
				if (usulogged == '-10') {
					alertify.wConfirm("Para enviar mensaje", "Si tienes una cuenta has <a href=\"/login/publicacion_" + arrDatos[1] + ".html\">login</a> de lo contrario crea una.", function() {
						$("#mcontacta").modal("show");
					} , function() {		
						
					});	
				} else {
					// usuario logueado
					$(".fldcontacta").hide();
					if (usulogged!=-10) $("#de").val(usulogged);
					$("#mcontacta").modal("show");
				}
				if(arrDatos[2] == undefined){
					ttl = "Servicio al Cliente.";
					arrDatos[2] = ttl;
				} else ttl = "Pregunta sobre: " + arrDatos[2];
				$(".modal-title").text(ttl);
				$("#asunto").val(arrDatos[2]);
				$("#para").val(arrDatos[0]);
				$("#ida").val(arrDatos[1]);
			}, 300);
				
		}
	});
	$(".momodificapu").click(function(e) {
		e.preventDefault();
		if($("#mmodificapu").length){
			$("#mmodificapu").modal("show");
		}
	});	
	$(".moinfoplan").click(function(e) {
		e.preventDefault();
		if($("#moinfotienda").length) {
			$("#moinfotienda").modal("show");
		}
	});
	$(".moubicacion").click(function(e) {
		e.preventDefault();
		if($("#moubicacion").length){
			$("#moubicacion").modal("show");
		}
	});
	//modal para la calculadora...
	$(".mocalculaprestamos").click(function(e) {
		e.preventDefault();
		if($("#mocalculaprestamos").length){
			$("#mocalculaprestamos").modal("show");
		}
	});
	 $(".conoce").click(function(e) {
		 e.preventDefault();
        $('#mconoce').modal();
    });
	// paga plan
	$(".ppaga").click(function(e) {
		ajaxcambiacampo(this.value);
	});	
	// cambia campo
	$(".ccampo").click(function(e) {
		ajaxcambiacampo(this.id);
	});	
	// admin
	$(".moadcomusu").click(function(e) {
		e.preventDefault();
		if($("#madcomusu").length){
			$("#madcomusu").modal("show");
		}
	});	
	// admin penalidades
	$(".moadpenalidades").click(function(e) {
		e.preventDefault();
		if($("#madpenalidades").length){
			$("#madpenalidades").modal("show");
		}
	});			
	// admin cambia palabras
	$(".moadcmbpalabra").click(function(e) {
		e.preventDefault();
		if($("#madcmbpalabra").length){
			$("#madcmbpalabra").modal("show");
		}
	});		
	/*Funcion que se encarga de tomar valores del arreglo arrResVip para agregar opcionales y adicionar algunas codinciones */
	$(".moopcional").click(function(e) {
		e.preventDefault();
		if(arrResVip != "undefined") {
			confoto = true;
			var msg="";
			var arrValor = $(this).attr("id").split("_");
			var datosPub = arrResVip[arrValor[1]];
			var tpub = datosPub.titulo;
			var adicionar = (datosPub.reshasta != "") ? "Adicionar - " : "";
			var cantOpresal = $("#opcional").find("option").length -1; /*saber cantidad de opciones en selecc*/
			$("#novip").removeClass("hide");
			$("#novip").empty();
			if($("#mopcionales").length){
				$("#tpub").text(tpub);
				$("#frmopcionales input[name=id]").val(arrValor[1]);
				/*$("#id").value = arrValor[1]; CORREGIDO 21-06-17*/
				if(datosPub.vip == "S") {
					msg = "Esta publicacion esta en VIP actualmente.";
					confoto = false;
				}else if(datosPub.foto == "N") {
					msg = "Necesita fotos para poner en VIP, <a href=\"/modificapublicacion/"+arrValor[1]+"\">Agregar Fotos</a>";
					confoto = false;
				}else{
					$("#novip").addClass("hide");
				}
				$("#opcional").find("option").each(function(v){
					var texto = this.text.replace("Adicionar - ","");
					if(v > 0 && v < cantOpresal){
						texto = adicionar+texto;
						this.text = texto;
					}
				});
				$("#opcional option#sresal").text((datosPub.reshasta != "") ? "Resaltado hasta: "+datosPub.reshasta : "Selecciona dias resaltado");
				$("#vip").change();
				$("#novip").append(msg);
				$("#mopcionales").modal("show");
			}
		}
	});
	$(".verVideo").click(function(e) {
		e.preventDefault();
		var arrId = e.currentTarget.id.split('|');
		var urlVideo = "https://www.youtube.com/embed/"+arrId[0]+"?autoplay=1";
		if($("#movideo").length > 0 ) {
			$("#movideo #ytplayer").attr("src",urlVideo);
			$("#movideo .modal-title").text(arrId[1]);
			$("#movideo").modal("show")
		}
	});
	/*Para cuando se abren dos modales*/
	$(document).on('hidden.bs.modal', function (event) {
		if ($('.modal:visible').length) {
			$('body').addClass('modal-open');
		}
	});
	/*Al momento de cerrar el modal de video quitar el video del frame*/
	$('#movideo').on('hidden.bs.modal', function () {
		$("#movideo #ytplayer").attr("src","");
		$("#movideo .modal-title").text("");
		$("#movideo").modal("hide")
	})
	
	/*----------------Area Modales----------------*/

	/*----------Uso de Plugins---------------*/
	/*Tooltip

	@dependencia /bootstrap.min.js
	USO: plicar las clases tt(tooltip blanco con titulo o sin el) o ttn(tooltip negro sin titulo)
	si el tooltip necesita titulo en el atributo titulo del tag separar con | ejemplo "Informacion | Lorem"
	*/
	var contenido="";
	$(".tleft").attr("data-placement","left");
	$(".ttop").attr("data-placement","top");
	$(".tright").attr("data-placement","right");
	$(".tbottom").attr("data-placement","bottom");
	if($(".ttb, [data-toggle=\"popover\"]").length && !$(".movil").length){
		$(".ttb, [data-toggle=\"popover\"]").each(function(i, val) {
			if($(val).attr("title")){
				contenido = $(this).attr("title");
				contenido = contenido.split("|");
				if(contenido.length > 1){
					$(this).attr("title",contenido[0]);
					$(this).attr("data-content",contenido[1]);
				}else{
					$(this).attr("title","");
					$(this).attr("data-content",contenido[0]);
				}
			}
			$(this).popover({html:true,trigger: "hover" });
		});
	}
	if($(".tt").length && !$(".movil").length){
		$('.tt').tooltip({html:true});
	}
	/*****Tooltip**********/
	/* ifancybox */
    $(".fancybox").fancybox();
   
    $(".ifancybox").fancybox({
        'width': '75%',
        'height': '75%',
        'autoScale': false,
        'transitionIn': 'none',
        'transitionOut': 'none',
        'type': 'iframe'
    });
    //Slide nuevo para detalle
    $(".detalle-slide").bxSlider({	
		mode: 'horizontal',
   		captions: true,
   		adaptiveHeight: false
	});
	/*nuevos sliders para vip, area de ofertas y area multiple*/
	$('.slidermovil5').bxSlider({
		slideWidth: 180,
		minSlides: 2,
		maxSlides: 6,
		slideMargin: 10,
		auto: true,
		pause: 4000,
		autoStart: true,
		autoDirection: 'next',
		stopAutoOnClick: false,
		autoHover: true,
		autoDelay: 0,
		autoSlideForOnePage: false,
		infiniteLoop: true
	});
	$('.slidermovil').bxSlider({
		slideWidth: 180,
		minSlides: 2,
		maxSlides: 3,
		slideMargin: 40,
		auto: true,
		pause: 4000,
		autoStart: true,
		autoDirection: 'next',
		stopAutoOnClick: false,
		autoHover: true,
		autoDelay: 0,
		autoSlideForOnePage: false,
		infiniteLoop: true
	});
	 /* manejo de tooltip para vip, AO y AM*/
	$('ul.slider5 li, ul.slider3 li, ul.slidermovil5 li, ul.slidermovil li, .clgp').each(function() {
			var contenedor = $(this).attr("class");
			var $spinfo = $(this).find('span');/*asignando span a variable*/
			$(this).find('span').find('a').css({position:'absolute',width:'100%',height:'100%'});
			$spinfo.css('top');
			$(this).hover(
				function(){
					if ( contenedor == "clgp") 
						$(this).find("h4").animate({ position: "absolute", bottom: -100 }, 200);
					$spinfo.animate({ top: 70,opacity:1  },200);/*subir bloque 100 px arriba*/
				},
				function(){
					$spinfo.animate({ top: 163	});
					if ( contenedor == "clgp") 
					$(this).find("h4").animate({ position: "relative", bottom: 15 }, 200);
				}
			);
	});
	$("#menu-close").click(function(e) {
		e.preventDefault();
		$("#sidebar-wrapper").toggleClass("active");
	});
	$(".menu-toggle").click(function(e) {
		e.preventDefault();
		$("#sidebar-wrapper").toggleClass("active");
	});

	if($('#menu-categoria').length > 0) {
		$('#menu-categoria').click(function(e) {
			$('#sidemenu').empty();
			e.preventDefault();
			$("#sidemenu-titulo").text("Categorias");
			for(x in arrCategorias) {
				$('#sidemenu').append("<li>"+arrCategorias[x]+"</li>");
			}
		})
	}
	function agregarElemento (obj) {

		var elemento = document.createElement("div");
		var contenido = document.createTextNode("Lorem");
		elemento.appendChild(contenido);
		var contenedor = document.getElementById(contenedor);
		document.body.insertBefore(newDiv, currentDiv);
	}
  /*script para el ver mas*/
	if($('.vertodo').length > 0) {
		var cantidadCarateres = 100;
		var ellipsestext = "...";
		var vermas = "Mostrar todo >";
		var vermenos = "Mostrar menos";


		$('.vertodo').each(function() {
			var $descripcion = $('.vertodo');
			var contenido = $descripcion.html();

			if(contenido.length > cantidadCarateres) {

				var c = contenido.substr(0, cantidadCarateres);
				var h = contenido.substr(cantidadCarateres, contenido.length - cantidadCarateres);

				var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="mascontenido"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="mascontenido-link less">' + vermas + '</a></span>';

				$descripcion.html(html);
			}

		});

		$(".mascontenido-link").click(function(){
			var $mascontenido = $(".mascontenido-link");
			if($mascontenido.hasClass("less")) {
				$mascontenido.removeClass("less");
				$mascontenido.html(vermenos);
			} else {
				$mascontenido.addClass("less");
				$mascontenido.html(vermas);
			}
			$mascontenido.parent().prev().toggle();
			$mascontenido.prev().toggle();
			return false;
		});
	}
	/*Implementacion de carousell*/
	$( "ul.carousel-inner li" ).first().addClass( "active" );
	$( ".carousel" ).carousel({ interval: false });
	/*Cookies usuario*/
	if($.cookie('cookieAceptado')==1) $("#cookieGuardMsg").remove();
	$("#aceptaCookie").on('click',function(e){
		e.preventDefault();
		$("#cookieGuardMsg").remove();
		var d = new Date();
		d.setTime(d.getTime() + (365*24*60*60*1000));
		var expires = "expires="+ d.toUTCString();
		document.cookie = "cookieAceptado=1;" + expires + "; path=/";
	})
	
	$("#frm").submit(function(){
		if($("#q").val() == "") { 
			alertify.wAlert("El campo de busqueda esta vacio"); 
			return false;
		}
	})
	$(window).load(function() {
		// animacion desaparecer cargando
		$(".cargando").fadeOut("slow");
	});
		// elimina fotos de una publicacion administrativo 23-09-17
    $(".admresfot").click(function() {
		var arrId = this.id.split("-");
		var pid = arrId[1];
		sleep(500);
		if (confirm('Desea procesar esta opcion?')) {
			$.ajax({ 
				url: ajaxfn.admresfot, 
				type: "GET",
				data:({id:pid}),
				success: function(data) {
					if (data != '') alert('Estas fotos no pudieron ser removidas, favor verificar');
					else alertify.success("Procesada")
				}
			});	
		}
		return false;
	});
		// elimina publicacion administrativo 12-11-17
    $(".admelipub").click(function() {
		var arrId = this.id.split("-");
		var pid = arrId[1];
		var est = arrId[2];
		sleep(500);
		if (confirm('Desea procesar esta opcion?')) {
			$.ajax({ 
				url: ajaxfn.admelipub, 
				type: "GET",
				data:({id:pid,est:est}),
				success: function(data){
					if (data != '') alert('No pudo ser procesada, favor verificar');
					else alertify.success("Procesada")
				}
			});	
		}
		return false;
	});	
		// agrega numero de telefon a ser bloqueado administrativo 17-7-2018
    $(".admnotel").click(function() {
		if (confirm('Desea bloquear este numero de telefono?')) {
			$.ajax({ 
				url: ajaxfn.admnotel, 
				type: "POST",
				data:({telefono:this.id}),
				success: function(data) {
					if (data != '') alert('No se pudo agregar este telefono a la lista, favor verificar');
					else alertify.success("Procesada");
				}
			});	
		}
		return false;
	});		
		// agrega penalidad a usuario administrativo 12-11-17
    $(".admpenalidad").click(function() {
		var arrId = this.id.split("-");
		var uid = arrId[1];
		var pn = arrId[2];
		sleep(500);
		if (confirm('Desea preavisar o penalizar este usuario?')) {
			$.ajax({ 
				url: ajaxfn.admpena, 
				type: "POST",
				data:({uid:uid,penalidad:pn}),
				success: function(data) {
					if (data != '') alert('No se pudo agregar esta penalidad o preaviso, favor verificar');
					else alertify.success("Procesada");
				}
			});	
		}
		return false;
	});	
		// retira usuario  administrativo 21-02-2018
    $(".admretusu").click(function() {
		sleep(500);
		if (confirm('Desea procesar esta opcion?')) {
			$.ajax({ 
				url: ajaxfn.admretusu, 
				type: "POST",
				data:({valor:this.id}),
				success: function(data) {
					if (data != '') alertify.error('No se pudo retirar el usuario, favor verificar');
					else alertify.success("Usuario retirado");
				}
			});	
		}
		return false;
	});	
	// agrega publicacion a publicidad o adwords remarketing 19-11-2017
    $(".admpublicidad").click(function() {
		var arrId = this.id.split("-");
		var id = arrId[1];
		var tipo = arrId[2];
		$.ajax({ 
			url: ajaxfn.admpubl, 
			type: "GET",
			data:({id:id,tipo:tipo}),
			success: function(data) {
				if (data != '') alert('No se pudo agregar esta publicacion adwords, favor verificar');
				else alertify.success("Procesada");
			}
		});	
		return false;
	});	
	$(".frmcalculadora").submit(function(e) {
		e.preventDefault();
		$.ajax({ 
			url: "/ajax.amortizacion.php", 
			type: "POST",
			data:$(this).serialize(),
			before: function() {
				$(".cargando").show();
			},
			success: function(data) {
				$(".cargando").addClass("descrece").hide(600);
				$("#frmcalculadora").addClass("descrece");
				setTimeout(function(){
					// alert(data);
					$("#frmcalculadora").closest(".modal-body").append(data);
					$("#frmcalculadora").hide();
					$("#amortizacion").addClass("crece").attr("id", "data").addClass("data");
					$(".calcula").removeClass("hide");
				},600);
			}
		});	
	});
	// muestra oculta filas en los admin
	var tr_id ="";
	$(".cambia").on("click", function(e) {
		$("#" + this.id).closest("tr").next("tr").toggle("slow");
		if (tr_id != "" && tr_id != this.id) $("#" + tr_id).closest("tr").next("tr").hide();
		tr_id = this.id;
	});

 if($("#asel").length){
  $("#asel").click(function() {
    $.each($("input[name='sel[]']"),function(key,campo){
    if (campo.checked) campo.checked = false;
    else campo.checked = true;
   });
    //$("#frmpfavoritos").toggleCheckboxes();
    return false;
  });
 }
 //funcion para filtrar las conversaciones
	$(".buscabloque").keyup(function(){buscabloque(this, $(this).attr("rel"));});

	function buscabloque(e, tabla) {		
		var filtro = e.value.toUpperCase();
		var container = (tabla == undefined) ? $(e).closest(".list-group") : $("#"+tabla);
		var li = (tabla == undefined) ? container.find("a") : container.find("tr");
		var indice;
		var resaltado;
		var antes;
		var resto;
		var result;
		$(".bg-info").removeClass("bg-info").css("font-style", "normal");
		$(".apaga").hide();
		for(var i =0 ; i<li.length ; i++) {
			if( $(li[i]).hasClass('apaga') ) continue;
			indice = $(li[i]).find(".asunto").text().toUpperCase().indexOf(filtro);
			if(indice > -1) {
				$(li[i]).show().prev(".eliminarm").show();
				// $(li[i]).show().prev("a").find(".eliminarm").show();
				resaltado = "<i class='bg-info'>"+$(li[i]).find(".asunto").text().substr(indice, filtro.length)+"</i>";
				antes = $(li[i]).find(".asunto").text().substr(0, indice);
				resto = $(li[i]).find(".asunto").text().substr(indice + filtro.length);
				result = antes + resaltado + resto;
				$(li[i]).find(".asunto").html(result);
			} else {
				indice = $(li[i]).find(".nombrem").text().toUpperCase().indexOf(filtro);
				if (indice > -1) {
					$(li[i]).show().closest("a").show().prev("a").find(".eliminarm").show();
					resaltado = "<i class='bg-info'>"+$(li[i]).find(".nombrem").text().substr(indice, filtro.length)+"</i>";
					antes = $(li[i]).find(".nombrem").text().substr(0, indice);
					resto = $(li[i]).find(".nombrem").text().substr(indice + filtro.length);
					result = antes + resaltado + resto;
					$(li[i]).find(".nombrem").html(result);
				} else {
					$(li[i]).hide().prev(".eliminarm").hide();
					//$(li[i]).hide().prev("a").find(".eliminarm").hide();
				}
			}
		} 
	}
	//eliminamos la clase list-group-item de el menu desplegable de las categoria
	$(".lisub").find("li").removeClass("list-group-item");
	//solo cuando este en el modulo de mi publicaciones

	if($(".flexcol").length) {
		//seleccionamos la categorÃ­a a la que pertenece la publicacion
		var options ="";
		$.each(arrCategorias, function(key, campo) {
			options+= "<optgroup rel='"+key+"' label='"+campo+"'>";
			$.each(arrSubcategorias[key],  function(keysub, camposub) {
				options+= "<option value='"+key+"-"+keysub+"'>"+camposub+"</option>";
			});
			options+= "</optgroup>";
		});

	//insertamos las categorias y subcategorias 
		$( ".pubcategoria" ).append(options);
		//seleccionamos las subcategorias correspondientes a la publicacion 
		var formularios =document.querySelectorAll(".frm");
		$( '.frm' ).each(function() {
			var frm_id = "#"+$(this).attr("id");
			var id_subcat =$(frm_id + " .id_subcat").val();
			var subcategoria = $(frm_id + " option[value='"+id_subcat+"']").attr("selected", "selected");	
		});
	
		$(".frm").submit(function(e) {
			e.preventDefault();
			//variable con el id del formulario a tratar
			var frm = $( this ).attr( "id" );
			//ajax conection!
			$.ajax ({
				//nombre del documento que devuelve la tabla
				url: "/modificapu.php",
				type:"POST",
				data: $( "#"+frm ).serialize(),
				success: function(resp){
					alertify.notify(resp,"success", 5);
				},
					//en caso de error
				error : function(jqRQH, estado, error) {
					console.log("el estado es: " + estado+ " el error es: " + error);
				}
			});
		});//acaba el submit de los formularios de mis publicaciones	
	}//acaba el condicional para saber si esta en el modulo de mis publicaciones	
	//track eventos de los enlaces del pie de la pagina
	// track eventos de whatsapp en los detalles contacta via wasa
	$("#detwha").click(function() {
		var accion = (this.id != '') ? this.id : this.href;
		trackevent('WhatsAppDetalle',accion,'WhatsApp Detalle');
	}); 
	
	$("#footer a").click(function() {
		var accion = (this.id != '') ? this.id : this.href;
		trackevent('BloqueFooter',accion,'Bloque Footer');
	}); 

	$("#footer .titulo-footer").click(function(){
		if(!$(".movil").length) return false;
		$("html").animate({scrollTop:$(this).offset().top - 10},500);
		$(this).closest(".footer_nav_menu").find("ul").toggle("slow");
	});
	//script para quitar tambaleo de los lados en vMovil
	($(".movil").length) ? $(".row, .group-filtros").css("max-width", window.innerWidth + "px") : '' ;
	//al dar click a un elemento con esta clase ocultas todos los elementos que le quedan detras
	$("#instafotos").click(function(){
		var dom= $("body").children();
		for(var i=0; i<dom.length; i++){
			$(".breadcrumb").hide();
			if (dom[i].id == this.id ) break;
			if ($(dom[i]).find("#" + this.id ).length) break;
			dom[i].style.display = "none";
			$(window).scrollTop($(this).offset().top);
			$("h4 a, .carousel-control, .carousel-indicators").hide();
		}
		//hacemos que a clickear nuevamente se recargue la pagina
		$(this).click(function(){
			location.reload();
		});
		document.getElementById("datoscompartir").select();
		document.execCommand("Copy");
	});
	//evento click para generar el filtro a las imagenes que sube el fancybox
	$(".fancybox").click(function(){
		if($(this).find(".filtro-img").length) {
			console.log("click fancy");
			setTimeout(function(){
				$(".fancybox-inner").find("img").addClass("filtro-img");
			},200);
		}else $(".fancybox-inner").find("img").removeClass("filtro-img");
	});

	$(".asignaCampos").on("click", function(){
		var campos = $(this).attr("rel").split("_");
		var valores = this.id.split("_");
		if(campos[1] != undefined) {
			for(var i=0; i<campos.length ; i++) 
				$("#" + campos[i]).val(valores[i]);
		} else 
			$("#" + campos).val(valores);
 	});
 	$(".showCampos").on("click", function(){
 		var campos = this.id.split("_");
		if(campos[1] != undefined) {
			for(var i=0; i<campos.length ; i++) 
				$("#" + campos[i]).closest("div").toggle().removeClass("hide");
		}
 	});
 	if($(".app").length) {
    	var arrEnlaces = $(".enlExt");
    	for (var i = 0; i<arrEnlaces.length; i++)
    		$(arrEnlaces[i]).attr("onclick", "window.open('"+arrEnlaces[i].href+"','_system');").attr("href","javascript:;");	
    }
}); /* acaba el .ready */