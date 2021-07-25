-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 25, 2020 at 11:12 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lpg_gas`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `gastype` varchar(50) NOT NULL,
  `bookingdate` varchar(200) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'not delivered',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `regid`, `name`, `email`, `mobile`, `address`, `gastype`, `bookingdate`, `status`) VALUES
(4, 7, 'mohan das', 'mohan@gmail.com', '2434353', 'tedi pulia', 'household', '20-Aug-2020', 'not delivered'),
(10, 11, 'ARVIND GUPTA', 'ag126667@gmail.com', '8956325636', 'BIET', 'commercial', '25-Dec-2020', 'delivered'),
(9, 11, 'ARVIND GUPTA', 'ag126667@gmail.com', '', 'BIET', 'commercial', '25-Dec-2020', 'delivered');

-- --------------------------------------------------------

--
-- Table structure for table `connection`
--

DROP TABLE IF EXISTS `connection`;
CREATE TABLE IF NOT EXISTS `connection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `gastype` varchar(50) NOT NULL,
  `proof` varchar(200) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'not approved',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12345005 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `connection`
--

INSERT INTO `connection` (`id`, `regid`, `name`, `email`, `mobile`, `gastype`, `proof`, `status`) VALUES
(12345001, 1, 'abc', 'abc@gmail.com', '12234', 'household', 'dettj.jpg', 'approved'),
(12345004, 11, 'ARVIND GUPTA', 'ag126667@gmail.com', '9010210011', 'commercial', '20170922_173135.jpg', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `mob` varchar(10) NOT NULL,
  `sub` varchar(200) NOT NULL,
  `msg` varchar(250) NOT NULL,
  `reply` varchar(250) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `mob`, `sub`, `msg`, `reply`, `status`) VALUES
(1, 'mohan', '22457', 'dggn', 'fgfgh,.', 'cdgfhgh', '1'),
(2, 'ram', '223357', 'dfggh', 'dfhjj,k', 'Your aadhar no. is wrong', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lpg`
--

DROP TABLE IF EXISTS `lpg`;
CREATE TABLE IF NOT EXISTS `lpg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(50) DEFAULT NULL,
  `stock` varchar(10) DEFAULT NULL,
  `vehiclename` varchar(50) DEFAULT NULL,
  `vehicleno` varchar(50) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `subsidy` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lpg`
--

INSERT INTO `lpg` (`id`, `date`, `stock`, `vehiclename`, `vehicleno`, `price`, `subsidy`) VALUES
(5, '20-Aug-2020', '50', 'truck', 'up 32 233kh', '750', '150'),
(8, '25-Dec-2020', '30', 'tampo', 'up32 AM 4323', '200', '50');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookingid` int(11) NOT NULL,
  `cardtype` varchar(50) NOT NULL,
  `cardno` varchar(16) NOT NULL,
  `nameoncard` varchar(100) NOT NULL,
  `expiry` varchar(100) NOT NULL,
  `cvv` varchar(200) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'unpaid',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `bookingid`, `cardtype`, `cardno`, `nameoncard`, `expiry`, `cvv`, `amount`, `status`) VALUES
(2, 6, 'credit', '13344556', 'ram', '2020-11', '$2y$10$5MVUkYACUlZZgnG74kMA9u4cybEDrgtCRyhvylz6tdiIlh3lcu4zq', '930', 'paid'),
(7, 10, 'debit', '765443434', 'Arvind', '2020-11', '$2y$10$Ooktess.OPD9fminxRsV9.0gy9nMUE8pGVkg2VLJjt4MWEJjweCP.', '250', 'paid'),
(6, 9, 'debit', '963566666865', '', '2020-07', '$2y$10$sQ8TQApxRL0pDjS9I76qu.CUy8NXk3jCE0RcjCGkvtly7aFtYQTq2', '250', 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `aadhar` varchar(12) NOT NULL,
  `address` varchar(200) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `name`, `email`, `mobile`, `aadhar`, `address`, `photo`, `password`) VALUES
(13, 'Vinay', 'vinay@gmail.com', '8765445645', '234567765435', 'BNSL', 'rps20200324_095856.jpg', '$2y$10$TwHf.zh5Amjj8pgVUgYMOOE8KMrp2JYpDItS689ocLAa1VpLaCGxa'),
(11, 'ARVIND GUPTA', 'ag126667@gmail.com', '7847823222', '234567765435', 'BIET', 'h (2).jpg', '$2y$10$Re2/V6lZcqfN9a954dTXA.gGjoZANZ5Aqdg4Q.1TwryRpzX.b/NeK');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
