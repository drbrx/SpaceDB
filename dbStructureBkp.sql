-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: progettobosio
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `allegato`
--

DROP TABLE IF EXISTS `allegato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allegato` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `Path` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `IdTipo` int NOT NULL,
  `IdMissione` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `uq_location` (`Nome`,`Path`),
  KEY `fk_corredazione` (`IdMissione`),
  CONSTRAINT `fk_corredazione` FOREIGN KEY (`IdMissione`) REFERENCES `missione` (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allegato`
--

LOCK TABLES `allegato` WRITE;
/*!40000 ALTER TABLE `allegato` DISABLE KEYS */;
/*!40000 ALTER TABLE `allegato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missione`
--

DROP TABLE IF EXISTS `missione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `missione` (
  `Numero` int NOT NULL,
  `Nome` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `Descrizione` text COLLATE utf8mb4_general_ci NOT NULL,
  `Data` datetime NOT NULL,
  `PiattaformaId` int NOT NULL,
  PRIMARY KEY (`Numero`),
  KEY `idx_data` (`Data`) USING BTREE,
  KEY `fk_origine` (`PiattaformaId`),
  CONSTRAINT `fk_origine` FOREIGN KEY (`PiattaformaId`) REFERENCES `piattaforma` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missione`
--

LOCK TABLES `missione` WRITE;
/*!40000 ALTER TABLE `missione` DISABLE KEYS */;
/*!40000 ALTER TABLE `missione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modellostadio`
--

DROP TABLE IF EXISTS `modellostadio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modellostadio` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `Descrizione` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modellostadio`
--

LOCK TABLES `modellostadio` WRITE;
/*!40000 ALTER TABLE `modellostadio` DISABLE KEYS */;
/*!40000 ALTER TABLE `modellostadio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piattaforma`
--

DROP TABLE IF EXISTS `piattaforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piattaforma` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `Longitudine` float NOT NULL,
  `Latitudine` float NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piattaforma`
--

LOCK TABLES `piattaforma` WRITE;
/*!40000 ALTER TABLE `piattaforma` DISABLE KEYS */;
/*!40000 ALTER TABLE `piattaforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadio`
--

DROP TABLE IF EXISTS `stadio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadio` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CodiceVersione` int NOT NULL,
  `Posizione` int NOT NULL,
  `Note` text COLLATE utf8mb4_general_ci,
  `IdAttaccoStadioPrecedente` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IdAttaccoStadioSuccessivo` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IdMissione` int NOT NULL,
  `IdModello` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `uq_missione_posizione` (`IdMissione`,`Posizione`),
  KEY `fk_composizione` (`IdMissione`),
  KEY `fk_iterazione` (`IdModello`),
  KEY `fk_precedente` (`IdAttaccoStadioPrecedente`) /*!80000 INVISIBLE */,
  KEY `fk_successivo` (`IdAttaccoStadioSuccessivo`),
  CONSTRAINT `fk_composizione` FOREIGN KEY (`IdMissione`) REFERENCES `missione` (`Numero`),
  CONSTRAINT `fk_iterazione` FOREIGN KEY (`IdModello`) REFERENCES `modellostadio` (`Id`),
  CONSTRAINT `fk_precedente` FOREIGN KEY (`IdAttaccoStadioPrecedente`) REFERENCES `strumento` (`CodiceComponente`),
  CONSTRAINT `fk_successivo` FOREIGN KEY (`IdAttaccoStadioSuccessivo`) REFERENCES `strumento` (`CodiceComponente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadio`
--

LOCK TABLES `stadio` WRITE;
/*!40000 ALTER TABLE `stadio` DISABLE KEYS */;
/*!40000 ALTER TABLE `stadio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trgchk_stadio_adj` BEFORE INSERT ON `stadio` FOR EACH ROW BEGIN
  DECLARE next_precedente VARCHAR(32);
  DECLARE prev_successivo VARCHAR(32);

SELECT 
    IdAttaccoStadioPrecedente
INTO next_precedente FROM
    stadio
WHERE
    IdMissione = NEW.IdMissione
        AND Posizione = NEW.Posizione + 1
LIMIT 1;

SELECT 
    IdAttaccoStadioSuccessivo
INTO prev_successivo FROM
    stadio
WHERE
    IdMissione = NEW.IdMissione
        AND Posizione = NEW.Posizione - 1
LIMIT 1;

  IF next_precedente IS NOT NULL AND next_precedente != NEW.IdAttaccoStadioSuccessivo
  OR prev_successivo IS NOT NULL AND prev_successivo != NEW.IdAttaccoStadioPrecedente 
  THEN
    SIGNAL SQLSTATE '45002'
      SET MESSAGE_TEXT = 'Lo stadio che si vuole inserire non ha attacchi compatibili con gli stadi adiacenti già presenti';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trgchk_posizione_stadio` AFTER INSERT ON `stadio` FOR EACH ROW BEGIN
DECLARE posizioni_ok BOOLEAN;

SELECT 
    COUNT(DISTINCT Posizione) = MAX(Posizione)
        AND MIN(Posizione) = 1
INTO posizioni_ok FROM
    stadio
WHERE
    IdMissione = NEW.IdMissione;

  IF NOT posizioni_ok THEN
    SIGNAL SQLSTATE '45001'
      SET MESSAGE_TEXT = 'Una missione non può avere due stadi nella stessa posizione!';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stadio_strumento`
--

DROP TABLE IF EXISTS `stadio_strumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadio_strumento` (
  `IdStadio` int NOT NULL,
  `IdStrumento` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `Numero` int NOT NULL,
  PRIMARY KEY (`IdStadio`,`IdStrumento`),
  KEY `idx_stadio` (`IdStadio`) USING BTREE,
  CONSTRAINT `fk_stadio` FOREIGN KEY (`IdStadio`) REFERENCES `stadio` (`Id`),
  CONSTRAINT `chk_numero_positivo` CHECK ((`Numero` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadio_strumento`
--

LOCK TABLES `stadio_strumento` WRITE;
/*!40000 ALTER TABLE `stadio_strumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `stadio_strumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strumento`
--

DROP TABLE IF EXISTS `strumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strumento` (
  `CodiceComponente` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `Nome` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`CodiceComponente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strumento`
--

LOCK TABLES `strumento` WRITE;
/*!40000 ALTER TABLE `strumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `strumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoallegato`
--

DROP TABLE IF EXISTS `tipoallegato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoallegato` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `VisibileAlPubblico` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoallegato`
--

LOCK TABLES `tipoallegato` WRITE;
/*!40000 ALTER TABLE `tipoallegato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoallegato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'progettobosio'
--

--
-- Dumping routines for database 'progettobosio'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-22 15:51:05
