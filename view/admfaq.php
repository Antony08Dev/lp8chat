<div class="item ">
    <div class="lpub table-secondary">
        <div class="borden pull-left row">
            <div class="artplista">
                <div class="col-md-9" id="formulario">
                    <form class="form-vertical" id="frmadminfaq" method="post" action="/admin.faq">
                        <div class="col-md-5">
                            <div class="form-group">
                                <input type="hidden" name="id" id="id" value="">
                                <label for="topico">Tópico:</label>
                                <input type="text" placeholder="Coloque la pregunta" name="topico" id="topico"
                                    class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="respuesta">Respuesta:</label>
                                <textarea rows="8" max-height="170" id="respuesta" name="respuesta" class="form-control"
                                    required></textarea><br>
                                <a href="javascript:;"
                                    onclick="getElementById('respuesta').select(); document.execCommand('Copy');">Copiar
                                    texto</a> | <a href="javascript:;"
                                    onclick="getElementById('respuesta').value = ''; getElementById('respuesta').focus();">Limpiar
                                    campo</a>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="col-md-12">
                                <div class="checkbox">
                                    <label for="0"><input type="checkbox" id="0" name="categorias[]" value="0">Preguntas
                                        frecuentes</label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="checkbox">
                                    <label for="1"><input type="checkbox" id="1" name="categorias[]"
                                            value="1">Publicaciones</label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="checkbox">
                                    <label for="2"><input type="checkbox" id="2" name="categorias[]" value="2">Tiendas
                                        Virtuales</label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="checkbox">
                                    <label for="3"><input type="checkbox" id="3" name="categorias[]" value="3">Dealers
                                        de Vehículos</label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="checkbox">
                                    <label for="4"><input type="checkbox" id="4" name="categorias[]"
                                            value="4">Inmobiliarias</label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="checkbox">
                                    <label for="5"><input type="checkbox" id="5" name="categorias[]"
                                            value="5">Seguridad</label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="checkbox">
                                    <label for="6"><input type="checkbox" id="6" name="categorias[]"
                                            value="6">Publicidad Pagada</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <input type="submit" class="btn btn-success" id="Enviar" name="Enviar" value="Agregar">
                            <a href="/admin.faq" class="btn btn-info" id="ir-a" name="ir-a" style="display:none">ir a
                                agregar</a>
                        </div>
                    </form>
                </div>
                <!-- 	tabla de ayudas -->
                <div id="tabla-master" class="table table-responsive borderb">
                    <table class="table table-hover table-striped table-bordered">
                        <tr>
                            <th colspan='8'>
                                <h2>Ayudas</h2>
                            </th>
                        </tr>
                        <tr>
                            <th>ID</th>
                            <th class='col-md-6'>Topico</th>
                            <th class='col-md-4'>Respuesta</th>
                            <th>enlace</th>
                            <th class='col-md-1'>status</th>
                        </tr>

                        <tr id="tr1" rel="1">
                            <td class="recoger-data">1</td>
                            <td class="topico recoger-data">¿Cómo publicar una venta en La Pulga? </td>
                            <td class="respuesta recoger-data">
                                <p>Para publicar lo primero es tener los datos (precio y descripción) asi como una foto
                                    de tu publicación. Dando click en el boton naranja iras al formulario donde llenas
                                    todo lo que se te pide. Si no eres usuario registrado puedes hacerlo en ese paso, es
                                    facil y rapido, sobre todo <strong>GRATIS</strong></p>
                                <p>Usa este enlace para empezar <a style="font-weight:bold; color:#509CDC;"
                                        href="https://www.lapulga.com.do/publicar">Publicar en La Pulga Virtual</a></p>
                                <input type="hidden" id="respuesta-1"
                                    value='<p>Para publicar lo primero es tener los datos (precio y descripción) asi como una foto de tu publicación.  Dando click en el boton naranja iras al formulario donde llenas todo lo que se te pide.  Si no eres usuario registrado puedes hacerlo en ese paso, es facil y rapido, sobre todo <strong>GRATIS</strong></p>
<p>Usa este enlace para empezar <a style="font-weight:bold; color:#509CDC;" href="https://www.lapulga.com.do/publicar">Publicar en La Pulga Virtual</a></p>'>
                                <span class="categorias hidden" id="cat-1" rel="3,2,1,0">Dealers de Vehículos<br>Tiendas
                                    Virtuales<br>Publicaciones<br>Preguntas frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/cmo-publicar-una-venta-en-la-pulga_1.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-1');" value="FAQ_ESTATUS_" id="faq-1"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr3" rel="3">
                            <td class="recoger-data">3</td>
                            <td class="topico recoger-data">¿Qué es PayPal y para que lo uso en la página?</td>
                            <td class="respuesta recoger-data">
                                <p>PayPal es la forma rápida y segura de pagar. Puede usar su tarjeta de crédito o
                                    cuenta bancaria sin mostrar sus números de cuenta. Es posible vincular la tarjeta de
                                    crédito o la cuenta bancaria a su cuenta de PayPal, de forma que no necesita
                                    introducir el número de la tarjeta ni la dirección cada vez que compre. Sólo tiene
                                    que identificarse en PayPal y pagar rápidamente con unos pocos clics.</p>
                                <p>Usamos este metodo de pago por mas de 9 años con un 100% de satisfacción. Puedes usar
                                    PayPal en La Pulga para comprar cualquiera de los servicios o productos que
                                    ofrecemos como PINES, Planes de usuarios, Area de ofertas, entre otros.</p><input
                                    type="hidden" id="respuesta-3"
                                    value='<p>PayPal es la forma rápida y segura de pagar. Puede usar su tarjeta de crédito o cuenta bancaria sin mostrar sus números de cuenta. Es posible vincular la tarjeta de crédito o la cuenta bancaria a su cuenta de PayPal, de forma que no necesita introducir el número de la tarjeta ni la dirección cada vez que compre. Sólo tiene que identificarse en PayPal y pagar rápidamente con unos pocos clics.</p>
<p>Usamos este metodo de pago por mas de 9 años con un 100% de satisfacción.  Puedes usar PayPal en La Pulga para comprar cualquiera de los servicios o productos que ofrecemos como PINES, Planes de usuarios, Area de ofertas, entre otros.</p>'>
                                <span class="categorias hidden" id="cat-3" rel="0">Preguntas frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/qu-es-paypal-y-para-que-lo-uso-en-la-pgina_3.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-3');" value="FAQ_ESTATUS_" id="faq-3"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr5" rel="5">
                            <td class="recoger-data">5</td>
                            <td class="topico recoger-data">¿Qué son Renovaciones Automáticas? </td>
                            <td class="respuesta recoger-data">
                                <p>Las Renovaciones Automáticas ayudan a que tus publicaciones estén siempre en las
                                    listas recientes. Dia a dia entran miles de publicaciones por lo que las tuyas van
                                    quedando más atras, para eso es recomendable renovarlas y que vuelvan a estar
                                    recientes en las listas de cada categoría, si necesidad de borrarlas para volver a
                                    crearlas lo cual es un error. para activar usa este enlace <a class="azul"
                                        href="https://www.lapulga.com.do/renovaciones">https://www.lapulga.com.do/renovaciones</a>
                                    o visita el menu Mi Pulga -> todas las opciones y sigue las instrucciones.</p>
                                <p>Una vez tengas el servicio solo debes elegir la hora y dia que quieras tus
                                    publicaciones se renoven. Siempre es bueno ver los datos de visitas y asi saber que
                                    estan visitando mas y que menos para hacer los ajustes de precio en caso de. </p>
                                <input type="hidden" id="respuesta-5"
                                    value='<p>Las Renovaciones Automáticas ayudan a que tus publicaciones estén siempre en las listas recientes. Dia a dia entran miles de publicaciones por lo que las tuyas van quedando más atras, para eso es recomendable renovarlas y que vuelvan a estar recientes en las listas de cada categoría, si necesidad de borrarlas para volver a crearlas lo cual es un error. para activar usa este enlace <a class="azul" href="https://www.lapulga.com.do/renovaciones">https://www.lapulga.com.do/renovaciones</a> o visita el menu Mi Pulga -> todas las opciones y sigue las instrucciones.</p>
<p>Una vez tengas el servicio solo debes elegir la hora y dia que quieras tus publicaciones se renoven.  Siempre es bueno ver los datos de visitas y asi saber que estan visitando mas y que menos para hacer los ajustes de precio en caso de. </p>'>
                                <span class="categorias hidden" id="cat-5" rel="6,1,0">Publicidad
                                    Pagada<br>Publicaciones<br>Preguntas frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/qu-son-renovaciones-automticas_5.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-5');" value="FAQ_ESTATUS_" id="faq-5"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr6" rel="6">
                            <td class="recoger-data">6</td>
                            <td class="topico recoger-data">¿Qué recomendaciones me da La Pulga para publicar? </td>
                            <td class="respuesta recoger-data">
                                <p>El éxito que tenga tu publicación bien puede depender de tí. Nuestro equipo no solo
                                    se preocupa por que publiques, sino que cada una logre su objetivo, es por tal razón
                                    que te recomendamos lo siguiente:</p>
                                <ul>
                                    <li>Siempre menciona en el titulo lo que en realidad estas publicando, tal como
                                        otros lo buscarían. ej. si es un carro toyota corolla 2015 escribe eso, no
                                        coloques "<strong>vendo mi bebe o me volvi loco</strong>" nada de eso funciona
                                        para los buscadores.</li>
                                    <li>Lo que se ve es lo que se vende es por eso que las fotos son importantes, ten a
                                        mano siempre este instrumento en formato PNG, JPG o GIF que sean reales del
                                        producto.</li>
                                    <li>No olvides especificar el precio real, los compradores que no ven precio no
                                        hacen mucho caso por entender que puede ser un relajo o estafa.</li>
                                    <li>Escribe un detalle específico y breve. Si el caso lo requiere específica toda la
                                        información relacionada, como medidas, marca, año de fabricación, etc.</li>
                                    <li>No mezcles más de un artículo en tu publicación y si lo haces es bueno que
                                        tengan algún tipo de relación.</li>
                                </ul>
                                <p> </p><input type="hidden" id="respuesta-6" value='<p>El éxito que tenga tu publicación bien puede depender de tí. Nuestro equipo no solo se preocupa por que publiques, sino que cada una logre su objetivo, es por tal razón que te recomendamos lo siguiente:</p>
<ul>
<li>Siempre menciona en el titulo lo que en realidad estas publicando, tal como otros lo buscarían. ej.  si es un carro toyota corolla 2015 escribe eso, no coloques "<strong>vendo mi bebe o me volvi loco</strong>" nada de eso funciona para los buscadores.</li>
<li>Lo que se ve es lo que se vende es por eso que las fotos son importantes, ten a mano siempre este instrumento en formato PNG, JPG o GIF que sean reales del producto.</li>
<li>No olvides especificar el precio real, los compradores que no ven precio no hacen mucho caso por entender que puede ser un relajo o estafa.</li>
<li>Escribe un detalle específico y breve. Si el caso lo requiere específica toda la información relacionada, como medidas, marca, año de fabricación, etc.</li>
<li>No mezcles más de un artículo en tu publicación y si lo haces es bueno que tengan algún tipo de relación.</li>
</ul>
<p> </p>'>
                                <span class="categorias hidden" id="cat-6" rel="1">Publicaciones<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/qu-recomendaciones-me-da-la-pulga-para-publicar_6.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-6');" value="FAQ_ESTATUS_" id="faq-6"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr8" rel="8">
                            <td class="recoger-data">8</td>
                            <td class="topico recoger-data">¿Qué necesito para abrir una Tienda, Dealer de Vehiculos o
                                Inmobiliaria? </td>
                            <td class="respuesta recoger-data">
                                <p>Para darle más formalidad a tu Tienda, Dealer de Vehiculos o Agencia Inmobiliaria
                                    debes tener a mano varios puntos. A continuación lo que necesitas, los marcados con
                                    * son los requeridos los demás opcionales, solo una de éstas no aplica para Dealers
                                    de Vehículos:</p>
                                <ul>
                                    <li>(*) Nombre del negocio</li>
                                    <li>(*) Tipo (si es computadoras, celulares, electrónicos, muebles, etc.) (no aplica
                                        para Dealer)</li>
                                    <li>(*) Logo (representara tu Tienda, Dealers o Inmobiliaria en los listados tanto
                                        por categoría como al azar.)</li>
                                    <li>(*) Descripción (Detalla brevemente que vendes o que servicios ofreces, esta
                                        información da una idea rápido que tipo de negocio tienes).</li>
                                    <li>Video (tienes la opción que si posees un comercial grabado puedes subirlo a
                                        YouTube y hacer enlace con tu tienda o dealer, así el usuario podrá ver y
                                        conocer mas sobre tí.)</li>
                                </ul>
                                <p>Luego de tener estas informacion usas este <a class="azul" href="/planes">enlace</a>
                                    o en Mi Pulga, recuerda debes estar <a class="azul" href="/registro">registrado</a>.
                                </p>
                                <p>Te recomendamos que al llenar esta información lo hagas con mucho cuidado ya que esto
                                    es tu imagen como negocio. Si necesitas ayuda usa uno de estos medios
                                    <strong>809-549-6581</strong>, whatsapp<strong> 829-795-8684</strong> o <a
                                        href="/soporte">soporte</a></p><input type="hidden" id="respuesta-8"
                                    value='<p>Para darle más formalidad a tu Tienda, Dealer de Vehiculos o Agencia Inmobiliaria debes tener a mano varios puntos. A continuación lo que necesitas, los marcados con * son los requeridos los demás opcionales, solo una de éstas no aplica para Dealers de Vehículos:</p>
<ul>
<li>(*) Nombre del negocio</li>
<li>(*) Tipo (si es computadoras, celulares, electrónicos, muebles, etc.) (no aplica para Dealer)</li>
<li>(*) Logo (representara tu Tienda, Dealers o Inmobiliaria en los listados tanto por categoría como al azar.)</li>
<li>(*) Descripción (Detalla brevemente que vendes o que servicios ofreces, esta información da una idea rápido que tipo de negocio tienes).</li>
<li>Video (tienes la opción que si posees un comercial grabado puedes subirlo a YouTube y hacer enlace con tu tienda o dealer, así el usuario podrá ver y conocer mas sobre tí.)</li>
</ul>
<p>Luego de tener estas informacion usas este <a class="azul" href="/planes">enlace</a> o en Mi Pulga, recuerda debes estar <a class="azul" href="/registro">registrado</a>.</p>
<p>Te recomendamos que al llenar esta información lo hagas con mucho cuidado ya que esto es tu imagen como negocio. Si necesitas ayuda usa uno de estos medios <strong>809-549-6581</strong>, whatsapp<strong> 829-795-8684</strong> o <a href="/soporte">soporte</a></p>'>
                                <span class="categorias hidden" id="cat-8" rel="6,4,3,2,0">Publicidad
                                    Pagada<br>Inmobiliarias<br>Dealers de Vehículos<br>Tiendas Virtuales<br>Preguntas
                                    frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/qu-necesito-para-abrir-una-tienda-dealer-de-vehiculos-o-inmobiliaria_8.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-8');" value="FAQ_ESTATUS_" id="faq-8"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr37" rel="37">
                            <td class="recoger-data">37</td>
                            <td class="topico recoger-data">Que es KLK Messenger?</td>
                            <td class="respuesta recoger-data">
                                <p>Hoy en d&iacute;a tener una comunicaci&oacute;n escrita con relacion a cualquier
                                    negocio que se vaya a realizar es muy importante ya que siempre se afinan bien todos
                                    los detalles del lugar de encuentro, establecimiento del comerciante asi como la
                                    transaccion final, para eso te ofrecemos nuestro sistema de mensajeria "<a
                                        href="/mensajes"><strong>KLK Messenger</strong></a>" aprovechando una
                                    expresi&oacute;n jocosa que usamos para contactar o saludar a alguien.</p>
                                <p>El sistema es sencillo, solo das click en el bot&oacute;n de Envia mensaje de cada
                                    publicaci&oacute;n tanto en lista como en detalles y envias un primer mensaje al que
                                    realiza la publicaci&oacute;n tanto de venta como compra. Esta persona recibe una
                                    notificaci&oacute;n en su correo y pantalla de la pagina indicando que tiene un
                                    nuevo mensaje.</p>
                                <p>Tan pronto se responde un mensaje usted recibe otra notificaci&oacute;n pero si se
                                    mantienen en l&iacute;nea ambos pueden recibir los mensajes de manera inmediata como
                                    si fuese WhasApp ya dentro del <strong>KLK</strong>.</p>
                                <p>Cada mensaje estar&aacute; asociado a una publicaci&oacute;n por lo que podr&aacute;s
                                    tener varias conversaciones con diferentes personas relacionadas a sus
                                    publicaciones.</p>
                                <p>Este servicio es de mucha ayuda para comerciantes que puedan mantener contacto con
                                    sus clientes de una forma directa, r&aacute;pida y privada. Por este tambien
                                    podr&aacute;s recibir notificaciones del sistema.</p>
                                <p>Ver&aacute;s siempre en el menu KLK ya sabes que significa.</p><input type="hidden"
                                    id="respuesta-37" value='<p>Hoy en d&iacute;a tener una comunicaci&oacute;n escrita con relacion a cualquier negocio que se vaya a realizar es muy importante ya que siempre se afinan bien todos los detalles del lugar de encuentro, establecimiento del comerciante asi como la transaccion final, para eso te ofrecemos nuestro sistema de mensajeria "<a href="/mensajes"><strong>KLK Messenger</strong></a>" aprovechando una expresi&oacute;n jocosa que usamos para contactar o saludar a alguien.</p>
<p>El sistema es sencillo, solo das click en el bot&oacute;n de Envia mensaje de cada publicaci&oacute;n tanto en lista como en detalles y envias un primer mensaje al que realiza la publicaci&oacute;n tanto de venta como compra. Esta persona recibe una notificaci&oacute;n en su correo y pantalla de la pagina indicando que tiene un nuevo mensaje.</p>
<p>Tan pronto se responde un mensaje usted recibe otra notificaci&oacute;n pero si se mantienen en l&iacute;nea ambos pueden recibir los mensajes de manera inmediata como si fuese WhasApp ya dentro del <strong>KLK</strong>.</p>
<p>Cada mensaje estar&aacute; asociado a una publicaci&oacute;n por lo que podr&aacute;s tener varias conversaciones con diferentes personas relacionadas a sus publicaciones.</p>
<p>Este servicio es de mucha ayuda para comerciantes que puedan mantener contacto con sus clientes de una forma directa, r&aacute;pida y privada. Por este tambien podr&aacute;s recibir notificaciones del sistema.</p>
<p>Ver&aacute;s siempre en el menu KLK ya sabes que significa.</p>'>
                                <span class="categorias hidden" id="cat-37" rel="5,0">Seguridad<br>Preguntas
                                    frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/que-es-klk-messenger_37.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-37');" value="FAQ_ESTATUS_" id="faq-37"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr10" rel="10">
                            <td class="recoger-data">10</td>
                            <td class="topico recoger-data">¿Qué es una Tienda Virtual? </td>
                            <td class="respuesta recoger-data">
                                <p>Una Tienda Virtual es un espacio especial dentro del Portal en el cual podrás subir
                                    el catálogo de productos que tengas en venta. Este lugar está diseñado para mostrar
                                    de una forma más fácil y eficiente tu inventario, incentivando de este modo que
                                    nuestros visitantes tengan más interés en los mismos.<br /><br /> Hoy en dia tener
                                    un espacio como este ofrece múltiples ventajas entre las que están:</p>
                                <p>1. El estar 24 horas abierta en el internet. Tu tienda siempre estará abierta y al
                                    alcance de todos los usuarios en la web sin necesidad de una persona que la atienda.
                                    Los usuarios podran buscar los artículos en ella, así como, enviarle mensajes de que
                                    necesitan, en caso de no encontrarlos listados por lo que se recomienda no dejar un
                                    solo artículo de tu inventario sin publicar.<br /><br /> 2. Efectividad y rapidez.
                                    Todo se encuentra al alcance de un click lo que facilita y agiliza los procesos
                                    entre tu tienda y los usuarios. Si describes bien los productos utilizando fotos
                                    reales y buena descripción tendrás mayores oportunidades de venta.</p>
                                <p>puedes ver ejemplos de tiendas <a class="azul" href="/tiendas">Aquí</a></p><input
                                    type="hidden" id="respuesta-10" value='<p>Una Tienda Virtual es un espacio especial dentro del Portal en el cual podrás subir el catálogo de productos que tengas en venta. Este lugar está diseñado para mostrar de una forma más fácil y eficiente tu inventario, incentivando de este modo que nuestros visitantes tengan más interés en los mismos.<br /><br /> Hoy en dia tener un espacio como este ofrece múltiples ventajas entre las que están:</p>
<p>1. El estar 24 horas abierta en el internet. Tu tienda siempre estará abierta y al alcance de todos los usuarios en la web sin necesidad de una persona que la atienda. Los usuarios podran buscar los artículos en ella, así como, enviarle mensajes de que necesitan, en caso de no encontrarlos listados por lo que se recomienda no dejar un solo artículo de tu inventario sin publicar.<br /><br /> 2. Efectividad y rapidez. Todo se encuentra al alcance de un click lo que facilita y agiliza los procesos entre tu tienda y los usuarios. Si describes bien los productos utilizando fotos reales y buena descripción tendrás mayores oportunidades de venta.</p>
<p>puedes ver ejemplos de tiendas <a class="azul" href="/tiendas">Aquí</a></p>'>
                                <span class="categorias hidden" id="cat-10" rel="6,2,0">Publicidad Pagada<br>Tiendas
                                    Virtuales<br>Preguntas frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/qu-es-una-tienda-virtual_10.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-10');" value="FAQ_ESTATUS_" id="faq-10"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr11" rel="11">
                            <td class="recoger-data">11</td>
                            <td class="topico recoger-data"></a>¿Qué son los Planes de Dealers de Vehiculos? </td>
                            <td class="respuesta recoger-data">
                                <p>Los planes de Dealer de Vehículos son ideales para los usuarios que dedican de lleno
                                    a este negocio. Con éstos puedes tener tu dealer tal y como es pero de manera
                                    virtual que es lo que te ofrecemos.</p>
                                <p>Para más informacion escribenes al WhatsApp <strong>829-795-8684</strong></p><input
                                    type="hidden" id="respuesta-11" value='<p>Los planes de Dealer de Vehículos son ideales para los usuarios que dedican de lleno a este negocio. Con éstos puedes tener tu dealer tal y como es pero de manera virtual que es lo que te ofrecemos.</p>
<p>Para más informacion escribenes al WhatsApp <strong>829-795-8684</strong></p>'>
                                <span class="categorias hidden" id="cat-11" rel="6,3,0">Publicidad Pagada<br>Dealers de
                                    Vehículos<br>Preguntas frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/-aqu-son-los-planes-de-dealers-de-vehiculos_11.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-11');" value="FAQ_ESTATUS_" id="faq-11"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr12" rel="12">
                            <td class="recoger-data">12</td>
                            <td class="topico recoger-data">¿Cómo publico un vehiculo en La Pulga Virtual?</td>
                            <td class="respuesta recoger-data">
                                Para esto sólo tienes que hacer una publicación utilizando el enlace Publicar en el menu
                                del tope y luego elegir la categoria y subcategoria correcta las cuales vienen
                                preseleccionadas si estabas visitando la lista de vehículos. Esto le dará más opciones
                                como marca, modelo, año y combustible que usa el vehículo a publicar. Si tienes un plan
                                de dealer de vehículos puedes agregarles de forma seleccionable accesorios y demás
                                características de los vehículos así como publicar mas de 5.<br /></a><br /></a>
                                Si dejas que el sistema ayude a crear el titulo de tu publicación es posible que tengas
                                mejor resultado ya que los buscadores como GOOGLE lo encontrarán más fácil que si
                                agregas palabras como: Me voy y lo vendo, ta loquisimo, mi bebe, etc.<br /></a>
                                <a href=<input type="hidden" id="respuesta-12" value='
Para esto sólo tienes que hacer una publicación utilizando el enlace Publicar en el menu del tope y luego elegir la categoria y subcategoria correcta las cuales vienen preseleccionadas si estabas visitando la lista de vehículos.  Esto le dará más opciones como marca, modelo, año y combustible que usa el vehículo a publicar. Si tienes un plan de dealer de vehículos puedes agregarles de forma seleccionable accesorios y demás características de los vehículos así como publicar mas de 5.<br/></a><br/></a>
Si dejas que el sistema ayude a crear el titulo de tu publicación es posible que tengas mejor resultado ya que los buscadores como GOOGLE lo encontrarán más fácil que si agregas palabras como: Me voy y lo vendo, ta loquisimo, mi bebe, etc.<br/></a>
<a href='>
                                    <span class="categorias hidden" id="cat-12" rel="3">Dealers de Vehículos<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/cmo-publico-un-vehiculo-en-la-pulga-virtual_12.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-12');" value="FAQ_ESTATUS_" id="faq-12"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr15" rel="15">
                            <td class="recoger-data">15</td>
                            <td class="topico recoger-data">¿Cómo aplico descuentos a mis Precios? </td>
                            <td class="respuesta recoger-data">Si tienes un plan de Tiendas Virtuales, Dealers de
                                Vehículos, Inmobiliarias o LP+ puedes utilizar el servicio Administrador de Precios,
                                para modificar y agregar descuentos a los Precios de tus Publicaciones de forma fácil y
                                rápida.

                                Debajo del menu Mi Pulga -> Todas las opciones veras la opción.<input type="hidden"
                                    id="respuesta-15" value='Si tienes un plan de Tiendas Virtuales, Dealers de Vehículos,  Inmobiliarias o LP+ puedes utilizar el servicio Administrador de Precios, para modificar y agregar descuentos a los Precios de tus Publicaciones de forma fácil y rápida. 

Debajo del menu Mi Pulga -> Todas las opciones veras la opción.'>
                                <span class="categorias hidden" id="cat-15" rel="4">Inmobiliarias<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/cmo-aplico-descuentos-a-mis-precios_15.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-15');" value="FAQ_ESTATUS_" id="faq-15"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr17" rel="17">
                            <td class="recoger-data">17</td>
                            <td class="topico recoger-data">¿Que son los Planes de Tiendas Virtuales? </td>
                            <td class="respuesta recoger-data">Si eres vendedor establecido o estas en esos planes, te
                                ofrecemos este plan para que puedas publicar todo tu catálogo de productos y aumentar
                                las ventas de forma inmediata. Existen en nuestro portal multiples tipos de tiendas
                                clasificadas por categoría las cuales te darán beneficios adicionales que las
                                publicaciones normales. Te recordamos que somos los pioneros en el manejo de este tipo
                                de plan en nuestro pais y que tenemos basta experiencia en ese sentido.
                                <p class=<input type="hidden" id="respuesta-17" value='Si eres vendedor establecido o estas en esos planes, te ofrecemos este plan para que puedas publicar todo tu catálogo de productos y aumentar las ventas de forma inmediata.  Existen en nuestro portal multiples tipos de tiendas clasificadas por categoría las cuales te darán beneficios adicionales que las publicaciones normales.  Te recordamos que somos los pioneros en el manejo de este tipo de plan en nuestro pais y que tenemos basta experiencia en ese sentido. 
<p class='>
                                    <span class="categorias hidden" id="cat-17" rel="6,2,0">Publicidad Pagada<br>Tiendas
                                        Virtuales<br>Preguntas frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/que-son-los-planes-de-tiendas-virtuales_17.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-17');" value="FAQ_ESTATUS_" id="faq-17"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr19" rel="19">
                            <td class="recoger-data">19</td>
                            <td class="topico recoger-data">¿Qué son los Planes de Inmobiliarias? </td>
                            <td class="respuesta recoger-data">
                                <p>Uno de los sectores que tiene más influencia a que las personas usen internet es la
                                    venta de inmuebles. La Pulga Virtual pensando en esto incluye los planes para
                                    Inmobiliarias con lo que facilita mucho más las publicaciones de casas,
                                    apartamentos, etc. así como su forma de mostrarlos a los miles de visitantes que
                                    buscan este tipo de producto. </p>
                                <p>Para solicituar el tuyo usa este enlace <a
                                        href="/planes">https://www.lapulga.com.do/planes</a></p>
                                <p>Ver ejemplos <a class="azul" href="/inmobiliarias">aqui</a></p><input type="hidden"
                                    id="respuesta-19" value='<p>Uno de los sectores que tiene más influencia a que las personas usen internet es la venta de inmuebles. La Pulga Virtual pensando en esto incluye los planes para Inmobiliarias con lo que facilita mucho más las publicaciones de casas, apartamentos, etc. así como su forma de mostrarlos a los miles de visitantes que buscan este tipo de producto. </p>
<p>Para solicituar el tuyo usa este enlace <a href="/planes">https://www.lapulga.com.do/planes</a></p>
<p>Ver ejemplos <a class="azul" href="/inmobiliarias">aqui</a></p>'>
                                <span class="categorias hidden" id="cat-19" rel="6,4,0">Publicidad
                                    Pagada<br>Inmobiliarias<br>Preguntas frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/qu-son-los-planes-de-inmobiliarias_19.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-19');" value="FAQ_ESTATUS_" id="faq-19"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr20" rel="20">
                            <td class="recoger-data">20</td>
                            <td class="topico recoger-data">Beneficios y requisitos de un Plan de Usuario </td>
                            <td class="respuesta recoger-data">
                                <p><strong>Beneficios</strong></p>
                                <ul>
                                    <li>Mayor número de publicaciones</li>
                                    <li>Puedes renovar antes de llegar el tiempo de vencimiento</li>
                                    <li>Tus publicaciones se muestran en forma de catálogo.</li>
                                    <li>Muestras tu logo empresarial.</li>
                                    <li>Se agrupan por tipos lo que facilita la búsqueda.</li>
                                    <li>Ocupan las posiciones vip de la categoría relaciona cuando está vacía.</li>
                                    <li>URL única con el nombre de su Inmobiliaria en la página, la cual dará acceso
                                        rápido a su Inmobiliaria. (Ej: httpw://www.lapulga.com.do/nombredeinmobiliaria).
                                        Esta URL estará disponible mientras su Plan de Inmobiliaria este activo.</li>
                                </ul>
                                <p><strong>Requisitos</strong></p>
                                <ul>
                                    <li>Preferiblemente tener logo propio (en caso contrario se le asignara uno por
                                        defecto)</li>
                                    <li>Mínimo 15 publicaciones con fotos</li>
                                    <li>Dar seguimiento a tus publicaciones y actualizarlas.</li>
                                </ul><input type="hidden" id="respuesta-20" value='<p><strong>Beneficios</strong></p>
<ul>
<li>Mayor número de publicaciones</li>
<li>Puedes renovar antes de llegar el tiempo de vencimiento</li>
<li>Tus publicaciones se muestran en forma de catálogo.</li>
<li>Muestras tu logo empresarial.</li>
<li>Se agrupan por tipos lo que facilita la búsqueda.</li>
<li>Ocupan las posiciones vip de la categoría relaciona cuando está vacía.</li>
<li>URL única con el nombre de su Inmobiliaria en la página, la cual dará acceso rápido a su Inmobiliaria. (Ej: httpw://www.lapulga.com.do/nombredeinmobiliaria). Esta URL estará disponible mientras su Plan de Inmobiliaria este activo.</li>
</ul>
<p><strong>Requisitos</strong></p>
<ul>
<li>Preferiblemente tener logo propio (en caso contrario se le asignara uno por defecto)</li>
<li>Mínimo 15 publicaciones con fotos</li>
<li>Dar seguimiento a tus publicaciones y actualizarlas.</li>
</ul>'>
                                <span class="categorias hidden" id="cat-20" rel="6,4,3,2">Publicidad
                                    Pagada<br>Inmobiliarias<br>Dealers de Vehículos<br>Tiendas Virtuales<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/beneficios-y-requisitos-de-un-plan-de-usuario_20.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-20');" value="FAQ_ESTATUS_" id="faq-20"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr21" rel="21">
                            <td class="recoger-data">21</td>
                            <td class="topico recoger-data">Distribución de Banners </td>
                            <td class="respuesta recoger-data"> Los banners son otra forma de publicidad los cuales
                                muestran productos así como marcas de empresas. Estos son imágenes con tamaños normales
                                en píxeles, utilizamos 728x90 y 300x250 en la portada, así como 160x600 y 300x600 en las
                                categorías.

                                para mas información puedes llamarnos al 809-549-6581 o al WhatsApp 829-795-8684<input
                                    type="hidden" id="respuesta-21" value=' Los banners son otra forma de publicidad los cuales muestran productos así como marcas de empresas.  Estos son imágenes con tamaños normales en píxeles, utilizamos 728x90 y 300x250 en la portada, así como 160x600 y 300x600 en las categorías.

para mas información puedes llamarnos al 809-549-6581 o al WhatsApp 829-795-8684'>
                                <span class="categorias hidden" id="cat-21" rel="6">Publicidad Pagada<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/distribucin-de-banners_21.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-21');" value="FAQ_ESTATUS_" id="faq-21"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr23" rel="23">
                            <td class="recoger-data">23</td>
                            <td class="topico recoger-data">¿Qué son Enlaces Patrocinados? </td>
                            <td class="respuesta recoger-data">

                                La Pulga Virtual ha ido desarrollando multiples herramientas que facilitan las
                                vistosidad de tus publicaciones aumentando con esto que lleguen a más de nuestros
                                visitantes.<br /></a><br /></a>

                                Con un Enlace Patrocinado podrás promocionar en el tope de todos los listado lo
                                siguiente: <br /></a>

                                Una publicacion cualquiera.
                                Una Tienda Virtual, Dealer o Inmobiliaria.
                                Un Usuario (Esta permite mostrar un resultado de todas tus
                                publicaciones).<br /></a><br /></a>

                                <strong>Cada enlace se mostrara en diferentes secciones de la página: </strong>
                                <ul>
                                    <li>Categorias y Subcategorias</li>
                                    <li>Marcas y modelos de vehiculos</li>
                                    <li>Marcas y modelos de celulares</li>
                                    <li>Tiendas Virtuales</li>
                                    <li>Deales de Vehiculos</li>
                                    <li>Inmobiliarias</li>
                                    <li>Directorio de Servicios</li>
                                    <li>Entre otras areas de importancia.</li>
                                </ul>
                                Para empezar a usar los Enlaces Patrocinados ve a Mi Cuenta o<a href=<input
                                    type="hidden" id="respuesta-23" value='

La Pulga Virtual ha ido desarrollando multiples herramientas que facilitan las vistosidad de tus publicaciones aumentando con esto que lleguen a más de nuestros visitantes.<br/></a><br/></a>

Con un Enlace Patrocinado podrás promocionar en el tope de todos los listado lo siguiente: <br/></a>

Una publicacion cualquiera.
Una Tienda Virtual, Dealer o Inmobiliaria.
Un Usuario (Esta permite mostrar un resultado de todas tus publicaciones).<br/></a><br/></a>

<strong>Cada enlace se mostrara en diferentes secciones de la página: </strong>
<ul>
<li>Categorias y Subcategorias</li>
<li>Marcas y modelos de vehiculos</li>
<li>Marcas y modelos de celulares</li>
<li>Tiendas Virtuales</li>
<li>Deales de Vehiculos</li>
<li>Inmobiliarias</li>
<li>Directorio de Servicios</li>
<li>Entre otras areas de importancia.</li> </ul>
Para empezar a usar los Enlaces Patrocinados ve a Mi Cuenta o<a href='>
                                    <span class="categorias hidden" id="cat-23" rel="6">Publicidad Pagada<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/qu-son-enlaces-patrocinados_23.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-23');" value="FAQ_ESTATUS_" id="faq-23"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr24" rel="24">
                            <td class="recoger-data">24</td>
                            <td class="topico recoger-data">¿Qué es el Area de ofertas? </td>
                            <td class="respuesta recoger-data">
                                <p>Este espacio en la página principal permite a los usuarios colocar sus ofertas. Cada
                                    dos minutos se muestra una tienda o usuario diferente tomando al azar 6 de sus
                                    publicaciones, por lo que mientras mas publicaciones tienes mas oportunidades tienes
                                    de que tus ofertas sean visitadas. Ejemplo, si hay 3 usuarios tus ofertas seran
                                    mostradas cada 6 minutos.<br /><br />Para aplicar debes tener un minimo de 6
                                    publicaciones activas <strong>no repetidas, </strong>menos de ahi el sistema no las
                                    mostrará. Para mas informacion contactanos via Whatsapp <strong>829-795-8684
                                    </strong>o a <a href="/soporte" class="azul">soporte</a></p>
                                <p>Solicita tu espacio en este enlace <a title="Click para solicitar tu espacio"
                                        href="https://www.lapulga.com.do/areaofertas"
                                        class="azul">https://www.lapulga.com.do/areaofertas</a></p><input type="hidden"
                                    id="respuesta-24"
                                    value='<p>Este espacio en la página principal permite a los usuarios colocar sus ofertas. Cada dos minutos se muestra una tienda o usuario diferente tomando al azar 6 de sus publicaciones, por lo que mientras mas publicaciones tienes mas oportunidades tienes de que tus ofertas sean visitadas. Ejemplo, si hay 3 usuarios tus ofertas seran mostradas cada 6 minutos.<br /><br />Para aplicar debes tener un minimo de 6 publicaciones activas <strong>no repetidas, </strong>menos de ahi el sistema no las mostrará.  Para mas informacion contactanos via Whatsapp <strong>829-795-8684 </strong>o a <a href="/soporte" class="azul">soporte</a></p>
<p>Solicita tu espacio en este enlace <a title="Click para solicitar tu espacio" href="https://www.lapulga.com.do/areaofertas" class="azul">https://www.lapulga.com.do/areaofertas</a></p>'>
                                <span class="categorias hidden" id="cat-24" rel="6,1,0">Publicidad
                                    Pagada<br>Publicaciones<br>Preguntas frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/qu-es-el-area-de-ofertas_24.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-24');" value="FAQ_ESTATUS_" id="faq-24"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr26" rel="26">
                            <td class="recoger-data">26</td>
                            <td class="topico recoger-data">¿Qué son los PINES, para que sirven y como los compro? </td>
                            <td class="respuesta recoger-data">
                                <p>Los Pines son como créditos o puntos que se aplican a las publicaciones para estar en
                                    secciones VIP, resaltar publicaciones, enlaces patrocinados o algún opcional. Si
                                    deseas saber más sobre los VIP y los opcionales que les puedes agregar a tus
                                    artículos haz <strong><a
                                            href="http://ayuda.lapulga.com.do/content/1/28/es/que-es-un-opcional-en-las-publicaciones-y-como-se-usa.html?highlight=vip">Click
                                            Aqui</a></strong>. Para empezar a aplicarlos a tu Cuenta de Usuario sólo
                                    tienes que acceder al menú del tope MI PULGA o hacer<strong> <a
                                            href="http://lapulga.com.do/mipulga.php">Click Aquí</a></strong><strong>
                                    </strong>y luego clickear la opción <strong>"Agrega Opcional</strong>" del menú que
                                    se encuentra a la derecha de la publicación que desees aplicarle PINES. Luego
                                    aparecerá un formulario como en la imagen</p>
                                <p>Cada PIN cuesta RD$50.00 o US$1.00 en caso de que decidas pagar por PayPal. La compra
                                    de Pines la puedes hacer con <a href="http://lapulga.com.do/pines.php"><strong>Click
                                            Aquí.</strong></a> Puedes pagar utilizando una de estas formas:</p>
                                <ul>
                                    <li><strong>Banco de Reservas:</strong> Haciendo una transferencia a depósito a la
                                        cuenta No. 011-034314-9.</li>
                                    <li><strong>Banco Popular: </strong>Haciendo una transferencia o depósito a la
                                        cuenta No. 730716503.</li>
                                    <li><strong>Banco BHD Leon: </strong>Haciendo una transferencia o depósito a la
                                        cuenta No. 0420435-001-4.</li>
                                    <li><strong>PayPal: </strong>Esto es si tienes tu tarjeta de crédito inscrita en
                                        este sistema por el cual puedes pagar en dólares, mediante una transferencia
                                        electrónica.</li>
                                </ul>Click Aqui. Para empezar a aplicarlos a tu Cuenta de Usuario sólo tienes que
                                acceder al menú del tope MI PULGA o hacer Click Aquí y luego clickear la opción "Agrega
                                Opcional" del menú que se encuentra a la derecha de la publicación que desees aplicarle
                                PINES. Luego aparecerá un formulario como en la imagen
                                Cada PIN cuesta RD$50.00 o US$1.00 en caso de que decidas pagar por PayPal. La compra de
                                Pines la puedes hacer con Click Aquí. Puedes pagar utilizando una de estas formas:

                                Banco de Reservas: Haciendo una transferencia a depósito a la cuenta No. 011-034314-9.
                                Banco Popular: Haciendo una transferencia o depósito a la cuenta No. 730716503.
                                Banco BHD Leon: Haciendo una transferencia o depósito a la cuenta No. 0420435-001-4.
                                PayPal: Esto es si tienes tu tarjeta de crédito inscrita en este sistema por el cual
                                puedes pagar en dólares, mediante una transferencia electrónica.
                                "><input type="hidden" id="respuesta-26" value='<p>Los Pines son como créditos o puntos que se aplican a las publicaciones para estar en secciones VIP, resaltar publicaciones, enlaces patrocinados o algún opcional. Si deseas saber más sobre los VIP y los opcionales que les puedes agregar a tus artículos haz <strong><a href="http://ayuda.lapulga.com.do/content/1/28/es/que-es-un-opcional-en-las-publicaciones-y-como-se-usa.html?highlight=vip">Click Aqui</a></strong>. Para empezar a aplicarlos a tu Cuenta de Usuario sólo tienes que acceder al menú del tope MI PULGA o hacer<strong> <a href="http://lapulga.com.do/mipulga.php">Click Aquí</a></strong><strong> </strong>y luego clickear la opción <strong>"Agrega Opcional</strong>" del menú  que se encuentra a la derecha de la publicación que desees aplicarle PINES. Luego aparecerá un formulario como en la imagen</p>
<p>Cada PIN cuesta RD$50.00 o US$1.00 en caso de que decidas pagar por PayPal. La compra de Pines la puedes hacer con <a href="http://lapulga.com.do/pines.php"><strong>Click Aquí.</strong></a> Puedes pagar utilizando una de estas formas:</p>
<ul>
<li><strong>Banco de Reservas:</strong> Haciendo una transferencia a depósito a la cuenta No. 011-034314-9.</li>
<li><strong>Banco Popular: </strong>Haciendo una transferencia o depósito a la cuenta No. 730716503.</li>
<li><strong>Banco BHD Leon: </strong>Haciendo una transferencia o depósito a la cuenta No. 0420435-001-4.</li>
<li><strong>PayPal: </strong>Esto es si tienes tu tarjeta de crédito inscrita en este sistema por el cual puedes pagar en dólares, mediante una transferencia electrónica.</li>
</ul>Click Aqui. Para empezar a aplicarlos a tu Cuenta de Usuario sólo tienes que acceder al menú del tope MI PULGA o hacer Click Aquí y luego clickear la opción "Agrega Opcional" del menú  que se encuentra a la derecha de la publicación que desees aplicarle PINES. Luego aparecerá un formulario como en la imagen
Cada PIN cuesta RD$50.00 o US$1.00 en caso de que decidas pagar por PayPal. La compra de Pines la puedes hacer con Click Aquí. Puedes pagar utilizando una de estas formas:

Banco de Reservas: Haciendo una transferencia a depósito a la cuenta No. 011-034314-9.
Banco Popular: Haciendo una transferencia o depósito a la cuenta No. 730716503.
Banco BHD Leon: Haciendo una transferencia o depósito a la cuenta No. 0420435-001-4.
PayPal: Esto es si tienes tu tarjeta de crédito inscrita en este sistema por el cual puedes pagar en dólares, mediante una transferencia electrónica.
">'>
                                <span class="categorias hidden" id="cat-26" rel="6,1,0">Publicidad
                                    Pagada<br>Publicaciones<br>Preguntas frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/qu-son-los-pines-para-que-sirven-y-como-los-compro_26.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-26');" value="FAQ_ESTATUS_" id="faq-26"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr27" rel="27">
                            <td class="recoger-data">27</td>
                            <td class="topico recoger-data">¿Qué es La Pulga Virtual y qué ventajas me ofrece? </td>
                            <td class="respuesta recoger-data">
                                <p>Es el portal más completo de compras y ventas por internet en República Dominicana,
                                    el cual ofrece muchas ventajas tanto a los compradores como a los vendedores que nos
                                    visitan.</p>
                                <p><strong>Ventajas para los vendedores gratuítos o plan básico.</strong></p>
                                <ul>
                                    <li>Siempre están disponibles con tan sólo dar un click.</li>
                                    <li>Es una publicación más gráfica, interactiva y dinámica.</li>
                                    <li>Cuenta con una gran cantidad de publicaciones, las cuales te permiten colocar
                                        cinco (5) fotos a cada una y en caso de requerir más solicitar extensión
                                        totalmente gratis.</li>
                                    <li>Tienen hasta 21 días de vigencia, y se te avisa tres días antes de vencerce para
                                        que la renueves, si gustas y no tengas que digitarlo nuevamente.</li>
                                    <li>No tiene límites de detalles, es decir pudes escribir lo que quieras acerca de
                                        tu venta o búsqueda.</li>
                                    <li>Cuentas con un buzón, en el que otros usuarios pueden escribir si les interesa
                                        tu publicación.</li>
                                </ul>
                                <p><strong>Ventajas para los vendedores con planes VIP o pagados.</strong></p>
                                <ul>
                                    <li>Te ofrece mayor número de publicaciones, desde 55 hasta 500 dependiendo el plan
                                        de usuarios o tienda virtual que tengas.</li>
                                    <li>Hasta 7 fotos a exhibir por cada publicación.</li>
                                    <li>Sus publicaciones duran mucho más tiempo, hasta 2 meses de vigencia con opción
                                        de renovarlas todos los días.</li>
                                    <li>Editores HTML con el que puedes introducir detalles a colores, catálogos e
                                        imágenes en el detalle de una publicación.</li>
                                    <li>Links especiales para los usuarios con planes de tienda, lo que aumenta las
                                        posibilidades de visitas de los compradores.</li>
                                    <li>Exhibición de logo comercial con el que puede ir grabando el nombre de su
                                        empresa o negocio en la mente de los compradores.</li>
                                </ul>
                                <p><strong>Ventajas para los compradores.</strong></p>
                                <ul>
                                    <li>Pueden comprar entre las ofertas de varios vendedores.</li>
                                    <li>Pueden visualizar con detalles lo que van a comprar.</li>
                                    <li>Disponen de cientos de opciones a escoger.</li>
                                    <li>Pueden informarse de todos lo detalles de la venta.</li>
                                    <li>La publicación esta disponible las 24 horas del día, internet no duerme.</li>
                                    <li>También pueden publicar lo que andan buscando, sí no lo encuentran.</li>
                                    <li>Pueden guardar en la agenda que les proporciona la página, todos los artículos
                                        que le han gustado, e ir guardando un registro, favoritos.</li>
                                </ul>
                                <p><strong>No existe ningún método tradicional de anunciarse o comprar que ofrezca
                                        tantas ventajas como La Pulga Virtual</strong></p><input type="hidden"
                                    id="respuesta-27"
                                    value='<p>Es el portal más completo de compras y ventas por internet en República Dominicana, el cual ofrece muchas ventajas tanto a los compradores como a los vendedores que nos visitan.</p>
<p><strong>Ventajas para los vendedores gratuítos o plan básico.</strong></p>
<ul>
<li>Siempre están disponibles con tan sólo dar un click.</li>
<li>Es una publicación más gráfica, interactiva y dinámica.</li>
<li>Cuenta con una gran cantidad de publicaciones, las cuales te permiten colocar cinco (5) fotos a cada una y en caso de requerir más solicitar extensión totalmente gratis.</li>
<li>Tienen hasta 21 días de vigencia, y se te avisa tres días antes de vencerce para que la renueves, si gustas y no tengas que digitarlo nuevamente.</li>
<li>No tiene límites de detalles, es decir pudes escribir lo que quieras acerca de tu venta o búsqueda.</li>
<li>Cuentas con un buzón, en el que otros usuarios pueden escribir si les interesa tu publicación.</li>
</ul>
<p><strong>Ventajas para los vendedores con planes VIP o pagados.</strong></p>
<ul>
<li>Te ofrece mayor número de publicaciones, desde 55 hasta 500 dependiendo el plan de usuarios o tienda virtual que tengas.</li>
<li>Hasta 7 fotos a exhibir por cada publicación.</li>
<li>Sus publicaciones duran mucho más tiempo, hasta 2 meses de vigencia con opción de renovarlas todos los días.</li>
<li>Editores HTML con el que puedes introducir detalles a colores, catálogos e imágenes en el detalle de una publicación.</li>
<li>Links especiales para los usuarios con planes de tienda, lo que aumenta las posibilidades de visitas de los compradores.</li>
<li>Exhibición de logo comercial con el que puede ir grabando el nombre de su empresa o negocio en la mente de los compradores.</li>
</ul>
<p><strong>Ventajas para los compradores.</strong></p>
<ul>
<li>Pueden comprar entre las ofertas de varios vendedores.</li>
<li>Pueden visualizar con detalles lo que van a comprar.</li>
<li>Disponen de cientos de opciones a escoger.</li>
<li>Pueden informarse de todos lo detalles de la venta.</li>
<li>La publicación esta disponible las 24 horas del día, internet no duerme.</li>
<li>También pueden publicar lo que andan buscando, sí no lo encuentran.</li>
<li>Pueden guardar en la agenda que les proporciona la página, todos los artículos que le han gustado, e ir guardando un registro, favoritos.</li>
</ul>
<p><strong>No existe ningún método tradicional de anunciarse o comprar que ofrezca tantas ventajas como  La Pulga Virtual</strong></p>'>
                                <span class="categorias hidden" id="cat-27" rel="0">Preguntas frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/qu-es-la-pulga-virtual-y-qu-ventajas-me-ofrece_27.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-27');" value="FAQ_ESTATUS_" id="faq-27"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr28" rel="28">
                            <td class="recoger-data">28</td>
                            <td class="topico recoger-data">Red Repuestos de Vehículos </td>
                            <td class="respuesta recoger-data">

                                <p>La Pulga Virtual siempre tratando de ayudarles a conseguir lo que buscan ha incluido
                                    una nueva herramienta que los conecta con la red de repuestos de vehículos en
                                    nuestro pais. Si no encuentras lo que buscas no sigas andando ni llamando a
                                    repuestos de manera individual, solo click aquí y llena el formulario y estarás
                                    recibiendo oferta de los aliados a la red.</p>

                                <p>Nuestra red funciona de la siguiente manera:</p>

                                <h4>Para el caso de los repuestos:</h4>

                                <ol>
                                    <li>Cada repuesto que quiera pertenecer a la red solo tiene que llenar el formulario
                                        aquí.</li>
                                    <li>En el completara sus datos principales asi como las marcas de vehiculo con las
                                        que trabaja.</li>
                                    <li>Una vez aprobado dicho registro empezarás a recibir las solicitudes de piezas
                                        que hacen los usuarios a travéz del portal al momento de buscar una pieza no
                                        publicada,<strong> esto es totalmente gratis para ustedes</strong>.</li>
                                    <li>Cada vez que recibas una solicitud de pieza solo tienes que verificar el correo
                                        y dar click en el enlace de seguimiento si entiendes que puedes conseguir esta
                                        pieza. En el tendrás un campo para enviar un mensaje el usuario que hizo la
                                        solicitud donde pondrás los detalles de precio y demás información a ser
                                        enviada.</li>
                                    <li>El usuario o cliente recibirá tu oferta y te estará contactando en caso de que
                                        le convenga la misma.</li>
                                    <li>Otros repuestos pueden estar ofertando lo mismo por lo que te recomendamos
                                        vendas a precios competitivos y de calidad.</li>
                                    <li>Para afiliarte usa este enlace <a href=<input type="hidden" id="respuesta-28"
                                            value='

<p>La Pulga Virtual siempre tratando de ayudarles a conseguir lo que buscan ha incluido una nueva herramienta que los conecta con la red de repuestos de vehículos en nuestro pais.  Si no encuentras lo que buscas no sigas andando ni llamando a repuestos de manera individual, solo click aquí y llena el formulario y estarás recibiendo oferta de los aliados a la red.</p>

<p>Nuestra red funciona de la siguiente manera:</p>

<h4>Para el caso de los repuestos:</h4>

<ol>
	<li>Cada repuesto que quiera pertenecer a la red solo tiene que llenar el formulario aquí.</li>
	<li>En el completara sus datos principales asi como las marcas de vehiculo con las que trabaja.</li>
	<li>Una vez aprobado dicho registro empezarás a recibir las solicitudes de piezas que hacen los usuarios a travéz del portal al momento de buscar una pieza no publicada,<strong> esto es totalmente gratis para ustedes</strong>.</li>
	<li>Cada vez que recibas una solicitud de pieza solo tienes que verificar el correo y dar click en el enlace de seguimiento si entiendes que puedes conseguir esta pieza. En el tendrás un campo para enviar un mensaje el usuario que hizo la solicitud donde pondrás los detalles de precio y demás información a ser enviada.</li>
	<li>El usuario o cliente recibirá tu oferta y te estará contactando en caso de que le convenga la misma.</li>
	<li>Otros repuestos pueden estar ofertando lo mismo por lo que te recomendamos vendas a precios competitivos y de calidad.</li>
	<li>Para afiliarte usa este enlace <a href='>
                                            <span class="categorias hidden" id="cat-28" rel="3">Dealers de
                                                Vehículos<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/red-repuestos-de-vehculos_28.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-28');" value="FAQ_ESTATUS_" id="faq-28"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr29" rel="29">
                            <td class="recoger-data">29</td>
                            <td class="topico recoger-data">¿Como me registro y para que? </td>
                            <td class="respuesta recoger-data">
                                <p>Para registrarte solo usas este <a class="azul" href="/registro">enlace</a> donde
                                    llenar&aacute;s tu informaci&oacute;n de contacto para poder realizar publicaciones
                                    de compras o ventas, as&iacute; como contactar otros usuarios en el sistema, tener
                                    plan de usuarios etc. Registrarse en La Pulga Virtual es totalmente
                                    <strong>GRATIS</strong>.</p><input type="hidden" id="respuesta-29"
                                    value='<p>Para registrarte solo usas este <a class="azul" href="/registro">enlace</a> donde llenar&aacute;s tu informaci&oacute;n de contacto para poder realizar publicaciones de compras o ventas, as&iacute; como contactar otros usuarios en el sistema, tener plan de usuarios etc. Registrarse en La Pulga Virtual es totalmente <strong>GRATIS</strong>.</p>'>
                                <span class="categorias hidden" id="cat-29" rel="1,0">Publicaciones<br>Preguntas
                                    frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/como-me-registro-y-para-que_29.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-29');" value="FAQ_ESTATUS_" id="faq-29"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr30" rel="30">
                            <td class="recoger-data">30</td>
                            <td class="topico recoger-data">¿Como puedo poner mi publicacion en la seccion VIP?</td>
                            <td class="respuesta recoger-data">
                                <p>Para colocar cualquier publicacion en VIP solo debes adquirir PINES y visitar el
                                    enlace <a class="azul" href="/mipulga">mi pulga</a> donde ver&aacute;s las opciones
                                    para cada publicaci&oacute;n que tengas.&nbsp; Con los PINES puedes tambien resaltar
                                    cada publicacion por varios dias.&nbsp; Para los VIP un PIN sirve para un dia en la
                                    portada y dos dias en categorias.</p>
                                <p>Si quieres saber m&aacute;s sobre los pines usa este <a class="azul"
                                        href="/ayuda?cid=1&amp;id=26">enlace</a></p><input type="hidden"
                                    id="respuesta-30" value='<p>Para colocar cualquier publicacion en VIP solo debes adquirir PINES y visitar el enlace <a class="azul" href="/mipulga">mi pulga</a> donde ver&aacute;s las opciones para cada publicaci&oacute;n que tengas.&nbsp; Con los PINES puedes tambien resaltar cada publicacion por varios dias.&nbsp; Para los VIP un PIN sirve para un dia en la portada y dos dias en categorias.</p>
<p>Si quieres saber m&aacute;s sobre los pines usa este <a class="azul" href="/ayuda?cid=1&amp;id=26">enlace</a></p>'>
                                <span class="categorias hidden" id="cat-30" rel="6,1,0">Publicidad
                                    Pagada<br>Publicaciones<br>Preguntas frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/como-puedo-poner-mi-publicacion-en-la-seccion-vip_30.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-30');" value="FAQ_ESTATUS_" id="faq-30"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr31" rel="31">
                            <td class="recoger-data">31</td>
                            <td class="topico recoger-data">¿Qué es un opcional en las publicaciones y cómo se usa?</td>
                            <td class="respuesta recoger-data">
                                <p>Aunque todas las publicaciones son gratuitas existen varias formas de realzar cada
                                    una de ellas ya sea colocándolas en sitios estratégicos o diferenciándolas de otras
                                    en las listas. Hasta el momento existen 5 opcionales y la cantidad de PINES a usar
                                    en cada una, ver listado a continuación:</p>
                                <ul>
                                    <li>Publicación en áreas VIP Página Principal (1 PIN por 1 día)</li>
                                    <li>Publicación en área VIP Categoría (1 PIN por 2 días)</li>
                                    <li>Publicación Resaltada (1 PIN por 5 días)</li>
                                </ul>
                                <p>Para poder hacer esto debes tener PINES en balance y si deseas saber como
                                    conseguirlos sigue este enlace <a href="/ayuda?cid=1&id=26">Qué son los PINES</a>,
                                    para que sirven y cómo los compro? </p><input type="hidden" id="respuesta-31"
                                    value='<p>Aunque todas las publicaciones son gratuitas existen varias formas de realzar cada una de ellas ya sea colocándolas en sitios estratégicos o diferenciándolas de otras en las listas. Hasta el momento existen 5 opcionales y la cantidad de PINES a usar en cada una, ver listado a continuación:</p>
<ul>
<li>Publicación en áreas VIP Página Principal (1 PIN por 1 día)</li>
<li>Publicación en área VIP Categoría (1 PIN por 2 días)</li>
<li>Publicación Resaltada (1 PIN por 5 días)</li>
</ul>
<p>Para poder hacer esto debes tener PINES en balance y si deseas saber como conseguirlos sigue este enlace <a href="/ayuda?cid=1&id=26">Qué son los PINES</a>, para que sirven y cómo los compro? </p>'>
                                <span class="categorias hidden" id="cat-31" rel="6,1">Publicidad
                                    Pagada<br>Publicaciones<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/qu-es-un-opcional-en-las-publicaciones-y-cmo-se-usa_31.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-31');" value="FAQ_ESTATUS_" id="faq-31"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr35" rel="35">
                            <td class="recoger-data">35</td>
                            <td class="topico recoger-data">¿Qué es la Red de Prestamos?</td>
                            <td class="respuesta recoger-data">
                                <p>La Pulga Virtual te sirve como enlace a una red de entidades financieras y bancos
                                    comerciales para que tengas la facilidad de solicitar un préstamo para Vehículos.
                                </p>
                                <p>Llenando el formulario <a
                                        href="https://www.lapulga.com.do/prestamos">https://www.lapulga.com.do/prestamos</a>
                                    enviarás tus datos a las entidades que trabajen con el tipo de solicitud que hagas.
                                    Es importante que siempre coloques email y teléfonos de contacto correctos para
                                    poder darle seguimiento de forma adecuada.</p>
                                <p><strong>Que tasa me ofrecen? </strong>Cada entidad tiene politicas diferentes en
                                    cuanto a las tasas que ofrecen y los requisitos para obtenerlas. Es por tal razón
                                    que recomendamos llenar la solicitud (si en verdad deseas préstamo) aquí y esperar
                                    que te notifiquen con dicha informacion, dependiendo el tipo de solicitud que hagas.
                                    Para el caso de los vehículos las tasas varían según año y marca así como el monto
                                    solicitado.</p>
                                <p><strong>Que tipo de préstamos ofrecen?</strong> Hasta el momento las entidades
                                    financieras aliadas trabajan solo con vehiculos.</p>
                                <p><strong>Nota importante</strong>. Trata de solo hacer la solicitud si en verdad
                                    deseas un préstamo no solo para probar si te prestan ya que invertimos recursos
                                    económicos y humanos procesando cada solicitud asumiendo que es real. Esto le puede
                                    restar seriedad a una futura solicitud suya ya que en el sistema siempre estará su
                                    cédula.</p><input type="hidden" id="respuesta-35"
                                    value='<p>La Pulga Virtual te sirve como enlace a una red de entidades financieras y bancos comerciales para que tengas la facilidad de solicitar un préstamo para Vehículos.</p>
<p>Llenando el formulario <a href="https://www.lapulga.com.do/prestamos">https://www.lapulga.com.do/prestamos</a> enviarás tus datos a las entidades que trabajen con el tipo de solicitud que hagas. Es importante que siempre coloques email y teléfonos de contacto correctos para poder darle seguimiento de forma adecuada.</p>
<p><strong>Que tasa me ofrecen? </strong>Cada entidad tiene politicas diferentes en cuanto a las tasas que ofrecen y los requisitos para obtenerlas. Es por tal razón que recomendamos llenar la solicitud (si en verdad deseas préstamo) aquí y esperar que te notifiquen con dicha informacion, dependiendo el tipo de solicitud que hagas. Para el caso de los vehículos las tasas varían según año y marca así como el monto solicitado.</p>
<p><strong>Que tipo de préstamos ofrecen?</strong> Hasta el momento las entidades financieras aliadas trabajan solo con vehiculos.</p>
<p><strong>Nota importante</strong>. Trata de solo hacer la solicitud si en verdad deseas un préstamo no solo para probar si te prestan ya que invertimos recursos económicos y humanos procesando cada solicitud asumiendo que es real. Esto le puede restar seriedad a una futura solicitud suya ya que en el sistema siempre estará su cédula.</p>'>
                                <span class="categorias hidden" id="cat-35" rel="0">Preguntas frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/qu-es-la-red-de-prestamos_35.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-35');" value="FAQ_ESTATUS_" id="faq-35"
                                    checked>
                            </td>
                        </tr>

                        <tr id="tr7" rel="7">
                            <td class="recoger-data">7</td>
                            <td class="topico recoger-data">¿Qué hago si llegue al limite de publicaciones? </td>
                            <td class="respuesta recoger-data">
                                <p>Las publicaciones en nuestro sitio tienen un limite para evitar que muchos usuarios
                                    publiquen de forma repetida lo mismo y asi el portal mantiene mas organizadas sus
                                    publicaciones. De todos modos, si en algun momento recibes un mensaje que has
                                    llegado al limite de tus publicaciones y en realidad requieres continuar publicando
                                    elige una de las opciones siguiente:</p>
                                <ul>
                                    <li>Solicita una extensión de publicaciones en Soporte -> Extensión Publicación o
                                        usa este enlace: <a class="azul"
                                            href="http://www.lapulga.com.do/soporte"><strong> soporte</strong></a> y
                                        selecciona en area de interes Extensión de Publicación. Para este caso solo se
                                        acepta una solicitud a la vez, tan pronto sea utilizados puedes solicitar una
                                        nuevamente y verificaremos si aplicas.</li>
                                    <li>Seleccionar cualquiera de los <a class="azul" href="/planes">Planes de
                                            Usuarios</a> disponibles los cuales tienen ilimitado número de
                                        publicaciones.</li>
                                </ul>
                                <p>Cualquier duda puedes contactarnos vía Whatsapp al <strong>829-975-8684, </strong><a
                                        class="azul" href="/soporte">soporte</a> y selecciona en area de interes
                                    Extensión de Publicación.</p><input type="hidden" id="respuesta-7"
                                    value='<p>Las publicaciones en nuestro sitio tienen un limite para evitar que muchos usuarios publiquen de forma repetida lo mismo y asi el portal mantiene mas organizadas sus publicaciones. De todos modos, si en algun momento recibes un mensaje que has llegado al limite de tus publicaciones y en realidad requieres continuar publicando elige una de las opciones siguiente:</p>
<ul>
<li>Solicita una extensión de publicaciones en Soporte -> Extensión Publicación o usa este enlace: <a class="azul" href="http://www.lapulga.com.do/soporte"><strong> soporte</strong></a> y selecciona en area de interes Extensión de Publicación. Para este caso solo se acepta una solicitud a la vez, tan pronto sea utilizados puedes solicitar una nuevamente y verificaremos si aplicas.</li>
<li>Seleccionar cualquiera de los <a class="azul" href="/planes">Planes de Usuarios</a> disponibles los cuales tienen ilimitado número de publicaciones.</li>
</ul>
<p>Cualquier duda puedes contactarnos vía Whatsapp al <strong>829-975-8684, </strong><a class="azul" href="/soporte">soporte</a> y selecciona en area de interes Extensión de Publicación.</p>'>
                                <span class="categorias hidden" id="cat-7" rel="6,4,3,2,1">Publicidad
                                    Pagada<br>Inmobiliarias<br>Dealers de Vehículos<br>Tiendas
                                    Virtuales<br>Publicaciones<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/qu-hago-si-llegue-al-limite-de-publicaciones_7.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-7');" value="FAQ_ESTATUS_" id="faq-7">
                            </td>
                        </tr>

                        <tr id="tr32" rel="32">
                            <td class="recoger-data">32</td>
                            <td class="topico recoger-data">¿Qué es Link o Enlace a Plan?</td>
                            <td class="respuesta recoger-data">Este novedoso servicio te ayuda a conseguir más visitas
                                directas a Tiendas Virtuales, Dealers de vehículos o Inmobiliarias desde las zonas VIP
                                de la página, tanto en portada como categorías.
                                Simplemente esto es un nuevo opcional el cual se activa con el uso de pines de igual
                                forma que se realiza para los VIP, Resaltado y Foto en Lista. Si eres un usuario con
                                cualquier de los planes mencionados y aplicas opcional VIP tendrás la opción de hacer
                                cotejo o check en Redirecciona a su Tienda en caso de ser y serán descontados 2 pines.
                                Aumenta las visitas a tu plan y da a conocer mas tu negocio de esta manera, si tienes
                                alguna duda adicional utiliza el chat o llama al 809-549-6581 para más
                                información.<input type="hidden" id="respuesta-32"
                                    value='Este novedoso servicio te ayuda a conseguir más visitas directas a Tiendas Virtuales, Dealers de vehículos o Inmobiliarias desde las zonas VIP de la página, tanto en portada como categorías.
Simplemente esto es un nuevo opcional el cual se activa con el uso de pines de igual forma que se realiza para los VIP, Resaltado y Foto en Lista.  Si eres un usuario con cualquier de los planes mencionados y aplicas opcional VIP tendrás la opción de hacer cotejo o check en Redirecciona a su Tienda en caso de ser y serán descontados 2 pines.
Aumenta las visitas a tu plan y da a conocer mas tu negocio de esta manera, si tienes alguna duda adicional utiliza el chat o llama al 809-549-6581 para más información.'>
                                <span class="categorias hidden" id="cat-32" rel="5">Seguridad<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/qu-es-link-o-enlace-a-plan_32.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-32');" value="FAQ_ESTATUS_" id="faq-32">
                            </td>
                        </tr>

                        <tr id="tr36" rel="36">
                            <td class="recoger-data">36</td>
                            <td class="topico recoger-data">¿Qué son los Planes de Usuarios? </td>
                            <td class="respuesta recoger-data">Con ciertos privilegios que adquieren los usuarios para
                                realizar actividades relacionadas con sus publicaciones de una forma más fácil. Aunque
                                todos los usuarios se registran de forma gratuita, el tener un plan tiene un costo el
                                cual va desde RD$550.00 hasta RD$2,500.00 mensuales.
                                En la actualidad La Pulga Virtual ofrece varios Planes de Usuario que se pueden adaptar
                                a tus necesidades.
                                Click para ver listado de detalles
                                <input type="hidden" id="respuesta-36" value='Con ciertos privilegios que adquieren los usuarios para realizar actividades relacionadas con sus publicaciones de una forma más fácil.  Aunque todos los usuarios se registran de forma gratuita, el tener un plan tiene un costo el cual va desde RD$550.00 hasta RD$2,500.00 mensuales.
En la actualidad La Pulga Virtual ofrece varios Planes de Usuario que se pueden adaptar a tus necesidades.
Click para ver listado de detalles
'>
                                <span class="categorias hidden" id="cat-36" rel="4,3,2,1,0">Inmobiliarias<br>Dealers de
                                    Vehículos<br>Tiendas Virtuales<br>Publicaciones<br>Preguntas frecuentes<br></span>

                            </td>

                            <td>

                                <input type="text" onclick="this.select(); document.execCommand('Copy');"
                                    value="https://beta.lapulga.com.do/ayuda/qu-son-los-planes-de-usuarios_36.html" />
                            </td>

                            <td align='center'>
                                <input type="checkbox" onchange="estatus('faq-36');" value="FAQ_ESTATUS_" id="faq-36">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>