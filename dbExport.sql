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
  `Nome` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IdTipo` int NOT NULL,
  `IdMissione` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `uq_location` (`Nome`,`Path`),
  KEY `fk_corredazione` (`IdMissione`),
  CONSTRAINT `fk_corredazione` FOREIGN KEY (`IdMissione`) REFERENCES `missione` (`Numero`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allegato`
--

LOCK TABLES `allegato` WRITE;
/*!40000 ALTER TABLE `allegato` DISABLE KEYS */;
INSERT INTO `allegato` VALUES (1,'Allegato_1','/percorso/allegati/doc_1.*',1,60),(2,'Allegato_2','/percorso/allegati/doc_2.*',4,75),(3,'Allegato_3','/percorso/allegati/doc_3.*',1,78),(4,'Allegato_4','/percorso/allegati/doc_4.*',4,8),(5,'Allegato_5','/percorso/allegati/doc_5.*',3,40),(6,'Allegato_6','/percorso/allegati/doc_6.*',4,91),(7,'Allegato_7','/percorso/allegati/doc_7.*',1,70),(8,'Allegato_8','/percorso/allegati/doc_8.*',1,9),(9,'Allegato_9','/percorso/allegati/doc_9.*',3,39),(10,'Allegato_10','/percorso/allegati/doc_10.*',3,53),(11,'Allegato_11','/percorso/allegati/doc_11.*',2,52),(12,'Allegato_12','/percorso/allegati/doc_12.*',2,1),(13,'Allegato_13','/percorso/allegati/doc_13.*',1,53),(14,'Allegato_14','/percorso/allegati/doc_14.*',2,98),(15,'Allegato_15','/percorso/allegati/doc_15.*',4,81),(16,'Allegato_16','/percorso/allegati/doc_16.*',1,48),(17,'Allegato_17','/percorso/allegati/doc_17.*',4,73),(18,'Allegato_18','/percorso/allegati/doc_18.*',1,54),(19,'Allegato_19','/percorso/allegati/doc_19.*',2,71),(20,'Allegato_20','/percorso/allegati/doc_20.*',3,50),(21,'Allegato_21','/percorso/allegati/doc_21.*',2,17),(22,'Allegato_22','/percorso/allegati/doc_22.*',4,64),(23,'Allegato_23','/percorso/allegati/doc_23.*',3,60),(24,'Allegato_24','/percorso/allegati/doc_24.*',4,54),(25,'Allegato_25','/percorso/allegati/doc_25.*',1,90),(26,'Allegato_26','/percorso/allegati/doc_26.*',1,21),(27,'Allegato_27','/percorso/allegati/doc_27.*',3,90),(28,'Allegato_28','/percorso/allegati/doc_28.*',4,4),(29,'Allegato_29','/percorso/allegati/doc_29.*',2,68),(30,'Allegato_30','/percorso/allegati/doc_30.*',2,46);
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
  `Nome` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Descrizione` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
INSERT INTO `missione` VALUES (1,'Missione_1','Descrizione_1','2023-01-02 00:00:00',4),(2,'Missione_2','Descrizione_2','2023-01-03 00:00:00',5),(3,'Missione_3','Descrizione_3','2023-01-04 00:00:00',5),(4,'Missione_4','Descrizione_4','2023-01-05 00:00:00',2),(5,'Missione_5','Descrizione_5','2023-01-06 00:00:00',2),(6,'Missione_6','Descrizione_6','2023-01-07 00:00:00',5),(7,'Missione_7','Descrizione_7','2023-01-08 00:00:00',5),(8,'Missione_8','Descrizione_8','2023-01-09 00:00:00',4),(9,'Missione_9','Descrizione_9','2023-01-10 00:00:00',5),(10,'Missione_10','Descrizione_10','2023-01-11 00:00:00',5),(11,'Missione_11','Descrizione_11','2023-01-12 00:00:00',2),(12,'Missione_12','Descrizione_12','2023-01-13 00:00:00',2),(13,'Missione_13','Descrizione_13','2023-01-14 00:00:00',3),(14,'Missione_14','Descrizione_14','2023-01-15 00:00:00',3),(15,'Missione_15','Descrizione_15','2023-01-16 00:00:00',5),(16,'Missione_16','Descrizione_16','2023-01-17 00:00:00',5),(17,'Missione_17','Descrizione_17','2023-01-18 00:00:00',4),(18,'Missione_18','Descrizione_18','2023-01-19 00:00:00',1),(19,'Missione_19','Descrizione_19','2023-01-20 00:00:00',2),(20,'Missione_20','Descrizione_20','2023-01-21 00:00:00',5),(21,'Missione_21','Descrizione_21','2023-01-22 00:00:00',3),(22,'Missione_22','Descrizione_22','2023-01-23 00:00:00',5),(23,'Missione_23','Descrizione_23','2023-01-24 00:00:00',3),(24,'Missione_24','Descrizione_24','2023-01-25 00:00:00',1),(25,'Missione_25','Descrizione_25','2023-01-26 00:00:00',3),(26,'Missione_26','Descrizione_26','2023-01-27 00:00:00',4),(27,'Missione_27','Descrizione_27','2023-01-28 00:00:00',1),(28,'Missione_28','Descrizione_28','2023-01-29 00:00:00',1),(29,'Missione_29','Descrizione_29','2023-01-30 00:00:00',3),(30,'Missione_30','Descrizione_30','2023-01-31 00:00:00',1),(31,'Missione_31','Descrizione_31','2023-02-01 00:00:00',5),(32,'Missione_32','Descrizione_32','2023-02-02 00:00:00',2),(33,'Missione_33','Descrizione_33','2023-02-03 00:00:00',1),(34,'Missione_34','Descrizione_34','2023-02-04 00:00:00',4),(35,'Missione_35','Descrizione_35','2023-02-05 00:00:00',2),(36,'Missione_36','Descrizione_36','2023-02-06 00:00:00',2),(37,'Missione_37','Descrizione_37','2023-02-07 00:00:00',5),(38,'Missione_38','Descrizione_38','2023-02-08 00:00:00',3),(39,'Missione_39','Descrizione_39','2023-02-09 00:00:00',4),(40,'Missione_40','Descrizione_40','2023-02-10 00:00:00',2),(41,'Missione_41','Descrizione_41','2023-02-11 00:00:00',1),(42,'Missione_42','Descrizione_42','2023-02-12 00:00:00',1),(43,'Missione_43','Descrizione_43','2023-02-13 00:00:00',3),(44,'Missione_44','Descrizione_44','2023-02-14 00:00:00',4),(45,'Missione_45','Descrizione_45','2023-02-15 00:00:00',4),(46,'Missione_46','Descrizione_46','2023-02-16 00:00:00',5),(47,'Missione_47','Descrizione_47','2023-02-17 00:00:00',5),(48,'Missione_48','Descrizione_48','2023-02-18 00:00:00',4),(49,'Missione_49','Descrizione_49','2023-02-19 00:00:00',2),(50,'Missione_50','Descrizione_50','2023-02-20 00:00:00',5),(51,'Missione_51','Descrizione_51','2023-02-21 00:00:00',1),(52,'Missione_52','Descrizione_52','2023-02-22 00:00:00',1),(53,'Missione_53','Descrizione_53','2023-02-23 00:00:00',5),(54,'Missione_54','Descrizione_54','2023-02-24 00:00:00',3),(55,'Missione_55','Descrizione_55','2023-02-25 00:00:00',2),(56,'Missione_56','Descrizione_56','2023-02-26 00:00:00',4),(57,'Missione_57','Descrizione_57','2023-02-27 00:00:00',5),(58,'Missione_58','Descrizione_58','2023-02-28 00:00:00',3),(59,'Missione_59','Descrizione_59','2023-03-01 00:00:00',3),(60,'Missione_60','Descrizione_60','2023-03-02 00:00:00',2),(61,'Missione_61','Descrizione_61','2023-03-03 00:00:00',1),(62,'Missione_62','Descrizione_62','2023-03-04 00:00:00',1),(63,'Missione_63','Descrizione_63','2023-03-05 00:00:00',4),(64,'Missione_64','Descrizione_64','2023-03-06 00:00:00',5),(65,'Missione_65','Descrizione_65','2023-03-07 00:00:00',5),(66,'Missione_66','Descrizione_66','2023-03-08 00:00:00',1),(67,'Missione_67','Descrizione_67','2023-03-09 00:00:00',2),(68,'Missione_68','Descrizione_68','2023-03-10 00:00:00',2),(69,'Missione_69','Descrizione_69','2023-03-11 00:00:00',2),(70,'Missione_70','Descrizione_70','2023-03-12 00:00:00',1),(71,'Missione_71','Descrizione_71','2023-03-13 00:00:00',2),(72,'Missione_72','Descrizione_72','2023-03-14 00:00:00',2),(73,'Missione_73','Descrizione_73','2023-03-15 00:00:00',5),(74,'Missione_74','Descrizione_74','2023-03-16 00:00:00',5),(75,'Missione_75','Descrizione_75','2023-03-17 00:00:00',2),(76,'Missione_76','Descrizione_76','2023-03-18 00:00:00',2),(77,'Missione_77','Descrizione_77','2023-03-19 00:00:00',1),(78,'Missione_78','Descrizione_78','2023-03-20 00:00:00',2),(79,'Missione_79','Descrizione_79','2023-03-21 00:00:00',1),(80,'Missione_80','Descrizione_80','2023-03-22 00:00:00',1),(81,'Missione_81','Descrizione_81','2023-03-23 00:00:00',5),(82,'Missione_82','Descrizione_82','2023-03-24 00:00:00',3),(83,'Missione_83','Descrizione_83','2023-03-25 00:00:00',3),(84,'Missione_84','Descrizione_84','2023-03-26 00:00:00',2),(85,'Missione_85','Descrizione_85','2023-03-27 00:00:00',4),(86,'Missione_86','Descrizione_86','2023-03-28 00:00:00',4),(87,'Missione_87','Descrizione_87','2023-03-29 00:00:00',3),(88,'Missione_88','Descrizione_88','2023-03-30 00:00:00',1),(89,'Missione_89','Descrizione_89','2023-03-31 00:00:00',3),(90,'Missione_90','Descrizione_90','2023-04-01 00:00:00',1),(91,'Missione_91','Descrizione_91','2023-04-02 00:00:00',4),(92,'Missione_92','Descrizione_92','2023-04-03 00:00:00',3),(93,'Missione_93','Descrizione_93','2023-04-04 00:00:00',4),(94,'Missione_94','Descrizione_94','2023-04-05 00:00:00',2),(95,'Missione_95','Descrizione_95','2023-04-06 00:00:00',4),(96,'Missione_96','Descrizione_96','2023-04-07 00:00:00',5),(97,'Missione_97','Descrizione_97','2023-04-08 00:00:00',5),(98,'Missione_98','Descrizione_98','2023-04-09 00:00:00',2),(99,'Missione_99','Descrizione_99','2023-04-10 00:00:00',4),(100,'Missione_100','Descrizione_100','2023-04-11 00:00:00',1);
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
  `Nome` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Descrizione` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modellostadio`
--

LOCK TABLES `modellostadio` WRITE;
/*!40000 ALTER TABLE `modellostadio` DISABLE KEYS */;
INSERT INTO `modellostadio` VALUES (1,'Modello_A','Descrizione modello A'),(2,'Modello_B','Descrizione modello B'),(3,'Modello_C','Descrizione modello C'),(4,'Modello_D','Descrizione modello D'),(5,'Modello_E','Descrizione modello E'),(6,'Modello_F','Descrizione modello F'),(7,'Modello_G','Descrizione modello G'),(8,'Modello_H','Descrizione modello H'),(9,'Modello_I','Descrizione modello I'),(10,'Modello_J','Descrizione modello J');
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
  `Nome` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Longitudine` float NOT NULL,
  `Latitudine` float NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piattaforma`
--

LOCK TABLES `piattaforma` WRITE;
/*!40000 ALTER TABLE `piattaforma` DISABLE KEYS */;
INSERT INTO `piattaforma` VALUES (1,'Piattaforma_01',12.34,45.67),(2,'Piattaforma_02',13.14,44.5),(3,'Piattaforma_03',14.55,46.22),(4,'Piattaforma_04',15.1,45.9),(5,'Piattaforma_05',16,44.8);
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
  `Note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `IdAttaccoStadioPrecedente` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IdAttaccoStadioSuccessivo` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadio`
--

LOCK TABLES `stadio` WRITE;
/*!40000 ALTER TABLE `stadio` DISABLE KEYS */;
INSERT INTO `stadio` VALUES (31,1,1,'Stadio 1-1',NULL,'STR_001',1,1),(32,1,2,'Stadio 1-2','STR_001','STR_002',1,2),(33,1,3,'Stadio 1-3','STR_002',NULL,1,3),(34,1,1,'Stadio 2-1',NULL,'STR_002',2,2),(35,1,2,'Stadio 2-2','STR_002','STR_003',2,3),(36,1,3,'Stadio 2-3','STR_003',NULL,2,1),(37,1,1,'Stadio 3-1',NULL,'STR_003',3,3),(38,1,2,'Stadio 3-2','STR_003','STR_004',3,1),(39,1,3,'Stadio 3-3','STR_004',NULL,3,2),(40,1,1,'Stadio 4-1',NULL,'STR_004',4,1),(41,1,2,'Stadio 4-2','STR_004','STR_005',4,2),(42,1,3,'Stadio 4-3','STR_005',NULL,4,3),(43,1,1,'Stadio 5-1',NULL,'STR_005',5,2),(44,1,2,'Stadio 5-2','STR_005','STR_006',5,3),(45,1,3,'Stadio 5-3','STR_006',NULL,5,1),(46,1,1,'Stadio 6-1',NULL,'STR_001',6,3),(47,1,2,'Stadio 6-2','STR_001','STR_002',6,1),(48,1,3,'Stadio 6-3','STR_002',NULL,6,2),(49,1,1,'Stadio 7-1',NULL,'STR_003',7,2),(50,1,2,'Stadio 7-2','STR_003','STR_004',7,3),(51,1,3,'Stadio 7-3','STR_004',NULL,7,1),(52,1,1,'Stadio 8-1',NULL,'STR_005',8,1),(53,1,2,'Stadio 8-2','STR_005','STR_006',8,2),(54,1,3,'Stadio 8-3','STR_006',NULL,8,3),(55,1,1,'Stadio 9-1',NULL,'STR_002',9,3),(56,1,2,'Stadio 9-2','STR_002','STR_003',9,1),(57,1,3,'Stadio 9-3','STR_003',NULL,9,2),(58,1,1,'Stadio 10-1',NULL,'STR_004',10,2),(59,1,2,'Stadio 10-2','STR_004','STR_005',10,3),(60,1,3,'Stadio 10-3','STR_005',NULL,10,1);
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
  `IdStrumento` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
INSERT INTO `stadio_strumento` VALUES (31,'STR_001',2),(31,'STR_002',1),(32,'STR_002',3),(32,'STR_003',2),(33,'STR_003',1),(33,'STR_004',4),(34,'STR_001',1),(34,'STR_005',2),(35,'STR_006',1),(35,'STR_007',3),(36,'STR_002',2),(36,'STR_008',1),(37,'STR_001',2),(37,'STR_009',1),(38,'STR_004',1),(38,'STR_010',3);
/*!40000 ALTER TABLE `stadio_strumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strumento`
--

DROP TABLE IF EXISTS `strumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strumento` (
  `CodiceComponente` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Nome` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`CodiceComponente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strumento`
--

LOCK TABLES `strumento` WRITE;
/*!40000 ALTER TABLE `strumento` DISABLE KEYS */;
INSERT INTO `strumento` VALUES ('STR_001','Strumento_1'),('STR_002','Strumento_2'),('STR_003','Strumento_3'),('STR_004','Strumento_4'),('STR_005','Strumento_5'),('STR_006','Strumento_6'),('STR_007','Strumento_7'),('STR_008','Strumento_8'),('STR_009','Strumento_9'),('STR_010','Strumento_10'),('STR_011','Strumento_11'),('STR_012','Strumento_12'),('STR_013','Strumento_13'),('STR_014','Strumento_14'),('STR_015','Strumento_15'),('STR_016','Strumento_16'),('STR_017','Strumento_17'),('STR_018','Strumento_18'),('STR_019','Strumento_19'),('STR_020','Strumento_20'),('STR_021','Strumento_21'),('STR_022','Strumento_22'),('STR_023','Strumento_23'),('STR_024','Strumento_24'),('STR_025','Strumento_25'),('STR_026','Strumento_26'),('STR_027','Strumento_27'),('STR_028','Strumento_28'),('STR_029','Strumento_29'),('STR_030','Strumento_30'),('STR_031','Strumento_31'),('STR_032','Strumento_32'),('STR_033','Strumento_33'),('STR_034','Strumento_34'),('STR_035','Strumento_35'),('STR_036','Strumento_36'),('STR_037','Strumento_37'),('STR_038','Strumento_38'),('STR_039','Strumento_39'),('STR_040','Strumento_40'),('STR_041','Strumento_41'),('STR_042','Strumento_42'),('STR_043','Strumento_43'),('STR_044','Strumento_44'),('STR_045','Strumento_45'),('STR_046','Strumento_46'),('STR_047','Strumento_47'),('STR_048','Strumento_48'),('STR_049','Strumento_49'),('STR_050','Strumento_50'),('STR_051','Strumento_51'),('STR_052','Strumento_52'),('STR_053','Strumento_53'),('STR_054','Strumento_54'),('STR_055','Strumento_55'),('STR_056','Strumento_56'),('STR_057','Strumento_57'),('STR_058','Strumento_58'),('STR_059','Strumento_59'),('STR_060','Strumento_60'),('STR_061','Strumento_61'),('STR_062','Strumento_62'),('STR_063','Strumento_63'),('STR_064','Strumento_64'),('STR_065','Strumento_65'),('STR_066','Strumento_66'),('STR_067','Strumento_67'),('STR_068','Strumento_68'),('STR_069','Strumento_69'),('STR_070','Strumento_70'),('STR_071','Strumento_71'),('STR_072','Strumento_72'),('STR_073','Strumento_73'),('STR_074','Strumento_74'),('STR_075','Strumento_75'),('STR_076','Strumento_76'),('STR_077','Strumento_77'),('STR_078','Strumento_78'),('STR_079','Strumento_79'),('STR_080','Strumento_80'),('STR_081','Strumento_81'),('STR_082','Strumento_82'),('STR_083','Strumento_83'),('STR_084','Strumento_84'),('STR_085','Strumento_85'),('STR_086','Strumento_86'),('STR_087','Strumento_87'),('STR_088','Strumento_88'),('STR_089','Strumento_89'),('STR_090','Strumento_90'),('STR_091','Strumento_91'),('STR_092','Strumento_92'),('STR_093','Strumento_93'),('STR_094','Strumento_94'),('STR_095','Strumento_95'),('STR_096','Strumento_96'),('STR_097','Strumento_97'),('STR_098','Strumento_98'),('STR_099','Strumento_99'),('STR_100','Strumento_100');
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
  `Nome` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VisibileAlPubblico` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoallegato`
--

LOCK TABLES `tipoallegato` WRITE;
/*!40000 ALTER TABLE `tipoallegato` DISABLE KEYS */;
INSERT INTO `tipoallegato` VALUES (1,'Foto',1),(2,'Misurazione',0),(3,'VIdeo',1),(4,'Schema',0);
/*!40000 ALTER TABLE `tipoallegato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'progettobosio'
--

--
-- Dumping routines for database 'progettobosio'
--
/*!50003 DROP PROCEDURE IF EXISTS `AggiungiStadioMissione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AggiungiStadioMissione`(
    IN IdMissione INT,
    IN IdModello INT,
    IN Versione INT,
    IN Note TEXT,
    IN IdAttaccoPrecedente VARCHAR(32)
)
BEGIN
    DECLARE nuovaPosizione INT;

    SELECT COALESCE(MAX(Posizione), 0) + 1
    INTO nuovaPosizione
    FROM stadio
    WHERE IdMissione = IdMissione;

    INSERT INTO stadio (
        CodiceVersione,
        Posizione,
        Note,
        IdMissione,
        IdModello,
        IdAttaccoStadioPrecedente
    )
    VALUES (
        Versione,
        nuovaPosizione,
        Note,
        IdMissione,
        IdModello,
        IdAttaccoPrecedente
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EstraiAllegatiMissione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EstraiAllegatiMissione`(
    IN IdMissione INT,
    IN VisibilePubblico BOOL
)
BEGIN
    SELECT 
        allegato.Id,
        allegato.Nome,
        allegato.Path,
        tipo.Nome AS TipoAllegato,
        tipo.VisibileAlPubblico
    FROM 
        allegato
        INNER JOIN tipoallegato AS tipo ON allegato.IdTipo = tipo.Id
    WHERE 
        allegato.IdMissione = IdMissione
        AND tipo.VisibileAlPubblico = VisibilePubblico;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMissioniBySitoLancio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMissioniBySitoLancio`(
    IN sitoId INT,
    IN skipCount INT,
    IN takeCount INT
)
BEGIN
    SELECT *
    FROM missione
    WHERE IdSitoLancio = sitoId
    ORDER BY DataLancio DESC
    LIMIT takeCount OFFSET skipCount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetModuliByMissione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetModuliByMissione`(
    IN missioneId INT
)
BEGIN
    SELECT 
        stadio.Id,
        stadio.Posizione,
        modello.Nome as Modello,
        (
            SELECT 
                JSON_OBJECTAGG(strumento.Nome, stadio_strumento.Numero)
            FROM stadio_strumento
            JOIN strumento ON strumento.CodiceComponente = stadio_strumento.IdStrumento
            WHERE stadio_strumento.Idstadio = stadio.Id
        ) AS Strumentazione
    FROM stadio
    INNER JOIN modellostadio AS modello ON stadio.IdModello = modello.Id
    WHERE stadio.IdMissione = missioneId
    ORDER BY stadio.Posizione ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ImpostaQuantitaStrumentoStadio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ImpostaQuantitaStrumentoStadio`(
  IN IdStadio INT,
  IN IdStrumento VARCHAR(32),
  IN Numero INT
)
BEGIN
  IF Numero = 0 THEN
    DELETE FROM stadio_strumento
    WHERE IdStadio = IdStadio AND IdStrumento = IdStrumento;
  ELSE
    INSERT INTO stadio_strumento (IdStadio, IdStrumento, Numero)
    VALUES (IdStadio, IdStrumento, Numero)
    ON DUPLICATE KEY UPDATE Numero = VALUES(Numero);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RimuoviStadioMissione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RimuoviStadioMissione`(
    IN IdMissioneTarget INT,
    IN PosizioneTarget INT
)
BEGIN
    DELETE FROM stadio
    WHERE IdMissione = IdMissioneTarget AND Posizione = PosizioneTarget;

    UPDATE stadio
    SET Posizione = Posizione - 1
    WHERE IdMissione = IdMissioneTarget AND Posizione > PosizioneTarget;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-24 17:09:09
