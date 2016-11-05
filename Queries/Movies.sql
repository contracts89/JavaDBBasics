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

-- Dumping database structure for movies
CREATE DATABASE IF NOT EXISTS `movies` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `movies`;


-- Dumping structure for table movies.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table movies.categories: ~5 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `category_name`, `notes`) VALUES
	(1, 'Best Movie', 'Some sticky notes about this damn movie'),
	(2, 'Best Actor', 'Some sticky notes about this damn movie'),
	(3, 'Best Actress', 'Some sticky notes about this damn movie'),
	(4, 'Best Support Actor', 'Some sticky notes about this damn movie'),
	(5, 'Best Support Actress', 'Some sticky notes about this damn movie');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


-- Dumping structure for table movies.directors
CREATE TABLE IF NOT EXISTS `directors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `director_name` varchar(50) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table movies.directors: ~5 rows (approximately)
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` (`id`, `director_name`, `notes`) VALUES
	(1, 'Danailov', 'Some sticky notes about this damn movie'),
	(2, 'Kushvaliev', 'Some sticky notes about this damn movie'),
	(3, 'Penev', 'Some sticky notes about this damn movie'),
	(4, 'Tododrov', 'Some sticky notes about this damn movie'),
	(5, 'Velislava', 'Some sticky notes about this damn movie');
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;


-- Dumping structure for table movies.genres
CREATE TABLE IF NOT EXISTS `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(50) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table movies.genres: ~5 rows (approximately)
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` (`id`, `genre_name`, `notes`) VALUES
	(1, 'Horror', 'Some sticky notes about this damn movie'),
	(2, 'Thriller', 'Some sticky notes about this damn movie'),
	(3, 'Action', 'Some sticky notes about this damn movie'),
	(4, 'Comedy', 'Some sticky notes about this damn movie'),
	(5, 'Drama', 'Some sticky notes about this damn movie');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;


-- Dumping structure for table movies.movies
CREATE TABLE IF NOT EXISTS `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `director_id` int(11) NOT NULL,
  `copyright_year` int(11) DEFAULT NULL,
  `movie_length` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `fk_movies` (`director_id`,`genre_id`,`category_id`),
  KEY `fk_movies1` (`genre_id`),
  KEY `fk_movies2` (`category_id`),
  CONSTRAINT `fk_movies` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`),
  CONSTRAINT `fk_movies1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`),
  CONSTRAINT `fk_movies2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table movies.movies: ~5 rows (approximately)
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` (`id`, `title`, `director_id`, `copyright_year`, `movie_length`, `genre_id`, `category_id`, `rating`, `notes`) VALUES
	(1, 'Face OFF', 3, 2002, 160, 3, 2, 10, 'Some sticky notes about this damn movie'),
	(2, 'The Unborn', 1, 2007, 120, 1, 3, 6, 'Some sticky notes about this damn movie'),
	(3, 'Seven', 2, 2000, 180, 2, 5, 10, 'Some sticky notes about this damn movie'),
	(4, 'The Hangover', 5, 2008, 102, 4, 1, 8, 'Some sticky notes about this damn movie'),
	(5, '8 Mile', 4, 2005, 120, 5, 4, 7, 'Some sticky notes about this damn movie');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
