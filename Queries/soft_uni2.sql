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

-- Dumping database structure for softuni
CREATE DATABASE IF NOT EXISTS `softuni` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `softuni`;


-- Dumping structure for table softuni.addresses
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_text` text NOT NULL,
  `town_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_addresses` (`town_id`),
  CONSTRAINT `fk_addresses` FOREIGN KEY (`town_id`) REFERENCES `towns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table softuni.addresses: ~0 rows (approximately)
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;


-- Dumping structure for table softuni.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table softuni.departments: ~6 rows (approximately)
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` (`id`, `name`) VALUES
	(1, 'Engineering'),
	(2, 'Sales'),
	(3, 'Marketing'),
	(4, 'Software'),
	(5, 'Development'),
	(6, 'Quality Assurance');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;


-- Dumping structure for table softuni.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `job_title` varchar(50) NOT NULL,
  `department_id` int(11) NOT NULL,
  `hire_date` datetime DEFAULT NULL,
  `salary` float(10,2) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_fk` (`department_id`,`address_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `employees_fk` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table softuni.employees: ~5 rows (approximately)
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`id`, `first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`, `address_id`) VALUES
	(1, 'Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01 00:00:00', 3500.00, NULL),
	(2, 'Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2014-03-02 00:00:00', 4000.00, NULL),
	(3, 'Maria', 'Petrova', 'Ivanova', 'Intern', 6, '2016-08-28 00:00:00', 525.25, NULL),
	(4, 'Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09 00:00:00', 3000.00, NULL),
	(5, 'Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28 00:00:00', 599.88, NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;


-- Dumping structure for table softuni.towns
CREATE TABLE IF NOT EXISTS `towns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table softuni.towns: ~4 rows (approximately)
/*!40000 ALTER TABLE `towns` DISABLE KEYS */;
INSERT INTO `towns` (`id`, `name`) VALUES
	(1, 'Sofia'),
	(2, 'Plovdiv'),
	(3, 'Varna'),
	(4, 'Burgas');
/*!40000 ALTER TABLE `towns` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
