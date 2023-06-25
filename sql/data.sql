-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: test123
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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medio` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ejemplo` varchar(255) DEFAULT NULL,
  `xpath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medio` (`medio`),
  CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`medio`) REFERENCES `medios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coberturasMedio`
--

DROP TABLE IF EXISTS `coberturasMedio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coberturasMedio` (
  `medio` int(11) NOT NULL,
  `cobertura` int(11) NOT NULL,
  PRIMARY KEY (`medio`,`cobertura`),
  KEY `cobertura` (`cobertura`),
  CONSTRAINT `coberturasMedio_ibfk_1` FOREIGN KEY (`medio`) REFERENCES `medios` (`id`),
  CONSTRAINT `coberturasMedio_ibfk_2` FOREIGN KEY (`cobertura`) REFERENCES `datosCoberturas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coberturasMedio`
--

LOCK TABLES `coberturasMedio` WRITE;
/*!40000 ALTER TABLE `coberturasMedio` DISABLE KEYS */;
/*!40000 ALTER TABLE `coberturasMedio` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosCoberturas`
--

LOCK TABLES `datosCoberturas` WRITE;
/*!40000 ALTER TABLE `datosCoberturas` DISABLE KEYS */;
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
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosFundadores`
--

LOCK TABLES `datosFundadores` WRITE;
/*!40000 ALTER TABLE `datosFundadores` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosRedes`
--

LOCK TABLES `datosRedes` WRITE;
/*!40000 ALTER TABLE `datosRedes` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejemplos`
--

LOCK TABLES `ejemplos` WRITE;
/*!40000 ALTER TABLE `ejemplos` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medios`
--

LOCK TABLES `medios` WRITE;
/*!40000 ALTER TABLE `medios` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redes`
--

LOCK TABLES `redes` WRITE;
/*!40000 ALTER TABLE `redes` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
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

-- Dump completed on 2023-06-24  0:03:26
