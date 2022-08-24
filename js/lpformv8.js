var gauth2="juan";
var balancePines=0;
var teclaAnterior = "";


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

// funcion para controlar los multiplesespacios en la descripcin
function multiplesp(event) {
    teclaAnterior = teclaAnterior + " " + event.keyCode;
    var arregloTA = teclaAnterior.split(" ");
    if (event.keyCode == 32 && arregloTA[arregloTA.length - 2] == 32) {
        event.preventDefault();
    }
}

//funcion para odrdenar options select
function ordenarSelect(elemento) {
    var selectToSort = jQuery('#' + elemento);
    var optionActual = selectToSort.val();
    selectToSort.html(selectToSort.children('option').sort(function(a, b) {
        return a.text == b.text ? 0 : a.text < b.text ? -1 : 1;
    })).val();
}

/* cambia categorias y modelos */
function cambiaSelects(eS, tipo, eSS) {
    /*
    eS = parent
    eSS = child
    */
    eSS = (eSS != "") ? eSS : "0";
    
    if (tipo in { "VE": "1", "CE": "1" }) {
        //REMUEVE LOS ITEMS ACTUALES.
        $('#modelo').find('option').remove();
        $('#modelo').append("<option value=''>Seleccione modelo</option>");
        for (modelo in arrModelos[eS]) {
            $('#modelo').append("<option value=" + modelo + " " + (modelo === eSS ? 'selected="selected"' : "") + ">" + arrModelos[eS][modelo] + "</option>");
        }
    } else if (tipo == "BR") {
        $('#sector').find('option').remove();
        $('#sector').append("<option value=''>Seleccione sector o municipio</option>");
        for (sector in arrSectores[eS]) {
            $('#sector').append("<option value='" + sector + "' " + (sector == eSS ? 'selected="selected"' : "") + ">" + arrSectores[eS][sector] + "</option>");
        }
    // opciones de mi cuenta
    } else if (tipo == "USU") {
        $('#municipio').find('option').remove();
        $('#municipio').append("<option value='0'>Seleccione</option>");
        for (k in arrMunicipios[eS]) {
            $('#municipio').append("<option value=" + k + " "+(k == eSS ? 'selected="selected"' : "") +">" + arrMunicipios[eS][k] + "</option>");
        }
    }
}
// funcion que retorna los options de cantidad con descuentos por tipo
function optionTipo(tipo) {
    $.ajax({
        url: "/json.descmeses.php",
        data: "tipo=" + tipo,
        beforeSend: function() {
            $('#cantidad').find('option').remove();
            $("#cantidad").html("<option value=\"\" selected=\"selected\" >Cargando..</option>");
        },
        type: "GET",
        dataType: 'json',
        success: function(desc) {
            descMeses = " " + "<option value='' selected>Seleccione</option>" + " ";
            for (i = 1; i <= ((tipo == "CP") ? 100 : 12); i++) {
                descMeses += " " + desc[i] + " ";
            }
            $("#cantidad").html(descMeses);
        },
        error: function(jqXHR, textStatus, errorThrown) {

        }
    });
}
/* cacula totales compra e productos */
function totalTran(form) {

    moneda = (form.formapago.value == 'PP') ? "US$" : "RD$";
    // valores para parametro
    producto = encodeURIComponent(form.producto.value);
    cantidad = encodeURIComponent(form.cantidad.value);
    formapago = encodeURIComponent(form.formapago.value);
    paramtotal = "producto=" + producto + "&cantidad=" + cantidad + "&formapago=" + formapago;
    // get total tran, aplica para los tres
    if (paramtotal != "") {
        $.ajax({
            url: "/json.datatransaccion.php",
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
                    innerTotal = "<span class=\"text-danger\">" + moneda + tran['TOTAL'].formatMoney(2, ".", ",") + "</span>";
                    innerTotal += " (Regular: <span class=\"text-danger\">" + moneda + tran['SUBTOTAL'].formatMoney(2, ".", ",") + "</span>";
                    innerTotal += " - " + tran['DESCUENTO'] + "%, Ahorras <span class=\"text-success\">" + moneda + tran['TOTALDESCUENTO'].formatMoney(2, ".", ",") + "</span>)";
                } else {
                    innerTotal = moneda + tran['TOTAL'].formatMoney(2, ".", ",");
                    clase = " class='text-success' ";
                }
                $("#totalTran").html("<span" + clase + ">" + innerTotal + "</span>");
            }
        });
    }
}
/*
    *@desc	funcion que verificar la sintaxis del correo electronico
    *@desc 		valor	:	str:	valor a verificar
    */
function validaEmail(valor) {
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (filter.test(valor))
        return true;
    else
        return false;
}
/*
    *@desc	funcion que hacer el login con google

*/
function onSuccessgoogle(profile) {
    if (profile.getEmail() != null) {
        $.get(ajaxfn.veriusu, { valor: profile.getEmail() },
            function(data) {
                if (data == 'R') {
                    alert('Estimado usuario:\n\nNo puede ingresar con esta cuenta por el momento, pongase en contacto con soporte.\n\nEquipo LP');
                    location.href='/soporte';                           
                } else if (data == 'A') {
                    $("#frmlogin #login").val(profile.getEmail());
                    $("#frmlogin #password").val(profile.getId());
                    $("#frmlogin #oauthid").val(profile.getId());
                    $("#frmlogin #oauthtipo").val("Google");
                    var auth2 = gapi.auth2.getAuthInstance();
                    auth2.signOut();                                        
                    $("#Enviar").click();
                } else if (data == 'I') {
                    alert("Cuenta Inactiva\nFavor reenvie el email de activacion\nEquipo LP.");
                    location.href="/emailactivacion";
                } else if (data == 0) {
                    alert("Este EMAIL no esta registrado, favor cree su cuenta en menos de un minuto\nEquipo LP");
                    location.href="/registro";
                }
        });        

    } else {
        alert("Cuenta no puede ser verificada, trate hacer login de forma normal.");
    }
    // console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
    // console.log('Name: ' + profile.getName());
    // console.log('Image URL: ' + profile.getImageUrl());
    // console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
}

/* inicia plataforma signin google */
function initG() {
    gapi.load('auth2', function() {
        auth2 = gapi.auth2.init({
             client_id: '623350563425-oliv51d36de44vei3tpoi124uchkbi6u.apps.googleusercontent.com'    
        });
    });
}

/* hizo login con facebook */
function onSuccessfacebook(response) {
    if (response.status === 'connected') {
        FB.api('/me?fields=email,name', function (response) {
            if (response.email != null) {
                $.get("/ajax.verificausu.php", { valor: response.email },
                    function(data) {
                        if (data == 'R') {
                            alert('Estimado usuario:\n\nNo puede ingresar con esta cuenta por el momento, pongase en contacto con soporte.\n\nEquipo LP');
                            location.href='/soporte';                           
                        } else if (data == 'A') {
                            $("#frmlogin #login").val(response.email);
                            $("#frmlogin #password").val(response.id);
                            $("#frmlogin #oauthid").val(response.id);
                            $("#frmlogin #oauthtipo").val("FaceBook");
                            $("#Enviar").click();
                        } else if (data == 'I') {
                            alert("Cuenta Inactiva\nFavor activar reenvie el email de activacion\nEquipo LP.");
                            location.href="/emailactivacion";
                        } else if (data == 0) {
                            alert("Este EMAIL no esta registrado, favor cree su cuenta en menos de un minuto\nEquipo LP");
                            location.href="/registro";
                        }
                });        
        
            } else {
                alert("Cuenta no puede ser verificada, trate hacer login de forma normal.");
            }            
        });
    } else {
        // The person is not logged into your app or we are unable to tell.
        document.getElementById('status').innerHTML = 'Please log ' +
          'into this app.';
    }
}

// callback funcion luego de sign in de google
function signInG(codigo) {
    auth2 = gapi.auth2.getAuthInstance();
    if (auth2.isSignedIn.get()) {
        auth2.currentUser.listen(function(){
             var profile = auth2.currentUser.get().getBasicProfile();
             onSuccessgoogle(profile);
        });
    }  else {
        alert('Favor seleccione la cuenta a utilizar');
        $("#signinG").click();
    }
}

// mascara de las gomas 
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
/* fin funciones */



$(document).ready(function() {


    $("body").keydown(function(key) {
        if (key.which == 113) { // F2 key
            $("#Enviar").click();
            alert("testing");
        }
    });

    // custom boton login con google 
    $(".go-btn").click(function() {
        auth2 = gapi.auth2.getAuthInstance();
        auth2.grantOfflineAccess().then(signInG);
    });
    // custom boton login con facebook
    $(".fb-btn").click(function() {
        FB.login(function(response) {
            onSuccessfacebook(response);          
        }, {scope: 'public_profile,email'});
    });
        
    $('.phone_us').mask('(000) 000-0000');
    $('.maskdesc').mask('00');
    $('.date').mask('00/00/0000');
    $('.money').mask('0000000000', {reverse: true});
    $('.goma').mask(gomaMask, spOptions);
    $('.aro').mask("R00/0H");
    // formulario publicar
    $("#categoria").change(function() {
        categoria = this.value.split("-");
        if (categoria[0] == 8) $("#tipo").show();
        else $("#tipo").hide();
        // caso vehiculos para marcar inicial        
        if (categoria[1] in {"129": "1", "144":"1","130":"1","145":"1"}) {
            $("#precioini").show(300);
        } else { $("#precioini").hide(300); }
        // caso animales
        if (categoria[0] == 11) {
            $("#condicion").hide();
            $('input[name="condicion"]').removeAttr("required");
        } else {
            $("#condicion").show();          
            $('input[name="condicion"]').attr("required", true);
        }
        // caso campo para aros y gomas
        if (this.value == "10-244") { 
            // gomas
            $("#gomaaro").attr("placeholder","Formato 999/99/99 ej. 255/60/14");
            $("#fldgomaaro").show("slow");
            $("#gomaaro").removeClass("aro");
            $("#gomaaro").unmask();
            $("#gomaaro").addClass("goma");
            $('input[name="gomaaro"]').attr("required", true);
        } else if (this.value == "10-320") { 
            // aros
            $("#fldgomaaro").show("slow");
            $("#gomaaro").attr("placeholder","Formato R00/0H ej. R17/5h aro / hoyos");
            $("#gomaaro").removeClass("goma");
            $("#gomaaro").unmask();
            $("#gomaaro").addClass("aro");
            $('input[name="gomaaro"]').attr("required", true);
        } else {
            $("#fldgomaaro").hide();
            $('input[name="gomaaro"]').removeAttr("required");
        }



    }).change();
    //  para el caso de edicion y ya hay valor
	if($("#gomaaro").length > 0) {
		$("#gomaaro").bind("keyup", function() {
			ponerElCursorAlFinal("gomaaro");
		});
	}



	/* click info cotejo precio inicial */
	$(".infprecioini").click(function() {
		alertify.alert('Precio inicial', 'Utiliza este cotejo para marcar tu precio como inicial, este no aplica para todas las categorias, Equipo LP. ');
	});    
    /*cambia el link de youtube segun titulo*/
    $("#frmformularios #articulo").change(function() {
        $("#lnkyoutube").attr("href", "http://www.youtube.com/results?search_type=&search_query=" + $("#articulo").val() + "&aq=f");
    });
    // formulario complementos
    $("#marca").change(function() {
        cambiaSelects($("#marca").find('option:selected').val(), $("#tipocomp").val() , $("#selmodelo").val());
    }).change();

    $("#frmformularios #provincia").change(function() {
        cambiaSelects($("#provincia").find("option:selected").val(), "BR", $("#selsector").val());
    }).change();

    $("#frmmicuenta #provincia").change(function() {
        cambiaSelects($("#provincia").find("option:selected").val(), "USU", $("#municipio").val());
    }).change();

    // formulario productos
    $("#producto").change(function() {
        optionTipo(this.value);
        $("#cantidad, #formapago").val("");
        if (this.value != '') {
            $("#divincluye").show();
            //incluyeProducto(this.value);
        } else $("#listaincluye").hide();
        // mostrar infoProducto usando arreglo arrInfoproductos
        x = this.value;
        if (x != 0) {
            $("#divinfoproductos").show('slow');
            
            m = arrInfoproductos[x].split('|');
            var ul = document.createElement("ul");
            for (var i = 0; i < m.length; i++) {
                var li = document.createElement("li");
                li.innerHTML = m[i];
                ul.append(li);
            }
            $("#infoproductos").html("<h6><b>Informaci&oacute;n adicional:</b></h6>");
            $("#infoproductos").append(ul);

        } else $("#divinfoproductos").hide('slow');

    }).change();
    $("#cantidad, #formapago").change(function() {
        if ($("#formapago").val() == "PP") {
            $("#transaccion").val("Pago automatico via PP");
            $("#detalles").hide();
        } else {
            $("#detalles").show();
            $("#transaccion").val("");
        }
        if ($("#producto").find("option:selected").val() == "") {
            alertify.alert('Adquiere Producto','Debes seleccionar tipo de producto');
            this.value = "";
        } else {
            totalTran(document.frmproducto);
        }
    });
    // formulario soporte
    $("#areadeinteres").change(function() {
        if (this.value == "retiro_cuenta") $("#comentario").attr("placeholder","Favor colocar las razones para cerrar su cuenta");
        else $("#comentario").attr("placeholder","Favor colocar algun comentario");
    }).change();
    // formulario modal descuento
    $("#frmdescuento #formaprecio").change(function() {
        if (this.value == "P") {
            $("#campodescuento").show("slow");
            $("#lbldescuento").text("% Descuento");
            $("#precio2").attr({
                "max" : 99,        
                "min" : 1          
             });
        } else if (this.value == "V") { 
            $("#campodescuento").show("slow");
            $("#lbldescuento").text("Nuevo Precio");
            $("#precio2").attr({
                "max" : 999999999,        
                "min" : 1          
            });
        } else {
            $("#campodescuento").hide("slow");
        }
    }).change();
    // campo precio 2
    // formulario registro
    $("#frmregistro #email").change(function() {
        if (this.value != "") {
            if (validaEmail(this.value)) {
                var valor = this.value;
                $.get("/ajax.verificausu.php", { valor: valor },
                    function(data) {
                        if (data == 'R') {
                            alert('Estimado usuario:\n\nNo puede registrar su cuenta por el momento, pongase en contacto con soporte.\n\nEquipo LP');
                            location.href='/soporte';                           
                        } else if (data == 'A') {
                            alert("Este EMAIL ya esta Registrado\nFavor hacer login, si olvido su clave click en la opcion\nEquipo LP");
                            location.href="/login";
                        } else if (data == 'I') {
                            alert("Este EMAIL ya esta Registrado\nFavor activar la cuenta reenvie el email de activacion\nEquipo LP.");
                            location.href="/emailactivacion";
                        } else if (data == 0) {
                            $("#provincia").focus();
                        }
                });

            }

        }

    });
    // formulario publicar edicion
    //selecciona o llena valores para edicion
    if (typeof(arrRegistro) != 'undefined') {
        $.each(arrRegistro, function(k, v) {
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
                $("#" + k + " input[type=checkbox]").each(function() {
                    if ($(this).val() == v) {
                        $(this).attr("checked", "checked");
                    }
                });
            } else if (t == "INPUT" || t == "TEXTAREA") {
                if (k != 'fotos') $("#" + k).val(v);
            }
        });
    }
    // usado en faq
    if ($("#ayudaFaq").length) {
        var id = document.location.hash;
        id = id.split("-");
        $(document.location.hash).click();
        $("#desc" + id[1]).addClass("alert-primary");
    }    
    // logout
    $("#logout").click(function () {
       // var auth2 = gapi.auth2.getAuthInstance();
        //auth2.signOut();                                        
    });


    /* formulario modal motivo eliminacion publicacion */
    $("#frmmotivoep").submit(function(e) {
        e.preventDefault();
        if (!validaChequeados("motivo")) {
            alertify.alert("Error", "Debes seleccionar un motivo para continuar");
            return;
        }
        // fue marcada como vendida
        if (this.vendida.checked) elIdfn.accion = "V";
        alertify.confirm('Eliminar.: "' + elIdfn.articulo + '"','Esta seguro?',function() {
			$.ajax({
                url: ajaxfn.ppub,
                type: "GET",
                data:({id:elIdfn.id,uid:elIdfn.uid,accion:elIdfn.accion}),
                success: function(data) {
                    // si cambio registro en ppub
                    if (data == 1) {
                        $.ajax({
                            type: "POST",
                            url: "/motivoep", 
                            data: $("#frmmotivoep").serialize(),
                            success: function(data) {
                                $("#mmotivoep").modal('hide');
                            }
                        });
                        $("#pub"+elIdfn.id).addClass("descrece");
                        setTimeout(function(){$("#pub"+elIdfn.id).hide();}, 500);
                        alertify.success('Se ha eliminado su publicacion');                            
                    } else alertify.error('No pudo ser eliminada, trate nuevamente');
                }
			});            

        },function(){
            $("#mmotivoep").modal('hide');
            alertify.error('Accion Cancelada');
        });  
        
        return false;
    });
    /* formulario modal msgarticulo enviado en los detalles al whatsapp del vendedor */
    $("#frmmsgarticulo").submit(function(e) {
        e.preventDefault();
        if ((this.nombre.value == "") || (this.telefono.value == "")) return;
        $.ajax({
            type: "POST",
            url: "/msgarticulo", 
            data: $("#frmmsgarticulo").serialize(),
            success: function(data) {
                $("#mmsgarticulo").modal('hide');
                arrCampos = {};
                $.each($("#frmmsgarticulo :input").serializeArray(), function(i, campo) {
                    arrCampos[campo.name] = campo.value;
                });
                location.href='https://wa.me/1' + arrCampos['telefonows'] + '?text=' + arrCampos['mensaje'];
            },
            error: function(e) {
                alertify.alert("La Pulga Virtual","Ocurrio un error inesperado, trate nuevamente, disculpas");
            }
        });
        return false;
    }); 

    // limite para frm anclar
    $("#frmanclarpub #limite").change(function(e) {
        var pines = 0;
        // calcula cantidad de pines a sar
        pines = balancePines - this.value;
        $("#Enviaranclarfrm").attr("disabled",(this.value > balancePines));
        if (this.value > balancePines) {
            alertify.alert("PINES insuficientes","Su balance (" + balancePines + ") en PINES no es suficiente (" + (this.value) + "), debe adquirir mas o seleccionar lo que le queda (" + balancePines + ").  Si desea ir <a href='/productos'>click aqui</a>");
            this.value = "";
            pines = balancePines;
        }
        $("#frmanclarpub #lblbalance").text(pines);

    });
    // limite para frm resltar
    $("#frmresaltar #resaltado, #frmresaltar #vip").change(function(e) {
        var pines = 0;
        var resaltado = parseInt(document.frmresaltar.resaltado.value,10);
        if (isNaN(resaltado)) resaltado = 0;
        var vip = document.frmresaltar.vip.value;
        if (vip == "V")  vip = 1;
        else if (vip == "VC")  vip = 1;
        else if (vip == "VVC")  vip = 2;
        else vip = 0;
        vip = parseInt(vip,10);
        // calcula cantidad de pines a usar
        pines = (balancePines - (resaltado + vip));
        // deshabilita boton aplicar
        $("#Enviarresaltarfrm").attr("disabled",(pines < 0));
        if (pines < 0) {
            $("#resaltado, #vip").val("");
            alertify.alert("PINES insuficientes","Su balance (" + balancePines + ") en PINES no es suficiente (" + (resaltado + vip) + "), debe adquirir mas o seleccionar lo que le queda  (" + balancePines + ").  Si desea ir <a href='/productos'>click aqui</a>");
            pines = balancePines;
        }
        $("#frmresaltar #relblbalance").text(pines);

    }).change();
    /* formulario modal anclarpub en mi pulga */
    $("#frmanclarpub").submit(function(e) {
        e.preventDefault();
        if (this.limite.value == "") return;
        alertify.confirm('Anclar publicacion','Esta todo correcto?',function() {
            $.ajax({
                type: "POST",
                url: "/anclarpub", 
                data: $("#frmanclarpub").serialize(),
                success: function(data) {
                    $("#manclarpub").modal('hide');
                    alertify.success("Publicacion anclada correctamente");
                },
                error: function(e) {
                    
                    alertify.alert("Ocurrio un error inesperado, trate nuevamente, disculpas");
                }
            });
        } ,  function() {
            alertify.error("Accion cancelada..");
        });
        return false;
    });    
    /* formulario agregar descuento a publicacion individual de usuarios in planes en mi pulga */
    $("#frmdescuento").submit(function(e) {
        e.preventDefault();
        if ($("#frmdescuento #formaprecio").val() == "") {
            alertify.alert("Descuento","Debes seleccionar la forma de descuento");
            return false;
        }
        if (($("#formaprecio").val() == 'V') && ($("#precio2").val() >= $("#precioactual").val())) {
            alertify.alert("Descuentos","El descuento debe ser menor a precio original, favor revisar");
            $("#precio2").focus();
            return false;
        }
        if ($("#frmdescuento #formaprecio").val() == "P") {
            if ($("#precio2").val() > 99) {
                alertify.alert("Descuentos","% No puede ser mayor de 99");
                $("#precio2").focus();
                return false;
            }
        }
        if ($("#dias").val() == "") return false;
        if ($("#precio2").val() == "") return false;
        alertify.confirm('Aplicar Descuento','Esta todo correcto?',function() {
            $.ajax({
                type: "POST",
                url: "/descuento", 
                data: $("#frmdescuento").serialize(),
                success: function(data) {
                    $("#mdescuento").modal('hide');
                    alertify.success("Descuento aplicado correctamente");
                },
                error: function(e) {
                    
                    alertify.alert("Descuentos","Ocurrio un error inesperado, trate nuevamente, disculpas");
                }
            });
        } ,  function() {
            alertify.error("Accion cancelada..");
        });
        return false;
    });    
    /* formulario agregar descuento a publicaciones de manera global para un usuario */
    $("#frmdescglobal").submit(function(e) {
        e.preventDefault();
        if ($("#diasg").val() == "") return false;
        if ($("#precio2g").val() == "") return false;
        alertify.confirm('Aplicar Descuento Global','Esta todo correcto?',function() {
            $.ajax({
                type: "POST",
                url: "/descglobal", 
                data: $("#frmdescglobal").serialize(),
                success: function(data) {
                    $("#frmdescglobal").modal('hide');
                    alertify.success("Descuento aplicado correctamente");
                    location.reload();
                },
                error: function(e) {
                    
                    alertify.alert("Descuento","Ocurrio un error inesperado, trate nuevamente, disculpas");
                }
            });
        } ,  function() {
            alertify.error("Accion cancelada..");
        });
        return false;
    });    



    /* formulario modal resaltado incluye vip en mi pulga */
    $("#frmresaltar").submit(function(e) {
        e.preventDefault();
        if (($("#frmresaltar #resaltado").val() == "") && ($("#frmresaltar #vip").val() == "")) {
            alertify.alert("Resaltar publicacion","Debes seleccionar por lo menos una de las opciones, de lo contrario cancela, gracias.");
            return false;
        }
        alertify.confirm('Resaltar y/o VIP','Esta todo correcto?',function() {
            $.ajax({
                type: "POST",
                url: "/resaltarpub", 
                data: $("#frmresaltar").serialize(),
                success: function(data) {
                    if (data == 1) {
                        alertify.success('El resaltado o vip fue aplicado correctamente.');
                        // inicio cambios datos en html
                    } else if (data == -1) alertify.error('No tiene fondos suficientes');
                    else if (data == -2) alertify.error('No pudo resaltar, trate nuevamente');
                    else if (data == -3) alertify.error('No pudo colocar en VIP, trate nuevamente');
                    else alertify.error('Ocurrio un error inesperado, trate nuevamente, disculpas');
                    $("#mresaltar").modal('hide');
                },
                error: function(e) {
                    alertify.alert("Resaltar","Ocurrio un error inesperado, trate nuevamente, disculpas");
                }
            });
        },function(){
            $("#mresaltar").modal('hide');
            $("#frmresaltar #resaltado, #frmresaltar #vip").val("");
            alertify.error('Accion Cancelada');
        });  
        
        return false;
    });




    /* inicio filer */
    // var body = $(document.body),
    //     filer_default_opts = {
    //         changeInput2: '<div class="jFiler-input-dragDrop"><div class="jFiler-input-inner"><div class="jFiler-input-icon"><i class="icon-jfi-cloud-up-o"></i></div><div class="jFiler-input-text"><h3>Arrastra fotos aqui</h3> <span style="display:inline-block; margin: 15px 0">or</span></div><a class="jFiler-input-choose-btn btn-custom blue-light">Browse Files</a></div></div>',
    //         templates: {
    //             box: '<ul class="jFiler-items-list jFiler-items-grid"></ul>',
    //             item: '<li class="jFiler-item">\
    //                         <div class="jFiler-item-container">\
    //                             <div class="jFiler-item-inner">\
    //                                 <div class="jFiler-item-thumb">\
    //                                     <div class="jFiler-item-status"></div>\
    //                                     <div class="jFiler-item-thumb-overlay">\
    // 										<div class="jFiler-item-info">\
    // 											<div style="display:table-cell;vertical-align: middle;">\
    // 												<span class="jFiler-item-title"></span>\
    // 												<span class="jFiler-item-others">{{fi-size2}}</span>\
    // 											</div>\
    // 										</div>\
    // 									</div>\
    //                                     {{fi-image}}\
    //                                 </div>\
    //                                 <div class="jFiler-item-assets jFiler-row">\
    //                                     <ul class="list-inline pull-left">\
    //                                         <li>{{fi-progressBar}}</li>\
    //                                     </ul>\
    //                                     <ul class="list-inline pull-right">\
    //                                         <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
    //                                     </ul>\
    //                                 </div>\
    //                             </div>\
    //                         </div>\
    //                     </li>',
    //             itemAppend: '<li class="jFiler-item">\
    //                             <div class="jFiler-item-container">\
    //                                 <div class="jFiler-item-inner">\
    //                                     <div class="jFiler-item-thumb">\
    //                                         <div class="jFiler-item-status"></div>\
    //                                         <div class="jFiler-item-thumb-overlay">\
    //     										<div class="jFiler-item-info">\
    //     											<div style="display:table-cell;vertical-align: middle;">\
    //     												<span class="jFiler-item-title">&nbsp;</span>\
    //     												<span class="jFiler-item-others">                {{fi-size2}}</span>\
    //     											</div>\
    //     										</div>\
    //     									</div>\
    //                                         {{fi-image}}\
    //                                     </div>\
    //                                     <div class="jFiler-item-assets jFiler-row">\
    //                                         <ul class="list-inline pull-left">\
    //                                             <li><span class="jFiler-item-others">{{fi-icon}}</span></li>\
    //                                         </ul>\
    //                                         <ul class="list-inline pull-right">\
    //                                             <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
    //                                         </ul>\
    //                                     </div>\
    //                                 </div>\
    //                             </div>\
    //                         </li>',
    //             progressBar: '<div class="bar"></div>',
    //             itemAppendToEnd: false,
    //             removeConfirmation: false,
    //             _selectors: {
    //                 list: '.jFiler-items-list',
    //                 item: '.jFiler-item',
    //                 progressBar: '.bar',
    //                 remove: '.jFiler-item-trash-action'
    //             },
    //             canvasImage: true
    //         },
    //         dragDrop: {},
    //         uploadFile: {
    //             url: ajaxfn.sarchivo,
    //             data: {},
    //             type: 'POST',
    //             enctype: 'multipart/form-data',
    //             beforeSend: function() {},
    //             success: function(data, el, listEl, boxEl, newInputEl, inputEl, id) {
    //                 var new_file_name = JSON.parse(data),
    //                     filerKit = inputEl.prop("jFiler");
    //                 filerKit.files_list[id].name = new_file_name;
    //                 var parent = el.find(".jFiler-jProgressBar").parent();
    //                 el.find(".jFiler-jProgressBar").fadeOut("slow", function() {
    //                     $("<div class=\"jFiler-item-others text-success\"><i class=\"icon-jfi-check-circle\"></i> Ok</div>").hide().appendTo(parent).fadeIn("slow");
    //                 });
    //                 confoto = true;
    //                 //if ($("#vip").length) {
    //                 //    $("#vip").change();
    //                 //}
    //             },
    //             error: function(el) {
    //                 var parent = el.find(".jFiler-jProgressBar").parent();
    //                 el.find(".jFiler-jProgressBar").fadeOut("slow", function() {
    //                     $("<div class=\"jFiler-item-others text-error\"><i class=\"icon-jfi-minus-circle\"></i> Error</div>").hide().appendTo(parent).fadeIn("slow");
    //                 });
    //             },
    //             statusCode: null,
    //             onProgress: null,
    //             onComplete: null
    //         },
    //         onRemove: function(itemEl, file, id, listEl, boxEl, newInputEl, inputEl) {
    //             var filerKit = inputEl.prop("jFiler"),
    //                 file_name = filerKit.files_list[id].name;
    //             if (typeof(file_name) == "undefined") file_name = file.name;
    //             $.post('/ajax.borraarchivo.php', { file: file_name });
	// 			if((filerKit.files_list.length-1) == 0){
	// 				confoto = false;
	// 			}
	// 			//if ($("#vip").length) {
	// 			//	$("#vip").change();
	// 			//}
    //         }
    //     };
    // if (typeof(filerfiles) == 'undefined') filerfiles = null;
    // $('#fotos').filer({
    //     limit: 10,
    //     maxSize:16,
    //     showThumbs: true,
    //     extensions: ["jpg", "jpeg", "png", "gif"],
    //     templates: filer_default_opts.templates,
    //     dragDrop: filer_default_opts.dragDrop,
    //     uploadFile: filer_default_opts.uploadFile,
    //     onRemove: filer_default_opts.onRemove,
    //     files: filerfiles
       
    // });

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
//Fin de IPS filer

    // valida campos en formulario
    (function() {
        'use strict';
        window.addEventListener('load', function() {
        // solo los formularios con la clase de bootstrap needs-validation
        var forms = document.getElementsByClassName('needs-validation');
        // recorre los formularios para evitar submit
        var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
            if (form.checkValidity() === false) {
                alertify.error('Completar los campos en Rojo');
                event.preventDefault();
                event.stopPropagation();
            } else {
                if ($("#confirma").val() == "S") {
                    if (!confirm("Esta todo Correcto?")) {
                        event.preventDefault();
                        event.stopPropagation();
                    }		 
                }
            }         
            form.classList.add('was-validated');
            }, false);
        });
        }, false);
    })();

    // valida no entren multiples espacios en la descripcion 
    if (document.getElementById("descripcion")) document.getElementById("descripcion").addEventListener("keydown", multiplesp);

});