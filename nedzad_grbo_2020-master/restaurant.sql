-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 29, 2020 at 09:43 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `ID` int(100) NOT NULL AUTO_INCREMENT,
  `user` varchar(250) NOT NULL,
  `opinion` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`ID`, `user`, `opinion`) VALUES
(1, 'grbo_nedzad@hotmail.com', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `ID` int(100) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`ID`, `email`, `password`) VALUES
(1, 'grbo_nedzad@hotmail.com', 'grbo123');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `ID` int(100) NOT NULL AUTO_INCREMENT,
  `dateVisit` varchar(250) NOT NULL,
  `timeVisit` varchar(250) NOT NULL,
  `foodNum` int(100) NOT NULL,
  `foodQuantity` int(100) NOT NULL,
  `foodPrice` int(100) NOT NULL,
  `drinkNum` int(100) NOT NULL,
  `drinkQuantity` int(100) NOT NULL,
  `drinkPrice` int(100) NOT NULL,
  `fullName` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID`, `dateVisit`, `timeVisit`, `foodNum`, `foodQuantity`, `foodPrice`, `drinkNum`, `drinkQuantity`, `drinkPrice`, `fullName`) VALUES
(1, '12-02-2015', '12:00', 1, 1, 5, 1, 1, 3, 'abu');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE IF NOT EXISTS `register` (
  `ID` int(100) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(250) NOT NULL,
  `lastName` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `type` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`ID`, `firstName`, `lastName`, `email`, `password`, `type`) VALUES
(1, 'Nedzad', 'Grbo', 'grbo_nedzad@hotmail.com', 'grbo123', 1),
(2, 'test', 'user', 'test.user@gmail.com', 'test', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
