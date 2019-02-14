-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.12-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for candidates
DROP DATABASE IF EXISTS `candidates`;
CREATE DATABASE IF NOT EXISTS `candidates` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `candidates`;

-- Dumping structure for table candidates.candidate
DROP TABLE IF EXISTS `candidate`;
CREATE TABLE IF NOT EXISTS `candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `personalid` varchar(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `linkedin` varchar(200) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `picture` varchar(500) DEFAULT NULL,
  `job_title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table candidates.education
DROP TABLE IF EXISTS `education`;
CREATE TABLE IF NOT EXISTS `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `education_level` varchar(100) NOT NULL DEFAULT '0',
  `school_name` varchar(500) NOT NULL DEFAULT '0',
  `subject` varchar(500) NOT NULL DEFAULT '0',
  `study_begin` varchar(500) NOT NULL DEFAULT '0',
  `study_end` varchar(500) DEFAULT '0',
  `candidate_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_education_candidate` (`candidate_id`),
  CONSTRAINT `FK_education_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table candidates.job_experience
DROP TABLE IF EXISTS `job_experience`;
CREATE TABLE IF NOT EXISTS `job_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) NOT NULL DEFAULT '0',
  `position` varchar(100) NOT NULL DEFAULT '0',
  `job_duties` varchar(500) NOT NULL DEFAULT '0',
  `job_begin` varchar(50) NOT NULL DEFAULT '0',
  `job_end` varchar(50) DEFAULT '0',
  `candidate_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_job_experience_candidate` (`candidate_id`),
  CONSTRAINT `FK_job_experience_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table candidates.language
DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `language_level` varchar(50) CHARACTER SET latin1 NOT NULL,
  `candidate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_language_candidate` (`candidate_id`),
  CONSTRAINT `FK_language_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table candidates.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
