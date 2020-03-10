SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `vliegtuigen`
--
CREATE DATABASE IF NOT EXISTS `vliegtuigen` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `vliegtuigen`;

CREATE USER IF NOT EXISTS 'root_fswd'@'localhost' IDENTIFIED BY 'root_fswd';
GRANT ALL PRIVILEGES ON * . * TO 'root_fswd'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

--
-- Table structure for table `tblbestemming`
--

DROP TABLE IF EXISTS `tblbestemming`;
CREATE TABLE `tblbestemming` (
  `BestemmingID` int(11) NOT NULL,
  `Afkorting` varchar(3) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Voluit` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Land` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `TypeVlucht` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbestemming`
--

INSERT INTO `tblbestemming` (`BestemmingID`, `Afkorting`, `Voluit`, `Land`, `TypeVlucht`) VALUES
(527, 'AMS', ' Amsterdam Airport Schiphol', 'Nederland', 1),
(528, 'BCN', ' Barcelona Airport', 'Spanje', 1),
(529, 'TXL', ' Berlijn Tegel Airport', 'Duitsland', 1),
(530, 'BKK', ' Bangkok International Airport ', 'Thailand ', 2),
(532, 'CAI', ' Cairo International Airport ', 'Egypte ', 2),
(533, 'CDG', ' Parijs Charles de Gaulle International Airport ', 'Frankrijk ', 1),
(534, 'CEB', ' Mactan- Cebu International Airport', 'Filipijnen', 2),
(535, 'CRL', ' Brussels South Charleroi Airport ', 'België ', 1),
(536, 'CUR', ' Hato Airport, Curaçao', 'Nederlandse Antillen', 2),
(537, 'DUB', ' Dublin International Airport', 'Ierland', 1),
(538, 'DXB', ' Dubai International Airport', 'Verenigde Arabische Emiraten', 2),
(539, 'EIN', ' Eindhoven Airport', 'Nederland', 1),
(540, 'ENS', ' Enschede Airport Twente', 'Nederland', 1),
(541, 'GRQ', ' Groningen Airport Eelde', 'Nederland', 1),
(542, 'HHN', ' Luchthaven Frankfurt- Hahn', 'Duitsland', 1),
(543, 'JFK', ' John F. Kennedy International Airport ', 'Verenigde Staten ', 2),
(544, 'LAX', ' Los Angeles International Airport', 'Verenigde Staten', 2),
(545, 'LCY', ' Londen City Airport ', 'Verenigd Koninkrijk', 1),
(546, 'LEY', ' Lelystad Airport', 'Nederland', 2),
(547, 'LHR', ' Londen Heathrow Airport', 'Verenigd Koninkrijk', 1),
(548, 'MST', ' Maastricht Aachen Airport', 'Nederland', 2),
(550, 'RTM', ' Rotterdam Airport ', 'Nederland ', 2),
(551, 'SBZ', ' Sibiu International Airport ', 'Roemenië ', 1),
(552, 'VIE', ' Vienna International Airport ', 'Wenen, Oostenrijk ', 1),
(553, 'WLG', ' Wellington International Airport ', 'Nieuw- Zeeland', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblhuidigeprijssetting`
--

DROP TABLE IF EXISTS `tblhuidigeprijssetting`;
CREATE TABLE `tblhuidigeprijssetting` (
  `TypeVlucht` int(11) NOT NULL,
  `HuidigePrijsSetting` decimal(18,2) DEFAULT NULL,
  `omschrijving` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblhuidigeprijssetting`
--

INSERT INTO `tblhuidigeprijssetting` (`TypeVlucht`, `HuidigePrijsSetting`, `omschrijving`) VALUES
(1, '99.00', 'korte vlucht'),
(2, '400.00', 'lange vlucht');

-- --------------------------------------------------------

--
-- Table structure for table `tblklant`
--

DROP TABLE IF EXISTS `tblklant`;
CREATE TABLE `tblklant` (
  `KlantID` int(11) NOT NULL,
  `FNaam` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `VNaam` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Straat` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Nummer` varchar(5) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Postcode` int(11) DEFAULT NULL,
  `Gemeente` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblklant`
--

INSERT INTO `tblklant` (`KlantID`, `FNaam`, `VNaam`, `Straat`, `Nummer`, `Postcode`, `Gemeente`) VALUES
(100, 'Bennett', 'Dacey', '867 Varius Ave', '30', 8577, 'Uberlândia'),
(101, 'Garrison', 'Murphy', 'Ap #785-1569 Risus. St.', '61', 794, 'Bojano'),
(102, 'Neal', 'Rogan', '338-3540 Consequat St.', '35', 8715, 'Habra'),
(103, 'Crawford', 'Gabriel', '5770 Neque Rd.', '04', 1231, 'Marchtrenk'),
(104, 'David', 'Kenneth', '898 Sed St.', '82', 9101, 'Sulzbach'),
(105, 'Jordan', 'Anthony', 'Ap #273-4848 Nonummy. Av.', '59', 6024, 'Annapolis'),
(106, 'Peck', 'Petra', '704 Sit Street', '27', 9629, 'Gualdo Cattaneo'),
(107, 'Patrick', 'Adele', 'P.O. Box 794, 4806 Ac Av.', '79', 19, 'Sasaram'),
(108, 'Moreno', 'Norman', '4169 Dolor. Street', '41', 5403, 'Buizingen'),
(109, 'Colon', 'Kristen', '1856 Vivamus Street', '44', 3319, 'Heide'),
(110, 'Richard', 'Xyla', 'Ap #827-8168 At, Rd.', '72', 5199, 'Colombes'),
(111, 'Santos', 'Amelia', 'P.O. Box 908, 4811 Sit Rd.', '07', 2439, 'Itajaí'),
(112, 'Carver', 'Raya', '8397 Facilisis Ave', '30', 3920, 'Valparaíso de Goiás'),
(113, 'Sweeney', 'Cameron', '710-3407 Eu St.', '62', 6767, 'Santa Luzia'),
(114, 'Head', 'Wynne', '5840 Ligula St.', '25', 8740, 'Gonda'),
(115, 'Elliott', 'Darrel', '644-2337 Consectetuer Ave', '47', 5955, 'Quarona'),
(116, 'Goodman', 'Devin', 'Ap #336-656 Mauris Avenue', '45', 7447, 'Warrnambool'),
(117, 'Tanner', 'Belle', '735-8845 Cras Road', '00', 1159, 'Rekem'),
(118, 'Chaney', 'Ginger', 'Ap #235-296 Integer Ave', '33', 5825, 'Linz'),
(119, 'Jones', 'Chloe', '400-355 Magna Road', '82', 707, 'Vannes'),
(120, 'Schwartz', 'Jordan', 'Ap #838-6465 Molestie St.', '82', 8458, 'Chilliwack'),
(121, 'Tyson', 'Amber', '9425 Nibh. Ave', '39', 1859, 'La Baie'),
(122, 'William', 'Tanek', 'Ap #705-9782 Dictum Street', '41', 5864, 'Pittsburgh'),
(123, 'Jennings', 'Jolene', 'P.O. Box 399, 8010 Id, St.', '87', 4954, 'Berwick'),
(124, 'Webb', 'Colette', '507-4763 At, St.', '90', 8802, 'Patos'),
(125, 'Olsen', 'Macey', '701-2595 Commodo Rd.', '92', 8174, 'Gibsons'),
(126, 'Montgomery', 'Driscoll', 'P.O. Box 206, 8816 Eu Avenue', '03', 7078, 'Pievepelago'),
(127, 'Buchanan', 'Jarrod', '843-4269 Ipsum Rd.', '77', 70, 'Kaneohe'),
(128, 'Alvarez', 'Dalton', '1459 Sit Road', '77', 3248, 'Yaxley'),
(129, 'Roy', 'Kane', '3671 Neque. Av.', '26', 4857, 'Gravilias'),
(130, 'Carlson', 'Ivor', 'P.O. Box 935, 2908 Orci. Rd.', '71', 4262, 'Bad Kreuznach'),
(131, 'Hanson', 'Raya', '478-7127 In St.', '86', 2640, 'Rimbey'),
(132, 'Chapman', 'Louis', '305-913 Nam St.', '29', 1019, 'Llandrindod Wells'),
(133, 'Ratliff', 'Keane', 'P.O. Box 371, 422 Eu Avenue', '53', 5895, 'Scala Coeli'),
(134, 'Ryan', 'Jared', '611-2391 Blandit Rd.', '83', 3407, 'Santa Coloma de Gramenet'),
(135, 'Crawford', 'Jennifer', 'P.O. Box 856, 4056 Hendrerit Avenue', '70', 9683, 'Deschambault'),
(136, 'Slater', 'Chester', '7533 Id, Rd.', '93', 8324, 'Edam'),
(137, 'Pugh', 'Iris', 'Ap #930-2699 Ut Rd.', '52', 5832, 'Perpignan'),
(138, 'Meyer', 'Chelsea', '113-770 Nisi Ave', '24', 8168, 'Oria'),
(139, 'Warren', 'Leandra', '568-1693 Velit Av.', '70', 3370, 'San Pedro'),
(140, 'Park', 'Elijah', 'Ap #260-8543 At Rd.', '43', 9722, 'Dorchester'),
(141, 'Roy', 'Kylynn', '210-8779 Non Rd.', '84', 3162, 'Cellara'),
(142, 'Gould', 'Cadman', 'Ap #609-7130 Placerat. Road', '64', 4153, 'Scandriglia'),
(143, 'Randall', 'Ross', '195-288 Amet, Av.', '70', 7343, 'Neder-Over-Heembeek'),
(144, 'Watkins', 'Elliott', '5892 Tellus Avenue', '94', 6314, 'Whithorn'),
(145, 'Fleming', 'Amity', '8299 Sit Rd.', '89', 785, 'Rachecourt'),
(146, 'Weaver', 'Griffith', 'Ap #397-8736 Turpis Ave', '75', 2204, 'Sint-Pieters-Leeuw'),
(147, 'Flowers', 'Claire', '9333 Cursus Av.', '47', 9412, 'Buren'),
(148, 'Leonard', 'Indira', '4532 Tempor Street', '18', 5853, 'Thiaumont'),
(149, 'Battle', 'Dale', 'P.O. Box 558, 8321 Erat Road', '34', 6242, 'Bo\'ness'),
(150, 'Webster', 'Tucker', 'Ap #353-7152 Ultricies Av.', '11', 7795, 'Tallahassee'),
(151, 'Wright', 'Serena', 'P.O. Box 175, 836 Cursus. Av.', '41', 819, 'Pelarco'),
(152, 'Norman', 'Rashad', 'Ap #578-560 A, Street', '77', 8045, 'Hines Creek'),
(153, 'Yates', 'Zane', 'P.O. Box 589, 5227 Massa. Street', '12', 5151, 'Lafayette'),
(154, 'Norton', 'Byron', '913 Fusce Road', '30', 5614, 'Outrijve'),
(155, 'Conway', 'Whoopi', '795-7965 Nibh Rd.', '32', 693, 'Gagliato'),
(156, 'Richardson', 'Lila', '1358 Tellus St.', '18', 9099, 'Tulsa'),
(157, 'Mejia', 'Zorita', 'Ap #347-2357 Neque Ave', '87', 6982, 'Chapecó'),
(158, 'Good', 'Keegan', '838-8177 Turpis Av.', '59', 152, 'Clare'),
(159, 'Delgado', 'Carlos', '163-6159 Lorem, Av.', '29', 2904, 'Port Coquitlam'),
(160, 'Pearson', 'Tarik', 'Ap #499-4871 Nisi St.', '12', 6433, 'Saint-Hilarion'),
(161, 'Lopez', 'Craig', '4635 Sed St.', '55', 3814, 'Mannheim'),
(162, 'Melton', 'Ashely', 'Ap #119-4674 Cursus St.', '65', 9507, 'GozŽe'),
(163, 'Jarvis', 'MacKenzie', '630-4557 Elit. St.', '70', 5333, 'Lo Barnechea'),
(164, 'Olson', 'Velma', '888-8887 Vel Ave', '04', 5565, 'Sylvan Lake'),
(165, 'Gallagher', 'Noelle', 'Ap #586-744 Ante. Road', '45', 4982, 'Tumba'),
(166, 'Spencer', 'Irene', '284-6968 Dolor. Ave', '42', 8299, 'Tamworth'),
(167, 'Chen', 'Nina', 'P.O. Box 946, 6766 Nec, St.', '50', 8485, 'Curon Venosta/Graun im Vinschgau'),
(168, 'Holland', 'Galena', 'Ap #183-9490 Donec Street', '97', 2535, 'Roux-Miroir'),
(169, 'Strong', 'Emerson', '7993 Dolor Avenue', '33', 3127, 'Hapur'),
(170, 'Wiley', 'Austin', 'P.O. Box 969, 1551 Quis Rd.', '59', 534, 'Tejar'),
(171, 'Hess', 'Eaton', 'P.O. Box 264, 4166 Ut, Ave', '53', 2858, 'Worms'),
(172, 'Orr', 'Caldwell', '475-5688 Justo. Avenue', '76', 5012, 'Tongerlo'),
(173, 'Rogers', 'Reece', '8435 Quam. Avenue', '29', 9402, 'Mobile'),
(174, 'Hawkins', 'Drake', '588-5533 Mauris Ave', '05', 2836, 'Picton'),
(175, 'Walter', 'Asher', '211-4332 Mauris St.', '47', 9638, 'Outremont'),
(176, 'Vargas', 'Kylee', 'P.O. Box 592, 1435 Sed Avenue', '58', 5838, 'Jalandhar (Jullundur)'),
(177, 'Sutton', 'Lucian', 'P.O. Box 898, 3366 Est Avenue', '76', 3024, 'Salt Lake City'),
(178, 'Gallagher', 'Gretchen', '460-6139 Nec Ave', '87', 2144, 'Pforzheim'),
(179, 'Kim', 'Armando', 'P.O. Box 821, 4713 Rhoncus. Av.', '84', 862, 'Villa Latina'),
(180, 'Fletcher', 'Stella', 'P.O. Box 458, 514 Eget, Avenue', '56', 651, 'Ostra Vetere'),
(181, 'Britt', 'Barrett', 'Ap #276-4669 Consectetuer, St.', '98', 6246, 'Hereford'),
(182, 'Caldwell', 'Riley', 'Ap #979-8483 Id, Rd.', '67', 7343, 'Saint-Eug�ne-de-Guigues'),
(183, 'Beard', 'Karleigh', 'Ap #260-7884 Donec Road', '46', 4366, 'Norfolk'),
(184, 'Montoya', 'Erasmus', 'Ap #916-5676 Arcu. St.', '15', 468, 'Imst'),
(185, 'Weiss', 'Abel', 'Ap #274-530 Amet St.', '32', 7108, 'Schagen'),
(186, 'Barker', 'Eve', '423-6011 Vitae Rd.', '56', 9988, 'Aurora'),
(187, 'Mcleod', 'Britanni', 'P.O. Box 901, 2015 Eu, Road', '92', 4591, 'Joinville'),
(188, 'Moss', 'Madeline', 'P.O. Box 895, 5052 Natoque St.', '41', 1321, 'Lower Hutt'),
(189, 'Valenzuela', 'Demetrius', 'Ap #733-4838 Aliquet Rd.', '82', 2511, 'Monstreux'),
(190, 'Freeman', 'Emmanuel', 'P.O. Box 131, 4500 Nulla Rd.', '83', 7599, 'Saint-Denis-Bovesse'),
(191, 'Raymond', 'Roary', '495-8827 Elit, Rd.', '37', 1604, 'Quillota'),
(192, 'Glover', 'Baker', 'P.O. Box 962, 1753 Sed St.', '88', 1936, 'Blankenfelde-Mahlow'),
(193, 'Doyle', 'Leslie', '167-1426 Diam. St.', '50', 1010, 'Midnapore'),
(194, 'Sheppard', 'Farrah', '605-1905 Auctor Street', '80', 670, 'Bacabal'),
(195, 'Nash', 'Rogan', '8800 Donec Rd.', '57', 9012, 'Fort Smith'),
(196, 'Daniel', 'Colt', 'Ap #203-6067 Dignissim Road', '11', 2318, 'Sint-Martens-Lennik'),
(197, 'Laprudence', 'Martijn', 'Graaf Karel De Goedelaan', ' 5', 8500, 'Kortrijk'),
(198, 'Galloway', 'Britanney', 'Ap #492-5197 Pede, Ave', '62', 2942, 'Freising'),
(199, 'Lee', 'Honorato', '2554 Aliquam Av.', '18', 1862, 'Aliano');

-- --------------------------------------------------------

--
-- Table structure for table `tbllogins`
--

DROP TABLE IF EXISTS `tbllogins`;
CREATE TABLE `tbllogins` (
  `loginID` int(11) NOT NULL,
  `voornaam` varchar(7) NOT NULL,
  `naam` varchar(8) NOT NULL,
  `paswoord` varchar(45) NOT NULL,
  `gebdatum` date NOT NULL,
  `login` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblvliegtuig`
--

DROP TABLE IF EXISTS `tblvliegtuig`;
CREATE TABLE `tblvliegtuig` (
  `VliegtuigID` int(11) NOT NULL,
  `Vliegtuigbouwer` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Type` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `MaxAantalZitplaatsenInDitToestel` int(11) DEFAULT NULL,
  `InterneCode` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvliegtuig`
--

INSERT INTO `tblvliegtuig` (`VliegtuigID`, `Vliegtuigbouwer`, `Type`, `MaxAantalZitplaatsenInDitToestel`, `InterneCode`) VALUES
(1, 'Airbus', 'A319-100', 20, 'OO-SSP'),
(2, 'Airbus', 'A330-300', 21, 'OO-SSG'),
(3, 'AVRO', 'RJ85', 12, 'OO-DWE '),
(4, 'AVRO', 'RJ85', 10, 'OO-DWF'),
(5, 'AVRO', 'RJ84', 12, 'OO-DWG'),
(6, 'Boeing', '737-300', 25, 'OO-VEK'),
(7, 'Boeing', '737-300', 25, 'OO-VEL'),
(8, 'Boeing', '737-400', 25, 'OO-VEM');

-- --------------------------------------------------------

--
-- Table structure for table `tblvlucht`
--

DROP TABLE IF EXISTS `tblvlucht`;
CREATE TABLE `tblvlucht` (
  `VluchtNr` int(11) NOT NULL,
  `Vluchtdatum` varchar(20) DEFAULT NULL,
  `BestemmingID` int(11) DEFAULT NULL,
  `VliegtuigID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvlucht`
--

INSERT INTO `tblvlucht` (`VluchtNr`, `Vluchtdatum`, `BestemmingID`, `VliegtuigID`) VALUES
(11001, '2019-02-12', 528, 3),
(11002, '2019-02-14', 537, 4),
(11004, '2019-04-12', 527, 1),
(11005, '2019-05-22', 533, 1),
(11006, '2019-06-25', 543, 4),
(11007, '2019-02-12', 542, 5),
(11008, '2019-05-31', 527, 1),
(11009, '2019-03-18', 541, 3),
(11010, '2019-05-12', 528, 6),
(11011, '2019-07-30', 544, 4),
(11013, '2019-05-19', 538, 8),
(11014, '2019-08-01', 536, 8),
(11015, '2019-10-05', 539, 5),
(11017, '2019-12-06', 543, 4),
(11018, '2019-12-01', 528, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblvluchtinformatie`
--

DROP TABLE IF EXISTS `tblvluchtinformatie`;
CREATE TABLE `tblvluchtinformatie` (
  `VluchtNr` int(11) NOT NULL,
  `StoelNr` int(11) NOT NULL,
  `KlantID` int(11) DEFAULT NULL,
  `PrijsBetaaldVoorStoel` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvluchtinformatie`
--

INSERT INTO `tblvluchtinformatie` (`VluchtNr`, `StoelNr`, `KlantID`, `PrijsBetaaldVoorStoel`) VALUES
(11001, 1, 101, '99.00'),
(11001, 2, 101, '99.00'),
(11001, 3, 102, '99.00'),
(11001, 4, 104, '99.00'),
(11001, 5, NULL, NULL),
(11001, 6, NULL, NULL),
(11001, 7, NULL, NULL),
(11001, 8, NULL, NULL),
(11001, 9, NULL, NULL),
(11001, 10, 103, '99.00'),
(11001, 11, 103, '99.00'),
(11001, 12, NULL, NULL),
(11002, 1, NULL, NULL),
(11002, 2, NULL, NULL),
(11002, 3, NULL, NULL),
(11002, 4, NULL, NULL),
(11002, 5, NULL, NULL),
(11002, 6, NULL, NULL),
(11002, 7, NULL, NULL),
(11002, 8, NULL, NULL),
(11002, 9, NULL, NULL),
(11002, 10, NULL, NULL),
(11004, 1, 102, '99.00'),
(11004, 2, NULL, NULL),
(11004, 3, NULL, NULL),
(11004, 4, NULL, NULL),
(11004, 5, NULL, NULL),
(11004, 6, NULL, NULL),
(11004, 7, 103, '99.00'),
(11004, 8, 104, '99.00'),
(11004, 9, 101, '99.00'),
(11004, 10, NULL, NULL),
(11004, 11, NULL, NULL),
(11004, 12, NULL, NULL),
(11004, 13, NULL, NULL),
(11004, 14, NULL, NULL),
(11004, 15, NULL, NULL),
(11004, 16, NULL, NULL),
(11004, 17, NULL, NULL),
(11004, 18, NULL, NULL),
(11004, 19, NULL, NULL),
(11004, 20, NULL, NULL),
(11005, 1, NULL, NULL),
(11005, 2, NULL, NULL),
(11005, 3, NULL, NULL),
(11005, 4, NULL, NULL),
(11005, 5, 101, '99.00'),
(11005, 6, NULL, NULL),
(11005, 7, NULL, NULL),
(11005, 8, NULL, NULL),
(11005, 9, NULL, NULL),
(11005, 10, NULL, NULL),
(11005, 11, 104, '99.00'),
(11005, 12, NULL, NULL),
(11005, 13, NULL, NULL),
(11005, 14, NULL, NULL),
(11005, 15, NULL, NULL),
(11005, 16, 103, '99.00'),
(11005, 17, NULL, NULL),
(11005, 18, NULL, NULL),
(11005, 19, NULL, NULL),
(11005, 20, NULL, NULL),
(11006, 1, 101, '400.00'),
(11006, 2, 103, '400.00'),
(11006, 3, NULL, NULL),
(11006, 4, NULL, NULL),
(11006, 5, 100, '400.00'),
(11006, 6, 101, '400.00'),
(11006, 7, 102, '400.00'),
(11006, 8, NULL, NULL),
(11006, 9, NULL, NULL),
(11006, 10, NULL, NULL),
(11007, 1, NULL, NULL),
(11007, 2, NULL, NULL),
(11007, 3, NULL, NULL),
(11007, 4, NULL, NULL),
(11007, 5, NULL, NULL),
(11007, 6, NULL, NULL),
(11007, 7, NULL, NULL),
(11007, 8, NULL, NULL),
(11007, 9, NULL, NULL),
(11007, 10, NULL, NULL),
(11007, 11, NULL, NULL),
(11007, 12, NULL, NULL),
(11009, 1, NULL, NULL),
(11009, 2, NULL, NULL),
(11009, 3, NULL, NULL),
(11009, 4, NULL, NULL),
(11009, 5, NULL, NULL),
(11009, 6, 103, '99.00'),
(11009, 7, NULL, NULL),
(11009, 8, NULL, NULL),
(11009, 9, NULL, NULL),
(11009, 10, NULL, NULL),
(11009, 11, NULL, NULL),
(11009, 12, NULL, NULL),
(11010, 1, NULL, NULL),
(11010, 2, NULL, NULL),
(11010, 3, NULL, NULL),
(11010, 4, NULL, NULL),
(11010, 5, NULL, NULL),
(11010, 6, NULL, NULL),
(11010, 7, NULL, NULL),
(11010, 8, NULL, NULL),
(11010, 9, NULL, NULL),
(11010, 10, NULL, NULL),
(11010, 11, NULL, NULL),
(11010, 12, NULL, NULL),
(11010, 13, NULL, NULL),
(11010, 14, NULL, NULL),
(11010, 15, NULL, NULL),
(11010, 16, NULL, NULL),
(11010, 17, NULL, NULL),
(11010, 18, NULL, NULL),
(11010, 19, NULL, NULL),
(11010, 20, NULL, NULL),
(11010, 21, NULL, NULL),
(11010, 22, NULL, NULL),
(11010, 23, NULL, NULL),
(11010, 24, NULL, NULL),
(11010, 25, NULL, NULL),
(11011, 1, NULL, NULL),
(11011, 2, 103, '400.00'),
(11011, 3, 101, '400.00'),
(11011, 4, NULL, NULL),
(11011, 5, NULL, NULL),
(11011, 6, NULL, NULL),
(11011, 7, NULL, NULL),
(11011, 8, NULL, NULL),
(11011, 9, NULL, NULL),
(11011, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblwerknemer`
--

DROP TABLE IF EXISTS `tblwerknemer`;
CREATE TABLE `tblwerknemer` (
  `WerknemerID` int(11) NOT NULL,
  `Naam` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `TypeID` int(11) DEFAULT NULL,
  `Foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblwerknemer`
--

INSERT INTO `tblwerknemer` (`WerknemerID`, `Naam`, `TypeID`, `Foto`) VALUES
(1, 'Els', 1, 'images/wnels.jpg'),
(2, 'An', 1, 'images/wnan.jpg'),
(3, 'Ivo', 2, 'images/wnivo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblwerknemertypes`
--

DROP TABLE IF EXISTS `tblwerknemertypes`;
CREATE TABLE `tblwerknemertypes` (
  `TypeID` int(11) NOT NULL,
  `Omschrijving` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblwerknemertypes`
--

INSERT INTO `tblwerknemertypes` (`TypeID`, `Omschrijving`) VALUES
(1, 'Check In'),
(2, 'Flight organiser');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblbestemming`
--
ALTER TABLE `tblbestemming`
  ADD PRIMARY KEY (`BestemmingID`);

--
-- Indexes for table `tblhuidigeprijssetting`
--
ALTER TABLE `tblhuidigeprijssetting`
  ADD PRIMARY KEY (`TypeVlucht`);

--
-- Indexes for table `tblklant`
--
ALTER TABLE `tblklant`
  ADD PRIMARY KEY (`KlantID`);

--
-- Indexes for table `tbllogins`
--
ALTER TABLE `tbllogins`
  ADD PRIMARY KEY (`loginID`);

--
-- Indexes for table `tblvliegtuig`
--
ALTER TABLE `tblvliegtuig`
  ADD PRIMARY KEY (`VliegtuigID`);

--
-- Indexes for table `tblvlucht`
--
ALTER TABLE `tblvlucht`
  ADD PRIMARY KEY (`VluchtNr`),
  ADD KEY `FK_tblVlucht_tblBestemming` (`BestemmingID`),
  ADD KEY `FK_tblVlucht_tblVliegtuig` (`VliegtuigID`);

--
-- Indexes for table `tblvluchtinformatie`
--
ALTER TABLE `tblvluchtinformatie`
  ADD PRIMARY KEY (`VluchtNr`,`StoelNr`),
  ADD KEY `FK_tblVluchtInformatie_tblKlant` (`KlantID`);

--
-- Indexes for table `tblwerknemer`
--
ALTER TABLE `tblwerknemer`
  ADD PRIMARY KEY (`WerknemerID`),
  ADD KEY `FK_tblWerknemer_tblWerknemerTypes` (`TypeID`);

--
-- Indexes for table `tblwerknemertypes`
--
ALTER TABLE `tblwerknemertypes`
  ADD PRIMARY KEY (`TypeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblbestemming`
--
ALTER TABLE `tblbestemming`
  MODIFY `BestemmingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=555;

--
-- AUTO_INCREMENT for table `tblhuidigeprijssetting`
--
ALTER TABLE `tblhuidigeprijssetting`
  MODIFY `TypeVlucht` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblklant`
--
ALTER TABLE `tblklant`
  MODIFY `KlantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1044;

--
-- AUTO_INCREMENT for table `tblvliegtuig`
--
ALTER TABLE `tblvliegtuig`
  MODIFY `VliegtuigID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblvlucht`
--
ALTER TABLE `tblvlucht`
  MODIFY `VluchtNr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11019;

--
-- AUTO_INCREMENT for table `tblwerknemer`
--
ALTER TABLE `tblwerknemer`
  MODIFY `WerknemerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblwerknemertypes`
--
ALTER TABLE `tblwerknemertypes`
  MODIFY `TypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblvlucht`
--
ALTER TABLE `tblvlucht`
  ADD CONSTRAINT `FK_tblVlucht_tblBestemming` FOREIGN KEY (`BestemmingID`) REFERENCES `tblbestemming` (`BestemmingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_tblVlucht_tblVliegtuig` FOREIGN KEY (`VliegtuigID`) REFERENCES `tblvliegtuig` (`VliegtuigID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblvluchtinformatie`
--
ALTER TABLE `tblvluchtinformatie`
  ADD CONSTRAINT `FK_tblVluchtInformatie_tblKlant` FOREIGN KEY (`KlantID`) REFERENCES `tblklant` (`KlantID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_tblVluchtInformatie_tblVlucht` FOREIGN KEY (`VluchtNr`) REFERENCES `tblvlucht` (`VluchtNr`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblwerknemer`
--
ALTER TABLE `tblwerknemer`
  ADD CONSTRAINT `FK_tblWerknemer_tblWerknemerTypes` FOREIGN KEY (`TypeID`) REFERENCES `tblwerknemertypes` (`TypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
