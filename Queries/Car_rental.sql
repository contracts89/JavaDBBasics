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

-- Dumping structure for table car_rental.cars
CREATE TABLE IF NOT EXISTS `cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate_number` varchar(20) NOT NULL,
  `make` varchar(20) DEFAULT NULL,
  `model` varchar(20) NOT NULL,
  `car_year` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `doors` int(11) NOT NULL,
  `picture` blob,
  `car_condition` varchar(50) DEFAULT NULL,
  `available` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cars` (`category_id`),
  CONSTRAINT `fk_cars` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table car_rental.cars: ~3 rows (approximately)
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` (`id`, `plate_number`, `make`, `model`, `car_year`, `category_id`, `doors`, `picture`, `car_condition`, `available`) VALUES
	(1, 'EH7552MP', NULL, 'Panda', 1992, 1, 3, NULL, 'Bad', 1),
	(2, 'CB4444AP', NULL, 'BMW', 1986, 2, 5, NULL, 'Excellent', 1),
	(3, 'BP7552KP', NULL, 'AUDI', 1974, 3, 5, NULL, 'Good', 0);
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;


-- Dumping structure for table car_rental.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  `daily_rate` int(11) NOT NULL,
  `weekly_rate` int(11) NOT NULL,
  `monthly_rate` int(11) NOT NULL,
  `weekend_rate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table car_rental.categories: ~3 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `category`, `daily_rate`, `weekly_rate`, `monthly_rate`, `weekend_rate`) VALUES
	(1, 'Pickup', 5, 7, 28, 7),
	(2, 'Bus', 5, 7, 28, 7),
	(3, 'Van', 5, 7, 28, 7);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


-- Dumping structure for table car_rental.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_licence_number` int(11) NOT NULL,
  `full_name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(10) NOT NULL,
  `zip_code` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table car_rental.customers: ~3 rows (approximately)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`id`, `driver_licence_number`, `full_name`, `address`, `city`, `zip_code`, `notes`) VALUES
	(1, 456654, 'Radoslav Dimitrov', 'Home', 'Sofia', 1000, 'I do not know wht to write'),
	(2, 852258, 'Stefan Nitzov', 'Siliana`s Home', 'Sofia', 1100, 'I do not know wht to write'),
	(3, 753357, 'Neli Urumova', 'St. GRad', 'Sofia', 1000, 'I do not know wht to write');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;


-- Dumping structure for table car_rental.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table car_rental.employees: ~3 rows (approximately)
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`id`, `first_name`, `last_name`, `title`, `notes`) VALUES
	(1, 'Vanya', 'Urumova', 'BIG BOSS', 'Eats a lot of sweets!'),
	(2, 'Radoslav', 'Dimitrov', 'BIGGER BOSS', 'Eats a lot!'),
	(3, 'Stefan', 'Nitzov', 'BIGGEST BOSS', 'Eats!');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;


-- Dumping structure for table car_rental.rental_orders
CREATE TABLE IF NOT EXISTS `rental_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `car_condition` varchar(50) NOT NULL,
  `tank_level` int(11) DEFAULT NULL,
  `kilometrage_start` int(11) NOT NULL,
  `kilometrage_end` int(11) NOT NULL,
  `total_kilometrage` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `total_days` int(11) DEFAULT NULL,
  `rate_applied` varchar(50) DEFAULT NULL,
  `tax_rate` int(11) DEFAULT NULL,
  `order_status` tinyint(1) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `fk_car_rental` (`employee_id`,`customer_id`,`car_id`),
  KEY `customer_id` (`customer_id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `fk_car_rental` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `rental_orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `rental_orders_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table car_rental.rental_orders: ~3 rows (approximately)
/*!40000 ALTER TABLE `rental_orders` DISABLE KEYS */;
INSERT INTO `rental_orders` (`id`, `employee_id`, `customer_id`, `car_id`, `car_condition`, `tank_level`, `kilometrage_start`, `kilometrage_end`, `total_kilometrage`, `start_date`, `end_date`, `total_days`, `rate_applied`, `tax_rate`, `order_status`, `notes`) VALUES
	(1, 1, 1, 1, 'Good', NULL, 1000, 1025, 25, '2016-10-02 00:00:00', '2016-10-08 00:00:00', 6, NULL, NULL, 1, 'If this works I`ll be very happy'),
	(2, 2, 2, 2, 'Bad', NULL, 153, 1025, 872, '2016-09-02 00:00:00', '2016-10-08 00:00:00', 36, NULL, NULL, 1, 'If this works I`ll be very happy'),
	(3, 3, 3, 3, 'Good', NULL, 1280, 1325, 45, '2016-09-13 00:00:00', '2016-10-08 00:00:00', 25, NULL, NULL, 1, 'If this works I`ll be very happy');
/*!40000 ALTER TABLE `rental_orders` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
