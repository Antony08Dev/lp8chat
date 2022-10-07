<li class="side-bar-item"><a href="/adminlp"><i class="fas fa-filter"></i>Mostrar Todas</a></li>
<?php 
switch (Config::$arrParametrosmvc['param1']) {
    case 'SO_perfilusuario':
        # code...
        break;
    
    case 'SO_usuarios':
    ?>
        <li class="side-bar-item"><a href="/admin-usuarios?tipo=A"><i class="fas fa-filter"></i> Usuarios Activos</a></li>
        <li class="side-group-item p-2"><i class="fas fa-filter"></i><a href="/admin-usuarios?tipo=I&amp;orde=asc">&nbsp;Inactivos Viejos</a> | <a href="/admin-usuarios?tipo=I&amp;orde=desc">Nuevos</a></li>
        <li class="side-bar-item"><a href="/admin-usuarios?tipo=R"><i class="fas fa-filter"></i>Usuarios Retirados</a></li>
        <li class="side-bar-item"><a href="/admin-usuarios?tipo=PAGA"><i class="fas fa-filter"></i>Usuarios que Pagan</a></li>
        <li class="side-group-item p-2"><i class="fas fa-filter"></i> Seg.: <a href="/admin-usuarios?ob=SEG_-3">-3</a> | <a href="/admin-usuarios?ob=SEG_-2">-2</a> | <a href="/admin-usuarios?ob=SEG_-1">-1</a> | <a href="/admin-usuarios?ob=SEG_0">Hoy</a> | <a href="/admin-usuarios?ob=SEG_1">1</a> | <a href="/admin-usuarios?ob=SEG_2">2</a> | <a href="/admin-usuarios?ob=SEG_3">3</a></li>
        <li class="side-group-item p-2"><i class="fas fa-filter"></i> Com.: <a href="/admin-usuarios?ob=COM_-3">-3</a> | <a href="/admin-usuarios?ob=COM_-2">-2</a> | <a href="/admin-usuarios?ob=COM_-1">-1</a> | <a href="/admin-usuarios?ob=COM_0">Hoy</a> | <a href="/admin-usuarios?ob=COM_1">1</a> | <a href="/admin-usuarios?ob=COM_2">2</a> | <a href="/admin-usuarios?ob=COM_3">3</a></li>
        <li class="side-group-item p-2"><i class="fas fa-filter"></i> Plan.: <a href="/admin-usuarios?ob=PLA_-3">-3</a> | <a href="/admin-usuarios?ob=PLA_-2">-2</a> | <a href="/admin-usuarios?ob=PLA_-1">-1</a> | <a href="/admin-usuarios?ob=PLA_0">Todos</a> | <a href="/admin-usuarios?ob=PLA_1">1</a> | <a href="/admin-usuarios?ob=PLA_2">2</a> | <a href="/admin-usuarios?ob=PLA_3">3</a></li>
        <li class="side-group-item p-2"><i class="fas fa-filter"></i> Tiendas.: <a href="/admin-usuarios?ob=UPA_T">Activas</a> | <a href="/admin-usuarios?ob=UPI_T">Inactivas</a></li>
        <li class="side-group-item p-2"><i class="fas fa-filter"></i> Dealers.: <a href="/admin-usuarios?ob=UPA_D">Activos</a> | <a href="/admin-usuarios?ob=UPI_D">Inactivos</a></li>
        <li class="side-group-item p-2"><i class="fas fa-filter"></i> Inmobiliarias.: <a href="/admin-usuarios?ob=UPA_I">Activas</a> | <a href="/admin-usuarios?ob=UPI_I">Inactivas</a></li>
        <li class="side-bar-item"><a href="/admin-usuarios?ob=X"><i class="fas fa-filter"></i>Promotores Expreso</a></li>
        <li class="side-bar-item"><a href="/admin-usuarios?ob=L"><i class="fas fa-filter"></i>Planes LP+</a></li>
        <li class="side-group-item p-2"><i class="fas fa-filter"></i>&nbsp;Login.: <a href="/admin-usuarios?ob=LGH">Hoy</a> | <a href="/admin-usuarios?ob=LGA">Ayer</a> | <a href="/admin-usuarios?ob=LGT">Antes Ayer</a></li>
        <li class="side-group-item p-2"><i class="fas fa-filter"></i>&nbsp;Penalizados.: <a href="/admin-usuarios?ob=R">Rep</a> | <a href="/admin-usuarios?ob=PP">Pago</a> | <a href="/admin-usuarios?ob=LE">Exc</a></li>
        <li class="side-group-item p-2"><i class="fas fa-filter"></i>&nbsp;Preavisos.: <a href="/admin-usuarios?ob=PAR">Rep</a> | <a href="/admin-usuarios?ob=PAPP">Pago</a> | <a href="/admin-usuarios?ob=PALE">Exc</a></li>
    <?php
        break;
    case 'SO_publicaciones':
        ?>
        <li class="side-bar-item"><a href="/admin-vip-portada"><i class="fas fa-filter"></i>Vip Portada</a></li>
        <li class="side-bar-item"><a href="/admin-vip-categoria"><i class="fas fa-filter"></i>Vip Categor&iacute;a</a></li>
        <li class="side-bar-item"><a href="/admin-con-video"><i class="fas fa-filter"></i>Con Videos</a></li>
        <li class="side-bar-item"><a href="/admin-resaltados"><i class="fas fa-filter"></i>Resaltados</a></li>
        <li class="side-bar-item"><a href="/admin-vendidas"><i class="fas fa-filter"></i>Marcadas Vendidas</a></li>
        <li class="side-bar-item"><a href="/admin-anclados"><i class="fas fa-filter"></i>Anclados</a></li>
        <li class="side-bar-item"><a href="/admin-en-favoritas" data-toggle="tooltip" data-placement="right" title="Listado de publicaciones que uno o varios usuarios han puesto en su lista de favoritas.  Tienes la opcion de contactarlo de forma directa y responder sus preguntas" ><i class="fas fa-filter"></i>Estan en Favoritas</a></li>
        <li class="side-bar-item"><a href="/admin-mas-visitados"><i class="fas fa-filter"></i>M&aacute;s visitados</a></li>
    <?php    
    break;
    case 'SO_procesa':
    ?>
        <li class="side-bar-item"><a href="/admin-procesa?tipo=P"><i class="fas fa-filter"></i>Solicitudes Pendientes</a></li>
        <li class="side-bar-item"><a href="/admin-procesa?tipo=A"><i class="fas fa-filter"></i>Solicitudes Aprobadas</a></li>
        <li class="side-bar-item"><a href="/admin-procesa?tipo=C"><i class="fas fa-filter"></i>Solicitudes Canceladas</a></li>
        <?php
        break;
    case 'SO_recurrentes':
        # code...
        break;
    case 'SO_marcas':
        # code...
        break;
    case 'SO_faq':
        # code...
        break;
    case 'SO_marcas':
        # code...
        break;
    case 'SO_aofertas':
        # code...
        break;
    case 'SO_klk':
        # code...
        break;
    case 'SO_excedidos':
        # code...
        break;
    case 'SO_cintillos':
        # code...
        break;
    
    default:
        # code...
        break;
}


?>




