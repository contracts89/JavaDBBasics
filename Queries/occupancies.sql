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
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
