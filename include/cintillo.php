<div class="panel panel-default ">
    <p></p>
    <div class="panel-heading">
        <h3>Manejo de Encuestas</h3>
    </div>
    <div class="panel-body">
        <form action="admin.cintillo.php" method="post" name="frmadmincintillo" id="frmadmincintillo">
            <br /><br />
            <div>
                <input name="titulo" type="text" id="titulo" value="" placeholder="Titulo Mensaje.:" />
            </div>
            <div>
                <textarea name="mensaje" cols="55" rows="5" id="mensaje"
                    placeholder="Mensaje a colocar.:"></textarea><label id="caracteres">300 Car&aacute;cteres
                    M&aacute;ximo</label>
            </div>
            <div>
                <input name="enlace" type="text" id="enlace" value="" placeholder="Texto enlace.:" />
            </div>
            <div>
                <input name="url" type="text" id="url" value="" placeholder="Url enlace.:" />
            </div>
            <div>
                <select name="hasta" id="hasta">
                    <option value="0">Seleccione dias hasta</option>
                    <option value="-10">Retirar</option>
                    <option value="1">1 Dia</option>
                    <option value="2">2 Dias</option>
                    <option value="3">3 Dias</option>
                    <option value="4">4 Dias</option>
                    <option value="5">5 Dias</option>
                    <option value="6">6 Dias</option>
                    <option value="7">7 Dias</option>
                    <option value="8">8 Dias</option>
                    <option value="9">9 Dias</option>
                    <option value="10">10 Dias</option>
                </select>
            </div>
            <div>
                <select name="tipo" id="tipo">
                    <option value="0">Seleccione tipo mensaje</option>
                    <option value="I">Informacion</option>
                    <option value="E">Error</option>
                    <option value="W">Advertencia</option>
                </select>
            </div>
            <br /><br />
            <input name="Enviar" type="submit" id="Enviar" value="Enviar Mensaje" class="fbtn_n" />
            <input type="button" name="Cancelar" id="btnCancelar" class="fbtn_b" value="Cancelar" />
            <input type="button" name="Nuevo" id="btnCancelar" class="fbtn_b" value="Nueva Entrada"
                onclick="location.href='/admin.cintillo.php';" />
        </form>
        <br /></br />

    </div>
    <table class="listaslnk">
        <tr>
            <td>ID</td>
            <td>Titulo</td>
            <td>Mensaje</td>
            <td>Fecha</td>
            <td>Hasta</td>
            <td>Enlace</td>
            <td>Url</td>
            <td>Tipo</td>
            <td>Estatus</td>
        </tr>
        <tr>
            <td>121</td>
            <td><a href="/admin.cintillo.php?id=121">Ajustes en la plataforma</a></td>
            <td><a href="/admin.cintillo.php?id=121">Tomaremos esta noche para actualizar la plataforma por lo que solo
                    podran consultar las publicaciones existentes, esperamos en dos horas tener todo listo</a></td>
            <td>09-Jul-2021 10:36 pm</td>
            <td>10-Jul-2021 10:36 pm</td>
            <td></td>
            <td></td>
            <td>I</td>
            <td>A</td>
        </tr>
        <tr>
            <td>120</td>
            <td><a href="/admin.cintillo.php?id=120">Aun seguimos trabajando</a></td>
            <td><a href="/admin.cintillo.php?id=120">La version movil para algunos usuarios es posible que no entre de
                    manera correcta, esperamos terminar en breve, gracias.</a></td>
            <td>11-Jun-2021 03:50 pm</td>
            <td>12-Jun-2021 03:50 pm</td>
            <td></td>
            <td></td>
            <td>W</td>
            <td>A</td>
        </tr>
        <tr>
            <td>118</td>
            <td><a href="/admin.cintillo.php?id=118">VACUNATE</a></td>
            <td><a href="/admin.cintillo.php?id=118">Para que podamos seguir nuestras vidas un poco mas seguro y
                    tranquilos vacunate</a></td>
            <td>31-May-2021 11:51 am</td>
            <td>10-Jun-2021 11:51 am</td>
            <td>ver aqui los centros</td>
            <td>https://vacunate.gob.do/</td>
            <td>W</td>
            <td>A</td>
        </tr>
        <tr>
            <td>119</td>
            <td><a href="/admin.cintillo.php?id=119">Error en la pagina</a></td>
            <td><a href="/admin.cintillo.php?id=119">Estamos haciendo unas mejoras a la plataforma, algunas salidas
                    pueden ocurrir, excusen los inconvenientes.</a></td>
            <td>10-Jun-2021 11:56 pm</td>
            <td>31-May-2021 11:56 pm</td>
            <td></td>
            <td></td>
            <td>E</td>
            <td>A</td>
        </tr>
        <tr>
            <td>117</td>
            <td><a href="/admin.cintillo.php?id=117">Error en listado de publicaciones</a></td>
            <td><a href="/admin.cintillo.php?id=117">Los usuarios con plan no podian ver sus publicaciones en mi pulga,
                    ya esta resuelto ese problema.</a></td>
            <td>04-Dec-2020 09:36 am</td>
            <td>24-Nov-2020 09:36 am</td>
            <td>ver aqui</td>
            <td>/mipulga</td>
            <td>E</td>
            <td>A</td>
        </tr>
        <tr>
            <td>116</td>
            <td><a href="/admin.cintillo.php?id=116">Usuarios NUEVOS que estan INACTIVOS!</a></td>
            <td><a href="/admin.cintillo.php?id=116">Enviamos un mensaje via Whatsapp a cada usuario inactivo con las
                    instrucciones para activar, desde el numero 849-450-4986. Respondan por esa misma via si necesitan
                    mas ayuda. </a></td>
            <td>21-Aug-2020 04:14 pm</td>
            <td>31-Aug-2020 04:14 pm</td>
            <td></td>
            <td></td>
            <td>I</td>
            <td>A</td>
        </tr>
        <tr>
            <td>115</td>
            <td><a href="/admin.cintillo.php?id=115">Ofertas a papa</a></td>
            <td><a href="/admin.cintillo.php?id=115">Comparte con Pap&aacute; su d&iacute;a y aprovecha estas ofertas
                </a></td>
            <td>23-Jul-2020 12:30 am</td>
            <td>26-Jul-2020 12:30 am</td>
            <td>culinarias aqui</td>
            <td>http://www.d-anali.com/padres/</td>
            <td>I</td>
            <td>A</td>
        </tr>
        <tr>
            <td>114</td>
            <td><a href="/admin.cintillo.php?id=114">Cosas que no sabia de nuestro buscador</a></td>
            <td><a href="/admin.cintillo.php?id=114">dale un vistazo a este articulo en nuestro blog y conoce un poco
                    mas de nosotros.</a></td>
            <td>01-Jul-2020 12:03 am</td>
            <td>11-Jul-2020 12:03 am</td>
            <td>entra aqui</td>
            <td>http://blog.lapulga.com.do/cosas-que-no-sabias-de-nuestro-buscador/</td>
            <td>I</td>
            <td>A</td>
        </tr>


        <tr>
            <td>99</td>
            <td><a href="/admin.cintillo.php?id=99">Error en buscador</a></td>
            <td><a href="/admin.cintillo.php?id=99">Estimados usuarios: Como siempre nuestro sitio ha tenido un buscador
                    bien optimizado pero en el ultimo cambio de plataforma algo no salio bien y el mismo no estaba dando
                    los resultados esperados. Ya puedes hacer tus busquedas en mas de 230,000 publicaciones esperando
                    por ti. Equipo LP</a></td>
            <td>12-Nov-2018 02:25 pm</td>
            <td>17-Nov-2018 02:25 pm</td>
            <td>mas informacion sobre mejoras</td>
            <td>http://blog.lapulga.com.do/error-en-nuestro-motor-de-busqueda/</td>
            <td>W</td>
            <td>A</td>
        </tr>
        <tr>
            <td>96</td>
            <td><a href="/admin.cintillo.php?id=96">KLK Messenger</a></td>
            <td><a href="/admin.cintillo.php?id=96">Tu nuevo sistema de mensajeria, mantente en contacto con tus
                    clientes y no pierdas ningun negocio. </a></td>
            <td>06-Jun-2018 08:03 pm</td>
            <td>13-Jun-2018 08:03 pm</td>
            <td>Conoce KLK Messenger</td>
            <td>http://blog.lapulga.com.do/sistemas-de-chats-mensajerias-y-klk/</td>
            <td>I</td>
            <td>A</td>
        </tr>
        <tr>
            <td>98</td>
            <td><a href="/admin.cintillo.php?id=98">Posibles fraudes</a></td>
            <td><a href="/admin.cintillo.php?id=98">Estimados visitantes, si ven algunas publicaciones de celulares
                    indicando que son tiendas donde las fotos son el frente de su establecimiento, confirmen bien que
                    sea realmente lo que dicen ser antes de hacer cualquier tipo de pago.</a></td>
            <td>01-Jun-2018 10:01 am</td>
            <td>05-Jun-2018 10:01 am</td>
            <td></td>
            <td></td>
            <td>I</td>
            <td>A</td>
        </tr>
        <tr>
            <td>23</td>
            <td><a href="/admin.cintillo.php?id=23">Encuestas Falsas</a></td>
            <td><a href="/admin.cintillo.php?id=23">Informamos a nuestros usuarios que desaprensivos se estan dando a la
                    tarea de contactar a los usuarios de este portal realizando supuestas encuestas autorizadas por
                    nosotros, preguntando:</a></td>
            <td>27-Nov-2014 12:45 pm</td>
            <td>02-Dec-2014 12:45 pm</td>
            <td>Leer mas aqui</td>
            <td>http://blog.lapulga.com.do/?p=592</td>
            <td>W</td>
            <td>A</td>
        </tr>
        <tr>
            <td>22</td>
            <td><a href="/admin.cintillo.php?id=22">Actualiza datos de contacto</a></td>
            <td><a href="/admin.cintillo.php?id=22">Es importante tener esta información actualizada siempre, también
                    agregar emails alternos para que no pierdas ningún negocio por no recibir mensajes</a></td>
            <td>11-Nov-2014 10:35 pm</td>
            <td>13-Nov-2014 10:35 pm</td>
            <td></td>
            <td></td>
            <td>W</td>
            <td>A</td>
        </tr>
        <tr>
            <td>20</td>
            <td><a href="/admin.cintillo.php?id=20">Nuevos Listados</a></td>
            <td><a href="/admin.cintillo.php?id=20">De interes para todos los usuarios, desde ahora tenemos todos los
                    listados con formato de foto en lista, para mayor previsualizacion de los articulos a listar.
                    Aprovecha el especial de pines y resalta tus publicaciones.</a></td>
            <td>06-Nov-2014 07:29 pm</td>
            <td>09-Nov-2014 07:29 pm</td>
            <td></td>
            <td></td>
            <td>I</td>
            <td>A</td>
        </tr>
        <tr>
            <td>18</td>
            <td><a href="/admin.cintillo.php?id=18">Publicar un Servicio</a></td>
            <td><a href="/admin.cintillo.php?id=18">Si eres ebanista, herrero, plomero, odontologo, nutricionista,
                    ingeniero, o tienes una empresa dedicada a cualquier servicio, usa este formulario, no caducan y
                    siempre puedes hacerles cambios, no hay que repetirlo</a></td>
            <td>30-Oct-2014 05:44 pm</td>
            <td>02-Nov-2014 05:44 pm</td>
            <td>Publica el servicio aqui</td>
            <td>http://lapulga.com.do/publicaservicio.php</td>
            <td>I</td>
            <td>A</td>
        </tr>
        <tr>
            <td>19</td>
            <td><a href="/admin.cintillo.php?id=19">Estamos realizando cambios internos</a></td>
            <td><a href="/admin.cintillo.php?id=19">Si notas la pagina un poco lenta es por esto, realizamos unos
                    cambios de ultimo minuto, gracias y disculpas, Equipo LP</a></td>
            <td>12-Nov-2014 03:10 pm</td>
            <td>02-Nov-2014 03:10 pm</td>
            <td></td>
            <td></td>
            <td>E</td>
            <td>A</td>
        </tr>
        <tr>
            <td>17</td>
            <td><a href="/admin.cintillo.php?id=17">Necesitas un prestamo?</a></td>
            <td><a href="/admin.cintillo.php?id=17">Utiliza nuestra red de prestamos para conseguir uno para Vehiculos,
                    Personales, PYMES y Bienes Raices,</a></td>
            <td>04-Nov-2014 09:49 am</td>
            <td>25-Oct-2014 09:49 am</td>
            <td>solicitalo aqui</td>
            <td>http://lapulga.com.do/prestamos</td>
            <td>I</td>
            <td>A</td>
        </tr>
        <tr>
            <td>16</td>
            <td><a href="/admin.cintillo.php?id=16">Busquedas en multiples provincias</a></td>
            <td><a href="/admin.cintillo.php?id=16">Puedes hacer tus busquedas en varias provincias al mismo tiempo,
                    click en la pestaña provincias, selecciona las que quieras y escribe en el buscador lo deseado.
                    Equipo LP</a></td>
            <td>18-Oct-2014 09:33 pm</td>
            <td>20-Oct-2014 09:33 pm</td>
            <td></td>
            <td></td>
            <td>I</td>
            <td>A</td>
        </tr>
        <tr>
            <td>15</td>
            <td><a href="/admin.cintillo.php?id=15">Agrandar fotos en los Detalles CORREGIDO</a></td>
            <td><a href="/admin.cintillo.php?id=15">Estimados usuarios, Este problema fue corregido, pedimos excusas por
                    los inconvenientes ocasionados. Equipo LP</a></td>
            <td>17-Oct-2014 06:02 pm</td>
            <td>19-Oct-2014 06:02 pm</td>
            <td></td>
            <td></td>
            <td>I</td>
            <td>A</td>
        </tr>
        <tr>
            <td>10</td>
            <td><a href="/admin.cintillo.php?id=10">Estimados Usuarios</a></td>
            <td><a href="/admin.cintillo.php?id=10">Si ves la pagina desformada usa Control-F5 para actualizar, aun
                    estamos trabajando a lo interno con la pagina por si notas alguna lentitud, esperamos comprendas,
                    todo para mejorar, Equipo LP</a></td>
            <td>14-Oct-2014 05:58 pm</td>
            <td>15-Oct-2014 05:58 pm</td>
            <td>cualquier anomalia favor reportar aqui</td>
            <td>http://lapulga.com.do/soporte.php</td>
            <td>E</td>
            <td>A</td>
        </tr>
        <tr>
            <td>12</td>
            <td><a href="/admin.cintillo.php?id=12">Usuarios Inactivos</a></td>
            <td><a href="/admin.cintillo.php?id=12">A los usuarios que no pudieron activar su cuenta ya la puden usar.
                    Equipo LP</a></td>
            <td>12-Oct-2014 07:22 pm</td>
            <td>13-Oct-2014 07:22 pm</td>
            <td></td>
            <td></td>
            <td>E</td>
            <td>A</td>
        </tr>
        <tr>
            <td>9</td>
            <td><a href="/admin.cintillo.php?id=9">Estimados Usuarios y Visitantes</a></td>
            <td><a href="/admin.cintillo.php?id=9">Hemos realizado algunos cambios a la plataforma esperando que estos
                    sean de su agrado. </a></td>
            <td>06-Oct-2014 08:30 am</td>
            <td>09-Oct-2014 08:30 am</td>
            <td>Pueden ver el listado de cambios aqui</td>
            <td>http://blog.lapulga.com.do</td>
            <td>I</td>
            <td>A</td>
        </tr>
        <tr>
            <td>13</td>
            <td><a href="/admin.cintillo.php?id=13">Mejoras en La Pulga</a></td>
            <td><a href="/admin.cintillo.php?id=13">Queremos que veas algunas de las mejoras hechas al portal</a></td>
            <td>14-Oct-2014 04:02 pm</td>
            <td>04-Oct-2014 04:02 pm</td>
            <td>Puedes ver mas info aqui</td>
            <td>http://blog.lapulga.com.do/?p=587</td>
            <td>I</td>
            <td>A</td>
        </tr>
    </table>
</div>
</div>
</div>