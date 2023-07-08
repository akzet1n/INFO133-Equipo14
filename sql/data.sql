-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: medios_de_prensa
-- ------------------------------------------------------
-- Server version	10.11.4-MariaDB-1:10.11.4+maria~deb11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoriasMedios`
--

DROP TABLE IF EXISTS `categoriasMedios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoriasMedios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medio` int(11) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ejemplo` varchar(255) DEFAULT NULL,
  `xpath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medio` (`medio`),
  KEY `nombre` (`nombre`),
  CONSTRAINT `categoriasMedios_ibfk_1` FOREIGN KEY (`medio`) REFERENCES `medios` (`id`),
  CONSTRAINT `categoriasMedios_ibfk_2` FOREIGN KEY (`nombre`) REFERENCES `datosCategorias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriasMedios`
--

LOCK TABLES `categoriasMedios` WRITE;
/*!40000 ALTER TABLE `categoriasMedios` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoriasMedios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coberturasMedios`
--

DROP TABLE IF EXISTS `coberturasMedios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coberturasMedios` (
  `medio` int(11) NOT NULL,
  `cobertura` int(11) NOT NULL,
  PRIMARY KEY (`medio`,`cobertura`),
  KEY `cobertura` (`cobertura`),
  CONSTRAINT `coberturasMedios_ibfk_1` FOREIGN KEY (`medio`) REFERENCES `medios` (`id`),
  CONSTRAINT `coberturasMedios_ibfk_2` FOREIGN KEY (`cobertura`) REFERENCES `datosCoberturas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coberturasMedios`
--

LOCK TABLES `coberturasMedios` WRITE;
/*!40000 ALTER TABLE `coberturasMedios` DISABLE KEYS */;
INSERT INTO `coberturasMedios` VALUES
(2,1),
(2,2),
(2,3),
(3,1),
(3,2),
(3,3),
(4,1),
(4,2),
(5,1),
(5,2),
(5,3),
(7,1),
(7,2),
(7,3),
(8,1),
(8,2),
(8,3),
(9,1),
(9,2),
(9,3),
(10,1),
(10,2),
(10,3),
(11,1),
(11,2),
(11,3),
(12,1),
(12,2),
(12,3),
(13,1),
(13,2),
(13,3),
(14,1),
(14,2),
(14,3),
(15,1),
(15,2),
(15,3),
(16,1),
(16,2),
(16,3),
(17,1),
(17,2),
(17,3),
(18,1),
(18,2),
(18,3),
(21,1),
(21,2),
(21,3),
(23,1),
(23,2),
(23,3),
(24,1),
(24,2),
(24,3),
(25,1),
(25,2),
(25,3),
(26,1),
(26,2),
(26,3),
(27,1),
(27,2),
(27,3),
(28,1),
(28,2),
(28,3),
(29,1),
(29,2),
(29,3),
(31,1),
(31,2),
(31,3),
(32,1),
(32,2),
(32,3),
(34,1),
(34,2),
(34,3),
(35,1),
(35,2),
(37,1),
(37,2),
(37,3),
(38,1),
(38,2),
(38,3),
(39,1),
(39,2),
(39,3),
(40,1),
(40,2),
(40,3),
(41,1),
(41,2),
(41,3),
(42,1),
(42,2),
(42,3),
(43,1),
(43,2),
(43,3),
(45,1),
(45,2),
(47,1),
(47,2),
(47,3),
(48,1),
(48,2),
(48,3),
(49,1),
(49,2),
(49,3),
(50,2),
(50,3),
(51,1),
(51,2),
(51,3),
(52,1),
(52,2),
(52,3),
(53,1),
(53,2),
(53,3),
(54,1),
(54,2),
(56,2),
(56,3),
(57,2),
(57,3),
(58,1),
(58,2),
(58,3),
(59,2),
(59,3),
(60,1),
(60,2),
(60,3),
(61,1),
(61,2),
(61,3);
/*!40000 ALTER TABLE `coberturasMedios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosCategorias`
--

DROP TABLE IF EXISTS `datosCategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datosCategorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosCategorias`
--

LOCK TABLES `datosCategorias` WRITE;
/*!40000 ALTER TABLE `datosCategorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `datosCategorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosCoberturas`
--

DROP TABLE IF EXISTS `datosCoberturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datosCoberturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosCoberturas`
--

LOCK TABLES `datosCoberturas` WRITE;
/*!40000 ALTER TABLE `datosCoberturas` DISABLE KEYS */;
INSERT INTO `datosCoberturas` VALUES
(1,'Local'),
(2,'Nacional'),
(3,'Internacional');
/*!40000 ALTER TABLE `datosCoberturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosFundadores`
--

DROP TABLE IF EXISTS `datosFundadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datosFundadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `nacionalidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosFundadores`
--

LOCK TABLES `datosFundadores` WRITE;
/*!40000 ALTER TABLE `datosFundadores` DISABLE KEYS */;
INSERT INTO `datosFundadores` VALUES
(2,'Arturo','Pellerano','Dominicano'),
(3,'Luis','Caminero','Dominicano'),
(4,'Rita','Cabrer','Dominicana'),
(6,'Álex','Jimenez','Dominicano'),
(7,'Jairon','Severino','Dominicano'),
(8,'Stanley','Ross','Estadounidense'),
(9,'José','Corripio','Española'),
(10,'Rafael','Morillo','Dominicano'),
(11,'Persio','Maldonado','Dominicano'),
(12,'Adriano','Cruz','Dominicano'),
(13,'Dionisio','Nuñez','Dominicano'),
(14,'Ulises Bido','Bido','Dominicano'),
(15,'Jose','Tejeda','Dominicano'),
(19,'Yuly','Arroyo','Dominicana'),
(20,'Juan','Gómez','Dominicano'),
(21,'Bienvenido','Rodriguez','Dominicano'),
(22,'Fernando','Peña','Dominicano'),
(24,'German','Ornes','Dominicano'),
(25,'Luis','Olavarrieta','Dominicano'),
(26,'Pedro','Hungría','Dominicano'),
(27,'Alfredo','Rojas','Dominicano'),
(28,'Armando','Hungría','Dominicano'),
(30,'Luis','Canela',NULL),
(31,'Saúl','Pimentel','Dominicano'),
(32,'Robert','Vargas','Dominicano'),
(33,'Alex Diaz','Dominicano',NULL),
(34,'Fausto','Rosario','Dominicano'),
(35,'Gustavo','Oliv','Dominicano'),
(36,'Benny','Rodriguez','Dominicano'),
(37,'Anulfo','Perez','Dominicano'),
(38,'Norberto','Rubio','Dominicano'),
(39,'Yenifer','Gil','Dominicana');
/*!40000 ALTER TABLE `datosFundadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosRedes`
--

DROP TABLE IF EXISTS `datosRedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datosRedes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosRedes`
--

LOCK TABLES `datosRedes` WRITE;
/*!40000 ALTER TABLE `datosRedes` DISABLE KEYS */;
INSERT INTO `datosRedes` VALUES
(1,'Facebook'),
(2,'Instagram'),
(3,'Twitter');
/*!40000 ALTER TABLE `datosRedes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejemplos`
--

DROP TABLE IF EXISTS `ejemplos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ejemplos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medio` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `xpath_fecha` varchar(255) DEFAULT NULL,
  `xpath_titulo` varchar(255) DEFAULT NULL,
  `xpath_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medio` (`medio`),
  CONSTRAINT `ejemplos_ibfk_1` FOREIGN KEY (`medio`) REFERENCES `medios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejemplos`
--

LOCK TABLES `ejemplos` WRITE;
/*!40000 ALTER TABLE `ejemplos` DISABLE KEYS */;
INSERT INTO `ejemplos` VALUES
(1,2,'https://www.diariolibre.com/actualidad/politica/2023/07/06/auditorias-se-revisaran-en-otros-paises/2396565','//meta[@name=\"ArticlePublicationDate\"]/@content','//h1[@class=\"text-2xl mb-2\"]','//div[@class=\"detail-body text-lg\"]'),
(2,3,'https://listindiario.com/la-republica/20230707/interior-policia-afirma-ilegal-extranjeros-realicen-marchas-republica-dominicana_762410.html','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"c-detail__title\"]','//div[@class=\"c-detail__body\"]'),
(3,4,'https://bohionews.com/con-recursos-encaje-legal-1755-prestamos-a-familias-beneficiarias-y-35-prestamos-a-empresas-constructoras/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"entry-title\"]','//div[@class=\"td-post-content td-pb-padding-side\"]'),
(4,5,'https://noticiassin.com/pais/esta-listo-el-informe-sobre-camara-de-cuentas-dice-presidente-de-la-comision-especial-que-investigo-el-conflicto-1453795/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"single-title\"]','//div[@class=\"nota-content\"]'),
(5,7,'https://primicias.net/web/seis-claves-para-que-el-negocio-avance/','//div[@class=\"entry-header\"]//div[@class=\"post-meta clearfix\"]//span[@class=\"date meta-item tie-icon\"]\r\n','//h1[@class=\"post-title entry-title\"]','//div[@class=\"entry-content entry clearfix\"]'),
(6,8,'https://eldinero.com.do/237348/tasas-de-interes-siguen-altas-a-pesar-de-esfuerzos-del-banco-central-por-bajarlas/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"jeg_post_title\"]','//div[@class=\"content-inner\"]'),
(7,9,'https://www.elcaribe.com.do/panorama/justicia/disuelven-condena-a-micky-lopez/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"entry-title\"]','//div[@class=\"content\"]'),
(8,10,'https://hoy.com.do/prestamos-congreso-ha-tomado-223-mil-millones/','//meta[@property=\"article:published_time\"]/@content','//h2[@class=\"post-title lg\"]','//div[@class=\"entry-content\"]'),
(9,11,'https://elnacional.com.do/fue-suspendido-consul-en-barcelona-involucrado-en-accidente-de-transito/','//meta[@property=\"article:published_time\"]/@content','//h2[@class=\"utf_post_title\"]','//div[@class=\"entry-content\"]'),
(10,12,'https://elsoldominicano.com/adolescente-cae-abatido-tras-enfrentar-a-tiros-contingente-policial-en-medio-de-un-operativo/','//time','//h1[@class=\"entry-title single-post-title\"]','//div[@class=\"entry-content\"]'),
(11,13,'https://elnuevodiario.com.do/en-2022-el-pais-retomo-su-senda-historica-de-crecimiento-sostiene-informe-del-mepyd/','//meta[@property=\"article:published_time\"]/@content','//h2[@itemprop=\"headline\"]','//div[@class=\"col-md-9 col-12 pe-md-2 details\"]'),
(12,14,'https://www.eljaya.com/169907/fallece-dona-viola-altagracia-concepcion-castillo/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"jeg_post_title\"]','//div[@class=\"content-inner \"]'),
(13,15,'https://eldia.com.do/faride-raful-nadie-en-este-pais-puede-decir-que-yo-he-sobornado-o-que-yo-he-robado/','//meta[@property=\"article:published_time\"]/@content','//h2[@class=\"post-title lg\"]','//div[@class=\"entry-content\"]'),
(14,16,'https://eltiempo.com.do/destacado/el-casco-urbano-de-higuey-tiene-potencial-turistico-pero-carece-de-atencion/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"tdb-title-text\"]','//div[@class=\"tdb-block-inner td-fix-index\"]'),
(15,17,'https://www.diariodigital.com.do/2023/07/07/decomisan-mas-de-92-toneladas-de-drogas-durante-casi-tres-anos-gobierno-de-abinader.html/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"jeg_post_title\"]','//div[@class=\"content-inner \"]'),
(16,18,'https://www.telenord.com/noticias/internacionales/56364-mexico-espera-formacion-de-ciclon-tropical-en-pacifico-y-lluvias-intensas-en-tres-estados','//meta[@property=\"datePublished\"]/@content','//h1[@property=\"headline\"]','//div[@property=\"text\"]'),
(18,21,'https://cdn.com.do/nacionales/hipolito-desaprueba-juicio-politico-camara-de-cuentas/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"entry-title\"]','//div[@class=\"entry-content\"]'),
(19,23,'http://www.quisqueyanews.info/rd-traspasa-a-espana-la-presidencia-de-la-iniciativa-iberoamericana-para-prevenir-y-eliminar-la-violencia-contra-las-mujeres/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"post-title\"]','//div[@class=\"post-content post-dynamic\"]'),
(20,24,'https://ntelemicro.com/pld-busca-alianzas-con-fuerza-del-pueblo-y-otros-partidos-para-elecciones-municipales/','//meta[@property=\"article:published_time\"]/@content','//div[@class=\"entry-header\"]//h1[@class=\"jeg_post_title\"]','//div[@class=\"entry-content no-share\"]//div[@class=\"content-inner \"]'),
(21,25,'https://dominicantoday.com/dr/local/2023/07/05/the-dominican-republic-registers-the-highest-energy-demand-in-its-history/','//meta[@itemprop=\"datePublished\"]/@content','//h1[@itemprop=\"headline\"]','//span[@itemprop=\"description\"]'),
(22,26,'https://diariocibao.com/fatal-caida-en-puerto-plata-joven-fallece-y-otros-tres-luchan-por-sobrevivir/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"entry-title\"]','//div[@class=\"td-post-content tagdiv-type\"]'),
(23,27,'https://z101digital.com/interior-y-policia-afirma-es-ilegal-que-extranjeros-realicen-marchas-en-la-rd/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"title-post-single\"]','//div[@class=\"col-md-8 single-post-imgs-light-box-container\"]'),
(24,28,'https://frontera25.net/cancilleria-suspende-a-cesar-mendez-el-consul-dominicano-en-barcelona-involucrado-en-incidente/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"mvp-post-title left entry-title\"]','//div[@id=\"mvp-content-main\"]'),
(25,29,'https://www.diariodom.com/noticias/index.php?id=323440','//span[@class=\"created\"]','//h1[@class=\"title\"]','//p[@style=\"text-align: justify;\"]'),
(26,31,'https://teleantillas.com.do/nacionales/dirigente-de-la-fp-francisco-guillen-inscribe-precandidatura-a-diputado-por-dn/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"post-title entry-title\"]','//div[@class=\"entry-content entry clearfix\"]'),
(27,32,'https://www.lainformacion.com.do/nacion/santo-domingo/bc-dice-encaje-legal-destina-rddollar-6-618-millones-para-viviendas-de-bajo-costo','//ul[@class=\"do-not-print\"]//li','//div[@class=\"post-full mt-3 mb-2\"]//h1[@class=\"title\"]','//div[@class=\"content content-body\"]'),
(28,35,'https://www.puertoplatadigital.com/verNoticia.aspx?Id=41105','//span[@id=\"ctl00_ContentPlaceHolder1_lblFecha\"]','//span[@id=\"ctl00_ContentPlaceHolder1_lblTitulo\"]','//span[@id=\"ctl00_ContentPlaceHolder1_lblContenido\"]'),
(29,34,'https://almomento.net/rechazan-pongan-boyas-en-rio-grande-contra-cruce-de-migrantes/','//div[@class=\"post_author\"]/ul/li[2]','//h1[@class=\"entry-title\"]','//p[@class=\"entry-content\"]'),
(30,38,'https://lascalientesdelsur.com/nacionales/499775/pn-abatio-uno-de-dos-presuntos-atracadores-en-el-puente-flotante-el-otro-se-fugo-lanzandose-al-rio.html','//time','//h1[@class=\"mvp-post-title left entry-title\"]','//div[@class=\"theiaPostSlider_preloadedSlide\"]'),
(31,37,'https://minutoaminuto.com.do/abinader-seguira-en-reposo-otros-cinco-dias-por-covid-la-evolucion-ha-sido-optima-dice-presidencia/','//meta[@property=\"article:published_time\"]/@content','//div[@class=\"introduction\"]//h1[@class=\"title\"]','//div[@class=\"content bass\"]'),
(32,39,'https://ciudadoriental.com/condenados-a-40-anos-tres-imputados-asesinar-escolta-de-jean-alain-y-locutor-manny-mendez/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"post-title entry-title\"]','//div[@class=\"entry-content entry clearfix\"]'),
(33,41,'http://elpulmondelademocracia.com/Locales1.aspx?codigo=103942','//span[@id=\"ContentPlaceHolder1_lbfecha\"]','//span[@id=\"ContentPlaceHolder1_lbfecha\"]','//span[@id=\"ContentPlaceHolder1_lbcontenido\"]'),
(34,40,'https://elgranerodelsur.com/2023/07/07/interior-y-policia-niega-permiso-para-marcha-de-haitianos-en-santo-domingo/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"post-title entry-title\"]','//div[@class=\"entry-content entry clearfix\"]'),
(35,42,'https://www.elpoderbanilejo.com/v6/index.php/bani/11603-policia-recupera-telefono-robado-mediante-seguimiento-electronico','//meta[@property=\"article:datePublished\"]/@content','//h1[@itemprop=\"headline\"]','//section[@class=\"article-content clearfix\"]'),
(36,43,'https://www.elfogondesanjuan.com/2023/07/en-san-juan-hombre-que-mato-su-hija-la.html','//a[@class=\"date\"]/span','//h1[@class=\"post-title single-title\"]','//div[@class=\"post-single-body post-body\"]'),
(37,45,'https://eljacaguero.com.do/dos-anos-del-magnicidio-de-moise-un-crimen-que-profundizo-el-declive-de-haiti/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"c-post__title\"]','//div[@class=\"c-content\"]'),
(38,47,'https://www.dajabon24horasrd.com/interior-y-policia-afirma-es-ilegal-que-extranjeros-realicen-marchas-en-la-rd/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"jeg_post_title\"]','//div[@class=\"content-inner \"]'),
(39,48,'https://www.dominicanoshoy.com/2023/07/07/recaudaciones-de-peajes-superaron-los-rd3290-millones-en-primer-semestre-de-2023/','//span[@class=\"post-date\"]','//h1[@class=\"post-title align-center single-post-title\"]','//div[@class=\"post-content\"]'),
(40,49,'https://loultimodigital.com/interior-y-policia-afirma-es-ilegal-extranjeros-realicen-marchas-rd/','//div[@class=\"tdb-head-date-txt\"]','//h1[@class=\"tdb-title-text\"]','//div[@class=\"td_block_wrap tdb_single_content tdi_77 td-pb-border-top td_block_template_1 td-post-content tagdiv-type\"]'),
(41,50,'https://vigilanteinformativo.com/pld-y-fp-comienzan-a-negociar-alianzas/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"entry-title\"]','//div[@class=\"td-post-content tagdiv-type\"]'),
(42,51,'https://acento.com.do/ecologia/construcciones-verdes-en-rd-mas-fomento-e-inversion-9221774.html','//time/@datetime','//section[@class=\"nota-top-part\"]/h1','//div[@class=\"article-body\"]'),
(43,53,'https://lalupadelsur.com/2023/07/07/interior-y-policia-desautoriza-marcha-de-diaspora-haitiana/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"jeg_post_title\"]','//div[@class=\"content-inner \"]'),
(44,52,'https://www.arecoa.com/rss1/2023/07/07/aerodom-arajet-ha-sido-determinante-para-el-crecimiento-de-pasajeros/','//div[@class=\"postWrapper\"]//small','//h1[@class=\"postTitle\"]/a','//div[@class=\"post content\"]'),
(45,54,'https://barrigaverde.net/oro-para-cuba-y-dominicana-en-canotaje-m-de-juegos-centroamericanos/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"post-title entry-title\"]','//div[@class=\"entry-content entry clearfix\"]'),
(46,56,'https://caobadigital.com/pistolero-que-disparo-fatalmente-a-23-compradores-en-el-paso-recibe-90-cadenas-perpetuas/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"tdb-title-text\"]','//div[@class=\"td_block_wrap tdb_mobile_menu tdi_7 td-pb-border-top td_block_template_1 tdb-header-align\"]'),
(47,57,'https://www.elmasacre.com/portada/71339/renuncia-coordinadora-provincial-de-la-juventud-del-proyecto-abel-martinez-y-regidora-del-pld-en-dajabon/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"tdb-title-text\"]','//div[@class=\"td_block_wrap tdb_single_content tdi_110 td-pb-border-top td_block_template_1 td-post-content tagdiv-type\"]'),
(48,58,'https://sabanetaprimero.com/delincuencia-asaltan-ganadero-en-su-residencia-y-lo-despojan-de-mas-de-rd-3-mm/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"post-title entry-title\"]','//div[@class=\"entry-content entry clearfix\"]'),
(49,59,'https://elinformante.com.do/candidato-alcalde-prm-asume-reto-de-planificar-a-santiago/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"tdb-title-text\"]','//div[@class=\"vc_column_inner tdi_78  wpb_column vc_column_container tdc-inner-column td-pb-span8\"]'),
(50,60,'http://www.bohechiodigital.com/2023/07/condenan-20-anos-de-prision-chulo-por.html','//span[@class=\"post-date published\"]','//h1[@class=\"post-title\"]','//div[@class=\"post-body post-content\"]'),
(51,61,'https://elatlantico.do/index.php/2023/07/07/condena-de-30-anos-para-hombre-que-corto-lengua-a-sobrino-de-5-anos-al-que-violaba-sexualmente/','//span[@class=\"ticker-item-date\"]','//h1[@class=\"entry-title\"]','//div[@class=\"entry-content clearfix\"]');
/*!40000 ALTER TABLE `ejemplos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fundadoresMedios`
--

DROP TABLE IF EXISTS `fundadoresMedios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fundadoresMedios` (
  `medio` int(11) NOT NULL,
  `fundador` int(11) NOT NULL,
  PRIMARY KEY (`medio`,`fundador`),
  KEY `fundador` (`fundador`),
  CONSTRAINT `fundadoresMedios_ibfk_1` FOREIGN KEY (`medio`) REFERENCES `medios` (`id`),
  CONSTRAINT `fundadoresMedios_ibfk_2` FOREIGN KEY (`fundador`) REFERENCES `datosFundadores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fundadoresMedios`
--

LOCK TABLES `fundadoresMedios` WRITE;
/*!40000 ALTER TABLE `fundadoresMedios` DISABLE KEYS */;
INSERT INTO `fundadoresMedios` VALUES
(2,2),
(3,2),
(4,3),
(4,4),
(7,6),
(8,7),
(9,8),
(10,9),
(11,10),
(13,11),
(14,12),
(14,13),
(15,14),
(17,15),
(23,19),
(24,20),
(27,21),
(28,22),
(31,24),
(32,25),
(32,26),
(32,27),
(32,28),
(34,31),
(35,30),
(39,32),
(41,33),
(51,34),
(51,35),
(53,36),
(54,37),
(59,38),
(59,39);
/*!40000 ALTER TABLE `fundadoresMedios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medios`
--

DROP TABLE IF EXISTS `medios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `ubicacion` int(11) DEFAULT NULL,
  `año` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ubicacion` (`ubicacion`),
  CONSTRAINT `medios_ibfk_1` FOREIGN KEY (`ubicacion`) REFERENCES `ubicaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medios`
--

LOCK TABLES `medios` WRITE;
/*!40000 ALTER TABLE `medios` DISABLE KEYS */;
INSERT INTO `medios` VALUES
(2,'Diario Libre',2,2001,'https://www.diariolibre.com/'),
(3,'Listin Diario',2,1889,'https://listindiario.com/'),
(4,'Bohío News',2,1966,'https://bohionews.com/'),
(5,'Noticias SIN',2,NULL,'https://noticiassin.com/'),
(7,'Periódico Primicias',2,1993,'https://primicias.net/web/'),
(8,'El Dinero',2,2015,'https://eldinero.com.do/'),
(9,'elCaribe',2,1948,'https://www.elcaribe.com.do/'),
(10,'Hoy Digital',2,1981,'https://hoy.com.do/'),
(11,'El Nacional',2,1966,'https://elnacional.com.do/'),
(12,'El Sol Dominicano',2,2008,'https://elsoldominicano.com/'),
(13,'El Nuevo Diario',2,1981,'https://elnuevodiario.com.do/'),
(14,'EL JAYA',3,1985,'https://www.eljaya.com/'),
(15,'El Día',2,2002,'https://eldia.com.do/'),
(16,'Periodico El Tiempo',2,NULL,'https://eltiempo.com.do/'),
(17,'DiarioDigitalRD',2,2006,'https://www.diariodigital.com.do/'),
(18,'Telenord',3,1994,'https://www.telenord.com/'),
(21,'CDN',2,1996,'https://cdn.com.do/'),
(23,'QuisqueyaNews',7,2022,'http://www.quisqueyanews.info/'),
(24,'Telemicro',2,1986,'https://ntelemicro.com/'),
(25,'Dominican Today',2,2005,'https://dominicantoday.com/'),
(26,'Diario Cibao',8,2016,'https://diariocibao.com/'),
(27,'Z101 Digital',2,1983,'https://z101digital.com/'),
(28,'Frontera 25',9,NULL,'https://frontera25.net/'),
(29,'Diario Dom Digital',2,2011,'www.diariodom.com'),
(31,'Teleantillas',2,1979,'https://teleantillas.com.do/'),
(32,'La Información',9,1915,'https://www.lainformacion.com.do/'),
(34,'Al Momento',NULL,2008,'https://almomento.net/'),
(35,'Puerto Plata',10,2006,'https://www.puertoplatadigital.com/'),
(37,'Minuto a Minuto',8,NULL,'https://minutoaminuto.com.do/'),
(38,'Las Calientes del Sur',NULL,NULL,'https://lascalientesdelsur.com/'),
(39,'Ciudad Oriental',2,2000,'https://ciudadoriental.com/'),
(40,'El Granero del Sur',11,NULL,'https://elgranerodelsur.com/'),
(41,'El Pulmón de la Democracia',2,NULL,'El Pulmón de la Democracia'),
(42,'El Poder Banilejo',2,NULL,'https://www.elpoderbanilejo.com/v6/'),
(43,'El Fogón de San Juan',2,NULL,'https://www.elfogondesanjuan.com/search/label/Noticias'),
(45,'El Jacaguero',13,NULL,'https://eljacaguero.com.do/'),
(47,'Dajabon 24 Horas RD',8,NULL,'https://www.dajabon24horasrd.com/'),
(48,'Dominicanos Hoy',2,NULL,'https://www.dominicanoshoy.com/'),
(49,'Lo Último Digital',2,NULL,'https://loultimodigital.com/'),
(50,'Vigilante Informativo',2,NULL,'https://vigilanteinformativo.com/'),
(51,'Acento',2,2011,'https://acento.com.do/'),
(52,'Arecoa',2,NULL,'https://www.arecoa.com/'),
(53,'La Lupa del Sur',14,2014,'https://lalupadelsur.com/'),
(54,'Barrigaverde',15,2004,'https://barrigaverde.net/'),
(56,'Caoba Digital',17,2011,'https://caobadigital.com/'),
(57,'El Masacre',18,NULL,'https://www.elmasacre.com/'),
(58,'Sabaneta Primero',2,NULL,'https://sabanetaprimero.com/'),
(59,'El Informante',9,NULL,'https://elinformante.com.do/'),
(60,'Bohechio Digital',19,NULL,'http://www.bohechiodigital.com/'),
(61,'El Atlántico',20,NULL,'https://elatlantico.do/');
/*!40000 ALTER TABLE `medios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redes`
--

DROP TABLE IF EXISTS `redes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medio` int(11) DEFAULT NULL,
  `red` int(11) DEFAULT NULL,
  `cuenta` varchar(100) DEFAULT NULL,
  `seguidores` int(11) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `medio` (`medio`),
  KEY `red` (`red`),
  CONSTRAINT `redes_ibfk_1` FOREIGN KEY (`medio`) REFERENCES `medios` (`id`),
  CONSTRAINT `redes_ibfk_2` FOREIGN KEY (`red`) REFERENCES `datosRedes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redes`
--

LOCK TABLES `redes` WRITE;
/*!40000 ALTER TABLE `redes` DISABLE KEYS */;
INSERT INTO `redes` VALUES
(4,2,1,'DiarioLibre',1600000,'2023-07-07 19:08:35'),
(5,2,2,'diariolibre',1600000,'2023-07-07 19:08:35'),
(6,2,3,'diariolibre',1702114,'2023-07-07 19:08:35'),
(7,3,1,'listindiario',1700000,'2023-07-07 19:17:40'),
(8,3,2,'listindiario',1200000,'2023-07-07 19:17:40'),
(9,3,3,'listindiario',1462641,'2023-07-07 19:17:40'),
(10,4,1,'BohioNews',16000,'2023-07-07 19:22:16'),
(11,4,2,'bohionews',15357,'2023-07-07 19:22:16'),
(12,4,3,'BohioNews',4977,'2023-07-07 19:22:16'),
(13,5,1,'SIN24Horas',2000000,'2023-07-07 19:55:32'),
(14,5,2,'sin24horas',1000000,'2023-07-07 19:55:32'),
(15,5,3,'sin24horas',1678856,'2023-07-07 19:55:32'),
(19,7,1,'PrimiciasRD',3370,'2023-07-07 20:07:51'),
(20,7,2,'periodicoprimicias',220,'2023-07-07 20:07:51'),
(21,7,3,'primiciasrd',12137,'2023-07-07 20:07:51'),
(22,8,1,'elDinero',6141,'2023-07-07 20:38:21'),
(23,8,2,'eldinerodo',33281,'2023-07-07 20:38:21'),
(24,8,3,'eldinerodo',12533,'2023-07-07 20:38:21'),
(25,9,1,'ElCaribe.com.do',460000,'2023-07-07 20:43:37'),
(26,9,2,'elcariberd',457592,'2023-07-07 20:43:37'),
(27,9,3,'ElCaribeRD',950190,'2023-07-07 20:43:37'),
(28,10,1,'periodicohoyRD',404000,'2023-07-07 20:50:55'),
(29,10,2,'periodicohoyrd',277000,'2023-07-07 20:50:55'),
(30,10,3,'PeriodicoHoy',845914,'2023-07-07 20:50:55'),
(31,11,1,'El-Nacional-1385155231726142',75000,'2023-07-07 20:54:04'),
(32,11,2,'elnacionalrd',327350,'2023-07-07 20:54:04'),
(33,11,3,'elnacionalrd',320060,'2023-07-07 20:54:04'),
(34,12,1,'El-Sol-Dominicano-100067960574736',110,'2023-07-07 20:58:42'),
(35,12,3,'ElSolDominicano',228,'2023-07-07 20:58:42'),
(36,13,1,'elnuevodiariord',622000,'2023-07-07 21:02:16'),
(37,13,2,'elnuevodiariord',556937,'2023-07-07 21:02:16'),
(38,13,3,'elnuevodiariord',477215,'2023-07-07 21:02:16'),
(39,14,1,'PeriodicoElJaya',13000,'2023-07-07 21:05:56'),
(40,14,2,'periodicoeljaya',5820,'2023-07-07 21:05:56'),
(41,14,3,'periodicoeljaya',2508,'2023-07-07 21:05:56'),
(42,15,1,'eldia.com.do',758000,'2023-07-07 21:21:49'),
(43,15,2,'eldia_do',79606,'2023-07-07 21:21:49'),
(44,15,3,'ElDia_do',412498,'2023-07-07 21:21:49'),
(45,16,1,'eltiempord',14688,'2023-07-07 21:24:41'),
(46,16,2,'eltiempord',87341,'2023-07-07 21:24:41'),
(47,16,3,'eltiempoDO',1977,'2023-07-07 21:24:41'),
(48,17,1,'Diariodigitaldo/',7475,'2023-07-07 21:30:20'),
(49,17,2,'diariodigitalrd',5241,'2023-07-07 21:30:20'),
(50,17,3,'Diariodigitaldo',45789,'2023-07-07 21:30:20'),
(51,18,1,'telenordcom',169000,'2023-07-07 21:35:06'),
(52,18,2,'telenordcom',72150,'2023-07-07 21:35:06'),
(53,18,3,'Telenordcom',3446,'2023-07-07 21:35:06'),
(57,21,1,'cdn.com.do',1000000,'2023-07-07 22:26:36'),
(58,21,2,'cdn37',1143682,'2023-07-07 22:26:36'),
(59,21,3,'cdn37',1261539,'2023-07-07 22:26:36'),
(63,23,1,'quisqueyanew',227,'2023-07-07 22:55:55'),
(64,23,2,'periodicoquisqueya',178,'2023-07-07 22:55:55'),
(65,23,3,'NewsQuisqueya',28,'2023-07-07 22:55:55'),
(66,24,1,'telemicro5',554000,'2023-07-07 23:04:00'),
(67,24,2,'TelemicroHD',1081115,'2023-07-07 23:04:00'),
(68,24,3,'TelemicroHD',175094,'2023-07-07 23:04:00'),
(69,25,1,'dominicantoday',3283,'2023-07-07 23:06:24'),
(70,25,3,'dominican_today',319,'2023-07-07 23:06:24'),
(71,26,1,'DiarioCibao',685,'2023-07-07 23:08:00'),
(72,26,2,'diariocibao',452,'2023-07-07 23:08:00'),
(73,26,3,'DiarioCibao',384,'2023-07-07 23:08:00'),
(74,27,1,'z101digital',188000,'2023-07-07 23:10:08'),
(75,27,2,'z_digital',223749,'2023-07-07 23:10:08'),
(76,27,3,'z101digital',429043,'2023-07-07 23:10:08'),
(77,28,1,'Frontera25Tv',12000,'2023-07-07 23:11:43'),
(78,28,2,'frontera25',11705,'2023-07-07 23:11:43'),
(79,28,3,'frontera25',4264,'2023-07-07 23:11:43'),
(80,29,1,'Diariodomcom',1189,'2023-07-07 23:16:39'),
(81,29,2,'diariodom',117,'2023-07-07 23:16:39'),
(82,29,3,'DiarioDom',1096,'2023-07-07 23:16:39'),
(83,31,1,'teleantillas',32000,'2023-07-07 23:23:23'),
(84,31,2,'teleantillascanal',55793,'2023-07-07 23:23:23'),
(85,31,3,'teleantillas2',77809,'2023-07-07 23:23:23'),
(86,32,2,'lainformacion_rd',4852,'2023-07-07 23:36:18'),
(87,32,3,'lainformacionrd',18598,'2023-07-07 23:36:18'),
(91,35,1,'puertoplatadigital',8530,'2023-07-08 00:15:52'),
(92,35,2,'puertoplatadigital',10655,'2023-07-08 00:15:52'),
(93,35,3,'puertopdigital',2741,'2023-07-08 00:15:52'),
(94,34,1,'almomento.net',16000,'2023-07-08 00:16:04'),
(95,34,2,'almomentonet',5271,'2023-07-08 00:16:04'),
(96,34,3,'AlMomentoNet',42658,'2023-07-08 00:16:04'),
(97,38,1,'lascalientesdelsur.net',53740,'2023-07-08 00:19:33'),
(98,38,3,'calientesdelsur',5700,'2023-07-08 00:19:33'),
(99,37,1,'Minuto-A-Minuto-100063466722841',1585,'2023-07-08 00:19:56'),
(100,37,3,'Minutoaminutord',573,'2023-07-08 00:19:56'),
(101,39,1,'Ciudadorientalorg',1758,'2023-07-08 00:20:57'),
(102,39,2,'ciudadoriental',3933,'2023-07-08 00:20:57'),
(103,39,3,'Ciudadoriental',10461,'2023-07-08 00:20:57'),
(104,41,1,'SinLimitestv',130000,'2023-07-08 00:22:55'),
(105,41,2,'sinlimitealexdiaz',8317,'2023-07-08 00:22:55'),
(106,41,3,'Sin Límites',1924,'2023-07-08 00:22:55'),
(107,40,1,'cassandrofs/',2000,'2023-07-08 00:23:16'),
(108,40,2,'elgranerodelsur',1203,'2023-07-08 00:23:16'),
(109,40,3,'El granero del Sur',75,'2023-07-08 00:23:16'),
(110,42,1,'El Poder Banilejo',12000,'2023-07-08 01:58:28'),
(111,43,3,'Rafael Mendez',1121,'2023-07-08 02:00:55'),
(115,45,1,'El Jacaguero',24000,'2023-07-08 02:13:37'),
(116,45,2,'eljacaguero_/',12947,'2023-07-08 02:13:37'),
(117,45,3,'El Jacagüero',2748,'2023-07-08 02:13:37'),
(118,47,1,'Informe Meridiano Haciendo Historia',991,'2023-07-08 02:18:23'),
(119,47,2,'noticiasdajabon044',4037,'2023-07-08 02:18:23'),
(120,47,3,'dajabon24h',295,'2023-07-08 02:18:23'),
(121,48,1,'dominicanoshoyperiodico',8200,'2023-07-08 02:22:08'),
(122,48,2,'dominicanoshoy/',1918,'2023-07-08 02:22:08'),
(123,48,3,'DominicanosHOY',3293,'2023-07-08 02:22:08'),
(124,49,1,'loultimodigital',1000,'2023-07-08 02:26:22'),
(125,49,2,'loultimodigital1',401,'2023-07-08 02:26:22'),
(126,49,3,'loultimodigital',161,'2023-07-08 02:26:22'),
(127,50,1,'vigilanteinfo',1800,'2023-07-08 02:31:18'),
(128,50,3,'vigilanteinfo',2439,'2023-07-08 02:31:18'),
(129,51,1,'acento.com.do',152000,'2023-07-08 02:36:09'),
(130,51,2,'acentodiario',97939,'2023-07-08 02:36:10'),
(131,51,3,'acentodiario',410795,'2023-07-08 02:36:10'),
(132,52,1,'Arecoacom',804,'2023-07-08 02:37:49'),
(133,52,2,'arecoa_com',3255,'2023-07-08 02:37:49'),
(134,52,3,'arecoa_com',4224,'2023-07-08 02:37:49'),
(135,53,1,'lalupadelsur',1700,'2023-07-08 02:37:52'),
(136,53,2,'lalupadelsur',2132,'2023-07-08 02:37:52'),
(137,53,3,'lalupadelsur_',1883,'2023-07-08 02:37:52'),
(138,54,1,'barrigaverde.net',118,'2023-07-08 02:39:18'),
(139,54,3,'barrigaverde0',140,'2023-07-08 02:39:18'),
(140,56,1,'caobadigitalRD',824,'2023-07-08 02:41:36'),
(141,56,2,'caobadigitalrd',12357,'2023-07-08 02:41:36'),
(142,56,3,'Caoba_Digital',1504,'2023-07-08 02:41:36'),
(143,57,1,'elMasacreRD',2600,'2023-07-08 02:41:57'),
(144,57,3,'elMasacreRD',1634,'2023-07-08 02:41:57'),
(145,58,2,'sabanetaprimero',1679,'2023-07-08 02:44:38'),
(146,58,3,'sabanetaprimer',223,'2023-07-08 02:44:38'),
(147,59,1,'profile.php?id=100062985352696',254,'2023-07-08 02:45:59'),
(148,59,2,'elinformantedo',269,'2023-07-08 02:45:59'),
(149,59,3,'elinformantedo',2566,'2023-07-08 02:45:59'),
(150,60,3,'bohechionews',668,'2023-07-08 02:47:03'),
(151,61,1,'ElatlanticoDO',6773,'2023-07-08 03:35:55'),
(152,61,2,'elatlanticodo',1306,'2023-07-08 03:35:55'),
(153,61,3,'elatlanticoDO',351,'2023-07-08 03:35:55');
/*!40000 ALTER TABLE `redes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubicaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `continente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` VALUES
(2,'Santo Domingo','República Dominicana','Región Este','América'),
(3,'San Francisco de Macoris','República Dominicana','Región Nordeste','América'),
(7,'Segovia','España','Castilla y León','Europa'),
(8,'Santiago de los Caballeros','República Dominicana','Región Norte','América'),
(9,'Santiago de los Caballeros','República Dominicana','Región Norcentral','América'),
(10,'Puerto Plata','República Dominicana','Región Norte','América'),
(11,'San Juan de la Maguana','República Dominicana','Región Sur','América'),
(13,'Santiago de los Caballeros','República Dominicana','Región Este','América'),
(14,'Barahona','República Dominicana','Enriquillo','América'),
(15,'San Juan de la Maguana','República Dominicana','Región Norcentral','América'),
(17,'La Vega','República Dominicana','Región Norcentral','América'),
(18,'Dajabón','República Dominicana','Dahaboon','América'),
(19,'San Juan de la Maguana','República Dominicana','Valle','América'),
(20,'San Felipe de Puerto Plata','República Dominicana','Región Norte','América');
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-08  0:47:46
