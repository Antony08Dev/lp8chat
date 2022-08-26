-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 25, 2022 at 01:58 PM
-- Server version: 5.7.18-log
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: lpdata
--

-- --------------------------------------------------------

--
-- Table structure for table articles
--

DROP TABLE IF EXISTS articles;
CREATE TABLE articles (
  id bigint(20) NOT NULL,
  product varchar(255) NOT NULL DEFAULT '',
  fecha date NOT NULL,
  respuestas smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table a_cruzaremails
--

DROP TABLE IF EXISTS a_cruzaremails;
CREATE TABLE a_cruzaremails (
  ID mediumint(9) NOT NULL DEFAULT '0',
  EMAIL varchar(100) NOT NULL DEFAULT '',
  ESTATUS enum('A','I','R','M') NOT NULL DEFAULT 'I',
  USUARIO varchar(25) NOT NULL DEFAULT '',
  CREADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ACTIVADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  FECHA varchar(15) NOT NULL DEFAULT '' COMMENT 'FECHA CONVERTIDA'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='TABLA QUE CONTIENE DATOS DE USUARIOS TANTO TIENDAS COMO OTRO';

-- --------------------------------------------------------

--
-- Table structure for table a_emailaprocesar
--

DROP TABLE IF EXISTS a_emailaprocesar;
CREATE TABLE a_emailaprocesar (
  EMAIL varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='EMAILS A PROCESAR';

-- --------------------------------------------------------

--
-- Table structure for table a_mailerdeamon
--

DROP TABLE IF EXISTS a_mailerdeamon;
CREATE TABLE a_mailerdeamon (
  email varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table a_usuariosemail
--

DROP TABLE IF EXISTS a_usuariosemail;
CREATE TABLE a_usuariosemail (
  EMAIL varchar(100) NOT NULL DEFAULT '',
  ESTATUS enum('A','I','R') NOT NULL DEFAULT 'I'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='TABLA QUE CONTIENE DATOS DE USUARIOS TANTO TIENDAS COMO OTRO';

-- --------------------------------------------------------

--
-- Table structure for table click_tracker
--

DROP TABLE IF EXISTS click_tracker;
CREATE TABLE click_tracker (
  urls_hash smallint(5) UNSIGNED NOT NULL,
  fecha timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  urls_key varchar(255) NOT NULL,
  urls_val text NOT NULL,
  urls_cnt0 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt1 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt2 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt3 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt4 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt5 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt6 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt7 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt8 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt9 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt10 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt11 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt12 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt13 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt14 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt15 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt16 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt17 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt18 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt19 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt20 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt21 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt22 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt23 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt24 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt25 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt26 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt27 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt28 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt29 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt30 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt31 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt32 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt33 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt34 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt35 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt36 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt37 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt38 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt39 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt40 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt41 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt42 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt43 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt44 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt45 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt46 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt47 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt48 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt49 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt50 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt51 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt52 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt53 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt54 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt55 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt56 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt57 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt58 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt59 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt60 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt61 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt62 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt63 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt64 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt65 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt66 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt67 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt68 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt69 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt70 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt71 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt72 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt73 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt74 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt75 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt76 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt77 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt78 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt79 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt80 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt81 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt82 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt83 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt84 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt85 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt86 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt87 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt88 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt89 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt90 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt91 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt92 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt93 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt94 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt95 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt96 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt97 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt98 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt99 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt100 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt101 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt102 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt103 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt104 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt105 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt106 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt107 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt108 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt109 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt110 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt111 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt112 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt113 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt114 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt115 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt116 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt117 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt118 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt119 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt120 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt121 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt122 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt123 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt124 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt125 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt126 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt127 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt128 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt129 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt130 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt131 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt132 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt133 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt134 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt135 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt136 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt137 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt138 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt139 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt140 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt141 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt142 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt143 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt144 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt145 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt146 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt147 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt148 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt149 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt150 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt151 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt152 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt153 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt154 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt155 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt156 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt157 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt158 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt159 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt160 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt161 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt162 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt163 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt164 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt165 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt166 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt167 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt168 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt169 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt170 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt171 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt172 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt173 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt174 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt175 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt176 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt177 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt178 smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  urls_cnt179 smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table descripcion_estaciones
--

DROP TABLE IF EXISTS descripcion_estaciones;
CREATE TABLE descripcion_estaciones (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  DESCRIPCION text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CONTIENE LA DESCRIPCION DE LOS ARTICULOS';

-- --------------------------------------------------------

--
-- Table structure for table email_usuarios
--

DROP TABLE IF EXISTS email_usuarios;
CREATE TABLE email_usuarios (
  EMAIL varchar(100) NOT NULL DEFAULT '',
  USUARIO varchar(25) NOT NULL DEFAULT '',
  PROVINCIA smallint(6) NOT NULL DEFAULT '0',
  NACIMIENTO date NOT NULL DEFAULT '0000-00-00',
  CREADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ACTIVADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  GRUPO tinyint(4) NOT NULL COMMENT 'GRUPO DE ENVIO'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table email_usuariosnueva
--

DROP TABLE IF EXISTS email_usuariosnueva;
CREATE TABLE email_usuariosnueva (
  ID mediumint(9) NOT NULL,
  EMAIL varchar(100) NOT NULL DEFAULT '',
  USUARIO varchar(25) NOT NULL DEFAULT '',
  PROVINCIA smallint(6) NOT NULL DEFAULT '0',
  NACIMIENTO date NOT NULL DEFAULT '0000-00-00',
  CREADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ACTIVADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  GRUPO tinyint(4) NOT NULL COMMENT 'GRUPO DE ENVIO'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table ip2location_db1
--

DROP TABLE IF EXISTS ip2location_db1;
CREATE TABLE ip2location_db1 (
  ip_from int(10) UNSIGNED DEFAULT NULL,
  ip_to int(10) UNSIGNED DEFAULT NULL,
  country_code char(2) COLLATE utf8_bin DEFAULT NULL,
  country_name varchar(64) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table lp2007_log_buscar
--

DROP TABLE IF EXISTS lp2007_log_buscar;
CREATE TABLE lp2007_log_buscar (
  ID int(11) NOT NULL DEFAULT '0',
  FECHA timestamp NULL DEFAULT NULL,
  STR text NOT NULL,
  TIPOB char(2) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA STRING DE BUSQUEDA ';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_adicionales
--

DROP TABLE IF EXISTS lp2008_adicionales;
CREATE TABLE lp2008_adicionales (
  ID mediumint(9) NOT NULL,
  TIPO enum('DV','IN') NOT NULL DEFAULT 'DV',
  ADICIONAL varchar(40) NOT NULL,
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LOS ADICIONALES DE ARTICULOS, VEH E INM';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_adicxarti
--

DROP TABLE IF EXISTS lp2008_adicxarti;
CREATE TABLE lp2008_adicxarti (
  ARTICULO_ID int(11) NOT NULL,
  ADICIONAL_ID mediumint(9) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA ENLACE ENTRE LOS ADICIONALES Y ARTICULOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_adsense
--

DROP TABLE IF EXISTS lp2008_adsense;
CREATE TABLE lp2008_adsense (
  FECHA varchar(20) NOT NULL,
  FECHAPAGO date NOT NULL,
  DESCRIPCION varchar(100) NOT NULL,
  VALOR decimal(9,2) NOT NULL,
  BALANCE decimal(9,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='TEMPORAL HISTORICO ADSENSE';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_anclarpub
--

DROP TABLE IF EXISTS lp2008_anclarpub;
CREATE TABLE lp2008_anclarpub (
  ARTICULO_ID mediumint(6) NOT NULL,
  CANTIDAD smallint(4) DEFAULT '0' COMMENT 'cantidad de clicks utilizados',
  LIMITE mediumint(9) NOT NULL DEFAULT '1' COMMENT 'limite de clicks limitados'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Publicaciones ancladas en su categoria';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_areaofertas
--

DROP TABLE IF EXISTS lp2008_areaofertas;
CREATE TABLE lp2008_areaofertas (
  ID smallint(6) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL,
  HASTA datetime NOT NULL,
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS USUARIOS EN AREA DE OFERTAS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_artcoords
--

DROP TABLE IF EXISTS lp2008_artcoords;
CREATE TABLE lp2008_artcoords (
  ARTICULO_ID mediumint(9) NOT NULL,
  LAT varchar(25) NOT NULL,
  LNG varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LAS COORDENADAS DE UN ARTICULO U OFERTA PARA MAPA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_artespecial
--

DROP TABLE IF EXISTS lp2008_artespecial;
CREATE TABLE lp2008_artespecial (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  FORMA enum('V','P') NOT NULL DEFAULT 'V' COMMENT 'VALOR O PORCENTAJE',
  VALOR decimal(15,2) NOT NULL DEFAULT '0.00',
  HASTA date NOT NULL DEFAULT '0000-00-00',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  COMENTARIO text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ESPECIALES DE ARTICULOS DE TIENDAS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_articulos
--

DROP TABLE IF EXISTS lp2008_articulos;
CREATE TABLE lp2008_articulos (
  ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  EXPIRA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PUBLICADO enum('M','P') NOT NULL DEFAULT 'P' COMMENT 'M - MOVIL, P - PC',
  TIPO enum('C','V','S','B','A','T','M','E') NOT NULL DEFAULT 'V',
  USUPLAN enum('P','O','L','T','D','I') NOT NULL DEFAULT 'P' COMMENT 'TIPO DE PLAN DEL USUARIO',
  PLAN enum('P','O','L','T','D','I') NOT NULL DEFAULT 'P',
  USUPLANNO enum('PB','OP1','OP2','LPE','LP','LP+','TIE','DEA','INM') NOT NULL DEFAULT 'PB',
  PROVINCIA smallint(6) NOT NULL COMMENT 'LISTA POR PROVINCIAS',
  MUNICIPIO smallint(6) NOT NULL,
  LISTA enum('R','L') NOT NULL DEFAULT 'L' COMMENT 'L - NUEVOS, R - RENOVADOS',
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '1',
  SUBCATEGORIA_ID smallint(6) NOT NULL DEFAULT '1',
  ESTATUS enum('A','R','I','F','T','P','RO','RU','V','PA','RT') NOT NULL DEFAULT 'A' COMMENT 'RO: retira operador, RU: retira usuario, V Marcado vendido, PA-Pendiente aprobacion, RT - retirado temporal',
  CANTIDAD int(11) NOT NULL DEFAULT '1',
  PRECIO decimal(12,2) NOT NULL DEFAULT '0.00',
  PRECIO2 decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'PRECIO 2 O DESCONTADO',
  FORMAPRECIO enum('P','V') NOT NULL DEFAULT 'P' COMMENT 'P -PORCIENTO, V - VALOR',
  PRECIOHASTA datetime NOT NULL COMMENT 'HASTA CUANDO SE MANTENDRA DESCUENTO',
  PRECIOINI enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'ESTABLECE PRECIO COMO INICIAL',
  ENVIO decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT 'MONTO DE ENVIO',
  BONO enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'MARCA SI EL ARTICULO TIENE BONO O NO',
  BN_FORMA enum('P','V') NOT NULL DEFAULT 'P',
  BN_VALOR decimal(15,2) NOT NULL DEFAULT '0.00',
  BN_HASTA date NOT NULL DEFAULT '0000-00-00',
  FORMAPAGO enum('P','G','T','N') NOT NULL DEFAULT 'N',
  MONEDA enum('R','U','E') NOT NULL DEFAULT 'R',
  ARTICULO varchar(70) NOT NULL DEFAULT '',
  REFERENCIA varchar(50) DEFAULT NULL,
  URLVIDEO varchar(120) NOT NULL DEFAULT '',
  OPCIONAL enum('N','R','FL') NOT NULL DEFAULT 'N',
  RESALTADO enum('N','R','FL') NOT NULL DEFAULT 'N' COMMENT 'RESALTA PUBLICACION',
  OPCHASTA datetime DEFAULT '0000-00-00 00:00:00',
  RESHASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FECHA CADUCA RESALTADO',
  APTABLOQUE enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'APTA PARA BLOQUE VIP, AO, TIV, DEA, INM',
  PUBLICIDAD enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'USADO PARA PUBLICIDAD ADWORDS',
  LINKAPLAN enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'ENVIA PUBLICACION A PLAN O NO',
  FUERAPLAN enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'PUBLICACIONES FUERA DEL PLAN',
  CONDICION enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  FOTOS varchar(150) DEFAULT NULL,
  FOTOEXTERNA enum('S','N') NOT NULL DEFAULT 'N',
  URLFOTOEXT varchar(150) DEFAULT NULL,
  ROTAFOTO enum('N','S') NOT NULL DEFAULT 'N',
  VISITAS smallint(6) NOT NULL DEFAULT '0',
  VISITADO timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  ACUMULADAS smallint(6) NOT NULL DEFAULT '0' COMMENT 'VISITAS ACUMULADAS',
  ELIMINADO datetime DEFAULT NULL COMMENT 'FECHA ELIMINADO POR EL USUARIO',
  MOTIVOELI tinyint(4) DEFAULT NULL COMMENT 'MOTIVO ELIMIANDO POR EL USUARIO',
  IPADDRESS varchar(25) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ALMACENA LOS ARTICULOS DE USUARIOS REGISTRADOS';


-- --------------------------------------------------------

--
-- Table structure for table lp2008_articulosantesbono
--

DROP TABLE IF EXISTS lp2008_articulosantesbono;
CREATE TABLE lp2008_articulosantesbono (
  ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  EXPIRA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  TIPO enum('C','V','S','B','A','T','M','E') NOT NULL DEFAULT 'V',
  LISTA enum('R','L') NOT NULL DEFAULT 'L',
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '1',
  SUBCATEGORIA_ID smallint(6) NOT NULL DEFAULT '1',
  ESTATUS enum('A','R','I','F','T') NOT NULL DEFAULT 'A',
  CANTIDAD int(11) NOT NULL DEFAULT '1',
  PRECIO decimal(12,2) NOT NULL DEFAULT '0.00',
  BONO enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'MARCA SI EL ARTICULO TIENE BONO O NO',
  FORMAPAGO enum('P','G','T','N') NOT NULL DEFAULT 'N',
  MONEDA enum('R','U','E') NOT NULL DEFAULT 'R',
  ARTICULO varchar(70) NOT NULL DEFAULT '',
  URLVIDEO varchar(120) NOT NULL DEFAULT '',
  OPCIONAL enum('N','R','FL') NOT NULL DEFAULT 'N',
  OPCHASTA datetime DEFAULT '0000-00-00 00:00:00',
  FUERAPLAN enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'CONTROLA PUBLICACION EN TIENDA DEALER O INMOBILIARIA',
  CONDICION enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  FOTOS varchar(110) DEFAULT NULL,
  ROTAFOTO enum('N','S') NOT NULL DEFAULT 'N',
  VISITAS smallint(6) NOT NULL DEFAULT '0',
  VISITADO timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  IPADDRESS varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ALMACENA LOS ARTICULOS DE USUARIOS REGISTRADOS';


-- --------------------------------------------------------

--
-- Table structure for table lp2008_articulosold
--

DROP TABLE IF EXISTS lp2008_articulosold;
CREATE TABLE lp2008_articulosold (
  ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  EXPIRA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PUBLICADO enum('M','P') NOT NULL DEFAULT 'P' COMMENT 'M - MOVIL, P - PC',
  TIPO enum('C','V','S','B','A','T','M','E') NOT NULL DEFAULT 'V',
  PROVINCIA smallint(6) NOT NULL COMMENT 'LISTA POR PROVINCIAS',
  LISTA enum('R','L') NOT NULL DEFAULT 'L',
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '1',
  SUBCATEGORIA_ID smallint(6) NOT NULL DEFAULT '1',
  ESTATUS enum('A','R','I','F','T') NOT NULL DEFAULT 'A',
  CANTIDAD int(11) NOT NULL DEFAULT '1',
  PRECIO decimal(12,2) NOT NULL DEFAULT '0.00',
  BONO enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'MARCA SI EL ARTICULO TIENE BONO O NO',
  BN_FORMA enum('P','V') NOT NULL DEFAULT 'P',
  BN_VALOR decimal(15,2) NOT NULL DEFAULT '0.00',
  BN_HASTA date NOT NULL DEFAULT '0000-00-00',
  FORMAPAGO enum('P','G','T','N') NOT NULL DEFAULT 'N',
  MONEDA enum('R','U','E') NOT NULL DEFAULT 'R',
  ARTICULO varchar(70) NOT NULL DEFAULT '',
  URLVIDEO varchar(120) NOT NULL DEFAULT '',
  OPCIONAL enum('N','R','FL') NOT NULL DEFAULT 'N',
  OPCHASTA datetime DEFAULT '0000-00-00 00:00:00',
  FUERAPLAN enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'PUBLICACIONES FUERA DEL PLAN',
  CONDICION enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  FOTOS varchar(110) DEFAULT NULL,
  ROTAFOTO enum('N','S') NOT NULL DEFAULT 'N',
  VISITAS smallint(6) NOT NULL DEFAULT '0',
  VISITADO timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  IPADDRESS varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ALMACENA LOS ARTICULOS DE USUARIOS REGISTRADOS';

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Table structure for table lp2008_articulosr
--

DROP TABLE IF EXISTS lp2008_articulosr;
CREATE TABLE lp2008_articulosr (
  ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  EXPIRA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PUBLICADO enum('M','P') NOT NULL DEFAULT 'P' COMMENT 'M - MOVIL, P - PC',
  TIPO enum('C','V','S','B','A','T','M','E') NOT NULL DEFAULT 'V',
  PROVINCIA smallint(6) NOT NULL COMMENT 'LISTA POR PROVINCIAS',
  LISTA enum('R','L') NOT NULL DEFAULT 'L',
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '1',
  SUBCATEGORIA_ID smallint(6) NOT NULL DEFAULT '1',
  ESTATUS enum('A','R','I','F','T','RO','RU') NOT NULL DEFAULT 'A',
  CANTIDAD int(11) NOT NULL DEFAULT '1',
  PRECIO decimal(12,2) NOT NULL DEFAULT '0.00',
  BONO enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'MARCA SI EL ARTICULO TIENE BONO O NO',
  BN_FORMA enum('P','V') NOT NULL DEFAULT 'P',
  BN_VALOR decimal(15,2) NOT NULL DEFAULT '0.00',
  BN_HASTA date NOT NULL DEFAULT '0000-00-00',
  FORMAPAGO enum('P','G','T','N') NOT NULL DEFAULT 'N',
  MONEDA enum('R','U','E') NOT NULL DEFAULT 'R',
  ARTICULO varchar(70) NOT NULL DEFAULT '',
  URLVIDEO varchar(120) NOT NULL DEFAULT '',
  OPCIONAL enum('N','R','FL') NOT NULL DEFAULT 'N',
  OPCHASTA datetime DEFAULT '0000-00-00 00:00:00',
  FUERAPLAN enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'PUBLICACIONES FUERA DEL PLAN',
  CONDICION enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  FOTOS varchar(130) DEFAULT NULL,
  ROTAFOTO enum('N','S') NOT NULL DEFAULT 'N',
  VISITAS smallint(6) NOT NULL DEFAULT '0',
  VISITADO timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  IPADDRESS varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ALMACENA LOS ARTICULOS DE USUARIOS REGISTRADOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_articulos_old
--

DROP TABLE IF EXISTS lp2008_articulos_old;
CREATE TABLE lp2008_articulos_old (
  ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  EXPIRA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PUBLICADO enum('M','P') NOT NULL DEFAULT 'P' COMMENT 'M - MOVIL, P - PC',
  TIPO enum('C','V','S','B','A','T','M','E') NOT NULL DEFAULT 'V',
  PROVINCIA smallint(6) NOT NULL COMMENT 'LISTA POR PROVINCIAS',
  LISTA enum('R','L') NOT NULL DEFAULT 'L' COMMENT 'L - NUEVOS, R - RENOVADOS',
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '1',
  SUBCATEGORIA_ID smallint(6) NOT NULL DEFAULT '1',
  ESTATUS enum('A','R','I','F','T','RO','RU','V') NOT NULL DEFAULT 'A' COMMENT 'RO: retira operador, RU: retira usuario, V Marcado vendido',
  CANTIDAD int(11) NOT NULL DEFAULT '1',
  PRECIO decimal(12,2) NOT NULL DEFAULT '0.00',
  BONO enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'MARCA SI EL ARTICULO TIENE BONO O NO',
  BN_FORMA enum('P','V') NOT NULL DEFAULT 'P',
  BN_VALOR decimal(15,2) NOT NULL DEFAULT '0.00',
  BN_HASTA date NOT NULL DEFAULT '0000-00-00',
  FORMAPAGO enum('P','G','T','N') NOT NULL DEFAULT 'N',
  MONEDA enum('R','U','E') NOT NULL DEFAULT 'R',
  ARTICULO varchar(70) NOT NULL DEFAULT '',
  URLVIDEO varchar(120) NOT NULL DEFAULT '',
  OPCIONAL enum('N','R','FL') NOT NULL DEFAULT 'N',
  OPCHASTA datetime DEFAULT '0000-00-00 00:00:00',
  LINKAPLAN enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'ENVIA PUBLICACION A PLAN O NO',
  FUERAPLAN enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'PUBLICACIONES FUERA DEL PLAN',
  CONDICION enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  FOTOS varchar(130) DEFAULT NULL,
  ROTAFOTO enum('N','S') NOT NULL DEFAULT 'N',
  VISITAS smallint(6) NOT NULL DEFAULT '0',
  VISITADO timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  IPADDRESS varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ALMACENA LOS ARTICULOS DE USUARIOS REGISTRADOS';

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table lp2008_arttemp
--

DROP TABLE IF EXISTS lp2008_arttemp;
CREATE TABLE lp2008_arttemp (
  ID int(11) NOT NULL,
  ARTICULO varchar(70) CHARACTER SET utf8 NOT NULL,
  PRECIO decimal(12,2) NOT NULL,
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '1',
  SUBCATEGORIA_ID smallint(6) NOT NULL DEFAULT '1',
  COMPLEMENTO varchar(15) NOT NULL,
  USUARIO_ID varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=ascii COMMENT='ALMACENA PUBLICACIONES TEMPORALES IMPORTADAS DESDE EXCEL';

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table lp2008_autocompleta
--

DROP TABLE IF EXISTS lp2008_autocompleta;
CREATE TABLE lp2008_autocompleta (
  ID int(11) NOT NULL COMMENT 'ID DEL REGISTRO',
  STR varchar(70) NOT NULL COMMENT 'STR O TITULO',
  CANTIDAD smallint(6) NOT NULL DEFAULT '0' COMMENT 'CANTIDAD  DE OCURRENCIAS'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE VALORES PARA AUTOCOMPLETE';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_braices
--

DROP TABLE IF EXISTS lp2008_braices;
CREATE TABLE lp2008_braices (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  HABITACIONES varchar(4) NOT NULL DEFAULT '0',
  BANOS varchar(10) NOT NULL DEFAULT '0',
  MCONSTRUIDOS varchar(10) NOT NULL DEFAULT '0',
  MTERRENO varchar(10) NOT NULL DEFAULT '0',
  PARQUEOS varchar(10) NOT NULL DEFAULT '0',
  EDIFICABLE varchar(5) DEFAULT NULL,
  CONSTRUCCION varchar(10) NOT NULL DEFAULT 'N/A',
  ANIO varchar(10) NOT NULL DEFAULT 'N/A',
  USOACTUAL varchar(10) NOT NULL DEFAULT 'N/A',
  PROVINCIA smallint(6) NOT NULL DEFAULT '0',
  SECTOR smallint(6) NOT NULL DEFAULT '0',
  LAT varchar(25) DEFAULT NULL COMMENT 'LATITUD COORD',
  LNG varchar(25) DEFAULT NULL COMMENT 'LONGITUD COORD',
  MAPA enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'PERMITE MOSTRAR MAPA O NO',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table lp2008_busquedas
--

DROP TABLE IF EXISTS lp2008_busquedas;
CREATE TABLE lp2008_busquedas (
  ID int(11) NOT NULL,
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  STR varchar(60) NOT NULL DEFAULT '',
  CANTIDAD mediumint(9) NOT NULL DEFAULT '0' COMMENT 'cantidad registros encontrados',
  USUARIO varchar(70) NOT NULL DEFAULT '' COMMENT 'USUARIO QUE HACE BUSQUEDA'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ALMACENA STRING DE BUSQUEDA ';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_buzon
--

DROP TABLE IF EXISTS lp2008_buzon;
CREATE TABLE lp2008_buzon (
  ID mediumint(9) NOT NULL,
  PARA mediumint(9) NOT NULL DEFAULT '0',
  DE mediumint(9) NOT NULL DEFAULT '0',
  DEEMAIL varchar(100) NOT NULL COMMENT 'EMAIL EN QUE ENVIA ',
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  ASUNTO varchar(70) NOT NULL DEFAULT '',
  FECHA timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ESTATUS enum('N','L','C','R','E') NOT NULL DEFAULT 'N',
  ADDRESS varchar(25) NOT NULL COMMENT 'IP ADDRESS',
  SESSION varchar(40) NOT NULL COMMENT 'SESSION ID USUARIO QUE ENVIA',
  MENSAJE text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='TABLA PARA ALMACENAR MENSAJES ENVIADOS A USUARIOS DE OTROS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_cambioregistro
--

DROP TABLE IF EXISTS lp2008_cambioregistro;
CREATE TABLE lp2008_cambioregistro (
  ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  TABLA varchar(20) NOT NULL DEFAULT '',
  CAMPO tinytext NOT NULL,
  VALOR text NOT NULL,
  FECHA timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  IPADDRESS varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='REGISTRA LOS CAMBIOS HECHOS A CAMPOS EN USUARIOS Y ARTICULOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_categorias
--

DROP TABLE IF EXISTS lp2008_categorias;
CREATE TABLE lp2008_categorias (
  ID smallint(6) NOT NULL DEFAULT '0',
  CATEGORIA varchar(150) NOT NULL DEFAULT '',
  PUBLICADOS mediumint(9) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='TABLA DE CATEGORIAS DE ARITUCLOS';

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Table structure for table lp2008_celulares
--

DROP TABLE IF EXISTS lp2008_celulares;
CREATE TABLE lp2008_celulares (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  MARCA_ID smallint(6) NOT NULL COMMENT 'NUEVO ID DE MARCA',
  MODELO_ID smallint(6) NOT NULL COMMENT 'NUEVO MODELO ID',
  MARCACE varchar(3) NOT NULL DEFAULT '0',
  MODELO varchar(5) NOT NULL DEFAULT '0',
  TECNOLOGIA enum('GSM','CDMA') NOT NULL DEFAULT 'GSM',
  IMEI varchar(20) DEFAULT NULL COMMENT 'CODIGO DEL MOVIL PUBLICADO',
  USARFOTOS enum('S','N') NOT NULL DEFAULT 'N',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA DATOS CELULARES DE ARTICULOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_cemarca
--

DROP TABLE IF EXISTS lp2008_cemarca;
CREATE TABLE lp2008_cemarca (
  ID tinyint(4) NOT NULL,
  MARCA varchar(40) NOT NULL DEFAULT '',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LA MARCA DE LOS CELULARES';

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Table structure for table lp2008_cemodelo
--

DROP TABLE IF EXISTS lp2008_cemodelo;
CREATE TABLE lp2008_cemodelo (
  ID smallint(5) NOT NULL,
  MARCA_ID tinyint(5) NOT NULL DEFAULT '0',
  MODELO varchar(50) NOT NULL DEFAULT '',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='MODELOS DE CELULARES';

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table lp2008_centrosdist
--

DROP TABLE IF EXISTS lp2008_centrosdist;
CREATE TABLE lp2008_centrosdist (
  ID int(11) NOT NULL,
  NOMBRE varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  TELEFONO varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  EMAIL varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  DIRECCION varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  PROVINCIA smallint(6) NOT NULL,
  SECTOR smallint(6) NOT NULL,
  MAPA text COLLATE utf8_unicode_ci NOT NULL,
  ESTATUS enum('A','I') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  COMENTARIO text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ALMACENA CENTROS DE DISTRIBUCION';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_clicktrack
--

DROP TABLE IF EXISTS lp2008_clicktrack;
CREATE TABLE lp2008_clicktrack (
  ID bigint(20) NOT NULL,
  TIPO enum('TV','DV','IN') NOT NULL DEFAULT 'TV' COMMENT 'TIPO DE PLAN HACER TRACK',
  FECHA datetime NOT NULL,
  VALOR varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LOS CLICKS RECIBIDOS EN ELEMENTOS ESPECIFICOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_complementos
--

DROP TABLE IF EXISTS lp2008_complementos;
CREATE TABLE lp2008_complementos (
  ARTICULO_ID int(11) NOT NULL,
  TIPOCOMP enum('CE','VE','BR') NOT NULL,
  MARCA varchar(4) NOT NULL DEFAULT '0',
  MODELO varchar(4) DEFAULT '0',
  ANIO varchar(4) NOT NULL DEFAULT 'N/A',
  COMBUSTIBLE varchar(5) NOT NULL DEFAULT 'N/A',
  GOMAS varchar(20) DEFAULT NULL COMMENT 'DIAMETRO DE LAS GOMAS 999/99/99',
  AROS varchar(20) DEFAULT NULL COMMENT 'DIAMETRO DE LAS GOMAS 999/99/99',
  PROVINCIA varchar(4) DEFAULT NULL,
  SECTOR varchar(4) DEFAULT NULL,
  HABITACIONES varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  BANOS varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PARQUEOS varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  MCONSTRUIDOS varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  MTERRENO varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  LAT varchar(25) DEFAULT NULL COMMENT 'LATITUD COORD',
  LNG varchar(25) DEFAULT NULL COMMENT 'LONGITUD COORD',
  MAPA enum('S','N') DEFAULT 'N' COMMENT 'PERMITE MOSTRAR MAPA O NO',
  ESTATUS enum('A','R','I','F','T','RO','RU','V','PA','RT') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CONTIENE INFO ADICIONAL DE CADA PUBLICACION, BR, CE, VEH';

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table lp2008_comusu
--

DROP TABLE IF EXISTS lp2008_comusu;
CREATE TABLE lp2008_comusu (
  ID mediumint(9) NOT NULL,
  OPERADOR_ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  COMENTARIO text NOT NULL,
  PRIORIDAD enum('A','B') NOT NULL DEFAULT 'B',
  SEGUIMIENTO tinyint(4) NOT NULL DEFAULT '0' COMMENT 'SEGUIMIENTO EN DIAS',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='COMENTARIOS ALMACENADOS PARA USUARIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_copiaopcionales
--

DROP TABLE IF EXISTS lp2008_copiaopcionales;
CREATE TABLE lp2008_copiaopcionales (
  ID mediumint(9) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '1',
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  TIPO enum('V','VC') NOT NULL DEFAULT 'V',
  ESTATUS enum('A','I','E') NOT NULL DEFAULT 'A',
  DIAS smallint(9) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ANUNCIOS QUE PAGAN PARA ESTAR EN EL SCROOL DE LA PAGINA PRIN';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_cupones
--

DROP TABLE IF EXISTS lp2008_cupones;
CREATE TABLE lp2008_cupones (
  CUPON varchar(10) NOT NULL,
  USUARIO_ID mediumint(9) DEFAULT NULL COMMENT 'USUARIO QUE RECIBIO EL CUPON',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FECHA EN LA QUE SE USO EL CUPON'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS CUPONES PARA REGISTROS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_descripcion
--

DROP TABLE IF EXISTS lp2008_descripcion;
CREATE TABLE lp2008_descripcion (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  DESCRIPCION text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CONTIENE LA DESCRIPCION DE LOS ARTICULOS';

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Table structure for table lp2008_desctemp
--

DROP TABLE IF EXISTS lp2008_desctemp;
CREATE TABLE lp2008_desctemp (
  ARTICULO_ID varchar(50) NOT NULL DEFAULT '',
  DESCRIPCION text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='TABLA TEMPORAL PARA LAS DESCRIPCIONES POR LOTE';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_descuentos
--

DROP TABLE IF EXISTS lp2008_descuentos;
CREATE TABLE lp2008_descuentos (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  FORMA enum('P','V') NOT NULL DEFAULT 'P',
  VALOR decimal(15,2) NOT NULL DEFAULT '0.00',
  HASTA date NOT NULL DEFAULT '0000-00-00',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  BONO enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'SI APLICA BONO',
  NOTA enum('1','2','3') NOT NULL DEFAULT '1' COMMENT 'NOTAS PREDETERMINADAS'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='DESCUENTOS APLICADOS A LOS ARTICULOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_ealternos
--

DROP TABLE IF EXISTS lp2008_ealternos;
CREATE TABLE lp2008_ealternos (
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  EMAILS text NOT NULL COMMENT 'EMAILS ALTERNO DE ESTE USUARIO'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LOS EMAILS ALTERNOS DEL USUARIO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_eliart
--

DROP TABLE IF EXISTS lp2008_eliart;
CREATE TABLE lp2008_eliart (
  ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  CANTIDAD tinyint(4) NOT NULL DEFAULT '0',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='REGISTRA LA CANTIDAD DE ARTICULOS ELIMINADOS POR USUARIO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_encuestas
--

DROP TABLE IF EXISTS lp2008_encuestas;
CREATE TABLE lp2008_encuestas (
  ID bigint(20) NOT NULL,
  PREGUNTA varchar(255) NOT NULL DEFAULT '',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  FECHA datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  HORAS int(11) DEFAULT NULL,
  RESPUESTAS smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_enlpatr
--

DROP TABLE IF EXISTS lp2008_enlpatr;
CREATE TABLE lp2008_enlpatr (
  ID mediumint(5) NOT NULL COMMENT 'ID que identifica el enlace patrocinado',
  USUARIO_ID mediumint(9) NOT NULL COMMENT 'id del usuario en cuestion',
  TIPO enum('PP','PU','PL') NOT NULL DEFAULT 'PP' COMMENT 'PP - PUBLICACION, PL - PLAN DE USUARIO, PU - PROMOCIONA USUARIO',
  SECCION varchar(25) NOT NULL,
  IDSOURCE mediumint(9) NOT NULL COMMENT 'id del recurso en cuestion dependiendo de la seccion: ej: tiendas:id de la tienda',
  TITULO varchar(70) NOT NULL COMMENT 'titulo del enlace',
  DESCRIPCION varchar(200) NOT NULL COMMENT 'descripcion del enlace',
  FORMA enum('PC','PI') NOT NULL COMMENT 'forma en que se mostrara los enlaces pc:por clicks, pi:por impresion',
  CANTIDAD smallint(4) DEFAULT '0' COMMENT 'cantidad de impresiones o de clicks utilizados',
  LIMITE smallint(4) NOT NULL DEFAULT '1' COMMENT 'limite de impresiones o clicks limitados',
  ESTATUS enum('A','I','R') NOT NULL DEFAULT 'A' COMMENT 'estatus del registro',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'fecha en que se realizo el enlace'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='registros modulo enlaces patrocinados';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_estadisticas
--

DROP TABLE IF EXISTS lp2008_estadisticas;
CREATE TABLE lp2008_estadisticas (
  ID smallint(6) NOT NULL DEFAULT '0',
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  ARTICULO varchar(70) NOT NULL DEFAULT '' COMMENT 'TITULO DEL ARTICULO VENDIDO O COMPRADO',
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '1',
  MONEDA enum('R','U','E') NOT NULL DEFAULT 'R',
  VALOR decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'VALOR DEL ARTICULO PUBLICADO',
  PROVINCIA_ID smallint(6) NOT NULL DEFAULT '0',
  TIPO enum('S','N') NOT NULL DEFAULT 'S',
  PUBLICADO datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  REPORTADO datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRECIO decimal(12,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ESTADISTICAS DE LAS VENTAS POR USUARIO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_etiquetas
--

DROP TABLE IF EXISTS lp2008_etiquetas;
CREATE TABLE lp2008_etiquetas (
  ETIQUETA varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ETIQUETAS PARA NUBE';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_excedidos
--

DROP TABLE IF EXISTS lp2008_excedidos;
CREATE TABLE lp2008_excedidos (
  USUARIO_ID mediumint(11) NOT NULL,
  FECHA datetime NOT NULL,
  CANTIDAD smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_expreso
--

DROP TABLE IF EXISTS lp2008_expreso;
CREATE TABLE lp2008_expreso (
  ID int(11) NOT NULL,
  USUARIO_ID mediumint(11) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL,
  UID mediumint(9) NOT NULL COMMENT 'UID DE LA PUBLCIACION',
  SMS enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'SI FUE ENVIADO SMS',
  MONTORESALTADO decimal(8,0) NOT NULL DEFAULT '0' COMMENT 'MONTO RECIBIDO POR RESALTADO',
  FECHA date NOT NULL,
  COMENTARIO varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_extensiones
--

DROP TABLE IF EXISTS lp2008_extensiones;
CREATE TABLE lp2008_extensiones (
  ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL,
  FECHA datetime NOT NULL,
  HASTA datetime DEFAULT NULL,
  PROCESADO datetime DEFAULT NULL,
  EXTENSION smallint(6) DEFAULT NULL,
  ESTATUS enum('P','A','C') NOT NULL DEFAULT 'P',
  COMENTARIO text
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ASIGNA LIMITE PUBLICACION POR USUARIO ESPECIFICO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_faq
--

DROP TABLE IF EXISTS lp2008_faq;
CREATE TABLE lp2008_faq (
  ID smallint(6) NOT NULL,
  ORDEN tinyint(4) NOT NULL COMMENT 'ORDEN DE LOS TOPICOS',
  CATEGORIA varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  TOPICO varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  DESCRIPCION text COLLATE utf8_unicode_ci NOT NULL,
  ESTATUS enum('A','I') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  VISITAS smallint(6) NOT NULL DEFAULT '0',
  VISITADO datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='CONTIENE LAS PREGUNTAS Y RESPUESTAS PARA LA AYUDA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_faqcategoria
--

DROP TABLE IF EXISTS lp2008_faqcategoria;
CREATE TABLE lp2008_faqcategoria (
  ID smallint(6) NOT NULL,
  CATEGORIA_ID smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_favoritas
--

DROP TABLE IF EXISTS lp2008_favoritas;
CREATE TABLE lp2008_favoritas (
  ID mediumint(9) NOT NULL,
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  USUARIO_ID varchar(70) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  FECHA timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ARTICULOS SELECCIONADOS COMO FAVORITOS POR LOS USUARIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_favoritosold
--

DROP TABLE IF EXISTS lp2008_favoritosold;
CREATE TABLE lp2008_favoritosold (
  ID mediumint(9) NOT NULL,
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  FECHA timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ARTICULOS SELECCIONADOS COMO FAVORITOS POR LOS USUARIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_fechaopcional
--

DROP TABLE IF EXISTS lp2008_fechaopcional;
CREATE TABLE lp2008_fechaopcional (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTROLA POR FECHA COLOCACIONI OPCIONAL';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_financieras
--

DROP TABLE IF EXISTS lp2008_financieras;
CREATE TABLE lp2008_financieras (
  ID smallint(6) NOT NULL,
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FECHA REGISTRADA',
  NOMBRE varchar(40) NOT NULL,
  EMAIL varchar(120) NOT NULL,
  TELEFONO1 varchar(14) NOT NULL,
  TELEFONO2 varchar(14) NOT NULL,
  CONTACTO varchar(40) NOT NULL,
  PROVINCIA smallint(6) NOT NULL,
  DIRECCION text NOT NULL,
  UBICACION text NOT NULL,
  MINIMO double(15,2) NOT NULL COMMENT 'MONTO MINIMO A PRESTAR PARA LOS PERSONALES',
  TIPO varchar(20) NOT NULL DEFAULT 'VEH' COMMENT 'TIPO DE FINANCIERA',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS NOMBRES DE LAS ENTIDADES FINANCIERAS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_finantipo
--

DROP TABLE IF EXISTS lp2008_finantipo;
CREATE TABLE lp2008_finantipo (
  FINANCIERA_ID mediumint(10) NOT NULL,
  TIPO enum('BR','VEH','PER','OTR','PYME') NOT NULL DEFAULT 'VEH',
  ANIO smallint(6) NOT NULL DEFAULT '1985'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='FINANCIERAS POR TIPOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_idfotosmv
--

DROP TABLE IF EXISTS lp2008_idfotosmv;
CREATE TABLE lp2008_idfotosmv (
  ARTICULO_ID mediumint(9) NOT NULL,
  FECHA datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS ID DE LAS FOTOS MOVIDAS ';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_idfotosmvbak
--

DROP TABLE IF EXISTS lp2008_idfotosmvbak;
CREATE TABLE lp2008_idfotosmvbak (
  ARTICULO_ID mediumint(9) NOT NULL,
  FECHA datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS ID DE LAS FOTOS MOVIDAS ';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_impresiones
--

DROP TABLE IF EXISTS lp2008_impresiones;
CREATE TABLE lp2008_impresiones (
  SECCION smallint(6) NOT NULL COMMENT 'SECCION DE LA IMPRESION',
  CATEGORIA_ID smallint(6) NOT NULL COMMENT 'CATEGORIA DE LA SECCION',
  FECHA date NOT NULL DEFAULT '0000-00-00',
  CANTIDAD mediumint(9) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LAS IMPRESIONES POR SECCION';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_ip2c
--

DROP TABLE IF EXISTS lp2008_ip2c;
CREATE TABLE lp2008_ip2c (
  id int(10) UNSIGNED NOT NULL,
  begin_ip varchar(20) DEFAULT NULL,
  end_ip varchar(20) DEFAULT NULL,
  begin_ip_num int(11) UNSIGNED DEFAULT NULL,
  end_ip_num int(11) UNSIGNED DEFAULT NULL,
  country_code varchar(3) DEFAULT NULL,
  country_name varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_linkaplan
--

DROP TABLE IF EXISTS lp2008_linkaplan;
CREATE TABLE lp2008_linkaplan (
  ID smallint(6) NOT NULL,
  ARTICULO_ID int(11) NOT NULL,
  TIPO enum('T','D','I') NOT NULL DEFAULT 'T' COMMENT 'TIPO DE PLAN DEL USUARIO',
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  CLICKS varchar(50) NOT NULL COMMENT 'CANTIDAD DE CLICKS RECIBIDOS ',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ARTICULOS QUE ENLAZAN A USUARIOS CON PLANES TI DE IN';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_listanegra
--

DROP TABLE IF EXISTS lp2008_listanegra;
CREATE TABLE lp2008_listanegra (
  ID smallint(6) NOT NULL,
  TIPO enum('TELEFONO','IP') NOT NULL COMMENT 'CAMPO A SER BLOQUEADO',
  VALOR varchar(35) NOT NULL,
  ESTATUS enum('A','I') NOT NULL COMMENT 'ESTATUS VALOR EN LA LISTA'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LOS VALORES DE CAMPOS EN LISTA NEGRA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_log_acciones
--

DROP TABLE IF EXISTS lp2008_log_acciones;
CREATE TABLE lp2008_log_acciones (
  ID smallint(6) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ACCION varchar(40) NOT NULL,
  DOCUMENTO varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LAS ACCIONES HECHAS POR LOS OPERADORES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_log_buscar
--

DROP TABLE IF EXISTS lp2008_log_buscar;
CREATE TABLE lp2008_log_buscar (
  ID int(11) NOT NULL,
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  STR varchar(200) NOT NULL DEFAULT '',
  TIPOB enum('S','N') NOT NULL DEFAULT 'S',
  CANTIDAD mediumint(9) NOT NULL DEFAULT '0' COMMENT 'cantidad registros encontrados',
  BUSQUEDAS smallint(6) NOT NULL DEFAULT '1' COMMENT 'BUSQUEDAS REALIZADAS DE ESE TEXTO ',
  USUARIO varchar(70) NOT NULL DEFAULT '' COMMENT 'USUARIO QUE HACE BUSQUEDA',
  URL varchar(200) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ALMACENA STRING DE BUSQUEDA ';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_log_buscar1
--

DROP TABLE IF EXISTS lp2008_log_buscar1;
CREATE TABLE lp2008_log_buscar1 (
  ID int(11) NOT NULL,
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  STR varchar(60) NOT NULL DEFAULT '',
  TIPOB enum('S','N') NOT NULL DEFAULT 'S',
  CANTIDAD smallint(6) NOT NULL DEFAULT '0' COMMENT 'cantidad registros encontrados',
  BUSQUEDAS smallint(6) NOT NULL DEFAULT '1' COMMENT 'BUSQUEDAS REALIZADAS DE ESE TEXTO ',
  USUARIO varchar(70) NOT NULL DEFAULT '' COMMENT 'USUARIO QUE HACE BUSQUEDA',
  URL varchar(70) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ALMACENA STRING DE BUSQUEDA ';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_log_click
--

DROP TABLE IF EXISTS lp2008_log_click;
CREATE TABLE lp2008_log_click (
  ID int(11) NOT NULL,
  FECHA datetime NOT NULL,
  USUARIO_ID int(11) NOT NULL,
  URLBASE varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  URL varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  TEXTO varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ALMACENA LOS LOGS DE CLICKS ';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_log_emailactual
--

DROP TABLE IF EXISTS lp2008_log_emailactual;
CREATE TABLE lp2008_log_emailactual (
  ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL,
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FECHA HECHA EL LOG',
  TIPO enum('A','C') NOT NULL DEFAULT 'A' COMMENT 'A = ACTUAL, C= CAMBIADO'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS USUARIOS QUE CONFIRMARON SU EMAIL';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_log_envmsg
--

DROP TABLE IF EXISTS lp2008_log_envmsg;
CREATE TABLE lp2008_log_envmsg (
  ID mediumint(9) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL,
  FECHA date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LA CANTIDAD DE MENSAJES ENVIADOS POR DIA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_log_logins
--

DROP TABLE IF EXISTS lp2008_log_logins;
CREATE TABLE lp2008_log_logins (
  ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  FECHA timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  IP varchar(25) NOT NULL DEFAULT '',
  TIPO enum('E','EM','EF','EFM','S','SM','EP') NOT NULL DEFAULT 'E' COMMENT 'LOG LAS ENTRADAS DESDE PC FB Y FB MOVIL',
  HOST varchar(100) NOT NULL,
  DISPOSITIVO enum('M','P') NOT NULL DEFAULT 'P',
  USUARIO varchar(70) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='REGISTRA LAS ENTRADAS Y LAS SALIDAS DE LOS USUARIOS AL SISTE';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_log_notifica
--

DROP TABLE IF EXISTS lp2008_log_notifica;
CREATE TABLE lp2008_log_notifica (
  ID smallint(6) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  TIPO varchar(20) NOT NULL DEFAULT 'EXC',
  DOCUMENTO varchar(20) DEFAULT NULL COMMENT 'ALMACENA UN POSIBLE ID DEPENDE TIPO',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='NOTIFICA ALGO QUE SE ENVIO A LOS USUARIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_log_palabras
--

DROP TABLE IF EXISTS lp2008_log_palabras;
CREATE TABLE lp2008_log_palabras (
  ID int(11) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  PALABRA int(11) NOT NULL DEFAULT '0',
  FECHA timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA PALABRAS MALAS PARA VERIFICAR';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_log_pines
--

DROP TABLE IF EXISTS lp2008_log_pines;
CREATE TABLE lp2008_log_pines (
  ID int(10) UNSIGNED NOT NULL COMMENT 'id del registro',
  CANTIDAD mediumint(8) UNSIGNED NOT NULL COMMENT 'cantidad de pines utilizados',
  MONTO int(10) UNSIGNED NOT NULL COMMENT 'cantidad de lo ofrecido por los pines dependiendo del modulo',
  IDTIPO int(10) UNSIGNED NOT NULL COMMENT 'id de la referencia del tipo',
  TIPO tinyint(3) UNSIGNED NOT NULL COMMENT 'modulo que utilizo el pin',
  FECHA datetime NOT NULL COMMENT 'fecha de cuando se realizo',
  IPADDRESS varchar(15) NOT NULL COMMENT 'direccion ip de donde se realizo',
  USUARIO_ID mediumint(9) UNSIGNED NOT NULL COMMENT 'usuario id de quien lo realizo',
  AUTOR mediumint(9) NOT NULL COMMENT 'autor que realizo la operacion (mismo usuario o ooperador))'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='TABLA PARA GUARDAR LAS TRANSACCIONES DE LOS USO DE LOS PINES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_log_pinesviejosistema
--

DROP TABLE IF EXISTS lp2008_log_pinesviejosistema;
CREATE TABLE lp2008_log_pinesviejosistema (
  ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  INVALIDOS text NOT NULL,
  VALIDOS text NOT NULL,
  USADOS text NOT NULL,
  FECHA timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='LOG PARA LOS PINES UTILIZADOS ';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_log_prestamos
--

DROP TABLE IF EXISTS lp2008_log_prestamos;
CREATE TABLE lp2008_log_prestamos (
  PRESTAMO_ID mediumint(9) NOT NULL,
  FINANCIERA_ID mediumint(9) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='PRESTAMOS ENVIADOS A ENTIDADES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_log_pubusu
--

DROP TABLE IF EXISTS lp2008_log_pubusu;
CREATE TABLE lp2008_log_pubusu (
  USUARIO_ID mediumint(9) NOT NULL,
  CUANTOS mediumint(9) NOT NULL,
  FECHA date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA CUANTAS PUBLICACIONES POR USUARIO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_log_ventas
--

DROP TABLE IF EXISTS lp2008_log_ventas;
CREATE TABLE lp2008_log_ventas (
  ARTICULO_ID bigint(20) NOT NULL DEFAULT '0',
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '1',
  MONEDA enum('R','U','E') NOT NULL DEFAULT 'R',
  TITULO varchar(70) NOT NULL DEFAULT ' ',
  PROVINCIA_ID smallint(6) NOT NULL DEFAULT '0',
  TIPO enum('S','N') NOT NULL DEFAULT 'S',
  FECHA date NOT NULL DEFAULT '0000-00-00',
  REPORTE date NOT NULL DEFAULT '0000-00-00',
  PRECIO decimal(12,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ESTADISTICAS DE LAS VENTAS POR USUARIO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_lpbonos
--

DROP TABLE IF EXISTS lp2008_lpbonos;
CREATE TABLE lp2008_lpbonos (
  ID mediumint(9) NOT NULL,
  NUMERO varchar(20) NOT NULL DEFAULT '' COMMENT 'NUMERO GENERADO PARA EL BONO',
  USUARIO_ID varchar(70) NOT NULL DEFAULT '',
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  PC_ID varchar(70) NOT NULL DEFAULT '',
  NOMBRE varchar(40) NOT NULL DEFAULT '',
  TELEFONO varchar(14) NOT NULL,
  CELULAR varchar(14) NOT NULL,
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  FECHADOCUMENTO date NOT NULL DEFAULT '0000-00-00' COMMENT 'FECHA EN LA QUE SE EMITIO LAF ACTURA',
  DOCUMENTO varchar(20) NOT NULL DEFAULT '' COMMENT 'NUMERO DE FACTURA',
  VALOR decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT 'VALOR FACTURA',
  SESSION varchar(40) NOT NULL DEFAULT '' COMMENT 'SESSION DEL USUARIO PARA RECUPERAR EL CUPON',
  ESTATUS enum('A','P') NOT NULL DEFAULT 'A',
  COMENTARIO text NOT NULL COMMENT 'COMENTARIO ADICIONAL DE LA COMPRA'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS CUPONES EMITIDOS PARA USUARIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_lppuntos
--

DROP TABLE IF EXISTS lp2008_lppuntos;
CREATE TABLE lp2008_lppuntos (
  ID mediumint(9) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  VALIDO enum('S','N','A') NOT NULL DEFAULT 'S',
  VALOR smallint(3) NOT NULL DEFAULT '0',
  FECHA timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='PUNTOS ASIGNADOS A LOS USUARIOS POR COLOCAR ANUCNIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_lppuntosp
--

DROP TABLE IF EXISTS lp2008_lppuntosp;
CREATE TABLE lp2008_lppuntosp (
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  SUMATORIA float NOT NULL DEFAULT '0',
  PINES smallint(6) NOT NULL DEFAULT '0',
  USUARIO varchar(25) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE TOTALES DE LOS LP PUNTOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_mapxusu
--

DROP TABLE IF EXISTS lp2008_mapxusu;
CREATE TABLE lp2008_mapxusu (
  USUARIO_ID mediumint(9) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'ULTIMA ACTUALIZACION'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LA CANTIDAD DE MAPAS POR USUARIO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_marcas
--

DROP TABLE IF EXISTS lp2008_marcas;
CREATE TABLE lp2008_marcas (
  ID smallint(6) NOT NULL,
  ID_VIEJO smallint(6) NOT NULL DEFAULT '-1' COMMENT 'ID VIEJO TEMPORAL PARA REAJUSTE',
  MARCA varchar(30) NOT NULL,
  TIPO enum('CE','VE') NOT NULL DEFAULT 'VE',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LAS MARCAS VARIAS DEL SISTEMA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_mensajeria
--

DROP TABLE IF EXISTS lp2008_mensajeria;
CREATE TABLE lp2008_mensajeria (
  ID mediumint(9) NOT NULL,
  DE mediumint(9) NOT NULL DEFAULT '0',
  PARA mediumint(9) NOT NULL DEFAULT '0',
  NOMBRE varchar(90) NOT NULL,
  EMAIL varchar(100) NOT NULL COMMENT 'EMAIL EN QUE ENVIA ',
  TELEFONO varchar(14) DEFAULT NULL,
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  ASUNTO varchar(70) NOT NULL DEFAULT '',
  ESTATUSDE enum('I','N','L') NOT NULL DEFAULT 'N',
  ESTATUSPARA enum('I','N','L') NOT NULL DEFAULT 'N',
  ESCRIBEDE enum('S','N') NOT NULL DEFAULT 'N',
  ESCRIBEPARA enum('S','N') NOT NULL DEFAULT 'N',
  VISTODE datetime NOT NULL,
  VISTOPARA datetime NOT NULL,
  FECHA datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  MENSAJESDE smallint(6) NOT NULL DEFAULT '0',
  MENSAJESPARA smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='TABLA PARA ALMACENAR MENSAJES ENVIADOS A USUARIOS DE OTROS';


--
-- Table structure for table lp2008_mensajes
--

DROP TABLE IF EXISTS lp2008_mensajes;
CREATE TABLE lp2008_mensajes (
  ID smallint(6) NOT NULL,
  MENSAJERIA_ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL COMMENT 'DUENO DEL MENSAJE ENVIADO',
  FECHA datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  TIPO enum('S','E') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'E' COMMENT 'E- MSG ENTRADA, S - MSG SALIDA',
  ESTATUS enum('A','I','E') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A' COMMENT 'E - eliminado por incumplir',
  DISPOSITIVO enum('M','D') COLLATE utf8_unicode_ci NOT NULL,
  IPADDRESS varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  MENSAJE text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='GUARDA LOS MENSAJES ENVIADOS Y RECIBIDOS POR USUARIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_metatags
--

DROP TABLE IF EXISTS lp2008_metatags;
CREATE TABLE lp2008_metatags (
  ARTICULO_ID mediumint(9) NOT NULL,
  NOMBREPLAN varchar(40) NOT NULL COMMENT 'NOMBRE DEL PLAN PARA ESTA PUBLICACION',
  KEYWORDS varchar(150) NOT NULL,
  DESCRIPCION varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS META PARA LOS DETALLES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_modelos
--

DROP TABLE IF EXISTS lp2008_modelos;
CREATE TABLE lp2008_modelos (
  ID smallint(6) NOT NULL,
  ID_VIEJO smallint(6) NOT NULL DEFAULT '-1' COMMENT 'ID VIEJO TEMPORAL PARA REAJUSTE',
  MARCA_ID smallint(6) NOT NULL COMMENT 'ID DE LA MARCA',
  MODELO varchar(50) NOT NULL,
  TIPO enum('CE','VE') NOT NULL DEFAULT 'VE',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS MODELOS VARI0S DEL SISTEMA';

-- --------------------------------------------------------


--
-- Table structure for table lp2008_msgarticulo
--

DROP TABLE IF EXISTS lp2008_msgarticulo;
CREATE TABLE lp2008_msgarticulo (
  ID int(11) NOT NULL,
  ARTICULO_ID int(11) NOT NULL,
  USUARIO_ID int(11) NOT NULL,
  IPADDRESS varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  FECHA datetime NOT NULL,
  NOMBRE varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  TELEFONO varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  MENSAJE varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ALMACENA LOS MENSAJES ENVIADOS A WHATSAPP POR UN ARTICULO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_msgcintillo
--

DROP TABLE IF EXISTS lp2008_msgcintillo;
CREATE TABLE lp2008_msgcintillo (
  ID smallint(6) NOT NULL,
  TITULO varchar(50) NOT NULL COMMENT 'TITULO MENSAJE',
  MENSAJE varchar(300) NOT NULL,
  FECHA datetime NOT NULL,
  HASTA tinyint(4) NOT NULL COMMENT 'CANTIDAD DE DIAS',
  URL varchar(100) NOT NULL,
  ENLACE varchar(50) NOT NULL,
  TIPO enum('E','W','I') NOT NULL DEFAULT 'I',
  ESTATUS enum('A','I','M') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS MENSAJES A SER COLOCADOS EN CINTILLO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_municipios
--

DROP TABLE IF EXISTS lp2008_municipios;
CREATE TABLE lp2008_municipios (
  ID int(11) NOT NULL,
  PROVINCIA_ID int(11) NOT NULL,
  MUNICIPIO varchar(50) NOT NULL,
  PUBLICADOS int(11) NOT NULL DEFAULT '0',
  PRINCIPAL enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'USADO PARA PREPARAR ARREGLO MUNIS DEFECTO'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CONTIENE LOS MUNICIPIOS PARA REGISTROS DE USUARIOS Y OTROS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_municipiosn
--

DROP TABLE IF EXISTS lp2008_municipiosn;
CREATE TABLE lp2008_municipiosn (
  ID int(11) NOT NULL,
  PROVINCIA_ID int(11) NOT NULL,
  MUNICIPIO varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PUBLICADOS int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='CONTIENE LOS MUNICIPIOS PARA REGISTROS DE USUARIOS Y OTROS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_nologin
--

DROP TABLE IF EXISTS lp2008_nologin;
CREATE TABLE lp2008_nologin (
  ID smallint(6) NOT NULL,
  USUARIO_ID int(11) NOT NULL,
  PENALIDAD enum('R','C','IP','LE','PP','FE') NOT NULL DEFAULT 'R' COMMENT 'R - REPETIDOS, C- CAT INCORRECTA, IP - INCUMPLIMIENTO PAGO, LE - LIMITE EXCEDIDO, PP - PENDIENTE PAGO PLAN',
  HASTA datetime NOT NULL,
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTROLA SI EL USUARIO PUEDE HACER LOGIN O NO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_notelefono
--

DROP TABLE IF EXISTS lp2008_notelefono;
CREATE TABLE lp2008_notelefono (
  ID int(11) NOT NULL,
  TELEFONO varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  HASTA datetime NOT NULL,
  CANTIDAD smallint(6) NOT NULL DEFAULT '1',
  ESTATUS enum('A','I') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='BLOQUEA NUMEROS DE TELEFONO REGISTRO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_opcionales
--

DROP TABLE IF EXISTS lp2008_opcionales;
CREATE TABLE lp2008_opcionales (
  ID mediumint(9) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '1',
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  TIPO enum('V','VC','VM','VMC','PLP','PLC') NOT NULL DEFAULT 'V',
  ESTATUS enum('A','I','E') NOT NULL DEFAULT 'A',
  DIAS smallint(9) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ARTIICULOS QUE PAGAN PARA ESTAR VIP PRINCIPA Y CATEGORIA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_opcionalesajax
--

DROP TABLE IF EXISTS lp2008_opcionalesajax;
CREATE TABLE lp2008_opcionalesajax (
  ID mediumint(9) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '1' COMMENT 'ARTICULO O USUARIO ID',
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  TIPO enum('V','VC','VM','VMC','PLP','PLC') NOT NULL DEFAULT 'V' COMMENT 'Tipos de opcionales',
  ESTATUS enum('A','I','E') NOT NULL DEFAULT 'A',
  DIAS smallint(9) NOT NULL DEFAULT '1' COMMENT 'DIAS O IMPRESIONES COMPRADAS'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ARTIICULOS QUE PAGAN PARA ESTAR VIP PRINCIPA Y CATEGORIA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_opcionalesbk
--

DROP TABLE IF EXISTS lp2008_opcionalesbk;
CREATE TABLE lp2008_opcionalesbk (
  ID mediumint(9) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '1',
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  TIPO enum('V','VC','VM','VMC','PLP','PLC') NOT NULL DEFAULT 'V',
  ESTATUS enum('A','I','E') NOT NULL DEFAULT 'A',
  DIAS smallint(9) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ARTIICULOS QUE PAGAN PARA ESTAR VIP PRINCIPA Y CATEGORIA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_opcionalesbk010711
--

DROP TABLE IF EXISTS lp2008_opcionalesbk010711;
CREATE TABLE lp2008_opcionalesbk010711 (
  ID mediumint(9) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '1',
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  TIPO enum('V','VC') NOT NULL DEFAULT 'V',
  ESTATUS enum('A','I','E') NOT NULL DEFAULT 'A',
  DIAS smallint(9) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ARTIICULOS QUE PAGAN PARA ESTAR VIP PRINCIPA Y CATEGORIA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_opcionalesold
--

DROP TABLE IF EXISTS lp2008_opcionalesold;
CREATE TABLE lp2008_opcionalesold (
  ID mediumint(9) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '1',
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  TIPO enum('V','VC') NOT NULL DEFAULT 'V',
  ESTATUS enum('A','I','E') NOT NULL DEFAULT 'A',
  DIAS smallint(9) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ARTIICULOS QUE PAGAN PARA ESTAR VIP PRINCIPA Y CATEGORIA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_opcionales_old
--

DROP TABLE IF EXISTS lp2008_opcionales_old;
CREATE TABLE lp2008_opcionales_old (
  ID mediumint(9) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '1' COMMENT 'ARTICULO O USUARIO ID',
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  TIPO enum('V','VC','VM','VMC','PLP','PLC') NOT NULL DEFAULT 'V' COMMENT 'Tipos de opcionales',
  ESTATUS enum('A','I','E') NOT NULL DEFAULT 'A',
  DIAS smallint(9) NOT NULL DEFAULT '1' COMMENT 'DIAS O IMPRESIONES COMPRADAS'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ARTIICULOS QUE PAGAN PARA ESTAR VIP PRINCIPA Y CATEGORIA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_palabras
--

DROP TABLE IF EXISTS lp2008_palabras;
CREATE TABLE lp2008_palabras (
  ID tinyint(4) NOT NULL,
  PALABRA varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  NIVEL enum('A','M','B') CHARACTER SET utf8 NOT NULL DEFAULT 'B',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  FECHA datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CUANTOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_parametros
--

DROP TABLE IF EXISTS lp2008_parametros;
CREATE TABLE lp2008_parametros (
  PARAMETRO varchar(16) NOT NULL,
  VALOR varchar(300) NOT NULL,
  DESCRIPCION varchar(40) NOT NULL COMMENT 'DESCRIPCION DEL PARAMETRO'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS PARAMETROS DEL SISTEMA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_parametros_old
--

DROP TABLE IF EXISTS lp2008_parametros_old;
CREATE TABLE lp2008_parametros_old (
  ID tinyint(4) NOT NULL,
  TIENDAS smallint(6) NOT NULL,
  ARTTIENDAS smallint(6) NOT NULL COMMENT 'CANTIDAD ARTICULOS EN TIENDAS',
  TIENDASPRV varchar(100) NOT NULL COMMENT 'ALMACENA LAS TIENDAS POR PROVINCIAS',
  CATTIENDAS varchar(100) NOT NULL COMMENT 'CANTIDAD DE TIENDAS POR CATEGORIA',
  VIPTIENDAS varchar(100) NOT NULL COMMENT 'ALMACENA LOS ID DELAS TIENDAS VIP',
  DEALERS smallint(6) NOT NULL COMMENT 'CANTIDAD DE DEALERS REGISTRADOS',
  VEHDEALERS smallint(6) NOT NULL COMMENT 'CANTIDAD DE VEHICULOS POR DEALERS',
  DEALERSPRV varchar(100) NOT NULL COMMENT 'DEALERS POR PROVINCIAS',
  VIPDEALERS varchar(100) NOT NULL COMMENT 'DEALERS VIP',
  INMOBILIARIAS smallint(6) NOT NULL COMMENT 'CANTIDAD INMOBILIARIAS',
  PROPINMO smallint(6) NOT NULL COMMENT 'CANTIDAD DE PROPIEDES EN INMOBILIARIAS',
  INMPRV varchar(100) NOT NULL COMMENT 'INMOBILIARIAS POR PROVINCIAS',
  VIPINM varchar(100) NOT NULL COMMENT 'INMOBILIARIAS VIP',
  UIDMULTIPLE varchar(30) NOT NULL COMMENT 'ID USUARIO AREA MULTIPLE TIENDAS Y DEALERS',
  TIPOMULTIPLE enum('TI','DE','IN') NOT NULL DEFAULT 'DE' COMMENT 'TIPOS DE PLANES EN AREA MULTIPLE',
  UIDDEFEFCTO mediumint(9) NOT NULL COMMENT 'UID POR DEFECTO ',
  NOMMULTIPLE varchar(120) NOT NULL COMMENT 'NOMBRES DE LAS TIENDAS O DEALERS',
  DIRTIENDAS varchar(28) NOT NULL COMMENT 'DIRECTORIO DE TIENDAS REGISTRADAS',
  DIRDEALERS varchar(28) NOT NULL COMMENT 'DIRECTORIO DE DEALERS REGISTRADOS',
  DIRINMOBILIARIAS varchar(28) NOT NULL COMMENT 'DIRECTORIO INMOBILIARIAS',
  MSGUSUARIOS enum('S','N') NOT NULL,
  LOGO enum('NA','SA','MA','LL') NOT NULL COMMENT 'TIPO DE LOGO A USAR SEGUN EL TIEMPO'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE PARAMETROS BASICOS PARA FUNCIONAMIENTO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_paramsmvc
--

DROP TABLE IF EXISTS lp2008_paramsmvc;
CREATE TABLE lp2008_paramsmvc (
  PARAMETRO varchar(16) NOT NULL,
  VALOR varchar(300) NOT NULL,
  DESCRIPCION varchar(40) NOT NULL COMMENT 'DESCRIPCION DEL PARAMETRO'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS PARAMETROS DEL SISTEMA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_pclaves
--

DROP TABLE IF EXISTS lp2008_pclaves;
CREATE TABLE lp2008_pclaves (
  CATEGORIA_ID tinyint(4) NOT NULL DEFAULT '0',
  PCLAVES text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA TODAS LAS PALABRAS CLAVES POR CATEGORIA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_pclavesbk
--

DROP TABLE IF EXISTS lp2008_pclavesbk;
CREATE TABLE lp2008_pclavesbk (
  CATEGORIA_ID tinyint(4) NOT NULL DEFAULT '0',
  PCLAVES text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA TODAS LAS PALABRAS CLAVES POR CATEGORIA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_pclavesdsv
--

DROP TABLE IF EXISTS lp2008_pclavesdsv;
CREATE TABLE lp2008_pclavesdsv (
  CATEGORIA_ID tinyint(4) NOT NULL DEFAULT '0',
  PCLAVES text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA TODAS LAS PALABRAS CLAVES POR CATEGORIA DE SERVICIO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_penalidades
--

DROP TABLE IF EXISTS lp2008_penalidades;
CREATE TABLE lp2008_penalidades (
  ID smallint(6) NOT NULL,
  USUARIO_ID int(11) NOT NULL,
  OPERADOR_ID mediumint(9) NOT NULL DEFAULT '1' COMMENT 'OPERADOR QUE PENALIZA',
  PENALIDAD enum('R','C','IP','LE','PP','FE','PAR','PAC','PAIP','PALE','PAPP','PAFE','PAPV','PAVP') NOT NULL DEFAULT 'R' COMMENT 'R - REPETIDOS, C- CAT INCORRECTA, IP - INCUMPLIMIENTO PAGO, LE - LIMITE EXCEDIDO, PP - PENDIENTE PAGO PLAN, PA - PREAVISO\r\nPAPV - PRODUCTO VENCIDO\r\nPAVP - PRODUCTO A VENCER',
  DIAS smallint(6) NOT NULL DEFAULT '2',
  FECHA datetime NOT NULL,
  HASTA datetime NOT NULL,
  INTENTOS smallint(6) NOT NULL DEFAULT '0',
  ULTIMO datetime DEFAULT NULL,
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  COMENTARIO varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTROLA SI EL USUARIO PUEDE HACER LOGIN O NO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_planenlista
--

DROP TABLE IF EXISTS lp2008_planenlista;
CREATE TABLE lp2008_planenlista (
  ID int(11) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL COMMENT 'id del usuario',
  CATEGORIA_ID smallint(6) NOT NULL,
  CPMACTUAL int(11) NOT NULL DEFAULT '0' COMMENT 'cantidad de impresiones actual',
  CPMHASTA int(11) DEFAULT NULL COMMENT 'limite de cantidad de impresiones',
  ESTATUS enum('A','I','R') DEFAULT 'A',
  FECHA_INICIO datetime NOT NULL COMMENT 'inicio de la campana',
  FECHA_FINAL datetime DEFAULT NULL COMMENT 'termino de la campana'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='TABLA QUE GUARDARA LOS REGISTRO DE LAS PLANES EN LISTA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_planes
--

DROP TABLE IF EXISTS lp2008_planes;
CREATE TABLE lp2008_planes (
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  PLAN enum('OP1','OP2','LPE','LP','LP+','T1','T2','T3','TA','DV1','DV2','DV3','DV4','IN1','IN2','IN3','IN4') NOT NULL DEFAULT 'LP',
  INICIO datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'INICIO DEL PLAN ACTIVO',
  HASTA datetime DEFAULT '0000-00-00 00:00:00',
  ESTATUS enum('A','P','C','V') NOT NULL DEFAULT 'P'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='INFORMACION SOBRE LOS PLANES ADQUIRIDOS, LP, UV, ETC';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_planesinfo
--

DROP TABLE IF EXISTS lp2008_planesinfo;
CREATE TABLE lp2008_planesinfo (
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  LAT varchar(25) DEFAULT NULL COMMENT 'LATITUD COORD',
  LNG varchar(25) DEFAULT NULL COMMENT 'LONGITUD COORD',
  TIPO tinyint(2) NOT NULL,
  NOMBRE varchar(40) NOT NULL DEFAULT '' COMMENT 'NOMBRE DE LA TIENDA',
  RNC varchar(14) DEFAULT NULL COMMENT 'RNC DEL USUARIO O CLIENTE',
  LOGO varchar(1) NOT NULL DEFAULT 'N',
  HORARIO smallint(6) DEFAULT '0',
  FACILIDADES varchar(15) DEFAULT NULL COMMENT 'FACILIDADES DE LA TIENDA AL CLIENTE',
  URLVIDEO varchar(120) DEFAULT NULL,
  URLPAGINA varchar(100) DEFAULT NULL,
  URLFB varchar(100) DEFAULT NULL,
  URLIG varchar(100) DEFAULT NULL,
  PAYPAL varchar(100) DEFAULT NULL,
  PAYPAL_ACEPTA enum('S','N') NOT NULL DEFAULT 'N',
  PAYPAL_API_USERNAME varchar(100) DEFAULT NULL,
  PAYPAL_API_PASSWORD varchar(100) DEFAULT NULL,
  PAYPAL_API_SIGNATURE varchar(100) DEFAULT NULL,
  VISITAS bigint(6) NOT NULL DEFAULT '0',
  VISITADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  MAPA varchar(250) DEFAULT NULL,
  DESCRIPCION varchar(254) DEFAULT NULL COMMENT 'DESCRIPCION DE LAS TIENDAS'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='INF. SOBRE LAS TIENDAS, DEALERS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_planesinfo18218
--

DROP TABLE IF EXISTS lp2008_planesinfo18218;
CREATE TABLE lp2008_planesinfo18218 (
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  LAT varchar(25) DEFAULT NULL COMMENT 'LATITUD COORD',
  LNG varchar(25) DEFAULT NULL COMMENT 'LONGITUD COORD',
  TIPO tinyint(2) DEFAULT NULL,
  NOMBRE varchar(40) NOT NULL DEFAULT '' COMMENT 'NOMBRE DE LA TIENDA',
  RNC varchar(14) DEFAULT NULL COMMENT 'RNC DEL USUARIO O CLIENTE',
  LOGO varchar(1) NOT NULL DEFAULT 'N',
  HORARIO smallint(6) DEFAULT '0',
  FACILIDADES varchar(15) DEFAULT NULL COMMENT 'FACILIDADES DE LA TIENDA AL CLIENTE',
  URLVIDEO varchar(120) DEFAULT NULL,
  URLPAGINA varchar(100) DEFAULT NULL,
  URLFB varchar(100) DEFAULT NULL,
  URLIG varchar(100) DEFAULT NULL,
  PAYPAL varchar(100) DEFAULT NULL,
  PAYPAL_ACEPTA enum('S','N') NOT NULL DEFAULT 'N',
  PAYPAL_API_USERNAME varchar(100) DEFAULT NULL,
  PAYPAL_API_PASSWORD varchar(100) DEFAULT NULL,
  PAYPAL_API_SIGNATURE varchar(100) DEFAULT NULL,
  VISITAS bigint(6) NOT NULL DEFAULT '0',
  VISITADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  MAPA varchar(250) DEFAULT NULL,
  DESCRIPCION varchar(254) NOT NULL DEFAULT '' COMMENT 'DESCRIPCION DE LAS TIENDAS'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='INF. SOBRE LAS TIENDAS, DEALERS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_planesinfoold110516
--

DROP TABLE IF EXISTS lp2008_planesinfoold110516;
CREATE TABLE lp2008_planesinfoold110516 (
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  PROVINCIA smallint(6) NOT NULL,
  SECTOR smallint(6) NOT NULL DEFAULT '0' COMMENT 'SECTOR AL QUE PERTENECE',
  LAT varchar(25) DEFAULT NULL COMMENT 'LATITUD COORD',
  LNG varchar(25) DEFAULT NULL COMMENT 'LONGITUD COORD',
  TIPO tinyint(2) NOT NULL,
  NOMBRE varchar(40) NOT NULL DEFAULT '' COMMENT 'NOMBRE DE LA TIENDA',
  RNC varchar(14) NOT NULL COMMENT 'RNC DEL USUARIO O CLIENTE',
  PALABRAS varchar(120) NOT NULL DEFAULT '' COMMENT 'PALABRAS CLAVES A UTILIZAR',
  URLVIDEO varchar(120) NOT NULL,
  LOGO varchar(1) DEFAULT NULL COMMENT 'SI TIENE LOGO O NO',
  LOGO1 varchar(1) DEFAULT NULL,
  PRECIOS varchar(60) DEFAULT NULL COMMENT 'ALMACENA RANGO DE PRECIOS CSV',
  DESCRIPCION varchar(254) NOT NULL DEFAULT '' COMMENT 'DESCRIPCION DE LAS TIENDAS',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0' COMMENT 'CANTIDAD ARTICULOS PUBLICADOS',
  VISITAS smallint(6) NOT NULL DEFAULT '0',
  VISITADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='INF. SOBRE LAS TIENDAS, DEALERS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_planesinfo_old261216
--

DROP TABLE IF EXISTS lp2008_planesinfo_old261216;
CREATE TABLE lp2008_planesinfo_old261216 (
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  PROVINCIA smallint(6) NOT NULL,
  SECTOR smallint(6) NOT NULL DEFAULT '0',
  LAT varchar(25) DEFAULT NULL COMMENT 'LATITUD COORD',
  LNG varchar(25) DEFAULT NULL COMMENT 'LONGITUD COORD',
  TIPO tinyint(2) NOT NULL,
  NOMBRE varchar(40) NOT NULL DEFAULT '' COMMENT 'NOMBRE DE LA TIENDA',
  RNC varchar(14) DEFAULT NULL COMMENT 'RNC DEL USUARIO O CLIENTE',
  PALABRAS varchar(120) NOT NULL DEFAULT '' COMMENT 'PALABRAS CLAVES A UTILIZAR',
  URLVIDEO varchar(120) DEFAULT NULL,
  IMAGENES varchar(60) DEFAULT NULL COMMENT 'SI TIENE LOGO O NO, ENCABEZADO Y PIE',
  LOGO varchar(1) NOT NULL DEFAULT 'N',
  PRECIOS varchar(60) DEFAULT NULL,
  DESCRIPCION varchar(254) NOT NULL DEFAULT '' COMMENT 'DESCRIPCION DE LAS TIENDAS',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0' COMMENT 'CANTIDAD ARTICULOS PUBLICADOS',
  VISITAS bigint(6) NOT NULL DEFAULT '0',
  VISITADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='INF. SOBRE LAS TIENDAS, DEALERS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_planesold
--

DROP TABLE IF EXISTS lp2008_planesold;
CREATE TABLE lp2008_planesold (
  ID smallint(6) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  PLAN enum('OP1','OP2','LP','LP+','UV1','UV2','UV3','T1','T2','T3','TA') NOT NULL DEFAULT 'LP',
  ACTUAL enum('OP1','OP2','LP','LP+','UV1','UV2','UV3','T1','T2','T3','TA','N/A') NOT NULL DEFAULT 'N/A',
  HASTA datetime DEFAULT NULL,
  TITULO varchar(40) NOT NULL DEFAULT 'N/A',
  ORDEN tinyint(4) NOT NULL DEFAULT '0',
  ESTATUS enum('A','P','C','V') NOT NULL DEFAULT 'P'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='INFORMACION SOBRE LOS PLANES ADQUIRIDOS, LP, UV, ETC';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_planesold110516
--

DROP TABLE IF EXISTS lp2008_planesold110516;
CREATE TABLE lp2008_planesold110516 (
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  PLAN enum('OP1','OP2','LPE','LP','LP+','T1','T2','T3','TA','DV1','DV2','DV3','DV4','IN1','IN2','IN3','IN4') NOT NULL DEFAULT 'LP',
  INICIO datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'INICIO DEL PLAN ACTIVO',
  HASTA datetime DEFAULT '0000-00-00 00:00:00',
  ESTATUS enum('A','P','C','V') NOT NULL DEFAULT 'P'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='INFORMACION SOBRE LOS PLANES ADQUIRIDOS, LP, UV, ETC';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_plantilladesc
--

DROP TABLE IF EXISTS lp2008_plantilladesc;
CREATE TABLE lp2008_plantilladesc (
  USUARIO_ID mediumint(9) NOT NULL,
  PLANTILLA text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='CONTIENE PLANTILLA PARA LA DESCRIPCION DETALLE';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_porprv
--

DROP TABLE IF EXISTS lp2008_porprv;
CREATE TABLE lp2008_porprv (
  PROVINCIA_ID smallint(6) NOT NULL,
  PUBLICACIONES smallint(6) NOT NULL DEFAULT '0',
  TIENDAS smallint(6) NOT NULL DEFAULT '0',
  DEALERS smallint(6) NOT NULL DEFAULT '0',
  INMOBILIARIAS smallint(6) NOT NULL DEFAULT '0',
  USUARIOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LAS CANTIDADES POR PROVINCIAS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_prefijotel
--

DROP TABLE IF EXISTS lp2008_prefijotel;
CREATE TABLE lp2008_prefijotel (
  ID smallint(6) NOT NULL,
  PREFIJO varchar(6) NOT NULL,
  PREFIJOF varchar(9) NOT NULL COMMENT 'PREFIJO FORMATEADO',
  TIPO smallint(6) NOT NULL COMMENT 'TIPO DE TELEFONO, FIJO, MOVIL Y CIA'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS PREFIOS DE LOS TIPOS DE TELEFONOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_preftipotel
--

DROP TABLE IF EXISTS lp2008_preftipotel;
CREATE TABLE lp2008_preftipotel (
  ID mediumint(9) NOT NULL,
  TIPO varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS TIPOS DE PREFIJOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_prestamos
--

DROP TABLE IF EXISTS lp2008_prestamos;
CREATE TABLE lp2008_prestamos (
  ID mediumint(10) NOT NULL,
  NOMBRE varchar(40) NOT NULL,
  CEDULA varchar(15) DEFAULT NULL,
  TELEFONO1 varchar(25) NOT NULL,
  TELEFONO2 varchar(15) DEFAULT NULL,
  EMAIL varchar(60) DEFAULT NULL,
  TIPO enum('BR','VEH','PER','OTR','PYME') DEFAULT 'VEH',
  TIPOINFO varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  MARCA varchar(50) DEFAULT NULL,
  MODELO varchar(20) DEFAULT NULL,
  ANIO varchar(4) DEFAULT NULL,
  FECHA datetime DEFAULT '0000-00-00 00:00:00',
  CREDITO enum('Si','No','0') CHARACTER SET utf8 DEFAULT '0',
  INGRESOS double(15,2) DEFAULT NULL COMMENT 'INGRESOS MENSUALES PARA LOS PERSONALES',
  VALOR decimal(15,2) DEFAULT NULL,
  MONTO decimal(15,2) DEFAULT NULL,
  OTORGADO decimal(15,2) DEFAULT '0.00',
  FECHAOTOR date DEFAULT '0000-00-00',
  ENTIDADOTOR tinyint(4) DEFAULT '0',
  ESTATUS enum('S','R','C','P','I','D') NOT NULL DEFAULT 'I' COMMENT 'I - incompletos\nS - solicitud completar\nC - SOLICITUD CANCELADA\nP - SOLICITUD APROBADA POR FINANCIERA\nD - SOLICITUD DESEMBOLSADA',
  FASE tinyint(4) NOT NULL COMMENT 'FASE EN LA QUE VA EL EXPEDIENTE',
  COMENTARIO text,
  EVALUACION text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_provincias
--

DROP TABLE IF EXISTS lp2008_provincias;
CREATE TABLE lp2008_provincias (
  ID int(11) NOT NULL,
  ID_VIEJO int(11) NOT NULL,
  PROVINCIA varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PUBLICADOS int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='CONTIENE LISTADO DE PROVINCIAS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_publica
--

DROP TABLE IF EXISTS lp2008_publica;
CREATE TABLE lp2008_publica (
  ARTICULO_ID mediumint(9) NOT NULL,
  SESSION varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA PUBLICACION USUARIO SIN REGISTRAR';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_publicados
--

DROP TABLE IF EXISTS lp2008_publicados;
CREATE TABLE lp2008_publicados (
  FECHA date NOT NULL DEFAULT '0000-00-00',
  CUANTOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA TOTAL PUBLICADOS POR DIA';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_rangosip
--

DROP TABLE IF EXISTS lp2008_rangosip;
CREATE TABLE lp2008_rangosip (
  ip1_temp char(16) DEFAULT NULL,
  ip2_temp char(16) DEFAULT NULL,
  ip_from int(10) UNSIGNED NOT NULL,
  ip_to int(10) UNSIGNED NOT NULL,
  code char(2) NOT NULL,
  country varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_recientes
--

DROP TABLE IF EXISTS lp2008_recientes;
CREATE TABLE lp2008_recientes (
  ARTICULO_ID mediumint(9) NOT NULL,
  USUARIO varchar(70) NOT NULL,
  FECHA datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ARTICULOS VISITADOS RECIENTEMENTE';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_recurrentes
--

DROP TABLE IF EXISTS lp2008_recurrentes;
CREATE TABLE lp2008_recurrentes (
  USUARIO_ID mediumint(9) NOT NULL,
  INICIO date NOT NULL DEFAULT '0000-00-00' COMMENT 'INICIO DE LA MODALIDAD',
  MODIFICA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'SE REALIZA MODIFICACION DEL REGISTRO, ESTATUS, FORMA DE PAGO',
  FORMAPAGO enum('TP','TR','MM','LPP','TU','UR','PP','PU','CK','EF','RE') NOT NULL COMMENT 'FORMA DE PAGO A UTILIZAR DE FORMA MENSUAL',
  DURACION smallint(6) NOT NULL DEFAULT '12',
  ESTATUS enum('A','I','C') NOT NULL DEFAULT 'I',
  DIA smallint(6) NOT NULL DEFAULT '1',
  NCF enum('S','N') NOT NULL DEFAULT 'N',
  COMENTARIO text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA USUARIOS MODALIDAD PAGOS MENSUALES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_referidos
--

DROP TABLE IF EXISTS lp2008_referidos;
CREATE TABLE lp2008_referidos (
  ID int(6) NOT NULL,
  REFERIDO mediumint(9) NOT NULL COMMENT 'USUARIO REFERIDO',
  REFERIDOR mediumint(9) NOT NULL COMMENT 'USUARIO QUIEN REFIERE',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  REGISTRO enum('S','N') DEFAULT 'N' COMMENT 'SI HIZO REGISTRO',
  PUBLICA enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'SI HIZO UNA PUBLICACION',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  CANAL enum('WS','EM','OT') NOT NULL DEFAULT 'OT' COMMENT 'POR QUE VIA FUE REFERIDO'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='USUARIOS REFERIDOS POR OTROS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_referidos_old
--

DROP TABLE IF EXISTS lp2008_referidos_old;
CREATE TABLE lp2008_referidos_old (
  ID int(6) NOT NULL,
  TIPO enum('I','X') NOT NULL DEFAULT 'I' COMMENT 'I - INTERNO, X - EXTERNO',
  NOMBRE varchar(60) NOT NULL DEFAULT '',
  EMAIL varchar(60) NOT NULL DEFAULT '',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  REFERIDO varchar(60) NOT NULL DEFAULT '',
  PROCESADO enum('N','S') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='USUARIOS REFERIDOS POR OTROS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_renomultiples
--

DROP TABLE IF EXISTS lp2008_renomultiples;
CREATE TABLE lp2008_renomultiples (
  USUARIO_ID mediumint(9) NOT NULL,
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'HASTA VALIDEZ',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LAS HORAS DE LAS RENOVACIONES AUTOMATICAS DIARIAS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_renovaarticulo
--

DROP TABLE IF EXISTS lp2008_renovaarticulo;
CREATE TABLE lp2008_renovaarticulo (
  ID mediumint(9) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  ANTERIOR datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ACTUAL timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  VISITAS smallint(6) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTROL DE ARTICULOS RENOVADOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_renovaciones
--

DROP TABLE IF EXISTS lp2008_renovaciones;
CREATE TABLE lp2008_renovaciones (
  USUARIO_ID mediumint(9) NOT NULL,
  PLAN enum('PB','LP','LP+','T1','T2','T3','TA','DV1','DV2','DV3','DV4','IN1','IN2','IN3','IN4') NOT NULL DEFAULT 'PB' COMMENT 'PLAN DE USUARIO',
  TIPO enum('SR','RAM','RA') NOT NULL DEFAULT 'RA' COMMENT 'SIMPLES Y MULTIPLES',
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'HASTA VALIDEZ',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  LUNES tinyint(4) NOT NULL DEFAULT '6',
  MARTES tinyint(4) NOT NULL DEFAULT '6',
  MIERCOLES tinyint(4) NOT NULL DEFAULT '6',
  JUEVES tinyint(4) NOT NULL DEFAULT '6',
  VIERNES tinyint(4) NOT NULL DEFAULT '6',
  SABADO tinyint(4) NOT NULL DEFAULT '6',
  DOMINGO tinyint(4) NOT NULL DEFAULT '6'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LAS HORAS DE LAS RENOVACIONES AUTOMATICAS DIARIAS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_renovatodo
--

DROP TABLE IF EXISTS lp2008_renovatodo;
CREATE TABLE lp2008_renovatodo (
  ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL,
  FECHA datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ALMACENA FECHAS DE LAS RENOVACIONES MANUALES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_repuemarca
--

DROP TABLE IF EXISTS lp2008_repuemarca;
CREATE TABLE lp2008_repuemarca (
  REPUESTO_ID mediumint(10) NOT NULL,
  MARCA varchar(30) NOT NULL COMMENT 'MARCA DE VEHICULOS QUE TRABAJA EL REPUESTO'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='REPUESTOS POR MARCAS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_repuestos
--

DROP TABLE IF EXISTS lp2008_repuestos;
CREATE TABLE lp2008_repuestos (
  ID smallint(6) NOT NULL,
  NOMBRE varchar(40) NOT NULL,
  EMAIL varchar(120) NOT NULL,
  TELEFONO1 varchar(14) NOT NULL,
  TELEFONO2 varchar(14) DEFAULT NULL COMMENT 'TELEFONO MOVIL',
  CONTACTO varchar(40) NOT NULL,
  PROVINCIA smallint(6) NOT NULL,
  DIRECCION varchar(200) NOT NULL,
  FECHA datetime NOT NULL COMMENT 'FECHA DEL REGISTRO',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS NOMBRES DE LOS REPUESTOS ';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_sectores
--

DROP TABLE IF EXISTS lp2008_sectores;
CREATE TABLE lp2008_sectores (
  ID smallint(6) NOT NULL,
  PROVINCIA_ID smallint(6) NOT NULL DEFAULT '0',
  PROVINCIA_IDN int(11) NOT NULL COMMENT 'ID NUEVO DE PROVINCIA',
  MUNICIPIO_ID int(11) NOT NULL,
  SECTOR varchar(90) NOT NULL DEFAULT '',
  SECTORN varchar(90) NOT NULL,
  PUBLICADOS_BR smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_sectoresbk
--

DROP TABLE IF EXISTS lp2008_sectoresbk;
CREATE TABLE lp2008_sectoresbk (
  ID smallint(6) NOT NULL DEFAULT '0',
  PROVINCIA_ID smallint(6) NOT NULL DEFAULT '0',
  SECTOR varchar(60) NOT NULL DEFAULT '',
  PUBLICADOS_BR smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_sectoresbk1
--

DROP TABLE IF EXISTS lp2008_sectoresbk1;
CREATE TABLE lp2008_sectoresbk1 (
  ID smallint(6) NOT NULL,
  PROVINCIA_ID smallint(6) NOT NULL DEFAULT '0',
  SECTOR varchar(60) NOT NULL DEFAULT '',
  PUBLICADOS_BR smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_sectoresbkjson
--

DROP TABLE IF EXISTS lp2008_sectoresbkjson;
CREATE TABLE lp2008_sectoresbkjson (
  ID smallint(6) NOT NULL,
  PROVINCIA_ID smallint(6) NOT NULL DEFAULT '0',
  PROVINCIA_IDN int(11) NOT NULL COMMENT 'ID NUEVO DE PROVINCIA',
  SECTOR varchar(60) NOT NULL DEFAULT '',
  PUBLICADOS_BR smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_sectoresold0602
--

DROP TABLE IF EXISTS lp2008_sectoresold0602;
CREATE TABLE lp2008_sectoresold0602 (
  ID smallint(6) NOT NULL,
  PROVINCIA_ID smallint(6) NOT NULL DEFAULT '0',
  PROVINCIA_IDN int(11) NOT NULL COMMENT 'ID NUEVO DE PROVINCIA',
  MUNICIPIO_ID int(11) NOT NULL,
  SECTOR varchar(90) NOT NULL DEFAULT '',
  SECTORN varchar(90) NOT NULL,
  PUBLICADOS_BR smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_servicios
--

DROP TABLE IF EXISTS lp2008_servicios;
CREATE TABLE lp2008_servicios (
  ID mediumint(9) NOT NULL,
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  USUARIO_ID mediumint(9) NOT NULL,
  TIPO enum('E','P') NOT NULL DEFAULT 'E' COMMENT 'E - EMPRESA, P - PERSONA',
  CREADA datetime NOT NULL,
  VISITADO datetime DEFAULT NULL,
  VISITAS smallint(6) DEFAULT NULL,
  RESALTADO enum('R','N') NOT NULL DEFAULT 'N' COMMENT 'INDICA SI RESALTA O NO EL SERVICIO',
  RESHASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'HASTA CUANDO ESTARA RESALTADO',
  NOMBRE varchar(60) NOT NULL,
  LOGO enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'CONTIENE LOGO O NO',
  TELEFONO1 varchar(22) NOT NULL,
  TELEFONO2 varchar(22) NOT NULL,
  TELEFONO3 varchar(22) NOT NULL,
  BBPIN varchar(8) DEFAULT NULL,
  EMAIL varchar(100) NOT NULL,
  URL varchar(100) NOT NULL,
  URLVIDEO varchar(120) NOT NULL COMMENT 'VIDEO DEL SERVICIO',
  DIRECCION varchar(100) NOT NULL,
  SECTOR varchar(60) NOT NULL,
  PROVINCIA varchar(40) NOT NULL,
  MUNICIPIO smallint(6) NOT NULL,
  DESCRIPCION varchar(150) NOT NULL,
  CATEGORIA_ID mediumint(9) NOT NULL,
  SERVICIO varchar(50) NOT NULL,
  SERVICIO_ID smallint(6) NOT NULL,
  RATING tinyint(4) NOT NULL DEFAULT '0' COMMENT 'RATING DEL SERVICIO',
  LAT varchar(25) DEFAULT NULL COMMENT 'LATITUD COORD',
  LNG varchar(25) DEFAULT NULL COMMENT 'LONGITUD COORD',
  MAPA enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'PERMITE MOSTRAR MAPA O NO',
  IPADDRESS varchar(14) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ALMACENA NEGOCIOS O EMPRESAS QUE BRINDAS SERVICIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_servicios25-07-2012
--

DROP TABLE IF EXISTS lp2008_servicios25-07-2012;
CREATE TABLE `lp2008_servicios25-07-2012` (
  ID mediumint(9) NOT NULL,
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  USUARIO_ID mediumint(9) NOT NULL,
  CREADA datetime NOT NULL,
  VISITADO datetime NOT NULL,
  VISITAS smallint(6) NOT NULL,
  NOMBRE varchar(60) NOT NULL,
  TELEFONO1 varchar(22) NOT NULL,
  TELEFONO2 varchar(22) NOT NULL,
  TELEFONO3 varchar(22) NOT NULL,
  EMAIL varchar(100) NOT NULL,
  URL varchar(100) NOT NULL,
  DIRECCION varchar(100) NOT NULL,
  SECTOR varchar(60) NOT NULL,
  PROVINCIA varchar(40) NOT NULL,
  DESCRIPCION varchar(150) NOT NULL,
  CATEGORIA mediumint(9) NOT NULL,
  SERVICIO varchar(50) NOT NULL,
  SERVICIO_ID smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA NEGOCIOS O EMPRESAS QUE BRINDAS SERVICIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_servicios140715
--

DROP TABLE IF EXISTS lp2008_servicios140715;
CREATE TABLE lp2008_servicios140715 (
  ID mediumint(9) NOT NULL,
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  USUARIO_ID mediumint(9) NOT NULL,
  TIPO enum('E','P') NOT NULL DEFAULT 'E' COMMENT 'E - EMPRESA, P - PERSONA',
  CREADA datetime NOT NULL,
  VISITADO datetime NOT NULL,
  VISITAS smallint(6) NOT NULL,
  RESALTADO enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'INDICA SI RESALTA O NO EL SERVICIO',
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'HASTA CUANDO ESTARA RESALTADO',
  NOMBRE varchar(60) NOT NULL,
  LOGO enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'CONTIENE LOGO O NO',
  TELEFONO1 varchar(22) NOT NULL,
  TELEFONO2 varchar(22) NOT NULL,
  TELEFONO3 varchar(22) NOT NULL,
  BBPIN varchar(8) DEFAULT NULL,
  EMAIL varchar(100) NOT NULL,
  URL varchar(100) NOT NULL,
  URLVIDEO varchar(120) NOT NULL COMMENT 'VIDEO DEL SERVICIO',
  DIRECCION varchar(100) NOT NULL,
  SECTOR varchar(60) NOT NULL,
  PROVINCIA varchar(40) NOT NULL,
  DESCRIPCION varchar(150) NOT NULL,
  CATEGORIA_ID mediumint(9) NOT NULL,
  SERVICIO varchar(50) NOT NULL,
  SERVICIO_ID smallint(6) NOT NULL,
  RATING tinyint(4) NOT NULL DEFAULT '0' COMMENT 'RATING DEL SERVICIO',
  LAT varchar(25) DEFAULT NULL COMMENT 'LATITUD COORD',
  LNG varchar(25) DEFAULT NULL COMMENT 'LONGITUD COORD',
  MAPA enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'PERMITE MOSTRAR MAPA O NO',
  IPADDRESS varchar(14) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ALMACENA NEGOCIOS O EMPRESAS QUE BRINDAS SERVICIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_serviciosbk
--

DROP TABLE IF EXISTS lp2008_serviciosbk;
CREATE TABLE lp2008_serviciosbk (
  ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL,
  CREADA datetime NOT NULL,
  VISITADO datetime NOT NULL,
  VISITAS smallint(6) NOT NULL,
  NOMBRE varchar(60) NOT NULL,
  TELEFONO varchar(14) NOT NULL,
  EMAIL varchar(100) NOT NULL,
  URL varchar(100) NOT NULL,
  DIRECCION varchar(100) NOT NULL,
  SECTOR varchar(60) NOT NULL,
  PROVINCIA varchar(40) NOT NULL,
  DESCRIPCION varchar(150) NOT NULL,
  CATEGORIA mediumint(9) NOT NULL,
  SERVICIO varchar(50) NOT NULL,
  SERVICIO_ID smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA NEGOCIOS O EMPRESAS QUE BRINDAS SERVICIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_serviciosbk24-07-12
--

DROP TABLE IF EXISTS lp2008_serviciosbk24-07-12;
CREATE TABLE `lp2008_serviciosbk24-07-12` (
  ID mediumint(9) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL,
  CREADA datetime NOT NULL,
  VISITADO datetime NOT NULL,
  VISITAS smallint(6) NOT NULL,
  NOMBRE varchar(60) NOT NULL,
  TELEFONO varchar(14) NOT NULL,
  EMAIL varchar(100) NOT NULL,
  URL varchar(100) NOT NULL,
  DIRECCION varchar(100) NOT NULL,
  SECTOR varchar(60) NOT NULL,
  PROVINCIA varchar(40) NOT NULL,
  DESCRIPCION varchar(150) NOT NULL,
  CATEGORIA mediumint(9) NOT NULL,
  SERVICIO varchar(50) NOT NULL,
  SERVICIO_ID smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA NEGOCIOS O EMPRESAS QUE BRINDAS SERVICIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_servicioscat
--

DROP TABLE IF EXISTS lp2008_servicioscat;
CREATE TABLE lp2008_servicioscat (
  ID smallint(6) NOT NULL,
  CATEGORIA_ID smallint(6) NOT NULL,
  SERVICIO varchar(50) NOT NULL,
  PCLAVES varchar(50) NOT NULL COMMENT 'PALABRAS CLAVES PARA ESTA CATEGORIA DE SERVICIO',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LAS CATEGORIAS POR SERVICIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_servicioscatpclavesno
--

DROP TABLE IF EXISTS lp2008_servicioscatpclavesno;
CREATE TABLE lp2008_servicioscatpclavesno (
  ID smallint(6) NOT NULL,
  CATEGORIA_ID smallint(6) NOT NULL,
  SERVICIO varchar(50) NOT NULL,
  PCLAVES varchar(50) NOT NULL COMMENT 'PALABRAS CLAVES PARA ESTA CATEGORIA DE SERVICIO',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LAS CATEGORIAS POR SERVICIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_servicioslnk
--

DROP TABLE IF EXISTS lp2008_servicioslnk;
CREATE TABLE lp2008_servicioslnk (
  ID smallint(6) NOT NULL COMMENT 'ID DE LA TABLA SERVICIO',
  SERVICIO_ID smallint(6) NOT NULL COMMENT 'ID DEL SERVICIO O SUBCATEGORIA'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS ENLACES ENTRE LAS CATEGORIAS Y SERVICIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_serviciosold
--

DROP TABLE IF EXISTS lp2008_serviciosold;
CREATE TABLE lp2008_serviciosold (
  ID mediumint(9) NOT NULL,
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  USUARIO_ID mediumint(9) NOT NULL,
  TIPO enum('E','P') NOT NULL DEFAULT 'E' COMMENT 'E - EMPRESA, P - PERSONA',
  CREADA datetime NOT NULL,
  VISITADO datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  VISITAS smallint(6) NOT NULL DEFAULT '0',
  RESALTADO enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'INDICA SI RESALTA O NO EL SERVICIO',
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'HASTA CUANDO ESTARA RESALTADO',
  NOMBRE varchar(60) NOT NULL,
  LOGO enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'CONTIENE LOGO O NO',
  TELEFONO1 varchar(22) NOT NULL,
  TELEFONO2 varchar(22) NOT NULL,
  TELEFONO3 varchar(22) NOT NULL,
  BBPIN varchar(8) DEFAULT NULL,
  EMAIL varchar(100) NOT NULL,
  URL varchar(100) NOT NULL,
  URLVIDEO varchar(120) NOT NULL COMMENT 'VIDEO DEL SERVICIO',
  DIRECCION varchar(100) NOT NULL,
  SECTOR varchar(60) NOT NULL,
  PROVINCIA varchar(40) NOT NULL,
  DESCRIPCION varchar(150) NOT NULL,
  CATEGORIA_ID mediumint(9) NOT NULL,
  SERVICIO varchar(50) NOT NULL,
  SERVICIO_ID smallint(6) NOT NULL,
  RATING tinyint(4) NOT NULL DEFAULT '0' COMMENT 'RATING DEL SERVICIO',
  LAT varchar(25) DEFAULT NULL COMMENT 'LATITUD COORD',
  LNG varchar(25) DEFAULT NULL COMMENT 'LONGITUD COORD',
  MAPA enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'DETERMINA SI EL MAPA FUE ACTUALIZADO O NO PARA NO CAMBIAR',
  IPADDRESS varchar(14) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA NEGOCIOS O EMPRESAS QUE BRINDAS SERVICIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_serviciosrating
--

DROP TABLE IF EXISTS lp2008_serviciosrating;
CREATE TABLE lp2008_serviciosrating (
  ID tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ID DEL SERVICIO',
  VALOR tinyint(4) NOT NULL DEFAULT '0' COMMENT 'RATING DEL SERVICIO',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LOS RATINGS DE LOS SERVICIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_serviciossubir020912
--

DROP TABLE IF EXISTS lp2008_serviciossubir020912;
CREATE TABLE lp2008_serviciossubir020912 (
  ID mediumint(9) NOT NULL,
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A',
  USUARIO_ID mediumint(9) NOT NULL,
  CREADA datetime NOT NULL,
  VISITADO datetime NOT NULL,
  VISITAS smallint(6) NOT NULL,
  RESALTADO enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'INDICA SI RESALTA O NO EL SERVICIO',
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'HASTA CUANDO ESTARA RESALTADO',
  NOMBRE varchar(60) NOT NULL,
  TELEFONO1 varchar(22) NOT NULL,
  TELEFONO2 varchar(22) NOT NULL,
  TELEFONO3 varchar(22) NOT NULL,
  EMAIL varchar(100) NOT NULL,
  URL varchar(100) NOT NULL,
  DIRECCION varchar(100) NOT NULL,
  SECTOR varchar(60) NOT NULL,
  PROVINCIA varchar(40) NOT NULL,
  DESCRIPCION varchar(150) NOT NULL,
  CATEGORIA mediumint(9) NOT NULL,
  SERVICIO varchar(50) NOT NULL,
  SERVICIO_ID smallint(6) NOT NULL,
  RATING tinyint(4) NOT NULL DEFAULT '0' COMMENT 'RATING DEL SERVICIO',
  IPADDRESS varchar(14) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA NEGOCIOS O EMPRESAS QUE BRINDAS SERVICIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_sitemap
--

DROP TABLE IF EXISTS lp2008_sitemap;
CREATE TABLE lp2008_sitemap (
  ULTIMO int(11) NOT NULL DEFAULT '0',
  ORDEN smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA DATOS DE LA CREACION SITEMAP';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_sitemapindex
--

DROP TABLE IF EXISTS lp2008_sitemapindex;
CREATE TABLE lp2008_sitemapindex (
  ID smallint(6) NOT NULL,
  INICIO mediumint(9) NOT NULL,
  FINAL mediumint(9) NOT NULL,
  MODIFICADO date NOT NULL,
  CUANTOS mediumint(9) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LOS SITEMAPS GENERADOS POR EL CRON';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_solpiezas
--

DROP TABLE IF EXISTS lp2008_solpiezas;
CREATE TABLE lp2008_solpiezas (
  ID mediumint(10) NOT NULL,
  NOMBRE varchar(40) NOT NULL,
  TELEFONO1 varchar(25) NOT NULL,
  TELEFONO2 varchar(15) NOT NULL,
  EMAIL varchar(60) NOT NULL,
  PROVINCIA tinyint(4) NOT NULL COMMENT 'PROVINCIA DE LA SOLICITUD DE PIEZAS',
  MARCA varchar(20) NOT NULL,
  MODELO varchar(20) NOT NULL,
  ANIO varchar(4) NOT NULL,
  PIEZA text NOT NULL COMMENT 'DESCRIPCION DE LA PIEZA DE VEHICULO',
  SEGUIMIENTO text COMMENT 'SEGUIMIENTO DE LOS REPUESTOS ',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ESTATUS enum('S','R','C','P') NOT NULL DEFAULT 'S'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='SOLICITUDES DE PIEZAS PARA LOS VEHICULOS EN REPUESTOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_soporte
--

DROP TABLE IF EXISTS lp2008_soporte;
CREATE TABLE lp2008_soporte (
  ID int(11) NOT NULL,
  USUARIO_ID int(11) NOT NULL,
  FECHA datetime NOT NULL,
  PROCESADO datetime NOT NULL,
  AREAINTERES varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  EMAIL varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  NOMBRE varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  TELEFONO varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  ESTATUS enum('A','R','C') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A' COMMENT 'A - ACTIVO, R - RESUELTO, C - CANCELADO',
  COMENTARIO text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ALMACENA LAS SOLICITUDES DE SOPORTE';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_subcategorias
--

DROP TABLE IF EXISTS lp2008_subcategorias;
CREATE TABLE lp2008_subcategorias (
  ID smallint(6) NOT NULL,
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '0',
  SUBCATEGORIA varchar(80) NOT NULL,
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SUBCATEGORIAS DE LOS ARTICULOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_subcategorias 03-2016
--

DROP TABLE IF EXISTS lp2008_subcategorias 03-2016;
CREATE TABLE `lp2008_subcategorias 03-2016` (
  ID smallint(6) NOT NULL,
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '0',
  SUBCATEGORIA varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_subcategorias12-2014
--

DROP TABLE IF EXISTS lp2008_subcategorias12-2014;
CREATE TABLE `lp2008_subcategorias12-2014` (
  ID smallint(6) NOT NULL,
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '0',
  SUBCATEGORIA varchar(80) NOT NULL DEFAULT '',
  URL varchar(40) NOT NULL COMMENT 'CREA URL CON ESTE VALOR',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_subcategoriasnew
--

DROP TABLE IF EXISTS lp2008_subcategoriasnew;
CREATE TABLE lp2008_subcategoriasnew (
  ID smallint(6) NOT NULL,
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '0',
  SUBCATEGORIA varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_subcategoriasold19-07-17
--

DROP TABLE IF EXISTS lp2008_subcategoriasold19-07-17;
CREATE TABLE `lp2008_subcategoriasold19-07-17` (
  ID smallint(6) NOT NULL,
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '0',
  SUBCATEGORIA varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SUBCATEGORIAS DE LOS ARTICULOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_subcategoriasold210417
--

DROP TABLE IF EXISTS lp2008_subcategoriasold210417;
CREATE TABLE lp2008_subcategoriasold210417 (
  ID smallint(6) NOT NULL,
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '0',
  SUBCATEGORIA varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_subcategorias_2022
--

DROP TABLE IF EXISTS lp2008_subcategorias_2022;
CREATE TABLE lp2008_subcategorias_2022 (
  ID smallint(6) NOT NULL,
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '0',
  SUBCATEGORIA varchar(80) NOT NULL,
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SUBCATEGORIAS DE LOS ARTICULOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_subcategorias_bk
--

DROP TABLE IF EXISTS lp2008_subcategorias_bk;
CREATE TABLE lp2008_subcategorias_bk (
  ID smallint(6) NOT NULL,
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '0',
  SUBCATEGORIA varchar(80) NOT NULL DEFAULT '',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_subcategorias_bk1
--

DROP TABLE IF EXISTS lp2008_subcategorias_bk1;
CREATE TABLE lp2008_subcategorias_bk1 (
  ID smallint(6) NOT NULL,
  CATEGORIA_ID smallint(6) NOT NULL DEFAULT '0',
  SUBCATEGORIA varchar(80) NOT NULL DEFAULT '',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_subplan
--

DROP TABLE IF EXISTS lp2008_subplan;
CREATE TABLE lp2008_subplan (
  USUARIO_ID mediumint(9) NOT NULL,
  SUBCATEGORIA_ID mediumint(9) NOT NULL,
  PUBLICADOS smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='SUBCATEGORIAS POR TIENDAS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_subtienda
--

DROP TABLE IF EXISTS lp2008_subtienda;
CREATE TABLE lp2008_subtienda (
  USUARIO_ID mediumint(9) NOT NULL,
  SUBCATEGORIA_ID mediumint(9) NOT NULL,
  PUBLICADOS smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='SUBCATEGORIAS POR TIENDAS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_sugiere
--

DROP TABLE IF EXISTS lp2008_sugiere;
CREATE TABLE lp2008_sugiere (
  ARTICULO varchar(70) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA SUGERENCIAS DE BUSQUEDAS BASADAS EN TITULOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_tempcuentas
--

DROP TABLE IF EXISTS lp2008_tempcuentas;
CREATE TABLE lp2008_tempcuentas (
  TELEFONO varchar(14) CHARACTER SET utf8 NOT NULL,
  CUENTAS int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='TEMPORAL PARA CONTABILIZAR CUENTAS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_tiendasold
--

DROP TABLE IF EXISTS lp2008_tiendasold;
CREATE TABLE lp2008_tiendasold (
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  TIPO tinyint(2) NOT NULL,
  NOMBRE varchar(40) NOT NULL DEFAULT '' COMMENT 'NOMBRE DE LA TIENDA',
  PALABRAS varchar(120) NOT NULL DEFAULT '' COMMENT 'PALABRAS CLAVES A UTILIZAR',
  DESCRIPCION varchar(254) NOT NULL DEFAULT '''''' COMMENT 'DESCRIPCION DE LAS TIENDAS',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0' COMMENT 'CANTIDAD ARTICULOS PUBLICADOS',
  VISITAS smallint(6) NOT NULL DEFAULT '0',
  VISITADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='INFORMACION SOBRE LAS TIENDAS O DEALERS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_transacciones
--

DROP TABLE IF EXISTS lp2008_transacciones;
CREATE TABLE lp2008_transacciones (
  ID smallint(6) NOT NULL,
  RENOVACIONES enum('S','N') NOT NULL DEFAULT 'N',
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  OPERADOR_ID mediumint(9) DEFAULT NULL COMMENT 'OPERADOR QUE APROBO PRODUCTO',
  TIPO enum('CP','SR','RA','RAM','OP1','OP2','LP','LP+','T1','T2','T3','TA','DV1','DV2','DV3','DV4','IN1','IN2','IN3','IN4','AO') CHARACTER SET latin1 DEFAULT 'CP' COMMENT 'TIPO DE POSIBLES TRASACCIONES',
  PRODUCTO enum('LP','DEA','TIE','INM','RA','RAM','AO','CP') NOT NULL DEFAULT 'CP' COMMENT 'CAMPO TIPO TEMPORAL',
  VALOR decimal(12,2) NOT NULL DEFAULT '0.00',
  DESCUENTO float(5,2) NOT NULL DEFAULT '0.00',
  TASA float(4,2) NOT NULL DEFAULT '0.00',
  CANTIDAD tinyint(4) NOT NULL DEFAULT '0',
  BALANCE smallint(8) NOT NULL DEFAULT '0',
  FORMAPAGO enum('TB','TP','TR','MM','LPP','TU','UR','PP','PU','CK','EF','RE','PIN','IC','PC') CHARACTER SET latin1 NOT NULL DEFAULT 'EF' COMMENT 'PC = Pines cortesia',
  TRANSACCION text NOT NULL,
  ESTATUS enum('A','P','C') NOT NULL DEFAULT 'P',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PROCESADO datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ALMACENA LAS TRANSACCIONES TANTO PARA COMPRA DE PINES COMO P';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_transacciones130520
--

DROP TABLE IF EXISTS lp2008_transacciones130520;
CREATE TABLE lp2008_transacciones130520 (
  ID smallint(6) NOT NULL,
  RENOVACIONES enum('S','N') NOT NULL DEFAULT 'N',
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  TIPO enum('CP','SR','RAM','OP1','OP2','LP','LP+','T1','T2','T3','TA','DV1','DV2','DV3','DV4','IN1','IN2','IN3','IN4','AO') CHARACTER SET latin1 DEFAULT 'CP' COMMENT 'TIPO DE POSIBLES TRASACCIONES',
  PRODUCTO enum('LP','DEA','TIE','INM','RA','RAM','AO','CP') NOT NULL DEFAULT 'CP' COMMENT 'CAMPO TIPO TEMPORAL',
  VALOR decimal(12,2) NOT NULL DEFAULT '0.00',
  DESCUENTO float(5,2) NOT NULL DEFAULT '0.00',
  ITBIS float(7,2) NOT NULL DEFAULT '0.00' COMMENT 'ALMACENA ITBIS COBRADO',
  TASA float(4,2) NOT NULL DEFAULT '0.00',
  CANTIDAD tinyint(4) NOT NULL DEFAULT '0',
  BALANCE smallint(8) NOT NULL DEFAULT '0',
  FORMAPAGO enum('TB','TP','TR','MM','LPP','TU','UR','PP','PU','CK','EF','RE','PIN','IC','PC') CHARACTER SET latin1 NOT NULL DEFAULT 'EF' COMMENT 'PC = Pines cortesia',
  NCF varchar(25) DEFAULT NULL COMMENT 'NCF TRANSACCION',
  TRANSACCION text NOT NULL,
  ESTATUS enum('A','P','C') NOT NULL DEFAULT 'P',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PROCESADO datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ALMACENA LAS TRANSACCIONES TANTO PARA COMPRA DE PINES COMO P';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_transaccionesold
--

DROP TABLE IF EXISTS lp2008_transaccionesold;
CREATE TABLE lp2008_transaccionesold (
  ID smallint(6) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  TIPO enum('LP','LP+','CP','UV1','UV2','UV3','T1','T2','T3','TA') DEFAULT 'CP' COMMENT 'TIPO DE POSIBLES TRASACCIONES',
  VALOR decimal(12,2) NOT NULL DEFAULT '0.00',
  DESCUENTO float(5,2) NOT NULL DEFAULT '0.00',
  TASA float(4,2) NOT NULL DEFAULT '0.00',
  CANTIDAD tinyint(4) NOT NULL DEFAULT '0',
  BALANCE tinyint(4) NOT NULL DEFAULT '0' COMMENT 'BALANCE EN PINES AL MOMENTO',
  FORMAPAGO enum('TP','TR','MM','LPP','TU','UR','PP','PU','CK','EF','RE') NOT NULL DEFAULT 'MM',
  TRANSACCION text NOT NULL,
  ESTATUS enum('A','P','C') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'P',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PROCESADO datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'FECHA EN LA QUE SE PROCESA EL PLAN'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LAS TRANSACCIONES TANTO PARA COMPRA DE PINES COMO P';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_urls
--

DROP TABLE IF EXISTS lp2008_urls;
CREATE TABLE lp2008_urls (
  ID varchar(40) NOT NULL,
  OP varchar(4) NOT NULL,
  TIPO varchar(5) NOT NULL,
  VALOR smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS POSIBLES URL AMIGABLES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_urlsold08082016
--

DROP TABLE IF EXISTS lp2008_urlsold08082016;
CREATE TABLE lp2008_urlsold08082016 (
  ID varchar(40) NOT NULL,
  OP varchar(4) NOT NULL,
  TIPO varchar(5) NOT NULL,
  VALOR smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS POSIBLES URL AMIGABLES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_urlsold11122016
--

DROP TABLE IF EXISTS lp2008_urlsold11122016;
CREATE TABLE lp2008_urlsold11122016 (
  ID varchar(40) NOT NULL,
  OP varchar(4) NOT NULL,
  TIPO varchar(5) NOT NULL,
  VALOR smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS POSIBLES URL AMIGABLES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usuarios
--

DROP TABLE IF EXISTS lp2008_usuarios;
CREATE TABLE lp2008_usuarios (
  ID mediumint(9) NOT NULL,
  EMAIL varchar(100) NOT NULL DEFAULT '',
  EMAILVALIDO enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'DETERMINA SI EL EMAIL ES VALIDO PARA ENVIO CORREO',
  ESTATUS enum('A','I','R') NOT NULL DEFAULT 'I',
  NUEVOPASS enum('S','N') NOT NULL DEFAULT 'S',
  PASSWORD varchar(55) NOT NULL DEFAULT '',
  USUARIO varchar(35) NOT NULL DEFAULT '',
  USUPLAN enum('PB','OP1','OP2','LPE','LP','LP+','T1','T2','T3','TA','DV1','DV2','DV3','DV4','IN1','IN2','IN3','IN4') NOT NULL DEFAULT 'PB' COMMENT 'CONTIENE EL PLAN ACTUAL CONTROL LISTADOS',
  USUPLANN enum('PB','OP1','OP2','LPE','LP','LP+','TIE','DEA','INM') NOT NULL DEFAULT 'PB',
  USUHASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'HASTA VIGENCIA PLAN',
  PAGA enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'USUARIO QUE PAGA PLAN O PINES',
  FBUSUARIO varchar(50) NOT NULL COMMENT 'USUARIO DE FACEBOOK',
  FBUID bigint(20) NOT NULL COMMENT 'ID DE USUARIO EN FACEBOOK',
  FBAUTHFP enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'AUTORIZA SI MOSTRAR FOTO O NO DE PERFIL',
  TWUSUARIO varchar(25) DEFAULT NULL COMMENT 'USUARIO DE TWITTER PARA SEGUIR',
  NOMBRE varchar(45) NOT NULL DEFAULT '',
  TELEFONO1 varchar(14) DEFAULT NULL,
  DIRECCION varchar(150) NOT NULL DEFAULT '',
  TELEFONO2 varchar(14) DEFAULT NULL,
  WHATSAPP enum('S','N') NOT NULL DEFAULT 'S',
  PROVINCIA smallint(6) NOT NULL DEFAULT '0',
  MUNICIPIO smallint(6) NOT NULL,
  PAIS varchar(2) NOT NULL DEFAULT 'DO',
  SECTOR smallint(6) NOT NULL DEFAULT '1',
  NACIMIENTO date NOT NULL DEFAULT '0000-00-00',
  SEXO enum('F','M') NOT NULL DEFAULT 'M',
  TELEFONO3 varchar(25) DEFAULT NULL,
  SESSION varchar(40) NOT NULL DEFAULT '',
  CREADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ACTIVADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  FECHALOGIN datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  IPADDRESS varchar(40) NOT NULL,
  BALANCE smallint(12) NOT NULL DEFAULT '0',
  FECHABALANCE datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  REGISTRADO enum('M','P','MLPE','MNR','PNR','FP','FM','OP','KLK') NOT NULL DEFAULT 'P' COMMENT 'DETERMINA DESDE DONDE FUE EL REGISTRO, MOVIL O PC, FACEBOOK',
  PUBLICACIONES smallint(6) NOT NULL DEFAULT '0' COMMENT 'ARTICULOS PUBLICADOS',
  PUBLICACIONESRU int(11) NOT NULL DEFAULT '0' COMMENT 'RETIRADAS POR USUARIO',
  PUBLICACIONESRO int(11) NOT NULL DEFAULT '0' COMMENT 'RETIRADAS OPERADOR',
  CUENTAS mediumint(9) NOT NULL DEFAULT '1' COMMENT 'CANTIDAD DE CUENTAS CON EL MISMO NUMERO',
  RENOVOTODO datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  MENSAJES smallint(6) NOT NULL DEFAULT '0' COMMENT 'MENSAJES NUEVOS EN EL BUZON',
  FAVORITOS smallint(6) NOT NULL DEFAULT '0' COMMENT 'CANTDAD FAVORITOS',
  RECIBIR enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'FLAG PARA RECIBIR EMAIL DE OTROS USUARIOS',
  PLANTILLA enum('S','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='TABLA QUE CONTIENE DATOS DE USUARIOS TANTO TIENDAS COMO OTRO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usuarios02020421
--

DROP TABLE IF EXISTS lp2008_usuarios02020421;
CREATE TABLE lp2008_usuarios02020421 (
  ID mediumint(9) NOT NULL,
  EMAIL varchar(100) NOT NULL DEFAULT '',
  EMAILVALIDO enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'DETERMINA SI EL EMAIL ES VALIDO PARA ENVIO CORREO',
  ESTATUS enum('A','I','R') NOT NULL DEFAULT 'I',
  NUEVOPASS enum('S','N') NOT NULL DEFAULT 'S',
  PASSWORD varchar(55) NOT NULL DEFAULT '',
  USUARIO varchar(35) NOT NULL DEFAULT '',
  USUPLAN enum('PB','OP1','OP2','LPE','LP','LP+','T1','T2','T3','TA','DV1','DV2','DV3','DV4','IN1','IN2','IN3','IN4') NOT NULL DEFAULT 'PB' COMMENT 'CONTIENE EL PLAN ACTUAL CONTROL LISTADOS',
  USUPLANN enum('PB','OP1','OP2','LPE','LP','LP+','TIE','DEA','INM') NOT NULL DEFAULT 'PB',
  USUHASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'HASTA VIGENCIA PLAN',
  PAGA enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'USUARIO QUE PAGA PLAN O PINES',
  FBUSUARIO varchar(50) NOT NULL COMMENT 'USUARIO DE FACEBOOK',
  FBUID bigint(20) NOT NULL COMMENT 'ID DE USUARIO EN FACEBOOK',
  FBAUTHFP enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'AUTORIZA SI MOSTRAR FOTO O NO DE PERFIL',
  TWUSUARIO varchar(25) DEFAULT NULL COMMENT 'USUARIO DE TWITTER PARA SEGUIR',
  NOMBRE varchar(45) NOT NULL DEFAULT '',
  TELEFONO1 varchar(14) DEFAULT NULL,
  DIRECCION varchar(150) NOT NULL DEFAULT '',
  TELEFONO2 varchar(14) DEFAULT NULL,
  WHATSAPP enum('S','N') NOT NULL DEFAULT 'S',
  PROVINCIA smallint(6) NOT NULL DEFAULT '0',
  MUNICIPIO smallint(6) NOT NULL,
  PAIS varchar(2) NOT NULL DEFAULT 'DO',
  SECTOR smallint(6) NOT NULL DEFAULT '1',
  NACIMIENTO date NOT NULL DEFAULT '0000-00-00',
  SEXO enum('F','M') NOT NULL DEFAULT 'M',
  TELEFONO3 varchar(25) DEFAULT NULL,
  SESSION varchar(40) NOT NULL DEFAULT '',
  CREADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ACTIVADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  FECHALOGIN datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  IPADDRESS varchar(40) NOT NULL,
  BALANCE smallint(12) NOT NULL DEFAULT '0',
  FECHABALANCE datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  REGISTRADO enum('M','P','MLPE','MNR','PNR','FP','FM','OP','KLK') NOT NULL DEFAULT 'P' COMMENT 'DETERMINA DESDE DONDE FUE EL REGISTRO, MOVIL O PC, FACEBOOK',
  PUBLICACIONES smallint(6) NOT NULL DEFAULT '0' COMMENT 'ARTICULOS PUBLICADOS',
  PUBLICACIONESRU int(11) NOT NULL DEFAULT '0' COMMENT 'RETIRADAS POR USUARIO',
  PUBLICACIONESRO int(11) NOT NULL DEFAULT '0' COMMENT 'RETIRADAS OPERADOR',
  CUENTAS mediumint(9) NOT NULL DEFAULT '1' COMMENT 'CANTIDAD DE CUENTAS CON EL MISMO NUMERO',
  RENOVOTODO datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  RECIBIR enum('S','N') NOT NULL DEFAULT 'S',
  PLANTILLA enum('S','N') NOT NULL DEFAULT 'N',
  MENSAJES smallint(6) NOT NULL DEFAULT '0' COMMENT 'MENSAJES NUEVOS EN EL BUZON',
  FAVORITOS smallint(6) NOT NULL DEFAULT '0' COMMENT 'CANTDAD FAVORITOS'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='TABLA QUE CONTIENE DATOS DE USUARIOS TANTO TIENDAS COMO OTRO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usuarios180218
--

DROP TABLE IF EXISTS lp2008_usuarios180218;
CREATE TABLE lp2008_usuarios180218 (
  ID mediumint(9) NOT NULL,
  EMAIL varchar(100) NOT NULL DEFAULT '',
  ESTATUS enum('A','I','R') NOT NULL DEFAULT 'I',
  PASSWORD varchar(55) NOT NULL DEFAULT '',
  USUARIO varchar(35) NOT NULL DEFAULT '',
  USUPLAN enum('PB','OP1','OP2','LPE','LP','LP+','T1','T2','T3','TA','DV1','DV2','DV3','DV4','IN1','IN2','IN3','IN4') NOT NULL DEFAULT 'PB' COMMENT 'CONTIENE EL PLAN ACTUAL CONTROL LISTADOS',
  USUHASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'HASTA VIGENCIA PLAN',
  PAGA enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'USUARIO QUE PAGA PLAN O PINES',
  FBUSUARIO varchar(50) NOT NULL COMMENT 'USUARIO DE FACEBOOK',
  FBUID bigint(20) NOT NULL COMMENT 'ID DE USUARIO EN FACEBOOK',
  FBAUTHFP enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'AUTORIZA SI MOSTRAR FOTO O NO DE PERFIL',
  TWUSUARIO varchar(25) DEFAULT NULL COMMENT 'USUARIO DE TWITTER PARA SEGUIR',
  NOMBRE varchar(45) NOT NULL DEFAULT '',
  APELLIDOS varchar(20) NOT NULL DEFAULT '',
  NOMBRES varchar(20) NOT NULL DEFAULT '',
  SHOWNOM enum('S','N') NOT NULL DEFAULT 'S',
  TELEFONO1 varchar(14) DEFAULT NULL,
  TIPOTEL1 tinyint(2) NOT NULL DEFAULT '5' COMMENT 'TIPO DE TELEFONO, FIJO, MOVIL Y CIA',
  DIRECCION varchar(150) NOT NULL DEFAULT '',
  TIPOTEL2 tinyint(2) NOT NULL DEFAULT '5' COMMENT 'TIPO DE TELEFONO, FIJO, MOVIL Y CIA',
  TELEFONO2 varchar(14) DEFAULT NULL,
  WHATSAPP enum('S','N') NOT NULL DEFAULT 'S',
  SHOWTE2 enum('S','N') NOT NULL DEFAULT 'S',
  PROVINCIA smallint(6) NOT NULL DEFAULT '0',
  MUNICIPIO smallint(6) NOT NULL,
  PAIS varchar(2) NOT NULL DEFAULT 'DO',
  SECTOR smallint(6) NOT NULL DEFAULT '1',
  NACIMIENTO date NOT NULL DEFAULT '0000-00-00',
  SEXO enum('F','M') NOT NULL DEFAULT 'M',
  NUMCASA varchar(10) NOT NULL DEFAULT '',
  TELEFONO3 varchar(25) DEFAULT NULL,
  SESSION varchar(40) NOT NULL DEFAULT '',
  CREADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ACTIVADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  FECHALOGIN datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  IPADDRESS varchar(25) NOT NULL,
  BALANCE smallint(12) NOT NULL DEFAULT '0',
  FECHABALANCE datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  REGISTRADO enum('M','P','MLPE','MNR','PNR','FP','FM') NOT NULL DEFAULT 'P' COMMENT 'DETERMINA DESDE DONDE FUE EL REGISTRO, MOVIL O PC, FACEBOOK',
  PUBLICACIONES smallint(6) NOT NULL DEFAULT '0' COMMENT 'ARTICULOS PUBLICADOS',
  MENSAJES smallint(6) NOT NULL DEFAULT '0' COMMENT 'MENSAJES NUEVOS EN EL BUZON',
  FAVORITOS smallint(6) NOT NULL DEFAULT '0' COMMENT 'CANTDAD FAVORITOS',
  PAYPAL enum('A','I','N') NOT NULL DEFAULT 'N',
  RECIBIR enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'FLAG PARA RECIBIR EMAIL DE OTROS USUARIOS',
  EMAILPAYPAL varchar(100) NOT NULL DEFAULT '',
  NOMBREPAYPAL varchar(60) NOT NULL DEFAULT '',
  REFIERE1 varchar(100) NOT NULL DEFAULT '',
  REFIERE2 varchar(100) NOT NULL DEFAULT '',
  REFIERE3 varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='TABLA QUE CONTIENE DATOS DE USUARIOS TANTO TIENDAS COMO OTRO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usuarios190712
--

DROP TABLE IF EXISTS lp2008_usuarios190712;
CREATE TABLE lp2008_usuarios190712 (
  ID mediumint(9) NOT NULL,
  EMAIL varchar(100) NOT NULL DEFAULT '',
  ESTATUS enum('A','I','R') NOT NULL DEFAULT 'I',
  PASSWORD varchar(55) NOT NULL DEFAULT '',
  USUARIO varchar(25) NOT NULL DEFAULT '',
  NOMBRE varchar(45) NOT NULL DEFAULT '',
  APELLIDOS varchar(20) NOT NULL DEFAULT '',
  NOMBRES varchar(20) NOT NULL DEFAULT '',
  SHOWNOM enum('S','N') NOT NULL DEFAULT 'S',
  TELEFONO1 varchar(14) DEFAULT NULL,
  SHOWTE1 enum('S','N') NOT NULL DEFAULT 'S',
  DIRECCION varchar(150) NOT NULL DEFAULT '',
  SHOWDIR enum('S','N') NOT NULL DEFAULT 'S',
  TELEFONO2 varchar(14) DEFAULT NULL,
  SHOWTE2 enum('S','N') NOT NULL DEFAULT 'S',
  PROVINCIA smallint(6) NOT NULL DEFAULT '0',
  PAIS varchar(2) NOT NULL DEFAULT 'DO',
  SECTOR smallint(6) NOT NULL DEFAULT '1',
  NACIMIENTO date NOT NULL DEFAULT '0000-00-00',
  SEXO enum('F','M') NOT NULL DEFAULT 'M',
  NUMCASA varchar(10) NOT NULL DEFAULT '',
  TELEFONO3 varchar(25) DEFAULT NULL,
  TELEEXT varchar(4) DEFAULT NULL,
  SHOWTE3 enum('S','N') NOT NULL DEFAULT 'S',
  BBPIN varchar(8) DEFAULT NULL COMMENT 'BB PIN PARA LAS BLACKBERRY',
  SESSION varchar(40) NOT NULL DEFAULT '',
  CREADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ACTIVADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  FECHALOGIN datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  IPADDRESS varchar(15) NOT NULL,
  BALANCE smallint(12) NOT NULL DEFAULT '0',
  FECHABALANCE datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  REGISTRADO enum('M','P','FP','FM') NOT NULL DEFAULT 'P' COMMENT 'DETERMINA DESDE DONDE FUE EL REGISTRO, MOVIL O PC, FACEBOOK',
  PAYPAL enum('A','I','N') NOT NULL DEFAULT 'N',
  RECIBIR enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'FLAG PARA RECIBIR EMAIL DE OTROS USUARIOS',
  EMAILPAYPAL varchar(100) NOT NULL DEFAULT '',
  NOMBREPAYPAL varchar(60) NOT NULL DEFAULT '',
  REFIERE1 varchar(100) NOT NULL DEFAULT '',
  REFIERE2 varchar(100) NOT NULL DEFAULT '',
  REFIERE3 varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='TABLA QUE CONTIENE DATOS DE USUARIOS TANTO TIENDAS COMO OTRO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usuarios200912
--

DROP TABLE IF EXISTS lp2008_usuarios200912;
CREATE TABLE lp2008_usuarios200912 (
  ID mediumint(9) NOT NULL,
  EMAIL varchar(100) NOT NULL DEFAULT '',
  ESTATUS enum('A','I','R') NOT NULL DEFAULT 'I',
  PASSWORD varchar(55) NOT NULL DEFAULT '',
  USUARIO varchar(25) NOT NULL DEFAULT '',
  NOMBRE varchar(45) NOT NULL DEFAULT '',
  APELLIDOS varchar(20) NOT NULL DEFAULT '',
  NOMBRES varchar(20) NOT NULL DEFAULT '',
  SHOWNOM enum('S','N') NOT NULL DEFAULT 'S',
  TELEFONO1 varchar(14) DEFAULT NULL,
  SHOWTE1 enum('S','N') NOT NULL DEFAULT 'S',
  DIRECCION varchar(150) NOT NULL DEFAULT '',
  SHOWDIR enum('S','N') NOT NULL DEFAULT 'S',
  TELEFONO2 varchar(14) DEFAULT NULL,
  SHOWTE2 enum('S','N') NOT NULL DEFAULT 'S',
  PROVINCIA smallint(6) NOT NULL DEFAULT '0',
  PAIS varchar(2) NOT NULL DEFAULT 'DO',
  SECTOR smallint(6) NOT NULL DEFAULT '1',
  NACIMIENTO date NOT NULL DEFAULT '0000-00-00',
  SEXO enum('F','M') NOT NULL DEFAULT 'M',
  NUMCASA varchar(10) NOT NULL DEFAULT '',
  TELEFONO3 varchar(25) DEFAULT NULL,
  TELEEXT varchar(4) DEFAULT NULL,
  SHOWTE3 enum('S','N') NOT NULL DEFAULT 'S',
  BBPIN varchar(8) DEFAULT NULL COMMENT 'BB PIN PARA LAS BLACKBERRY',
  SESSION varchar(40) NOT NULL DEFAULT '',
  CREADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ACTIVADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  FECHALOGIN datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  IPADDRESS varchar(15) NOT NULL,
  BALANCE smallint(12) NOT NULL DEFAULT '0',
  FECHABALANCE datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  REGISTRADO enum('M','P','FP','FM') NOT NULL DEFAULT 'P' COMMENT 'DETERMINA DESDE DONDE FUE EL REGISTRO, MOVIL O PC, FACEBOOK',
  PAYPAL enum('A','I','N') NOT NULL DEFAULT 'N',
  RECIBIR enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'FLAG PARA RECIBIR EMAIL DE OTROS USUARIOS',
  EMAILPAYPAL varchar(100) NOT NULL DEFAULT '',
  NOMBREPAYPAL varchar(60) NOT NULL DEFAULT '',
  REFIERE1 varchar(100) NOT NULL DEFAULT '',
  REFIERE2 varchar(100) NOT NULL DEFAULT '',
  REFIERE3 varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='TABLA QUE CONTIENE DATOS DE USUARIOS TANTO TIENDAS COMO OTRO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usuariosbk0112
--

DROP TABLE IF EXISTS lp2008_usuariosbk0112;
CREATE TABLE lp2008_usuariosbk0112 (
  ID mediumint(9) NOT NULL,
  EMAIL varchar(100) NOT NULL DEFAULT '',
  EMAILVALIDO enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'DETERMINA SI EL EMAIL ES VALIDO PARA ENVIO CORREO',
  ESTATUS enum('A','I','R') NOT NULL DEFAULT 'I',
  NUEVOPASS enum('S','N') NOT NULL DEFAULT 'S',
  PASSWORD varchar(55) NOT NULL DEFAULT '',
  USUARIO varchar(35) NOT NULL DEFAULT '',
  USUPLAN enum('PB','OP1','OP2','LPE','LP','LP+','T1','T2','T3','TA','DV1','DV2','DV3','DV4','IN1','IN2','IN3','IN4') NOT NULL DEFAULT 'PB' COMMENT 'CONTIENE EL PLAN ACTUAL CONTROL LISTADOS',
  USUPLANN enum('PB','OP1','OP2','LPE','LP','TIE','DEA','INM') NOT NULL DEFAULT 'PB',
  USUHASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'HASTA VIGENCIA PLAN',
  PAGA enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'USUARIO QUE PAGA PLAN O PINES',
  FBUSUARIO varchar(50) NOT NULL COMMENT 'USUARIO DE FACEBOOK',
  FBUID bigint(20) NOT NULL COMMENT 'ID DE USUARIO EN FACEBOOK',
  FBAUTHFP enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'AUTORIZA SI MOSTRAR FOTO O NO DE PERFIL',
  TWUSUARIO varchar(25) DEFAULT NULL COMMENT 'USUARIO DE TWITTER PARA SEGUIR',
  NOMBRE varchar(45) NOT NULL DEFAULT '',
  TELEFONO1 varchar(14) DEFAULT NULL,
  DIRECCION varchar(150) NOT NULL DEFAULT '',
  TELEFONO2 varchar(14) DEFAULT NULL,
  WHATSAPP enum('S','N') NOT NULL DEFAULT 'S',
  PROVINCIA smallint(6) NOT NULL DEFAULT '0',
  MUNICIPIO smallint(6) NOT NULL,
  PAIS varchar(2) NOT NULL DEFAULT 'DO',
  SECTOR smallint(6) NOT NULL DEFAULT '1',
  NACIMIENTO date NOT NULL DEFAULT '0000-00-00',
  SEXO enum('F','M','ND') NOT NULL DEFAULT 'ND',
  TELEFONO3 varchar(25) DEFAULT NULL,
  SESSION varchar(40) NOT NULL DEFAULT '',
  CREADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ACTIVADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  FECHALOGIN datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  IPADDRESS varchar(40) NOT NULL,
  BALANCE smallint(12) NOT NULL DEFAULT '0',
  FECHABALANCE datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  REGISTRADO enum('M','P','MLPE','MNR','PNR','FP','FM','OP','KLK') NOT NULL DEFAULT 'P' COMMENT 'DETERMINA DESDE DONDE FUE EL REGISTRO, MOVIL O PC, FACEBOOK',
  PUBLICACIONES smallint(6) NOT NULL DEFAULT '0' COMMENT 'ARTICULOS PUBLICADOS',
  PUBLICACIONESRU int(11) NOT NULL DEFAULT '0' COMMENT 'RETIRADAS POR USUARIO',
  PUBLICACIONESRO int(11) NOT NULL DEFAULT '0' COMMENT 'RETIRADAS OPERADOR',
  CUENTAS mediumint(9) NOT NULL DEFAULT '1' COMMENT 'CANTIDAD DE CUENTAS CON EL MISMO NUMERO',
  RENOVOTODO datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  MENSAJES smallint(6) NOT NULL DEFAULT '0' COMMENT 'MENSAJES NUEVOS EN EL BUZON',
  FAVORITOS smallint(6) NOT NULL DEFAULT '0' COMMENT 'CANTDAD FAVORITOS',
  RECIBIR enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'FLAG PARA RECIBIR EMAIL DE OTROS USUARIOS',
  PLANTILLA enum('S','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='TABLA QUE CONTIENE DATOS DE USUARIOS TANTO TIENDAS COMO OTRO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usuariosold
--

DROP TABLE IF EXISTS lp2008_usuariosold;
CREATE TABLE lp2008_usuariosold (
  ID mediumint(9) NOT NULL,
  EMAIL varchar(100) NOT NULL DEFAULT '',
  ESTATUS enum('A','I','R') NOT NULL DEFAULT 'I',
  PASSWORD varchar(55) NOT NULL DEFAULT '',
  USUARIO varchar(25) NOT NULL DEFAULT '',
  NOMBRE varchar(45) NOT NULL DEFAULT '',
  APELLIDOS varchar(20) NOT NULL DEFAULT '',
  NOMBRES varchar(20) NOT NULL DEFAULT '',
  SHOWNOM enum('S','N') NOT NULL DEFAULT 'N',
  TELEFONO1 varchar(14) DEFAULT NULL,
  SHOWTE1 enum('S','N') NOT NULL DEFAULT 'N',
  DIRECCION varchar(150) NOT NULL DEFAULT '',
  SHOWDIR enum('S','N') NOT NULL DEFAULT 'N',
  TELEFONO2 varchar(14) DEFAULT NULL,
  SHOWTE2 enum('S','N') NOT NULL DEFAULT 'N',
  PROVINCIA smallint(6) NOT NULL DEFAULT '0',
  PAIS varchar(2) NOT NULL DEFAULT 'DO',
  SECTOR smallint(6) NOT NULL DEFAULT '1',
  NACIMIENTO date NOT NULL DEFAULT '0000-00-00',
  SEXO enum('F','M') NOT NULL DEFAULT 'M',
  NUMCASA varchar(10) NOT NULL DEFAULT '',
  TELEFONO3 varchar(25) DEFAULT NULL,
  TELEEXT varchar(4) DEFAULT NULL,
  SHOWTE3 enum('S','N') NOT NULL DEFAULT 'N',
  BBPIN varchar(8) DEFAULT NULL COMMENT 'BB PIN PARA LAS BLACKBERRY',
  SESSION varchar(40) NOT NULL DEFAULT '',
  CREADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ACTIVADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  FECHALOGIN datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  IPADDRESS varchar(15) NOT NULL,
  BALANCE smallint(12) NOT NULL DEFAULT '1',
  FECHABALANCE datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  REGISTRADO enum('M','P') NOT NULL DEFAULT 'P' COMMENT 'DETERMINA DESDE DONDE FUE EL REGISTRO, MOVIL O PC',
  PAYPAL enum('A','I','N') NOT NULL DEFAULT 'N',
  RECIBIR enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'FLAG PARA RECIBIR EMAIL DE OTROS USUARIOS',
  EMAILPAYPAL varchar(100) NOT NULL DEFAULT '',
  NOMBREPAYPAL varchar(60) NOT NULL DEFAULT '',
  REFIERE1 varchar(100) NOT NULL DEFAULT '',
  REFIERE2 varchar(100) NOT NULL DEFAULT '',
  REFIERE3 varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='TABLA QUE CONTIENE DATOS DE USUARIOS TANTO TIENDAS COMO OTRO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usuariosold0202
--

DROP TABLE IF EXISTS lp2008_usuariosold0202;
CREATE TABLE lp2008_usuariosold0202 (
  ID mediumint(9) NOT NULL,
  EMAIL varchar(100) NOT NULL DEFAULT '',
  ESTATUS enum('A','I','R') NOT NULL DEFAULT 'I',
  PASSWORD varchar(55) NOT NULL DEFAULT '',
  USUARIO varchar(25) NOT NULL DEFAULT '',
  USUPLAN enum('PB','OP1','OP2','LPE','LP','LP+','T1','T2','T3','TA','DV1','DV2','DV3','DV4','IN1','IN2','IN3','IN4') NOT NULL DEFAULT 'PB' COMMENT 'CONTIENE EL PLAN ACTUAL CONTROL LISTADOS',
  USUHASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'HASTA VIGENCIA PLAN',
  FBUSUARIO varchar(50) NOT NULL COMMENT 'USUARIO DE FACEBOOK',
  FBUID bigint(20) NOT NULL COMMENT 'ID DE USUARIO EN FACEBOOK',
  FBAUTHFP enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'AUTORIZA SI MOSTRAR FOTO O NO DE PERFIL',
  TWUSUARIO varchar(25) DEFAULT NULL COMMENT 'USUARIO DE TWITTER PARA SEGUIR',
  NOMBRE varchar(45) NOT NULL DEFAULT '',
  TELEFONO1 varchar(14) DEFAULT NULL,
  DIRECCION varchar(150) NOT NULL DEFAULT '',
  TELEFONO2 varchar(14) DEFAULT NULL,
  WHATSAPP enum('S','N') NOT NULL DEFAULT 'S',
  PROVINCIA smallint(6) NOT NULL DEFAULT '0',
  MUNICIPIO smallint(6) NOT NULL,
  SECTOR smallint(6) NOT NULL DEFAULT '1',
  NACIMIENTO date NOT NULL DEFAULT '0000-00-00',
  SEXO enum('F','M') NOT NULL DEFAULT 'M',
  NUMCASA varchar(10) NOT NULL DEFAULT '',
  TELEFONO3 varchar(25) DEFAULT NULL,
  SESSION varchar(40) NOT NULL DEFAULT '',
  CREADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ACTIVADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  FECHALOGIN datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  IPADDRESS varchar(15) NOT NULL,
  BALANCE smallint(12) NOT NULL DEFAULT '0',
  FECHABALANCE datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  REGISTRADO enum('M','P','MLPE','MNR','PNR','FP','FM') NOT NULL DEFAULT 'P' COMMENT 'DETERMINA DESDE DONDE FUE EL REGISTRO, MOVIL O PC, FACEBOOK',
  PUBLICACIONES smallint(6) NOT NULL DEFAULT '0' COMMENT 'ARTICULOS PUBLICADOS',
  MENSAJES smallint(6) NOT NULL DEFAULT '0' COMMENT 'MENSAJES NUEVOS EN EL BUZON',
  FAVORITOS smallint(6) NOT NULL DEFAULT '0' COMMENT 'CANTDAD FAVORITOS',
  PAYPAL enum('A','I','N') NOT NULL DEFAULT 'N',
  RECIBIR enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'FLAG PARA RECIBIR EMAIL DE OTROS USUARIOS',
  EMAILPAYPAL varchar(100) NOT NULL DEFAULT '',
  NOMBREPAYPAL varchar(60) NOT NULL DEFAULT '',
  REFIERE1 varchar(100) NOT NULL DEFAULT '',
  REFIERE2 varchar(100) NOT NULL DEFAULT '',
  REFIERE3 varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='TABLA QUE CONTIENE DATOS DE USUARIOS TANTO TIENDAS COMO OTRO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usuariosold021216
--

DROP TABLE IF EXISTS lp2008_usuariosold021216;
CREATE TABLE lp2008_usuariosold021216 (
  ID mediumint(9) NOT NULL,
  EMAIL varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  ESTATUS enum('A','I','R') CHARACTER SET utf8 NOT NULL DEFAULT 'I',
  PASSWORD varchar(55) CHARACTER SET utf8 NOT NULL DEFAULT '',
  USUARIO varchar(25) CHARACTER SET utf8 NOT NULL DEFAULT '',
  USUPLAN enum('PB','OP1','OP2','LPE','LP','LP+','T1','T2','T3','TA','DV1','DV2','DV3','DV4','IN1','IN2','IN3','IN4') CHARACTER SET utf8 NOT NULL DEFAULT 'PB' COMMENT 'CONTIENE EL PLAN ACTUAL CONTROL LISTADOS',
  USUHASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'HASTA VIGENCIA PLAN',
  FBUSUARIO varchar(50) CHARACTER SET utf8 NOT NULL COMMENT 'USUARIO DE FACEBOOK',
  FBUID bigint(20) NOT NULL COMMENT 'ID DE USUARIO EN FACEBOOK',
  FBAUTHFP enum('S','N') CHARACTER SET utf8 NOT NULL DEFAULT 'S' COMMENT 'AUTORIZA SI MOSTRAR FOTO O NO DE PERFIL',
  TWUSUARIO varchar(25) CHARACTER SET utf8 DEFAULT NULL COMMENT 'USUARIO DE TWITTER PARA SEGUIR',
  NOMBRE varchar(45) CHARACTER SET utf8 NOT NULL DEFAULT '',
  APELLIDOS varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  NOMBRES varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  SHOWNOM enum('S','N') CHARACTER SET utf8 NOT NULL DEFAULT 'S',
  TELEFONO1 varchar(14) CHARACTER SET utf8 DEFAULT NULL,
  TIPOTEL1 tinyint(2) NOT NULL DEFAULT '5' COMMENT 'TIPO DE TELEFONO, FIJO, MOVIL Y CIA',
  DIRECCION varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  TIPOTEL2 tinyint(2) NOT NULL DEFAULT '5' COMMENT 'TIPO DE TELEFONO, FIJO, MOVIL Y CIA',
  TELEFONO2 varchar(14) CHARACTER SET utf8 DEFAULT NULL,
  WHATSAPP enum('S','N') CHARACTER SET utf8 NOT NULL DEFAULT 'S',
  SHOWTE2 enum('S','N') CHARACTER SET utf8 NOT NULL DEFAULT 'S',
  PROVINCIA smallint(6) NOT NULL DEFAULT '0',
  MUNICIPIO smallint(6) NOT NULL DEFAULT '0',
  PAIS varchar(2) CHARACTER SET utf8 NOT NULL DEFAULT 'DO',
  SECTOR smallint(6) NOT NULL DEFAULT '1',
  NACIMIENTO date NOT NULL DEFAULT '0000-00-00',
  SEXO enum('F','M') CHARACTER SET utf8 NOT NULL DEFAULT 'M',
  NUMCASA varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '',
  TELEFONO3 varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  TELEEXT varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  TIPOTEL3 tinyint(2) NOT NULL DEFAULT '5' COMMENT 'TIPO DE TELEFONO, FIJO, MOVIL Y CIA',
  BBPIN varchar(8) CHARACTER SET utf8 DEFAULT NULL COMMENT 'BB PIN PARA LAS BLACKBERRY',
  SESSION varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  CREADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ACTIVADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  FECHALOGIN datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  IPADDRESS varchar(15) CHARACTER SET utf8 NOT NULL,
  BALANCE smallint(12) NOT NULL DEFAULT '0',
  FECHABALANCE datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  REGISTRADO enum('M','P','MLPE','MNR','PNR','FP','FM') CHARACTER SET utf8 NOT NULL DEFAULT 'P' COMMENT 'DETERMINA DESDE DONDE FUE EL REGISTRO, MOVIL O PC, FACEBOOK',
  PUBLICACIONES smallint(6) NOT NULL DEFAULT '0' COMMENT 'ARTICULOS PUBLICADOS',
  MENSAJES smallint(6) NOT NULL DEFAULT '0' COMMENT 'MENSAJES NUEVOS EN EL BUZON',
  FAVORITOS smallint(6) NOT NULL DEFAULT '0' COMMENT 'CANTDAD FAVORITOS',
  PAYPAL enum('A','I','N') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  RECIBIR enum('S','N') CHARACTER SET utf8 NOT NULL DEFAULT 'S' COMMENT 'FLAG PARA RECIBIR EMAIL DE OTROS USUARIOS',
  EMAILPAYPAL varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  NOMBREPAYPAL varchar(60) CHARACTER SET utf8 NOT NULL DEFAULT '',
  REFIERE1 varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  REFIERE2 varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  REFIERE3 varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='TABLA QUE CONTIENE DATOS DE USUARIOS TANTO TIENDAS COMO OTRO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usuariosold110516
--

DROP TABLE IF EXISTS lp2008_usuariosold110516;
CREATE TABLE lp2008_usuariosold110516 (
  ID mediumint(9) NOT NULL,
  EMAIL varchar(100) NOT NULL DEFAULT '',
  ESTATUS enum('A','I','R') NOT NULL DEFAULT 'I',
  PASSWORD varchar(55) NOT NULL DEFAULT '',
  USUARIO varchar(25) NOT NULL DEFAULT '',
  USUPLAN enum('PB','OP1','OP2','LPE','LP','LP+','T1','T2','T3','TA','DV1','DV2','DV3','DV4','IN1','IN2','IN3','IN4') NOT NULL DEFAULT 'PB' COMMENT 'CONTIENE EL PLAN ACTUAL CONTROL LISTADOS',
  USUHASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'HASTA VIGENCIA PLAN',
  FBUSUARIO varchar(50) DEFAULT NULL COMMENT 'USUARIO DE FACEBOOK',
  FBUID bigint(20) NOT NULL DEFAULT '0' COMMENT 'ID DE USUARIO EN FACEBOOK',
  FBAUTHFP enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'AUTORIZA SI MOSTRAR FOTO O NO DE PERFIL',
  TWUSUARIO varchar(25) DEFAULT NULL COMMENT 'USUARIO DE TWITTER PARA SEGUIR',
  NOMBRE varchar(45) NOT NULL DEFAULT '',
  APELLIDOS varchar(20) NOT NULL DEFAULT '',
  NOMBRES varchar(20) NOT NULL DEFAULT '',
  SHOWNOM enum('S','N') NOT NULL DEFAULT 'S',
  TELEFONO1 varchar(14) DEFAULT NULL,
  TIPOTEL1 tinyint(2) DEFAULT '5' COMMENT 'TIPO DE TELEFONO, FIJO, MOVIL Y CIA',
  DIRECCION varchar(150) NOT NULL DEFAULT '',
  TIPOTEL2 tinyint(2) DEFAULT '5' COMMENT 'TIPO DE TELEFONO, FIJO, MOVIL Y CIA',
  TELEFONO2 varchar(14) DEFAULT NULL,
  WHATSAPP enum('S','N') NOT NULL DEFAULT 'S',
  PROVINCIA smallint(6) NOT NULL DEFAULT '0',
  PAIS varchar(2) NOT NULL DEFAULT 'DO',
  SECTOR smallint(6) NOT NULL DEFAULT '1',
  NACIMIENTO date NOT NULL DEFAULT '0000-00-00',
  SEXO enum('F','M') NOT NULL DEFAULT 'M',
  NUMCASA varchar(10) NOT NULL DEFAULT '',
  TELEFONO3 varchar(25) DEFAULT NULL,
  TELEEXT varchar(4) DEFAULT NULL,
  TIPOTEL3 tinyint(2) DEFAULT '5' COMMENT 'TIPO DE TELEFONO, FIJO, MOVIL Y CIA',
  BBPIN varchar(8) DEFAULT NULL COMMENT 'BB PIN PARA LAS BLACKBERRY',
  SESSION varchar(40) NOT NULL DEFAULT '',
  CREADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ACTIVADA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  FECHALOGIN datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  IPADDRESS varchar(15) NOT NULL,
  BALANCE smallint(12) NOT NULL DEFAULT '0',
  FECHABALANCE datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  REGISTRADO enum('M','P','MLPE','MNR','PNR','FP','FM') NOT NULL DEFAULT 'P' COMMENT 'DETERMINA DESDE DONDE FUE EL REGISTRO, MOVIL O PC, FACEBOOK',
  PUBLICACIONES smallint(6) NOT NULL DEFAULT '0' COMMENT 'ARTICULOS PUBLICADOS',
  MENSAJES smallint(6) NOT NULL DEFAULT '0' COMMENT 'MENSAJES NUEVOS EN EL BUZON',
  FAVORITOS smallint(6) NOT NULL DEFAULT '0' COMMENT 'CANTDAD FAVORITOS',
  PAYPAL enum('A','I','N') NOT NULL DEFAULT 'N',
  RECIBIR enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'FLAG PARA RECIBIR EMAIL DE OTROS USUARIOS',
  EMAILPAYPAL varchar(100) NOT NULL DEFAULT '',
  NOMBREPAYPAL varchar(60) NOT NULL DEFAULT '',
  REFIERE1 varchar(100) NOT NULL DEFAULT '',
  REFIERE2 varchar(100) NOT NULL DEFAULT '',
  REFIERE3 varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='TABLA QUE CONTIENE DATOS DE USUARIOS TANTO TIENDAS COMO OTRO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usubusca
--

DROP TABLE IF EXISTS lp2008_usubusca;
CREATE TABLE lp2008_usubusca (
  ID smallint(6) NOT NULL,
  USUARIO varchar(70) NOT NULL DEFAULT '',
  NOMBRE varchar(40) NOT NULL DEFAULT '',
  TELEFONO varchar(15) NOT NULL,
  CELULAR varchar(15) DEFAULT NULL,
  EMAIL varchar(60) NOT NULL DEFAULT '',
  CATEGORIA smallint(6) NOT NULL DEFAULT '0',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  COMENTARIO text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA BUSQUEDAS DE USUARIOS PARA CONSEGUIR';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usuoauth
--

DROP TABLE IF EXISTS lp2008_usuoauth;
CREATE TABLE lp2008_usuoauth (
  ID int(11) NOT NULL,
  USUARIO_ID int(11) NOT NULL,
  OAUTHID varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  OAUTHTIPO enum('Google','FaceBook') COLLATE utf8_unicode_ci NOT NULL,
  ULTIMOUSO datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ALMACENA LOGINS USANDO BOTONES REDES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usupalabras
--

DROP TABLE IF EXISTS lp2008_usupalabras;
CREATE TABLE lp2008_usupalabras (
  ID smallint(6) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  PALABRA varchar(20) NOT NULL DEFAULT '',
  VALOR decimal(7,2) NOT NULL DEFAULT '0.00' COMMENT 'VALOR QUE FUE PAGADO POR LA PALABRA',
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LAS PALABRAS QUE PAGAN LOS USUARIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usuproc
--

DROP TABLE IF EXISTS lp2008_usuproc;
CREATE TABLE lp2008_usuproc (
  ID tinyint(4) NOT NULL,
  USUARIO_ID smallint(6) NOT NULL DEFAULT '0',
  TIPO enum('P','M') NOT NULL DEFAULT 'M',
  FECHA datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS USUARIOS PROCESADOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usupromo
--

DROP TABLE IF EXISTS lp2008_usupromo;
CREATE TABLE lp2008_usupromo (
  USUARIO_ID mediumint(9) NOT NULL,
  PROMO varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LOS USUARIOS QUE REGISTRAN POR PROMO ENLACE';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usupub
--

DROP TABLE IF EXISTS lp2008_usupub;
CREATE TABLE lp2008_usupub (
  USUARIO_ID mediumint(9) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LAS PUBLICACIONES DE USUARIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usutemp
--

DROP TABLE IF EXISTS lp2008_usutemp;
CREATE TABLE lp2008_usutemp (
  ID smallint(6) NOT NULL,
  EMAIL varchar(60) NOT NULL,
  USUARIO varchar(25) NOT NULL,
  NOMBRE varchar(45) NOT NULL,
  PASSWORD varchar(55) NOT NULL,
  ESTATUS enum('T','A') NOT NULL DEFAULT 'T',
  FECHA datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='TABLA TEMPORAL PARA REGISTRO DE USUARIOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usuvip
--

DROP TABLE IF EXISTS lp2008_usuvip;
CREATE TABLE lp2008_usuvip (
  ID smallint(6) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL DEFAULT '0',
  PLAN enum('UV1','UV2','UV3') NOT NULL DEFAULT 'UV1',
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  TITULO varchar(40) NOT NULL DEFAULT '',
  ORDEN smallint(6) NOT NULL DEFAULT '0',
  ESTATUS enum('A','P','C','V') NOT NULL DEFAULT 'P'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LOS ID DE USUARIOS VIP';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_usuvisto
--

DROP TABLE IF EXISTS lp2008_usuvisto;
CREATE TABLE lp2008_usuvisto (
  USUARIO_ID mediumint(9) NOT NULL,
  VISTO datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ALMACENA ULTIMO VISTO';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_vehiculos
--

DROP TABLE IF EXISTS lp2008_vehiculos;
CREATE TABLE lp2008_vehiculos (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  MARCAVE varchar(5) NOT NULL DEFAULT '',
  MODELO varchar(5) NOT NULL DEFAULT '',
  ANIO varchar(4) NOT NULL DEFAULT '',
  COLOREXT varchar(5) NOT NULL DEFAULT '0',
  COLORINT varchar(5) NOT NULL DEFAULT '0',
  PUERTAS enum('2','3','4','5') NOT NULL DEFAULT '4',
  PASAJEROS varchar(4) NOT NULL DEFAULT '0',
  COMBUSTIBLE varchar(5) NOT NULL DEFAULT '0',
  USO varchar(10) NOT NULL DEFAULT '0',
  TIPOUSO enum('K','M') NOT NULL DEFAULT 'K',
  TRACCION varchar(5) NOT NULL DEFAULT '',
  TRANSMISION varchar(5) NOT NULL DEFAULT '',
  ACCESORIOS varchar(60) NOT NULL COMMENT 'ACCESORIOS PARA LOS VEHICULOS, 1,2,3, ETC',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_vehiculosbk
--

DROP TABLE IF EXISTS lp2008_vehiculosbk;
CREATE TABLE lp2008_vehiculosbk (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  MARCAVE varchar(5) NOT NULL DEFAULT '',
  MODELO varchar(5) NOT NULL DEFAULT '',
  ANIO varchar(4) NOT NULL DEFAULT '',
  COLOREXT varchar(5) NOT NULL DEFAULT '0',
  COLORINT varchar(5) NOT NULL DEFAULT '0',
  PUERTAS enum('2','3','4','5') NOT NULL DEFAULT '4',
  PASAJEROS varchar(4) NOT NULL DEFAULT '0',
  COMBUSTIBLE varchar(5) NOT NULL DEFAULT '0',
  USO varchar(10) NOT NULL DEFAULT '0',
  TIPOUSO enum('K','M') NOT NULL DEFAULT 'K',
  TRACCION varchar(5) NOT NULL DEFAULT '',
  TRANSMISION varchar(5) NOT NULL DEFAULT '',
  ACCESORIOS varchar(60) NOT NULL COMMENT 'ACCESORIOS PARA LOS VEHICULOS, 1,2,3, ETC',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_vehiculosbk1
--

DROP TABLE IF EXISTS lp2008_vehiculosbk1;
CREATE TABLE lp2008_vehiculosbk1 (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  MARCAVE varchar(5) NOT NULL DEFAULT '',
  MODELO varchar(5) NOT NULL DEFAULT '',
  ANIO varchar(4) NOT NULL DEFAULT '',
  COLOREXT varchar(5) NOT NULL DEFAULT '0',
  COLORINT varchar(5) NOT NULL DEFAULT '0',
  PUERTAS enum('2','3','4','5') NOT NULL DEFAULT '4',
  PASAJEROS varchar(4) NOT NULL DEFAULT '0',
  COMBUSTIBLE varchar(5) NOT NULL DEFAULT '0',
  USO varchar(10) NOT NULL DEFAULT '0',
  TIPOUSO enum('K','M') NOT NULL DEFAULT 'K',
  TRACCION varchar(5) NOT NULL DEFAULT '',
  TRANSMISION varchar(5) NOT NULL DEFAULT '',
  ACCESORIOS varchar(60) NOT NULL COMMENT 'ACCESORIOS PARA LOS VEHICULOS, 1,2,3, ETC',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_vehiculosold130516
--

DROP TABLE IF EXISTS lp2008_vehiculosold130516;
CREATE TABLE lp2008_vehiculosold130516 (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  MARCA_ID smallint(6) NOT NULL DEFAULT '-1' COMMENT 'NUEVO ID DE MARCA',
  MODELO_ID smallint(6) NOT NULL DEFAULT '-1' COMMENT 'NUEVO MODELO ID',
  MARCAVE varchar(5) NOT NULL DEFAULT '-1',
  MODELO varchar(5) NOT NULL DEFAULT '-1',
  ANIO varchar(4) NOT NULL DEFAULT '-1',
  COMBUSTIBLE varchar(5) NOT NULL DEFAULT '0',
  AROS varchar(15) DEFAULT '-1' COMMENT 'AROS R15 / 5H',
  GOMAS varchar(20) NOT NULL DEFAULT '-1' COMMENT 'DIAMETRO DE LAS GOMAS 999/99/99',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_vehiculos_old
--

DROP TABLE IF EXISTS lp2008_vehiculos_old;
CREATE TABLE lp2008_vehiculos_old (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  MARCAVE varchar(5) NOT NULL DEFAULT '',
  MODELO varchar(5) NOT NULL DEFAULT '',
  ANIO varchar(4) NOT NULL DEFAULT '',
  COLOREXT varchar(5) NOT NULL DEFAULT '0',
  COLORINT varchar(5) NOT NULL DEFAULT '0',
  PUERTAS enum('2','3','4','5') NOT NULL DEFAULT '4',
  PASAJEROS varchar(4) NOT NULL DEFAULT '0',
  COMBUSTIBLE varchar(5) NOT NULL DEFAULT '0',
  USO varchar(10) NOT NULL DEFAULT '0',
  TIPOUSO enum('K','M') NOT NULL DEFAULT 'K',
  TRACCION varchar(5) NOT NULL DEFAULT '',
  TRANSMISION varchar(5) NOT NULL DEFAULT '',
  ACCESORIOS varchar(60) NOT NULL COMMENT 'ACCESORIOS PARA LOS VEHICULOS, 1,2,3, ETC',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_vehmarca
--

DROP TABLE IF EXISTS lp2008_vehmarca;
CREATE TABLE lp2008_vehmarca (
  ID smallint(7) NOT NULL,
  MARCA varchar(30) NOT NULL DEFAULT '',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_vehmarcaold11-12-14
--

DROP TABLE IF EXISTS lp2008_vehmarcaold11-12-14;
CREATE TABLE `lp2008_vehmarcaold11-12-14` (
  ID smallint(7) NOT NULL,
  MARCA varchar(30) NOT NULL DEFAULT '',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_vehmarca_old231214
--

DROP TABLE IF EXISTS lp2008_vehmarca_old231214;
CREATE TABLE lp2008_vehmarca_old231214 (
  ID smallint(7) NOT NULL,
  MARCA varchar(30) NOT NULL DEFAULT '',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_vehmodelo
--

DROP TABLE IF EXISTS lp2008_vehmodelo;
CREATE TABLE lp2008_vehmodelo (
  ID smallint(7) NOT NULL,
  MARCA_ID smallint(7) NOT NULL DEFAULT '0',
  MODELO varchar(50) NOT NULL,
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='MODELOS DE CELULARES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_vehmodelo1
--

DROP TABLE IF EXISTS lp2008_vehmodelo1;
CREATE TABLE lp2008_vehmodelo1 (
  ID smallint(7) NOT NULL,
  MARCA_ID smallint(7) NOT NULL DEFAULT '0',
  MODELO varchar(50) NOT NULL,
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='MODELOS DE CELULARES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_vehmodelonew
--

DROP TABLE IF EXISTS lp2008_vehmodelonew;
CREATE TABLE lp2008_vehmodelonew (
  ID smallint(7) NOT NULL,
  MARCA_ID smallint(7) NOT NULL DEFAULT '0',
  MODELO varchar(50) NOT NULL,
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='MODELOS DE CELULARES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_vehmodeloold11-12-14
--

DROP TABLE IF EXISTS lp2008_vehmodeloold11-12-14;
CREATE TABLE `lp2008_vehmodeloold11-12-14` (
  ID smallint(7) NOT NULL,
  MARCA_ID smallint(7) NOT NULL DEFAULT '0',
  MODELO varchar(30) NOT NULL DEFAULT '',
  PUBLICADOS smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='MODELOS DE CELULARES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_vipmultiple
--

DROP TABLE IF EXISTS lp2008_vipmultiple;
CREATE TABLE lp2008_vipmultiple (
  ID mediumint(9) NOT NULL,
  ORDEN tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ORDEN DE LAS PUBLICACIONES ',
  SIGUIENTE smallint(6) NOT NULL DEFAULT '0' COMMENT 'ID SIGUIENTE A SER COLOCADO',
  OPCIONAL_ID mediumint(9) NOT NULL COMMENT 'ID DEL OPCIONAL',
  USUARIO_ID int(11) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '1',
  DURACION smallint(6) NOT NULL DEFAULT '30' COMMENT 'DURACION EN VIP CADA VEZ QUE ENTRE',
  HASTA datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LOS ID QUE IRAN AL VIP MULTIPLE';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_viptemp
--

DROP TABLE IF EXISTS lp2008_viptemp;
CREATE TABLE lp2008_viptemp (
  ARTICULO_ID mediumint(9) NOT NULL,
  ARTICULO varchar(70) NOT NULL,
  FOTOS varchar(110) NOT NULL,
  MONEDA enum('R','U','E') NOT NULL,
  PRECIO decimal(12,2) NOT NULL,
  TIPO enum('V','VC') NOT NULL,
  ROTAFOTO enum('S','N') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_votos
--

DROP TABLE IF EXISTS lp2008_votos;
CREATE TABLE lp2008_votos (
  VOTO_ID int(11) NOT NULL,
  ID bigint(20) NOT NULL DEFAULT '0',
  VALOR int(11) NOT NULL DEFAULT '0',
  USUARIO varchar(100) NOT NULL,
  PLATAFORMA enum('PC','MO') NOT NULL DEFAULT 'PC',
  FECHA datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table lp2008_whatsapp
--

DROP TABLE IF EXISTS lp2008_whatsapp;
CREATE TABLE lp2008_whatsapp (
  ID int(11) NOT NULL,
  NOMBRE varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  TELEFONO varchar(14) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SOLO PARA ENVIO DE MENSAJES ESPECIALES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_whatsappdos
--

DROP TABLE IF EXISTS lp2008_whatsappdos;
CREATE TABLE lp2008_whatsappdos (
  ID int(11) NOT NULL,
  NOMBRE varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  TELEFONO varchar(14) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SOLO PARA ENVIO DE MENSAJES ESPECIALES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_whatsappmarialuisa
--

DROP TABLE IF EXISTS lp2008_whatsappmarialuisa;
CREATE TABLE lp2008_whatsappmarialuisa (
  ID int(11) NOT NULL,
  NOMBRE varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  TELEFONO varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  LISTADO varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SOLO PARA ENVIO DE MENSAJES ESPECIALES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_whatsapptres
--

DROP TABLE IF EXISTS lp2008_whatsapptres;
CREATE TABLE lp2008_whatsapptres (
  ID int(11) NOT NULL,
  NOMBRE varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  TELEFONO varchar(14) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SOLO PARA ENVIO DE MENSAJES ESPECIALES';

-- --------------------------------------------------------

--
-- Table structure for table lp2008_youtube
--

DROP TABLE IF EXISTS lp2008_youtube;
CREATE TABLE lp2008_youtube (
  ID smallint(6) NOT NULL,
  USUARIO_ID mediumint(9) NOT NULL,
  CATEGORIA_ID tinyint(4) NOT NULL,
  ARTICULO_ID mediumint(9) NOT NULL COMMENT 'REFERENCIA PUBLICACION',
  TITULO varchar(60) NOT NULL,
  URLVIDEO varchar(60) NOT NULL,
  FECHA datetime NOT NULL,
  VISTAS mediumint(9) NOT NULL DEFAULT '0',
  ULTIMAVISTA datetime DEFAULT NULL,
  ESTATUS enum('A','I','R') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='ALMACENA LOS VIDEOS DE YOUTUBE';

-- --------------------------------------------------------

--
-- Table structure for table lp2010_descripcionr
--

DROP TABLE IF EXISTS lp2010_descripcionr;
CREATE TABLE lp2010_descripcionr (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  DESCRIPCION text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CONTIENE LA DESCRIPCION DE LOS ARTICULOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2011_ciudades
--

DROP TABLE IF EXISTS lp2011_ciudades;
CREATE TABLE lp2011_ciudades (
  PROVINCIA_ID smallint(6) NOT NULL COMMENT 'ID DE LAP ROVINCIA',
  ID smallint(6) NOT NULL COMMENT 'ID DE LA CIUIDAD',
  CIUDAD varchar(40) NOT NULL COMMENT 'CIUDAD'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LAS CIUDADES DE LAS PROVINCIAS';

-- --------------------------------------------------------

--
-- Table structure for table lp2011_sectores
--

DROP TABLE IF EXISTS lp2011_sectores;
CREATE TABLE lp2011_sectores (
  ID smallint(6) NOT NULL,
  PROVINCIA_ID smallint(6) NOT NULL,
  SECTOR varchar(40) NOT NULL,
  PUBLICADOS smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS SECTORES POR PROVINCIA';

-- --------------------------------------------------------

--
-- Table structure for table lp2011_sectorescomun
--

DROP TABLE IF EXISTS lp2011_sectorescomun;
CREATE TABLE lp2011_sectorescomun (
  ID smallint(6) NOT NULL DEFAULT '0',
  PROVINCIA_ID smallint(6) NOT NULL DEFAULT '0',
  SECTOR varchar(60) NOT NULL DEFAULT '',
  PUBLICADOS_BR smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table lp2011_sectoresfinal
--

DROP TABLE IF EXISTS lp2011_sectoresfinal;
CREATE TABLE lp2011_sectoresfinal (
  CIUDAD_ID smallint(6) NOT NULL,
  ID smallint(6) NOT NULL,
  SECTOR varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LOS SECTORES POR CIUIDADES';

-- --------------------------------------------------------

--
-- Table structure for table lp2011_vehiculos
--

DROP TABLE IF EXISTS lp2011_vehiculos;
CREATE TABLE lp2011_vehiculos (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  MARCAVE varchar(5) NOT NULL DEFAULT '',
  MODELO varchar(5) NOT NULL DEFAULT '',
  ANIO varchar(4) NOT NULL DEFAULT '',
  COLOREXT varchar(5) NOT NULL DEFAULT '0',
  COLORINT varchar(5) NOT NULL DEFAULT '0',
  PUERTAS enum('2','3','4','5') NOT NULL DEFAULT '4',
  PASAJEROS varchar(4) NOT NULL DEFAULT '0',
  COMBUSTIBLE varchar(5) NOT NULL DEFAULT '0',
  USO varchar(10) NOT NULL DEFAULT '0',
  TIPOUSO enum('K','M') NOT NULL DEFAULT 'K',
  TRACCION varchar(5) NOT NULL DEFAULT '',
  TRANSMISION varchar(5) NOT NULL DEFAULT '',
  ACCESORIOS varchar(60) NOT NULL COMMENT 'ACCESORIOS PARA LOS VEHICULOS, 1,2,3, ETC',
  ESTATUS enum('A','I') NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table lp2012_descripcion
--

DROP TABLE IF EXISTS lp2012_descripcion;
CREATE TABLE lp2012_descripcion (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  DESCRIPCION text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='CONTIENE LA DESCRIPCION DE LOS ARTICULOS';

-- --------------------------------------------------------

--
-- Table structure for table lp2013_descripcion
--

DROP TABLE IF EXISTS lp2013_descripcion;
CREATE TABLE lp2013_descripcion (
  ARTICULO_ID mediumint(9) NOT NULL DEFAULT '0',
  DESCRIPCION text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='CONTIENE LA DESCRIPCION DE LOS ARTICULOS';

-- --------------------------------------------------------

--
-- Table structure for table votos
--

DROP TABLE IF EXISTS votos;
CREATE TABLE votos (
  id bigint(20) NOT NULL DEFAULT '0',
  val int(11) NOT NULL DEFAULT '0',
  usuario varchar(100) NOT NULL,
  fecha datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table articles
--
ALTER TABLE articles
  ADD PRIMARY KEY (id),
  ADD KEY product (product);

--
-- Indexes for table a_cruzaremails
--
ALTER TABLE a_cruzaremails
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO (USUARIO),
  ADD UNIQUE KEY EMAIL (EMAIL);

--
-- Indexes for table a_emailaprocesar
--
ALTER TABLE a_emailaprocesar
  ADD PRIMARY KEY (EMAIL);

--
-- Indexes for table a_mailerdeamon
--
ALTER TABLE a_mailerdeamon
  ADD KEY email (email);

--
-- Indexes for table a_usuariosemail
--
ALTER TABLE a_usuariosemail
  ADD PRIMARY KEY (EMAIL);

--
-- Indexes for table click_tracker
--
ALTER TABLE click_tracker
  ADD UNIQUE KEY urls_key (urls_key),
  ADD KEY urls_hash (urls_hash);

--
-- Indexes for table descripcion_estaciones
--
ALTER TABLE descripcion_estaciones
  ADD PRIMARY KEY (ARTICULO_ID);
ALTER TABLE descripcion_estaciones ADD FULLTEXT KEY DESCRIPCION (DESCRIPCION);

--
-- Indexes for table email_usuariosnueva
--
ALTER TABLE email_usuariosnueva
  ADD PRIMARY KEY (ID);

--
-- Indexes for table ip2location_db1
--
ALTER TABLE ip2location_db1
  ADD KEY idx_ip_from (ip_from),
  ADD KEY idx_ip_to (ip_to),
  ADD KEY idx_ip_from_to (ip_from,ip_to);

--
-- Indexes for table lp2007_log_buscar
--
ALTER TABLE lp2007_log_buscar
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_adicionales
--
ALTER TABLE lp2008_adicionales
  ADD PRIMARY KEY (ID),
  ADD KEY TIPO (TIPO);

--
-- Indexes for table lp2008_adicxarti
--
ALTER TABLE lp2008_adicxarti
  ADD PRIMARY KEY (ARTICULO_ID,ADICIONAL_ID),
  ADD KEY ARTICULO_ID (ARTICULO_ID);

--
-- Indexes for table lp2008_adsense
--
ALTER TABLE lp2008_adsense
  ADD KEY FECHAPAGO (FECHAPAGO);

--
-- Indexes for table lp2008_anclarpub
--
ALTER TABLE lp2008_anclarpub
  ADD PRIMARY KEY (ARTICULO_ID);

--
-- Indexes for table lp2008_areaofertas
--
ALTER TABLE lp2008_areaofertas
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_artcoords
--
ALTER TABLE lp2008_artcoords
  ADD PRIMARY KEY (ARTICULO_ID);

--
-- Indexes for table lp2008_artespecial
--
ALTER TABLE lp2008_artespecial
  ADD PRIMARY KEY (ARTICULO_ID);

--
-- Indexes for table lp2008_articulos
--
ALTER TABLE lp2008_articulos
  ADD PRIMARY KEY (ID),
  ADD KEY CATEGORIA_ID (CATEGORIA_ID),
  ADD KEY SUBCATEGORIA_ID (SUBCATEGORIA_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY BONO (BONO),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY LISTA (LISTA),
  ADD KEY ESTATUS (ESTATUS),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY APTABLOQUE (APTABLOQUE),
  ADD KEY USUPLAN (USUPLANNO);
ALTER TABLE lp2008_articulos ADD FULLTEXT KEY I_ART_DESC (ARTICULO);

--
-- Indexes for table lp2008_articulos030316
--
ALTER TABLE lp2008_articulos030316
  ADD PRIMARY KEY (ID),
  ADD KEY CATEGORIA_ID (CATEGORIA_ID),
  ADD KEY SUBCATEGORIA_ID (SUBCATEGORIA_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY BONO (BONO),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY LISTA (LISTA),
  ADD KEY ESTATUS (ESTATUS),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY FOTOS (FOTOS);
ALTER TABLE lp2008_articulos030316 ADD FULLTEXT KEY I_ART_DESC (ARTICULO);

--
-- Indexes for table lp2008_articulos20200421
--
ALTER TABLE lp2008_articulos20200421
  ADD PRIMARY KEY (ID),
  ADD KEY CATEGORIA_ID (CATEGORIA_ID),
  ADD KEY SUBCATEGORIA_ID (SUBCATEGORIA_ID),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY ESTATUS (ESTATUS),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY FECHA (FECHA);

--
-- Indexes for table lp2008_articulosantesbono
--
ALTER TABLE lp2008_articulosantesbono
  ADD PRIMARY KEY (ID),
  ADD KEY CATEGORIA_ID (CATEGORIA_ID),
  ADD KEY SUBCATEGORIA_ID (SUBCATEGORIA_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY BONO (BONO),
  ADD KEY USUARIO_ID (USUARIO_ID);
ALTER TABLE lp2008_articulosantesbono ADD FULLTEXT KEY I_ART_DESC (ARTICULO);

--
-- Indexes for table lp2008_articuloslocal20092012
--
ALTER TABLE lp2008_articuloslocal20092012
  ADD PRIMARY KEY (ID),
  ADD KEY CATEGORIA_ID (CATEGORIA_ID),
  ADD KEY SUBCATEGORIA_ID (SUBCATEGORIA_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY BONO (BONO),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY LISTA (LISTA),
  ADD KEY ESTATUS (ESTATUS),
  ADD KEY PROVINCIA (PROVINCIA);
ALTER TABLE lp2008_articuloslocal20092012 ADD FULLTEXT KEY I_ART_DESC (ARTICULO);

--
-- Indexes for table lp2008_articulosold
--
ALTER TABLE lp2008_articulosold
  ADD PRIMARY KEY (ID),
  ADD KEY CATEGORIA_ID (CATEGORIA_ID),
  ADD KEY SUBCATEGORIA_ID (SUBCATEGORIA_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY BONO (BONO),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY LISTA (LISTA),
  ADD KEY ESTATUS (ESTATUS),
  ADD KEY PROVINCIA (PROVINCIA);
ALTER TABLE lp2008_articulosold ADD FULLTEXT KEY I_ART_DESC (ARTICULO);

--
-- Indexes for table lp2008_articulosold0202
--
ALTER TABLE lp2008_articulosold0202
  ADD PRIMARY KEY (ID),
  ADD KEY CATEGORIA_ID (CATEGORIA_ID),
  ADD KEY SUBCATEGORIA_ID (SUBCATEGORIA_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY BONO (BONO),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY LISTA (LISTA),
  ADD KEY ESTATUS (ESTATUS),
  ADD KEY PROVINCIA (PROVINCIA);
ALTER TABLE lp2008_articulosold0202 ADD FULLTEXT KEY I_ART_DESC (ARTICULO);

--
-- Indexes for table lp2008_articulosold060716
--
ALTER TABLE lp2008_articulosold060716
  ADD PRIMARY KEY (ID),
  ADD KEY CATEGORIA_ID (CATEGORIA_ID),
  ADD KEY SUBCATEGORIA_ID (SUBCATEGORIA_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY BONO (BONO),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY LISTA (LISTA),
  ADD KEY ESTATUS (ESTATUS),
  ADD KEY PROVINCIA (PROVINCIA);
ALTER TABLE lp2008_articulosold060716 ADD FULLTEXT KEY I_ART_DESC (ARTICULO);

--
-- Indexes for table lp2008_articulosold110516
--
ALTER TABLE lp2008_articulosold110516
  ADD PRIMARY KEY (ID),
  ADD KEY CATEGORIA_ID (CATEGORIA_ID),
  ADD KEY SUBCATEGORIA_ID (SUBCATEGORIA_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY BONO (BONO),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY LISTA (LISTA),
  ADD KEY ESTATUS (ESTATUS),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY FOTOS (FOTOS);
ALTER TABLE lp2008_articulosold110516 ADD FULLTEXT KEY I_ART_DESC (ARTICULO);

--
-- Indexes for table lp2008_articulosold120217
--
ALTER TABLE lp2008_articulosold120217
  ADD PRIMARY KEY (ID),
  ADD KEY CATEGORIA_ID (CATEGORIA_ID),
  ADD KEY SUBCATEGORIA_ID (SUBCATEGORIA_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY BONO (BONO),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY LISTA (LISTA),
  ADD KEY ESTATUS (ESTATUS),
  ADD KEY PROVINCIA (PROVINCIA);
ALTER TABLE lp2008_articulosold120217 ADD FULLTEXT KEY I_ART_DESC (ARTICULO);

--
-- Indexes for table lp2008_articulosr
--
ALTER TABLE lp2008_articulosr
  ADD PRIMARY KEY (ID),
  ADD KEY CATEGORIA_ID (CATEGORIA_ID),
  ADD KEY SUBCATEGORIA_ID (SUBCATEGORIA_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY BONO (BONO),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY LISTA (LISTA),
  ADD KEY ESTATUS (ESTATUS),
  ADD KEY PROVINCIA (PROVINCIA);
ALTER TABLE lp2008_articulosr ADD FULLTEXT KEY I_ART_DESC (ARTICULO);

--
-- Indexes for table lp2008_articulos_old
--
ALTER TABLE lp2008_articulos_old
  ADD PRIMARY KEY (ID),
  ADD KEY CATEGORIA_ID (CATEGORIA_ID),
  ADD KEY SUBCATEGORIA_ID (SUBCATEGORIA_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY BONO (BONO),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY LISTA (LISTA),
  ADD KEY ESTATUS (ESTATUS),
  ADD KEY PROVINCIA (PROVINCIA);
ALTER TABLE lp2008_articulos_old ADD FULLTEXT KEY I_ART_DESC (ARTICULO);

--
-- Indexes for table lp2008_articulos_old2015
--
ALTER TABLE lp2008_articulos_old2015
  ADD PRIMARY KEY (ID),
  ADD KEY CATEGORIA_ID (CATEGORIA_ID),
  ADD KEY SUBCATEGORIA_ID (SUBCATEGORIA_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY BONO (BONO),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY LISTA (LISTA),
  ADD KEY ESTATUS (ESTATUS),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY FOTOS (FOTOS);
ALTER TABLE lp2008_articulos_old2015 ADD FULLTEXT KEY I_ART_DESC (ARTICULO);

--
-- Indexes for table lp2008_arttemp
--
ALTER TABLE lp2008_arttemp
  ADD PRIMARY KEY (ID),
  ADD KEY ARTICULO (ARTICULO);

--
-- Indexes for table lp2008_arttemp2
--
ALTER TABLE lp2008_arttemp2
  ADD PRIMARY KEY (ID),
  ADD KEY ARTICULO (ARTICULO);

--
-- Indexes for table lp2008_arttemp_old
--
ALTER TABLE lp2008_arttemp_old
  ADD KEY ARTICULO (ARTICULO);

--
-- Indexes for table lp2008_autocompleta
--
ALTER TABLE lp2008_autocompleta
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_braices
--
ALTER TABLE lp2008_braices
  ADD PRIMARY KEY (ARTICULO_ID),
  ADD KEY HABITACIONES (HABITACIONES),
  ADD KEY PARQUEO (PARQUEOS);

--
-- Indexes for table lp2008_braicesold130516
--
ALTER TABLE lp2008_braicesold130516
  ADD PRIMARY KEY (ARTICULO_ID),
  ADD KEY HABITACIONES (HABITACIONES),
  ADD KEY PARQUEO (PARQUEOS);

--
-- Indexes for table lp2008_braices_old
--
ALTER TABLE lp2008_braices_old
  ADD PRIMARY KEY (ARTICULO_ID),
  ADD KEY HABITACIONES (HABITACIONES),
  ADD KEY PARQUEO (PARQUEOS);

--
-- Indexes for table lp2008_busquedas
--
ALTER TABLE lp2008_busquedas
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY STR (STR,USUARIO);

--
-- Indexes for table lp2008_buzon
--
ALTER TABLE lp2008_buzon
  ADD PRIMARY KEY (ID),
  ADD KEY PARA (PARA),
  ADD KEY DESDE (DE);

--
-- Indexes for table lp2008_cambioregistro
--
ALTER TABLE lp2008_cambioregistro
  ADD PRIMARY KEY (ID),
  ADD KEY USUARIO_ID (USUARIO_ID);

--
-- Indexes for table lp2008_categorias
--
ALTER TABLE lp2008_categorias
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY CATEGORIA (CATEGORIA);
ALTER TABLE lp2008_categorias ADD FULLTEXT KEY CATEGORIA_2 (CATEGORIA);

--
-- Indexes for table lp2008_categorias_bk
--
ALTER TABLE lp2008_categorias_bk
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY CATEGORIA (CATEGORIA);
ALTER TABLE lp2008_categorias_bk ADD FULLTEXT KEY CATEGORIA_2 (CATEGORIA);

--
-- Indexes for table lp2008_categorias_bk1
--
ALTER TABLE lp2008_categorias_bk1
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY CATEGORIA (CATEGORIA);
ALTER TABLE lp2008_categorias_bk1 ADD FULLTEXT KEY CATEGORIA_2 (CATEGORIA);

--
-- Indexes for table lp2008_celulares
--
ALTER TABLE lp2008_celulares
  ADD PRIMARY KEY (ARTICULO_ID);

--
-- Indexes for table lp2008_cemarca
--
ALTER TABLE lp2008_cemarca
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY MARCA_2 (MARCA);
ALTER TABLE lp2008_cemarca ADD FULLTEXT KEY MARCA (MARCA);

--
-- Indexes for table lp2008_cemarcaold
--
ALTER TABLE lp2008_cemarcaold
  ADD PRIMARY KEY (ID);
ALTER TABLE lp2008_cemarcaold ADD FULLTEXT KEY MARCA (MARCA);

--
-- Indexes for table lp2008_cemarca_old231214
--
ALTER TABLE lp2008_cemarca_old231214
  ADD PRIMARY KEY (ID);
ALTER TABLE lp2008_cemarca_old231214 ADD FULLTEXT KEY MARCA (MARCA);

--
-- Indexes for table lp2008_cemodelo
--
ALTER TABLE lp2008_cemodelo
  ADD PRIMARY KEY (ID);
ALTER TABLE lp2008_cemodelo ADD FULLTEXT KEY MODELO (MODELO);

--
-- Indexes for table lp2008_cemodeloold
--
ALTER TABLE lp2008_cemodeloold
  ADD PRIMARY KEY (ID);
ALTER TABLE lp2008_cemodeloold ADD FULLTEXT KEY MODELO (MODELO);

--
-- Indexes for table lp2008_cemodelo_old231214
--
ALTER TABLE lp2008_cemodelo_old231214
  ADD PRIMARY KEY (ID);
ALTER TABLE lp2008_cemodelo_old231214 ADD FULLTEXT KEY MODELO (MODELO);

--
-- Indexes for table lp2008_centrosdist
--
ALTER TABLE lp2008_centrosdist
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_clicktrack
--
ALTER TABLE lp2008_clicktrack
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_complementos
--
ALTER TABLE lp2008_complementos
  ADD PRIMARY KEY (ARTICULO_ID),
  ADD KEY ESTATUS (ESTATUS),
  ADD KEY TIPOCOMP (TIPOCOMP);

--
-- Indexes for table lp2008_complementosold0202
--
ALTER TABLE lp2008_complementosold0202
  ADD PRIMARY KEY (ARTICULO_ID),
  ADD KEY ESTATUS (ESTATUS);

--
-- Indexes for table lp2008_comusu
--
ALTER TABLE lp2008_comusu
  ADD PRIMARY KEY (ID),
  ADD KEY OPERADOR_ID (OPERADOR_ID);

--
-- Indexes for table lp2008_copiaopcionales
--
ALTER TABLE lp2008_copiaopcionales
  ADD PRIMARY KEY (ID),
  ADD KEY ARTICULO_ID (ARTICULO_ID),
  ADD KEY TIPO (TIPO);

--
-- Indexes for table lp2008_cupones
--
ALTER TABLE lp2008_cupones
  ADD PRIMARY KEY (CUPON);

--
-- Indexes for table lp2008_descripcion
--
ALTER TABLE lp2008_descripcion
  ADD PRIMARY KEY (ARTICULO_ID);
ALTER TABLE lp2008_descripcion ADD FULLTEXT KEY DESCRIPCION (DESCRIPCION);

--
-- Indexes for table lp2008_descripcionr
--
ALTER TABLE lp2008_descripcionr
  ADD PRIMARY KEY (ARTICULO_ID);
ALTER TABLE lp2008_descripcionr ADD FULLTEXT KEY DESCRIPCION (DESCRIPCION);

--
-- Indexes for table lp2008_desctemp
--
ALTER TABLE lp2008_desctemp
  ADD PRIMARY KEY (ARTICULO_ID);

--
-- Indexes for table lp2008_descuentos
--
ALTER TABLE lp2008_descuentos
  ADD PRIMARY KEY (ARTICULO_ID);

--
-- Indexes for table lp2008_ealternos
--
ALTER TABLE lp2008_ealternos
  ADD PRIMARY KEY (USUARIO_ID);

--
-- Indexes for table lp2008_eliart
--
ALTER TABLE lp2008_eliart
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_encuestas
--
ALTER TABLE lp2008_encuestas
  ADD PRIMARY KEY (ID),
  ADD KEY product (PREGUNTA);

--
-- Indexes for table lp2008_enlpatr
--
ALTER TABLE lp2008_enlpatr
  ADD PRIMARY KEY (ID),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY TIPO (TIPO);

--
-- Indexes for table lp2008_estadisticas
--
ALTER TABLE lp2008_estadisticas
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_etiquetas
--
ALTER TABLE lp2008_etiquetas
  ADD UNIQUE KEY ETIQUETA (ETIQUETA);

--
-- Indexes for table lp2008_excedidos
--
ALTER TABLE lp2008_excedidos
  ADD PRIMARY KEY (USUARIO_ID);

--
-- Indexes for table lp2008_expreso
--
ALTER TABLE lp2008_expreso
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO_ID (USUARIO_ID,ARTICULO_ID),
  ADD KEY UID (UID);

--
-- Indexes for table lp2008_extensiones
--
ALTER TABLE lp2008_extensiones
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO_ID (USUARIO_ID,FECHA,PROCESADO,ESTATUS);

--
-- Indexes for table lp2008_faq
--
ALTER TABLE lp2008_faq
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY TOPICO (TOPICO);

--
-- Indexes for table lp2008_faqcategoria
--
ALTER TABLE lp2008_faqcategoria
  ADD UNIQUE KEY ID (ID,CATEGORIA_ID);

--
-- Indexes for table lp2008_favoritas
--
ALTER TABLE lp2008_favoritas
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO_ID (USUARIO_ID,ARTICULO_ID),
  ADD KEY USUARIO_ID_2 (USUARIO_ID);

--
-- Indexes for table lp2008_favoritosold
--
ALTER TABLE lp2008_favoritosold
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY FAVORITO (USUARIO_ID,ARTICULO_ID);

--
-- Indexes for table lp2008_fechaopcional
--
ALTER TABLE lp2008_fechaopcional
  ADD PRIMARY KEY (ARTICULO_ID);

--
-- Indexes for table lp2008_financieras
--
ALTER TABLE lp2008_financieras
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY EMAIL (EMAIL);

--
-- Indexes for table lp2008_finantipo
--
ALTER TABLE lp2008_finantipo
  ADD PRIMARY KEY (FINANCIERA_ID,TIPO);

--
-- Indexes for table lp2008_idfotosmv
--
ALTER TABLE lp2008_idfotosmv
  ADD PRIMARY KEY (ARTICULO_ID);

--
-- Indexes for table lp2008_idfotosmvbak
--
ALTER TABLE lp2008_idfotosmvbak
  ADD PRIMARY KEY (ARTICULO_ID);

--
-- Indexes for table lp2008_impresiones
--
ALTER TABLE lp2008_impresiones
  ADD UNIQUE KEY SECCION (SECCION,CATEGORIA_ID,FECHA);

--
-- Indexes for table lp2008_ip2c
--
ALTER TABLE lp2008_ip2c
  ADD PRIMARY KEY (id),
  ADD KEY begin_ip_num (begin_ip_num,end_ip_num);

--
-- Indexes for table lp2008_linkaplan
--
ALTER TABLE lp2008_linkaplan
  ADD PRIMARY KEY (ID),
  ADD KEY ARTICULO_ID (ARTICULO_ID),
  ADD KEY HASTA (HASTA);

--
-- Indexes for table lp2008_listanegra
--
ALTER TABLE lp2008_listanegra
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY VALOR (VALOR);

--
-- Indexes for table lp2008_log_acciones
--
ALTER TABLE lp2008_log_acciones
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_log_buscar
--
ALTER TABLE lp2008_log_buscar
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY STR (STR,USUARIO),
  ADD KEY TIPOB (TIPOB);

--
-- Indexes for table lp2008_log_buscar1
--
ALTER TABLE lp2008_log_buscar1
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY STR (STR,USUARIO),
  ADD KEY TIPOB (TIPOB);

--
-- Indexes for table lp2008_log_click
--
ALTER TABLE lp2008_log_click
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_log_emailactual
--
ALTER TABLE lp2008_log_emailactual
  ADD PRIMARY KEY (ID),
  ADD KEY USUARIO_ID (USUARIO_ID);

--
-- Indexes for table lp2008_log_envmsg
--
ALTER TABLE lp2008_log_envmsg
  ADD PRIMARY KEY (ID),
  ADD KEY USUARIO_ID (USUARIO_ID);

--
-- Indexes for table lp2008_log_logins
--
ALTER TABLE lp2008_log_logins
  ADD PRIMARY KEY (ID),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY USUARIO (USUARIO);

--
-- Indexes for table lp2008_log_notifica
--
ALTER TABLE lp2008_log_notifica
  ADD PRIMARY KEY (ID),
  ADD KEY USUARIO_ID (USUARIO_ID);

--
-- Indexes for table lp2008_log_palabras
--
ALTER TABLE lp2008_log_palabras
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_log_pines
--
ALTER TABLE lp2008_log_pines
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_log_pinesviejosistema
--
ALTER TABLE lp2008_log_pinesviejosistema
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_log_prestamos
--
ALTER TABLE lp2008_log_prestamos
  ADD UNIQUE KEY PRESTAMO_ID (PRESTAMO_ID,FINANCIERA_ID),
  ADD UNIQUE KEY PRESTAMO_ID_2 (PRESTAMO_ID,FINANCIERA_ID);

--
-- Indexes for table lp2008_log_pubusu
--
ALTER TABLE lp2008_log_pubusu
  ADD PRIMARY KEY (USUARIO_ID);

--
-- Indexes for table lp2008_log_ventas
--
ALTER TABLE lp2008_log_ventas
  ADD PRIMARY KEY (ARTICULO_ID),
  ADD KEY CATEGORIA_ID (CATEGORIA_ID),
  ADD KEY PROVINCIA_ID (PROVINCIA_ID),
  ADD KEY MONEDA (MONEDA);

--
-- Indexes for table lp2008_lpbonos
--
ALTER TABLE lp2008_lpbonos
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY NUMERO (NUMERO);

--
-- Indexes for table lp2008_lppuntos
--
ALTER TABLE lp2008_lppuntos
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_mapxusu
--
ALTER TABLE lp2008_mapxusu
  ADD PRIMARY KEY (USUARIO_ID,ARTICULO_ID);

--
-- Indexes for table lp2008_marcas
--
ALTER TABLE lp2008_marcas
  ADD PRIMARY KEY (ID),
  ADD KEY MARCA (MARCA),
  ADD KEY TIPO (TIPO);

--
-- Indexes for table lp2008_mensajeria
--
ALTER TABLE lp2008_mensajeria
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY PARA (PARA,EMAIL,ARTICULO_ID);

--
-- Indexes for table lp2008_mensajeria_old
--
ALTER TABLE lp2008_mensajeria_old
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY PARA (PARA,EMAIL,ARTICULO_ID);

--
-- Indexes for table lp2008_mensajes
--
ALTER TABLE lp2008_mensajes
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_mensajes_old
--
ALTER TABLE lp2008_mensajes_old
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_metatags
--
ALTER TABLE lp2008_metatags
  ADD PRIMARY KEY (ARTICULO_ID);

--
-- Indexes for table lp2008_modelos
--
ALTER TABLE lp2008_modelos
  ADD PRIMARY KEY (ID),
  ADD KEY MARCA_ID (MARCA_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY MODELO (MODELO);

--
-- Indexes for table lp2008_modelosold080816
--
ALTER TABLE lp2008_modelosold080816
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_msgarticulo
--
ALTER TABLE lp2008_msgarticulo
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_msgcintillo
--
ALTER TABLE lp2008_msgcintillo
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_municipios
--
ALTER TABLE lp2008_municipios
  ADD PRIMARY KEY (ID),
  ADD KEY PROVINCIA_ID (PROVINCIA_ID);

--
-- Indexes for table lp2008_municipiosn
--
ALTER TABLE lp2008_municipiosn
  ADD PRIMARY KEY (ID),
  ADD KEY PROVINCIA_ID (PROVINCIA_ID);

--
-- Indexes for table lp2008_nologin
--
ALTER TABLE lp2008_nologin
  ADD PRIMARY KEY (ID),
  ADD KEY USUARIO_ID (USUARIO_ID);

--
-- Indexes for table lp2008_notelefono
--
ALTER TABLE lp2008_notelefono
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY TELEFONO (TELEFONO);

--
-- Indexes for table lp2008_opcionales
--
ALTER TABLE lp2008_opcionales
  ADD PRIMARY KEY (ID),
  ADD KEY ARTICULO_ID (ARTICULO_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY ESTATUS (ESTATUS);

--
-- Indexes for table lp2008_opcionalesajax
--
ALTER TABLE lp2008_opcionalesajax
  ADD PRIMARY KEY (ID),
  ADD KEY ARTICULO_ID (ARTICULO_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY ESTATUS (ESTATUS);

--
-- Indexes for table lp2008_opcionalesbk
--
ALTER TABLE lp2008_opcionalesbk
  ADD PRIMARY KEY (ID),
  ADD KEY ARTICULO_ID (ARTICULO_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY ESTATUS (ESTATUS);

--
-- Indexes for table lp2008_opcionalesbk010711
--
ALTER TABLE lp2008_opcionalesbk010711
  ADD PRIMARY KEY (ID),
  ADD KEY ARTICULO_ID (ARTICULO_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY ESTATUS (ESTATUS);

--
-- Indexes for table lp2008_opcionalesold
--
ALTER TABLE lp2008_opcionalesold
  ADD PRIMARY KEY (ID),
  ADD KEY ARTICULO_ID (ARTICULO_ID),
  ADD KEY TIPO (TIPO);

--
-- Indexes for table lp2008_opcionales_old
--
ALTER TABLE lp2008_opcionales_old
  ADD PRIMARY KEY (ID),
  ADD KEY ARTICULO_ID (ARTICULO_ID),
  ADD KEY TIPO (TIPO),
  ADD KEY ESTATUS (ESTATUS);

--
-- Indexes for table lp2008_palabras
--
ALTER TABLE lp2008_palabras
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY PALABRA (PALABRA);

--
-- Indexes for table lp2008_parametros
--
ALTER TABLE lp2008_parametros
  ADD PRIMARY KEY (PARAMETRO);

--
-- Indexes for table lp2008_parametros_old
--
ALTER TABLE lp2008_parametros_old
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_paramsmvc
--
ALTER TABLE lp2008_paramsmvc
  ADD PRIMARY KEY (PARAMETRO);

--
-- Indexes for table lp2008_pclaves
--
ALTER TABLE lp2008_pclaves
  ADD PRIMARY KEY (CATEGORIA_ID);
ALTER TABLE lp2008_pclaves ADD FULLTEXT KEY PCLAVES (PCLAVES);

--
-- Indexes for table lp2008_pclavesbk
--
ALTER TABLE lp2008_pclavesbk
  ADD PRIMARY KEY (CATEGORIA_ID);
ALTER TABLE lp2008_pclavesbk ADD FULLTEXT KEY PCLAVES (PCLAVES);

--
-- Indexes for table lp2008_pclavesdsv
--
ALTER TABLE lp2008_pclavesdsv
  ADD PRIMARY KEY (CATEGORIA_ID);
ALTER TABLE lp2008_pclavesdsv ADD FULLTEXT KEY PCLAVES (PCLAVES);

--
-- Indexes for table lp2008_penalidades
--
ALTER TABLE lp2008_penalidades
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO_ID_2 (USUARIO_ID,HASTA),
  ADD KEY USUARIO_ID (USUARIO_ID);

--
-- Indexes for table lp2008_planenlista
--
ALTER TABLE lp2008_planenlista
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_planes
--
ALTER TABLE lp2008_planes
  ADD PRIMARY KEY (USUARIO_ID);

--
-- Indexes for table lp2008_planesinfo
--
ALTER TABLE lp2008_planesinfo
  ADD UNIQUE KEY USUARIO_ID (USUARIO_ID),
  ADD KEY HORARIO (HORARIO),
  ADD KEY TIPO (TIPO);
ALTER TABLE lp2008_planesinfo ADD FULLTEXT KEY NOMBRE_2 (NOMBRE);

--
-- Indexes for table lp2008_planesinfo18218
--
ALTER TABLE lp2008_planesinfo18218
  ADD UNIQUE KEY USUARIO_ID (USUARIO_ID),
  ADD KEY HORARIO (HORARIO),
  ADD KEY TIPO (TIPO);
ALTER TABLE lp2008_planesinfo18218 ADD FULLTEXT KEY NOMBRE_2 (NOMBRE);

--
-- Indexes for table lp2008_planesinfoold110516
--
ALTER TABLE lp2008_planesinfoold110516
  ADD UNIQUE KEY USUARIO_ID (USUARIO_ID);
ALTER TABLE lp2008_planesinfoold110516 ADD FULLTEXT KEY NOMBRE_2 (NOMBRE);

--
-- Indexes for table lp2008_planesinfo_old261216
--
ALTER TABLE lp2008_planesinfo_old261216
  ADD UNIQUE KEY USUARIO_ID (USUARIO_ID);
ALTER TABLE lp2008_planesinfo_old261216 ADD FULLTEXT KEY NOMBRE_2 (NOMBRE);

--
-- Indexes for table lp2008_planesold
--
ALTER TABLE lp2008_planesold
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_planesold110516
--
ALTER TABLE lp2008_planesold110516
  ADD PRIMARY KEY (USUARIO_ID);

--
-- Indexes for table lp2008_plantilladesc
--
ALTER TABLE lp2008_plantilladesc
  ADD PRIMARY KEY (USUARIO_ID);

--
-- Indexes for table lp2008_porprv
--
ALTER TABLE lp2008_porprv
  ADD PRIMARY KEY (PROVINCIA_ID);

--
-- Indexes for table lp2008_prefijotel
--
ALTER TABLE lp2008_prefijotel
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY PREFIJO (PREFIJO);

--
-- Indexes for table lp2008_preftipotel
--
ALTER TABLE lp2008_preftipotel
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_prestamos
--
ALTER TABLE lp2008_prestamos
  ADD PRIMARY KEY (ID),
  ADD KEY EMAIL (EMAIL);

--
-- Indexes for table lp2008_provincias
--
ALTER TABLE lp2008_provincias
  ADD PRIMARY KEY (ID),
  ADD KEY PROVINCIA (PROVINCIA);

--
-- Indexes for table lp2008_publica
--
ALTER TABLE lp2008_publica
  ADD PRIMARY KEY (ARTICULO_ID,SESSION);

--
-- Indexes for table lp2008_publicados
--
ALTER TABLE lp2008_publicados
  ADD PRIMARY KEY (FECHA);

--
-- Indexes for table lp2008_rangosip
--
ALTER TABLE lp2008_rangosip
  ADD PRIMARY KEY (ip_from),
  ADD UNIQUE KEY ip_to (ip_to),
  ADD KEY code (code);

--
-- Indexes for table lp2008_recientes
--
ALTER TABLE lp2008_recientes
  ADD PRIMARY KEY (ARTICULO_ID,USUARIO),
  ADD KEY USUARIO (USUARIO);

--
-- Indexes for table lp2008_recurrentes
--
ALTER TABLE lp2008_recurrentes
  ADD PRIMARY KEY (USUARIO_ID);

--
-- Indexes for table lp2008_referidos
--
ALTER TABLE lp2008_referidos
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY REFERIDO (REFERIDO);

--
-- Indexes for table lp2008_referidos_old
--
ALTER TABLE lp2008_referidos_old
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_renomultiples
--
ALTER TABLE lp2008_renomultiples
  ADD PRIMARY KEY (USUARIO_ID);

--
-- Indexes for table lp2008_renovaarticulo
--
ALTER TABLE lp2008_renovaarticulo
  ADD PRIMARY KEY (ID),
  ADD KEY ARTICULO_ID (ARTICULO_ID);

--
-- Indexes for table lp2008_renovaciones
--
ALTER TABLE lp2008_renovaciones
  ADD PRIMARY KEY (USUARIO_ID);

--
-- Indexes for table lp2008_renovatodo
--
ALTER TABLE lp2008_renovatodo
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO_ID (USUARIO_ID);

--
-- Indexes for table lp2008_repuemarca
--
ALTER TABLE lp2008_repuemarca
  ADD PRIMARY KEY (REPUESTO_ID,MARCA);

--
-- Indexes for table lp2008_repuestos
--
ALTER TABLE lp2008_repuestos
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY EMAIL (EMAIL);

--
-- Indexes for table lp2008_sectores
--
ALTER TABLE lp2008_sectores
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY PROVINCIA_ID (PROVINCIA_ID,SECTOR),
  ADD KEY MUNICIPIO_ID (MUNICIPIO_ID);
ALTER TABLE lp2008_sectores ADD FULLTEXT KEY SECTOR (SECTOR);

--
-- Indexes for table lp2008_sectoresbk
--
ALTER TABLE lp2008_sectoresbk
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY PROVINCIA_ID (PROVINCIA_ID,SECTOR);
ALTER TABLE lp2008_sectoresbk ADD FULLTEXT KEY SECTOR (SECTOR);

--
-- Indexes for table lp2008_sectoresbk1
--
ALTER TABLE lp2008_sectoresbk1
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY PROVINCIA_ID (PROVINCIA_ID,SECTOR);
ALTER TABLE lp2008_sectoresbk1 ADD FULLTEXT KEY SECTOR (SECTOR);

--
-- Indexes for table lp2008_sectoresbkjson
--
ALTER TABLE lp2008_sectoresbkjson
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY PROVINCIA_ID (PROVINCIA_ID,SECTOR);
ALTER TABLE lp2008_sectoresbkjson ADD FULLTEXT KEY SECTOR (SECTOR);

--
-- Indexes for table lp2008_sectoresold0602
--
ALTER TABLE lp2008_sectoresold0602
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY PROVINCIA_ID (PROVINCIA_ID,SECTOR),
  ADD KEY MUNICIPIO_ID (MUNICIPIO_ID);
ALTER TABLE lp2008_sectoresold0602 ADD FULLTEXT KEY SECTOR (SECTOR);

--
-- Indexes for table lp2008_servicios
--
ALTER TABLE lp2008_servicios
  ADD PRIMARY KEY (ID),
  ADD KEY SECTOR (SECTOR),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY NOMBRE_2 (NOMBRE);
ALTER TABLE lp2008_servicios ADD FULLTEXT KEY NOMBRE (NOMBRE);
ALTER TABLE lp2008_servicios ADD FULLTEXT KEY SERVICIO (SERVICIO);
ALTER TABLE lp2008_servicios ADD FULLTEXT KEY SERVICIO_2 (SERVICIO);

--
-- Indexes for table lp2008_servicios25-07-2012
--
ALTER TABLE lp2008_servicios25-07-2012
  ADD PRIMARY KEY (ID),
  ADD KEY SECTOR (SECTOR),
  ADD KEY PROVINCIA (PROVINCIA);
ALTER TABLE lp2008_servicios25-07-2012 ADD FULLTEXT KEY NOMBRE (NOMBRE);
ALTER TABLE lp2008_servicios25-07-2012 ADD FULLTEXT KEY SERVICIO (SERVICIO);

--
-- Indexes for table lp2008_servicios140715
--
ALTER TABLE lp2008_servicios140715
  ADD PRIMARY KEY (ID),
  ADD KEY SECTOR (SECTOR),
  ADD KEY PROVINCIA (PROVINCIA);
ALTER TABLE lp2008_servicios140715 ADD FULLTEXT KEY NOMBRE (NOMBRE);
ALTER TABLE lp2008_servicios140715 ADD FULLTEXT KEY SERVICIO (SERVICIO);

--
-- Indexes for table lp2008_serviciosbk
--
ALTER TABLE lp2008_serviciosbk
  ADD PRIMARY KEY (ID),
  ADD KEY NOMBRE (NOMBRE);

--
-- Indexes for table lp2008_serviciosbk24-07-12
--
ALTER TABLE lp2008_serviciosbk24-07-12
  ADD PRIMARY KEY (ID),
  ADD KEY SECTOR (SECTOR),
  ADD KEY PROVINCIA (PROVINCIA);
ALTER TABLE lp2008_serviciosbk24-07-12 ADD FULLTEXT KEY NOMBRE (NOMBRE);
ALTER TABLE lp2008_serviciosbk24-07-12 ADD FULLTEXT KEY SERVICIO (SERVICIO);

--
-- Indexes for table lp2008_servicioscat
--
ALTER TABLE lp2008_servicioscat
  ADD PRIMARY KEY (ID);
ALTER TABLE lp2008_servicioscat ADD FULLTEXT KEY SERVICIO (SERVICIO);
ALTER TABLE lp2008_servicioscat ADD FULLTEXT KEY PCLAVES (PCLAVES);

--
-- Indexes for table lp2008_servicioscatpclavesno
--
ALTER TABLE lp2008_servicioscatpclavesno
  ADD PRIMARY KEY (ID);
ALTER TABLE lp2008_servicioscatpclavesno ADD FULLTEXT KEY SERVICIO (SERVICIO);

--
-- Indexes for table lp2008_servicioslnk
--
ALTER TABLE lp2008_servicioslnk
  ADD PRIMARY KEY (ID,SERVICIO_ID),
  ADD KEY SERVICIO_ID (SERVICIO_ID),
  ADD KEY ID (ID);

--
-- Indexes for table lp2008_serviciosold
--
ALTER TABLE lp2008_serviciosold
  ADD PRIMARY KEY (ID),
  ADD KEY SECTOR (SECTOR),
  ADD KEY PROVINCIA (PROVINCIA);
ALTER TABLE lp2008_serviciosold ADD FULLTEXT KEY NOMBRE (NOMBRE);
ALTER TABLE lp2008_serviciosold ADD FULLTEXT KEY SERVICIO (SERVICIO);
ALTER TABLE lp2008_serviciosold ADD FULLTEXT KEY DESCRIPCION (DESCRIPCION);

--
-- Indexes for table lp2008_serviciosrating
--
ALTER TABLE lp2008_serviciosrating
  ADD KEY ID (ID);

--
-- Indexes for table lp2008_serviciossubir020912
--
ALTER TABLE lp2008_serviciossubir020912
  ADD PRIMARY KEY (ID),
  ADD KEY SECTOR (SECTOR),
  ADD KEY PROVINCIA (PROVINCIA);
ALTER TABLE lp2008_serviciossubir020912 ADD FULLTEXT KEY NOMBRE (NOMBRE);
ALTER TABLE lp2008_serviciossubir020912 ADD FULLTEXT KEY SERVICIO (SERVICIO);

--
-- Indexes for table lp2008_sitemapindex
--
ALTER TABLE lp2008_sitemapindex
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_solpiezas
--
ALTER TABLE lp2008_solpiezas
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_soporte
--
ALTER TABLE lp2008_soporte
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_subcategorias
--
ALTER TABLE lp2008_subcategorias
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY CATEGORIA_ID (CATEGORIA_ID,SUBCATEGORIA);
ALTER TABLE lp2008_subcategorias ADD FULLTEXT KEY SUBCATEGORIA (SUBCATEGORIA);

--
-- Indexes for table lp2008_subcategorias 03-2016
--
ALTER TABLE lp2008_subcategorias 03-2016
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY CATEGORIA_ID (CATEGORIA_ID,SUBCATEGORIA);
ALTER TABLE lp2008_subcategorias 03-2016 ADD FULLTEXT KEY SUBCATEGORIA (SUBCATEGORIA);

--
-- Indexes for table lp2008_subcategorias12-2014
--
ALTER TABLE lp2008_subcategorias12-2014
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY CATEGORIA_ID (CATEGORIA_ID,SUBCATEGORIA),
  ADD KEY URL (URL);
ALTER TABLE lp2008_subcategorias12-2014 ADD FULLTEXT KEY SUBCATEGORIA (SUBCATEGORIA);

--
-- Indexes for table lp2008_subcategoriasnew
--
ALTER TABLE lp2008_subcategoriasnew
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY CATEGORIA_ID (CATEGORIA_ID,SUBCATEGORIA);
ALTER TABLE lp2008_subcategoriasnew ADD FULLTEXT KEY SUBCATEGORIA (SUBCATEGORIA);

--
-- Indexes for table lp2008_subcategoriasold19-07-17
--
ALTER TABLE lp2008_subcategoriasold19-07-17
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY CATEGORIA_ID (CATEGORIA_ID,SUBCATEGORIA);
ALTER TABLE lp2008_subcategoriasold19-07-17 ADD FULLTEXT KEY SUBCATEGORIA (SUBCATEGORIA);

--
-- Indexes for table lp2008_subcategoriasold210417
--
ALTER TABLE lp2008_subcategoriasold210417
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY CATEGORIA_ID (CATEGORIA_ID,SUBCATEGORIA);
ALTER TABLE lp2008_subcategoriasold210417 ADD FULLTEXT KEY SUBCATEGORIA (SUBCATEGORIA);

--
-- Indexes for table lp2008_subcategorias_2022
--
ALTER TABLE lp2008_subcategorias_2022
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY CATEGORIA_ID (CATEGORIA_ID,SUBCATEGORIA);
ALTER TABLE lp2008_subcategorias_2022 ADD FULLTEXT KEY SUBCATEGORIA (SUBCATEGORIA);

--
-- Indexes for table lp2008_subcategorias_bk
--
ALTER TABLE lp2008_subcategorias_bk
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY CATEGORIA_ID (CATEGORIA_ID,SUBCATEGORIA);
ALTER TABLE lp2008_subcategorias_bk ADD FULLTEXT KEY SUBCATEGORIA (SUBCATEGORIA);

--
-- Indexes for table lp2008_subcategorias_bk1
--
ALTER TABLE lp2008_subcategorias_bk1
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY CATEGORIA_ID (CATEGORIA_ID,SUBCATEGORIA);
ALTER TABLE lp2008_subcategorias_bk1 ADD FULLTEXT KEY SUBCATEGORIA (SUBCATEGORIA);

--
-- Indexes for table lp2008_subplan
--
ALTER TABLE lp2008_subplan
  ADD PRIMARY KEY (USUARIO_ID,SUBCATEGORIA_ID);

--
-- Indexes for table lp2008_subtienda
--
ALTER TABLE lp2008_subtienda
  ADD PRIMARY KEY (USUARIO_ID,SUBCATEGORIA_ID);

--
-- Indexes for table lp2008_sugiere
--
ALTER TABLE lp2008_sugiere
  ADD PRIMARY KEY (ARTICULO);
ALTER TABLE lp2008_sugiere ADD FULLTEXT KEY ARTICULO (ARTICULO);

--
-- Indexes for table lp2008_tempcuentas
--
ALTER TABLE lp2008_tempcuentas
  ADD PRIMARY KEY (TELEFONO);

--
-- Indexes for table lp2008_tiendasold
--
ALTER TABLE lp2008_tiendasold
  ADD PRIMARY KEY (USUARIO_ID),
  ADD UNIQUE KEY NOMBRE (NOMBRE),
  ADD KEY TIPO (TIPO);

--
-- Indexes for table lp2008_transacciones
--
ALTER TABLE lp2008_transacciones
  ADD PRIMARY KEY (ID),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY TIPO (FORMAPAGO);

--
-- Indexes for table lp2008_transacciones130520
--
ALTER TABLE lp2008_transacciones130520
  ADD PRIMARY KEY (ID),
  ADD KEY USUARIO_ID (USUARIO_ID),
  ADD KEY TIPO (FORMAPAGO);

--
-- Indexes for table lp2008_transaccionesold
--
ALTER TABLE lp2008_transaccionesold
  ADD PRIMARY KEY (ID),
  ADD KEY USUARIO_ID (USUARIO_ID);

--
-- Indexes for table lp2008_urls
--
ALTER TABLE lp2008_urls
  ADD KEY OP (OP,TIPO,VALOR);

--
-- Indexes for table lp2008_urlsold08082016
--
ALTER TABLE lp2008_urlsold08082016
  ADD PRIMARY KEY (ID),
  ADD KEY OP (OP,TIPO,VALOR);

--
-- Indexes for table lp2008_urlsold11122016
--
ALTER TABLE lp2008_urlsold11122016
  ADD PRIMARY KEY (ID),
  ADD KEY OP (OP,TIPO,VALOR);

--
-- Indexes for table lp2008_usuarios
--
ALTER TABLE lp2008_usuarios
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO (USUARIO),
  ADD UNIQUE KEY EMAIL (EMAIL),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY SECTOR (SECTOR),
  ADD KEY PAIS (PAIS),
  ADD KEY FBUSUARIO (FBUSUARIO),
  ADD KEY TWUSUARIO (TWUSUARIO),
  ADD KEY USUPLANN (USUPLANN);

--
-- Indexes for table lp2008_usuarios02020421
--
ALTER TABLE lp2008_usuarios02020421
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO (USUARIO),
  ADD UNIQUE KEY EMAIL (EMAIL),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY SECTOR (SECTOR),
  ADD KEY PAIS (PAIS),
  ADD KEY FBUSUARIO (FBUSUARIO),
  ADD KEY TWUSUARIO (TWUSUARIO),
  ADD KEY USUPLANN (USUPLANN);

--
-- Indexes for table lp2008_usuarios180218
--
ALTER TABLE lp2008_usuarios180218
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO (USUARIO),
  ADD UNIQUE KEY EMAIL (EMAIL),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY SECTOR (SECTOR),
  ADD KEY PAIS (PAIS),
  ADD KEY FBUSUARIO (FBUSUARIO),
  ADD KEY TWUSUARIO (TWUSUARIO),
  ADD KEY USUPLAN (USUPLAN);

--
-- Indexes for table lp2008_usuarios190712
--
ALTER TABLE lp2008_usuarios190712
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO (USUARIO),
  ADD UNIQUE KEY EMAIL (EMAIL),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY SECTOR (SECTOR),
  ADD KEY PAIS (PAIS);

--
-- Indexes for table lp2008_usuarios200912
--
ALTER TABLE lp2008_usuarios200912
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO (USUARIO),
  ADD UNIQUE KEY EMAIL (EMAIL),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY SECTOR (SECTOR),
  ADD KEY PAIS (PAIS);

--
-- Indexes for table lp2008_usuariosbk0112
--
ALTER TABLE lp2008_usuariosbk0112
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO (USUARIO),
  ADD UNIQUE KEY EMAIL (EMAIL),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY SECTOR (SECTOR),
  ADD KEY PAIS (PAIS),
  ADD KEY FBUSUARIO (FBUSUARIO),
  ADD KEY TWUSUARIO (TWUSUARIO),
  ADD KEY USUPLANN (USUPLANN);

--
-- Indexes for table lp2008_usuariosold
--
ALTER TABLE lp2008_usuariosold
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO (USUARIO),
  ADD UNIQUE KEY EMAIL (EMAIL),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY SECTOR (SECTOR),
  ADD KEY PAIS (PAIS);

--
-- Indexes for table lp2008_usuariosold0202
--
ALTER TABLE lp2008_usuariosold0202
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO (USUARIO),
  ADD UNIQUE KEY EMAIL (EMAIL),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY SECTOR (SECTOR),
  ADD KEY FBUSUARIO (FBUSUARIO),
  ADD KEY TWUSUARIO (TWUSUARIO);

--
-- Indexes for table lp2008_usuariosold021216
--
ALTER TABLE lp2008_usuariosold021216
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO (USUARIO),
  ADD UNIQUE KEY EMAIL (EMAIL),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY SECTOR (SECTOR),
  ADD KEY PAIS (PAIS),
  ADD KEY FBUSUARIO (FBUSUARIO),
  ADD KEY TWUSUARIO (TWUSUARIO);

--
-- Indexes for table lp2008_usuariosold110516
--
ALTER TABLE lp2008_usuariosold110516
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO (USUARIO),
  ADD UNIQUE KEY EMAIL (EMAIL),
  ADD KEY PROVINCIA (PROVINCIA),
  ADD KEY SECTOR (SECTOR),
  ADD KEY PAIS (PAIS),
  ADD KEY FBUSUARIO (FBUSUARIO),
  ADD KEY TWUSUARIO (TWUSUARIO);

--
-- Indexes for table lp2008_usubusca
--
ALTER TABLE lp2008_usubusca
  ADD PRIMARY KEY (ID),
  ADD KEY USUARIO (USUARIO);

--
-- Indexes for table lp2008_usuoauth
--
ALTER TABLE lp2008_usuoauth
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_usupalabras
--
ALTER TABLE lp2008_usupalabras
  ADD PRIMARY KEY (ID),
  ADD KEY USUARIO_ID (USUARIO_ID);
ALTER TABLE lp2008_usupalabras ADD FULLTEXT KEY PALABRA (PALABRA);

--
-- Indexes for table lp2008_usuproc
--
ALTER TABLE lp2008_usuproc
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY USUARIO_ID (USUARIO_ID,TIPO);

--
-- Indexes for table lp2008_usupromo
--
ALTER TABLE lp2008_usupromo
  ADD PRIMARY KEY (USUARIO_ID,PROMO);

--
-- Indexes for table lp2008_usupub
--
ALTER TABLE lp2008_usupub
  ADD PRIMARY KEY (USUARIO_ID,ARTICULO_ID);

--
-- Indexes for table lp2008_usutemp
--
ALTER TABLE lp2008_usutemp
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY EMAIL (EMAIL),
  ADD UNIQUE KEY USUARIO (USUARIO);

--
-- Indexes for table lp2008_usuvip
--
ALTER TABLE lp2008_usuvip
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_usuvisto
--
ALTER TABLE lp2008_usuvisto
  ADD PRIMARY KEY (USUARIO_ID);

--
-- Indexes for table lp2008_vehiculos
--
ALTER TABLE lp2008_vehiculos
  ADD PRIMARY KEY (ARTICULO_ID),
  ADD KEY MARCA (MARCAVE),
  ADD KEY MODELO (MODELO),
  ADD KEY ANIO (ANIO),
  ADD KEY COMBUSTIBLE (COMBUSTIBLE),
  ADD KEY TRANSMISION (TRANSMISION);

--
-- Indexes for table lp2008_vehiculosbk
--
ALTER TABLE lp2008_vehiculosbk
  ADD PRIMARY KEY (ARTICULO_ID),
  ADD KEY MARCA (MARCAVE),
  ADD KEY MODELO (MODELO),
  ADD KEY ANIO (ANIO),
  ADD KEY COMBUSTIBLE (COMBUSTIBLE),
  ADD KEY TRANSMISION (TRANSMISION);

--
-- Indexes for table lp2008_vehiculosbk1
--
ALTER TABLE lp2008_vehiculosbk1
  ADD PRIMARY KEY (ARTICULO_ID),
  ADD KEY MARCA (MARCAVE),
  ADD KEY MODELO (MODELO),
  ADD KEY ANIO (ANIO),
  ADD KEY COMBUSTIBLE (COMBUSTIBLE),
  ADD KEY TRANSMISION (TRANSMISION);

--
-- Indexes for table lp2008_vehiculosold130516
--
ALTER TABLE lp2008_vehiculosold130516
  ADD PRIMARY KEY (ARTICULO_ID),
  ADD KEY MARCA (MARCAVE),
  ADD KEY MODELO (MODELO),
  ADD KEY ANIO (ANIO),
  ADD KEY COMBUSTIBLE (COMBUSTIBLE);

--
-- Indexes for table lp2008_vehiculos_old
--
ALTER TABLE lp2008_vehiculos_old
  ADD PRIMARY KEY (ARTICULO_ID),
  ADD KEY MARCA (MARCAVE),
  ADD KEY MODELO (MODELO),
  ADD KEY ANIO (ANIO),
  ADD KEY COMBUSTIBLE (COMBUSTIBLE),
  ADD KEY TRANSMISION (TRANSMISION);

--
-- Indexes for table lp2008_vehmarca
--
ALTER TABLE lp2008_vehmarca
  ADD PRIMARY KEY (ID);
ALTER TABLE lp2008_vehmarca ADD FULLTEXT KEY MARCA (MARCA);

--
-- Indexes for table lp2008_vehmarcaold11-12-14
--
ALTER TABLE lp2008_vehmarcaold11-12-14
  ADD PRIMARY KEY (ID);
ALTER TABLE lp2008_vehmarcaold11-12-14 ADD FULLTEXT KEY MARCA (MARCA);

--
-- Indexes for table lp2008_vehmarca_old231214
--
ALTER TABLE lp2008_vehmarca_old231214
  ADD PRIMARY KEY (ID);
ALTER TABLE lp2008_vehmarca_old231214 ADD FULLTEXT KEY MARCA (MARCA);

--
-- Indexes for table lp2008_vehmodelo
--
ALTER TABLE lp2008_vehmodelo
  ADD PRIMARY KEY (ID);
ALTER TABLE lp2008_vehmodelo ADD FULLTEXT KEY MODELO (MODELO);

--
-- Indexes for table lp2008_vehmodelo1
--
ALTER TABLE lp2008_vehmodelo1
  ADD PRIMARY KEY (ID);
ALTER TABLE lp2008_vehmodelo1 ADD FULLTEXT KEY MODELO (MODELO);

--
-- Indexes for table lp2008_vehmodelonew
--
ALTER TABLE lp2008_vehmodelonew
  ADD PRIMARY KEY (ID);
ALTER TABLE lp2008_vehmodelonew ADD FULLTEXT KEY MODELO (MODELO);

--
-- Indexes for table lp2008_vehmodeloold11-12-14
--
ALTER TABLE lp2008_vehmodeloold11-12-14
  ADD PRIMARY KEY (ID);
ALTER TABLE lp2008_vehmodeloold11-12-14 ADD FULLTEXT KEY MODELO (MODELO);

--
-- Indexes for table lp2008_vipmultiple
--
ALTER TABLE lp2008_vipmultiple
  ADD PRIMARY KEY (ID),
  ADD KEY ARTICULO_ID (ARTICULO_ID),
  ADD KEY TIPO (HASTA),
  ADD KEY SIGUIENTE (SIGUIENTE),
  ADD KEY ORDEN (ORDEN);

--
-- Indexes for table lp2008_votos
--
ALTER TABLE lp2008_votos
  ADD PRIMARY KEY (VOTO_ID),
  ADD KEY id (ID);

--
-- Indexes for table lp2008_whatsapp
--
ALTER TABLE lp2008_whatsapp
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_whatsappdos
--
ALTER TABLE lp2008_whatsappdos
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_whatsappmarialuisa
--
ALTER TABLE lp2008_whatsappmarialuisa
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_whatsapptres
--
ALTER TABLE lp2008_whatsapptres
  ADD PRIMARY KEY (ID);

--
-- Indexes for table lp2008_youtube
--
ALTER TABLE lp2008_youtube
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY URLVIDEO (URLVIDEO),
  ADD UNIQUE KEY ARTICULO_ID (ARTICULO_ID);
ALTER TABLE lp2008_youtube ADD FULLTEXT KEY TITULO (TITULO);

--
-- Indexes for table lp2010_descripcionr
--
ALTER TABLE lp2010_descripcionr
  ADD PRIMARY KEY (ARTICULO_ID);
ALTER TABLE lp2010_descripcionr ADD FULLTEXT KEY DESCRIPCION (DESCRIPCION);

--
-- Indexes for table lp2011_sectores
--
ALTER TABLE lp2011_sectores
  ADD PRIMARY KEY (ID),
  ADD KEY PROVINCIA_ID (PROVINCIA_ID);

--
-- Indexes for table lp2011_sectorescomun
--
ALTER TABLE lp2011_sectorescomun
  ADD PRIMARY KEY (ID),
  ADD UNIQUE KEY PROVINCIA_ID (PROVINCIA_ID,SECTOR);
ALTER TABLE lp2011_sectorescomun ADD FULLTEXT KEY SECTOR (SECTOR);

--
-- Indexes for table lp2011_vehiculos
--
ALTER TABLE lp2011_vehiculos
  ADD PRIMARY KEY (ARTICULO_ID),
  ADD KEY MARCA (MARCAVE),
  ADD KEY MODELO (MODELO),
  ADD KEY ANIO (ANIO),
  ADD KEY COMBUSTIBLE (COMBUSTIBLE),
  ADD KEY TRANSMISION (TRANSMISION);

--
-- Indexes for table lp2012_descripcion
--
ALTER TABLE lp2012_descripcion
  ADD PRIMARY KEY (ARTICULO_ID);
ALTER TABLE lp2012_descripcion ADD FULLTEXT KEY DESCRIPCION (DESCRIPCION);

--
-- Indexes for table lp2013_descripcion
--
ALTER TABLE lp2013_descripcion
  ADD PRIMARY KEY (ARTICULO_ID);
ALTER TABLE lp2013_descripcion ADD FULLTEXT KEY DESCRIPCION (DESCRIPCION);

--
-- Indexes for table votos
--
ALTER TABLE votos
  ADD KEY id (id);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table articles
--
ALTER TABLE articles
  MODIFY id bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table email_usuariosnueva
--
ALTER TABLE email_usuariosnueva
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_adicionales
--
ALTER TABLE lp2008_adicionales
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_areaofertas
--
ALTER TABLE lp2008_areaofertas
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_articulos
--
ALTER TABLE lp2008_articulos
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_articulos030316
--
ALTER TABLE lp2008_articulos030316
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_articulos20200421
--
ALTER TABLE lp2008_articulos20200421
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_articulosantesbono
--
ALTER TABLE lp2008_articulosantesbono
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_articuloslocal20092012
--
ALTER TABLE lp2008_articuloslocal20092012
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_articulosold
--
ALTER TABLE lp2008_articulosold
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_articulosold0202
--
ALTER TABLE lp2008_articulosold0202
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_articulosold060716
--
ALTER TABLE lp2008_articulosold060716
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_articulosold110516
--
ALTER TABLE lp2008_articulosold110516
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_articulosold120217
--
ALTER TABLE lp2008_articulosold120217
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_articulosr
--
ALTER TABLE lp2008_articulosr
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_articulos_old
--
ALTER TABLE lp2008_articulos_old
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_articulos_old2015
--
ALTER TABLE lp2008_articulos_old2015
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_arttemp
--
ALTER TABLE lp2008_arttemp
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_autocompleta
--
ALTER TABLE lp2008_autocompleta
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID DEL REGISTRO';

--
-- AUTO_INCREMENT for table lp2008_busquedas
--
ALTER TABLE lp2008_busquedas
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_buzon
--
ALTER TABLE lp2008_buzon
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_cambioregistro
--
ALTER TABLE lp2008_cambioregistro
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_cemarca
--
ALTER TABLE lp2008_cemarca
  MODIFY ID tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_cemarca_old231214
--
ALTER TABLE lp2008_cemarca_old231214
  MODIFY ID tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_cemodelo
--
ALTER TABLE lp2008_cemodelo
  MODIFY ID smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_cemodelo_old231214
--
ALTER TABLE lp2008_cemodelo_old231214
  MODIFY ID smallint(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_centrosdist
--
ALTER TABLE lp2008_centrosdist
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_clicktrack
--
ALTER TABLE lp2008_clicktrack
  MODIFY ID bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_comusu
--
ALTER TABLE lp2008_comusu
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_copiaopcionales
--
ALTER TABLE lp2008_copiaopcionales
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_eliart
--
ALTER TABLE lp2008_eliart
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_encuestas
--
ALTER TABLE lp2008_encuestas
  MODIFY ID bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_enlpatr
--
ALTER TABLE lp2008_enlpatr
  MODIFY ID mediumint(5) NOT NULL AUTO_INCREMENT COMMENT 'ID que identifica el enlace patrocinado';

--
-- AUTO_INCREMENT for table lp2008_expreso
--
ALTER TABLE lp2008_expreso
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_extensiones
--
ALTER TABLE lp2008_extensiones
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_faq
--
ALTER TABLE lp2008_faq
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_favoritas
--
ALTER TABLE lp2008_favoritas
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_favoritosold
--
ALTER TABLE lp2008_favoritosold
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_financieras
--
ALTER TABLE lp2008_financieras
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_ip2c
--
ALTER TABLE lp2008_ip2c
  MODIFY id int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_linkaplan
--
ALTER TABLE lp2008_linkaplan
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_listanegra
--
ALTER TABLE lp2008_listanegra
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_log_acciones
--
ALTER TABLE lp2008_log_acciones
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_log_buscar
--
ALTER TABLE lp2008_log_buscar
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_log_buscar1
--
ALTER TABLE lp2008_log_buscar1
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_log_click
--
ALTER TABLE lp2008_log_click
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_log_emailactual
--
ALTER TABLE lp2008_log_emailactual
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_log_envmsg
--
ALTER TABLE lp2008_log_envmsg
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_log_logins
--
ALTER TABLE lp2008_log_logins
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_log_notifica
--
ALTER TABLE lp2008_log_notifica
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_log_palabras
--
ALTER TABLE lp2008_log_palabras
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_log_pines
--
ALTER TABLE lp2008_log_pines
  MODIFY ID int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id del registro';

--
-- AUTO_INCREMENT for table lp2008_log_pinesviejosistema
--
ALTER TABLE lp2008_log_pinesviejosistema
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_lpbonos
--
ALTER TABLE lp2008_lpbonos
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_lppuntos
--
ALTER TABLE lp2008_lppuntos
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_marcas
--
ALTER TABLE lp2008_marcas
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_mensajeria
--
ALTER TABLE lp2008_mensajeria
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_mensajeria_old
--
ALTER TABLE lp2008_mensajeria_old
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_mensajes
--
ALTER TABLE lp2008_mensajes
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_mensajes_old
--
ALTER TABLE lp2008_mensajes_old
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_modelos
--
ALTER TABLE lp2008_modelos
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_modelosold080816
--
ALTER TABLE lp2008_modelosold080816
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_msgarticulo
--
ALTER TABLE lp2008_msgarticulo
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_msgcintillo
--
ALTER TABLE lp2008_msgcintillo
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_municipios
--
ALTER TABLE lp2008_municipios
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_municipiosn
--
ALTER TABLE lp2008_municipiosn
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_nologin
--
ALTER TABLE lp2008_nologin
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_notelefono
--
ALTER TABLE lp2008_notelefono
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_opcionales
--
ALTER TABLE lp2008_opcionales
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_opcionalesajax
--
ALTER TABLE lp2008_opcionalesajax
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_opcionalesbk
--
ALTER TABLE lp2008_opcionalesbk
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_opcionalesbk010711
--
ALTER TABLE lp2008_opcionalesbk010711
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_opcionalesold
--
ALTER TABLE lp2008_opcionalesold
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_opcionales_old
--
ALTER TABLE lp2008_opcionales_old
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_palabras
--
ALTER TABLE lp2008_palabras
  MODIFY ID tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_penalidades
--
ALTER TABLE lp2008_penalidades
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_planenlista
--
ALTER TABLE lp2008_planenlista
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_planesold
--
ALTER TABLE lp2008_planesold
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_porprv
--
ALTER TABLE lp2008_porprv
  MODIFY PROVINCIA_ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_prefijotel
--
ALTER TABLE lp2008_prefijotel
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_preftipotel
--
ALTER TABLE lp2008_preftipotel
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_prestamos
--
ALTER TABLE lp2008_prestamos
  MODIFY ID mediumint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_referidos
--
ALTER TABLE lp2008_referidos
  MODIFY ID int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_referidos_old
--
ALTER TABLE lp2008_referidos_old
  MODIFY ID int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_renovaarticulo
--
ALTER TABLE lp2008_renovaarticulo
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_renovatodo
--
ALTER TABLE lp2008_renovatodo
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_repuestos
--
ALTER TABLE lp2008_repuestos
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_sectores
--
ALTER TABLE lp2008_sectores
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_sectoresbk1
--
ALTER TABLE lp2008_sectoresbk1
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_sectoresbkjson
--
ALTER TABLE lp2008_sectoresbkjson
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_sectoresold0602
--
ALTER TABLE lp2008_sectoresold0602
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_servicios
--
ALTER TABLE lp2008_servicios
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_servicios25-07-2012
--
ALTER TABLE lp2008_servicios25-07-2012
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_servicios140715
--
ALTER TABLE lp2008_servicios140715
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_serviciosbk
--
ALTER TABLE lp2008_serviciosbk
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_serviciosbk24-07-12
--
ALTER TABLE lp2008_serviciosbk24-07-12
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_servicioscat
--
ALTER TABLE lp2008_servicioscat
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_servicioscatpclavesno
--
ALTER TABLE lp2008_servicioscatpclavesno
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_serviciosold
--
ALTER TABLE lp2008_serviciosold
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_serviciossubir020912
--
ALTER TABLE lp2008_serviciossubir020912
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_solpiezas
--
ALTER TABLE lp2008_solpiezas
  MODIFY ID mediumint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_soporte
--
ALTER TABLE lp2008_soporte
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_subcategorias
--
ALTER TABLE lp2008_subcategorias
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_subcategorias 03-2016
--
ALTER TABLE lp2008_subcategorias 03-2016
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_subcategorias12-2014
--
ALTER TABLE lp2008_subcategorias12-2014
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_subcategoriasnew
--
ALTER TABLE lp2008_subcategoriasnew
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_subcategoriasold19-07-17
--
ALTER TABLE lp2008_subcategoriasold19-07-17
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_subcategoriasold210417
--
ALTER TABLE lp2008_subcategoriasold210417
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_subcategorias_2022
--
ALTER TABLE lp2008_subcategorias_2022
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_subcategorias_bk
--
ALTER TABLE lp2008_subcategorias_bk
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_subcategorias_bk1
--
ALTER TABLE lp2008_subcategorias_bk1
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_transacciones
--
ALTER TABLE lp2008_transacciones
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_transacciones130520
--
ALTER TABLE lp2008_transacciones130520
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_transaccionesold
--
ALTER TABLE lp2008_transaccionesold
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usuarios
--
ALTER TABLE lp2008_usuarios
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usuarios02020421
--
ALTER TABLE lp2008_usuarios02020421
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usuarios180218
--
ALTER TABLE lp2008_usuarios180218
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usuarios190712
--
ALTER TABLE lp2008_usuarios190712
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usuarios200912
--
ALTER TABLE lp2008_usuarios200912
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usuariosbk0112
--
ALTER TABLE lp2008_usuariosbk0112
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usuariosold
--
ALTER TABLE lp2008_usuariosold
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usuariosold0202
--
ALTER TABLE lp2008_usuariosold0202
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usuariosold021216
--
ALTER TABLE lp2008_usuariosold021216
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usuariosold110516
--
ALTER TABLE lp2008_usuariosold110516
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usubusca
--
ALTER TABLE lp2008_usubusca
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usuoauth
--
ALTER TABLE lp2008_usuoauth
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usupalabras
--
ALTER TABLE lp2008_usupalabras
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usuproc
--
ALTER TABLE lp2008_usuproc
  MODIFY ID tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usutemp
--
ALTER TABLE lp2008_usutemp
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_usuvip
--
ALTER TABLE lp2008_usuvip
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_vehmarca
--
ALTER TABLE lp2008_vehmarca
  MODIFY ID smallint(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_vehmarcaold11-12-14
--
ALTER TABLE lp2008_vehmarcaold11-12-14
  MODIFY ID smallint(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_vehmarca_old231214
--
ALTER TABLE lp2008_vehmarca_old231214
  MODIFY ID smallint(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_vehmodelo
--
ALTER TABLE lp2008_vehmodelo
  MODIFY ID smallint(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_vehmodelo1
--
ALTER TABLE lp2008_vehmodelo1
  MODIFY ID smallint(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_vehmodelonew
--
ALTER TABLE lp2008_vehmodelonew
  MODIFY ID smallint(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_vehmodeloold11-12-14
--
ALTER TABLE lp2008_vehmodeloold11-12-14
  MODIFY ID smallint(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_vipmultiple
--
ALTER TABLE lp2008_vipmultiple
  MODIFY ID mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_votos
--
ALTER TABLE lp2008_votos
  MODIFY VOTO_ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_whatsapp
--
ALTER TABLE lp2008_whatsapp
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_whatsappdos
--
ALTER TABLE lp2008_whatsappdos
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_whatsappmarialuisa
--
ALTER TABLE lp2008_whatsappmarialuisa
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_whatsapptres
--
ALTER TABLE lp2008_whatsapptres
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table lp2008_youtube
--
ALTER TABLE lp2008_youtube
  MODIFY ID smallint(6) NOT NULL AUTO_INCREMENT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
