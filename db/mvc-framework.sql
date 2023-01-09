-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 09, 2023 at 12:09 PM
-- Server version: 5.7.31
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvc-framework`
--

-- --------------------------------------------------------

--
-- Table structure for table `auto`
--

DROP TABLE IF EXISTS `auto`;
CREATE TABLE IF NOT EXISTS `auto` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Kenteken` varchar(8) NOT NULL,
  `Type` varchar(40) NOT NULL,
  `InstructeurId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `InstructeurId` (`InstructeurId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auto`
--

INSERT INTO `auto` (`Id`, `Kenteken`, `Type`, `InstructeurId`) VALUES
(1, 'AU-67-IO', 'Golf', 3),
(2, 'TH-78-KL', 'Ferrari', 2),
(3, '90-KL-TR', 'Fiat 500', 4),
(4, 'YY-OP-78', 'Mercedes', 5);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `CapitalCity` varchar(100) NOT NULL,
  `Continent` enum('Europa','Azi&euml','Noord-Amerika','Zuid-Amerika','Oceani&euml','Antartica','Afrika') NOT NULL,
  `Population` int(10) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`Id`, `Name`, `CapitalCity`, `Continent`, `Population`) VALUES
(1, 'Nederlands', 'Amsterdams', 'Europa', 11500000),
(2, 'Nederland', 'Amsterdam', 'Europa', 17000000),
(4, 'Nederland', 'Rotterdam', 'Europa', 17000000);

-- --------------------------------------------------------

--
-- Table structure for table `instructeur`
--

DROP TABLE IF EXISTS `instructeur`;
CREATE TABLE IF NOT EXISTS `instructeur` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Naam` varchar(40) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructeur`
--

INSERT INTO `instructeur` (`Id`, `Naam`, `Email`) VALUES
(1, 'Groen', 'groen@gmail.com'),
(2, 'Manhoi', 'manhoi@gmail.com'),
(3, 'Zoyi', 'zoyi@gmail.com'),
(4, 'Berthold', 'berthold@gmail.com'),
(5, 'Denekam', 'denekamp@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `instructeur1`
--

DROP TABLE IF EXISTS `instructeur1`;
CREATE TABLE IF NOT EXISTS `instructeur1` (
  `Id` int(4) NOT NULL AUTO_INCREMENT,
  `Email` varchar(80) NOT NULL,
  `Naam` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructeur1`
--

INSERT INTO `instructeur1` (`Id`, `Email`, `Naam`) VALUES
(1, 'groen@mail.nl', 'Groen'),
(2, 'konijn@google.com', 'Konijn'),
(3, 'frasi@google.sp', 'Frasi');

-- --------------------------------------------------------

--
-- Table structure for table `leerling`
--

DROP TABLE IF EXISTS `leerling`;
CREATE TABLE IF NOT EXISTS `leerling` (
  `Id` int(4) NOT NULL AUTO_INCREMENT,
  `Naam` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leerling`
--

INSERT INTO `leerling` (`Id`, `Naam`) VALUES
(3, 'Konijn'),
(4, 'Slavink'),
(6, 'Otto');

-- --------------------------------------------------------

--
-- Table structure for table `les`
--

DROP TABLE IF EXISTS `les`;
CREATE TABLE IF NOT EXISTS `les` (
  `Id` int(4) NOT NULL AUTO_INCREMENT,
  `Datum` date NOT NULL,
  `LeerlingId` int(4) NOT NULL,
  `InstructeurId` int(4) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `LeerlingId` (`LeerlingId`),
  KEY `InstructeurId` (`InstructeurId`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `les`
--

INSERT INTO `les` (`Id`, `Datum`, `LeerlingId`, `InstructeurId`) VALUES
(45, '2022-05-20', 3, 1),
(46, '2022-05-20', 6, 3),
(47, '2022-05-21', 4, 2),
(48, '2022-05-21', 6, 3),
(49, '2022-05-22', 3, 1),
(50, '2022-05-28', 4, 2),
(51, '2022-06-01', 3, 2),
(52, '2022-06-12', 3, 1),
(53, '2022-06-22', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mankement`
--

DROP TABLE IF EXISTS `mankement`;
CREATE TABLE IF NOT EXISTS `mankement` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AutoId` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `Mankement` varchar(250) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `AutoId` (`AutoId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mankement`
--

INSERT INTO `mankement` (`Id`, `AutoId`, `Datum`, `Mankement`) VALUES
(1, 4, '2023-01-04', 'Profiel rechterbandminderdan 2 mm'),
(2, 2, '2023-01-02', 'Rechter achterlicht kapot'),
(3, 1, '2023-01-02', 'Spiegellinks afgebroken'),
(4, 2, '2023-01-06', 'Bumper rechtsachter ingedeukt'),
(5, 2, '2023-01-08', 'Radio kapot'),
(10, 2, '2023-01-09', 'Band Lek');

-- --------------------------------------------------------

--
-- Table structure for table `onderwerp`
--

DROP TABLE IF EXISTS `onderwerp`;
CREATE TABLE IF NOT EXISTS `onderwerp` (
  `Id` int(4) NOT NULL AUTO_INCREMENT,
  `LesId` int(4) NOT NULL,
  `Onderwerp` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `LesId` (`LesId`)
) ENGINE=InnoDB AUTO_INCREMENT=2354 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `onderwerp`
--

INSERT INTO `onderwerp` (`Id`, `LesId`, `Onderwerp`) VALUES
(2343, 45, 'File parkeren'),
(2344, 46, 'Achteruit rijden'),
(2345, 49, 'File parkeren'),
(2346, 49, 'Achteruit rijden'),
(2347, 50, 'File parkeren'),
(2348, 52, 'Achteruit rijden'),
(2349, 52, 'File parkeren'),
(2350, 52, 'Achteruit rijden'),
(2351, 50, 'Langs Maccie gaan'),
(2352, 51, 'Langs Maccie gaan'),
(2353, 51, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `opmerking`
--

DROP TABLE IF EXISTS `opmerking`;
CREATE TABLE IF NOT EXISTS `opmerking` (
  `Id` int(4) NOT NULL AUTO_INCREMENT,
  `LesId` int(4) NOT NULL,
  `Opmerking` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `LesId` (`LesId`)
) ENGINE=InnoDB AUTO_INCREMENT=1130 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `opmerking`
--

INSERT INTO `opmerking` (`Id`, `LesId`, `Opmerking`) VALUES
(1123, 45, 'File parkeren kan beter'),
(1124, 46, 'Beter in spiegel kijken'),
(1125, 49, 'Opletten op aankomend verkeer'),
(1126, 49, 'Langer doorrijdenbij invoegen'),
(1127, 50, 'Langzaam aan'),
(1128, 52, 'Beter in spiegels kijken'),
(1129, 52, 'richtingaanwijzer aan');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auto`
--
ALTER TABLE `auto`
  ADD CONSTRAINT `auto_ibfk_1` FOREIGN KEY (`InstructeurId`) REFERENCES `instructeur` (`Id`);

--
-- Constraints for table `les`
--
ALTER TABLE `les`
  ADD CONSTRAINT `les_ibfk_1` FOREIGN KEY (`LeerlingId`) REFERENCES `leerling` (`Id`),
  ADD CONSTRAINT `les_ibfk_2` FOREIGN KEY (`InstructeurId`) REFERENCES `instructeur1` (`Id`);

--
-- Constraints for table `mankement`
--
ALTER TABLE `mankement`
  ADD CONSTRAINT `mankement_ibfk_1` FOREIGN KEY (`AutoId`) REFERENCES `auto` (`Id`);

--
-- Constraints for table `onderwerp`
--
ALTER TABLE `onderwerp`
  ADD CONSTRAINT `onderwerp_ibfk_1` FOREIGN KEY (`LesId`) REFERENCES `les` (`Id`);

--
-- Constraints for table `opmerking`
--
ALTER TABLE `opmerking`
  ADD CONSTRAINT `opmerking_ibfk_1` FOREIGN KEY (`LesId`) REFERENCES `les` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
