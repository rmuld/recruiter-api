-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.12-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
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

-- Dumping data for table candidates.candidate: ~15 rows (approximately)
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
INSERT INTO `candidate` (`id`, `firstname`, `lastname`, `personalid`, `email`, `phone`, `address`, `linkedin`, `comment`, `picture`, `job_title`) VALUES
	(107, 'Tõnis', 'Külamees', '358462418', 'tõnis@külamees.ee', '5412365', 'Küladevahe talu, Eesti', 'www.linkedin.com', 'tuhajuhan', 'http://localhost:8080/files/tonis.jpg', 'Analüütik'),
	(108, 'Maarja', 'Mesilane', '465751525', 'maarja@mesilane.ee', '5236987', 'Kurtna, Eesti', 'www.linkedin.com', NULL, 'http://localhost:8080/files/mesilane.jpg', 'Testija'),
	(109, 'Kalle', 'Kaasik', '3695255556', 'kalle@kaasik.ee', '568798797', 'Vabaduse pst 56-89, Rakvere, Eesti', 'http://www.linkedin.com', 'tuhajuhan', 'http://localhost:8080/files/download.jpg', 'Arendaja'),
	(110, 'Marika', 'Luik', '454589866', 'marika@luik.ee', '568989899', 'Aia 7-7, Jõhvi, Ida-Viru maakond', '', NULL, 'http://localhost:8080/files/d819a8b79fd3db8187a88352cd326b59.jpg', 'Projektijuht'),
	(111, 'Pearu', 'Paul', '365149535', 'pearu@paul.ee', '0', 'Tare 5-1, Paide, Eesti', 'www.linkedin.com', NULL, 'http://localhost:8080/files/paul.jpg', 'Toote omanik'),
	(112, '', '', '', '', '0', '', '', NULL, '', ''),
	(113, 'Anna', 'Aava', '45254896352', 'anna@aava.ee', '52174345', 'Kaera 1, Tartu', 'www.linkedin.ee', NULL, 'http://localhost:8080/files/anna.jpg', 'Analüütik'),
	(114, 'Teele', 'Tihane', '45874125896', 'teele@tihane.ee', '5874123', 'Kesa 4, Põlva', 'www.linkedin.com', NULL, 'http://localhost:8080/files/teele.jpg', 'Projektijuht'),
	(115, 'Juhan', 'Tuha', '39545689725', 'tuha@juhan.ee', '536435435', 'Kalda 5, Tallinn, Harjumaa', '', NULL, 'http://localhost:8080/files/tonis.jpg', 'Arendaja'),
	(116, 'Kertu', 'Luik', '45236987523', 'kertu@luik.ee', '5689556698', 'Mustamäe tee 5-6, Tallinn, Harjumaa', '', 'veits püss\n', 'http://localhost:8080/files/natalja.jpg', 'Projektijuht'),
	(117, 'Henn', 'Sarv', '35698756921', 'henn@sarv.ee', '569985566', 'Kai 5-6, Pärnu, Pärnu maakond', '', NULL, 'http://localhost:8080/files/tonis.jpg', 'Projektijuht'),
	(118, 'Paula', 'Kuup', '42589635478', 'paula@kuup.ee', '5698632255', 'Käbi 5, Paide, Järva maakond', 'www.linkedin.com', NULL, 'http://localhost:8080/files/images.jpg', 'Projektijuht'),
	(119, 'Kairi', 'Vihman', '48411070214', 'kairi.vihman@eesti.ee', '53586930', 'Telliskivi 50b-5, Tallinn', 'linkedin.com/kairi', NULL, 'http://localhost:8080/files/album_pic.png', 'Analüütik'),
	(120, 'Klarika', 'Leht', '42365896823', 'klarika.leht@gmail.com', '+372568967455', 'Jõe 5-6, Jõhvi, Ida-Viru maakond', '', NULL, '', 'Testija');
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;

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

-- Dumping data for table candidates.education: ~13 rows (approximately)
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` (`id`, `education_level`, `school_name`, `subject`, `study_begin`, `study_end`, `candidate_id`) VALUES
	(26, 'Põhiharidus', 'Kuristiku Põhikool', 'õpilane', 'september/2001', 'juuni/2010', 107),
	(27, 'Põhiharidus', 'Kurtna Kool', 'õpilane', 'september/2014', 'juuni/2020', 108),
	(28, 'Keskharidus', 'Rakvere Gümnaasium', 'õpilane', 'september/2010', 'juuni/2012', 109),
	(29, 'Kõrgharidus', 'Tallinna Ülikool', 'Kehakultuur', 'september/2012', 'september/2015', 109),
	(30, 'Põhiharidus', 'Jõhvi Põhikool', 'Õpilane', 'september/2003', 'juuni/2011', 110),
	(31, 'Keskharidus', 'Jõhvi Gümnaasium', 'Õpilane', 'september/2011', 'juuni/2014', 110),
	(32, 'Kõrgharidus', 'Muusikakõrgkool', 'pianist', 'september/1942', 'juuni/1946', 111),
	(33, 'Põhiharidus', 'Pakri Põhikool', 'õpilane', 'september/2020', '/2020', 113),
	(34, 'Põhiharidus', 'Paide Põhikool', 'õpilane', 'märts/2020', '/2020', 118),
	(35, 'Kõrgharidus', 'Tallinna Ülikool', 'keeletoimetaja', 'september/2008', 'juuni/2011', 119),
	(36, 'Keskharidus', 'Jõhvi Gümnaasium', 'õpilane', 'september/2010', 'juuni/2013', 120),
	(37, 'Bakalaureuseharidus', 'IT Kolledž', 'Testija', 'september/2013', '/2020', 120);
/*!40000 ALTER TABLE `education` ENABLE KEYS */;

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

-- Dumping data for table candidates.job_experience: ~10 rows (approximately)
/*!40000 ALTER TABLE `job_experience` DISABLE KEYS */;
INSERT INTO `job_experience` (`id`, `company_name`, `position`, `job_duties`, `job_begin`, `job_end`, `candidate_id`) VALUES
	(21, 'OÜ Nälja ja Võlg', 'insener', 'kasumit teenida', 'juuni/2010', '/2020', 107),
	(22, 'Mesitaru OÜ', 'Vabakutseline', 'õietolmu spetsialist', 'juuni/2020', '/2020', 108),
	(23, 'Jõhvi Selver', 'Müüja', 'müüja tooteid', 'juuli/2014', 'september/2016', 110),
	(24, 'Jõhvi Rimi', 'Klienditeenindaja', 'teenindada kliente', 'september/2016', 'september/2018', 110),
	(25, 'Proekspert', 'juuniorarendaja', 'Java, C++ arendaja', 'oktoober/1953', 'aprill/2013', 111),
	(26, 'IT Koolitus OÜ', 'Õppejõud', 'õpetada lapsi', 'oktoober/2020', '/2020', 117),
	(27, 'Paide Selver', 'Müüja', 'teenindada kliente kassas', 'aprill/2020', '/2020', 118),
	(28, 'Varrak', 'toimetaja', 'projektijuhtimine', 'jaanuar/2018', 'detsember/2018', 119),
	(29, 'SMIT', 'Testija', 'automaattestimine', 'september/2015', 'juuni/2020', 120);
/*!40000 ALTER TABLE `job_experience` ENABLE KEYS */;

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

-- Dumping data for table candidates.language: ~21 rows (approximately)
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` (`id`, `language_name`, `language_level`, `candidate_id`) VALUES
	(48, 'Vene keel', 'C1', 107),
	(49, 'Soome keel', 'A2', 107),
	(50, 'Rootsi keel', 'B2', 108),
	(51, 'Inglise keel', 'C1', 109),
	(52, 'Vene keel', 'B2', 109),
	(53, 'Eesti keel', 'C2', 110),
	(54, 'Vene keel', 'B2', 110),
	(55, 'Soome keel', 'C1', 111),
	(56, 'Soome keel', 'B1', 113),
	(57, 'Eesti keel', 'C2', 114),
	(58, 'Inglise keel', 'C1', 115),
	(59, 'Inglise keel', 'B1', 116),
	(60, 'Vene keel', 'A2', 117),
	(61, 'Inglise keel', 'C2', 118),
	(62, 'Eesti keel', 'C2', 119),
	(63, 'Inglise keel', 'C1', 119),
	(64, 'Vene keel', 'B1', 119),
	(65, 'Rootsi keel', 'A1', 119),
	(66, 'Eesti keel', 'C2', 120),
	(67, 'Hispaania keel', 'B1', 120);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;

-- Dumping structure for table candidates.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table candidates.user: ~2 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`) VALUES
	(1, 'liina', '$2a$10$LxDVv361mqDBgjv4BvwNgOTqgn0wI1EFfCgBummPCGfhn1/RMiPJ.'),
	(3, 'riina', '$2a$10$kS1TW0T/NJI1uGQvjZ5LkuioJZ6RWVv21.y3FOp5i9/GghGSUjzby');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
