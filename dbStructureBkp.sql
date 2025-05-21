-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2025 at 10:16 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `progettobosio`
--

-- --------------------------------------------------------

--
-- Table structure for table `allegato`
--

CREATE TABLE `allegato` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(64) NOT NULL,
  `Path` varchar(256) NOT NULL,
  `IdTipo` int(11) NOT NULL,
  `IdMissione` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `missione`
--

CREATE TABLE `missione` (
  `Numero` int(11) NOT NULL,
  `Nome` varchar(128) NOT NULL,
  `Descrizione` text NOT NULL,
  `Data` datetime NOT NULL,
  `PiattaformaId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `modellostadio`
--

CREATE TABLE `modellostadio` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(64) NOT NULL,
  `Descrizione` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `piattaforma`
--

CREATE TABLE `piattaforma` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(64) NOT NULL,
  `Longitudine` float NOT NULL,
  `Latitudine` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stadio`
--

CREATE TABLE `stadio` (
  `Id` int(11) NOT NULL,
  `CodiceVersione` int(11) NOT NULL,
  `Posizione` int(11) NOT NULL,
  `Note` text DEFAULT NULL,
  `IdAttaccoStadioPrecedente` varchar(32) DEFAULT NULL,
  `IdAttaccoStadioSuccessivo` varchar(32) DEFAULT NULL,
  `IdMissione` int(11) NOT NULL,
  `IdModello` int(11) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `stadio_strumento`
--

CREATE TABLE `stadio_strumento` (
  `IdStadio` int(11) NOT NULL,
  `IdStrumento` varchar(32) NOT NULL,
  `Numero` int(11) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `strumento`
--

CREATE TABLE `strumento` (
  `CodiceComponente` varchar(32) NOT NULL,
  `Nome` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tipoallegato`
--

CREATE TABLE `tipoallegato` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(64) NOT NULL,
  `VisibileAlPubblico` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allegato`
--
ALTER TABLE `allegato`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Nome` (`Nome`,`Path`),
  ADD KEY `fk_tipologia` (`IdTipo`),
  ADD KEY `fk_corredazione` (`IdMissione`);

--
-- Indexes for table `missione`
--
ALTER TABLE `missione`
  ADD PRIMARY KEY (`Numero`),
  ADD KEY `fk_origine` (`PiattaformaId`),
  ADD KEY `idx_data` (`Data`) USING BTREE;

--
-- Indexes for table `modellostadio`
--
ALTER TABLE `modellostadio`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `piattaforma`
--
ALTER TABLE `piattaforma`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `stadio`
--
ALTER TABLE `stadio`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_composizione` (`IdMissione`),
  ADD KEY `fk_iterazione` (`IdModello`),
  ADD KEY `fk_precedente` (`IdAttaccoStadioPrecedente`),
  ADD KEY `fk_successivo` (`IdAttaccoStadioSuccessivo`);

--
-- Indexes for table `stadio_strumento`
--
ALTER TABLE `stadio_strumento`
  ADD PRIMARY KEY (`IdStadio`,`IdStrumento`),
  ADD KEY `fk_strumento` (`IdStrumento`);

--
-- Indexes for table `strumento`
--
ALTER TABLE `strumento`
  ADD PRIMARY KEY (`CodiceComponente`);

--
-- Indexes for table `tipoallegato`
--
ALTER TABLE `tipoallegato`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allegato`
--
ALTER TABLE `allegato`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modellostadio`
--
ALTER TABLE `modellostadio`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `piattaforma`
--
ALTER TABLE `piattaforma`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stadio`
--
ALTER TABLE `stadio`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipoallegato`
--
ALTER TABLE `tipoallegato`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allegato`
--
ALTER TABLE `allegato`
  ADD CONSTRAINT `fk_corredazione` FOREIGN KEY (`IdMissione`) REFERENCES `missione` (`Numero`),
  ADD CONSTRAINT `fk_tipologia` FOREIGN KEY (`IdTipo`) REFERENCES `tipoallegato` (`Id`);

--
-- Constraints for table `missione`
--
ALTER TABLE `missione`
  ADD CONSTRAINT `fk_origine` FOREIGN KEY (`PiattaformaId`) REFERENCES `piattaforma` (`Id`);

--
-- Constraints for table `stadio`
--
ALTER TABLE `stadio`
  ADD CONSTRAINT `fk_composizione` FOREIGN KEY (`IdMissione`) REFERENCES `missione` (`Numero`),
  ADD CONSTRAINT `fk_iterazione` FOREIGN KEY (`IdModello`) REFERENCES `modellostadio` (`Id`),
  ADD CONSTRAINT `fk_precedente` FOREIGN KEY (`IdAttaccoStadioPrecedente`) REFERENCES `strumento` (`CodiceComponente`),
  ADD CONSTRAINT `fk_successivo` FOREIGN KEY (`IdAttaccoStadioSuccessivo`) REFERENCES `strumento` (`CodiceComponente`);

--
-- Constraints for table `stadio_strumento`
--
ALTER TABLE `stadio_strumento`
  ADD CONSTRAINT `fk_stadio` FOREIGN KEY (`IdStadio`) REFERENCES `stadio` (`Id`),
  ADD CONSTRAINT `fk_strumento` FOREIGN KEY (`IdStrumento`) REFERENCES `strumento` (`CodiceComponente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
