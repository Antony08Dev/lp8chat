<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
   table.tabs {
    border-collapse: separate;
    border-spacing: 0;
    background-color: transparent;
    font-size: 0.9em;
    }
th.tabck {
    border: gray solid 1px;
    border-bottom: 0;
    border-radius: 0.5em 0.5em 0 0;
    background-color: transparent;
    padding: 0.3em;
    text-align: center;
    cursor: pointer;
    }
th.tabcks {
    border: 0;
    border-bottom: gray solid 1px;
    }
th.tabcks:first-child {
    border-left: gray solid 1px;
    }
th.tabcks:last-child {
    border-right: gray solid 1px;
    }
table.tabs tr:first-child th.tabcks {
    border-left: none;
    border-right: none;
    }
table.tabs[data-filas] th.tabck {
    box-shadow: 0 -0.15em 0.1em 0 white;
    }
table.tabs td {
    border: gray solid 1px;
    border-top: 0;
    }
tr.filadiv {
    background-color: rgb(235, 235, 225);
    }
/* El ancho y alto de los div.tabdiv se configuran
en cada aplicación */
div.tabdiv {
    background-color: rgb(235, 235, 225);
    border: 0;
    padding: 0.5em;
    overflow: auto;
    display: none;
    width: 100%;
    height: auto;
    } 
</style>
<body>
<table class="tabs" data-min="0" data-max="2">
    <tr>
        <th class="tabcks">&nbsp;</th>
        <th class="tabck" id="tabck-0" onclick="activarTab(this)">Primera</th>
        <th class="tabcks">&nbsp;</th>
        <th class="tabck" id="tabck-1" onclick="activarTab(this)">Segunda</th>
        <th class="tabcks">&nbsp;</th>
        <th class="tabck" id="tabck-2" onclick="activarTab(this)">Tercera</th>
    </tr>
    <tr class="filadiv">
        <td colspan="6" id="tab-0">
            <div class="tabdiv" id="tabdiv-0">
                <p>id=tabdiv-0</p>...
            </div>
            <div class="tabdiv" id="tabdiv-1">
                <p>id=tabdiv-1</p>...
            </div>
            <div class="tabdiv" id="tabdiv-2">
                <p>id=tabdiv-2</p>...
            </div>
        </td>
    </tr>
</table>

</body>
<script>
    function activarTab(unTab) {
    try {
        //Los elementos div de todas las pestañas están todos juntos en una
        //única celda de la segunda fila de la tabla de estructura de pestañas.
        //Hemos de buscar la seleccionada, ponerle display block y al resto
        //ponerle display none.
        var id = unTab.id;
        if (id){
            var tr = unTab.parentNode || unTab.parentElement;
            var tbody = tr.parentNode || tr.parentElement;
            var table = tbody.parentNode || tbody.parentElement;
            //Pestañas en varias filas
            if (table.getAttribute("data-filas")!=null){
                var filas = tbody.getElementsByTagName("tr");
                var filaDiv = filas[filas.length-1];
                tbody.insertBefore(tr, filaDiv);
            }
            //Para compatibilizar con la versión anterior, si la tabla no tiene los
            //atributos data-min y data-max le ponemos los valores que tenían antes del
            //cambio de versión.
            var desde = table.getAttribute("data-min");
            if (desde==null) desde = 0;
            var hasta = table.getAttribute("data-max");
            if (hasta==null) hasta = MAXTABS;
            var idTab = id.split("tabck-");
            var numTab = parseInt(idTab[1]);
            //Las "tabdiv" son los bloques interiores mientras que los "tabck"
            //son las pestañas.
            var esteTabDiv = document.getElementById("tabdiv-" + numTab);
            for (var i=desde; i<=hasta; i++) {
                var tabdiv = document.getElementById("tabdiv-" + i);
                if (tabdiv) {
                    var tabck = document.getElementById("tabck-" + i);
                    if (tabdiv.id == esteTabDiv.id) {
                        tabdiv.style.display = "block";
                        tabck.style.color = "slategrey";
                        tabck.style.backgroundColor = "rgb(235, 235, 225)";
                        tabck.style.borderBottomColor = "rgb(235, 235, 225)";
                    } else {
                        tabdiv.style.display = "none";
                        tabck.style.color = "white";
                        tabck.style.backgroundColor = "gray";
                        tabck.style.borderBottomColor = "gray";
                    }
                }
            }
        }
    } catch (e) {
        alert("Error al activar una pestaña. " + e.message);
    }
}

</script>
</html>