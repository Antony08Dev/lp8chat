/*Lp js Principal*/
function ajaxFilename() {
    this.autocomplete = "/autocompleta.php", this.busquedaavanzada = "/ajax.busavan.php", this.listadoprovincias = "/ajax.lprovincias.php", this.generaOptionsSelect = "/ajax.pub.genOptions.php", this.formDatosAdicionales = "/ajax.pub.frmDatosAd.php", this.buscapclaves = "/ajax.buscapclaves.php", this.cambiapublicacion = "/ajax.cambiapubli.php", this.subidor = "/ajax.subidor.php", this.envmensajeadministra = "/ajax.admmsg.php", this.verificauem = "/ajax.verificaue.php", this.admresfot = "/ajax.admrstfotos.php", this.admelipub = "/ajax.admelipub.php", this.admpreavi = "/ajax.admpreavi.php", this.admpena = "/ajax.admpenalidad.php", this.admnotel = "/ajax.admnotel.php", this.admpubl = "/ajax.admpublicidad.php", this.admretusu = "/ajax.admretusu.php", this.estatusplanenlista = "/ajax.estatusplanenlista.php", this.post_frm_edicionrapida = "/ajax.post.frmedicionrapida.php", this.frm_edicionrapida = "/ajax.frmedicionrapida.php", this.getDataTransaccion = "/json.datatransaccion.php", this.getDescMeses = "/json.descmeses.php"
}

function Config() {
    this.retorno = !1
}

function estatus(a) {
    id = a.split("-"), id = id[1];
    var e = $("#" + a).prop("checked") ? "A" : "I";
    ajaxcambiacampo($("#" + a).attr("value") + e + "_" + id) || (0 == $("#" + a).prop("checked") ? $("#" + a).prop("checked", !0) : $("#" + a).prop("checked", !1))
}

function trackevent(a, e, t) {
    1 == SITIO && gtag("event", e, {
        event_category: a,
        event_label: t,
        value: SITIO
    })
}
var lnkbprovincias = "Provincias",
    bprovincias = !1,
    ajaxfn = new ajaxFilename,
    config = new Config;

function urldecode(a) {
    return decodeURIComponent((a + "").replace(/\+/g, "%20"))
}

function desencript(a) {
    return window.atob(a)
}

function lp_vmt() {
    $("#lnkfavoritos").addClass("icoo tt badge red"), $("#lnkfavoritos").html("Ver listado de favoritos")
}

function ajaxlogged(a) {
    if (1 != a) return usulogged = a, !0;
    $.ajax({
        url: "/ajax.logged.php",
        dataType: "text",
        success: function (a) {
            ajaxlogged(a)
        }
    })
}

function ajaxfavoritos(a, e, t) {
    $.ajax({
        url: "/ajax.pfavoritos.php",
        beforeSend: function () {
            $("#loadingajax").show()
        },
        type: "GET",
        data: {
            id: a,
            uid: e,
            usrid: usrid,
            accion: t
        },
        success: function (e) {
            if ("-2" != e) return "1" == e ? (alertify.notify('<a href="/favoritas?fav=' + a + '" class="addfav">Su publicacion fue agregado a la LISTA DE FAVORITOS.  Use el menu MI PULGA -> Publicaciones Favoritas o el para verlas, Equipo LP</a>', "success", 10), 1) : "2" == e ? ($("#p" + a).hide("slow"), 2) : "-1" == e ? ($("#mologinfavoritos").length ? $("#mologinfavoritos").show() : alertify.notify('<a href="/favoritas?fav=' + a + '" class="addfav">La publicacion fue colocada en Favoritos, puedes verla luego en el menu Mi Pulga</a>', "success", 10), 1) : "0" == e ? (alertify.alert("Su publicacion YA estaba en la lista de Favoritos.  Puede consultarlo luego en el menu MI PULGA -> Publicaciones Favoritas o el boton rojo en el tope, Equipo LP"), 1) : (alertify.eAlert("Error desconocido, si el problema persiste favor reportar. Disculpe los incovenientes que esto le pueda causar."), 0);
            alertify.eAlert("No se puede ejecutar esta accion, trate de nuevo"), location.href = "/"
        }
    })
}

function retajaxprocesa(a) {
    return alert(a), a
}

function ajaxpublicaciones(a, e, t) {
    return $.ajax({
        url: "/ajax.ppublicaciones.php",
        type: "GET",
        data: {
            id: a,
            uid: e,
            accion: t
        },
        success: function (a) {}
    })
}

function ajaxcambiacampo(a, e, t, i) {
    return sleep(500), e || confirm("Desea procesar esta accion?") ? (t = void 0 !== t && "" != t ? " | " + t : "", $.ajax({
        url: "/ajax.cambiacampo.php",
        type: "POST",
        data: {
            valor: a,
            prt: t
        },
        success: function (e) {
            "" == e ? (alertify.success("Operacion exitosa!"), "" == t ? $("#" + a + ", #p" + a).addClass("descrece").hide("600") : $("#" + a + ", #p" + a).closest("tr").next("tr").show().find("span").append("<br />" + t), $(".apaga").hide(), null != i && "" != i && $("#" + i).addClass("descrece")) : alertify.error(e)
        }
    }), !0) : (alertify.error("Cancelado"), !1)
}

function ajaxenlacesp(a, e, t) {
    $.ajax({
        url: "/ajax.enlacesp.php",
        type: "GET",
        data: {
            id: a,
            uid: e,
            accion: t
        },
        success: function (a) {
            "0" == a ? (alertify.warning("No se puede ejecutar esta accion, trate de nuevo"), location.href = "/misenlaces") : "1" == a && (location.href = "/misenlaces")
        }
    })
}

function mostrar(a) {
    $("#inf" + a).length && $("#inf" + a).removeClass("hide")
}

function ponerElCursorAlFinal(a) {
    var e = $("#" + a),
        t = e.val();
    e.focus().val("").val(t), e.scrollTop(e[0].scrollHeight)
}

function updateURLParameter(a, e, t) {
    var i = null,
        o = "",
        r = a.split("?"),
        n = r[0],
        s = r[1],
        l = "";
    if (s) {
        var c = (d = s.split("#"))[0];
        (i = d[1]) && (s = c), r = s.split("&");
        for (var u = 0; u < r.length; u++) r[u].split("=")[0] != e && (o += l + r[u], l = "&")
    } else {
        var d;
        c = (d = n.split("#"))[0];
        i = d[1], c && (n = c)
    }
    return i && (t += "#" + i), n + "?" + o + (l + "" + e + "=" + t)
}

function formatNumber(a, e) {
    if (0 != a) return e + a.toFixed(0).replace(/./g, function (a, e, t) {
        return e > 0 && "." !== a && (t.length - e) % 3 == 0 ? "," + a : a
    })
}

function getParam(a, e) {
    e || (e = location.href), a = a.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var t = new RegExp("[\\?&]" + a + "=([^&#]*)").exec(e);
    return null == t ? null : t[1]
}

function confirmaSalida() {
    window.onbeforeunload = function () {
        var a = document.getElementsByTagName("form"),
            e = !0;
        for (campo in arrValidaCampos[a[0].id].validacionDatos.elementos) 0 != $("#" + campo).val() && (e = !1);
        if (!e) return !1
    }
}

function sleep(a) {
    for (var e = (new Date).getTime(), t = 0; t < 1e7 && !((new Date).getTime() - e > a); t++);
}

function adminMpEditarPub(a) {
    $("#pub" + a + " form").serialize()
}

function cambiaposfoto(a, e) {
    !e && $(".cambiaft").val("Hacer Principal").removeClass("bgverde"), !e && $(a).val("Principal").addClass("bgverde");
    var t = "",
        i = $(a).attr("name"),
        o = $("#arrFotos_" + i).val().split(","),
        r = $(a).attr("rel"),
        n = o.indexOf(r),
        s = o[n];
    if (o.splice(n, 1), e && ajaxcambiacampo(t = "ART_FOTOS_" + o.join(",") + "_" + i, "resumenpublicacion")) return $(a).closest("div.miniaturas").hide("slow"), $("#arrFotos_" + i).val(o), !1;
    o.unshift(s), t = "ART_FOTOS_" + o.join(",") + "_" + i;
    var l = $(a).closest("div.miniaturas").clone().hide(),
        c = $(a).closest("div.fotos");
    if (!ajaxcambiacampo(t, "resumenpublicacion")) return c.find("div.miniaturas").first().find("span").show("slow"), $(".fotos input[type=radio]").prop("checked", !1), !1;
    $(a).closest("div.miniaturas").hide("slow"), c.find(".miniaturas").first().before(l), c.find(".miniaturas").first().show("slow")
}

function generaPosFotos(a, e) {
    if ($("#pubmobody .fotos").remove(), e.length <= 0) return !1;
    var t = e.split(","),
        i = 0,
        o = "";
    $.each(t, function (e, t) {
        var r = 0 == i ? "Principal" : "Hacer Principal",
            n = 0 == i ? "bgverde" : "";
        o += '<div class="miniaturas">\t\t\t\t\t<a href= "javascript:;" title="Elimina esta foto" class="elimfoto" rel=\'' + t + "' name=\"" + a + '" onclick="cambiaposfoto(\'#elimfoto' + a + "_" + ++i + "',true);\" id='elimfoto" + a + "_" + i + '\'><i class="fa fa-trash-o"></i></a>\t\t\t\t\t<a  href="/f/' + t + '" class="fancybox" >\t\t\t\t\t\t<img src="/cache/120/' + t + '" />\t\t\t\t\t</a>\t\t\t\t\t<input type="button" rel=\'' + t + "' value='" + r + "' class='" + n + " cambiaft btn btn-info' name=\"" + a + '" onclick="cambiaposfoto(\'#foto' + a + "_" + i + "');\" id='foto" + a + "_" + i + "' /></div>"
    }), $("#pubmobody").prepend("<div class='fotos'>" + o + "</div>")
}
"undefined" != typeof alertify && (alertify.defaults.transition = "zoom", alertify.defaults.theme.ok = "btn btn-primary", alertify.defaults.theme.cancel = "btn btn-danger", alertify.wConfirm || alertify.dialog("wConfirm", function () {
    return {
        build: function () {
            this.setHeader('<span class="fa fa-exclamation-triangle fa-2x" style="vertical-align:middle;color:#dee100;"></span>')
        }
    }
}, !0, "confirm"), alertify.eAlert || alertify.dialog("eAlert", function () {
    return {
        build: function () {
            this.setHeader('<span class="fa fa-times-circle fa-2x" style="vertical-align:middle;color:#e10000;"></span>')
        }
    }
}, !0, "alert"), alertify.wAlert || alertify.dialog("wAlert", function () {
    return {
        build: function () {
            this.setHeader('<span class="fa fa-exclamation-triangle fa-2x" style="vertical-align:middle;color:#dee100;"></span>')
        }
    }
}, !0, "alert"));
var provincias = [],
    prov = "";

function placeholderPrv(a) {
    if ($(a).prop("checked")) {
        otras_prov = "";
        var e = $(a + " ~ a").text();
        if (provincias.length > 0) {
            var t = prov.join(",");
            prov = (provincias = t + " y " + e).split("y")
        } else provincias.push(e), prov = provincias
    } else {
        var i = $("#frmprv").find("input[type='checkbox']:checked");
        provincias = [];
        for (var o = 0; o < i.length; o++) provincias.push($("#" + i[o].id + " ~ a").text());
        otras_prov = provincias.join(", "), prov = otras_prov.split(",")
    }
    e = "" != otras_prov ? otras_prov : provincias;
    $(".campoprv").attr("placeholder", "Busca en: " + e)
}

function volver(a, e) {
    if (a.length) switch (typeof a) {
        case "string":
            $("#" + a + ", ." + a).removeClass("crece").addClass("descrece"), setTimeout(function () {
                $("#" + a + ", ." + a).hide()
            }, 500);
            break;
        case "object":
            a.removeClass("crece").addClass("descrece"), setTimeout(function () {
                a.hide()
            }, 500)
    }
    if (e.length) switch (typeof e) {
        case "string":
            $("#" + e + ", ." + e).removeClass("descrece").addClass("crece").show();
            break;
        case "object":
            e.removeClass("descrece").addClass("crece").show()
    }
}
otras_prov = "", $(document).ready(function () {
    $(".detalle-slide li").css("visibility", "visible");
    var a = new URL(window.location.href),
        e = getParam("ob", a) || null;
    if (null != e && $("#ob").length > 0 && $("#ob option[value=" + e + "]").attr("selected", !0), $("#rangoPrecio").length > 0) {
        var t = getParam("pmin", a) || rangoPrecio.min,
            i = getParam("pmax", a) || rangoPrecio.max;
        $("#rangoPrecio").slider({
            range: !0,
            min: rangoPrecio.min,
            max: rangoPrecio.max,
            values: [t, i],
            step: 1e3,
            slide: function (a, e) {
                $("#lblRPrecio").val(formatNumber(e.values[0], "RD$") + " - " + formatNumber(e.values[1], "RD$"))
            },
            change: function (a, e) {
                var t = updateURLParameter(window.location.href, "pmin", e.values[0]);
                t = updateURLParameter(t, "pmax", e.values[1]), window.location.href = t
            }
        }), $("#lblRPrecio").val(formatNumber($("#rangoPrecio").slider("values", 0), "RD$") + " - " + formatNumber($("#rangoPrecio").slider("values", 1), "RD$"))
    }
    if ($("#rangoAnio").length > 0) {
        var o = getParam("danio", a) || 1945,
            r = getParam("hanio", a) || 2017;
        $("#rangoAnio").slider({
            range: !0,
            min: 1945,
            max: 2017,
            values: [o, r],
            step: 1,
            slide: function (a, e) {
                $("#lblRAnio").val("Entre.: " + e.values[0] + " - " + e.values[1])
            },
            change: function (a, e) {
                var t = updateURLParameter(window.location.href, "danio", e.values[0]);
                t = updateURLParameter(t, "hanio", e.values[1]), window.location.href = t
            }
        }), $("#lblRAnio").val("Entre.: " + $("#rangoAnio").slider("values", 0) + " - " + $("#rangoAnio").slider("values", 1))
    }
    $("#filtro select").change(function (a) {
        var e = window.location.href,
            o = getParam("sid", e),
            r = a.currentTarget.id,
            n = $("#filtro #" + r).find("option:selected").val().split("=");
        n.length > 1 && (n = n[1]), r in {
            provincia: 1,
            marca: 1,
            aro: 1
        } && (null != getParam("pmin", e) && null != getParam("pmin", e) ? (e = window.location.href.replace(/\?.*/gi, ""), e += "?pmax=" + i + "&pmin=" + t) : e = window.location.href.replace(/\?.*/gi, "")), null != getParam("pmin", e) && null != o ? e += "&sid=" + o : null != o && (e += "?sid=" + o), e = updateURLParameter(e, r, n), alertify.notify("Aplico un filtro a los resultados actuales", "success", 3), window.location.href = e
    }), $(".prv").length && $(".prv").click(function (a) {
        a.preventDefault(), lnkbprovincias = "Provincias", $("#areaprv").toggle(function () {
            $.ajax({
                url: ajaxfn.listadoprovincias,
                type: "GET",
                success: function (a) {
                    $("#areaprv").html(a), $("#busprv li").transpose()
                }
            })
        }), $(".prv").text(lnkbprovincias)
    }), $("#frm #q").length && ($("input#q").result(function () {}), $("#btnbuscar").click(function () {
        return "" == $("#q").val() ? (alertify.wAlert("El campo de busqueda esta vacio"), $(this).focus(), !1) : ($("#frm").submit(), !0)
    })), $("#frmprv #q").length && $("#btnprv").click(function (a) {
        return a.preventDefault(), "" == $("#frmprv #q").val() ? (alertify.alert(msgAlert.q_blank), $("#frmprv #q").focus(), !1) : validaChequeados($("#frmprv")) ? ($("#frmprv").submit(), !0) : (alertify.alert("InformaciÃ³n", "Debe seleccionar por lo menos una provincia para buscar"), !1)
    }), $(".btn-collapse-listaenmovil").click(function () {
        var a = $(this).attr("data-target");
        $.each($(".listaenmovil"), function (e, t) {
            "#" + t.id != a && $("#" + t.id).removeClass("in")
        })
    }), $(".lpub").length && $(".lpub .masinfo").each(function () {
        $(this).attr("data-toggle", "collapse");
        var a = $(this).attr("id");
        a = "#pf" + a.substring(1, a.length), $(this).attr("data-target", a)
    }), $("#tipol, #tipog").click(function (a) {
        a.preventDefault(), $.get("/ajax.tipolistado.php?tipo=" + this.id, function () {
            location.reload(!0)
        })
    }), $("a.vmt, .pfavoritos").click(function (a) {
        a.preventDefault();
        var e = this.id.split("_"),
            t = e[0],
            i = e[1],
            o = e[2];
        "I" == o && (ajaxfavoritos(t, i, o), alertify.error("Eliminada")), "A" == o && ajaxfavoritos(t, i, o), "N" == usulogged && (lp_vmt(), $.cookie("lp_vmt", 1, {
            expires: 2
        }))
    }), $(".mpo").click(function (a) {
        a.preventDefault();
        var e = [],
            t = "";
        if ($('input[type="checkbox"]:checked').each(function () {
                e.push(this.id)
            }), e.length > 0) {
            e.join(",");
            var i = $('input[type="checkbox"]:checked').attr("rel")
        }
        var o = this.id;
        if ("btnProcesarMp" != o && "btnProcesar" != o) {
            var r = o.split("_"),
                n = r[0];
            i = r[1], r[2];
            t = "Motivo para eliminar.: " + arrResVip[n].titulo, $('input[type="checkbox"]:checked').prop("checked", !1)
        } else {
            if (0 == e.length) return alertify.alert("La Pulga Virtual", "Debes seleccionar almenos una publicaciÃ³n."), !1;
            t = "Â¿Por quÃ© quieres eliminar " + $('input[type="checkbox"]:checked').length + " publicaciones?"
        }
        var s = $("#btnProcesar").length ? "#frmhistorialPublicaciones" : "#frmeliartinfo";
        if ($(s).find("#id").val(n || e), $(s).find("#uid").val(i), $("#btnProcesar").length) return $("#frmhistorialPublicaciones").submit();
        $("#frmeliartinfo input[type=radio]").prop("checked", !1), $("#tpube").text(t), $("#meliartinfo").modal("show")
    }), $("a.mpor").click(function (a) {
        a.preventDefault();
        var e = this.id.split("_"),
            t = e[0],
            i = e[1],
            o = e[2];
        if ("RN" != o) return !0;
        alertify.wConfirm("Renovar publicacion", "Seguro renovar la publicacion ID." + t + "?", function () {
            ajaxpublicaciones(t, i, o).success(function (a) {
                1 == a ? alertify.success("Se ha renovado su publicacion") : alertify.eAlert("Publicacion ID.: " + t, "No pudo ser renovada.<br><br>Usuarios con Plan BÃ¡sico 5 dÃ­as o mÃ¡s de publicado<br>Usuarios con Plan Pago una vez por dia.<br><br>Favor revisar la fecha de la publicaciÃ³n.<br><br>Te recomendamos <a href='/renovaciones'>Renovaciones Automaticas</a> o <a href='/planes'>ver Planes de Usuarios</a>, Equipo LP. ")
            })
        }, function () {
            alertify.error("Cancelado")
        })
    }), $("a.extensionpub").click(function (a) {
        a.preventDefault();
        var e = this.id;
        alertify.prompt("Solicitar Extension de Publicaciones", "Favor agrega un comentario a tu solicitud.:", "", function (a, t) {
            t ? $.ajax({
                url: "/ajax.solextension.php",
                type: "POST",
                data: {
                    uid: e,
                    comentario: t
                },
                success: function (a) {
                    "-3" == a ? alertify.eAlert("Tienes una solicitud pendiente, no se puede crear otra, si aplicas sera aprobada en breve.<br>Equipo LP") : "-2" == a ? alertify.eAlert("No se pudo realizar la solicitud de extension, trata nuevamente") : "1" == a && (alert("Fue enviada la solicitud, en breve procesaremos si aplicas."), location.href = "/mipulga")
                }
            }) : alert("Debes colocar un comentario")
        }, function () {
            alertify.error("Cancelado")
        })
    }), $("a.eklk").click(function (a) {
        a.preventDefault();
        var e = this.id;
        alertify.prompt("Eliminar mensaje", "Favor agrega un comentario para eliminar.:", "", function (a, t) {
            t ? $.ajax({
                url: "/ajax.eklk.php",
                type: "POST",
                data: {
                    id: e,
                    comentario: t
                },
                success: function (a) {
                    "-2" == a ? alertify.eAlert("No se pudo realizar la solicitud de extension, trata nuevamente") : "1" == a && (alert("Fue enviada la solicitud, en breve procesaremos si aplicas."), location.href = "/admin.klk")
                }
            }) : alert("Debes colocar un comentario")
        }, function () {
            alertify.error("Cancelado")
        })
    }), $("a.procesa").click(function (a) {
        a.preventDefault();
        var e = this.id.split("_"),
            t = e[0],
            i = e[1],
            o = e[2],
            r = "A" == o ? "Aprobar" : "Cancelar";
        if ("A" != o && "C" != o) return !1;
        alertify.prompt(r + " producto", "Seguro de " + r + " solicitud ID." + t + "?,<br><br><b>Nota.</b> Este proceso es irreversible, verifique bien.<br>Favor escribe un comentario antes de procesar.:", "", function (a, e) {
            e ? $.ajax({
                url: "/ajax.pprocesa.php",
                type: "POST",
                data: {
                    id: t,
                    uid: i,
                    accion: o,
                    comentario: e
                },
                success: function (a) {
                    "-2" == a ? alertify.eAlert("No se pudo procesar la solicitud " + t) : "1" == a && (alert("Fue procesada la solicitud No. " + t), location.href = "/admin.procesa")
                }
            }) : alert("Debes colocar un comentario al procesar")
        }, function () {
            alertify.error("Cancelado")
        })
    }), $(".prtcoment a").click(function (a) {
        a.preventDefault();
        var e = this.rel,
            t = this.id;
        alertify.prompt("Equipo LP :/", "Escribe un comentario " + e, "", function (a, i) {
            i ? ajaxcambiacampo(t, "ss", i) : alert("Debes colocar un comentario " + e)
        }, function () {
            alertify.error("Cancelado")
        })
    }), $("a.idplinfo").click(function (a) {
        a.preventDefault();
        var e = this.id;
        alertify.prompt("Datos plan info", "Seguro de agregar los datos del plan?,<br><br><b>Nota.</b> Este proceso es irreversible, verifique bien.<br>Favor escribe un comentario antes de procesar.:", "", function (a, t) {
            t ? $.ajax({
                url: "/ajax.adidplaninfo.php",
                type: "POST",
                data: {
                    uid: e
                },
                success: function (a) {
                    "-2" == a ? alertify.eAlert("No se pudo agregar datos del plan " + id) : "1" == a && (alert("Fueron actualizados los datos del plan"), location.href = "/admin.perfilusuario?uid=" + e)
                }
            }) : alert("Debes colocar un comentario al procesar")
        }, function () {
            alertify.error("Cancelado")
        })
    }), $("a.cplan").click(function (a) {
        a.preventDefault();
        var e = this.id;
        alertify.prompt("Cancelar plan", "Seguro de cancelar plan?,<br><br><b>Nota.</b> Este proceso es irreversible, verifique bien.<br>Favor escribe un comentario antes de procesar.:", "", function (a, t) {
            t ? $.ajax({
                url: "/ajax.cplan.php",
                type: "POST",
                data: {
                    uid: e,
                    comentario: t
                },
                success: function (a) {
                    "-2" == a ? alertify.eAlert("No se pudo cancelar el plan " + id) : "1" == a && (alert("Fue cancelado el plan"), location.href = "/admin.perfilusuario?uid=" + e)
                }
            }) : alert("Debes colocar un comentario al procesar")
        }, function () {
            alertify.error("Cancelado")
        })
    }), $("a.procesaext").click(function (a) {
        a.preventDefault();
        var e = this.id.split("_"),
            t = e[0],
            i = e[1],
            o = e[2],
            r = e[3],
            n = "A" == r ? "Aprobar" : "Cancelar",
            s = $("#ext" + t).val();
        return ("A" == r || "C" == r) && ("A" == r && 0 != s || "C" == r && 0 == s ? void alertify.prompt(n + " extension", "Seguro de " + n + " solicitud ID." + t + "?,<br><br><b>Nota.</b> Este proceso es irreversible, verifique bien.<br>Favor escribe un comentario antes de procesar.:", "", function (a, e) {
            e ? $.ajax({
                url: "/ajax.procesaext.php",
                type: "POST",
                data: {
                    id: t,
                    uid: i,
                    accion: r,
                    usuario: o,
                    comentario: e,
                    extension: s
                },
                success: function (a) {
                    "-2" == a ? alertify.eAlert("No se pudo procesar la solicitud " + t) : "1" == a && (alert("Fue procesada la solicitud No. " + t), location.href = "/admin.extensiones")
                }
            }) : alert("Debes colocar un comentario al procesar")
        }, function () {
            alertify.error("Cancelado")
        }) : (alert("Debes seleccionar la cantidad a extender"), !1))
    }), $("a.mep").click(function (a) {
        a.preventDefault();
        var e = this.id.split("_"),
            t = e[0],
            i = e[1],
            o = e[2];
        alertify.wConfirm("Esta seguro de esta accion?", function () {
            ajaxenlacesp(t, i, o), alertify.success("Accion completada")
        }, function () {
            alertify.error("Cancelado")
        })
    });
    var n = $(".header-mov").length ? $(".header-mov").offset().top + $(".header-mov").height() : void 0,
        s = $(".group-filtros").length ? $(".group-filtros").offset().top : void 0;
    filtro_activo = $(".in"), $(window).scroll(function () {
        var a = $(window).scrollTop(),
            e = ($(window).scrollTop(), window.innerHeight, $("#sticky-tope").offset()),
            t = !(!$("*").hasClass("in") && $("#q").length && !$(".bprecio").length);
        parseInt($("body").css("padding-top"));
        if (null != e && (a > (e = $("#sticky-tope").offset().top) ? $("#buscador").addClass("stick") : $("#buscador").removeClass("stick")), a > $("#footer").offset().top / 2 && !$(".goup-filtros.stick").length && t && $("*").removeClass("in"), $("#binfoplan").length && (t = !1), null != n && !t) {
            var i = $(".header-mov").height();
            if (a > n) {
                $("body").css("padding-top", i);
                var o = $(".group-filtros").closest("div").height(),
                    r = o + i - 12;
                if ($(".header-mov").addClass("stick"), a + i > s) {
                    $(".in").removeClass("in"), $("body").css("padding-top", i + o);
                    var l = window.innerHeight - r;
                    $(".group-filtros").addClass("stick").css("top", $(".header-mov").height() - 5), $(".btn-collapse-listaenmovil").each(function (a, e) {
                        var t = $(this).attr("data-target");
                        $(t).addClass("stick").css({
                            top: r,
                            width: "100%",
                            "max-height": l,
                            "overflow-y": "scroll"
                        })
                    })
                } else filtro_activo.addClass("in"), $("body").css("padding-top", i), $(".group-filtros").removeClass("stick"), $(".btn-collapse-listaenmovil").each(function (a, e) {
                    var t = $(this).attr("data-target");
                    $(t).removeClass("stick").css({
                        top: 0,
                        height: "auto"
                    })
                })
            } else $("body").css("padding-top", 0), $(".stick").removeClass("stick")
        }
    }), $(window).scroll(function () {
        for (var a = $(window).scrollTop(), e = window.innerHeight, t = a + e, i = $(".resal"), o = 0; o < i.length; o++) t > $(i[o]).offset().top + e ? ($(i[o]).removeClass("resalt"), a < $(i[o]).offset().top + 50 && $(i[o]).addClass("resalt")) : t > $(i[o]).offset().top + 50 ? $(i[o]).addClass("resalt") : $(i[o]).removeClass("resalt")
    }), $(".close").click(function (a) {
        if (a.preventDefault(), !$(".modal").hasClass("in")) return $(this).parent("div.alert").hide(500), $("[class^=alert]").length && $.get("/ajax.msgsession.php"), !1
    }), $("#fcats li").transpose(), $("#fprvs li").transpose(), $("#adperusu1 li").transpose(), $("#adperusu2 li").transpose(), $(".servicio").click(function () {
        var a = urldecode(this.id);
        a = a.split("|"), $("#nombrecia").html(a[0]), $("#telefonos").html("<b>Tels.: </b>" + desencript(a[1])), $("#direccion").html("<b>Direcci&oacute;n.: </b>" + a[2]), $("#descripcion").html("<b>Detalles.: </b>" + a[3]), "ND" == a[5] && $("#dsvform").hide(), $("#mservicio").modal("show")
    }), $("#contacta, .contacta, .momodificapu").click(function (a) {
        if (a.preventDefault(), "contacta" != this.id) {
            var e = urldecode(this.id).split("|"),
                t = e[0].split("-");
            $("#de").val(e[0]), $("#categoria").find("option[value='" + e[0] + "']").prop("selected", !0), $("#para, #articulo").val(e[1]), $("#ida, #precio").val(e[2]), $("#mmodificapu .id").val($(this).attr("rel")), "R" == e[3] ? $("#peso").prop("checked", !0) : $("#dolar").prop("checked", !0), $("#usuario").val(e[3]), $("#ausuario").html(e[3]), $("#asunto, #tipo").val(e[4]), $("#condicion").val(e[5]), $("#categoria_id").val(t[0]), $("#subcategoria_id").val(t[1]), $("#categoria").change(function () {
                t = $("#categoria option:selected").val().split("-"), $("#categoria_id").val(t[0]), $("#subcategoria_id").val(t[1])
            })
        }
        generaPosFotos($(this).attr("rel"), $(this).find("input").val())
    }), $(".morecomendaciones").click(function (a) {
        a.preventDefault(), $("#mrecomendaciones").length && $("#mrecomendaciones").modal("show")
    }), $(".mubicame").click(function (a) {
        if ("https" != this.href.substr(0, 5)) return alertify.alert("La Pulga Virtual", "Lo sentimos, no tenemos la ubicaciÃ³n de este local."), !1;
        a.preventDefault();
        var e = $(this).attr("href"),
            t = $(this).attr("rel");
        $("#nombret").text("UbicaciÃ³n de " + t), $("#mubicame").find("iframe").attr("src", e), $("#mubicame").find("iframe").load(function () {
            $(".cont_loader").animate({
                height: "0px"
            })
        }), $("#mubicame").modal("show")
    }), $(".moreportar").click(function (a) {
        a.preventDefault(), $("#mreporta").length && $("#mreporta").modal("show")
    }), $(".mocontacta").click(function (a) {
        a.preventDefault();
        this.id;
        var e = "";
        if ($("#mcontacta").length) {
            $("#mensaje").val("");
            var t = this.id.split("_");
            ajaxlogged(1), setTimeout(function () {
                "-10" == usulogged ? alertify.wConfirm("Para enviar mensaje", 'Si tienes una cuenta has <a href="/login/publicacion_' + t[1] + '.html">login</a> de lo contrario crea una.', function () {
                    $("#mcontacta").modal("show")
                }, function () {}) : ($(".fldcontacta").hide(), -10 != usulogged && $("#de").val(usulogged), $("#mcontacta").modal("show")), null == t[2] ? (e = "Servicio al Cliente.", t[2] = e) : e = "Pregunta sobre: " + t[2], $(".modal-title").text(e), $("#asunto").val(t[2]), $("#para").val(t[0]), $("#ida").val(t[1])
            }, 300)
        }
    }), $(".momodificapu").click(function (a) {
        a.preventDefault(), $("#mmodificapu").length && $("#mmodificapu").modal("show")
    }), $(".moinfoplan").click(function (a) {
        a.preventDefault(), $("#moinfotienda").length && $("#moinfotienda").modal("show")
    }), $(".moubicacion").click(function (a) {
        a.preventDefault(), $("#moubicacion").length && $("#moubicacion").modal("show")
    }), $(".mocalculaprestamos").click(function (a) {
        a.preventDefault(), $("#mocalculaprestamos").length && $("#mocalculaprestamos").modal("show")
    }), $(".conoce").click(function (a) {
        a.preventDefault(), $("#mconoce").modal()
    }), $(".ppaga").click(function (a) {
        ajaxcambiacampo(this.value)
    }), $(".ccampo").click(function (a) {
        ajaxcambiacampo(this.id)
    }), $(".moadcomusu").click(function (a) {
        a.preventDefault(), $("#madcomusu").length && $("#madcomusu").modal("show")
    }), $(".moadpenalidades").click(function (a) {
        a.preventDefault(), $("#madpenalidades").length && $("#madpenalidades").modal("show")
    }), $(".moadcmbpalabra").click(function (a) {
        a.preventDefault(), $("#madcmbpalabra").length && $("#madcmbpalabra").modal("show")
    }), $(".moopcional").click(function (a) {
        if (a.preventDefault(), "undefined" != arrResVip) {
            confoto = !0;
            var e = "",
                t = $(this).attr("id").split("_"),
                i = arrResVip[t[1]],
                o = i.titulo,
                r = "" != i.reshasta ? "Adicionar - " : "",
                n = $("#opcional").find("option").length - 1;
            $("#novip").removeClass("hide"), $("#novip").empty(), $("#mopcionales").length && ($("#tpub").text(o), $("#frmopcionales input[name=id]").val(t[1]), "S" == i.vip ? (e = "Esta publicacion esta en VIP actualmente.", confoto = !1) : "N" == i.foto ? (e = 'Necesita fotos para poner en VIP, <a href="/modificapublicacion/' + t[1] + '">Agregar Fotos</a>', confoto = !1) : $("#novip").addClass("hide"), $("#opcional").find("option").each(function (a) {
                var e = this.text.replace("Adicionar - ", "");
                a > 0 && a < n && (e = r + e, this.text = e)
            }), $("#opcional option#sresal").text("" != i.reshasta ? "Resaltado hasta: " + i.reshasta : "Selecciona dias resaltado"), $("#vip").change(), $("#novip").append(e), $("#mopcionales").modal("show"))
        }
    }), $(".verVideo").click(function (a) {
        a.preventDefault();
        var e = a.currentTarget.id.split("|"),
            t = "https://www.youtube.com/embed/" + e[0] + "?autoplay=1";
        $("#movideo").length > 0 && ($("#movideo #ytplayer").attr("src", t), $("#movideo .modal-title").text(e[1]), $("#movideo").modal("show"))
    }), $(document).on("hidden.bs.modal", function (a) {
        $(".modal:visible").length && $("body").addClass("modal-open")
    }), $("#movideo").on("hidden.bs.modal", function () {
        $("#movideo #ytplayer").attr("src", ""), $("#movideo .modal-title").text(""), $("#movideo").modal("hide")
    });
    var l = "";
    if ($(".tleft").attr("data-placement", "left"), $(".ttop").attr("data-placement", "top"), $(".tright").attr("data-placement", "right"), $(".tbottom").attr("data-placement", "bottom"), $('.ttb, [data-toggle="popover"]').length && !$(".movil").length && $('.ttb, [data-toggle="popover"]').each(function (a, e) {
            $(e).attr("title") && ((l = (l = $(this).attr("title")).split("|")).length > 1 ? ($(this).attr("title", l[0]), $(this).attr("data-content", l[1])) : ($(this).attr("title", ""), $(this).attr("data-content", l[0]))), $(this).popover({
                html: !0,
                trigger: "hover"
            })
        }), $(".tt").length && !$(".movil").length && $(".tt").tooltip({
            html: !0
        }), $(".fancybox").fancybox(), $(".ifancybox").fancybox({
            width: "75%",
            height: "75%",
            autoScale: !1,
            transitionIn: "none",
            transitionOut: "none",
            type: "iframe"
        }), $(".detalle-slide").bxSlider({
            mode: "horizontal",
            captions: !0,
            adaptiveHeight: !1
        }), $(".slidermovil5").bxSlider({
            slideWidth: 180,
            minSlides: 2,
            maxSlides: 6,
            slideMargin: 10,
            auto: !0,
            pause: 4e3,
            autoStart: !0,
            autoDirection: "next",
            stopAutoOnClick: !1,
            autoHover: !0,
            autoDelay: 0,
            autoSlideForOnePage: !1,
            infiniteLoop: !0
        }), $(".slidermovil").bxSlider({
            slideWidth: 180,
            minSlides: 2,
            maxSlides: 3,
            slideMargin: 40,
            auto: !0,
            pause: 4e3,
            autoStart: !0,
            autoDirection: "next",
            stopAutoOnClick: !1,
            autoHover: !0,
            autoDelay: 0,
            autoSlideForOnePage: !1,
            infiniteLoop: !0
        }), $("ul.slider5 li, ul.slider3 li, ul.slidermovil5 li, ul.slidermovil li, .clgp").each(function () {
            var a = $(this).attr("class"),
                e = $(this).find("span");
            $(this).find("span").find("a").css({
                position: "absolute",
                width: "100%",
                height: "100%"
            }), e.css("top"), $(this).hover(function () {
                "clgp" == a && $(this).find("h4").animate({
                    position: "absolute",
                    bottom: -100
                }, 200), e.animate({
                    top: 70,
                    opacity: 1
                }, 200)
            }, function () {
                e.animate({
                    top: 163
                }), "clgp" == a && $(this).find("h4").animate({
                    position: "relative",
                    bottom: 15
                }, 200)
            })
        }), $("#menu-close").click(function (a) {
            a.preventDefault(), $("#sidebar-wrapper").toggleClass("active")
        }), $(".menu-toggle").click(function (a) {
            a.preventDefault(), $("#sidebar-wrapper").toggleClass("active")
        }), $("#menu-categoria").length > 0 && $("#menu-categoria").click(function (a) {
            for (x in $("#sidemenu").empty(), a.preventDefault(), $("#sidemenu-titulo").text("Categorias"), arrCategorias) $("#sidemenu").append("<li>" + arrCategorias[x] + "</li>")
        }), $(".vertodo").length > 0) {
        $(".vertodo").each(function () {
            var a = $(".vertodo"),
                e = a.html();
            if (e.length > 100) {
                var t = e.substr(0, 100) + '<span class="moreellipses">...&nbsp;</span><span class="mascontenido"><span>' + e.substr(100, e.length - 100) + '</span>&nbsp;&nbsp;<a href="" class="mascontenido-link less">Mostrar todo ></a></span>';
                a.html(t)
            }
        }), $(".mascontenido-link").click(function () {
            var a = $(".mascontenido-link");
            return a.hasClass("less") ? (a.removeClass("less"), a.html("Mostrar menos")) : (a.addClass("less"), a.html("Mostrar todo >")), a.parent().prev().toggle(), a.prev().toggle(), !1
        })
    }
    $("ul.carousel-inner li").first().addClass("active"), $(".carousel").carousel({
        interval: !1
    }), 1 == $.cookie("cookieAceptado") && $("#cookieGuardMsg").remove(), $("#aceptaCookie").on("click", function (a) {
        a.preventDefault(), $("#cookieGuardMsg").remove();
        var e = new Date;
        e.setTime(e.getTime() + 31536e6);
        var t = "expires=" + e.toUTCString();
        document.cookie = "cookieAceptado=1;" + t + "; path=/"
    }), $("#frm").submit(function () {
        if ("" == $("#q").val()) return alertify.wAlert("El campo de busqueda esta vacio"), !1
    }), $(window).load(function () {
        $(".cargando").fadeOut("slow")
    }), $(".admresfot").click(function () {
        var a = this.id.split("-")[1];
        return sleep(500), confirm("Desea procesar esta opcion?") && $.ajax({
            url: ajaxfn.admresfot,
            type: "GET",
            data: {
                id: a
            },
            success: function (a) {
                "" != a ? alert("Estas fotos no pudieron ser removidas, favor verificar") : alertify.success("Procesada")
            }
        }), !1
    }), $(".admelipub").click(function () {
        var a = this.id.split("-"),
            e = a[1],
            t = a[2];
        return sleep(500), confirm("Desea procesar esta opcion?") && $.ajax({
            url: ajaxfn.admelipub,
            type: "GET",
            data: {
                id: e,
                est: t
            },
            success: function (a) {
                "" != a ? alert("No pudo ser procesada, favor verificar") : alertify.success("Procesada")
            }
        }), !1
    }), $(".admnotel").click(function () {
        return confirm("Desea bloquear este numero de telefono?") && $.ajax({
            url: ajaxfn.admnotel,
            type: "POST",
            data: {
                telefono: this.id
            },
            success: function (a) {
                "" != a ? alert("No se pudo agregar este telefono a la lista, favor verificar") : alertify.success("Procesada")
            }
        }), !1
    }), $(".admpenalidad").click(function () {
        var a = this.id.split("-"),
            e = a[1],
            t = a[2];
        return sleep(500), confirm("Desea preavisar o penalizar este usuario?") && $.ajax({
            url: ajaxfn.admpena,
            type: "POST",
            data: {
                uid: e,
                penalidad: t
            },
            success: function (a) {
                "" != a ? alert("No se pudo agregar esta penalidad o preaviso, favor verificar") : alertify.success("Procesada")
            }
        }), !1
    }), $(".admretusu").click(function () {
        return sleep(500), confirm("Desea procesar esta opcion?") && $.ajax({
            url: ajaxfn.admretusu,
            type: "POST",
            data: {
                valor: this.id
            },
            success: function (a) {
                "" != a ? alertify.error("No se pudo retirar el usuario, favor verificar") : alertify.success("Usuario retirado")
            }
        }), !1
    }), $(".admpublicidad").click(function () {
        var a = this.id.split("-"),
            e = a[1],
            t = a[2];
        return $.ajax({
            url: ajaxfn.admpubl,
            type: "GET",
            data: {
                id: e,
                tipo: t
            },
            success: function (a) {
                "" != a ? alert("No se pudo agregar esta publicacion adwords, favor verificar") : alertify.success("Procesada")
            }
        }), !1
    }), $(".frmcalculadora").submit(function (a) {
        a.preventDefault(), $.ajax({
            url: "/ajax.amortizacion.php",
            type: "POST",
            data: $(this).serialize(),
            before: function () {
                $(".cargando").show()
            },
            success: function (a) {
                $(".cargando").addClass("descrece").hide(600), $("#frmcalculadora").addClass("descrece"), setTimeout(function () {
                    $("#frmcalculadora").closest(".modal-body").append(a), $("#frmcalculadora").hide(), $("#amortizacion").addClass("crece").attr("id", "data").addClass("data"), $(".calcula").removeClass("hide")
                }, 600)
            }
        })
    });
    var c = "";
    if ($(".cambia").on("click", function (a) {
            $("#" + this.id).closest("tr").next("tr").toggle("slow"), "" != c && c != this.id && $("#" + c).closest("tr").next("tr").hide(), c = this.id
        }), $("#asel").length && $("#asel").click(function () {
            return $.each($("input[name='sel[]']"), function (a, e) {
                e.checked ? e.checked = !1 : e.checked = !0
            }), !1
        }), $(".buscabloque").keyup(function () {
            ! function (a, e) {
                var t, i, o, r, n, s = a.value.toUpperCase(),
                    l = null == e ? $(a).closest(".list-group") : $("#" + e),
                    c = null == e ? l.find("a") : l.find("tr");
                $(".bg-info").removeClass("bg-info").css("font-style", "normal"), $(".apaga").hide();
                for (var u = 0; u < c.length; u++) $(c[u]).hasClass("apaga") || ((t = $(c[u]).find(".asunto").text().toUpperCase().indexOf(s)) > -1 ? ($(c[u]).show().prev(".eliminarm").show(), i = "<i class='bg-info'>" + $(c[u]).find(".asunto").text().substr(t, s.length) + "</i>", o = $(c[u]).find(".asunto").text().substr(0, t), r = $(c[u]).find(".asunto").text().substr(t + s.length), n = o + i + r, $(c[u]).find(".asunto").html(n)) : (t = $(c[u]).find(".nombrem").text().toUpperCase().indexOf(s)) > -1 ? ($(c[u]).show().closest("a").show().prev("a").find(".eliminarm").show(), i = "<i class='bg-info'>" + $(c[u]).find(".nombrem").text().substr(t, s.length) + "</i>", o = $(c[u]).find(".nombrem").text().substr(0, t), r = $(c[u]).find(".nombrem").text().substr(t + s.length), n = o + i + r, $(c[u]).find(".nombrem").html(n)) : $(c[u]).hide().prev(".eliminarm").hide())
            }(this, $(this).attr("rel"))
        }), $(".lisub").find("li").removeClass("list-group-item"), $(".flexcol").length) {
        var u = "";
        $.each(arrCategorias, function (a, e) {
            u += "<optgroup rel='" + a + "' label='" + e + "'>", $.each(arrSubcategorias[a], function (e, t) {
                u += "<option value='" + a + "-" + e + "'>" + t + "</option>"
            }), u += "</optgroup>"
        }), $(".pubcategoria").append(u);
        document.querySelectorAll(".frm");
        $(".frm").each(function () {
            var a = "#" + $(this).attr("id"),
                e = $(a + " .id_subcat").val();
            $(a + " option[value='" + e + "']").attr("selected", "selected")
        }), $(".frm").submit(function (a) {
            a.preventDefault();
            var e = $(this).attr("id");
            $.ajax({
                url: "/modificapu.php",
                type: "POST",
                data: $("#" + e).serialize(),
                success: function (a) {
                    alertify.notify(a, "success", 5)
                },
                error: function (a, e, t) {
                    console.log("el estado es: " + e + " el error es: " + t)
                }
            })
        })
    }
    if ($("#detwha").click(function () {
            trackevent("WhatsAppDetalle", "" != this.id ? this.id : this.href, "WhatsApp Detalle")
        }), $("#footer a").click(function () {
            trackevent("BloqueFooter", "" != this.id ? this.id : this.href, "Bloque Footer")
        }), $("#footer .titulo-footer").click(function () {
            if (!$(".movil").length) return !1;
            $("html").animate({
                scrollTop: $(this).offset().top - 10
            }, 500), $(this).closest(".footer_nav_menu").find("ul").toggle("slow")
        }), $(".movil").length && $(".row, .group-filtros").css("max-width", window.innerWidth + "px"), $("#instafotos").click(function () {
            for (var a = $("body").children(), e = 0; e < a.length && ($(".breadcrumb").hide(), a[e].id != this.id) && !$(a[e]).find("#" + this.id).length; e++) a[e].style.display = "none", $(window).scrollTop($(this).offset().top), $("h4 a, .carousel-control, .carousel-indicators").hide();
            $(this).click(function () {
                location.reload()
            }), document.getElementById("datoscompartir").select(), document.execCommand("Copy")
        }), $(".fancybox").click(function () {
            $(this).find(".filtro-img").length ? (console.log("click fancy"), setTimeout(function () {
                $(".fancybox-inner").find("img").addClass("filtro-img")
            }, 200)) : $(".fancybox-inner").find("img").removeClass("filtro-img")
        }), $(".asignaCampos").on("click", function () {
            var a = $(this).attr("rel").split("_"),
                e = this.id.split("_");
            if (null != a[1])
                for (var t = 0; t < a.length; t++) $("#" + a[t]).val(e[t]);
            else $("#" + a).val(e)
        }), $(".showCampos").on("click", function () {
            var a = this.id.split("_");
            if (null != a[1])
                for (var e = 0; e < a.length; e++) $("#" + a[e]).closest("div").toggle().removeClass("hide")
        }), $(".app").length)
        for (var d = $(".enlExt"), p = 0; p < d.length; p++) $(d[p]).attr("onclick", "window.open('" + d[p].href + "','_system');").attr("href", "javascript:;")
});
/*Lp js Formularios*/
var vmunicipio = 0,
    vsector = 0,
    retorno = !1;

function validarform(e) {
    var a, o = e;
    a = o.substr(3, o.length), "undefined" != typeof arrValidaCampos && "undefined" != arrValidaCampos[o] && ($.each(arrValidaCampos[o], function (e, a) {
        $.each(a.elementos, function (e, t) {
            $("#" + o + " #" + e).attr(a.tag, t)
        })
    }), jQuery.each(arrFormAlertas, function (e, a) {
        $("#" + o + " #" + e).attr("data-validation-error-msg", a)
    }), jQuery.each(arrPlaceholders, function (e, a) {
        $("#" + o + " #" + e).attr("placeholder", a)
    })), $.validate({
        lang: "es",
        form: "#" + o,
        validateOnBlur: !0,
        errorMessagePosition: "top",
        onSuccess: function (e) {
            if ("eliartinfo" == a || "historialPublicaciones" == a) {
                if (validaChequeados("eliartinfo" == a ? "motivo" : "sel[]")) {
                    if (sleep(500), !confirm("Â¿Seguro que quieres eliminar publicaciones?")) return !1;
                    $.ajax({
                        type: "POST",
                        url: "/eliartinfo.php",
                        data: $("#" + o).serialize(),
                        success: function (e) {
                            ajaxpublicaciones($("#" + o + " #id").val(), $("#" + o + " #uid").val(), $("#" + o + " #accion").val()).success(function (e) {
                                if (1 == e) {
                                    var a = $('input[type="checkbox"]:checked').length ? $('input[type="checkbox"]:checked').length : 1;
                                    alertify.success("Eliminaste " + a + " producto(s)"), $('input[type="checkbox"]:checked').closest(".pub,tr").addClass("descrece"), $("#pub" + $("#" + o + " #id").val()).addClass("descrece"), setTimeout(function () {
                                        $("#pub" + $("#" + o + " #id").val()).hide()
                                    }, 500), $('input[type="checkbox"]:checked').prop("checked", !1)
                                } else alertify.wAlert("No pudo ser eliminada su publicacion, trate nuevamente")
                            }), $("#m" + a).modal("hide")
                        },
                        error: function (e) {
                            alertify.eAlert("fallo en la seleccion, trate nuevamente, disculpas")
                        }
                    })
                } else alertify.eAlert("Debes seleccionar un motivo");
                return !1
            }
            return $("#m" + a), $("#m" + a).hasClass("modal") ? (alertify.wConfirm("Esta todo correcto?", function () {
                $.ajax({
                    type: "POST",
                    url: "/" + a + ".php",
                    data: $("#" + o).serialize(),
                    success: function (e) {
                        $("#m" + a).modal("hide"), "nuevousuario" == e ? location.href = "/activausuario" : alertify.success(e)
                    },
                    error: function (e) {
                        alertify.eAlert("fallo en envio de mensaje, trate nuevamente, disculpas")
                    }
                })
            }, function () {
                $("#m" + a).modal("hide"), alertify.error("Accion Cancelada")
            }), !1) : $("#frmproductos").length > 0 || $("#frmpublicar").length > 0 || $("#frmpublicarexp").length > 0 || $("#frmregistro").length > 0 ? (sleep(500), !!confirm("Esta todo Correcto?") && ("PP" == $("#formapago").val() && ($("#procesar").attr("disabled", !1), $("#Solicita").attr("value", "Cargando PayPal, favor esperar..."), $("#Solicita").attr("disabled", !0), $("#submitcargando").show()), !0)) : void 0
        },
        onValidate: function (e) {
            if ("frmpublicar" == o && "undefined" != typeof usuplan && usuplan.substr(0, 1) in {
                    T: 1,
                    L: 1
                } && "undefined" != typeof CKEDITOR && "" == CKEDITOR.instances.descripcion.getData()) return {
                element: $("#cke_descripcion"),
                message: "Favor completar la descripcion"
            }
        }
    })
}

function numerorandom(e, a) {
    return Math.floor(Math.random() * (a - e + 1) + e)
}

function verusufb(e, a) {
    var o = e.first_name + " " + e.last_name;
    $.get("/ajax.verusufb.php", {
        id: "ER",
        valor: e.email
    }, function (t) {
        if ("No" == t) {
            if ("frmformularios" == a) return alertify.eAlert("Este email (" + e.email + ") no esta registrado, completa los datos en el formulario de registro para crear tu cuenta, Equipo LP", function () {
                location.href = "/registro?lgfb=S"
            }), "No";
            "frmregistro" == a && $("#" + a).submit()
        }
        "Activo" == t && ("frmformularios" == idform ? alertify.alert("Bienvenido " + o + ", Gracias por entrar", function () {
            location.href = "/"
        }) : alertify.alert("Ya tenÃ­as una cuenta en La Pulga " + o + ", Gracias por entrar!", function () {
            location.href = "/"
        })), "Retirado" == t && alertify.eAlert("Estimado Usuario\n\nPor alguna razon su cuenta esta Retirada, vaya al enlace soporte para contactarnos\n\nGracias por utilizar nuestros servicios\nEquipo Lp", function () {
            location.href = "/logout.php"
        }), "Inactivo" == t && alertify.alert("Cuenta Activada", "Su cuenta ha sido activada y lista para usarse.\\Gracias por utilizar nuestros servicios\nEquipo Lp", function () {
            location.href = "/"
        })
    })
}

function regusufb(e) {
    var a = e.first_name + e.last_name;
    $.get("/ajax.regusufb.php", {
        fbuid: e.id,
        email: e.email,
        nombre: a
    }, function (e) {
        "" != e && alertify.alert("Registro.", "Su registro ha sido completado con exito.\nSi necesitas una clave en algun momento es esta (" + e + ").\nTe reenviaremos a completar los datos de contacto para que empieces a publicar tus articulos.\n\nGracias por utilizar nuestros servicios\nEquipo LP", function () {
            location.href = "/"
        })
    })
}

function clFacebook() {
    this.init = function () {
        FB.init({
            appId: fbappid,
            cookie: !0,
            status: !0,
            xfbml: !0,
            version: "v2.10"
        })
    }, this.doPost = function (e) {
        e = e;
        FB.api("/me/feed", "post", {
            message: e,
            link: "https://lapulga.com.do",
            picture: "https://lapulga.com.do/i/logodetalle.png"
        }, function (e) {})
    }, this.login = function (e, a) {
        var o = a,
            t = e;
        FB.login(function (e) {
            $("#cargando").show(), e.authResponse ? FB.api("/me", {
                locale: "es_LA",
                fields: "id,first_name,last_name,email,verified"
            }, function (e) {
                fb.loginestatus(), o(t, e)
            }) : FB.getLoginStatus(function (e) {
                "not_authorized" === e.status ? alertify.alert("Usted ha hecho login pero no ha autorizado a la pulga, trate nuevamente") : alertify.alert("Usted no ha hecho login, trate nuevamente")
            })
        }, {
            scope: "email"
        })
    }, this.loginestatus = function () {
        FB.getLoginStatus(function (e) {
            if ("connected" === e.status) e.authResponse.userID, e.authResponse.accessToken;
            else "not_authorized" === e.status ? alertify.wAlert("Usted ha hecho login pero no ha autorizado a la pulga, trate nuevamente") : alertify.wAlert("Usted no ha hecho login, trate nuevamente")
        })
    }, this.callbacklogin = function (e, a) {
        $("#cargando").hide();
        var o = a.first_name + " " + a.last_name;
        if ("frmregistro" == e || "frmcontacta" == e) {
            if (document.getElementById("dfaltan")) {
                document.getElementById("dfaltan").style.display = "block", document.getElementById("email").value = a.email, document.getElementById("email").readOnly = !0, document.getElementById("nombre").value = o, document.getElementById("nombre").readOnly = !0, document.getElementById("fbuid").value = a.id;
                var t = numerorandom(1e3, 9999);
                document.getElementById("password").value = t, document.getElementById("password2").value = t, verusufb(a, e)
            } else this.doPost("Me registre en el popular portal La Pulga Virtual usando mi Movil, para compras y ventas en toda la Republica Dominicana, la mas completa, registrate tu tambien http://www.lapulga.com.do/registro, el proceso fue lo mas facil con mi cuenta de Facebook, quede activado y listo para publicar con 3 pines de cortesia que me regalaron para colocar en VIP, mas info de eso en http://ayuda.lapulga.com.do.  Te recomiendo visites su blog en http://blog.lapulga.com.do, hay mucha informacion sobre ventas, seguridad, etc.")
        }
        "frmformularios" == e && (document.getElementById("fbuid").value = a.id, document.getElementById("fbemail").value = a.email, document.getElementById("fbverified").value = a.verified, document.getElementById("login").value = a.email, document.getElementById("password").value = a.id, verusufb(a)), "frmrecuperar" == e && (document.getElementById("fbuid").value = a.id, document.getElementById("usuario").value = a.email, document.getElementById("fbverified").value = a.verified, document.frmrecuperar.submit())
    }
}

function totalTran(e) {
    var a, o, t, r, n, l;
    switch (param = "", paramtotal = "", e.producto.value) {
        case "CP":
            a = "PP" == e.formapago.value ? "US$" : "RD$", o = precioPines, t = e.pines.value, "US$" == a && (o = (o /= tasadolar).toFixed(2)), param = "tipo=CPcantidad=0", paramtotal = "tipo=CP&cantidad=" + t + "&formapago=" + e.formapago.value;
            break;
        case "SR":
        case "RAM":
            a = "PP" == e.formapago.value ? "US$" : "RD$", o = "SR" == e.producto.value ? precioRenovaciones : precioRam, t = e.cantidad.value, "US$" == a && (o = (o /= tasadolar).toFixed(2)), param = "tipo=" + e.producto.value + "&cantidad=" + t, paramtotal = "tipo=" + e.producto.value + "&cantidad=" + t + "&formapago=" + e.formapago.value;
            break;
        case "AO":
            a = "PP" == e.formapago.value ? "US$" : "RD$", o = precioAofertas, t = e.cantidad.value, "US$" == a && (o = (o /= tasadolar).toFixed(2)), param = "tipo=AO&cantidad=" + t, paramtotal = "tipo=AO&cantidad=" + t + "&formapago=" + e.formapago.value;
            break;
        case "PU":
            var s;
            s = e.plan.value, a = "PP" == e.formapago.value ? "US$" : "RD$", "LP" == e.plan.value ? PinesLP : PinesLPM, t = e.cantidad.value, s = encodeURIComponent(e.plan.value), param = "tipo=" + s + "&cantidad=" + t, s = encodeURIComponent(e.plan.value), t = encodeURIComponent(t), formapago = encodeURIComponent(e.formapago.value), l = e.renovaciones.checked ? encodeURIComponent(e.renovaciones.value) : "N", paramtotal = "tipo=" + s + "&cantidad=" + t + "&formapago=" + formapago + "&renovaciones=" + l
    }
    "" != param && $.ajax({
        url: ajaxfn.getDescMeses,
        data: param,
        beforeSend: function () {
            $("#cantidad").html('<option value="" selected="selected" >Cargando..</option>')
        },
        type: "GET",
        dataType: "json",
        success: function (e) {
            for (n = " <option value=''>Seleccione</option> ", i = 1; i <= 12; i++) n += " " + e[i] + " ";
            $("#cantidad").html(n)
        },
        error: function (e, a, o) {}
    }), "" != paramtotal && $.ajax({
        url: ajaxfn.getDataTransaccion,
        data: paramtotal,
        beforeSend: function () {
            $("#totalTran").html("<span>Calculando...</span>")
        },
        type: "GET",
        dataType: "json",
        success: function (e) {
            e.TOTAL = new Number(e.TOTAL), e.SUBTOTAL = new Number(e.SUBTOTAL), e.DESCUENTO = new Number(e.DESCUENTO), e.TOTALDESCUENTO = new Number(e.TOTALDESCUENTO), clase = "", e.DESCUENTO > 0 ? (r = '<span class="label label-danger">' + a + e.TOTAL.formatMoney(2, ".", ",") + "</span>", r += ' (Normal: <span class="label label-danger">' + a + e.SUBTOTAL.formatMoney(2, ".", ",") + "</span>", r += " - " + e.DESCUENTO + '%, Ahorras <span class="label label-success">' + a + e.TOTALDESCUENTO.formatMoney(2, ".", ",") + "</span>)") : (r = a + e.TOTAL.formatMoney(2, ".", ","), clase = " class='label label-success' "), $("#totalTran").html("<span" + clase + ">" + r + "</span>")
        }
    })
}

function Verificar() {
    this.email = function (e) {
        return !!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(e)
    }, this.usuario = function (e) {
        return !/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(e)
    }
}

function chequeaEmail(e) {
    return !!verificar.email(e) || (alertify.wAlert("Este no parece se una direcciÃ³n de email vÃ¡lida, favor verifique:\n\n-Que no tenga espacios\n-Que no tenga una, al final si es mas de uno\n-Que contenga la @.\n\nPara el caso de Emails Alternos debe llevar este formato 'email1@dominio.com, email2@dominio2, email3@dominio.com'\n\nEquipo LP"), !1)
}

function cambia_selects(e, a, o) {
    if (o = "" != o ? o : "0", a in {
            VE: "1",
            CE: "1"
        }) {
        for (marca in $("#marca").find("option").remove(), $("#modelo").find("option").remove(), $("#marca").append("<option value=''>Seleccione marca</option>"), $("#modelo").append("<option value=''>Seleccione modelo</option>"), arrMarcas[a]) $("#marca").append("<option value=" + marca + " " + (marca === e ? 'selected="selected"' : "") + ">" + arrMarcas[a][marca] + "</option>");
        for (modelo in arrModelos[e]) $("#modelo").append("<option value=" + modelo + " " + (modelo === o ? 'selected="selected"' : "") + ">" + arrModelos[e][modelo] + "</option>")
    } else if ("BR" == a)
        for (sector in $("#brsector").find("option").remove(), $("#brsector").append("<option value=''>Seleccione sector</option>"), arrSectores[e]) $("#brsector").append("<option value=" + sector + " " + (sector == o ? 'selected="selected"' : "") + ">" + arrSectores[e][sector] + "</option>");
    else if ("USU" == a) {
        for (provincia in $("#municipio").find("option").remove(), $("#provincia").find("option").remove(), $("#provincia").append("<option value=''>Seleccione</option>"), $("#municipio").append("<option value='0'>Seleccione</option>"), arrProvincias) $("#provincia").append("<option value=" + provincia + " " + (provincia == e ? 'selected="selected"' : "") + ">" + arrProvincias[provincia] + "</option>");
        for (k in arrMunicipios[e]) $("#municipio").append("<option value=" + k + " " + (k == o ? 'selected="selected"' : "") + ">" + arrMunicipios[e][k] + "</option>");
        if ($("#frmpublicaservicio #sector") || "mc" == $("#frmformularios  #frm").val())
            for (k in $("#sector").find("option").remove(), $("#sector").append("<option value=''>Seleccione</option>"), arrSectores[e]) $("#sector").append("<option value=" + k + " " + (k == vsector ? 'selected="selected"' : "") + ">" + arrSectores[e][k] + "</option>")
    }
    ordenarSelect("modelo"), ordenarSelect("marca"), ordenarSelect("brprovincia"), ordenarSelect("provincia"), ordenarSelect("municipio"), ordenarSelect("brsector")
}

function activaOcultos(e) {
    var a = "";
    switch ($("#lblprecio").text("Precio.:"), $("#condicion").removeClass("hide"), $("#moneda").removeClass("hide"), $("#tipopub").addClass("hide"), $("div.form-group").find("#empleoofe , #empleosol").attr("id", "articulo"), cat = $("#fid").length ? "" : e.split("-"), (cat[0] in {
        8: "1",
        11: "1",
        7: "1"
    } || e in {
        "15-253": "1",
        "15-252": "1",
        "15-249": "1",
        "15-250": "1"
    }) && $("#condicion").addClass("hide"), "S" == e ? ($("#datoPub").addClass("hide"), $("#datoServicio").find("div.form-group").removeClass("hide")) : ($("#datoPub").removeClass("hide"), $("#datoServicio").addClass("hide")), "7-240" == e ? ($("div.form-group").find("#articulo , #empleosol").attr("id", "empleoofe"), $("#lblprecio").text("Sueldo.:")) : "7-168" == e && ($("div.form-group").find("#articulo , #empleoofe").attr("id", "empleosol"), $("#precio").val(1), $("#moneda").addClass("hide")), e in {
        "8-211": "1",
        "8-76": "1",
        "8-207": "1",
        "8-77": "1",
        "8-80": "1",
        "8-79": "1",
        "8-78": "1",
        "10-129": "1",
        "10-145": "1",
        "10-144": "1",
        "10-280": "1"
    } && $("#tipopub").removeClass("hide"), e in {
        "4-157": "1",
        "4-150": "1"
    } ? a = "CE" : e in {
        "10-129": "1",
        "10-144": "1",
        "10-145": "1"
    } ? a = "VE" : e in {
        "8-207": "1",
        "8-77": "1"
    } ? a = "IN" : e in {
        "8-76": "1"
    } ? a = "in-app" : e in {
        "8-80": "1"
    } ? a = "in-sfm" : e in {
        "8-211": "1"
    } ? a = "in-ap" : "10-244" == e ? ($("#lblgoma").text("Goma:"), $("#gomaaro").removeClass("aro"), $("#gomaaro").unmask(), $("#gomaaro").addClass("goma"), a = "go") : "10-320" == e ? ($("#lblgoma").text("Aro:"), $("#gomaaro").removeClass("goma"), $("#gomaaro").unmask(), $("#gomaaro").addClass("aro"), a = "go") : a = e, e) {
        case "PU":
            a = "pu";
            break;
        case "CP":
            a = "cp";
            break;
        case "SR":
        case "RAM":
        case "AO":
            a = "sr"
    }
    $("div.add").each(function () {
        $("div.add").hasClass("s_" + a) ? ($("div.add").addClass("hide"), $("div.s_" + a).removeClass("hide"), $("div.s_" + a).find("select").attr("data-validation", "required")) : ($("div.add").addClass("hide"), $("div.add").find("select").attr("data-validation", !1))
    })
}

function cat_tipo(e) {
    cattipo = e.split("-");
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
            cattipo = ""
    }
    return $("#datoscategoria").val(cattipo), cattipo
}

function ordenarSelect(e) {
    var a = jQuery("#" + e),
        o = a.val();
    a.html(a.children("option").sort(function (e, a) {
        return e.text == a.text ? 0 : e.text < a.text ? -1 : 1
    })).val(o)
}

function blanqueacontacto() {
    $.ajax({
        type: "POST",
        url: "/ajax.mlogout.php"
    }), $("#uid").val(""), $("#sid").val(""), $("#login").val(""), $("#nombre").val(""), $("#telefono1").val(""), $("#provincia").val(""), $("#municipio").val(""), $("#password").val(""), $("#password2").val(""), $("#mpassword").val("")
}

function calculaBalance(e) {
    var a = 0;
    if ($(e).attr("id") in {
            opcional: 0,
            vip: 0
        }) {
        var o = {
            V: 1,
            VC: 1,
            VVC: 2
        };
        void 0 !== o[$("#vip").val()] ? vipvalor = Number(o[$("#vip").val()]) : vipvalor = 0;
        var t = "N" != $("#opcional").val() ? $("#opcional").val() : 0;
        t = Number(t), a = vipvalor + t
    } else "limitepc" == $(e).attr("id") && (a = $(e).val());
    if (a > pines) alertify.wAlert('No tienes  pines para VIP o Resaltado, puedes continuar publicando <i class="azul fa fa-thumbs-up fa-2x"></i>'), $(e).val("N").change();
    else if (0 == a) $("#balancepines").html(pines);
    else {
        var i = pines - a;
        $("#balancepines").html(pines + " - " + a + " = " + i)
    }
}

function validaChequeados(e) {
    return j = 0, $.each($('input[name="' + e + '"]'), function (e, a) {
        a.checked && j++
    }), 0 != j && j
}

function mostrarComplemento(e) {
    $("div.add").each(function () {
        $("div.add").hasClass("s_" + e) ? ($("div.add").addClass("hide"), $("div.s_" + e).removeClass("hide")) : $("div.add").addClass("hide")
    })
}

function setAlertas() {
    jQuery.each(arrFormAlertas, function (e, a) {
        $("#" + e).attr("oninvalid", 'setCustomValidity("' + a + '")'), $("#" + e).attr("onchange", "try{setCustomValidity('')}catch(e){}")
    })
}

function parseJSON(e) {
    return jQuery.parseJSON(e)
}
Number.prototype.formatMoney = function (e, a, o) {
    var t = this,
        i = (e = isNaN(e = Math.abs(e)) ? 2 : e, a = null == a ? "." : a, o = null == o ? "," : o, t < 0 ? "-" : ""),
        r = parseInt(t = Math.abs(+t || 0).toFixed(e)) + "",
        n = (n = r.length) > 3 ? n % 3 : 0;
    return i + (n ? r.substr(0, n) + o : "") + r.substr(n).replace(/(\d{3})(?=\d)/g, "$1" + o) + (e ? a + Math.abs(t - r).toFixed(e).slice(2) : "")
};
var verificar = new Verificar;

function maxcarateres(e) {
    null != document.getElementById(e) && $("#" + e).restrictLength($("#caracteress"))
}
var gomaMask = function (e) {
        len = e.replace(/\//g, "").length;
        var a = "000/000/000";
        switch (len) {
            case 6:
                a = "00/00/009";
                break;
            case 7:
                a = "000/00/009";
                break;
            case 8:
                a = "000/000/009"
        }
        return a
    },
    spOptions = {
        onKeyPress: function (e, a, o, t) {
            o.mask(gomaMask.apply({}, arguments), t), ponerElCursorAlFinal("gomaaro")
        }
    },
    chequeados = 0;

function validaUrlVideo(e) {
    return !!e.match(/^(?:https?:\/\/)?(?:www\.)?youtube\.com\/watch\?(?=.*v=((\w|-){11}))(?:\S+)?$/) && RegExp.$1
}
var fb = new clFacebook;
$(document).ready(function () {
    $("#frmprestamo").length && validarform("frmprestamo"), $("#frmpublicaservicio").length && validarform("frmpublicaservicio"), $("#frmreporta").length && validarform("frmreporta"), $("#frmalternativas").length && validarform("frmalternativas"), $("#frmpublicar").length && validarform("frmpublicar"), $("#frmpublicarexp").length && validarform("frmpublicarexp"), $("#frmregistro").length && validarform("frmregistro"), $("#frmcontacta").length && validarform("frmcontacta"), $("#frmproductos").length && validarform("frmproductos"), $("#frmformularios").length && validarform("frmformularios"), $("#frmmodificapu").length && validarform("frmmodificapu"), $("#frmeliartinfo").length && validarform("frmeliartinfo"), $("#frmhistorialPublicaciones").length && validarform("frmhistorialPublicaciones"), $("#frmadcomusu").length && validarform("frmadcomusu"), $("#frmadpenalidades").length && validarform("frmadpenalidades"), $("#frmadcmbpalabra").length && validarform("frmadcmbpalabra"), $("#frmdatosplan").length && validarform("frmdatosplan"), $("#frmfinancieras").length && validarform("frmfinancieras"), maxcarateres("mensaje"), maxcarateres("comentario"), maxcarateres("descripcionme"), "P" == usuplan.substr(0, 1) ? ($("#caracteress").parent("label").removeClass("hide"), maxcarateres("descripcion")) : "frmmensajeria" != $("#caracteress").closest("form").attr("id") && $("#caracteress").addClass("hide"), $("#frmformularios #tipo").length && ($("#tipo").change(function () {
        activaOcultos($("#tipo").find("option:selected").val())
    }).change(), $("#limitepc").change(function () {
        0 == validaChequeados("seccion[]") && ($(this).val(""), alertify.wAlert("Debes seleccionar el o los lugares donde se mostrara"))
    }), $('input[name="seccion[]"]').change(function () {
        var e = 0;
        chequeados >= 8 ? e = 4 : chequeados > 5 && chequeados <= 7 ? e = 3 : chequeados > 2 && chequeados <= 5 ? e = 2 : chequeados <= 2 && (e = 1), $("#limitepc option").each(function (a, o) {
            var t = $("option[value='" + a + "']", "#limitepc");
            a < e ? t.attr("disabled", !0) : t.attr("disabled", !1)
        }), 0 == chequeados ? $("#minimopines").text("Debes seleccionar por lo menos uno") : $("#minimopines").text("Para esta selecciÃ³n debes usar " + e + " PINES o mÃ¡s")
    }).change()), "undefined" != typeof arrPublicar && $.each(arrPublicar, function (e, a) {
        var o = $("#" + e).prop("tagName");
        "SELECT" == o ? $("#" + e + " option").each(function () {
            $(this).val() == a && $(this).attr("selected", "selected")
        }) : "DIV" == o ? $("#" + e + " input[type=radio]").each(function () {
            $(this).val() == a && $(this).attr("checked", "checked")
        }) : "INPUT" != o && "TEXTAREA" != o || $("#" + e).val(a)
    }), $("#cargando").hide(), $("#frmformularios, #frmregistro").length && 1 == SITIO && fb.init();
    "undefined" != typeof usuplan && usuplan.substr(0, 1) in {
        T: 1,
        L: 1
    } && "undefined" != typeof CKEDITOR && $("#frmpublicar #descripcion").length > 0 && CKEDITOR.replace("descripcion", {
        language: "es",
        entities: !1,
        entities_latin: !1,
        basicEntities: !1,
        entities_greek: !1,
        entities_latin: !1
    }), $("#categoria").change(function () {
        var e = "",
            a = "";
        categoria = $("#categoria").find("option:selected").val(), $("#articulo").attr("placeholder", "ej. " + arrPlaceholdertitulo[categoria.split("-")[0]]), "S" == categoria && alertify.wConfirm("El sistema lo enviarÃ¡ el formulario de publicaciÃ³n de servicios, Desea continuar?", function () {
            location.href = "/publicaservicio"
        }, function () {
            alertify.error("Cancelado"), $("#categoria").val("0")
        }), cattipo = cat_tipo(categoria), categoria in {
            "7-240": "1",
            "7-168": "2"
        } ? $("input:radio[name='tipo'][value ='E']").prop("checked", !0) : $("input:radio[name='tipo'][value ='V']").prop("checked", !0), "undefined" != typeof arrPublicar && (selmarca = arrPublicar.marca, selmodelo = arrPublicar.modelo, provincia = arrPublicar.provincia, sector = arrPublicar.sector, "BR" == cattipo ? (e = provincia, a = sector) : (e = selmarca, a = selmodelo)), cambia_selects(e, cattipo, a), activaOcultos(categoria), $("#articulo").focus()
    }).change(), $("#urlvideo").bind("change keyup input", function () {
        0 == validaUrlVideo($(this).val()) ? ($("#urlvideo").removeClass("valid"), $("#urlvideo").addClass("error"), $("#urlvideo").parent("div").removeClass("has-success"), $("#urlvideo").parent("div").addClass("has-error")) : ($("#urlvideo").addClass("valid"), $("#urlvideo").removeClass("error"), $("#urlvideo").parent("div").addClass("has-success"), $("#urlvideo").parent("div").removeClass("has-error"))
    }), $("#btnlogin").on("click", function (e) {
        return "" == $("#frmpublogin #login").val() ? (alertify.wAlert("Coloque su Email o Usuario"), $("#login").focus(), !1) : "" == $("#frmpublogin #mpassword").val() ? (alertify.wAlert("Coloque su clave para entrar"), $("#mpassword").focus(), !1) : (e.preventDefault(), $.ajax({
            type: "POST",
            url: "/ajax.mlogin.php",
            data: $("#frmpublogin").serialize(),
            success: function (e) {
                JSONdata = parseJSON(e), "SI" == JSONdata.entro ? ($("#frmregistro").length && (location.href = "/?bnv=" + JSONdata.lp_nombre), usulogged = "S", $("#uid, #de").val(JSONdata.lp_uid), $("#sid").val(JSONdata.lp_session), $("#email").val(JSONdata.lp_email), $("#nombre").val(JSONdata.lp_nombre), $("#nombre").attr("readonly", !0), $("#telefono1").val(JSONdata.lp_telefono1), vmunicipio = JSONdata.lp_municipio, $("#provincia").val(JSONdata.lp_provincia), $("#provincia").change(), $("#mlogin").modal("hide"), $("#mpassword").val("")) : "NO" == JSONdata.entro ? (alertify.wAlert("Clave incorrecta, si la olvido click el enlace para obtener una."), $("#mpassword").val(""), $("#mpassword").focus()) : "R" == JSONdata.entro ? alertify.wAlert("Cuenta suspendida", 'Esta cuenta esta suspendida, para mas informacion contacta en <a href="/soporte">soporte</a> Equipo LP') : alertify.wAlert("Error al entrar", "Esta cuenta esa penalizada por <b>" + JSONdata.entro + '</b> no puedes hacer login ahora.<br><br>Para mas informacion contacta en <a href="/soporte">soporte</a> Equipo LP')
            },
            error: function () {
                alertify.wAlert("fallo en envio de accesos, trate nuevamente, disculpas")
            }
        }), !1)
    }), $("#btnlogincancel").on("click", function (e) {
        blanqueacontacto(), $("#email").val(""), $("#email").focus()
    }), $("#frmpublicar #email, #frmregistro #email, #frmcontacta #email").change(function () {
        var e = this.value;
        if (chequeaEmail(e) || this.focus(), $("#camposclave, #camposclave div.form-group").addClass("hide"), "" != $("#login").val() && e != $("#login").val() && blanqueacontacto(), "" != e) {
            $("#nombre").attr("readonly", !1);
            var a = e;
            $.get("/ajax.verificausu.php", {
                valor: a
            }, function (e) {
                "R" == e ? (alertify.eAlert("Estimado usuario:\n\nNo puede realizar publicaciones pongase en contacto con soporte al numero de WhatsApp 829-795-8684 o use el enlace de contacto.\n\nEquipo LP"), location.href = "/") : e in {
                    A: "1",
                    I: "1"
                } ? ($("#login").val($("#email").val()), alertify.alert("La Pulga Virtual te dice:", "   Este correo ya esta registrado, inicia sesiÃ³n con tu contraseÃ±a."), $("#mlogin").modal({
                    backdrop: "static",
                    keyboard: !1
                }), $("#mpassword").focus()) : 0 == e && ($("#camposclave, #camposclave div.form-group").removeClass("hide"), $("#nombre").focus())
            })
        }
    }), $("#frmresaltar #montoresaltado").change(function () {
        if (0 != $("#montoresaltado").val()) {
            if (sleep(500), !confirm("Confirma que son " + $("#montoresaltado ").find("option:selected").text() + " dias a resaltar?")) return $("#montoresaltado").val(0), !1;
            $("#frmresaltar").submit()
        }
    }), $("#sms").click(function () {
        var e = this.href.split("/");
        sms = e[3], id = e[4];
        var a = "sms:" + sms + "?body=Para entrar, Usuario: " + sms + " clave: " + sms.substring(sms.length - 4) + ", en https://www.lapulga.com.do/login.  Para soporte con WhatsApp 829-795-8684. Gracias por usar La Pulga Virtual";
        return sleep(500), !!confirm("Desea realmente enviar este mensaje?") && (this.href = a, $.get("ajax.clicksms.php", {
            id: id
        }, function (e) {}), !0)
    }), $("#mesexpreso").change(function () {
        location.href = "/micuenta?ob=" + $(this).find("option:selected").val()
    }), $("#admesexpreso").change(function () {
        location.href = "/admin.perfilusuario?uid=" + puid + "&ob=" + $(this).find("option:selected").val()
    }), $("#frmpublicar #articulo").change(function () {
        $("#lnkyoutube").attr("href", "http://www.youtube.com/results?search_type=&search_query=" + $("#articulo").val() + "&aq=f")
    }), $("#articulo").keypress(function (e) {
        if ((e.charCode < 97 || e.charCode > 122) && (e.charCode < 65 || e.charCode > 90) && (e.charCode < 48 || e.charCode > 57) && 241 != e.charCode && 209 != e.charCode && 32 != e.charCode && 225 != e.charCode && 233 != e.charCode && 237 != e.charCode && 243 != e.charCode && 250 != e.charCode && 193 != e.charCode && 201 != e.charCode && 205 != e.charCode && 211 != e.charCode && 218 != e.charCode && 9 != e.keyCode && 8 != e.keyCode && 27 != e.keyCode && 37 != e.keyCode && 34 != e.keyCode && 39 != e.keyCode && 46 != e.keyCode && 35 != e.keyCode && 36 != e.keyCode) return !1
    }), $("#frmpublicar #marca").change(function () {
        selmarca = $("#marca").find("option:selected").val(), cambia_selects(selmarca, cattipo, selmodelo)
    }), $("#brprovincia").change(function () {
        provincia = $("#brprovincia").find("option:selected").val(), cambia_selects(provincia, "BR", sector)
    }).change(), $("#opcional").change(function () {
        "MI" == $(this).val() ? $("#mresaltar").modal() : calculaBalance($(this))
    }), $("#vip").change(function () {
        "undefined" != typeof filerfiles && null != filerfiles && (confoto = !0), $("#vip option").each(function () {
            $(this).removeAttr("disabled"), $(this).val() in {
                V: 1,
                VC: 1,
                VVC: 1
            } && 0 == confoto && $(this).attr("disabled", !0)
        }), "MI" == $(this).val() && $("#mresaltar").modal(), calculaBalance($(this))
    }).change(), $("#frmpublicar #provincia, #frmpublicaservicio #provincia, #frmformularios #provincia, #frmregistro #provincia, #frmpublicarexp #provincia").change(function () {
        provincia = $("#provincia").find("option:selected").val(), sector = "", "undefined" != typeof arrPublicar && arrPublicar.provincia > 0 && (provincia = arrPublicar.provincia, vmunicipio = arrPublicar.municipio, sector = arrPublicar.sector), cambia_selects(provincia, "USU", vmunicipio)
    }).change(), $("#limitepc").change(function () {
        calculaBalance($(this))
    }), $("#producto").change(function () {
        producto = $("#producto").find("option:selected").val(), activaOcultos(producto), $("#frmproductos #pines, #frmproductos #cantidad, #frmproductos #plan, #frmproductos #formapago").val(""), totalTran(document.frmproductos)
    }).change(), $("#frmproductos #pines, #frmproductos #plan, #frmproductos #formapago, #frmproductos #cantidad, #frmproductos #renovaciones").change(function () {
        "" == $("#producto").find("option:selected").val() ? (alertify.wAlert("Debes elejir tipo de producto"), this.value = "") : totalTran(document.frmproductos)
    }), $("#plan").change(function () {
        var e = $("#plan").find("option:selected").val();
        if ("0" != e) {
            m = arrInfoPlanes[e].split(",");
            for (var a = document.createElement("ul"), o = 0; o < m.length; o++) {
                var t = document.createElement("li");
                t.innerHTML = m[o], a.append(t)
            }
            $("#planinfo").html("<h5><b>Este plan incluye:</b></h5>"), $("#planinfo").append(a), $("#renovaciones").attr("readonly", !0), $("#renovaciones").attr("checked", !0)
        } else $("#planinfo").html("")
    }), "undefined" != typeof plansel && 0 != plansel && $("[name=plan]").val(plansel), $("#frmprestamo #valor").blur(function () {
        $("#preguntas").removeClass("hide")
    }), $("#frmprestamo #tipo").change(function () {
        var e = $("#tipo").find("option:selected").val();
        if ($("div.add").each(function () {
                $(this).hasClass("s_" + e) ? $(this).find("[type=radio]").attr("required", !0) : $(this).find("[type=radio]").attr("required", !1)
            }), 0 == e) return null;
        $("#tipoinfo").attr("placeholder", arrTipoinfo[e].placeholder), $("#valor").attr("placeholder", arrTipoinfo[e].valor), mostrarComplemento(e)
    }), $("#frmprestamo input[type=radio]").change(function () {
        $("#radio1_2").is(":checked") ? ($(".p2 input[type=radio]").attr("required", !1), $(".p2").hide()) : ($(".p2").show(), $(".p2 input[type=radio]").attr("required", !0))
    }), $("#frmprestamo #email").change(function () {
        chequeaEmail(this.value) || this.focus()
    }), $("#frmmanejaenlace #tipo").change(function () {
        activaOcultos($("#tipo").find("option:selected").val())
    });
    $(document.body);
    var e = {
        changeInput2: '<div class="jFiler-input-dragDrop"><div class="jFiler-input-inner"><div class="jFiler-input-icon"><i class="icon-jfi-cloud-up-o"></i></div><div class="jFiler-input-text"><h3>Arrastra fotos aqui</h3> <span style="display:inline-block; margin: 15px 0">or</span></div><a class="jFiler-input-choose-btn btn-custom blue-light">Browse Files</a></div></div>',
        templates: {
            box: '<ul class="jFiler-items-list jFiler-items-grid"></ul>',
            item: '<li class="jFiler-item">                            <div class="jFiler-item-container">                                <div class="jFiler-item-inner">                                    <div class="jFiler-item-thumb">                                        <div class="jFiler-item-status"></div>                                        <div class="jFiler-item-thumb-overlay">    \t\t\t\t\t\t\t\t\t\t<div class="jFiler-item-info">    \t\t\t\t\t\t\t\t\t\t\t<div style="display:table-cell;vertical-align: middle;">    \t\t\t\t\t\t\t\t\t\t\t\t<span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name}}</b></span>    \t\t\t\t\t\t\t\t\t\t\t\t<span class="jFiler-item-others">{{fi-size2}}</span>    \t\t\t\t\t\t\t\t\t\t\t</div>    \t\t\t\t\t\t\t\t\t\t</div>    \t\t\t\t\t\t\t\t\t</div>                                        {{fi-image}}                                    </div>                                    <div class="jFiler-item-assets jFiler-row">                                        <ul class="list-inline pull-left">                                            <li>{{fi-progressBar}}</li>                                        </ul>                                        <ul class="list-inline pull-right">                                            <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>                                        </ul>                                    </div>                                </div>                            </div>                        </li>',
            itemAppend: '<li class="jFiler-item">                                <div class="jFiler-item-container">                                    <div class="jFiler-item-inner">                                        <div class="jFiler-item-thumb">                                            <div class="jFiler-item-status"></div>                                            <div class="jFiler-item-thumb-overlay">        \t\t\t\t\t\t\t\t\t\t<div class="jFiler-item-info">        \t\t\t\t\t\t\t\t\t\t\t<div style="display:table-cell;vertical-align: middle;">        \t\t\t\t\t\t\t\t\t\t\t\t<span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name}}</b></span>        \t\t\t\t\t\t\t\t\t\t\t\t<span class="jFiler-item-others">{{fi-size2}}</span>        \t\t\t\t\t\t\t\t\t\t\t</div>        \t\t\t\t\t\t\t\t\t\t</div>        \t\t\t\t\t\t\t\t\t</div>                                            {{fi-image}}                                        </div>                                        <div class="jFiler-item-assets jFiler-row">                                            <ul class="list-inline pull-left">                                                <li><span class="jFiler-item-others">{{fi-icon}}</span></li>                                            </ul>                                            <ul class="list-inline pull-right">                                                <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>                                            </ul>                                        </div>                                    </div>                                </div>                            </li>',
            progressBar: '<div class="bar"></div>',
            itemAppendToEnd: !1,
            removeConfirmation: !1,
            _selectors: {
                list: ".jFiler-items-list",
                item: ".jFiler-item",
                progressBar: ".bar",
                remove: ".jFiler-item-trash-action"
            },
            canvasImage: !0
        },
        dragDrop: {},
        uploadFile: {
            url: "/ajax.subearchivo.php",
            data: {},
            type: "POST",
            enctype: "multipart/form-data",
            beforeSend: function () {},
            success: function (e, a, o, t, i, r, n) {
                var l = JSON.parse(e);
                r.prop("jFiler").files_list[n].name = l;
                var s = a.find(".jFiler-jProgressBar").parent();
                a.find(".jFiler-jProgressBar").fadeOut("slow", function () {
                    $('<div class="jFiler-item-others text-success"><i class="icon-jfi-check-circle"></i> Ok</div>').hide().appendTo(s).fadeIn("slow")
                }), confoto = !0, $("#vip").length && $("#vip").change()
            },
            error: function (e) {
                var a = e.find(".jFiler-jProgressBar").parent();
                e.find(".jFiler-jProgressBar").fadeOut("slow", function () {
                    $('<div class="jFiler-item-others text-error"><i class="icon-jfi-minus-circle"></i> Error</div>').hide().appendTo(a).fadeIn("slow")
                })
            },
            statusCode: null,
            onProgress: null,
            onComplete: null
        },
        onRemove: function (e, a, o, t, i, r, n) {
            var l = n.prop("jFiler"),
                s = l.files_list[o].name;
            void 0 === s && (s = a.name), $.post("/ajax.borraarchivo.php", {
                file: s
            }), l.files_list.length - 1 == 0 && (confoto = !1), $("#vip").length && $("#vip").change()
        }
    };
    if ("undefined" == typeof filerfiles && (filerfiles = null), $("#fotos").filer({
            limit: 10,
            showThumbs: !0,
            extensions: ["jpg", "jpeg", "png", "gif", "bmp"],
            templates: e.templates,
            uploadFile: e.uploadFile,
            onRemove: e.onRemove,
            files: filerfiles
        }), jQuery(function (e) {
            e(".masktel").mask("(999) 999-9999"), e(".masktelext").mask("(999) 999-9999? x99999"), e(".maskced").mask("999-9999999-9"), e(".maskalpha").alphanumeric({
                allow: ". "
            }), e(".masknomtienda").alphanumeric({
                allow: " "
            }), e(".masktitulo").alphanumeric({
                allow: ",.)($%@#/ "
            }), e(".maskusuario").alphanumeric({
                allow: "._-@"
            }), e(".maskint").numeric({
                allow: "."
            }), e(".maskfloat").numeric({
                allow: "."
            }), e("#email").alphanumeric({
                allow: "@._-"
            }), e("#phoneext").mask("(999) 999-9999? x99999"), e(".gomas").mask("999/999/999"), e("#tin").mask("99-9999999"), e(".fecha").mask("99/99/9999"), e("#ssn").mask("999-99-9999"), e("#eyescript").mask("~9.99 ~9.99 999"), e(".goma").mask(gomaMask, spOptions), e(".aro").mask("R00/0H")
        }), jQuery.each(arrPlaceholders, function (e, a) {
            $("#" + e).attr("placeholder", a)
        }), $.each(arrFormAlertas, function (e, a) {
            $("#" + e).attr("data-validation-error-msg", a)
        }), $("#password").length > 0) {
        var a = $("#password");
        if (a.attr("data-validation", "length required "), a.attr("data-validation-length", "min4"), $("#password2").length > 0) {
            var o = $("#password2");
            $("#password, #password2").bind("keyup paste change focus blur", function () {
                "" != o.val() && a.val() == o.val() ? (o.parent().removeClass("has-error"), o.removeClass("error"), o.parent().addClass("has-success"), o.addClass("valid")) : (console.log(a.val() + "  " + o.val()), o.parent().removeClass("has-success"), o.removeClass("valid"), o.parent().addClass("has-error"), o.addClass("error"))
            })
        }
    }
    $("#precio1").length > 0 && ($precio = $("#precio"), $precio.attr("data-validation", "length required "), $precio.attr("data-validation-length", "max8"), $("#precio").bind("keyup paste change blur", function () {
        $("#precio").val() <= 0 || $("#precio").val().length > 8 ? ($precio.parent().removeClass("has-success"), $precio.removeClass("valid"), $precio.parent().addClass("has-error"), $precio.addClass("error")) : ($precio.parent().removeClass("has-error"), $precio.removeClass("error"), $precio.parent().addClass("has-success"), $precio.addClass("valid"))
    }), $("#precio").keypress(function (e) {
        switch (e.key) {
            case "0":
            case "1":
            case "2":
            case "3":
            case "4":
            case "5":
            case "6":
            case "7":
            case "8":
            case "9":
            case "Backspace":
            case "ArrowLeft":
            case "ArrowRight":
            case "ArrowUp":
            case "ArrowDown":
            case "Delete":
            case ".":
                return !0;
            default:
                return !1
        }
    })), $("#telefono1").length > 0 && ($telefono1 = $("#telefono1"), $telefono1.attr("data-validation", "length required "), $telefono1.attr("data-validation-length", "min14"), $("#telefono1").bind("keyup paste change", function () {
        $telefono1.val().substring(1, 4) in {
            809: 1,
            829: 1,
            849: 1
        } ? ($telefono1.parent().removeClass("has-error"), $telefono1.removeClass("error"), $telefono1.parent().addClass("has-success"), $telefono1.addClass("valid")) : ($telefono1.parent().removeClass("has-success"), $telefono1.removeClass("valid"), $telefono1.parent().addClass("has-error"), $telefono1.addClass("error"))
    })), $("#gomaaro").length > 0 && $("#gomaaro").bind("keyup", function () {
        ponerElCursorAlFinal("gomaaro")
    }), $("#articulo").length > 0 && "" == $("#articulo").val() && $("#frmpublicar select").change(function () {
        var e = this.value.split("-"),
            a = e[0],
            o = e[1],
            t = "",
            i = "";
        switch (a) {
            case "4":
                o in {
                    150: 1,
                    157: 1
                } && $("#marca, #modelo").change(function (e) {
                    i = "";
                    var a = 0 != $("#marca").find("option:selected").val() ? $("#marca").find("option:selected").text() : "",
                        o = 0 != $("#modelo").find("option:selected").val() ? $("#modelo").find("option:selected").text() : "";
                    i = a + " " + o, $("#articulo").val(i)
                });
                break;
            case "10":
                o in {
                    129: 1,
                    144: 1,
                    145: 1
                } && $("#marca, #modelo, #anio, #combustible").change(function (e) {
                    i = "";
                    var a = 0 != $("#marca").find("option:selected").val() ? $("#marca").find("option:selected").text() : "",
                        o = 0 != $("#modelo").find("option:selected").val() ? $("#modelo").find("option:selected").text() : "",
                        t = 0 != $("#anio").find("option:selected").val() ? $("#anio").find("option:selected").text() : "",
                        r = 0 != $("#combustible").find("option:selected").val() ? $("#combustible").find("option:selected").text() : "";
                    i = a + " " + o + " " + t + " " + r, $("#articulo").val(i)
                });
                break;
            case "8":
                $("#brprovincia, #brsector, #habitaciones,#banos,#parqueos,#mconstruidos,#mterreno").change(function (e) {
                    i = "";
                    var a = 0 != $("#brprovincia").find("option:selected").val() ? $("#brprovincia").find("option:selected").text() : "",
                        r = 0 != $("#brsector").find("option:selected").val() ? $("#brsector").find("option:selected").text() : "",
                        n = 0 != $("#habitaciones").find("option:selected").val() ? $("#habitaciones").find("option:selected").text() : "",
                        l = (0 != $("#banos").find("option:selected").val() && $("#banos").find("option:selected").text(), 0 != $("#parqueos").find("option:selected").val() ? $("#parqueos").find("option:selected").text() : "");
                    0 != $("#mconstruidos").find("option:selected").val() && $("#mconstruidos").find("option:selected").text(), 0 != $("#mterreno").find("option:selected").val() && $("#mterreno").find("option:selected").text();
                    "211" == o ? ($("#articulo").attr("placeholder", "Escbribe las palabras aparta estudio o habitacion para auto completar"), i = " en " + a + " en sector " + r) : "76" == o ? (i = "Apartamento en sector " + r + " " + n + " habitaciones " + l + " parqueos", $("#articulo").val(i)) : "207" == o && ($("#articulo").attr("placeholder", "Escbribe la palabra casa o villa para auto completar"), i = " en sector " + r + " " + n + " habitaciones " + l + " parqueos"), $("#articulo").on("keyup", function () {
                        (t = this.value).toLowerCase() in {
                            "aparta estudio": 1,
                            habitacion: 1,
                            casa: 1,
                            villa: 1
                        } && (t += i, $("#articulo").val(t))
                    })
                })
        }
    }), $(".col-xs-12:has(#Enviar)").css("padding", "0px")
});