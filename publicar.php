<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>publicar</title>
    <!--Bootstrap 4-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css"> -->
    <!-- <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css"> -->
    <link rel="stylesheet" type="text/css" href="/css/lplugins.pack.css">
    <link rel="stylesheet" type="text/css" href="/css/lp.css">
    <!--Scripts-->
    <meta name="theme-color" content="#ffffff">
    <link rel="shortcut icon" href="/i/favicon.ico" />
    <link rel="apple-touch-icon" sizes="180x180" href="/i/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/i/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/i/favicon-16x16.png">
    <link rel="stylesheet" href="/css/lplugins.pack.css">
    <script type="text/javascript">
        var msgusuarios = new Array();
        var tasadolar = 58;
        var PinesLP = 6;
        var PinesLPM = 13;
        var precioPines = 50;
        var precioRenovaciones = 200;
        var precioRam = 350;
        var precioAofertas = 1500;
        var lpDireccion = 'C/ El Sol #40, Las Galaxias, Santo Domingo Oeste, Rep&uacute;blica Dominicana';
        var lpTelefono = '(809) 549-6581';
        var fbappid = '1006821229445963';
        var uid = 3;
        var balancePines = 0;
        var hostEstatico = '';
    </script>
    <script language="JavaScript" type="text/javascript" src="https://connect.facebook.net/es_ES/all.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script async='async' src='https://www.googletagservices.com/tag/js/gpt.js'></script>
    <!--[if IE]>
	<script src="/js/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="/js/modernizr.custom.js"></script>
    <script language="JavaScript" type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script language="JavaScript" type="text/javascript" src="/lib/jqueryfiler1.3/js/jquery.filer.min.js"></script>
    <script language="JavaScript" type="text/javascript" src="/lib/ckeditor/ckeditor.js"></script>
    <script language="JavaScript" type="text/javascript" src="/js/lpvars.js"></script>
    <script language="JavaScript" type="text/javascript" src="/js/lplugins.pack.js"></script>
    <script language="JavaScript" type="text/javascript" src="/js/lp.js"></script>
    <script language="JavaScript" type="text/javascript" src="/js/lpforms.js"></script>
</head>

<body>
    <header class="">
        <div class="navbar navbar-inverse cinta flexr">
            <div class="container">
                <div class="navbar-header ">
                    <a class="navbar-brand" href="/">
                        <img alt="La Pulga Virtual" src="/i/logo4.png">
                    </a>
                    <!-- <a class="navbar-brand titulocinta"></a> -->

                    <button type="button" class="navbar-toggle collapsed btnopciones" data-toggle="collapse"
                        data-target=".navbar-collapse" aria-expanded="false">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="navbar-collapse collapse" style="margin: 10px; height: 1px;">
                    <!--area de menu en tope-->
                    <ul class="nav navbar-nav navbar-right">

                        <li><a href="/mensajes" title="KLK Messenger">KLK <span class="badge red">0</span></a>
                        <li>
                            <!-- <li><a href="/publicar">Realiza Publicación</a><li> -->
                        <li class="dropdown hidden-xs hidden-sm"> <a data-toggle="dropdown" class="dropdown-toggle"
                                href="/mipulga"><span class="puntorojo"></span>JOELPEREYRA (Mi Pulga) <i
                                    class="fa fa-angle-down " style="margin-right: 0px; "></i></a>
                            <ul class="list-group dropdown-menu submenu">
                                <li><a href="/registro">Registra a otro usuario</a></li>

                                <li><a href="/mensajes">Mensajes</a>
                                <li>
                                <li><a href="/mipulga">Mis Publicaciones</a></li>
                                <li><a href="/micuenta">Mi Cuenta</a></li>
                                <li><a href="/favoritas">Publicaciones Favoritas <span class="icol tt badge green"><i
                                                class="fa fa-star"></i>&nbsp; 1</span></a></li>
                                <li><a href="/logout">Cerrar Sesión</a></li>
                            </ul>
                        </li>
                        <li class=" dropdown">
                            <a href="/opciones" class="dropdown-toggle" data-toggle="dropdown">Opciones <i
                                    class="fa fa-angle-down " style="margin-right: 0px;"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="/planes"><b>Adquiere tu Tienda Virtual</b></a></li>
                                <li><a href="/pines">Adquiere PINES <span class='icol tt badge green'>balance
                                            0</span></a> </li>
                                <li class="hidden-xs"><a href="/renovacionesmultiples">Renovaciones
                                        Autom&aacute;ticas</a></li>
                                <li class="hidden-xs"><a href="/misenlaces">Enlaces Patrocinados</a></li>
                                <li><a href="/opciones">Todas las Opciones</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"> <a data-toggle="dropdown" class="dropdown-toggle" href="#">Ayuda <i
                                    class="fa fa-angle-down " style="margin-right: 0px; "></i></a>
                            <ul class="dropdown-menu submenu">
                                <li><a href="/ayuda" target="_blank">Ayuda, Preguntas y Respuestas</a></li>
                                <li><a href="/soporte">Contacto o soporte</a></li>
                                <li><a href="/emailactivacion">Email de Activaci&oacute;n</a></li>
                            </ul>
                        </li>
                        <li class="hidden-xs"><a href="http://blog.lapulga.com.do" target="_blank">Blog</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <div class="container ">
        <!-- cintillos informativos -->
        <div class="row mtop ">
        </div>

        <div class="col-md-9 col-sm-9 col-xs-12 pull-left">
            <form action="/publicar" class="form-horizontal" method="post" id="frmpublicar"
                enctype="multipart/form-data">
                <div class="panel panel-default ">
                    <div class="panel-heading">
                        <h3>Realiza Publicación</h3>
                    </div>
                    <div class="panel-body">
                        <noscript>
                            <h2>Estimado usuario, debes habilitar el javascript para poder usar este formulario</h2>
                        </noscript>
                        <h5><strong>Recuerda no repetir, <a href="javascript:;"
                                    onclick="$('#msugerenciaspub').modal();">ver sugerencias.</a></strong></span></h5>
                        <hr />
                        <input type="hidden" name="inicio" value="1660839464" /> <input type="hidden"
                            name="datoscategoria" id="datoscategoria" value="" />
                        <input type="hidden" name="uid" id="uid" value="3" />
                        <input type="hidden" name="ssid" id="ssid" value="6960c10c76477d757533c264d73edfdb" />
                        <input type="hidden" name="pines" id="pines" value="0" />
                        <!--Categorias-->
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="categoria">Categor&iacute;a.:</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="categoria" id="categoria">
                                    <option value="" selected>Seleccione</option>
                                    <optgroup label="Empleos">
                                        <option value="7-240">Oferta de Empleo (Empresas)</option>
                                        <option value="7-168">Solicitud de Empleo (Cantidatos)</option>
                                    </optgroup>
                                    <!-- <optgroup label="Servicios" >
							<option value="S">Publicación de Servicios Varios</option>
						</optgroup> -->
                                    <optgroup label="Animales">
                                        <option value="11-190">Aves </option>
                                        <option value="11-192">Caninos</option>
                                        <option value="11-194">Equinos</option>
                                        <option value="11-193">Felinos</option>
                                        <option value="11-202">Otros Animales</option>
                                        <option value="11-191">Peces</option>
                                        <option value="11-195">Vacunos</option>
                                    </optgroup>
                                    <optgroup label="Articulos Personales">
                                        <option value="6-200">Accesorios y Cosmesticos</option>
                                        <option value="6-348">Niños y Bebes</option>
                                        <option value="6-50">Otros Articulos Personales</option>
                                        <option value="6-54">Ropa y calzado Hombre </option>
                                        <option value="6-53">Ropa y calzado Mujer</option>
                                    </optgroup>
                                    <optgroup label="Bienes Raices">
                                        <option value="8-211">Aparta - Estudio - Habitaciones</option>
                                        <option value="8-76">Apartamentos </option>
                                        <option value="8-207">Casas - Villas</option>
                                        <option value="8-77">Edificios - Naves - Locales</option>
                                        <option value="8-80">Fincas - Solares - Mejoras</option>
                                        <option value="8-78">Otros Bienes Raices</option>
                                    </optgroup>
                                    <optgroup label="Celulares">
                                        <option value="4-155">Accesorios - Baterias - Cargadores</option>
                                        <option value="4-187">Desbloqueos</option>
                                        <option value="4-150">Housing Cases</option>
                                        <option value="4-151">Tarjetas - Memorias - Pantallas</option>
                                        <option value="4-157">Telefonos - Aparatos</option>
                                    </optgroup>
                                    <optgroup label="Computadoras">
                                        <option value="1-1">Equipos Completos</option>
                                        <option value="1-3">Impresoras - plotters - tintas</option>
                                        <option value="1-14">Laptops - Accesorios - Tabletas</option>
                                        <option value="1-11">Otros Computadoras</option>
                                        <option value="1-6">Programas - Softwares</option>
                                        <option value="1-2">Redes - Internet - Telefonia IP</option>
                                    </optgroup>
                                    <optgroup label="Deportes">
                                        <option value="13-214">Acuaticos - Natacion - Pesca</option>
                                        <option value="13-217">Baseball - Softball - Basketball</option>
                                        <option value="13-221">Ciclismo </option>
                                        <option value="13-222">Gimnacia - Tenis - Patinaje</option>
                                        <option value="13-241">Otros Deportes</option>
                                        <option value="13-243">Paintball</option>
                                        <option value="13-242">Proteinas Nutricionales</option>
                                        <option value="13-216">Ropa y Accesorios</option>
                                    </optgroup>
                                    <optgroup label="Electrodomesticos">
                                        <option value="19-334">Estufas - Microhondas - Hornos </option>
                                        <option value="19-330">Lavadoras - Planchas - Abanicos</option>
                                        <option value="19-329">Neveras - Congeladores - Aires</option>
                                        <option value="19-342">Otros Electrodomoesticos</option>
                                        <option value="19-337">Televisores y Radios</option>
                                    </optgroup>
                                    <optgroup label="Electronicos">
                                        <option value="2-343">Drones</option>
                                        <option value="2-346">Entretenimiento</option>
                                        <option value="2-20">Equipos de Comunicacion</option>
                                        <option value="2-12">Equipos Medicos Industriales</option>
                                        <option value="2-347">Foto y Video</option>
                                        <option value="2-21">Herramientas - Utilidades</option>
                                        <option value="2-344">Juegos Electronicos</option>
                                        <option value="2-345">Musica</option>
                                        <option value="2-23">Otros Electronicos</option>
                                        <option value="2-16">Reproductores MP3 y Audio Video</option>
                                        <option value="2-15">Seguridad - Camaras - DVR</option>
                                    </optgroup>
                                    <optgroup label="Herramientas">
                                        <option value="12-290">Ebanisteria y carpinteria</option>
                                        <option value="12-291">Electricas y Electronicas</option>
                                        <option value="12-293">Jardineria - Cerrajeria - Zapateria</option>
                                        <option value="12-303">Manuales y Guias </option>
                                        <option value="12-301">Medicas y Odontologica</option>
                                        <option value="12-306">Otras</option>
                                        <option value="12-295">Soldadura - Mecanica - Industriales</option>
                                    </optgroup>
                                    <optgroup label="Hogar">
                                        <option value="3-24">Banos y Accesorios </option>
                                        <option value="3-25">Cocina - Utensilios - Vajilla</option>
                                        <option value="3-32">Comedor - Sala - Habitacion</option>
                                        <option value="3-26">Cuadros - Pinturas - Artes</option>
                                        <option value="3-27">Decoracion - Lamparas - Vitrales</option>
                                        <option value="3-136">Inversores y Baterias</option>
                                        <option value="3-29">Jardin - Terraza - Patio</option>
                                        <option value="3-36">Otros Hogar</option>
                                    </optgroup>
                                    <optgroup label="Otros">
                                        <option value="7-71">Alimentos y Bebidas</option>
                                        <option value="7-37">Antiguedades y Artesanias</option>
                                        <option value="7-176">Cigarros </option>
                                        <option value="7-70">Cursos - Academias - Entrenamientos</option>
                                        <option value="7-63">Equipos para Negocios</option>
                                        <option value="7-69">Joyeria</option>
                                        <option value="7-213">Libros - enciclopedias - educativos</option>
                                        <option value="7-68">Medicina </option>
                                        <option value="7-170">Mobiliario de Oficinas </option>
                                        <option value="7-240">Ofertas de Empleo y Empresas</option>
                                        <option value="7-42">Otros Articulos</option>
                                        <option value="7-349">Plantas Electricas</option>
                                        <option value="7-206">Puntos Comerciales y Negocios</option>
                                        <option value="7-279">Seguridad</option>
                                        <option value="7-168">Solicitud de Empleo y Candidatos</option>
                                    </optgroup>
                                    <optgroup label="Vehiculos">
                                        <option value="10-320">Aros o Rines </option>
                                        <option value="10-129">Carros </option>
                                        <option value="10-119">Equipos - Audio - Accesorios </option>
                                        <option value="10-244">Gomas o Neumaticos </option>
                                        <option value="10-144">Jeepetas y Camionetas</option>
                                        <option value="10-130">Motocicletas </option>
                                        <option value="10-350">Movilidad Electrica</option>
                                        <option value="10-133">Otros Vehiculos</option>
                                        <option value="10-125">Repuestos - Autos - Motos</option>
                                        <option value="10-321">Sistemas GLP y GNC</option>
                                        <option value="10-145">Vehiculos Pesados y Autobuses</option>
                                    </optgroup>
                                </select>
                            </div>
                        </div>
                        <!--Campos para cada categoria-->

                        <div class="form-group add hide s_CE s_VE">
                            <label for="marca" class="col-sm-2 control-label col-sm-offset-2">Marca.: </label>
                            <div class="col-sm-4">
                                <select class="form-control" name="marca" id="marca">
                                    <option value="">Seleccione</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group add hide s_CE s_VE">
                            <label for="modelo" class="col-sm-2 control-label col-sm-offset-2">Modelo.: </label>
                            <div class="col-sm-4">
                                <select class="form-control" name="modelo" id="modelo">
                                    <option value="">Seleccione</option>
                                </select>
                            </div>
                        </div>


                        <div class="form-group add hide s_VE">
                            <label for="anio" class="col-sm-2 control-label col-sm-offset-2">Año.:</label>
                            <div class="col-sm-3">
                                <select name="anio" id="anio" class="form-control">
                                    <option value="" selected>Seleccione</option>
                                    <option value="2022">2022</option>
                                    <option value="2021">2021</option>
                                    <option value="2020">2020</option>
                                    <option value="2019">2019</option>
                                    <option value="2018">2018</option>
                                    <option value="2017">2017</option>
                                    <option value="2016">2016</option>
                                    <option value="2015">2015</option>
                                    <option value="2014">2014</option>
                                    <option value="2013">2013</option>
                                    <option value="2012">2012</option>
                                    <option value="2011">2011</option>
                                    <option value="2010">2010</option>
                                    <option value="2009">2009</option>
                                    <option value="2008">2008</option>
                                    <option value="2007">2007</option>
                                    <option value="2006">2006</option>
                                    <option value="2005">2005</option>
                                    <option value="2004">2004</option>
                                    <option value="2003">2003</option>
                                    <option value="2002">2002</option>
                                    <option value="2001">2001</option>
                                    <option value="2000">2000</option>
                                    <option value="1999">1999</option>
                                    <option value="1998">1998</option>
                                    <option value="1997">1997</option>
                                    <option value="1996">1996</option>
                                    <option value="1995">1995</option>
                                    <option value="1994">1994</option>
                                    <option value="1993">1993</option>
                                    <option value="1992">1992</option>
                                    <option value="1991">1991</option>
                                    <option value="1990">1990</option>
                                    <option value="1989">1989</option>
                                    <option value="1988">1988</option>
                                    <option value="1987">1987</option>
                                    <option value="1986">1986</option>
                                    <option value="1985">1985</option>
                                    <option value="1984">1984</option>
                                    <option value="1983">1983</option>
                                    <option value="1982">1982</option>
                                    <option value="1981">1981</option>
                                    <option value="1980">1980</option>
                                    <option value="1979">1979</option>
                                    <option value="1978">1978</option>
                                    <option value="1977">1977</option>
                                    <option value="1976">1976</option>
                                    <option value="1975">1975</option>
                                    <option value="1974">1974</option>
                                    <option value="1973">1973</option>
                                    <option value="1972">1972</option>
                                    <option value="1971">1971</option>
                                    <option value="1970">1970</option>
                                    <option value="1969">1969</option>
                                    <option value="1968">1968</option>
                                    <option value="1967">1967</option>
                                    <option value="1966">1966</option>
                                    <option value="1965">1965</option>
                                    <option value="1964">1964</option>
                                    <option value="1963">1963</option>
                                    <option value="1962">1962</option>
                                    <option value="1961">1961</option>
                                    <option value="1960">1960</option>
                                    <option value="1959">1959</option>
                                    <option value="1958">1958</option>
                                    <option value="1957">1957</option>
                                    <option value="1956">1956</option>
                                    <option value="1955">1955</option>
                                    <option value="1954">1954</option>
                                    <option value="1953">1953</option>
                                    <option value="1952">1952</option>
                                    <option value="1951">1951</option>
                                    <option value="1950">1950</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group add hide s_VE">
                            <label for="combustible"
                                class="col-sm-2 control-label col-sm-offset-2">Combustible.:</label>
                            <div class="col-sm-3">
                                <select name="combustible" id="combustible" class="form-control">
                                    <option value="" selected>Seleccione</option>
                                    <option value="1">Diesel</option>
                                    <option value="2">Gas</option>
                                    <option value="3">Gas/Gasolina</option>
                                    <option value="4">Gasolina</option>
                                    <option value="5">Gas Natural</option>
                                    <option value="6">GLP de Fabrica</option>
                                    <option value="7">Electrico</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group add hide s_go">
                            <label for="gomaaro" class="col-sm-2 control-label" id="lblgoma"></label>
                            <div class="col-sm-3">
                                <input name="gomaaro" id="gomaaro" class="form-control ttb" title="<br />
<b>Notice</b>:  Undefined variable: tplformatoga in <b>E:\Trabajos\lpv7\tpl\frmpublicar.tpl</b> on line <b>83</b><br />
" />
                            </div>
                        </div>
                        <!--campos s_IN-->
                        <div class="form-group add s_IN s_in-ap s_in-app s_in-sfm hide">
                            <label for="brprovincia" class="col-sm-2 control-label col-sm-offset-2">Provincia.:</label>
                            <div class="col-sm-4">
                                <select name="brprovincia" id="brprovincia" class="form-control">
                                    <option value="" selected>Seleccione</option>
                                    <option value='1'>Azua</option>
                                    <option value='2'>Bahoruco</option>
                                    <option value='3'>Barahona</option>
                                    <option value='4'>Dajabon</option>
                                    <option value='5'>Duarte</option>
                                    <option value='6'>Elias Pina</option>
                                    <option value='7'>El Seibo</option>
                                    <option value='8'>Espaillat</option>
                                    <option value='9'>Hato Mayor</option>
                                    <option value='10'>Hermanas Mirabal</option>
                                    <option value='11'>Independencia</option>
                                    <option value='12'>La Altagracia</option>
                                    <option value='13'>La Romana</option>
                                    <option value='14'>La Vega</option>
                                    <option value='15'>Maria Trinidad Sánchez</option>
                                    <option value='16'>Monsenor Nouel</option>
                                    <option value='17'>Montecristi</option>
                                    <option value='18'>Monte Plata</option>
                                    <option value='19'>Pedernales</option>
                                    <option value='20'>Peravia</option>
                                    <option value='21'>Puerto Plata</option>
                                    <option value='22'>Samana</option>
                                    <option value='23'>San Cristobal</option>
                                    <option value='24'>San Jose de Ocoa</option>
                                    <option value='25'>San Juan</option>
                                    <option value='26'>San Pedro de Macoris</option>
                                    <option value='27'>Sanchez Ramirez</option>
                                    <option value='28'>Santiago</option>
                                    <option value='29'>Santiago Rodriguez</option>
                                    <option value='30'>Santo Domingo</option>
                                    <option value='31'>Valverde</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group add s_IN s_in-ap s_in-app s_in-sfm hide">
                            <label for="brsector" class="col-sm-2 control-label col-sm-offset-2">Sector.:</label>
                            <div class="col-sm-4">
                                <select name="sector" id="brsector" class="form-control">
                                    <option value="" selected>Primero seleccione provincia</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group add s_IN s_in-app hide">
                            <label for="habitaciones"
                                class="col-sm-2 control-label col-sm-offset-2">Habitaciones.:</label>
                            <div class="col-sm-3">
                                <select name="habitaciones" id="habitaciones" class="form-control">
                                    <option value="" selected>Seleccione</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="99">Mas de 7 Habitaciones</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group add s_IN s_in-app hide">
                            <label for="banos" class="col-sm-2 control-label col-sm-offset-2">Baños</label>
                            <div class="col-sm-3">
                                <select name="banos" id="banos" class="form-control">
                                    <option value="">Seleccione</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="99">Mas de 7 Baños</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group add s_IN s_in-app hide">
                            <label for="parqueos" class="col-sm-2 control-label col-sm-offset-2">Parqueos.:</label>
                            <div class="col-sm-3">
                                <select name="parqueos" id="parqueos" class="form-control">
                                    <option value="" selected>Seleccione</option>
                                    <option value="0" selected="selected">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="99">Mas de 7 Parqueos</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group add s_IN s_in-app hide">
                            <label for="mconstruidos" class="col-sm-3 control-label col-sm-offset-1">Metros ^2
                                Construidos.:</label>
                            <div class="col-sm-3">
                                <select name="mconstruidos" id="mconstruidos" class="form-control">
                                    <option value="" selected>Seleccione</option>
                                    <option value="1">de 50 a 100</option>
                                    <option value="2">de 101 a 200</option>
                                    <option value="3">de 201 a 300</option>
                                    <option value="4">de 301 a 400</option>
                                    <option value="5">de Mas de 401</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group add s_IN hide">
                            <label for="mterreno" class="col-sm-3 control-label col-sm-offset-1">Metros ^2
                                Terreno.:</label>
                            <div class="col-sm-3">
                                <select name="mterreno" id="mterreno" class="form-control">
                                    <option value="" selected>Seleccione</option>
                                    <option value="1">de 50 a 100</option>
                                    <option value="2">de 101 a 200</option>
                                    <option value="3">de 201 a 300</option>
                                    <option value="4">de 301 a 400</option>
                                    <option value="5">de 401 a 500</option>
                                    <option value="6">de Mas de 501</option>
                                </select>
                            </div>
                        </div>
                        <!--fin campos s_IN-->
                        <!--Radios Tipo-->
                        <div class="form-group add hide s_IN s_in-sfm s_in-app s_in-ap s_VE">
                            <label class="col-sm-2 control-label ">Tipo.:</label>
                            <div class="col-sm-9">
                                <div class="radio" id="tipo">
                                    <label for="venta">
                                        <input type="radio" name="tipo" id="venta" value="V" checked>Venta
                                    </label>&nbsp;&nbsp;
                                    <label for="compra">
                                        <input type="radio" name="tipo" id="compra" value="C">Compra
                                    </label>
                                    <label for="alquiler">
                                        <input type="radio" name="tipo" id="alquiler" value="A">Alquiler
                                    </label>
                                    <label for="empleo" style="display:none;">
                                        <input type="radio" name="tipo" id="empleo" value="E"
                                            style="display:none;">Empleo
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" id="condicion">
                            <label class="col-sm-2 control-label" for="condicion">Condici&oacute;n.:</label>
                            <div class="col-sm-9">
                                <div class="radio">
                                    <label for="nuevo">
                                        <input type="radio" name="condicion" id="nuevo" value="1" checked>Nuevo
                                    </label>
                                    <label for="usado">
                                        <input type="radio" name="condicion" id="usado" value="2">Usado
                                    </label>
                                    <label for="renovado">
                                        <input type="radio" name="condicion" id="renovado" value="3">Renovado</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="articulo">T&iacute;tulo.:</label>
                            <div class="col-sm-9">
                                <input maxlength="70" name="articulo" id="articulo" value="" class="form-control"
                                    type="text">
                            </div>
                        </div>
                        <div class="form-group hide" id="moneda">
                            <label class="col-sm-2 control-label" for="precio"><span
                                    id="lblprecio">Precio.:</span></label>
                            <div class="col-sm-3">
                                <input class="form-control ttb "
                                    title="Recomendacion <br/> No es necesario agrega puntos (.) o comas (,) al precio, el sistema lo hace por ti."
                                    type="number" name="precio" id="precio">
                            </div>
                            <div class="col-sm-3 col-xs-12">
                                <div class="radio">
                                    <label for="peso">
                                        <input type="radio" name="moneda" id="peso" value="R" checked>RD$
                                    </label>
                                    <label for="dolar">
                                        <input type="radio" name="moneda" id="dolar" value="U">US$
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="descripcion">Descipci&oacute;n.:</label>
                            <div class="col-sm-9">
                                <textarea class="form-control" name="descripcion" id="descripcion" rows="5"></textarea>
                                <label class="text-danger hide"> <span
                                        id="caracteress">1000</span>&nbsp;<span>Carácteres Máximo</span></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="urlvideo" class="col-sm-2 control-label">Video.:</label>
                            <div class="col-sm-6">
                                <input class="form-control tt" name="urlvideo" id="urlvideo"
                                    title="Este campo es opcional por si tienes un video de YouTube">
                            </div>
                            <div class="col-sm-4">
                                <span><a href="http://www.youtube.com" target="_blank" class="youtube"
                                        id="lnkyoutube"><strong style="line-height: 34px;">Buscar en
                                            YouTube</strong></a></span>

                            </div>
                        </div>
                                <script>
                                    $(function() {
                                        $('input[type=file]').change(function(){
                                            var t = $(this).val();
                                            var labelText = 'File : ' + t.substr(12, t.length);
                                            $(this).prev('label').text(labelText);
                                        })
                                    });
                                </script>
                        <link rel="stylesheet" type="text/css" href="/css/lpformfile.css">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="fotos">Foto(s).:</label>
                            <div class="form-group">
                                <div class="col-md-9">
                                    <span class="control-fileupload">
                                        <label for="file">Choose a file :</label>
                                        <input type="file" id="file">
                                    </span>
                                </div>

                                <!-- <div class="custom-file mb-2">
                                    <input class="custom-file-input" type="file" name="fotos[]" id="fotos_1"
                                        multiple="multiple">
                                    <label class="custom-file-label" for="fotos_1">Choose file...</label>
                                    <div class="invalid-feedback">Example invalid custom file feedback</div>
                                </div> -->
                            </div>



                        </div>
                        <h4 class="azul">Destaca tu publicacion &dArr; &dArr; &dArr; <span class="rojo">(No es
                                obligatorio).</span></h4>
                        <div class="form-group">
                            <label for="opcional" class="col-sm-2 control-label">Resaltar.:</label>
                            <div class="col-sm-6">
                                <select name="opcional" size="1" id="opcional" class="cmbformularios form-control">
                                    <option value="N">Seleccione (opcional)</option>
                                    <option value="1">5 Dias - 1 PIN</option>
                                    <option value="2">10 Dias - 2 PINES</option>
                                    <option value="3">15 Dias - 3 PINES</option>
                                    <option value="4">20 Dias - 4 PINES</option>
                                    <option value="5">25 Dias - 5 PINES</option>
                                    <option value="MI">Mas informaci&oacute;n y ejemplo uso pines</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="vip" class="col-sm-2 control-label">Colocar VIP.:</label>
                            <div class="col-sm-6">
                                <select name="vip" size="1" id="vip" class="cmbformularios form-control">
                                    <option value="N">Seleccione (requiere foto)</option>
                                    <option value="V">1 Dia en pagina principal = 1 PIN</option>
                                    <option value="VC">2 Dias en seccion categoria = 1 PIN</option>
                                    <option value="VVC">1 pagina principal y 2 seccion categoria = 2 PINES</option>
                                    <option value="MI">Mas informacion y ejemplo uso pines</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-12 flexr flexw flexbt">
                            <span><strong style="line-height: 34px;"><a href="javascript:;"
                                        onclick="$('#mresaltar').modal();" target="_blank">¿Qu&eacute; son
                                        resaltados?</a></strong></span>
                            <span><strong style="line-height: 34px;"><a href="javascript:;"
                                        onclick="$('#mvip').modal();" target="_blank">¿Dónde están los
                                        VIP?</a></strong></span>
                            <span><strong style="line-height: 34px;"><a style="color:rgba(0,0,0,.7);" href="/pines"
                                        target="_blank" id="lnkpines">Balance.: <span id="balancepines"
                                            class='rojo'>0</span> Pines, agregar?</a></strong></span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-6 col-sm-offset-2">
                        <input name="Publicar" type="submit" id="Publicar" value="Publicar"
                            class="btn btn-success btn-lg" />
                        <input name="Cancelar" type="button" value="Cancelar" class="btn btn-success btn-lg"
                            onclick="location.href='/';" />
                        <span id="llenar">*Completar campos</span>
                    </div>
                </div>
            </form><!-- Modal para login -->
            <div class="modal fade" id="mlogin" tabindex="-1" role="dialog" aria-labelledby="mlogin">
                <div class="modal-dialog" role="document" style="z-index:9999;">
                    <div class="modal-content">
                        <div class="modal-body">
                            <form method="post" name="frmpublogin" id="frmpublogin">
                                <div class="form-group">
                                    <label for="login" class="control-label">Correo registrado.:</label>
                                    <input name="login" type="email" id="login" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="mpassword" class="control-label">Clave.:</label>
                                    <input name="mpassword" type="password" id="mpassword" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="chkrecuerdacuenta" class="control-label">Recuerda mi cuenta.:</label>
                                    <input type="checkbox" name="chkrecuerdacuenta" id="chkrecuerdacuenta" value="S" />
                                </div>
                                <input type="submit" id="btnlogin" class="btn btn-primary" value="Iniciar sesión" />
                                <button type="button" id="btnlogincancel" class="btn btn-default"
                                    data-dismiss="modal">Cancelar</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <a href="/olvideclave" target="_blank">Olvide clave, ay&uacute;dame</a>
                        </div>
                    </div>
                </div>
            </div><!-- Modal para mostrar resaltado -->
            <div class="modal fade" id="mresaltar" tabindex="-1" role="dialog" aria-labelledby="mresaltar">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <a href="#" class="pull-right close" data-dismiss="modal">x</a>
                            <h4 class="modal-title" id="exampleModalLabel">Resaltar publicaci&oacute;n</h4>
                        </div>
                        <div class="modal-body">
                            <p class="col-sm-12">
                                <a href="/i/aresal.gif" class="fancybox"><img src="/i/aresal.gif" height="100%"
                                        class="img-responsive"></a>
                            </p>
                        </div>
                        <div class="modal-footer">
                            <a href="/pines" target="_blank">Comprar PINES?</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="mvip" tabindex="-1" role="dialog" aria-labelledby="mvip">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <a href="#" class="pull-right close" data-dismiss="modal">X</a>
                            <h4 class="modal-title" id="exampleModalLabel">Publicaciones en VIP</h4>
                        </div>
                        <div class="modal-body">
                            <p class="col-sm-12">
                                <a href="/i/avip.gif" class="fancybox"><img src="/i/avip.gif" height="100%"
                                        class="img-responsive"></a>
                                <h4>Zona VIP en las Categor&iacute;as</h4>
                                <a href="/i/avipcat.gif" class="fancybox"><img src="/i/avipcat.gif" height="100%"
                                        class="img-responsive"></a>

                            </p>
                        </div>
                        <div class="modal-footer">
                            <a href="/pines" target="_blank">Comprar PINES?</a>
                        </div>
                    </div>
                </div>
            </div><!-- Modal para mostrar como hacer mejores publicaciones -->
            <div class="modal fade" id="msugerenciaspub" tabindex="-1" role="dialog" aria-labelledby="msugerenciaspub">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <a href="#" class="pull-right" data-dismiss="modal">[X]</a>
                            <h3 class="modal-title" id="exampleModalLabel">Cómo hacer mejores publicaciones</h3>
                        </div>
                        <div class="modal-body">
                            <h4>Antes de publicar</h4>
                            <p class="col-sm-12">
                                Si vas a vender varias cosas has una lista a mano o computadora con sus precios y foto.
                                Esto te ayudara a no repetir y asi evita que sean borradas por los operadores y que tu
                                cuenta pueda ser penalizada y hasta eliminada.
                            </p>
                            <h4>Al momento de publicar</h4>
                            <p class="col-sm-12">
                                El primer paso es seleccionar la categoria adecuada para tu producto, trata de no
                                colcarla en una incorrecta ya que otros usuarios pueden no verla.
                            </p>
                            <p class="col-sm-12">Escribe un titulo que realmente describa lo que publicas, nunca pongas
                                palabras como "me voy y lo vendo, me volvi loco, etc." ya que nadie busca por eso.</p>
                            <p class="col-sm-12">El precio debe ser el mas real posible, no abrevies precios como algo
                                de <b>RD$30,000</b> pongas <b>RD$30</b> nunca es lo mismo.</p>
                            <p class="col-sm-12">Toma siempre una foto real del producto, si no la tienes a mano
                                describe bien todo lo que tiene que le de seguridad al visitante de que cuando lo vea
                                sera lo mismo.</p>
                            <p class="col-sm-12">Sube fotos real del producto, sino, describe bien todo en la
                                descripcion.</p>
                            </p>
                            <h4>Despues de publicado</h4>
                            <p class="col-sm-12">
                                Cuando publicas algo el sistema le asigna un numero, si alguien la comparte o pone en
                                lista de favoritos usa ese numero. Si la borras y ya otras personas la tenian en la mira
                                pierdes la oportunidad de negocios, asi que dejala y solo renovala usando las
                                renovaciones automaticas (servicio pagado) o cada dos dias de forma manual (gratis) menu
                                Mi Pulga.
                            </p>
                            <p class="col-sm-12">Si la venta va lenta revisa la publicacion en el menu Mi Pulga, tambien
                                revisa tu email por si alguien te escribe mensaje. Si entiendes que puedes ajustar el
                                precio solo modificala en vez de crear otra nueva, de esa manera puedes ver si las
                                visitas aumentan y las personas que la han compartido se daran cuenta.</p>
                        </div>
                        <div class="modal-footer">
                            <h5 class="modal-title" id="exampleModalLabel">Comparte siempre tu mismo cada publicacion.
                                Para vender o comprar no tienes otro lugar</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <aside class="col-sm-3 col-xs-12 pull-right">

        </aside>
        <div class="borderb"></div>
        <div class="col-xs-12 mtop text-center">
            <!-- /1095516/LP_728X90 -->
            <br>
        </div>
    </div>
    <footer class="footer1" id="footer">
        <div class="container">
            <div class="row">
                <!-- row -->
                <!-- Categorias -->
                <div class="col-lg-6 col-md-12">
                    <ul class="list-unstyled clear-margins" id="fcats">
                        <li class="footer-container footer_nav_menu">
                            <h1 class="titulo-footer">Categorías</h1>
                            <ul class="ulcol col3">
                                <li></i><a href="/animales">Animales</a></li>
                                <li></i><a href="/articulos-personales">Articulos Personales</a></li>
                                <li></i><a href="/bienes-raices">Bienes Raices</a></li>
                                <li></i><a href="/celulares">Celulares</a></li>
                                <li></i><a href="/computadoras">Computadoras</a></li>
                                <li></i><a href="/deportes">Deportes</a></li>
                                <li></i><a href="/electrodomesticos">Electrodomesticos</a></li>
                                <li></i><a href="/electronicos">Electronicos</a></li>
                                <li></i><a href="/herramientas">Herramientas</a></li>
                                <li></i><a href="/hogar">Hogar</a></li>
                                <li></i><a href="/otros">Otros</a></li>
                                <li></i><a href="/vehiculos">Vehiculos</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- Secciones en lp -->
                <div class="col-lg-3 col-md-3">
                    <ul class="list-unstyled clear-margins">
                        <li class="footer-container footer_nav_menu">
                            <h1 class="titulo-footer">La Pulga Virtual</h1>
                            <ul>
                                <li><a id="lnkbottiendas" href="/recientes?tag=foo">Publicaciones Recientes</a></li>
                                <li><a id="lnkbottiendas" href="/tiendas">Tiendas Virtuales</a></li>
                                <li><a id="lnkbotdealers" href="/dealers">Dealers de Veh&iacute;culos</a></li>
                                <li><a id="lnkbotinmobi" href="/inmobiliarias">Inmobiliarias</a></li>
                                <li><a id="lnkbotcontacto" href="/prestamos">Financiamiento para vehiculos</a></li>
                                <li><a id="klkmsg" href="/mensajes">KLK Messenger</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <!-- paginas amigas -->

                <div class="col-lg-3 col-md-3">
                    <ul class="list-unstyled clear-margins">
                        <li class="footer-container footer_nav_menu">
                            <h1 class="titulo-footer">Enlaces de interés</h1>
                            <ul>
                                <li><a href="/planes"><b>Adquiere tu Tienda Virtual</b></a></li>
                                <li><a href="/pines">Adquiere PINES <span class='icol tt badge green'>balance
                                            0</span></a> </li>
                                <li class="hidden-xs"><a href="/renovaciones">Renovaciones Autom&aacute;ticas</a></li>
                                <li><a href="/emailactivacion">Recibe Email Activaci&oacute;n</a></li>
                                <li><a href="http://blog.lapulga.com.do" class="enlExt">Blog</a></li>
                                <li><a href="/videos">Videos</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- provincias -->

                <div class="col-md-12 col-sm-12 mtop">
                    <ul class=" list-unstyled clear-margins" id="fprvs">
                        <li class="footer-container footer_nav_menu">
                            <h1 class="titulo-footer">Provincias</h1>
                            <ul class="ulcol col5">
                                <li><a href="/azua">Azua</a></li>
                                <li><a href="/bahoruco">Bahoruco</a></li>
                                <li><a href="/barahona">Barahona</a></li>
                                <li><a href="/dajabon">Dajabon</a></li>
                                <li><a href="/duarte">Duarte</a></li>
                                <li><a href="/el-seibo">El Seibo</a></li>
                                <li><a href="/elias-pina">Elias Pina</a></li>
                                <li><a href="/espaillat">Espaillat</a></li>
                                <li><a href="/hato-mayor">Hato Mayor</a></li>
                                <li><a href="/hermanas-mirabal">Hermanas Mirabal</a></li>
                                <li><a href="/independencia">Independencia</a></li>
                                <li><a href="/la-altagracia">La Altagracia</a></li>
                                <li><a href="/la-romana">La Romana</a></li>
                                <li><a href="/la-vega">La Vega</a></li>
                                <li><a href="/maria-trinidad-s--nchez">Maria Trinidad Sánchez</a></li>
                                <li><a href="/monsenor-nouel">Monsenor Nouel</a></li>
                                <li><a href="/monte-plata">Monte Plata</a></li>
                                <li><a href="/montecristi">Montecristi</a></li>
                                <li><a href="/pedernales">Pedernales</a></li>
                                <li><a href="/peravia">Peravia</a></li>
                                <li><a href="/puerto-plata">Puerto Plata</a></li>
                                <li><a href="/samana">Samana</a></li>
                                <li><a href="/san-cristobal">San Cristobal</a></li>
                                <li><a href="/san-jose-de-ocoa">San Jose de Ocoa</a></li>
                                <li><a href="/san-juan">San Juan</a></li>
                                <li><a href="/san-pedro-de-macoris">San Pedro de Macoris</a></li>
                                <li><a href="/sanchez-ramirez">Sanchez Ramirez</a></li>
                                <li><a href="/santiago">Santiago</a></li>
                                <li><a href="/santiago-rodriguez">Santiago Rodriguez</a></li>
                                <li><a href="/santo-domingo">Santo Domingo</a></li>
                                <li><a href="/valverde">Valverde</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-3">
                    <ul class="list-unstyled clear-margins">
                        <li class="footer-container footer_recent_news">
                            <h1 class="titulo-footer">Búscanos en</h1>
                            <div class="redes-icons">
                                <ul class="nomargin">
                                    <a href="/facebook" target="_blank"><i
                                            class="enlExt fa fa-facebook-square fa-3x redes-fb" id="redes"></i></a>
                                    <a href="/instagram" target="_blank"><i
                                            class="enlExt fa fa-instagram fa-3x redes-ig" id="redes"
                                            style="color:#337ab7; background-color:unset;"></i></a>
                                    <a href="https://twitter.com/LaPulgaVirtualR" target="_blank"><i
                                            class="fa fa-twitter-square fa-3x redes-tw" id="redes"></i></a>
                                    <a href="/google+" target="_blank"><i
                                            class="enlExt fa fa-google-plus-square fa-3x redes-gp" id="redes"></i></a>
                                    <a href="/youtube" target="_blank"><i
                                            class="enlExt fa fa-youtube-square fa-3x redes-tw" id="redes"></i></a>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-3 pull-right">
                    <ul class="list-unstyled clear-margins">
                        <li class="footer-container footer_recent_news">
                            <h1 class="titulo-footer ttb"
                                title="Compra Pines: para resaltar y colocar en VIP tu publicación. <br> y Planes: ¡Para crecer en internet!"
                                data-placement="top">Pines y Planes con</h1>
                            <div class="redes-icons">
                                <ul class="nomargin">
                                    <i class="fa fa-cc-paypal fa-2x azul pull-left" title="¡Paga con Paypal!"></i>
                                    <i class="bbanresi" title="¡Haz tu deposito con Banreservas!"></i>
                                    <i class="bbhdi" title="¡Haz tu deposito con BHD!"></i>
                                    <i class="bpopulari" title="¡Haz tu deposito con el Popular!"></i>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <div class="footer-bottom flexr flexcv flexar flexw">
        <div class="copyright">
            La Pulga Virtual &reg; Derechos Reservados desde 2003
        </div>
        <div class="realizado">
            Un producto de <a href="http://www.ipsrd.com" target="_blank" id="lnkips"
                title="Intranet Productos y Servicios">IPS</a> hospedado por <a href="http://www.grupointernet.com"
                id="lnkgrpint" target="_blank"
                title="No Importa el lugar, nosotros le contactamos">GrupoInternet.com</a>
        </div>
    </div>
    <script>
        var usrid = 'JOELPEREYRA';
    </script>
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-2139046-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'UA-2139046-1');
    </script>
    <div class="modal fade" tabindex="-1" role="dialog" id="mpoliticasuso">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Políticas de Uso</h4>
                </div>
                <div class="modal-body">
                    <h3><strong>Pol&iacute;ticas Generales</strong></h3>
                    <p align="justify"> La Pulga Virtual es un sitio gratuito para la publicaci&oacute;n de compra y
                        venta de mercanc&iacute;as y servicios, ya sean &eacute;stas nuevas o usadas.</p>

                    <p align="justify">Las informaciones suministradas se manejar&aacute;n de manera confidencial por La
                        Pulga Virtual y se utilizar&aacute; estrictamente para mostrar la informaci&oacute;n del
                        vendedor o comprador. Solo seran mostradas informaciones basicas excepto la direccion de correo
                        o email, para evitar que pueda ser copiado y que reciban emails masivos (SPAM).</p>
                    <h3><strong>Usuarios</strong></h3>
                    <!--<p>El usuario no est&aacute; obligado a suministrar su direcci&oacute;n f&iacute;sica (calle, sector, etc.) si as&iacute; lo desea por razones particulares, pero ser&iacute;a preferible introducir la informaci&oacute;n de contacto, as&iacute; el comprador o vendedor puede contactarle.</p>-->

                    <p align="justify">A la hora de registrarse el usuario no debe colocar direcciones de p&aacute;ginas
                        (www.minombre.com) personales o comerciales en los campos de nombres, apellidos y
                        direcci&oacute;n ni en las descripciones de los art&iacute;culos publicados, asi como en las
                        imagenes. Los mismos ser&aacute;n deshabilitados.</p>

                    <h3><strong>Publicaciones</strong></h3>
                    <p align="justify">La Pulga Virtual no se hace responsable de la publicaci&oacute;n de
                        art&iacute;culos que tengan procedencia desconocida y que puedan traer consecuencias de caracter
                        legal para los compradores; tampoco se hace responsable de la calidad o claridad con que se
                        describe la publicación. Esto no quiere decir que seamos indiferentes a como se hace una
                        publicaci&oacute;n, pero dejamos que cada vendedor use su forma para publicar.<br /><br /> Cada
                        publicaci&oacute;n tiene una vigencia o duraci&oacute;n en el sistema de 30 d&iacute;as. Si
                        estos no tienen aplicado ning&uacute;n Resaltado o colocado en VIP que pueda prolongar su
                        vigencia, una vez pasados estos dias, el art&iacute;culo ser&aacute; retirado.</p>

                    <p align="justify">Para que nuestro portal pueda ofrecer mejor servicio y nuestros usuarios lo
                        reciban mejor, hemos adoptado algunas restricciones:</p>

                    <p>
                        <ul>
                            <li>Publicar art&iacute;culos en categor&iacute;as incorrectas.</li>
                            <li>Publicar art&iacute;culos incompletos (sin sentido, no descriptivos, etc.).</li>
                            <li>Publicar art&iacute;culos con fotos que contengan direcciones a otras páginas.</li>
                            <li>Publicar art&iacute;culos repetidos, incluso aquellos que tengan textos diferentes, el
                                m&aacute;s reciente se eliminar&aacute;.</li>
                            <li>Publicar art&iacute;culos ficticios (emails en cadena, ganar dinero por internet, usa
                                tal p&aacute;gina para tal cosa., etc.).</li>
                            <li>Publicar anuncios de mercacia considerada ilegal del tipo que sea.</li>
                            <li>Publicar contenido sexual.</li>
                        </ul>
                    </p>

                    <p align="justify">La Pulga Virtual se verá obligada a eliminar cualquier publicaci&oacute;n que no
                        cumpla con alguno de los reglamentos mencionados e inclusio si las faltas continuan la cuenta
                        del usuario será eliminada tambien.</p>
                    <b>
                        Al registrarse acepta que La Pulga Virtual pueda enviarle informaci&oacute;n tanto relacionada
                        con el portal como de otros usuarios en la comunidad, as&iacute; como alguna oferta de nuestros
                        patrocinadores..</b>

                    <p><i>Equipo de La Pulga Virtual<br />
                            15 de Mayo del 2017</i></p>
                </div>
                <div class="modal-footer">
                    <h1>La Pulga Virtual, para vender o comprar 100% Dominicana</h1>
                </div>
            </div>
        </div>
    </div>
    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit&hl=es" async defer>
    </script>

    <script>
        $("#frmregistro").submit(function (event) {

            var recaptcha = $("#g-recaptcha-response").val();
            if (recaptcha === "") {
                event.preventDefault();
                alert("Favor marcar que no eres un robot, gracias");
            }
        });
    </script>


</body>

</html>