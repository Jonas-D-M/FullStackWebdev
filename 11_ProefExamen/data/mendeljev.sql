/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `elements` (
  `atomicNumber` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `symbol` varchar(45) DEFAULT NULL,
  `atomicWeight` float DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `typeID` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `discoverer` varchar(45) DEFAULT NULL,
  `yearDiscovered` int(11) DEFAULT NULL,
  `displayRow` int(11) DEFAULT NULL,
  `displayColumn` int(11) DEFAULT NULL,
  PRIMARY KEY (`atomicNumber`),
  KEY `fk_idx` (`typeID`),
  CONSTRAINT `fk` FOREIGN KEY (`typeID`) REFERENCES `types` (`typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,'Hydrogen','H',100794,1,9,1,'Cavendish',1766,1,1),(2,'Helium','He',4002600,1,8,18,'Janssen',1868,1,18),(3,'Lithium','Li',6941,2,2,1,'Arfvedson',1817,2,1),(4,'Beryllium','Be',9012180,2,3,2,'Vaulquelin',1798,2,2),(5,'Boron','B',10811,2,7,13,'Gay-Lussac',1808,2,13),(6,'Carbon','C',120107,2,9,14,'Prehistoric',0,2,14),(7,'Nitrogen','N',140067,2,9,15,'Rutherford',1772,2,15),(8,'Oxygen','O',159994,2,9,16,'Priestley/Scheele',1774,2,16),(9,'Fluorine','F',189984000,2,4,17,'Moissan',1886,2,17),(10,'Neon','Ne',201797,2,8,18,'Ramsay and Travers',1898,2,18),(11,'Sodium','Na',2298980000,3,2,1,'Davy',1807,3,1),(12,'Magnesium','Mg',24305,3,3,2,'Black',1755,3,2),(13,'Aluminum','Al',269815000,3,6,13,'Wöhler',1827,3,13),(14,'Silicon','Si',280855,3,7,14,'Berzelius',1824,3,14),(15,'Phosphorus','P',30973800,3,9,15,'BranBrand',1669,3,15),(16,'Sulfur','S',32065,3,9,16,'Prehistoric',0,3,16),(17,'Chlorine','Cl',35453,3,4,17,'Scheele',1774,3,17),(18,'Argon','Ar',39948,3,8,18,'Rayleigh and Ramsay',1894,3,18),(19,'Potassium','K',390983,4,2,1,'Davy',1807,4,1),(20,'Calcium','Ca',40078,4,3,2,'Davy',1808,4,2),(21,'Scandium','Sc',44955900,4,11,3,'Nilson',1878,4,3),(22,'Titanium','Ti',47867,4,11,4,'Gregor',1791,4,4),(23,'Vanadium','V',509415,4,11,5,'del Rio',1801,4,5),(24,'Chromium','Cr',519961,4,11,6,'Vauquelin',1797,4,6),(25,'Manganese','Mn',54938000,4,11,7,'Gahn, Scheele',1774,4,7),(26,'Iron','Fe',55845,4,11,8,'Prehistoric',0,4,8),(27,'Cobalt','Co',58933200,4,11,9,'Brandt',1735,4,9),(28,'Nickel','Ni',586934,4,11,10,'Cronstedt',1751,4,10),(29,'Copper','Cu',63546,4,11,11,'Prehistoric',0,4,11),(30,'Zinc','Zn',65.38,4,11,12,'Prehistoric',0,4,12),(31,'Gallium','Ga',69723,4,6,13,'de Boisbaudran',1875,4,13),(32,'Germanium','Ge',72.64,4,7,14,'Winkler',1886,4,14),(33,'Arsenic','As',749216,4,7,15,'Albertus Magnus',1250,4,15),(34,'Selenium','Se',78.96,4,9,16,'Berzelius',1817,4,16),(35,'Bromine','Br',79904,4,4,17,'Balard',1826,4,17),(36,'Krypton','Kr',83798,4,8,18,'Ramsay and Travers',1898,4,18),(37,'Rubidium','Rb',854678,5,2,1,'Bunsen and Kirchoff',1861,5,1),(38,'Strontium','Sr',87.62,5,3,2,'Davy',1808,5,2),(39,'Yttrium','Y',8890580,5,11,3,'Gadolin',1794,5,3),(40,'Zirconium','Zr',91224,5,11,4,'Klaproth',1789,5,4),(41,'Niobium','Nb',9290640,5,11,5,'Hatchett',1801,5,5),(42,'Molybdenum','Mo',95.96,5,11,6,'Scheele',1778,5,6),(43,'Technetium','Tc',98,5,11,7,'Perrier and Segr_',1937,5,7),(44,'Ruthenium','Ru',101.07,5,11,8,'Klaus',1844,5,8),(45,'Rhodium','Rh',1029060,5,11,9,'Wollaston',1803,5,9),(46,'Palladium','Pd',106.42,5,11,10,'Wollaston',1803,5,10),(47,'Silver','Ag',1078680,5,11,11,'Prehistoric',0,5,11),(48,'Cadmium','Cd',112411,5,11,12,'Stromeyer',1817,5,12),(49,'Indium','In',114818,5,6,13,'Reich and Richter',1863,5,13),(50,'Tin','Sn',118.71,5,6,14,'Prehistoric',0,5,14),(51,'Antimony','Sb',121.76,5,7,15,'Early historic times',0,5,15),(52,'Tellurium','Te',127.6,5,7,16,'von Reichenstein',1782,5,16),(53,'Iodine','I',12690400,5,4,17,'Courtois',1811,5,17),(54,'Xenon','Xe',131293,5,8,18,'Ramsay and Travers',1898,5,18),(55,'Cesium','Cs',1329050000,6,2,1,'Bunsen and Kirchoff',1860,6,1),(56,'Barium','Ba',137327,6,3,2,'Davy',1808,6,2),(57,'Lanthanum','La',13890500,6,5,3,'Mosander',1839,8,3),(58,'Cerium','Ce',140116,6,5,19,'Berzelius',1803,8,4),(59,'Praseodymium','Pr',14090800,6,5,20,'von Welsbach',1885,8,5),(60,'Neodymium','Nd',144242,6,5,21,'von Welsbach',1885,8,6),(61,'Promethium','Pm',145,6,5,22,'Marinsky et al.',1945,8,7),(62,'Samarium','Sm',150.36,6,5,23,'Boisbaudran',1879,8,8),(63,'Europium','Eu',151964,6,5,24,'Demarcay',1901,8,9),(64,'Gadolinium','Gd',157.25,6,5,25,'de Marignac',1880,8,10),(65,'Terbium','Tb',15892500,6,5,26,'Mosander',1843,8,11),(66,'Dysprosium','Dy',162.5,6,5,27,'de Boisbaudran',1886,8,12),(67,'Holmium','Ho',16493000,6,5,28,'Delafontaine and Soret',1878,8,13),(68,'Erbium','Er',167259,6,5,29,'Mosander',1843,8,14),(69,'Thulium','Tm',16893400,6,5,30,'Cleve',1879,8,15),(70,'Ytterbium','Yb',173054,6,5,31,'Marignac',1878,8,16),(71,'Lutetium','Lu',1749670,6,5,32,'Urbain/ von Welsbach',1907,8,17),(72,'Hafnium','Hf',178.49,6,11,4,'Coster and von Hevesy',1923,6,4),(73,'Tantalum','Ta',18094800,6,11,5,'Ekeberg',1801,6,5),(74,'Wolfram','W',183.84,6,11,6,'J. and F. dElhuyar',1783,6,6),(75,'Rhenium','Re',186207,6,11,7,'Noddack, Berg, and Tacke',1925,6,7),(76,'Osmium','Os',190.23,6,11,8,'Tennant',1803,6,8),(77,'Iridium','Ir',192217,6,11,9,'Tennant',1804,6,9),(78,'Platinum','Pt',195084,6,11,10,'Ulloa/Wood',1735,6,10),(79,'Gold','Au',196967000,6,11,11,'Prehistoric',0,6,11),(80,'Mercury','Hg',200.59,6,11,12,'Prehistoric',0,6,12),(81,'Thallium','Tl',2043830,6,6,13,'Crookes',1861,6,13),(82,'Lead','Pb',207.2,6,6,14,'Prehistoric',0,6,14),(83,'Bismuth','Bi',2089800,6,6,15,'Geoffroy the Younger',1753,6,15),(84,'Polonium','Po',210,6,7,16,'Curie',1898,6,16),(85,'Astatine','At',210,6,7,17,'Corson et al.',1940,6,17),(86,'Radon','Rn',222,6,8,18,'Dorn',1900,6,18),(87,'Francium','Fr',223,7,2,1,'Perey',1939,7,1),(88,'Radium','Ra',226,7,3,2,'Pierre and Marie Curie',1898,7,2),(89,'Actinium','Ac',227,7,1,3,'Debierne/Giesel',1899,9,3),(90,'Thorium','Th',23203800,7,1,19,'Berzelius',1828,9,4),(91,'Protactinium','Pa',23103600,7,1,20,'Hahn and Meitner',1917,9,5),(92,'Uranium','U',23802900,7,1,21,'Peligot',1841,9,6),(93,'Neptunium','Np',237,7,1,22,'McMillan and Abelson',1940,9,7),(94,'Plutonium','Pu',244,7,1,23,'Seaborg et al.',1940,9,8),(95,'Americium','Am',243,7,1,24,'Seaborg et al.',1944,9,9),(96,'Curium','Cm',247,7,1,25,'Seaborg et al.',1944,9,10),(97,'Berkelium','Bk',247,7,1,26,'Seaborg et al.',1949,9,11),(98,'Californium','Cf',251,7,1,27,'Seaborg et al.',1950,9,12),(99,'Einsteinium','Es',252,7,1,28,'Ghiorso et al.',1952,9,13),(100,'Fermium','Fm',257,7,1,29,'Ghiorso et al.',1953,9,14),(101,'Mendelevium','Md',258,7,1,30,'Ghiorso et al.',1955,9,15),(102,'Nobelium','No',259,7,1,31,'Ghiorso et al.',1958,9,16),(103,'Lawrencium','Lr',262,7,1,32,'Ghiorso et al.',1961,9,17),(104,'Rutherfordium','Rf',261,7,10,4,'Ghiorso et al.',1969,7,4),(105,'Dubnium','Db',262,7,10,5,'Ghiorso et al.',1970,7,5),(106,'Seaborgium','Sg',266,7,10,6,'Ghiorso et al.',1974,7,6),(107,'Bohrium','Bh',264,7,10,7,'Armbruster and MÙnzenberg',1981,7,7),(108,'Hassium','Hs',267,7,10,8,'Armbruster and MÙnzenberg',1983,7,8),(109,'Meitnerium','Mt',268,7,10,9,'GSI, Darmstadt, West Germany',1982,7,9),(110,'Darmstadtium','Ds',271,7,10,10,'?',0,7,10),(111,'Roentgenium','Rg',272,7,10,11,'?',0,7,11),(112,'Copernicium','Cn',285,7,10,12,'?',0,7,12),(113,'Ununtrium','Uut',284,7,6,13,'?',0,7,13),(114,'Ununquadium','Uuq',289,7,6,14,'?',0,7,14),(115,'Ununpentium','Uup',288,7,6,15,'?',0,7,15),(116,'Ununhexium','Uuh',292,7,6,16,'?',0,7,16),(117,'Ununseptium','Uus',295,7,6,17,'?',0,7,17),(118,'Ununoctium','Uuo',294,7,8,18,'?',0,7,18);
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `types` (
  `typeID` int(11) NOT NULL AUTO_INCREMENT,
  `typeCode` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Actinide','Actinide'),(2,'AlkaliMetal','Alkali Metal'),(3,'AlkalineEarthMetal','Alkaline Earth Metal'),(4,'Halogen','Halogen'),(5,'Lanthanide','Lanthanide'),(6,'Metal','Metal'),(7,'Metalloid','Metalloid'),(8,'NobleGas','Noble Gas'),(9,'Nonmetal','Nonmetal'),(10,'Transactinide','Transactinide'),(11,'TransitionMetal','Transition Metal');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
