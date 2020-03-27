CREATE DATABASE  IF NOT EXISTS `trein` 
/*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trein`;

--
-- Nieuwe gebruiker voor FSWD indien nog niet bestaat.
--

CREATE USER IF NOT EXISTS 'root_fswd' @'localhost' IDENTIFIED BY 'root_fswd';
GRANT ALL PRIVILEGES ON *.* TO 'root_fswd' @'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

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
-- Table structure for table `bestemmingen`
--

DROP TABLE IF EXISTS `bestemmingen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bestemmingen` (
  `idbestemming` int(11) NOT NULL AUTO_INCREMENT,
  `stad` varchar(45) NOT NULL,
  `latitude` varchar(10) NOT NULL,
  `Llngitude` varchar(10) NOT NULL,
  PRIMARY KEY (`idbestemming`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestemmingen`
--

LOCK TABLES `bestemmingen` WRITE;
/*!40000 ALTER TABLE `bestemmingen` DISABLE KEYS */;
INSERT INTO `bestemmingen` VALUES (100,'Brussel','50.8454639','4.3569867'),(101,'Antwerpen','',''),(102,'Gent-Sint-Pieters','',''),(103,'Brugge','','');
/*!40000 ALTER TABLE `bestemmingen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treinen`
--

DROP TABLE IF EXISTS `treinen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treinen` (
  `idtrein` int(11) NOT NULL AUTO_INCREMENT,
  `vertrek` tinytext NOT NULL,
  `bestemmingID` int(11) NOT NULL,
  `spoor` int(11) NOT NULL,
  `vertraging` int(11) DEFAULT NULL,
  `afgeschaft` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idtrein`),
  KEY `bestemming_idx` (`bestemmingID`),
  CONSTRAINT `bestemming` FOREIGN KEY (`bestemmingID`) REFERENCES `bestemmingen` (`idbestemming`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treinen`
--

LOCK TABLES `treinen` WRITE;
/*!40000 ALTER TABLE `treinen` DISABLE KEYS */;
INSERT INTO `treinen` VALUES (16,'10:00',100,12,0,0),(17,'10:00',101,11,NULL,0),(18,'10:10',103,5,5,0),(19,'10:15',103,5,NULL,1),(20,'11:00',100,9,NULL,0),(21,'10:10',103,6,30,0),(25,'02:01',101,4,1,0),(26,'11:22',100,32,4,1),(27,'11:22',101,5,NULL,0),(28,'22:22',101,99,60,1),(29,'23:00',100,99,NULL,0),(30,'11:22',101,55,5,1),(31,'11:11',100,34,5,1),(32,'22:22',100,4,5,1),(34,'04:11',102,4,5,0),(35,'04:11',102,4,5,0),(36,'04:11',102,6,5,0),(38,'11:11',103,3,4,0);
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

-- Dump completed on 2020-03-16 11:56:40
