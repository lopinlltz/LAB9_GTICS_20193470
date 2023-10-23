-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: partidossdci
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `deporte`
--

DROP TABLE IF EXISTS `deporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deporte` (
  `iddeporte` int NOT NULL AUTO_INCREMENT,
  `nombreDeporte` varchar(45) NOT NULL,
  `pesoDeporte` int NOT NULL,
  PRIMARY KEY (`iddeporte`),
  UNIQUE KEY `nombreActividad_UNIQUE` (`nombreDeporte`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deporte`
--

LOCK TABLES `deporte` WRITE;
/*!40000 ALTER TABLE `deporte` DISABLE KEYS */;
INSERT INTO `deporte` VALUES (1,'futbol',10),(2,'voley',10),(3,'atletismo',10),(4,'ajedrez',10);
/*!40000 ALTER TABLE `deporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `idequipo` int NOT NULL AUTO_INCREMENT,
  `nombreEquipo` varchar(45) NOT NULL,
  `colorEquipo` varchar(45) NOT NULL,
  `mascota` varchar(45) NOT NULL,
  PRIMARY KEY (`idequipo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombreEquipo`),
  UNIQUE KEY `color_UNIQUE` (`colorEquipo`),
  UNIQUE KEY `mascota_UNIQUE` (`mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'Fibra toxica','negro','murcielago'),(2,'Hormigon armado','gris','hormiga'),(3,'Naranja mecánica','naranja','no se'),(4,'Memoria cache','verde','nose'),(5,'Huascaminas','celeste','no c'),(6,'maphia cuantica','amarillo','ni idea'),(7,'equipo de prueba','azul','perro');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialpartidos`
--

DROP TABLE IF EXISTS `historialpartidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historialpartidos` (
  `idhistorialPartidos` int NOT NULL AUTO_INCREMENT,
  `partido_idpartido` int NOT NULL,
  `deporte_iddeporte` int DEFAULT NULL,
  `horaFecha` datetime DEFAULT NULL,
  PRIMARY KEY (`idhistorialPartidos`),
  KEY `fk_historialPartidos_partido1_idx` (`partido_idpartido`),
  KEY `fk_historialPartidos_deporte1_idx` (`deporte_iddeporte`),
  CONSTRAINT `fk_historialPartidos_deporte1` FOREIGN KEY (`deporte_iddeporte`) REFERENCES `deporte` (`iddeporte`),
  CONSTRAINT `fk_historialPartidos_partido1` FOREIGN KEY (`partido_idpartido`) REFERENCES `partido` (`idpartido`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialpartidos`
--

LOCK TABLES `historialpartidos` WRITE;
/*!40000 ALTER TABLE `historialpartidos` DISABLE KEYS */;
INSERT INTO `historialpartidos` VALUES (1,1,NULL,NULL),(2,4,NULL,NULL),(3,7,NULL,NULL);
/*!40000 ALTER TABLE `historialpartidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participante`
--

DROP TABLE IF EXISTS `participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participante` (
  `idparticipante` int NOT NULL AUTO_INCREMENT,
  `equipo` int NOT NULL,
  `carrera` varchar(45) NOT NULL,
  `codigo` int NOT NULL,
  `tipoParticipante` varchar(45) NOT NULL,
  PRIMARY KEY (`idparticipante`),
  KEY `fk_participante_equipo_idx` (`equipo`),
  CONSTRAINT `fk_participante_equipo` FOREIGN KEY (`equipo`) REFERENCES `equipo` (`idequipo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante`
--

LOCK TABLES `participante` WRITE;
/*!40000 ALTER TABLE `participante` DISABLE KEYS */;
INSERT INTO `participante` VALUES (1,1,'Ingeniería de telecomunicaciones',20191111,'jugador1'),(2,1,'Ingeniería de telecomunicaciones',20191112,'jugador2'),(3,3,'Ing mecanica',20191110,'jugador1'),(4,3,'Ing mecanica',20191115,'jugador2'),(5,2,'Ing civil',20191114,'jugador1'),(6,4,'Ing informatica',20191123,'jugador1'),(7,4,'Ing informatica',20191122,'jugador2'),(8,5,'Ing minas',20191121,'jugador1'),(9,6,'fisica',20191120,'jugador2'),(10,5,'Ing de Minas',20191001,'jugador1');
/*!40000 ALTER TABLE `participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantespartido`
--

DROP TABLE IF EXISTS `participantespartido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantespartido` (
  `idparticipantesPartido` int NOT NULL AUTO_INCREMENT,
  `partido_idpartido` int NOT NULL,
  `participante_idparticipante` int NOT NULL,
  `horaFecha` datetime NOT NULL,
  PRIMARY KEY (`idparticipantesPartido`),
  KEY `fk_participantesPartido_partido1_idx` (`partido_idpartido`),
  KEY `fk_participantesPartido_participante1_idx` (`participante_idparticipante`),
  CONSTRAINT `fk_participantesPartido_participante1` FOREIGN KEY (`participante_idparticipante`) REFERENCES `participante` (`idparticipante`),
  CONSTRAINT `fk_participantesPartido_partido1` FOREIGN KEY (`partido_idpartido`) REFERENCES `partido` (`idpartido`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantespartido`
--

LOCK TABLES `participantespartido` WRITE;
/*!40000 ALTER TABLE `participantespartido` DISABLE KEYS */;
INSERT INTO `participantespartido` VALUES (1,1,1,'2023-10-23 14:30:00'),(2,1,6,'2023-10-23 14:30:00'),(3,2,1,'2023-10-23 15:30:00'),(4,2,2,'2023-10-23 15:30:00'),(5,2,3,'2023-10-23 15:30:00'),(6,3,5,'2023-10-23 18:30:00'),(7,3,3,'2023-10-23 18:30:00'),(8,3,4,'2023-10-23 18:30:00'),(9,4,1,'2023-10-24 14:00:00'),(10,4,2,'2023-10-24 14:00:00'),(11,4,5,'2023-10-24 14:00:00'),(12,5,3,'2023-10-24 16:00:00'),(13,5,6,'2023-10-24 16:00:00');
/*!40000 ALTER TABLE `participantespartido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido` (
  `idpartido` int NOT NULL AUTO_INCREMENT,
  `equipoA` int NOT NULL,
  `equipoB` int NOT NULL,
  `scoreA` int NOT NULL,
  `scoreB` int NOT NULL,
  PRIMARY KEY (`idpartido`),
  KEY `fk_partido_equipo1_idx` (`equipoA`),
  KEY `fk_partido_equipo2_idx` (`equipoB`),
  CONSTRAINT `fk_partido_equipo1` FOREIGN KEY (`equipoA`) REFERENCES `equipo` (`idequipo`),
  CONSTRAINT `fk_partido_equipo2` FOREIGN KEY (`equipoB`) REFERENCES `equipo` (`idequipo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` VALUES (1,1,4,10,4),(2,1,3,10,5),(3,2,3,7,6),(4,1,2,9,2),(5,3,4,5,8),(6,6,3,8,7),(7,4,6,6,7);
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-22 23:57:52
