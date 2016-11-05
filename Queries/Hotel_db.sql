-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.15-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for hotel
CREATE DATABASE IF NOT EXISTS `hotel` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hotel`;


-- Dumping structure for table hotel.bed_types
CREATE TABLE IF NOT EXISTS `bed_types` (
  `bed_type` varchar(50) NOT NULL,
  `notes` text,
  PRIMARY KEY (`bed_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table hotel.bed_types: ~3 rows (approximately)
/*!40000 ALTER TABLE `bed_types` DISABLE KEYS */;
INSERT INTO `bed_types` (`bed_type`, `notes`) VALUES
	('2 Beds', NULL),
	('4 Beds', NULL),
	('Master', NULL);
/*!40000 ALTER TABLE `bed_types` ENABLE KEYS */;


-- Dumping structure for table hotel.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `account_number` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `emergency_name` varchar(15) NOT NULL,
  `emergency_number` varchar(50) NOT NULL,
  `notes` text,
  PRIMARY KEY (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table hotel.customers: ~3 rows (approximately)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`account_number`, `first_name`, `last_name`, `phone_number`, `emergency_name`, `emergency_number`, `notes`) VALUES
	(1, 'Milcho', 'Petev', '+35699854', 'STOPPER', '112', NULL),
	(2, 'Pepi', 'Simov', '+35699854', 'STOPPER', '112', NULL),
	(3, 'Desi', 'Mimeva', '+35699854', 'STOPPER', '112', NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;


-- Dumping structure for table hotel.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table hotel.employees: ~3 rows (approximately)
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`id`, `first_name`, `last_name`, `title`, `notes`) VALUES
	(1, 'Tonka', 'Miteva', 'BOSS', NULL),
	(2, 'Petio', 'Tomov', 'Valley', NULL),
	(3, 'Minko', 'Simov', 'Front', NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;


-- Dumping structure for table hotel.occupancies
CREATE TABLE IF NOT EXISTS `occupancies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `date_occupied` date NOT NULL,
  `account_number` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `rate_applied` int(11) DEFAULT NULL,
  `phone_charge` float(10,2) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `fk_occupancies` (`employee_id`),
  CONSTRAINT `fk_occupancies` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table hotel.occupancies: ~3 rows (approximately)
/*!40000 ALTER TABLE `occupancies` DISABLE KEYS */;
INSERT INTO `occupancies` (`id`, `employee_id`, `date_occupied`, `account_number`, `room_number`, `rate_applied`, `phone_charge`, `notes`) VALUES
	(1, 1, '2016-10-04', 45, 3, NULL, NULL, NULL),
	(2, 1, '2016-10-04', 45, 3, NULL, NULL, NULL),
	(3, 1, '2016-10-04', 45, 3, NULL, NULL, NULL);
/*!40000 ALTER TABLE `occupancies` ENABLE KEYS */;


-- Dumping structure for table hotel.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `payment_date` datetime NOT NULL,
  `account_number` int(11) NOT NULL,
  `first_date_occupied` datetime NOT NULL,
  `last_date_occupied` datetime NOT NULL,
  `total_days` int(11) DEFAULT NULL,
  `amount_charged` float(10,2) NOT NULL,
  `tax_rate` int(11) NOT NULL,
  `tax_amount` float(10,2) DEFAULT NULL,
  `payment_total` float(10,2) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `fk_payments` (`employee_id`),
  CONSTRAINT `fk_payments` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table hotel.payments: ~3 rows (approximately)
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` (`id`, `employee_id`, `payment_date`, `account_number`, `first_date_occupied`, `last_date_occupied`, `total_days`, `amount_charged`, `tax_rate`, `tax_amount`, `payment_total`, `notes`) VALUES
	(1, 1, '2016-10-04 00:00:00', 54, '2016-09-01 00:00:00', '2016-09-20 00:00:00', 25, 20.30, 20, 2.99, 23.40, NULL),
	(2, 2, '2016-10-04 00:00:00', 54, '2016-09-01 00:00:00', '2016-09-20 00:00:00', 25, 20.30, 20, 2.99, 23.40, NULL),
	(3, 3, '2016-10-04 00:00:00', 54, '2016-09-01 00:00:00', '2016-09-20 00:00:00', 25, 20.30, 20, 2.99, 23.40, NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;


-- Dumping structure for table hotel.rooms
CREATE TABLE IF NOT EXISTS `rooms` (
  `room_number` int(11) NOT NULL AUTO_INCREMENT,
  `room_type` varchar(50) NOT NULL,
  `bed_type` varchar(50) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `room_status` varchar(50) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`room_number`),
  KEY `fk_rooms` (`room_status`,`room_type`,`bed_type`),
  KEY `room_type` (`room_type`),
  KEY `bed_type` (`bed_type`),
  CONSTRAINT `fk_rooms` FOREIGN KEY (`room_status`) REFERENCES `room_status` (`room_status`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`room_type`) REFERENCES `room_types` (`room_type`),
  CONSTRAINT `rooms_ibfk_2` FOREIGN KEY (`bed_type`) REFERENCES `bed_types` (`bed_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table hotel.rooms: ~3 rows (approximately)
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` (`room_number`, `room_type`, `bed_type`, `rate`, `room_status`, `notes`) VALUES
	(1, '2 rooms', 'Master', 2, 'Available', NULL),
	(2, '3 rooms', '4 Beds', 5, 'Occupied', NULL),
	(3, 'King sweet', '2 Beds', 10, 'Reserved', NULL);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;


-- Dumping structure for table hotel.room_status
CREATE TABLE IF NOT EXISTS `room_status` (
  `room_status` varchar(10) NOT NULL,
  `notes` text,
  PRIMARY KEY (`room_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table hotel.room_status: ~3 rows (approximately)
/*!40000 ALTER TABLE `room_status` DISABLE KEYS */;
INSERT INTO `room_status` (`room_status`, `notes`) VALUES
	('Available', NULL),
	('Occupied', NULL),
	('Reserved', NULL);
/*!40000 ALTER TABLE `room_status` ENABLE KEYS */;


-- Dumping structure for table hotel.room_types
CREATE TABLE IF NOT EXISTS `room_types` (
  `room_type` varchar(50) NOT NULL,
  `notes` text,
  PRIMARY KEY (`room_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table hotel.room_types: ~3 rows (approximately)
/*!40000 ALTER TABLE `room_types` DISABLE KEYS */;
INSERT INTO `room_types` (`room_type`, `notes`) VALUES
	('2 rooms', NULL),
	('3 rooms', NULL),
	('King sweet', NULL);
/*!40000 ALTER TABLE `room_types` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
