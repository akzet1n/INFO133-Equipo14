-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: medios_de_prensa
-- ------------------------------------------------------
-- Server version	10.5.19-MariaDB-0+deb11u2

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
INSERT INTO `coberturasMedios` VALUES (2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,1),(4,2),(5,1),(5,2),(5,3),(7,1),(7,2),(7,3),(8,1),(8,2),(8,3),(9,1),(9,2),(9,3),(10,1),(10,2),(10,3),(11,1),(11,2),(11,3),(12,1),(12,2),(12,3),(13,1),(13,2),(13,3),(14,1),(14,2),(14,3),(15,1),(15,2),(15,3),(16,1),(16,2),(16,3),(17,1),(17,2),(17,3),(18,1),(18,2),(18,3);
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
INSERT INTO `datosCoberturas` VALUES (1,'Local'),(2,'Nacional'),(3,'Internacional');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosFundadores`
--

LOCK TABLES `datosFundadores` WRITE;
/*!40000 ALTER TABLE `datosFundadores` DISABLE KEYS */;
INSERT INTO `datosFundadores` VALUES (2,'Arturo','Pellerano','Dominicano'),(3,'Luis','Caminero','Dominicano'),(4,'Rita','Cabrer','Dominicana'),(6,'Álex','Jimenez','Dominicano'),(7,'Jairon','Severino','Dominicano'),(8,'Stanley','Ross','Estadounidense'),(9,'José','Corripio','Española'),(10,'Rafael','Morillo','Dominicano'),(11,'Persio','Maldonado','Dominicano'),(12,'Adriano','Cruz','Dominicano'),(13,'Dionisio','Nuñez','Dominicano'),(14,'Ulises Bido','Bido','Dominicano'),(15,'Jose','Tejeda','Dominicano');
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
INSERT INTO `datosRedes` VALUES (1,'Facebook'),(2,'Instagram'),(3,'Twitter');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejemplos`
--

LOCK TABLES `ejemplos` WRITE;
/*!40000 ALTER TABLE `ejemplos` DISABLE KEYS */;
INSERT INTO `ejemplos` VALUES (1,2,'https://www.diariolibre.com/actualidad/politica/2023/07/06/auditorias-se-revisaran-en-otros-paises/2396565','//meta[@name=\"ArticlePublicationDate\"]/@content','//h1[@class=\"text-2xl mb-2\"]','//div[@class=\"detail-body text-lg\"]'),(2,3,'https://listindiario.com/la-republica/20230707/interior-policia-afirma-ilegal-extranjeros-realicen-marchas-republica-dominicana_762410.html','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"c-detail__title\"]','//div[@class=\"c-detail__body\"]'),(3,4,'https://bohionews.com/con-recursos-encaje-legal-1755-prestamos-a-familias-beneficiarias-y-35-prestamos-a-empresas-constructoras/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"entry-title\"]','//div[@class=\"td-post-content td-pb-padding-side\"]'),(4,5,'https://noticiassin.com/pais/esta-listo-el-informe-sobre-camara-de-cuentas-dice-presidente-de-la-comision-especial-que-investigo-el-conflicto-1453795/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"single-title\"]','//div[@class=\"nota-content\"]'),(5,7,'https://primicias.net/web/seis-claves-para-que-el-negocio-avance/','//div[@class=\"entry-header\"]//div[@class=\"post-meta clearfix\"]//span[@class=\"date meta-item tie-icon\"]\r\n','//h1[@class=\"post-title entry-title\"]','//div[@class=\"entry-content entry clearfix\"]'),(6,8,'https://eldinero.com.do/237348/tasas-de-interes-siguen-altas-a-pesar-de-esfuerzos-del-banco-central-por-bajarlas/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"jeg_post_title\"]','//div[@class=\"content-inner\"]'),(7,9,'https://www.elcaribe.com.do/panorama/justicia/disuelven-condena-a-micky-lopez/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"entry-title\"]','//div[@class=\"content\"]'),(8,10,'https://hoy.com.do/prestamos-congreso-ha-tomado-223-mil-millones/','//meta[@property=\"article:published_time\"]/@content','//h2[@class=\"post-title lg\"]','//div[@class=\"entry-content\"]'),(9,11,'https://elnacional.com.do/fue-suspendido-consul-en-barcelona-involucrado-en-accidente-de-transito/','//meta[@property=\"article:published_time\"]/@content','//h2[@class=\"utf_post_title\"]','//div[@class=\"entry-content\"]'),(10,12,'https://elsoldominicano.com/adolescente-cae-abatido-tras-enfrentar-a-tiros-contingente-policial-en-medio-de-un-operativo/','//time','//h1[@class=\"entry-title single-post-title\"]','//div[@class=\"entry-content\"]'),(11,13,'https://elnuevodiario.com.do/en-2022-el-pais-retomo-su-senda-historica-de-crecimiento-sostiene-informe-del-mepyd/','//meta[@property=\"article:published_time\"]/@content','//h2[@itemprop=\"headline\"]','//div[@class=\"col-md-9 col-12 pe-md-2 details\"]'),(12,14,'https://www.eljaya.com/169907/fallece-dona-viola-altagracia-concepcion-castillo/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"jeg_post_title\"]','//div[@class=\"content-inner \"]'),(13,15,'https://eldia.com.do/faride-raful-nadie-en-este-pais-puede-decir-que-yo-he-sobornado-o-que-yo-he-robado/','//meta[@property=\"article:published_time\"]/@content','//h2[@class=\"post-title lg\"]','//div[@class=\"entry-content\"]'),(14,16,'https://eltiempo.com.do/destacado/el-casco-urbano-de-higuey-tiene-potencial-turistico-pero-carece-de-atencion/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"tdb-title-text\"]','//div[@class=\"tdb-block-inner td-fix-index\"]'),(15,17,'https://www.diariodigital.com.do/2023/07/07/decomisan-mas-de-92-toneladas-de-drogas-durante-casi-tres-anos-gobierno-de-abinader.html/','//meta[@property=\"article:published_time\"]/@content','//h1[@class=\"jeg_post_title\"]','//div[@class=\"content-inner \"]'),(16,18,'https://www.telenord.com/noticias/internacionales/56364-mexico-espera-formacion-de-ciclon-tropical-en-pacifico-y-lluvias-intensas-en-tres-estados','//meta[@property=\"datePublished\"]/@content','//h1[@property=\"headline\"]','//div[@property=\"text\"]');
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
INSERT INTO `fundadoresMedios` VALUES (2,2),(3,2),(4,3),(4,4),(7,6),(8,7),(9,8),(10,9),(11,10),(13,11),(14,12),(14,13),(15,14),(17,15);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medios`
--

LOCK TABLES `medios` WRITE;
/*!40000 ALTER TABLE `medios` DISABLE KEYS */;
INSERT INTO `medios` VALUES (2,'Diario Libre',2,2001,'https://www.diariolibre.com/'),(3,'Listin Diario',2,1889,'https://listindiario.com/'),(4,'Bohío News',2,1966,'https://bohionews.com/'),(5,'Noticias SIN',2,NULL,'https://noticiassin.com/'),(7,'Periódico Primicias',2,1993,'https://primicias.net/web/'),(8,'El Dinero',2,2015,'https://eldinero.com.do/'),(9,'elCaribe',2,1948,'https://www.elcaribe.com.do/'),(10,'Hoy Digital',2,1981,'https://hoy.com.do/'),(11,'El Nacional',2,1966,'https://elnacional.com.do/'),(12,'El Sol Dominicano',2,2008,'https://elsoldominicano.com/'),(13,'El Nuevo Diario',2,1981,'https://elnuevodiario.com.do/'),(14,'EL JAYA',3,1985,'https://www.eljaya.com/'),(15,'El Día',2,2002,'https://eldia.com.do/'),(16,'Periodico El Tiempo',2,NULL,'https://eltiempo.com.do/'),(17,'DiarioDigitalRD',2,2006,'https://www.diariodigital.com.do/'),(18,'Telenord',3,1994,'https://www.telenord.com/'),(20,'Acento',2,2011,'https://acento.com.do/');
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redes`
--

LOCK TABLES `redes` WRITE;
/*!40000 ALTER TABLE `redes` DISABLE KEYS */;
INSERT INTO `redes` VALUES (4,2,1,'DiarioLibre',1600000,'2023-07-07 19:08:35'),(5,2,2,'diariolibre',1600000,'2023-07-07 19:08:35'),(6,2,3,'diariolibre',1702114,'2023-07-07 19:08:35'),(7,3,1,'listindiario',1700000,'2023-07-07 19:17:40'),(8,3,2,'listindiario',1200000,'2023-07-07 19:17:40'),(9,3,3,'listindiario',1462641,'2023-07-07 19:17:40'),(10,4,1,'BohioNews',16000,'2023-07-07 19:22:16'),(11,4,2,'bohionews',15357,'2023-07-07 19:22:16'),(12,4,3,'BohioNews',4977,'2023-07-07 19:22:16'),(13,5,1,'SIN24Horas',2000000,'2023-07-07 19:55:32'),(14,5,2,'sin24horas',1000000,'2023-07-07 19:55:32'),(15,5,3,'sin24horas',1678856,'2023-07-07 19:55:32'),(19,7,1,'PrimiciasRD',3370,'2023-07-07 20:07:51'),(20,7,2,'periodicoprimicias',220,'2023-07-07 20:07:51'),(21,7,3,'primiciasrd',12137,'2023-07-07 20:07:51'),(22,8,1,'elDinero',6141,'2023-07-07 20:38:21'),(23,8,2,'eldinerodo',33281,'2023-07-07 20:38:21'),(24,8,3,'eldinerodo',12533,'2023-07-07 20:38:21'),(25,9,1,'ElCaribe.com.do',460000,'2023-07-07 20:43:37'),(26,9,2,'elcariberd',457592,'2023-07-07 20:43:37'),(27,9,3,'ElCaribeRD',950190,'2023-07-07 20:43:37'),(28,10,1,'periodicohoyRD',404000,'2023-07-07 20:50:55'),(29,10,2,'periodicohoyrd',277000,'2023-07-07 20:50:55'),(30,10,3,'PeriodicoHoy',845914,'2023-07-07 20:50:55'),(31,11,1,'El-Nacional-1385155231726142',75000,'2023-07-07 20:54:04'),(32,11,2,'elnacionalrd',327350,'2023-07-07 20:54:04'),(33,11,3,'elnacionalrd',320060,'2023-07-07 20:54:04'),(34,12,1,'El-Sol-Dominicano-100067960574736',110,'2023-07-07 20:58:42'),(35,12,3,'ElSolDominicano',228,'2023-07-07 20:58:42'),(36,13,1,'elnuevodiariord',622000,'2023-07-07 21:02:16'),(37,13,2,'elnuevodiariord',556937,'2023-07-07 21:02:16'),(38,13,3,'elnuevodiariord',477215,'2023-07-07 21:02:16'),(39,14,1,'PeriodicoElJaya',13000,'2023-07-07 21:05:56'),(40,14,2,'periodicoeljaya',5820,'2023-07-07 21:05:56'),(41,14,3,'periodicoeljaya',2508,'2023-07-07 21:05:56'),(42,15,1,'eldia.com.do',758000,'2023-07-07 21:21:49'),(43,15,2,'eldia_do',79606,'2023-07-07 21:21:49'),(44,15,3,'ElDia_do',412498,'2023-07-07 21:21:49'),(45,16,1,'eltiempord',14688,'2023-07-07 21:24:41'),(46,16,2,'eltiempord',87341,'2023-07-07 21:24:41'),(47,16,3,'eltiempoDO',1977,'2023-07-07 21:24:41'),(48,17,1,'Diariodigitaldo/',7475,'2023-07-07 21:30:20'),(49,17,2,'diariodigitalrd',5241,'2023-07-07 21:30:20'),(50,17,3,'Diariodigitaldo',45789,'2023-07-07 21:30:20'),(51,18,1,'telenordcom',169000,'2023-07-07 21:35:06'),(52,18,2,'telenordcom',72150,'2023-07-07 21:35:06'),(53,18,3,'Telenordcom',3446,'2023-07-07 21:35:06');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` VALUES (2,'Santo Domingo','República Dominicana','Región Este','América'),(3,'San Francisco de Macoris','República Dominicana','Región Nordeste','América');
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

-- Dump completed on 2023-07-07 18:06:12
