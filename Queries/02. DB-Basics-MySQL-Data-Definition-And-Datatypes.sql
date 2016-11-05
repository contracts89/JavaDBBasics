-- TASK 4

INSERT INTO `towns` (`id`, `name`) VALUES
	(1, 'Sofia'),
	(2, 'Plovdiv'),
	(3, 'Varna');

INSERT INTO `minions` (`id`, `name`, `age`, `town_id`) VALUES
	(1, 'Kevin', 22, 1),
	(2, 'Bob', 15, 3),
	(3, 'Steward', NULL, 2);

-- TASK 7
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

-- Dumping structure for table minions.people
CREATE TABLE IF NOT EXISTS `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `picture` tinyblob,
  `height` float(10,2) DEFAULT NULL,
  `weight` float(10,2) DEFAULT NULL,
  `gender` enum('m','f') NOT NULL,
  `birthdate` varchar(20) NOT NULL,
  `biography` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table minions.people: ~5 rows (approximately)
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` (`id`, `name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`) VALUES
	(1, 'Robi', _binary 0x433A55736572735069637475726573, 2.78, 70.30, 'm', '24.01.1989', NULL),
	(2, 'Rado', _binary 0x433A55736572735069637475726573, 2.78, 70.30, 'm', '24.01.1989', NULL),
	(3, 'Iliq', _binary 0x433A55736572735069637475726573, 2.78, 70.30, 'm', '24.01.1989', NULL),
	(4, 'Vanq', _binary 0x433A55736572735069637475726573, 2.78, 70.30, 'm', '24.01.1989', NULL),
	(5, 'Stefan', _binary 0x433A55736572735069637475726573, 2.78, 70.30, 'm', '24.01.1989', NULL);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;


-- TASK 8

CREATE TABLE users
(
id BIGINT NOT NULL AUTO_INCREMENT,
username CHAR(30) NOT NULL,
pass CHAR(26) NOT NULL,
profile_picture TINYBLOB,
last_login_time TIMESTAMP,
is_deleted BOOL,
PRIMARY KEY (id)
);

INSERT INTO users (username, pass, profile_picture, is_deleted) VALUES
('robi', 'asdfgh', 'C:\Users\Pictures', true),
('hemmy', 'asdfgh', 'C:\Users\Pictures', true),
('milki', 'asdfgh', 'C:\Users\Pictures', false),
('stuewy', 'asdfgh', 'C:\Users\Pictures', true),
('qwerty', 'asdfgh', 'C:\Users\Pictures', false);

-- TASK 13

CREATE TABLE IF NOT EXISTS directors
(
id INT AUTO_INCREMENT NOT NULL,
director_name VARCHAR(50) NOT NULL,
notes TEXT,
PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS genres
(
id INT AUTO_INCREMENT NOT NULL,
genre_name VARCHAR(50) NOT NULL,
notes TEXT,
PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS categories
(
id INT AUTO_INCREMENT NOT NULL,
category_name VARCHAR(50) NOT NULL,
notes TEXT,
PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS movies
(
id INT AUTO_INCREMENT NOT NULL,
title VARCHAR(50) NOT NULL,
director_id INT NOT NULL,
copyright_year INT,
movie_length INT NOT NULL,
genre_id INT NOT NULL,
category_id INT NOT NULL,
rating INT,
notes TEXT,
PRIMARY KEY(id),
KEY fk_movies (director_id, genre_id, category_id),
CONSTRAINT fk_movies FOREIGN KEY (director_id) REFERENCES directors (id),
CONSTRAINT fk_movies1 FOREIGN KEY (genre_id) REFERENCES genres (id),
CONSTRAINT fk_movies2 FOREIGN KEY (category_id) REFERENCES categories (id)
);

INSERT INTO categories (category_name, notes) VALUES
('Best Movie', 'Some sticky notes about this damn movie'),
('Best Actor', 'Some sticky notes about this damn movie'),
('Best Actress', 'Some sticky notes about this damn movie'),
('Best Support Actor', 'Some sticky notes about this damn movie'),
('Best Support Actress', 'Some sticky notes about this damn movie');

INSERT INTO directors (director_name, notes) VALUES
('Danailov', 'Some sticky notes about this damn movie'),
('Kushvaliev', 'Some sticky notes about this damn movie'),
('Penev', 'Some sticky notes about this damn movie'),
('Tododrov', 'Some sticky notes about this damn movie'),
('Velislava', 'Some sticky notes about this damn movie');

INSERT INTO genres (genre_name, notes) VALUES
('Horror', 'Some sticky notes about this damn movie'),
('Thriller', 'Some sticky notes about this damn movie'),
('Action', 'Some sticky notes about this damn movie'),
('Comedy', 'Some sticky notes about this damn movie'),
('Drama', 'Some sticky notes about this damn movie');

INSERT INTO movies (title, director_id, copyright_year, movie_length, genre_id, category_id, rating, notes) VALUES
('Face OFF', 3, 2002, 160, 3, 2, 10, 'Some sticky notes about this damn movie'),
('The Unborn', 1, 2007, 120, 1, 3, 6, 'Some sticky notes about this damn movie'),
('Seven', 2, 2000, 180, 2, 5, 10, 'Some sticky notes about this damn movie'),
('The Hangover', 5, 2008, 102, 4, 1, 8, 'Some sticky notes about this damn movie'),
('8 Mile', 4, 2005, 120, 5, 4, 7, 'Some sticky notes about this damn movie');

-- TASK 14

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


-- TASK 15

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


-- TASK 19

SELECT * FROM towns;
SELECT * FROM departments;
SELECT * FROM employees;

-- TASK 20

SELECT * FROM towns ORDER BY name;
SELECT * FROM departments ORDER BY name;
SELECT * FROM employees ORDER BY salary DESC;

-- TASK 21

SELECT name FROM towns ORDER BY name;
SELECT name FROM departments ORDER BY name;
SELECT first_name, last_name, job_title, salary FROM employees ORDER BY salary DESC;

-- TASK 22

UPDATE employees SET salary=salary+salary*0.1;
SELECT salary FROM employees;

-- TASK 23

UPDATE payments SET tax_rate=tax_rate-tax_rate*0.03;
SELECT tax_rate FROM payments;

-- TASK 24

TRUNCATE occupancies;