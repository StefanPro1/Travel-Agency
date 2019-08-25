-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: agencija
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `agencija`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `agencija` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `agencija`;

--
-- Table structure for table `avio_kompanije`
--

DROP TABLE IF EXISTS `avio_kompanije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avio_kompanije` (
  `idAvio_kompanije` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAvio_kompanije`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avio_kompanije`
--

LOCK TABLES `avio_kompanije` WRITE;
/*!40000 ALTER TABLE `avio_kompanije` DISABLE KEYS */;
INSERT INTO `avio_kompanije` VALUES (2,'Air Serbia'),(3,'Turkish Airlines'),(4,'Qatar Airways'),(5,'Air France'),(6,'Austrian Airlines'),(7,'Etihad Airways'),(8,'Lufthansa'),(9,'Air Canada'),(10,'Wizz Air');
/*!40000 ALTER TABLE `avio_kompanije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinacije`
--

DROP TABLE IF EXISTS `destinacije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destinacije` (
  `idDestinacije` int(11) unsigned NOT NULL,
  `Grad` varchar(45) DEFAULT NULL,
  `Drzava` varchar(45) DEFAULT NULL,
  `Cena` int(11) DEFAULT NULL,
  `fk_aviokompanije` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`idDestinacije`),
  KEY `fk_avio_idx` (`fk_aviokompanije`),
  CONSTRAINT `fk_aviokompanije` FOREIGN KEY (`fk_aviokompanije`) REFERENCES `avio_kompanije` (`idAvio_kompanije`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinacije`
--

LOCK TABLES `destinacije` WRITE;
/*!40000 ALTER TABLE `destinacije` DISABLE KEYS */;
INSERT INTO `destinacije` VALUES (1,'Belgrade','Serbia',0,NULL),(2,'Nis','Serbia',20,NULL),(3,'Budapest','Hungary',64,NULL),(4,'Wien','Austria',129,NULL),(5,'Berlin','Germany',159,NULL),(6,'Frankfurt','Germany',165,NULL),(7,'Prague','Czech Republic',189,NULL),(8,'Oslo','Norway',225,NULL),(9,'Stockholm','Sweden',215,NULL),(10,'Copenhagen','Denmark',200,NULL),(11,'Moscow','Russia',240,NULL),(12,'London','United Kingdom',150,NULL),(13,'Barselona','Spain',135,NULL),(14,'Madrid','Spain',140,NULL),(15,'Warsaw','Poland',115,NULL),(16,'Beijing','China',999,NULL),(17,'Sydney','Australia',1120,NULL),(18,'New York','Usa',395,NULL),(19,'Washington','Usa',670,NULL),(21,'Paris','France',139,NULL),(22,'Rome','Italy',129,NULL),(23,'Havana','Cuba',1129,NULL);
/*!40000 ALTER TABLE `destinacije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoteli`
--

DROP TABLE IF EXISTS `hoteli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hoteli` (
  `IdHoteli` int(11) unsigned NOT NULL,
  `Naziv` varchar(45) DEFAULT NULL,
  `Stars` varchar(45) DEFAULT NULL,
  `Cena` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdHoteli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoteli`
--

LOCK TABLES `hoteli` WRITE;
/*!40000 ALTER TABLE `hoteli` DISABLE KEYS */;
INSERT INTO `hoteli` VALUES (1,'In Hotel Belgrade','3',39),(2,'Sole Hotel Nis','3',19),(3,'Danubius Hotel Budapest','4',50),(4,'Leonardo Hotel Wien','4',69),(5,'The Yard Hotel Berlin','4',60),(6,'Grand Hotel Empire Frankfurt','4',75),(7,'Grandior Hotel Prague','3',55),(8,'Citybox Oslo   ','3',88),(9,'Radisson Blu Royal Stockholm','4',90),(10,'Nobis Hotel Copenhagen  ','5',99),(11,'Izmailovo Hotel Moscow','4',79),(12,'Sunborn Hotel London','4',120),(13,'Iluniion Almirante Hotel Barselona','4',139),(14,'Hotel Via Castellana Madrid','4',128),(15,'Radisson Blu Sobienski Warsaw','3',70),(16,'Pan Pacific Beijing  ','5',199),(17,'Hotel Chalis Sydney','4',230),(18,'Hotel Edison New York','4',249),(19,'Hotel Plaza Washington ','4',199),(20,'Hotel Royal Phare Paris','5',189);
/*!40000 ALTER TABLE `hoteli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korisnici`
--

DROP TABLE IF EXISTS `korisnici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `korisnici` (
  `idKorisnici` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Ime` varchar(45) DEFAULT NULL,
  `Prezime` varchar(45) DEFAULT NULL,
  `Adresa` varchar(45) DEFAULT NULL,
  `Br_Telefona` varchar(45) DEFAULT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(32) NOT NULL,
  PRIMARY KEY (`idKorisnici`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  UNIQUE KEY `idKorisnici_UNIQUE` (`idKorisnici`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnici`
--

LOCK TABLES `korisnici` WRITE;
/*!40000 ALTER TABLE `korisnici` DISABLE KEYS */;
INSERT INTO `korisnici` VALUES (1,'Stefan','Prokic','stefansp89@gmail.com','065/240-2089','stefanpro','1989'),(4,'Petar','Kocic','pera87@gmail.com','065/502-2447','pera123','321'),(5,'Kosta','Maric','kole43@gmail.com','064/455-7899','kole1','123'),(9,'Stevan','Stevic','steva@gmail.com','064/455-7899','steva','456'),(11,'Stevan','Stevic','steva@gmail.com','065/502-2447','steva1','123'),(12,'Goran','Kostic','goran@gmail.com','060/245-5282','goran321','654'),(13,'Marko','Prokic','marko89lfc1892@gmail.com','060/144-4138','marko1892','enfild1892'),(14,'Stefan','Prokic','stefansp89@gmail.com','065/502-2447','stefan89','456');
/*!40000 ALTER TABLE `korisnici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezervacija`
--

DROP TABLE IF EXISTS `rezervacija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rezervacija` (
  `IdRezervacije` int(11) NOT NULL AUTO_INCREMENT,
  `fk_korisnici` int(11) unsigned DEFAULT NULL,
  `Datum` varchar(11) DEFAULT NULL,
  `fk_destinacije` int(11) unsigned DEFAULT NULL,
  `fk_hoteli` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`IdRezervacije`),
  KEY `fk_hoteli_idx` (`fk_hoteli`),
  KEY `fk_korisnici_idx` (`fk_korisnici`),
  KEY `fk_destinacije_idx` (`fk_destinacije`),
  CONSTRAINT `fk_destinacije` FOREIGN KEY (`fk_destinacije`) REFERENCES `destinacije` (`idDestinacije`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hoteli` FOREIGN KEY (`fk_hoteli`) REFERENCES `hoteli` (`IdHoteli`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_korisnici` FOREIGN KEY (`fk_korisnici`) REFERENCES `korisnici` (`idKorisnici`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezervacija`
--

LOCK TABLES `rezervacija` WRITE;
/*!40000 ALTER TABLE `rezervacija` DISABLE KEYS */;
INSERT INTO `rezervacija` VALUES (5,1,'09/18/2018',12,NULL),(6,1,'09/29/2018',16,NULL),(7,1,'09/29/2018',15,NULL),(8,1,'09/29/2018',10,NULL),(10,1,'09/29/2018',NULL,9),(11,1,'09/08/2018',NULL,8),(12,1,'09/20/2018',13,NULL),(13,1,'09/26/2018',7,NULL),(14,1,'09/22/2018',6,NULL),(17,1,'09/15/2018',12,NULL),(18,1,'09/08/2018',17,NULL),(20,1,'09/22/2018',NULL,8),(21,1,'09/28/2018',11,NULL),(22,1,'09/13/2018',7,NULL),(23,1,'09/12/2018',NULL,5),(24,1,'09/21/2018',NULL,12),(25,1,'09/22/2018',NULL,9),(26,1,'09/14/2018',NULL,6),(27,1,'09/29/2018',17,NULL),(28,1,'09/29/2018',NULL,17),(29,1,'09/14/2018',NULL,12),(30,1,'09/20/2018',13,NULL),(31,1,'09/27/2018',14,NULL),(32,1,'09/20/2018',14,NULL),(33,1,'09/19/2018',18,NULL),(34,1,'09/20/2018',2,NULL),(35,1,'09/20/2018',2,NULL),(36,1,'09/21/2018',2,NULL),(37,1,'09/21/2018',2,NULL),(38,1,'09/26/2018',2,NULL),(39,1,'09/21/2018',2,NULL),(40,1,'09/21/2018',2,NULL),(41,1,'09/21/2018',2,NULL),(42,1,'09/26/2018',1,NULL),(43,1,'09/29/2018',2,NULL),(44,1,'09/08/2018',2,NULL),(45,1,'09/22/2018',2,NULL),(46,1,'09/22/2018',2,NULL),(47,1,'09/15/2018',2,NULL),(48,1,'09/27/2018',2,NULL),(49,1,'09/15/2018',2,NULL),(50,1,'09/14/2018',6,NULL),(51,1,'09/14/2018',4,NULL),(52,1,'09/29/2018',15,NULL),(53,1,'09/21/2018',21,NULL),(54,1,'09/22/2018',NULL,5),(55,1,'09/15/2018',NULL,16),(56,1,'09/29/2018',16,NULL),(57,1,'09/27/2018',22,NULL),(58,1,'09/25/2018',21,NULL),(59,1,'09/22/2018',22,NULL),(60,1,'02/19/2019',NULL,13),(61,1,'09/28/2018',23,NULL),(62,14,'09/29/2018',12,NULL),(63,14,'09/20/2018',12,NULL),(64,14,'09/21/2018',12,NULL),(65,14,'09/21/2018',12,NULL),(66,14,'09/12/2018',12,NULL),(67,14,'09/26/2018',12,NULL),(68,14,'09/22/2018',12,NULL),(69,14,'09/28/2018',12,NULL),(70,14,'09/26/2018',2,NULL),(71,14,'09/27/2018',12,NULL),(72,14,'09/28/2018',12,NULL),(73,14,'09/20/2018',12,NULL),(74,14,'09/28/2018',12,NULL),(75,14,'09/21/2018',12,NULL),(76,14,'09/26/2018',12,NULL),(77,14,'09/22/2018',12,NULL),(78,14,'09/27/2018',12,NULL),(79,14,'09/27/2018',12,NULL),(80,14,'09/20/2018',12,NULL),(81,14,'09/22/2018',12,NULL),(82,14,'09/19/2018',23,NULL),(83,14,'09/20/2018',12,NULL),(84,14,'09/25/2018',1,NULL),(85,14,'09/26/2018',12,NULL),(86,14,'09/20/2018',12,NULL),(87,14,'09/19/2018',12,NULL),(88,14,'09/28/2018',1,NULL),(89,14,'09/29/2018',12,NULL),(90,14,'09/20/2018',12,NULL),(91,1,'09/26/2018',2,NULL),(92,1,'09/21/2018',2,NULL),(93,1,'09/28/2018',1,NULL),(94,1,'09/21/2018',2,NULL),(95,1,'09/27/2018',12,NULL),(96,1,'09/27/2018',12,NULL),(97,1,'09/26/2018',12,NULL),(98,1,'09/19/2018',12,NULL),(99,1,'09/19/2018',12,NULL),(100,1,'09/19/2018',12,NULL);
/*!40000 ALTER TABLE `rezervacija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaposleni`
--

DROP TABLE IF EXISTS `zaposleni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zaposleni` (
  `idZaposleni` int(11) NOT NULL AUTO_INCREMENT,
  `Ime` varchar(45) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idZaposleni`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaposleni`
--

LOCK TABLES `zaposleni` WRITE;
/*!40000 ALTER TABLE `zaposleni` DISABLE KEYS */;
INSERT INTO `zaposleni` VALUES (1,'Stefan','StefanP','321');
/*!40000 ALTER TABLE `zaposleni` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-06 22:17:54
