-- phpMyAdmin SQL Dump
-- version 4.2.13.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 21, 2016 at 01:39 AM
-- Server version: 5.6.23
-- PHP Version: 5.5.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `skybook`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE IF NOT EXISTS `cars` (
`car_id` int(4) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
`city_id` int(4) NOT NULL,
  `name` varchar(40) NOT NULL,
  `country_id` int(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_id`, `name`, `country_id`) VALUES
(1, 'Aberdeen', 71),
(3, 'Alderney', 71),
(4, 'Belfast', 71),
(6, 'Birmingham', 71),
(7, 'Bournemouth', 71),
(8, 'Bristol', 71),
(9, 'Cardiff', 71),
(10, 'Doncaster', 71),
(11, 'Edinburgh', 71),
(12, 'Nottingham', 71),
(13, 'Exeter', 71),
(14, 'Glasgow', 71),
(15, 'Humberside', 71),
(16, 'Inverness', 71),
(17, 'Castletown', 71),
(18, 'Jersey', 71),
(19, 'Orkney', 71),
(20, 'Leeds', 71),
(21, 'London', 71),
(22, 'Derry', 71),
(25, 'Liverpool', 71),
(27, 'Manchester', 71),
(28, 'Durham', 71),
(29, 'Newcastle', 71),
(30, 'Newquay', 71),
(31, 'Norwich', 71),
(32, 'Bucharest', 101),
(35, 'Southampton', 71);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
`company_id` int(4) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `name`) VALUES
(1, 'Aegean Airlines'),
(2, 'Alitalia'),
(3, 'British Airways'),
(4, 'Ryanair'),
(5, 'Pegasus Airlines'),
(6, 'KLM'),
(7, 'Lufthansa'),
(8, 'Austrian Airlines'),
(9, 'TAROM'),
(10, 'Wizz Air'),
(11, 'Blue Air'),
(12, 'Aegean Airlines'),
(13, 'Alitalia'),
(14, 'British Airways'),
(15, 'Ryanair'),
(16, 'Pegasus Airlines'),
(17, 'KLM'),
(18, 'Lufthansa'),
(19, 'Austrian Airlines'),
(20, 'TAROM'),
(21, 'Wizz Air'),
(22, 'Blue Air');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
`country_id` int(4) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `name`) VALUES
(101, 'Romania'),
(71, 'United Kingdom');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE IF NOT EXISTS `flights` (
`flight_id` int(4) NOT NULL,
  `source` varchar(100) NOT NULL,
  `dest` varchar(100) NOT NULL,
  `price` int(4) NOT NULL,
  `company_id` int(4) NOT NULL,
  `from_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `to_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`flight_id`, `source`, `dest`, `price`, `company_id`, `from_date`, `to_date`) VALUES
(184, 'Bucharest', 'Aberdeen', 153, 7, '2016-03-09 23:00:00', '2016-03-09 23:00:00'),
(185, 'Aberdeen', 'Bucharest', 153, 7, '2016-03-21 23:00:00', '2016-03-21 23:00:00'),
(186, 'Bucharest', 'Belfast', 5108, 7, '2016-03-10 23:00:00', '2016-03-10 23:00:00'),
(187, 'Bucharest', 'Belfast', 146, 6, '2016-03-10 23:00:00', '2016-03-10 23:00:00'),
(188, 'Belfast', 'Bucharest', 146, 6, '2016-03-17 23:00:00', '2016-03-17 23:00:00'),
(189, 'Bucharest', 'Birmingham', 133, 6, '2016-03-31 22:00:00', '2016-03-31 22:00:00'),
(190, 'Birmingham', 'Bucharest', 133, 6, '2016-04-30 22:00:00', '2016-04-30 22:00:00'),
(191, 'Bucharest', 'Birmingham', 46, 11, '2016-10-17 22:00:00', '2016-10-17 22:00:00'),
(192, 'Birmingham', 'Bucharest', 46, 11, '2016-10-24 22:00:00', '2016-10-24 22:00:00'),
(193, 'Bucharest', 'Bristol', 172, 6, '2016-04-27 22:00:00', '2016-04-27 22:00:00'),
(194, 'Bristol', 'Bucharest', 172, 6, '2016-05-01 22:00:00', '2016-05-01 22:00:00'),
(195, 'Bucharest', 'Cardiff', 222, 6, '2016-07-21 22:00:00', '2016-07-21 22:00:00'),
(196, 'Cardiff', 'Bucharest', 222, 6, '2016-07-31 22:00:00', '2016-07-31 22:00:00'),
(197, 'Bucharest', 'Doncaster', 66, 10, '2016-04-06 22:00:00', '2016-04-06 22:00:00'),
(198, 'Doncaster', 'Bucharest', 66, 10, '2016-04-08 22:00:00', '2016-04-08 22:00:00'),
(199, 'Bucharest', 'Edinburgh', 155, 7, '2016-03-07 23:00:00', '2016-03-07 23:00:00'),
(200, 'Edinburgh', 'Bucharest', 155, 7, '2016-03-14 23:00:00', '2016-03-14 23:00:00'),
(201, 'Bucharest', 'Glasgow', 187, 6, '2016-04-12 22:00:00', '2016-04-12 22:00:00'),
(202, 'Glasgow', 'Bucharest', 187, 6, '2016-04-19 22:00:00', '2016-04-19 22:00:00'),
(203, 'Bucharest', 'Glasgow', 32, 10, '2016-03-30 22:00:00', '2016-03-30 22:00:00'),
(204, 'Glasgow', 'Bucharest', 32, 10, '2016-04-09 22:00:00', '2016-04-09 22:00:00'),
(205, 'Bucharest', 'Humberside', 254, 6, '2016-04-22 22:00:00', '2016-04-22 22:00:00'),
(206, 'Humberside', 'Bucharest', 254, 6, '2016-05-06 22:00:00', '2016-05-06 22:00:00'),
(207, 'Bucharest', 'Castletown', 283, 3, '2016-11-23 23:00:00', '2016-11-23 23:00:00'),
(208, 'Castletown', 'Bucharest', 283, 3, '2016-11-27 23:00:00', '2016-11-27 23:00:00'),
(209, 'Bucharest', 'Jersey', 259, 3, '2016-06-24 22:00:00', '2016-06-24 22:00:00'),
(210, 'Jersey', 'Bucharest', 259, 3, '2016-07-02 22:00:00', '2016-07-02 22:00:00'),
(211, 'Bucharest', 'Leeds', 184, 6, '2016-04-22 22:00:00', '2016-04-22 22:00:00'),
(212, 'Leeds', 'Bucharest', 184, 6, '2016-05-06 22:00:00', '2016-05-06 22:00:00'),
(213, 'Bucharest', 'London', 157, 2, '2016-05-02 22:00:00', '2016-05-02 22:00:00'),
(214, 'London', 'Bucharest', 157, 2, '2016-05-10 22:00:00', '2016-05-10 22:00:00'),
(215, 'Bucharest', 'London', 133, 1, '2016-03-01 23:00:00', '2016-03-01 23:00:00'),
(216, 'London', 'Bucharest', 133, 1, '2016-03-03 23:00:00', '2016-03-03 23:00:00'),
(217, 'Bucharest', 'London', 89, 9, '2016-12-16 23:00:00', '2016-12-16 23:00:00'),
(218, 'London', 'Bucharest', 89, 9, '2017-01-02 23:00:00', '2017-01-02 23:00:00'),
(219, 'Bucharest', 'London', 136, 1, '2016-10-09 22:00:00', '2016-10-09 22:00:00'),
(220, 'London', 'Bucharest', 136, 1, '2016-10-17 22:00:00', '2016-10-17 22:00:00'),
(221, 'Bucharest', 'Liverpool', 54, 11, '2016-06-07 22:00:00', '2016-06-07 22:00:00'),
(222, 'Liverpool', 'Bucharest', 54, 11, '2016-06-14 22:00:00', '2016-06-14 22:00:00'),
(223, 'Bucharest', 'Liverpool', 40, 11, '2016-06-02 22:00:00', '2016-06-02 22:00:00'),
(224, 'Liverpool', 'Bucharest', 40, 11, '2016-06-09 22:00:00', '2016-06-09 22:00:00'),
(225, 'Bucharest', 'London', 53, 10, '2016-03-21 23:00:00', '2016-03-21 23:00:00'),
(226, 'London', 'Bucharest', 53, 11, '2016-04-04 22:00:00', '2016-04-04 22:00:00'),
(227, 'Bucharest', 'London', 46, 11, '2016-04-30 22:00:00', '2016-04-30 22:00:00'),
(228, 'London', 'Bucharest', 46, 11, '2016-05-15 22:00:00', '2016-05-15 22:00:00'),
(229, 'Bucharest', 'Manchester', 150, 8, '2016-04-18 22:00:00', '2016-04-18 22:00:00'),
(230, 'Manchester', 'Bucharest', 150, 8, '2016-04-25 22:00:00', '2016-04-25 22:00:00'),
(231, 'Bucharest', 'Durham', 256, 6, '2016-04-26 22:00:00', '2016-04-26 22:00:00'),
(232, 'Durham', 'Bucharest', 256, 6, '2016-05-02 22:00:00', '2016-05-02 22:00:00'),
(233, 'Bucharest', 'Norwich', 286, 6, '2016-03-28 22:00:00', '2016-03-28 22:00:00'),
(234, 'Norwich', 'Bucharest', 286, 6, '2016-04-04 22:00:00', '2016-04-04 22:00:00'),
(235, 'Bucharest', 'Southampton', 202, 6, '2016-06-24 22:00:00', '2016-06-24 22:00:00'),
(236, 'Southampton', 'Bucharest', 202, 6, '2016-07-09 22:00:00', '2016-07-09 22:00:00'),
(237, 'Bucharest', 'London', 53, 4, '2016-03-31 22:00:00', '2016-03-31 22:00:00'),
(238, 'London', 'Bucharest', 53, 11, '2016-04-11 22:00:00', '2016-04-11 22:00:00'),
(239, 'Bucharest', 'London', 39, 4, '2016-05-27 22:00:00', '2016-05-27 22:00:00'),
(240, 'London', 'Bucharest', 39, 11, '2016-06-11 22:00:00', '2016-06-11 22:00:00'),
(241, 'Bucharest', 'London', 39, 4, '2016-04-24 22:00:00', '2016-04-24 22:00:00'),
(242, 'London', 'Bucharest', 39, 4, '2016-05-09 22:00:00', '2016-05-09 22:00:00'),
(243, 'Bucharest', 'London', 157, 5, '2016-03-23 23:00:00', '2016-03-23 23:00:00'),
(244, 'London', 'Bucharest', 157, 5, '2016-08-29 22:00:00', '2016-08-29 22:00:00'),
(245, 'Bucharest', 'Aberdeen', 151, 7, '2016-03-09 23:00:00', '2016-03-09 23:00:00'),
(246, 'Aberdeen', 'Bucharest', 151, 7, '2016-03-21 23:00:00', '2016-03-21 23:00:00'),
(247, 'Bucharest', 'Belfast', 5071, 7, '2016-03-10 23:00:00', '2016-03-10 23:00:00'),
(248, 'Bucharest', 'Belfast', 145, 6, '2016-03-10 23:00:00', '2016-03-10 23:00:00'),
(249, 'Belfast', 'Bucharest', 145, 6, '2016-03-17 23:00:00', '2016-03-17 23:00:00'),
(250, 'Bucharest', 'Birmingham', 132, 6, '2016-03-31 22:00:00', '2016-03-31 22:00:00'),
(251, 'Birmingham', 'Bucharest', 132, 6, '2016-04-30 22:00:00', '2016-04-30 22:00:00'),
(252, 'Bucharest', 'Birmingham', 45, 11, '2016-10-17 22:00:00', '2016-10-17 22:00:00'),
(253, 'Birmingham', 'Bucharest', 45, 11, '2016-10-24 22:00:00', '2016-10-24 22:00:00'),
(254, 'Bucharest', 'Bristol', 171, 6, '2016-04-27 22:00:00', '2016-04-27 22:00:00'),
(255, 'Bristol', 'Bucharest', 171, 6, '2016-05-01 22:00:00', '2016-05-01 22:00:00'),
(256, 'Bucharest', 'Cardiff', 211, 6, '2016-03-30 22:00:00', '2016-03-30 22:00:00'),
(257, 'Cardiff', 'Bucharest', 211, 6, '2016-04-06 22:00:00', '2016-04-06 22:00:00'),
(258, 'Bucharest', 'Doncaster', 65, 10, '2016-04-06 22:00:00', '2016-04-06 22:00:00'),
(259, 'Doncaster', 'Bucharest', 65, 10, '2016-04-08 22:00:00', '2016-04-08 22:00:00'),
(260, 'Bucharest', 'Edinburgh', 154, 7, '2016-03-07 23:00:00', '2016-03-07 23:00:00'),
(261, 'Edinburgh', 'Bucharest', 154, 7, '2016-03-14 23:00:00', '2016-03-14 23:00:00'),
(262, 'Bucharest', 'Glasgow', 186, 6, '2016-04-12 22:00:00', '2016-04-12 22:00:00'),
(263, 'Glasgow', 'Bucharest', 186, 6, '2016-04-19 22:00:00', '2016-04-19 22:00:00'),
(264, 'Bucharest', 'Glasgow', 31, 10, '2016-03-30 22:00:00', '2016-03-30 22:00:00'),
(265, 'Glasgow', 'Bucharest', 31, 10, '2016-04-09 22:00:00', '2016-04-09 22:00:00'),
(266, 'Bucharest', 'Humberside', 252, 6, '2016-04-22 22:00:00', '2016-04-22 22:00:00'),
(267, 'Humberside', 'Bucharest', 252, 6, '2016-05-06 22:00:00', '2016-05-06 22:00:00'),
(268, 'Bucharest', 'Castletown', 281, 3, '2016-11-23 23:00:00', '2016-11-23 23:00:00'),
(269, 'Castletown', 'Bucharest', 281, 3, '2016-11-27 23:00:00', '2016-11-27 23:00:00'),
(270, 'Bucharest', 'Jersey', 257, 3, '2016-06-24 22:00:00', '2016-06-24 22:00:00'),
(271, 'Jersey', 'Bucharest', 257, 3, '2016-07-02 22:00:00', '2016-07-02 22:00:00'),
(272, 'Bucharest', 'Leeds', 182, 6, '2016-04-22 22:00:00', '2016-04-22 22:00:00'),
(273, 'Leeds', 'Bucharest', 182, 6, '2016-05-06 22:00:00', '2016-05-06 22:00:00'),
(274, 'Bucharest', 'London', 156, 2, '2016-05-02 22:00:00', '2016-05-02 22:00:00'),
(275, 'London', 'Bucharest', 156, 2, '2016-05-10 22:00:00', '2016-05-10 22:00:00'),
(276, 'Bucharest', 'London', 132, 1, '2016-03-01 23:00:00', '2016-03-01 23:00:00'),
(277, 'London', 'Bucharest', 132, 1, '2016-03-03 23:00:00', '2016-03-03 23:00:00'),
(278, 'Bucharest', 'London', 89, 9, '2016-12-16 23:00:00', '2016-12-16 23:00:00'),
(279, 'London', 'Bucharest', 89, 9, '2017-01-02 23:00:00', '2017-01-02 23:00:00'),
(280, 'Bucharest', 'London', 135, 1, '2016-10-09 22:00:00', '2016-10-09 22:00:00'),
(281, 'London', 'Bucharest', 135, 1, '2016-10-17 22:00:00', '2016-10-17 22:00:00'),
(282, 'Bucharest', 'Liverpool', 52, 11, '2016-06-07 22:00:00', '2016-06-07 22:00:00'),
(283, 'Liverpool', 'Bucharest', 52, 11, '2016-06-14 22:00:00', '2016-06-14 22:00:00'),
(284, 'Bucharest', 'Liverpool', 40, 11, '2016-06-02 22:00:00', '2016-06-02 22:00:00'),
(285, 'Liverpool', 'Bucharest', 40, 11, '2016-06-09 22:00:00', '2016-06-09 22:00:00'),
(286, 'Bucharest', 'London', 52, 10, '2016-03-21 23:00:00', '2016-03-21 23:00:00'),
(287, 'London', 'Bucharest', 52, 11, '2016-04-04 22:00:00', '2016-04-04 22:00:00'),
(288, 'Bucharest', 'London', 46, 11, '2016-04-30 22:00:00', '2016-04-30 22:00:00'),
(289, 'London', 'Bucharest', 46, 11, '2016-05-15 22:00:00', '2016-05-15 22:00:00'),
(290, 'Bucharest', 'Manchester', 148, 8, '2016-04-18 22:00:00', '2016-04-18 22:00:00'),
(291, 'Manchester', 'Bucharest', 148, 8, '2016-04-25 22:00:00', '2016-04-25 22:00:00'),
(292, 'Bucharest', 'Durham', 254, 6, '2016-04-26 22:00:00', '2016-04-26 22:00:00'),
(293, 'Durham', 'Bucharest', 254, 6, '2016-05-02 22:00:00', '2016-05-02 22:00:00'),
(294, 'Bucharest', 'Norwich', 284, 6, '2016-03-28 22:00:00', '2016-03-28 22:00:00'),
(295, 'Norwich', 'Bucharest', 284, 6, '2016-04-04 22:00:00', '2016-04-04 22:00:00'),
(296, 'Bucharest', 'Southampton', 201, 6, '2016-06-24 22:00:00', '2016-06-24 22:00:00'),
(297, 'Southampton', 'Bucharest', 201, 6, '2016-07-09 22:00:00', '2016-07-09 22:00:00'),
(298, 'Bucharest', 'London', 52, 4, '2016-03-31 22:00:00', '2016-03-31 22:00:00'),
(299, 'London', 'Bucharest', 52, 11, '2016-04-11 22:00:00', '2016-04-11 22:00:00'),
(300, 'Bucharest', 'London', 38, 4, '2016-05-27 22:00:00', '2016-05-27 22:00:00'),
(301, 'London', 'Bucharest', 38, 11, '2016-06-11 22:00:00', '2016-06-11 22:00:00'),
(302, 'Bucharest', 'London', 38, 4, '2016-04-24 22:00:00', '2016-04-24 22:00:00'),
(303, 'London', 'Bucharest', 38, 4, '2016-05-09 22:00:00', '2016-05-09 22:00:00'),
(304, 'Bucharest', 'London', 156, 5, '2016-03-23 23:00:00', '2016-03-23 23:00:00'),
(305, 'London', 'Bucharest', 156, 5, '2016-08-29 22:00:00', '2016-08-29 22:00:00'),
(306, 'Bucharest', 'Aberdeen', 151, 7, '2016-03-09 23:00:00', '2016-03-09 23:00:00'),
(307, 'Aberdeen', 'Bucharest', 151, 7, '2016-03-21 23:00:00', '2016-03-21 23:00:00'),
(308, 'Bucharest', 'Belfast', 5071, 7, '2016-03-10 23:00:00', '2016-03-10 23:00:00'),
(309, 'Bucharest', 'Belfast', 145, 6, '2016-03-10 23:00:00', '2016-03-10 23:00:00'),
(310, 'Belfast', 'Bucharest', 145, 6, '2016-03-17 23:00:00', '2016-03-17 23:00:00'),
(311, 'Bucharest', 'Birmingham', 132, 6, '2016-03-31 22:00:00', '2016-03-31 22:00:00'),
(312, 'Birmingham', 'Bucharest', 132, 6, '2016-04-30 22:00:00', '2016-04-30 22:00:00'),
(313, 'Bucharest', 'Birmingham', 45, 11, '2016-10-17 22:00:00', '2016-10-17 22:00:00'),
(314, 'Birmingham', 'Bucharest', 45, 11, '2016-10-24 22:00:00', '2016-10-24 22:00:00'),
(315, 'Bucharest', 'Bristol', 171, 6, '2016-04-27 22:00:00', '2016-04-27 22:00:00'),
(316, 'Bristol', 'Bucharest', 171, 6, '2016-05-01 22:00:00', '2016-05-01 22:00:00'),
(317, 'Bucharest', 'Cardiff', 220, 6, '2016-07-21 22:00:00', '2016-07-21 22:00:00'),
(318, 'Cardiff', 'Bucharest', 220, 6, '2016-07-31 22:00:00', '2016-07-31 22:00:00'),
(319, 'Bucharest', 'Doncaster', 65, 10, '2016-04-06 22:00:00', '2016-04-06 22:00:00'),
(320, 'Doncaster', 'Bucharest', 65, 10, '2016-04-08 22:00:00', '2016-04-08 22:00:00'),
(321, 'Bucharest', 'Edinburgh', 154, 7, '2016-03-07 23:00:00', '2016-03-07 23:00:00'),
(322, 'Edinburgh', 'Bucharest', 154, 7, '2016-03-14 23:00:00', '2016-03-14 23:00:00'),
(323, 'Bucharest', 'Glasgow', 186, 6, '2016-04-12 22:00:00', '2016-04-12 22:00:00'),
(324, 'Glasgow', 'Bucharest', 186, 6, '2016-04-19 22:00:00', '2016-04-19 22:00:00'),
(325, 'Bucharest', 'Glasgow', 31, 10, '2016-03-30 22:00:00', '2016-03-30 22:00:00'),
(326, 'Glasgow', 'Bucharest', 31, 10, '2016-04-09 22:00:00', '2016-04-09 22:00:00'),
(327, 'Bucharest', 'Humberside', 252, 6, '2016-04-22 22:00:00', '2016-04-22 22:00:00'),
(328, 'Humberside', 'Bucharest', 252, 6, '2016-05-06 22:00:00', '2016-05-06 22:00:00'),
(329, 'Bucharest', 'Castletown', 281, 3, '2016-11-23 23:00:00', '2016-11-23 23:00:00'),
(330, 'Castletown', 'Bucharest', 281, 3, '2016-11-27 23:00:00', '2016-11-27 23:00:00'),
(331, 'Bucharest', 'Jersey', 257, 3, '2016-06-24 22:00:00', '2016-06-24 22:00:00'),
(332, 'Jersey', 'Bucharest', 257, 3, '2016-07-02 22:00:00', '2016-07-02 22:00:00'),
(333, 'Bucharest', 'Leeds', 182, 6, '2016-04-22 22:00:00', '2016-04-22 22:00:00'),
(334, 'Leeds', 'Bucharest', 182, 6, '2016-05-06 22:00:00', '2016-05-06 22:00:00'),
(335, 'Bucharest', 'London', 156, 2, '2016-05-02 22:00:00', '2016-05-02 22:00:00'),
(336, 'London', 'Bucharest', 156, 2, '2016-05-10 22:00:00', '2016-05-10 22:00:00'),
(337, 'Bucharest', 'London', 132, 1, '2016-03-01 23:00:00', '2016-03-01 23:00:00'),
(338, 'London', 'Bucharest', 132, 1, '2016-03-03 23:00:00', '2016-03-03 23:00:00'),
(339, 'Bucharest', 'London', 89, 9, '2016-12-16 23:00:00', '2016-12-16 23:00:00'),
(340, 'London', 'Bucharest', 89, 9, '2017-01-02 23:00:00', '2017-01-02 23:00:00'),
(341, 'Bucharest', 'London', 135, 1, '2016-10-09 22:00:00', '2016-10-09 22:00:00'),
(342, 'London', 'Bucharest', 135, 1, '2016-10-17 22:00:00', '2016-10-17 22:00:00'),
(343, 'Bucharest', 'Liverpool', 52, 11, '2016-06-07 22:00:00', '2016-06-07 22:00:00'),
(344, 'Liverpool', 'Bucharest', 52, 11, '2016-06-14 22:00:00', '2016-06-14 22:00:00'),
(345, 'Bucharest', 'Liverpool', 40, 11, '2016-06-02 22:00:00', '2016-06-02 22:00:00'),
(346, 'Liverpool', 'Bucharest', 40, 11, '2016-06-09 22:00:00', '2016-06-09 22:00:00'),
(347, 'Bucharest', 'London', 52, 10, '2016-03-21 23:00:00', '2016-03-21 23:00:00'),
(348, 'London', 'Bucharest', 52, 11, '2016-04-04 22:00:00', '2016-04-04 22:00:00'),
(349, 'Bucharest', 'London', 46, 11, '2016-04-30 22:00:00', '2016-04-30 22:00:00'),
(350, 'London', 'Bucharest', 46, 11, '2016-05-15 22:00:00', '2016-05-15 22:00:00'),
(351, 'Bucharest', 'Manchester', 148, 8, '2016-04-18 22:00:00', '2016-04-18 22:00:00'),
(352, 'Manchester', 'Bucharest', 148, 8, '2016-04-25 22:00:00', '2016-04-25 22:00:00'),
(353, 'Bucharest', 'Durham', 254, 6, '2016-04-26 22:00:00', '2016-04-26 22:00:00'),
(354, 'Durham', 'Bucharest', 254, 6, '2016-05-02 22:00:00', '2016-05-02 22:00:00'),
(355, 'Bucharest', 'Norwich', 284, 6, '2016-03-28 22:00:00', '2016-03-28 22:00:00'),
(356, 'Norwich', 'Bucharest', 284, 6, '2016-04-04 22:00:00', '2016-04-04 22:00:00'),
(357, 'Bucharest', 'Southampton', 201, 6, '2016-06-24 22:00:00', '2016-06-24 22:00:00'),
(358, 'Southampton', 'Bucharest', 201, 6, '2016-07-09 22:00:00', '2016-07-09 22:00:00'),
(359, 'Bucharest', 'London', 52, 4, '2016-03-31 22:00:00', '2016-03-31 22:00:00'),
(360, 'London', 'Bucharest', 52, 11, '2016-04-11 22:00:00', '2016-04-11 22:00:00'),
(361, 'Bucharest', 'London', 38, 4, '2016-05-27 22:00:00', '2016-05-27 22:00:00'),
(362, 'London', 'Bucharest', 38, 11, '2016-06-11 22:00:00', '2016-06-11 22:00:00'),
(363, 'Bucharest', 'London', 38, 4, '2016-04-24 22:00:00', '2016-04-24 22:00:00'),
(364, 'London', 'Bucharest', 38, 4, '2016-05-09 22:00:00', '2016-05-09 22:00:00'),
(365, 'Bucharest', 'London', 156, 5, '2016-03-23 23:00:00', '2016-03-23 23:00:00'),
(366, 'London', 'Bucharest', 156, 5, '2016-08-29 22:00:00', '2016-08-29 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE IF NOT EXISTS `holidays` (
`holiday_id` int(4) NOT NULL,
  `city_id` int(4) NOT NULL,
  `hotel_id` int(4) NOT NULL,
  `car_id` int(4) NOT NULL,
  `flight_id` int(4) NOT NULL,
  `total_price` int(6) NOT NULL,
  `from_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `to_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE IF NOT EXISTS `hotels` (
`hotel_id` int(4) NOT NULL,
  `name` varchar(40) NOT NULL,
  `price` int(4) NOT NULL,
  `city_id` int(4) NOT NULL,
  `from_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `to_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `picture_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE IF NOT EXISTS `pictures` (
`picture_id` int(4) NOT NULL,
  `src` varchar(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`picture_id`, `src`) VALUES
(1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(4) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `picture_id` int(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `first_name`, `last_name`, `picture_id`) VALUES
(2, 'alex', '12345', 'ala', 'bala', 1),
(3, 'sacalu', 'parola', 'alex', 'stratulat', 1),
(4, 'salacuSenior', 'parola', 'alex', 'stratulat maneaua', 1),
(5, 'salacuSenior2', '0ef1e65e95a7da4b528d207a79eaae776de3a580', 'alex', 'stratulat maneaua', 1),
(6, 'salacuSenior2', '0ef1e65e95a7da4b528d207a79eaae776de3a580', 'alex', 'stratulat maneaua', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_holidays`
--

CREATE TABLE IF NOT EXISTS `users_holidays` (
`user_holiday_id` int(4) NOT NULL,
  `user_id` int(4) DEFAULT NULL,
  `holiday_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
 ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
 ADD PRIMARY KEY (`city_id`), ADD UNIQUE KEY `city_unique` (`name`), ADD KEY `fk_foreign_key_country` (`country_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
 ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
 ADD PRIMARY KEY (`country_id`), ADD UNIQUE KEY `country_unique` (`name`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
 ADD PRIMARY KEY (`flight_id`), ADD KEY `fk_foreign_key_company` (`company_id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
 ADD PRIMARY KEY (`holiday_id`), ADD KEY `city_id` (`city_id`), ADD KEY `hotel_id` (`hotel_id`), ADD KEY `car_id` (`car_id`), ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
 ADD PRIMARY KEY (`hotel_id`), ADD KEY `fk_foreign_key_city` (`city_id`), ADD KEY `fk_foreign_key_picture_hotel` (`picture_id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
 ADD PRIMARY KEY (`picture_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`), ADD KEY `fk_foreign_key_picture` (`picture_id`);

--
-- Indexes for table `users_holidays`
--
ALTER TABLE `users_holidays`
 ADD PRIMARY KEY (`user_holiday_id`), ADD KEY `user_id` (`user_id`), ADD KEY `fk_foreign_key_holiday` (`holiday_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
MODIFY `car_id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
MODIFY `city_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
MODIFY `company_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
MODIFY `country_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=421;
--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
MODIFY `flight_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=367;
--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
MODIFY `holiday_id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
MODIFY `hotel_id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
MODIFY `picture_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users_holidays`
--
ALTER TABLE `users_holidays`
MODIFY `user_holiday_id` int(4) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
ADD CONSTRAINT `fk_foreign_key_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`);

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
ADD CONSTRAINT `fk_foreign_key_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
ADD CONSTRAINT `holidays_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
ADD CONSTRAINT `holidays_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`),
ADD CONSTRAINT `holidays_ibfk_3` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
ADD CONSTRAINT `holidays_ibfk_4` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`);

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
ADD CONSTRAINT `fk_foreign_key_city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
ADD CONSTRAINT `fk_foreign_key_picture_hotel` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`picture_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `fk_foreign_key_picture` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`picture_id`);

--
-- Constraints for table `users_holidays`
--
ALTER TABLE `users_holidays`
ADD CONSTRAINT `fk_foreign_key_holiday` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`holiday_id`),
ADD CONSTRAINT `users_holidays_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
