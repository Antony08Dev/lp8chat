/*!
 * Manejo de formularios nuevos responsive
 * @version 1.3.8
 * @since 1.0s
 * @author Ricardo Martinez, Jose Gabriel Escoboso
 * @date 10-10-2016
*/
/*instancia clase*/
var vmunicipio = 0;
var vsector = 0;
var retorno = false;

function validarform(formulario) {
		var pasa = false; 
        var frmActivo = formulario;
        var nombreArchivo = "";
		// asigna los valores a los campos para su validacion con el plugin
        nombreArchivo = frmActivo.substr(3, frmActivo.length); /*quitando frm*/
        if (typeof(arrValidaCampos)!= "undefined" ){
			if(arrValidaCampos[frmActivo]!= "undefined") {
				$.each(arrValidaCampos[frmActivo], function(k, v) {
					$.each(v.elementos, function(k, atr) {
						$("#"+frmActivo+" #" + k).attr(v.tag, atr);
					});
				});
				jQuery.each(arrFormAlertas, function(k, v) {
					$("#"+frmActivo+" #" + k).attr("data-validation-error-msg", v);
				});
				jQuery.each(arrPlaceholders, function(k, v) { $("#"+frmActivo+" #" + k).attr("placeholder", v); });
			}
		}
        $.validate({
            lang: 'es',
            form: '#' + frmActivo,
            validateOnBlur: true,
            errorMessagePosition: 'top',
            onSuccess: function($form) {
				// valida algunos forms modales que no requieren confirmacion
				// este cambio debe ser mostrado es para el modal eliminar articulo e mi pulga
				if (nombreArchivo == 'eliartinfo' || nombreArchivo == 'historialPublicaciones') {
					var chk = (nombreArchivo == 'eliartinfo') ? "motivo" : "sel[]";
                    if (validaChequeados(chk)) {
                        sleep(500);
						if(!confirm("Â¿Seguro que quieres eliminar publicaciones?")) return false;
                        $.ajax({
							type: "POST",
							/* contatena con nombre de formulario sin frm.. */
							url: "/eliartinfo.php", 
							data: $("#" + frmActivo).serialize(),
							success: function(data) {
								var retorno = ajaxpublicaciones($("#" + frmActivo + " #id").val(),$("#" + frmActivo + " #uid").val(),$("#" + frmActivo + " #accion").val());
								retorno.success(function(data) {
									if (data == 1) {
                                        var eliminadas = ($("input[type=\"checkbox\"]:checked").length) ? $("input[type=\"checkbox\"]:checked").length : 1;
										alertify.success("Eliminaste "+eliminadas+" producto(s)");
                                        $("input[type=\"checkbox\"]:checked").closest(".pub,tr").addClass("descrece");
                                        $("#pub"+$("#" + frmActivo + " #id").val()).addClass("descrece");
                                        setTimeout(function(){$("#pub"+$("#" + frmActivo + " #id").val()).hide();}, 500);
                                        $("input[type=\"checkbox\"]:checked").prop("checked", false);
									} else alertify.wAlert('No pudo ser eliminada su publicacion, trate nuevamente');
								});	
								$("#m" + nombreArchivo).modal('hide');
							},
							error: function(e) {
								alertify.eAlert("fallo en la seleccion, trate nuevamente, disculpas");
							}
						});
					} else alertify.eAlert("Debes seleccionar un motivo");
					return false;
				/* valida el submit de los modales */
				} else if (typeof($('#m' + nombreArchivo) == 'object') && $('#m' + nombreArchivo).hasClass('modal')) {
                    alertify.wConfirm('Esta todo correcto?',function() {
						$.ajax({
							type: "POST",
							/* contatena con nombre de formulario sin frm.. */
							url: "/" + nombreArchivo + ".php", 
							data: $("#" + frmActivo).serialize(),
							success: function(data) {
								$("#m" + nombreArchivo).modal('hide');
								if (data == 'nuevousuario') location.href = '/activausuario';
								else alertify.success(data);
							},
							error: function(e) {
								alertify.eAlert("fallo en envio de mensaje, trate nuevamente, disculpas");
							}
						});
					},function(){
						$("#m" + nombreArchivo).modal('hide');
						alertify.error('Accion Cancelada');
					});
					return false;
                } else {
					/* valida los formularios especificados */
					if (($("#frmproductos").length > 0) || ($("#frmpublicar").length > 0) || ($("#frmpublicarexp").length > 0) || ($("#frmregistro").length > 0)) {
                        //alertify.wConfirm('Esta todo correctodddd?',function() {
                        sleep(500);
                        if (confirm("Esta todo Correcto?")) {
                        	if ($("#formapago").val() == "PP") {	
								$("#procesar").attr("disabled",false);
								$("#Solicita").attr("value","Cargando PayPal, favor esperar...");
								$("#Solicita").attr("disabled",true);
								$("#submitcargando").show();
							}
							return true;
						} else return false;
					}
                }

            },
            onValidate: function($form) {
                if (frmActivo == 'frmpublicar') {
                    if ((typeof(usuplan) != 'undefined') && (usuplan.substr(0, 1) in { 'T': 1, 'L': 1 }) && (typeof(CKEDITOR) != 'undefined')) {
                        if (CKEDITOR.instances.descripcion.getData() == "") {
                            return {
                                element: $('#cke_descripcion'),
                                message: 'Favor completar la descripcion'
                            }
                        }
                    }
                }
            }
        });
    };

Number.prototype.formatMoney = function(c, d, t) {
    var n = this,
        c = isNaN(c = Math.abs(c)) ? 2 : c,
        d = d == undefined ? "." : d,
        t = t == undefined ? "," : t,
        s = n < 0 ? "-" : "",
        i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;
    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
};
/*genera un numero randon en un rango*/
function numerorandom(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
}
/**
 *funcion para determinar si un usuario via  facebook estaba registrado
 */
/*funcion para verificar el email*/
function verusufb(result, frm) {
    var retorna = 0;
	var nombre = result.first_name+" "+result.last_name;
    $.get("/ajax.verusufb.php", { id: "ER", valor: result.email },
        function(data) {
            /*para registrarse*/
            if (data == 'No') {
                if(frm == "frmformularios") {
                    alertify.eAlert('Este email (' + result.email + ') no esta registrado, completa los datos en el formulario de registro para crear tu cuenta, Equipo LP',function(){
    					location.href = "/registro?lgfb=S";
    				});
                    return "No";
                } else if(frm == "frmregistro") {
                    $("#" + frm).submit();
                }
            }
            if (data == 'Activo') {
                if(idform == "frmformularios") {
                    alertify.alert('Bienvenido ' + nombre + ', Gracias por entrar', function(){
				    	location.href = '/';
				    });
                } else {
                    alertify.alert('Ya tenÃ­as una cuenta en La Pulga ' + nombre + ', Gracias por entrar!', function(){
                        location.href = '/';
                    });
                }
            }
            if (data == 'Retirado') {
                alertify.eAlert('Estimado Usuario\n\nPor alguna razon su cuenta esta Retirada, vaya al enlace soporte para contactarnos\n\nGracias por utilizar nuestros servicios\nEquipo Lp', function() {
					location.href = '/logout.php';
				});
                
            }
            if (data == 'Inactivo') {
                alertify.alert('Cuenta Activada','Su cuenta ha sido activada y lista para usarse.\\Gracias por utilizar nuestros servicios\nEquipo Lp',function(){
					 location.href = '/';
				});
               
            }
        });
}
/*function que crea el registro del usuario via facebook*/
function regusufb(result) {
	var resultnombre = result.first_name+result.last_name;
    $.get("/ajax.regusufb.php", { fbuid: result.id, email: result.email, nombre: resultnombre  },
        function(data) {
            if (data != "") {
                alertify.alert('Registro.','Su registro ha sido completado con exito.\nSi necesitas una clave en algun momento es esta (' + data + ').\nTe reenviaremos a completar los datos de contacto para que empieces a publicar tus articulos.\n\nGracias por utilizar nuestros servicios\nEquipo LP',function(){
					location.href = '/';
				});
                //clFacebook.doPost(msgreg);
                
            }
        });

}
/*clase que maneja los elementos de facebook*/    
function clFacebook() {
    this.init = function() {
        FB.init({
            appId:  fbappid,
            cookie: true,
            status: true,
            xfbml: true,
			version: 'v2.10'
        });
   };
    /*realiza post en el muro del usuario*/
    this.doPost = function(msg) {
        var msg = msg;
        FB.api(
            '/me/feed',
            'post', {
                message: msg,
                link: 'https://lapulga.com.do',
                picture: 'https://lapulga.com.do/i/logodetalle.png'
            },
            function(response) {}
        );
    };
    /*funcion hace login*/
    this.login = function(idform, callback) {
        var callb = callback;
        var idfor = idform;
        FB.login(function(response) {
            $("#cargando").show();
            if (response.authResponse) {
                FB.api('/me',{locale: 'es_LA', fields: 'id,first_name,last_name,email,verified'}, function(response) {
                    fb.loginestatus();
                    callb(idfor, response);
                });
            } else {
                FB.getLoginStatus(function(response) {
                    if (response.status === 'not_authorized') {
                         alertify.alert('Usted ha hecho login pero no ha autorizado a la pulga, trate nuevamente');
                    } else {
                         alertify.alert('Usted no ha hecho login, trate nuevamente');
                    }
                });
            }
        }, { scope: 'email' });
    };
    this.loginestatus = function() {
        FB.getLoginStatus(function(response) {
            if (response.status === 'connected') {
                var uid = response.authResponse.userID;
                var accessToken = response.authResponse.accessToken;
            } else if (response.status === 'not_authorized') {
                alertify.wAlert('Usted ha hecho login pero no ha autorizado a la pulga, trate nuevamente');
            } else {
                alertify.wAlert('Usted no ha hecho login, trate nuevamente');
            }
        });
    };
    this.callbacklogin = function(idform, result) {
        $("#cargando").hide();
		var nombre = result.first_name+" "+result.last_name;
        if (idform == "frmregistro" || idform == "frmcontacta") {
            var msg = "Me registre en el popular portal La Pulga Virtual usando mi Movil, para compras y ventas en toda la Republica Dominicana, la mas completa, registrate tu tambien http://www.lapulga.com.do/registro, el proceso fue lo mas facil con mi cuenta de Facebook, quede activado y listo para publicar con 3 pines de cortesia que me regalaron para colocar en VIP, mas info de eso en http://ayuda.lapulga.com.do.  Te recomiendo visites su blog en http://blog.lapulga.com.do, hay mucha informacion sobre ventas, seguridad, etc.";
            /*solo entra si estan los campos*/
            if (document.getElementById('dfaltan')) {
                document.getElementById('dfaltan').style.display = 'block';
                document.getElementById('email').value = result.email;
                document.getElementById('email').readOnly = true;
                document.getElementById('nombre').value = nombre;
                document.getElementById('nombre').readOnly = true;
                document.getElementById('fbuid').value = result.id;
                var clave = numerorandom(1000, 9999);
                document.getElementById('password').value = clave;
                document.getElementById('password2').value = clave;
                verusufb(result, idform);
            } else {
                this.doPost(msg);
            }
        }
        if (idform == "frmformularios") {
            document.getElementById('fbuid').value = result.id;
            document.getElementById('fbemail').value = result.email;
            document.getElementById('fbverified').value = result.verified;
            document.getElementById('login').value = result.email;
            document.getElementById('password').value = result.id;
            verusufb(result);
        }
        if (idform == "frmrecuperar") {
            document.getElementById('fbuid').value = result.id;
            document.getElementById('usuario').value = result.email;
            document.getElementById('fbverified').value = result.verified;
            document.frmrecuperar.submit();
        }
    };
};

/* cacula totales compra e productos */
function totalTran(form) {
    var moneda;
    var precio;
    var cantidad;
    //descuento en %
    var descuento;
    var innerTotal;
    var descMeses;
    var renovaciones;
    param = "";
    paramtotal = "";
    switch (form.producto.value) {
        case 'CP':
            moneda = (form.formapago.value == 'PP') ? "US$" : "RD$";
            precio = precioPines;
            cantidad = form.pines.value;
            if (moneda == 'US$') {
                precio = precio / tasadolar;
                precio = precio.toFixed(2);
            }
            param = "tipo=CPcantidad=0";
            paramtotal = "tipo=CP&cantidad=" + cantidad + "&formapago=" + form.formapago.value;
            break;
		// renovaciones simples y multiples
        case 'SR':
        case 'RAM':
            moneda = (form.formapago.value == 'PP') ? "US$" : "RD$";
            precio = (form.producto.value == 'SR') ? precioRenovaciones : precioRam;
            cantidad = form.cantidad.value;
            if (moneda == 'US$') {
                precio = precio / tasadolar;
                precio = precio.toFixed(2);
            }
            param = "tipo=" + form.producto.value + "&cantidad=" + cantidad;
            /* parametro gettotaltran*/
            paramtotal = "tipo=" + form.producto.value + "&cantidad=" + cantidad + "&formapago=" + form.formapago.value;
            break;
        case 'AO':
            moneda = (form.formapago.value == 'PP') ? "US$" : "RD$";
            precio = precioAofertas;
            cantidad = form.cantidad.value;
            if (moneda == 'US$') {
                precio = precio / tasadolar;
                precio = precio.toFixed(2);
            }
            param = "tipo=AO&cantidad=" + cantidad;
            /* parametro gettotaltran*/
            paramtotal = "tipo=AO&cantidad=" + cantidad + "&formapago=" + form.formapago.value;
            break;
            // planes de usuarios
        case 'PU':
            var plan, pines;
            plan = form.plan.value;
            moneda = (form.formapago.value == 'PP') ? "US$" : "RD$";
            pines = (form.plan.value == 'LP') ? PinesLP : PinesLPM;
            /*cantidad de meses*/
            cantidad = form.cantidad.value;
            pines = pines * cantidad;
            plan = encodeURIComponent(form.plan.value);
            param = "tipo=" + plan + "&cantidad=" + cantidad;
            /* pregunta solo si la variable plan no se ha pasado*/
            // if ((plan == 0) && (plansel == 0)) {
                // form.formapago.value = 0;
                // alertify.wAlert('Debe seleccionar su plan para continuar, Gracias.');
                // return false;
            // }
            plan = encodeURIComponent(form.plan.value);
            cantidad = encodeURIComponent(cantidad);
            formapago = encodeURIComponent(form.formapago.value);
            renovaciones = (form.renovaciones.checked) ? encodeURIComponent(form.renovaciones.value) : "N";
            paramtotal = "tipo=" + plan + "&cantidad=" + cantidad + "&formapago=" + formapago + "&renovaciones=" + renovaciones;
            break;
    }
    /* busca descuento por meses aplica solo planes y renovaciones*/
    if (param != "") {
        $.ajax({
            url: ajaxfn.getDescMeses,
            data: param,
            beforeSend: function() {
                $("#cantidad").html("<option value=\"\" selected=\"selected\" >Cargando..</option>");
            },
            type: "GET",
            dataType: 'json',
            success: function(desc) {
                descMeses = " " + "<option value=''>Seleccione</option>" + " ";
                for (i = 1; i <= 12; i++) {
                    descMeses += " " + desc[i] + " ";
                }
                $("#cantidad").html(descMeses);
            },
            error: function(jqXHR, textStatus, errorThrown) {

            }
        });
    }
    // get total tran, aplica para los tres
    if (paramtotal != "") {
        $.ajax({
            url: ajaxfn.getDataTransaccion,
            data: paramtotal,
            beforeSend: function() {
                $("#totalTran").html("<span>Calculando...</span>");
            },
            type: "GET",
            dataType: 'json',
            success: function(tran) {
                tran['TOTAL'] = new Number(tran['TOTAL']);
                tran['SUBTOTAL'] = new Number(tran['SUBTOTAL']);
                tran['DESCUENTO'] = new Number(tran['DESCUENTO']);
                tran['TOTALDESCUENTO'] = new Number(tran['TOTALDESCUENTO']);
                clase = "";
                if (tran['DESCUENTO'] > 0) {
                    innerTotal = "<span class=\"label label-danger\">" + moneda + tran['TOTAL'].formatMoney(2, ".", ",") + "</span>";
                    innerTotal += " (Normal: <span class=\"label label-danger\">" + moneda + tran['SUBTOTAL'].formatMoney(2, ".", ",") + "</span>";
                    innerTotal += " - " + tran['DESCUENTO'] + "%, Ahorras <span class=\"label label-success\">" + moneda + tran['TOTALDESCUENTO'].formatMoney(2, ".", ",") + "</span>)";
                } else {
                    innerTotal = moneda + tran['TOTAL'].formatMoney(2, ".", ",");
                    clase = " class='label label-success' ";
                }
                $("#totalTran").html("<span" + clase + ">" + innerTotal + "</span>");
            }
        });
    }
}


//clase de verificar datos
function Verificar() {
    //clase actual
    var clactual = this;
    /*
     *@desc								funcion que verificar la sintaxis del correo electronico
     *@desc 		valor	:	str:	valor a verificar
     */
    this.email = function(valor) {
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (filter.test(valor))
            return true;
        else
            return false;
    };

    /*
     *@desc								funcion que verificar la sintaxis del nombre de usuario
     *@desc 		valor	:	str:	valor a verificar
     */
    this.usuario = function(valor) {
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (!filter.test(valor))
            return true;
        else
            return false;
    };
};
/* fin clase verificar */

/*  funcion que chquea la syntax del email */
function chequeaEmail(valor) {
    if (verificar.email(valor)) return true;
    else {
        alertify.wAlert("Este no parece se una direcci\u00f3n de email v\u00e1lida, favor verifique:\n\n-Que no tenga espacios\n-Que no tenga una, al final si es mas de uno\n-Que contenga la @.\n\nPara el caso de Emails Alternos debe llevar este formato 'email1@dominio.com, email2@dominio2, email3@dominio.com'\n\nEquipo LP");
        return false;
    }
}
/* cambia categorias y modelos */
function cambia_selects(eS, tipo, eSS) {
    eSS = (eSS != "") ? eSS : "0";
    //REMUEVE LOS ITEMS ACTUALES.
    if (tipo in { "VE": "1", "CE": "1" }) {
        $("#marca").find('option').remove();
        $('#modelo').find('option').remove();
        $("#marca").append("<option value=''>Seleccione marca</option>");
        $('#modelo').append("<option value=''>Seleccione modelo</option>");
        for (marca in arrMarcas[tipo]) {
            $("#marca").append("<option value=" + marca + " " + (marca === eS ? 'selected="selected"' : "") + ">" + arrMarcas[tipo][marca] + "</option>");
        }
        for (modelo in arrModelos[eS]) {
            $('#modelo').append("<option value=" + modelo + " " + (modelo === eSS ? 'selected="selected"' : "") + ">" + arrModelos[eS][modelo] + "</option>");
        }
    } else if (tipo == "BR") {
        /*$("#brprovincia").find('option').remove();*/
        $('#brsector').find('option').remove();
        /* $("#brprovincia").append("<option value='0'>Seleccione provincia</option>");*/
        $('#brsector').append("<option value=''>Seleccione sector</option>");
        /*for(brprovincia in arrProvincias) {
        	 $("#provincia").append("<option value="+brprovincia+" "+(brprovincia === eS ? 'selected="selected"' : "")+">"+arrProvincias[brprovincia]+"</option>");
       } */
        for (sector in arrSectores[eS]) {
            $('#brsector').append("<option value=" + sector + " " + (sector == eSS ? 'selected="selected"' : "") + ">" + arrSectores[eS][sector] + "</option>");
        }
    } else if (tipo == "USU") {
        $('#municipio').find('option').remove();
        $('#provincia').find('option').remove();
        $("#provincia").append("<option value=''>Seleccione</option>");
        $('#municipio').append("<option value='0'>Seleccione</option>");
        for (provincia in arrProvincias) {
            $("#provincia").append("<option value=" + provincia + " " + (provincia == eS ? 'selected="selected"' : "") + ">" + arrProvincias[provincia] + "</option>");
        }
        for (k in arrMunicipios[eS]) {
            $('#municipio').append("<option value=" + k + " "+(k == eSS ? 'selected="selected"' : "") +">" + arrMunicipios[eS][k] + "</option>");
        }

        if ($("#frmpublicaservicio #sector") || $("#frmformularios  #frm").val() == "mc") {
            $('#sector').find('option').remove();
            $("#sector").append("<option value=''>Seleccione</option>");
            for (k in arrSectores[eS]) {
                $('#sector').append("<option value=" + k + " " + (k == vsector ? 'selected="selected"' : "") + ">" + arrSectores[eS][k] + "</option>");
            }
        }
    }
    ordenarSelect('modelo');
    ordenarSelect('marca');
    ordenarSelect('brprovincia');
    ordenarSelect('provincia');
    ordenarSelect('municipio');
    ordenarSelect('brsector');
}
/* activa y desactiva ocultos */
function activaOcultos(elmcambia) {
    var tipo = "";
    //valores predefinidos
    $("#lblprecio").text("Precio.:");
    $("#condicion").removeClass("hide");
    $("#moneda").removeClass("hide");
    $("#tipopub").addClass("hide");
    $("div.form-group").find("#empleoofe , #empleosol").attr("id", "articulo");
    cat = (!$("#fid").length) ? elmcambia.split("-"): '';
    //para ocultar en categorias bienes raices, animales y empleo
    if (cat[0] in { "8": "1", "11": "1", "7": "1" } || elmcambia in { "15-253": "1", "15-252": "1", "15-249": "1", "15-250": "1" }) {
        $("#condicion").addClass("hide");
    }
    //cambia a datos de servicios
    if (elmcambia == "S") {
        $("#datoPub").addClass("hide");
        $("#datoServicio").find("div.form-group").removeClass("hide");
    } else {
        $("#datoPub").removeClass("hide");
        $("#datoServicio").addClass("hide");
    }
    //cambia label de precio e id del campo articulo para los placeolder
    if (elmcambia == "7-240") {
        $("div.form-group").find("#articulo , #empleosol").attr("id", "empleoofe");
        $("#lblprecio").text("Sueldo.:");
    } else if (elmcambia == "7-168") {
        $("div.form-group").find("#articulo , #empleoofe").attr("id", "empleosol");
        $("#precio").val(1);
        $("#moneda").addClass("hide");
    }
    if (elmcambia in { "8-211": "1", "8-76": "1", "8-207": "1", "8-77": "1", "8-80": "1", "8-79": "1", "8-78": "1", "10-129": "1", "10-145": "1", "10-144": "1", "10-280": "1" }) $("#tipopub").removeClass("hide");
    //para ocultar y desocultar divs en tipos
    if (elmcambia in { "4-157": "1", "4-150": "1" }) tipo = "CE";
    //(129: Carros,131: Camiones,132: Camionetas,144: Jeepetas)
    else if (elmcambia in { "10-129": "1", "10-144": "1", "10-145": "1" }) tipo = "VE";
    //(76: Apartamentos,207: Casas- Villas,77: Edificios,80: Solares- Naves - Mejoras)
    else if (elmcambia in { "8-207": "1", "8-77": "1" }) tipo = "IN";
    else if (elmcambia in { "8-76": "1" }) { tipo = "in-app"; } else if (elmcambia in { "8-80": "1" }) { tipo = "in-sfm"; } else if (elmcambia in { "8-211": "1" }) tipo = "in-ap";
	else if (elmcambia == "10-244") { 
		//document.getElementById("lblgoma").innerHTML = "Goma:";
		$("#lblgoma").text("Goma:");
		$("#gomaaro").removeClass("aro");
		$("#gomaaro").unmask();
		$("#gomaaro").addClass("goma");
		tipo = "go";
	}else if (elmcambia == "10-320") { 
		$("#lblgoma").text("Aro:");
		// document.getElementById("lblgoma").innerHTML = "Aro:";
		$("#gomaaro").removeClass("goma");
		$("#gomaaro").unmask();
		$("#gomaaro").addClass("aro");
		tipo = "go";
	} else tipo = elmcambia;
	
	switch (elmcambia) {
        case "PU":
            tipo = "pu";
            break;

        case "CP":
            tipo = "cp";
            break;

        case "SR":
		// renovaciones multiples
        case "RAM":
        case "AO":
            tipo = "sr";
            break;
    }
    //busca elemeto para anadir
    $("div.add").each(function() {
        if ($("div.add").hasClass("s_" + tipo)) {
            $("div.add").addClass("hide");
            $("div.s_" + tipo).removeClass("hide");
            $("div.s_" + tipo).find('select').attr('data-validation', 'required');
        } else {
            $("div.add").addClass("hide");
            $("div.add").find('select').attr('data-validation', false);
        }
    });
    //	setAlertas();
}
// selecccion tipo de datos categoria
function cat_tipo(categoria) {
    cattipo = categoria.split("-");
    var selmarca = "0";
    switch (cattipo[0]) {
        case "4":
            cattipo = "CE";
            break;
        case "10":
            cattipo = "VE";
            break;
        case "8":
            cattipo = "BR";
            break;
        default:
            cattipo = "";
            break;
    }
    $("#datoscategoria").val(cattipo);
    return cattipo;
}
//funcion para odrdenar options select
function ordenarSelect(id_componente) {
    var selectToSort = jQuery('#' + id_componente);
    var optionActual = selectToSort.val();
    selectToSort.html(selectToSort.children('option').sort(function(a, b) {
        return a.text == b.text ? 0 : a.text < b.text ? -1 : 1;
    })).val(optionActual);
}
/* blanquea datos contacto al presionar cancel */
function blanqueacontacto() {
    $.ajax({
        type: "POST",
        url: "/ajax.mlogout.php"
    });
    $("#uid").val("");
    $("#sid").val("");
    $("#login").val("");
    //$("#email").val("");
    $("#nombre").val("");
    $("#telefono1").val("");
    $("#provincia").val("");
    $("#municipio").val("");
    $("#password").val("");
    $("#password2").val("");
    $("#mpassword").val("");
}
/* calcula balance para resaltado y vip en publicar */
function calculaBalance(elemento) {
	var uso = 0;
	if($(elemento).attr("id") in {"opcional":0,"vip":0}) {
		var arrVipvalores = { 'V': 1, 'VC': 1, 'VVC': 2 };
		if (typeof(arrVipvalores[$("#vip").val()]) != 'undefined') vipvalor = Number(arrVipvalores[$("#vip").val()]);
		else vipvalor = 0;
		var opcvalor = ($("#opcional").val() != 'N') ? $("#opcional").val() : 0;
		opcvalor = Number(opcvalor);
		//if (typeof(opcvalor) != 'number') alert('uhmm');
		uso = vipvalor + opcvalor;
	} else if($(elemento).attr("id") == "limitepc") {
		uso = $(elemento).val();
	}
    if (uso > pines) {
        alertify.wAlert('No tienes  pines para VIP o Resaltado, puedes continuar publicando <i class=\"azul fa fa-thumbs-up fa-2x\"></i>');
        $(elemento).val("N").change();
    } else if (uso == 0) $("#balancepines").html(pines);
    else {
        var resta = pines - uso;
        $("#balancepines").html(pines + " - " + uso + " = " + resta);
    }
}
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
// function para prestamos
function mostrarComplemento(tipo) {
    $("div.add").each(function() {
        if ($("div.add").hasClass("s_" + tipo)) {
            $("div.add").addClass("hide");
            $("div.s_" + tipo).removeClass("hide");
        } else {
            $("div.add").addClass("hide");
        }
    });
	
}
/* funcion para colocar valores por defecto de alerta */
function setAlertas() {
    jQuery.each(arrFormAlertas, function(k, v) {
        $("#" + k).attr("oninvalid", 'setCustomValidity("' + v + '")');
        $("#" + k).attr("onchange", "try{setCustomValidity('')}catch(e){}");
    });
}

function parseJSON(data) {
    return jQuery.parseJSON(data);
}
/* *********************** document ready ***************************/
//instanciar la clase que verifica los valores de campos
var verificar = new Verificar();
//instanciar la clase donde estan todos los nombre de los archivos ajax


 /*funcion que se encarga de establecer un limite de caractees en los campos esta funcion
    es dependiente del jquery de formValidator
    */
function maxcarateres(elemento){
	if (document.getElementById(elemento) != null) {
		$('#'+elemento).restrictLength($('#caracteress'));
	}
}
var gomaMask = function (val) {
	len = val.replace(/\//g, '').length;
	var mask = '000/000/000';
		switch(len){
			case 6:
				mask = "00/00/009"; 
				
				break;
			case 7:
				mask = "000/00/009"; break;
			case 8:
				mask = "000/000/009"; break;
		}
	return mask;
},
spOptions = {
  onKeyPress: function(val, e, field, options) {
	  field.mask(gomaMask.apply({}, arguments), options);
	  ponerElCursorAlFinal("gomaaro");
	}
};
var chequeados = 0;
function validaUrlVideo(url) {
	var p = /^(?:https?:\/\/)?(?:www\.)?youtube\.com\/watch\?(?=.*v=((\w|-){11}))(?:\S+)?$/;
	return (url.match(p)) ? RegExp.$1 : false;
}

var fb = new clFacebook();


// file upload IPS 
// validar subida de fotos al preview    
function validarFotos() {
    var fotos = document.getElementById("fotos");
    var imgRuta = fotos.value;
    var extPermitidas = /(.PNG|.png|.jpg|.JPG|.JPEG|.jpeg)$/i;
    var message = "";
    console.log();
    if ('files' in fotos) {
        console.log(fotos.files);
        if (fotos.files.length > fotos.dataset.cantidad) {
                alert('Debes seleccionar ' + fotos.dataset.cantidad + ' imagenes o menos');
        } else {
            if (!extPermitidas.exec(imgRuta)) {
                alert("Solo imagenes JPG o PNG");
            } else {
                if (fotos.files.length ) {
                    previewFotos(fotos);
                }   
            }
        }
    }
}
// funcion que muestra el preview
function previewFotos(fotos) {
    document.getElementById('preview').innerHTML='';
    var total = 0;
    for (let i=0; i < fotos.files.length;i++) {
        let visor = new FileReader();
        var file = fotos.files[i];
        total += fotos.files[i].size;
        visor.onload = function(e) {
            var tamano = fotos.files[i].size / 1024;
            tamano = tamano.toFixed(1);
            document.getElementById('preview').innerHTML +=

                        '<li class="jFiler-item">' +
                            '<div class="jFiler-item-container">' + 
                                '<div class="jFiler-item-thumb">' + 
                                    '<img src="' + e.target.result +'" >' + 
                                '</div>' + 
                                '<div class="jFiler-item-assets jFiler-row">' + 
                                    '<ul class="list-inline pull-left">' + 
                                        '<li>' + tamano + 'kB</li>' + 
                                    '</ul>' +                                 
                                    '<ul class="list-inline pull-right">' + 
                                        '<li><a href="javascript:;" class="text-muted" onclick="borrarPreview('+i+')"><i class="fa fa-trash" aria-hidden="true"></i></a></li>' + 
                                    '</ul>' + 
                                '</div>' + 
                            '</div>' + 
                        '</li>';

        };   
        visor.readAsDataURL(fotos.files[i]);
    } 
    total = total / 1024;
    total = total.toFixed(1);
    document.getElementById('lblfotos').innerHTML='<i class="fa fa-upload" aria-hidden="true"></i> Tienes ' + fotos.files.length + ' foto(s) = ' + total + 'kB' ;
}
/* elmina la una foto del preview */
function borrarPreview(foto) {
    var fotos = document.getElementById("fotos").files; 
    var fileBuffer = new DataTransfer();
    for (let i = 0; i < fotos.length; i++) {
        if (foto !== i) fileBuffer.items.add(fotos[i]);
    }
    document.getElementById("fotos").files = fileBuffer.files;
    $("#preview_" + foto).remove(); 
    previewFotos(document.getElementById("fotos"));
}
// evento onchange




$(document).ready(function() {




	/**Validaciones de formularios**/
	if ($("#frmprestamo").length) validarform('frmprestamo');
	if ($("#frmpublicaservicio").length) validarform('frmpublicaservicio');
	if ($("#frmreporta").length) validarform('frmreporta');
	if ($("#frmalternativas").length) validarform('frmalternativas');
	if ($("#frmpublicar").length) validarform('frmpublicar');
	if ($("#frmpublicarexp").length) validarform('frmpublicarexp');
	if ($("#frmregistro").length) validarform('frmregistro');
	if ($("#frmcontacta").length) validarform('frmcontacta');
	if ($("#frmproductos").length) validarform('frmproductos');
	if ($("#frmformularios").length) validarform('frmformularios');
	if ($("#frmmodificapu").length) validarform('frmmodificapu');
	if ($("#frmeliartinfo").length) validarform('frmeliartinfo');
    if ($("#frmhistorialPublicaciones").length) validarform('frmhistorialPublicaciones');
	if ($("#frmadcomusu").length) validarform('frmadcomusu');
	if ($("#frmadpenalidades").length) validarform('frmadpenalidades');
	if ($("#frmadcmbpalabra").length) validarform('frmadcmbpalabra');
    if ($("#frmdatosplan").length) validarform('frmdatosplan');
    if ($("#frmfinancieras").length) validarform('frmfinancieras');
	/******************************/
	maxcarateres("mensaje");
	maxcarateres("comentario");
	maxcarateres("descripcionme");
	if(usuplan.substr(0,1) == "P") {
		$("#caracteress").parent("label").removeClass("hide");
		maxcarateres("descripcion"); 
	}else if( $("#caracteress").closest("form").attr("id") != "frmmensajeria" ) {
		$("#caracteress").addClass("hide");
	}
	if($("#frmformularios #tipo").length) {
		$("#tipo").change(function() {
			activaOcultos($("#tipo").find('option:selected').val());
		}).change();
		// crea y modifica enlace, seccion
		
		$("#limitepc").change(function() {
			if (validaChequeados("seccion[]") == 0) {
				$(this).val("");
				alertify.wAlert('Debes seleccionar el o los lugares donde se mostrara');
			}
		});
		$('input[name="seccion[]"]').change(function() {
			var cuantos = 0;
			if (chequeados >= 8) cuantos = 4;
			else if ((chequeados > 5) && (chequeados <=7)) cuantos = 3;
			else if ((chequeados > 2) && (chequeados <=5)) cuantos = 2;
			else if (chequeados <= 2) cuantos = 1;
			$("#limitepc option").each(function(k,v) {
				var option = $("option[value='" + k + "']", "#limitepc");
				if (k < cuantos) option.attr("disabled",true);						
				else option.attr("disabled",false);

			});
			if (chequeados == 0) $("#minimopines").text("Debes seleccionar por lo menos uno");
			else $("#minimopines").text("Para esta selecciÃ³n debes usar " + cuantos + " PINES o mÃ¡s");
		}).change();
	}
    //selecciona o llena valores para edicion
    if (typeof(arrPublicar) != 'undefined') {
        $.each(arrPublicar, function(k, v) {
            var t = $("#" + k).prop('tagName');
            if (t == "SELECT") {
                $("#" + k + " option").each(function() {
                    if ($(this).val() == v) {
                        $(this).attr("selected", "selected");
                    }
                });
            } else if (t == "DIV") {
                $("#" + k + " input[type=radio]").each(function() {
                    if ($(this).val() == v) {
                        $(this).attr("checked", "checked");
                    }
                });
            } else if (t == "INPUT" || t == "TEXTAREA") $("#" + k).val(v);
        });
    }
    $("#cargando").hide();
    if ($("#frmformularios, #frmregistro").length && (SITIO ==1)) fb.init();
    var arrCamposRS = { "nombre": "s", "categoria_id": "", "telefono1": "s", "provincia": "", "sector": "", "municipio": "", "direccion": "", "descripcion": "" };
    // control editor
    if ((typeof(usuplan) != 'undefined') && (usuplan.substr(0, 1) in { 'T': 1, 'L': 1 }) && (typeof(CKEDITOR) != 'undefined') && ($("#frmpublicar #descripcion").length > 0)) {
        CKEDITOR.replace('descripcion', {
            language: 'es',
            entities: false,
            entities_latin: false,
            basicEntities: false,
            entities_greek: false,
            entities_latin: false
        });
    }
    /* categoria publicar */
    $("#categoria").change(function() {
        var el1 = "";
        var el2 = "";
        //busca la el valor de la categoria seleccionada en cuando cambia el select
        categoria = $('#categoria').find('option:selected').val();
        $("#articulo").attr("placeholder", "ej. " + arrPlaceholdertitulo[categoria.split("-")[0]]);
        if (categoria == 'S') {
			alertify.wConfirm('El sistema lo enviar\u00e1 el formulario de publicaci\u00f3n de servicios, Desea continuar?',function(){
				location.href = '/publicaservicio';
			},function(){
				alertify.error("Cancelado");
				$("#categoria").val("0");
			})
            
        }
        cattipo = cat_tipo(categoria);
        // tipo empleo
        if (categoria in { "7-240": "1", "7-168": "2" }) $("input:radio[name='tipo'][value ='E']").prop('checked', true);
        else $("input:radio[name='tipo'][value ='V']").prop('checked', true);
        /*si hay un cambio de categoria cuando vienen datos definidos y ese cambio es a CE entonces el valor de selmarca sera 1:APPLE*/

        /*llamado para marcas y modelos*/
        /*captura datos de marca para edicion*/
        if (typeof(arrPublicar) != 'undefined') {
            selmarca = arrPublicar['marca'];
            /*captura datos modelos para edicion*/
            selmodelo = arrPublicar['modelo'];
            provincia = arrPublicar['provincia'];
            sector = arrPublicar['sector'];

            if (cattipo == "BR") {
                el1 = provincia;
                el2 = sector;
            } else {
                el1 = selmarca;
                el2 = selmodelo;
            }
        }
        cambia_selects(el1, cattipo, el2);
        activaOcultos(categoria);
		$("#articulo").focus();
    }).change();
	$('#urlvideo').bind("change keyup input", function() {
		var url = $(this).val();
		if (validaUrlVideo(url) == false) {
			$('#urlvideo').removeClass('valid');
			$('#urlvideo').addClass('error');
			$('#urlvideo').parent("div").removeClass("has-success")
			$('#urlvideo').parent("div").addClass("has-error")
		} else {
			$('#urlvideo').addClass('valid');
			$('#urlvideo').removeClass('error');
			$('#urlvideo').parent("div").addClass("has-success")
			$('#urlvideo').parent("div").removeClass("has-error")
		}
	});

    /*var vmunicipio = 0;*/
    
    /*boton login enel modal*/
    $("#btnlogin").on("click", function(e) {
        if ($("#frmpublogin #login").val() == "") {
            alertify.wAlert("Coloque su Email o Usuario");
            $("#login").focus();
            return false;
        }
        if ($("#frmpublogin #mpassword").val() == "") {
            alertify.wAlert("Coloque su clave para entrar");
            $("#mpassword").focus();
            return false;
        }
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "/ajax.mlogin.php",
            data: $("#frmpublogin").serialize(),
            success: function(msg) {
                JSONdata = parseJSON(msg);
                if (JSONdata['entro'] == 'SI') {
                    if($("#frmregistro").length) {
                        location.href = "/?bnv=" + JSONdata["lp_nombre"];
                    }
                    usulogged = "S";
                    $("#uid, #de").val(JSONdata['lp_uid']);
                    $("#sid").val(JSONdata['lp_session']);
                    $("#email").val(JSONdata['lp_email']);
                    $("#nombre").val(JSONdata['lp_nombre']);
                    $("#nombre").attr("readonly", true);
                    $("#telefono1").val(JSONdata['lp_telefono1']);
                    vmunicipio = JSONdata['lp_municipio'];
                    $("#provincia").val(JSONdata['lp_provincia']);
                    $("#provincia").change();
                    $('#mlogin').modal('hide');
                    $("#mpassword").val("");
				} else if(JSONdata['entro'] == "NO") {	
					alertify.wAlert('Clave incorrecta, si la olvido click el enlace para obtener una.');
                    $("#mpassword").val("");
                    $("#mpassword").focus();
				} else if(JSONdata['entro'] == "R") {
					alertify.wAlert('Cuenta suspendida','Esta cuenta esta suspendida, para mas informacion contacta en <a href="/soporte">soporte</a> Equipo LP');
                } else {
                    alertify.wAlert('Error al entrar','Esta cuenta esa penalizada por <b>' + JSONdata['entro'] + '</b> no puedes hacer login ahora.<br><br>Para mas informacion contacta en <a href="/soporte">soporte</a> Equipo LP');
                }
            },
            error: function() {
                alertify.wAlert("fallo en envio de accesos, trate nuevamente, disculpas");
            }
        });
        return false;
    });
    /*boton cancel del modal*/
    $("#btnlogincancel").on("click", function(e) {
        blanqueacontacto();
        $("#email").val("")
        $("#email").focus();
    });
    /*prueba modal login*/
    $('#frmpublicar #email, #frmregistro #email, #frmcontacta #email').change(function() {
        var email =  this.value;
        if (!chequeaEmail(email)) {
            this.focus();
            /*return false;*/
        }
        $("#camposclave, #camposclave div.form-group").addClass("hide");
        if (($("#login").val() != "") && (email != $("#login").val())) {
            blanqueacontacto();
        }
        if (email != "") {
            $("#nombre").attr("readonly", false);
            var valor = email;
            $.get("/ajax.verificausu.php", { valor: valor },
                function(data) {
                    if (data == 'R') {
                        alertify.eAlert('Estimado usuario:\n\nNo puede realizar publicaciones pongase en contacto con soporte al numero de WhatsApp 829-795-8684 o use el enlace de contacto.\n\nEquipo LP');
                        location.href = '/';
                    } else if (data in { "A": "1", "I": "1" }) {
                        $("#login").val($("#email").val());
                        alertify.alert("La Pulga Virtual te dice:", "   Este correo ya esta registrado, inicia sesiÃ³n con tu contraseÃ±a.");
                        $('#mlogin').modal({ backdrop: 'static', keyboard: false });
                        $("#mpassword").focus();
                    } else if (data == 0) {
                        $("#camposclave, #camposclave div.form-group").removeClass("hide");
                        $("#nombre").focus();
                    }
                });
        }
    });

	/* para formulario resaltar en usuario expreso */
	$("#frmresaltar #montoresaltado").change(function() {
		if ($("#montoresaltado").val() != 0) {
            sleep(500);
			if (confirm('Confirma que son ' + $("#montoresaltado ").find("option:selected").text() + ' dias a resaltar?')) $("#frmresaltar").submit();
			else {
				$("#montoresaltado").val(0);
				return false;
			}	
		} 
		
	});		
       
	$("#sms").click(function() {
		var parametro = this.href.split('/');
		// numero telefonico
		sms = parametro[3];
		// id articulo
		id = parametro[4];
        var ref = "sms:" + sms + "?body=Para entrar, Usuario: " + sms + " clave: " + sms.substring(sms.length-4) + ", en https://www.lapulga.com.do/login.  Para soporte con WhatsApp 829-795-8684. Gracias por usar La Pulga Virtual";
        sleep(500);
		if (confirm('Desea realmente enviar este mensaje?')) {
			this.href=ref;
			$.get("ajax.clicksms.php", {id:id},
				function(data) {});
			return true;
		} else {
			return false;
		}	
	});
	$("#mesexpreso").change(function() {
		location.href='/micuenta?ob=' + $(this).find('option:selected').val();
	});
	$("#admesexpreso").change(function() {
		location.href='/admin.perfilusuario?uid=' + puid + '&ob=' + $(this).find('option:selected').val();
	});
	/* fin cosas expreso */
	
    /*cambia el link de youtube segun titulo*/
    $("#frmpublicar #articulo").change(function() {
        $("#lnkyoutube").attr("href", "http://www.youtube.com/results?search_type=&search_query=" + $("#articulo").val() + "&aq=f");
    });

    /*evita que se escriban caracteres en titulo*/
    $("#articulo").keypress(function(key) {
        if ((key.charCode < 97 || key.charCode > 122) /*letras mayusculas*/
            &&
            (key.charCode < 65 || key.charCode > 90) /*letras minusculas*/
            &&
            (key.charCode < 48 || key.charCode > 57) /*letras minusculas*/
            &&
            (key.charCode != 241) //Ã±
            &&
            (key.charCode != 209) //Ã‘
            &&
            (key.charCode != 32) //espacio
            &&
            (key.charCode != 225) /*Ã¡*/
            &&
            (key.charCode != 233) /*Ã©*/
            &&
            (key.charCode != 237) /*Ã–*/
            &&
            (key.charCode != 243) /*Ã£*/
            &&
            (key.charCode != 250) /*Ã³*/
            &&
            (key.charCode != 193) /*Ãƒ*/
            &&
            (key.charCode != 201) /*Ãƒâ€°*/
            &&
            (key.charCode != 205) /*Ãƒ*/
            &&
            (key.charCode != 211) /*Ãƒâ€œ*/
            &&
            (key.charCode != 218) /*ÃƒÅ¡*/
            &&
            (key.keyCode != 9) /*tab*/
            &&
            (key.keyCode != 8) /*retroceso*/
            &&
            (key.keyCode != 27) /*comilla*/
            &&
            (key.keyCode != 37) /*izquierdo*/
            &&
            (key.keyCode != 34) /*comilla doble*/
            &&
            (key.keyCode != 39) /*comilla simple*/
            &&
            (key.keyCode != 46) /*borrar*/
            &&
            (key.keyCode != 35) /*end*/
            &&
            (key.keyCode != 36) /*home*/
        )
            return false;
    });
    $("#frmpublicar #marca").change(function() {
        selmarca = $("#marca").find('option:selected').val();
        cambia_selects(selmarca, cattipo, selmodelo);
    });
	
    $("#brprovincia").change(function() {
        provincia = $("#brprovincia").find("option:selected").val();
        cambia_selects(provincia, "BR", sector);
    }).change();
	
    $("#opcional").change(function() {
        if ($(this).val() == 'MI') {
            $('#mresaltar').modal();
        } else calculaBalance($(this));
    });
	
    $("#vip").change(function() {
       if ((typeof(filerfiles) != 'undefined') && (filerfiles != null)) confoto = true;
        $("#vip option").each(function() {
            $(this).removeAttr('disabled');
            if (($(this).val() in { 'V': 1, 'VC': 1, 'VVC': 1 }) && (confoto == false)) $(this).attr("disabled", true);

        });
        if ($(this).val() == 'MI') {
            $('#mresaltar').modal();
        }
        calculaBalance($(this));
    }).change();
	
    $("#frmpublicar #provincia, #frmpublicaservicio #provincia, #frmformularios #provincia, #frmregistro #provincia, #frmpublicarexp #provincia").change(function() {
        provincia = $("#provincia").find("option:selected").val();

        sector = "";
        if (typeof(arrPublicar) != 'undefined') {
            if (arrPublicar['provincia'] > 0) {
                provincia = arrPublicar['provincia'];
                vmunicipio = arrPublicar['municipio'];
                sector = arrPublicar['sector'];
            } //else alert("no esta el arrPublicar, agregalo");
        }
        cambia_selects(provincia, "USU",vmunicipio);
    }).change();
    
    // publicar y subir fotos
    //const inputFotos = document.getElementById("fotos");
    //inputFotos.addEventListener("change", validarFotos, false);
    $(document).on('change', '#fotos', validarFotos);	
    // fin subir fotos


	$("#limitepc").change(function(){
		calculaBalance($(this));
	});
   
    /*tipo de producto en frmproductos pines, planes, renovaciones*/
    $("#producto").change(function() {
        producto = $("#producto").find("option:selected").val();
        activaOcultos(producto);
        $("#frmproductos #pines, #frmproductos #cantidad, #frmproductos #plan, #frmproductos #formapago").val("");
        totalTran(document.frmproductos);
    }).change();
	
    $("#frmproductos #pines, #frmproductos #plan, #frmproductos #formapago, #frmproductos #cantidad, #frmproductos #renovaciones").change(function() {
        if ($("#producto").find("option:selected").val() == "") {
            alertify.wAlert('Debes elejir tipo de producto');
            this.value = "";
        } else {
            totalTran(document.frmproductos);
        }
    });
	
    //var arrInfoPlanes = {"DV2":"a,b,c,d","DV3":"f,g,h,i"};
    $("#plan").change(function() {
        var x = $("#plan").find("option:selected").val();
        if (x != "0") {
            m = arrInfoPlanes[x].split(',');
            var ul = document.createElement("ul");
            for (var i = 0; i < m.length; i++) {
                var li = document.createElement("li");
                li.innerHTML = m[i];
                ul.append(li);
            }
            $("#planinfo").html("<h5><b>Este plan incluye:</b></h5>");
            $("#planinfo").append(ul);
			$("#renovaciones").attr("readonly",true);
			$("#renovaciones").attr("checked",true);
			/*
			-verificar si es plan 2 para ocultar renovaciones y marcar selecciondo
			-asignar valor de 0 a renovaciones para no aumentar el total
			*/
			
        } else $("#planinfo").html("");
    });
    // cambia el valor del plan si es difrente de 0
    if ((typeof(plansel) != 'undefined') && (plansel != 0)) $("[name=plan]").val(plansel);

    /*  cosas prestamos */
    $("#frmprestamo #valor").blur(function() {
        $("#preguntas").removeClass("hide");
    });
	
    $("#frmprestamo #tipo").change(function() {

        var x = $("#tipo").find("option:selected").val();
        $("div.add").each(function() {
            if ($(this).hasClass("s_" + x)) {
                $(this).find("[type=radio]").attr("required", true);
            } else {
                $(this).find("[type=radio]").attr("required", false);
            }
        });
        if (x == 0) return null;
        $("#tipoinfo").attr("placeholder", arrTipoinfo[x]['placeholder']);
        $("#valor").attr("placeholder", arrTipoinfo[x]['valor']);
        mostrarComplemento(x);
    });
	
    $("#frmprestamo input[type=radio]").change(function() {
        if ($("#radio1_2").is(':checked')) {
            $(".p2 input[type=radio]").attr('required', false)
            $(".p2").hide();
        } else {
            $(".p2").show();
            $(".p2 input[type=radio]").attr('required', true);
        }
    });
	
    $("#frmprestamo #email").change(function() {
        if (!chequeaEmail(this.value)) {
            this.focus();
        }
    });
	
    $("#frmmanejaenlace #tipo").change(function() {
        activaOcultos($("#tipo").find("option:selected").val());
    });
    /*  implementaciones */
    /* mas para los forms */
    jQuery(function($) {
        $('.masktel').mask("(999) 999-9999");
        $('.masktelext').mask("(999) 999-9999? x99999");
        $('.maskced').mask("999-9999999-9");
        $('.maskalpha').alphanumeric({ allow: ". " });
        $('.masknomtienda').alphanumeric({ allow: " " });
        $('.masktitulo').alphanumeric({ allow: ",.)($%@#/ " });
        $('.maskusuario').alphanumeric({ allow: "._-@" });
        $('.maskint').numeric({ allow: "." });
        $('.maskfloat').numeric({ allow: "." });
        $('#email').alphanumeric({ allow: "@._-" });
        $('#phoneext').mask("(999) 999-9999? x99999");
        $('.gomas').mask("999/999/999");
        $("#tin").mask("99-9999999");
        $(".fecha").mask("99/99/9999");
        $("#ssn").mask("999-99-9999");
        $("#eyescript").mask("~9.99 ~9.99 999");
		$('.goma').mask(gomaMask, spOptions);
		$('.aro').mask("R00/0H");
    });
    /* fin mask */
   
    jQuery.each(arrPlaceholders, function(k, v) { $("#" + k).attr("placeholder", v); });
	$.each(arrFormAlertas, function(k, v) {
		$("#" + k).attr("data-validation-error-msg", v);
	});
	
	/*Otras validaciones para campos*/
	if($("#password").length > 0) {
		var $pass = $("#password");
		$pass.attr("data-validation","length required ")
		$pass.attr("data-validation-length","min4");
		if($("#password2").length > 0) {
			var $pass2 = $("#password2");
			$("#password, #password2").bind("keyup paste change focus blur", function() {
				if(($pass2.val() != "") && ($pass.val() == $pass2.val())){
					$pass2.parent().removeClass("has-error");
					$pass2.removeClass("error");
					$pass2.parent().addClass("has-success");
					$pass2.addClass("valid");
                } else {
                    console.log($pass.val()+"  " + $pass2.val() );
					$pass2.parent().removeClass("has-success");
					$pass2.removeClass("valid");
					$pass2.parent().addClass("has-error");
					$pass2.addClass("error");
        		}
		});
	}
}
		
	// function justNumbers(e)
        // {
        // var keynum = window.event ? window.event.keyCode : e.which;
        // if ((keynum == 8) || (keynum == 46))
        // return true;
         
        // return /\d/.test(String.fromCharCode(keynum));
        // }
	if($("#precio1").length > 0) {
		$precio = $("#precio");
		$precio.attr("data-validation","length required ")
		$precio.attr("data-validation-length","max8");
		$("#precio").bind("keyup paste change blur", function() {
			if (($("#precio").val() <= 0) || ($("#precio").val().length > 8)) {
				$precio.parent().removeClass("has-success");
				$precio.removeClass("valid");
				$precio.parent().addClass("has-error");
				$precio.addClass("error");
			} else {
				$precio.parent().removeClass("has-error");
				$precio.removeClass("error");
				$precio.parent().addClass("has-success");
				$precio.addClass("valid");
			}
		})
		$('#precio').keypress(function(tecla) {
			switch(tecla.key) {
				case '0':
				case '1':
				case '2':
				case '3':
				case '4':
				case '5':
				case '6':
				case '7':
				case '8':
				case '9':
				case 'Backspace':
				case 'ArrowLeft':
				case 'ArrowRight':
				case 'ArrowUp':
				case 'ArrowDown':
                case 'Delete':
                case '.':
					return true;
				break;
				default:
					return false;
				break;
			}
		});
	}
	if($("#telefono1").length > 0) {
		$telefono1 = $("#telefono1");
		$telefono1.attr("data-validation","length required ");
		$telefono1.attr("data-validation-length","min14");
		$("#telefono1").bind("keyup paste change", function() {
			var codigoArea = $telefono1.val().substring(1,4);
			if(codigoArea in {"809":1, "829":1,"849":1}) {
				$telefono1.parent().removeClass("has-error");
				$telefono1.removeClass("error");
				$telefono1.parent().addClass("has-success");
				$telefono1.addClass("valid");
			} else {
				$telefono1.parent().removeClass("has-success");
				$telefono1.removeClass("valid");
				$telefono1.parent().addClass("has-error");
				$telefono1.addClass("error");
			}
		});
	}
	if($("#gomaaro").length > 0) {
		$("#gomaaro").bind("keyup", function() {
			ponerElCursorAlFinal("gomaaro");
		});
	}
	/* completa titulo con marcas y algunos select al cambiar */
	if($("#articulo").length > 0 && $("#articulo").val() == "") {
		$("#frmpublicar select").change(function() {
			var id = this.value.split('-');
			var idcategoria = id[0];
			var idsubcategoria = id[1];
			var textArticulo = "";
			var valorSelect = "";
			
			switch(idcategoria) {
				// celulares
				case '4':
					if(idsubcategoria in {'150':1,'157':1}) {
						$("#marca, #modelo").change(function(e) {
							valorSelect = "";
							var marca = ($("#marca").find("option:selected").val() != 0) ? $("#marca").find("option:selected").text() : "";
							var modelo = ($("#modelo").find("option:selected").val() != 0) ?$("#modelo").find("option:selected").text() : "";
							valorSelect = marca+" "+modelo; 
							$("#articulo").val(valorSelect);
						})
					}
					break;
				/* vehiculos */
				case '10':
					if(idsubcategoria in {'129':1,'144':1,'145':1}) {
						$("#marca, #modelo, #anio, #combustible").change(function(e) {
							valorSelect = "";
							var marca = ($("#marca").find("option:selected").val() != 0) ? $("#marca").find("option:selected").text() : "";
							var modelo = ($("#modelo").find("option:selected").val() != 0) ?$("#modelo").find("option:selected").text() : "";
							var anio = ($("#anio").find("option:selected").val() != 0) ? $("#anio").find("option:selected").text() : "";
							var combustible = ($("#combustible").find("option:selected").val() != 0) ? $("#combustible").find("option:selected").text() : "";
							valorSelect = marca+" "+modelo+" "+anio+" "+combustible; 
							$("#articulo").val(valorSelect);
						})
					}
					break;
				/* bienes raices */
				case '8':
					$("#brprovincia, #brsector, #habitaciones,#banos,#parqueos,#mconstruidos,#mterreno").change(function(e) {
						valorSelect = "";
						var brprovincia = ($("#brprovincia").find("option:selected").val() != 0) ? $("#brprovincia").find("option:selected").text() : "";
						var brsector = ($("#brsector").find("option:selected").val() != 0) ?$("#brsector").find("option:selected").text() : "";
						var habitaciones = ($("#habitaciones").find("option:selected").val() != 0) ?$("#habitaciones").find("option:selected").text() : "";
						var banos = ($("#banos").find("option:selected").val() != 0) ?$("#banos").find("option:selected").text() : "";
						var parqueos = ($("#parqueos").find("option:selected").val() != 0) ?$("#parqueos").find("option:selected").text() : "";
						var mconstruidos = ($("#mconstruidos").find("option:selected").val() != 0) ?$("#mconstruidos").find("option:selected").text() : "";
						var mterreno = ($("#mterreno").find("option:selected").val() != 0) ?$("#mterreno").find("option:selected").text() : "";
						if(idsubcategoria == '211') {
							$("#articulo").attr('placeholder',"Escbribe las palabras aparta estudio o habitacion para auto completar");
							valorSelect = " en "+brprovincia+" en sector "+brsector; 
						} else if(idsubcategoria == '76') {
							valorSelect ="Apartamento en sector " + brsector + " " + habitaciones + " habitaciones " + parqueos + " parqueos" ; 
							$("#articulo").val(valorSelect);
						} else if(idsubcategoria == '207') {
							$("#articulo").attr('placeholder',"Escbribe la palabra casa o villa para auto completar");
							valorSelect =" en sector " + brsector + " " + habitaciones + " habitaciones " + parqueos + " parqueos" ; 
						}
						$("#articulo").on('keyup',function() {
							textArticulo = this.value;
							if(textArticulo.toLowerCase() in { "aparta estudio":1, "habitacion":1, "casa":1,"villa":1} ) {
								textArticulo += valorSelect;
								$("#articulo").val(textArticulo);
							}
						})
					})
					break;
			}
		});
    }
    $(".col-xs-12:has(#Enviar)").css("padding", "0px");
    
});