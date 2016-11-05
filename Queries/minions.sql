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

-- Dumping database structure for minions
CREATE DATABASE IF NOT EXISTS `minions` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `minions`;


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


-- Dumping structure for table minions.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(30) NOT NULL,
  `pass` char(26) NOT NULL,
  `profile_picture` tinyblob,
  `last_login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table minions.users: ~7 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `pass`, `profile_picture`, `last_login_time`, `is_deleted`) VALUES
	(1, 'robi', 'asdfgh', _binary 0x433A55736572735069637475726573, '2016-10-01 11:59:51', 1),
	(2, 'hemmy', 'asdfgh', _binary 0x433A55736572735069637475726573, '2016-10-01 11:59:51', 1),
	(3, 'milki', 'asdfgh', _binary 0x433A55736572735069637475726573, '2016-10-01 11:59:51', 0),
	(4, 'stuewy', 'asdfgh', _binary 0x433A55736572735069637475726573, '2016-10-01 11:59:51', 1),
	(5, 'qwerty', 'asdfgh', _binary 0x433A55736572735069637475726573, '2016-10-01 11:59:51', 0),
	(6, 'username', 'pass', _binary 0x433A557365727350696374757265734D795069632E6A706567, '2016-10-01 14:57:47', 0),
	(7, 'username', 'pass', _binary 0x433A557365727350696374757265734D795069632E6A706567, '2016-10-01 14:58:59', 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for trigger minions.TR_BeforeInsert_Users
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `TR_BeforeInsert_Users` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
    IF CHAR_LENGTH(NEW.username) < 2 THEN
    SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'check constraint on Pass failed';
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
