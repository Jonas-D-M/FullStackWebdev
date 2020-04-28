SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `trein`
--
CREATE DATABASE IF NOT EXISTS `trein` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `trein`;

CREATE USER IF NOT EXISTS 'root_fswd'@'localhost' IDENTIFIED BY 'root_fswd';
GRANT ALL PRIVILEGES ON * . * TO 'root_fswd'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

--
-- Table structure for table `bestemmingen`
--

DROP TABLE IF EXISTS `bestemmingen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `bestemmingen` (
  `idbestemmingen` int(11) NOT NULL AUTO_INCREMENT,
  `stad` varchar(45) NOT NULL,
  PRIMARY KEY (`idbestemmingen`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestemmingen`
--

LOCK TABLES `bestemmingen` WRITE;
/*!40000 ALTER TABLE `bestemmingen` DISABLE KEYS */;
INSERT INTO `bestemmingen` VALUES (100,'Brussel'),(101,'Antwerpen'),(102,'Gent-Sint-Pieters'),(103,'Brugge');
/*!40000 ALTER TABLE `bestemmingen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treinen`
--

DROP TABLE IF EXISTS `treinen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `treinen` (
  `idtreinen` int(11) NOT NULL AUTO_INCREMENT,
  `vertrek` time NOT NULL,
  `bestemmingID` int(11) NOT NULL,
  `spoor` int(11) NOT NULL,
  `vertraging` int(11) DEFAULT NULL,
  `afgelast` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idtreinen`),
  KEY `bestemming_idx` (`bestemmingID`),
  CONSTRAINT `bestemming` FOREIGN KEY (`bestemmingID`) REFERENCES `bestemmingen` (`idbestemmingen`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treinen`
--

LOCK TABLES `treinen` WRITE;
/*!40000 ALTER TABLE `treinen` DISABLE KEYS */;
INSERT INTO `treinen` VALUES (16,'10:00:00',100,12,NULL,0),(17,'10:00:00',101,11,NULL,0),(18,'10:10:00',103,5,5,0),(19,'10:15:00',103,5,NULL,1),(20,'11:00:00',100,9,NULL,0),(21,'10:10:00',103,6,30,0);
/*!40000 ALTER TABLE `treinen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-12 10:34:56
