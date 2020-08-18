-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2020 at 09:20 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_carina_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_carina_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_carina_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `name_employee` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `name_employee`) VALUES
(4, 'Otto Grünwald'),
(47, 'Hannelore Baum'),
(4567, 'Annalena Grün'),
(8554, 'Birgit Schönbaum');

-- --------------------------------------------------------

--
-- Table structure for table `mail_item`
--

CREATE TABLE `mail_item` (
  `fk_name_sender` varchar(60) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `mailing_price` float DEFAULT NULL,
  `posting_location_id` mediumint(9) DEFAULT NULL,
  `priority` enum('normal','high') DEFAULT NULL,
  `type_size_identifier` enum('postcard_S','postcard_M','envelope_S','envelope_M','envelope_L','envelope_XL','package_S','package_M','package_L','package_XL') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mail_item`
--

INSERT INTO `mail_item` (`fk_name_sender`, `item_id`, `mailing_price`, `posting_location_id`, `priority`, `type_size_identifier`) VALUES
('Brigitte Obermaier', 123456789, 2.4, 45, 'normal', 'envelope_M'),
('Ursula Lauber', 147258369, 0.7, 459, 'normal', 'postcard_S'),
('Elisabeth Grünstadl', 258369147, 0.6, 7, 'normal', 'postcard_S'),
('Hugo König', 369258147, 5.6, 477, 'high', 'package_M'),
('Laura Baumgartner', 456789123, 12.8, 88, 'high', 'package_XL'),
('Albert Oberwallner', 789456123, 9.8, 10, 'normal', 'package_L');

-- --------------------------------------------------------

--
-- Table structure for table `processing`
--

CREATE TABLE `processing` (
  `delivery_date` date DEFAULT NULL,
  `fk_employee_id_delivery` int(11) DEFAULT NULL,
  `fk_item_id` int(11) DEFAULT NULL,
  `processing_location_id` mediumint(9) DEFAULT NULL,
  `processing_number` int(11) NOT NULL,
  `processing_start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `processing`
--

INSERT INTO `processing` (`delivery_date`, `fk_employee_id_delivery`, `fk_item_id`, `processing_location_id`, `processing_number`, `processing_start_date`) VALUES
('2020-08-19', 4, 123456789, 8, 445796, '2020-08-17'),
('2020-08-17', 47, 456789123, 66, 559889, '2020-08-16'),
('2020-08-17', 8554, 258369147, 70, 665223, '2020-08-16'),
('2020-08-15', 4, 789456123, 70, 1146598, '2020-08-14'),
('2020-08-18', 4567, 147258369, 89, 5988623, '2020-08-18');

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `address_recipient` varchar(100) NOT NULL,
  `fk_item_id` int(11) DEFAULT NULL,
  `name_recipient` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`address_recipient`, `fk_item_id`, `name_recipient`) VALUES
('Grüne Allee 1, 5698 Oberkönigswiesen', 123456789, 'Michaela Gründorf'),
('Schöne Gasse 4, 6879 Gassendorf', 147258369, 'Franz Huber'),
('Grüne Allee 1, 5698 Oberkönigswiesen', 258369147, 'Laura Bergmair'),
('Breitenfurterstraße 14, 6597 Breitenfurt', 369258147, 'Gundula Ostermayr'),
('Austraße 7, 87548 Augartenberg', 456789123, 'Franz Huber');

-- --------------------------------------------------------

--
-- Table structure for table `sender`
--

CREATE TABLE `sender` (
  `address_sender` varchar(100) NOT NULL,
  `fk_item_id` int(11) DEFAULT NULL,
  `name_sender` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sender`
--

INSERT INTO `sender` (`address_sender`, `fk_item_id`, `name_sender`) VALUES
('Augartenweg 14, 2357 Stadthausen', 123456789, 'Brigitte Obermaier'),
('Augartenweg 14, 2357 Stadthausen', 123456789, 'Laura Baumgartner'),
('Wiesenweg 17, 4569 Wiesendorf', 258369147, 'Hugo König'),
('Maisbaumweg 3, 4798 Maisfeld', 369258147, 'Elisabeth Grünstadl'),
('Königsgasse 4, 2348 Königsdorf', 456789123, 'Ursula Lauber'),
('Herbststraße 15, 1560 Burghausen', 789456123, 'Albert Oberwallner');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `mail_item`
--
ALTER TABLE `mail_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `fk_name_sender` (`fk_name_sender`);

--
-- Indexes for table `processing`
--
ALTER TABLE `processing`
  ADD PRIMARY KEY (`processing_number`),
  ADD KEY `fk_employee_id_delivery` (`fk_employee_id_delivery`),
  ADD KEY `fk_item_id` (`fk_item_id`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`name_recipient`,`address_recipient`),
  ADD KEY `fk_item_id` (`fk_item_id`);

--
-- Indexes for table `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`name_sender`,`address_sender`),
  ADD KEY `fk_item_id` (`fk_item_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mail_item`
--
ALTER TABLE `mail_item`
  ADD CONSTRAINT `mail_item_ibfk_1` FOREIGN KEY (`fk_name_sender`) REFERENCES `sender` (`name_sender`);

--
-- Constraints for table `processing`
--
ALTER TABLE `processing`
  ADD CONSTRAINT `processing_ibfk_1` FOREIGN KEY (`fk_employee_id_delivery`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `processing_ibfk_2` FOREIGN KEY (`fk_item_id`) REFERENCES `mail_item` (`item_id`);

--
-- Constraints for table `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_item_id`) REFERENCES `mail_item` (`item_id`);

--
-- Constraints for table `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `sender_ibfk_1` FOREIGN KEY (`fk_item_id`) REFERENCES `mail_item` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
