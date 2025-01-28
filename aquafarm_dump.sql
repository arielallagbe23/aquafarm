-- MySQL dump 10.13  Distrib 8.0.40, for Linux (aarch64)
--
-- Host: localhost    Database: aquafarm-transactions
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `types_user`
--

DROP TABLE IF EXISTS `types_user`;
CREATE TABLE `types_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_type_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_user_id` int NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `numero_telephone` varchar(20) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `type_user_id` (`type_user_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`type_user_id`) REFERENCES `types_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `domaines`
--

DROP TABLE IF EXISTS `domaines`;
CREATE TABLE `domaines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `nom_domaine` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `domaines_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `types_exploitation`
--

DROP TABLE IF EXISTS `types_exploitation`;
CREATE TABLE `types_exploitation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_type_exploitation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `exploitations`
--

DROP TABLE IF EXISTS `exploitations`;
CREATE TABLE `exploitations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_exploitation_id` int NOT NULL,
  `domaine_id` int NOT NULL,
  `nom_exploitation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_exploitation_id` (`type_exploitation_id`),
  KEY `domaine_id` (`domaine_id`),
  CONSTRAINT `exploitations_ibfk_1` FOREIGN KEY (`type_exploitation_id`) REFERENCES `types_exploitation` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exploitations_ibfk_2` FOREIGN KEY (`domaine_id`) REFERENCES `domaines` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exploitation_id` int NOT NULL,
  `nom_element` varchar(255) NOT NULL,
  `quantite` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exploitation_id` (`exploitation_id`),
  CONSTRAINT `elements_ibfk_1` FOREIGN KEY (`exploitation_id`) REFERENCES `exploitations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `production`
--

DROP TABLE IF EXISTS `production`;
CREATE TABLE `production` (
  `id` int NOT NULL AUTO_INCREMENT,
  `element_id` int NOT NULL,
  `quantite_produite` int NOT NULL,
  `unite_production` varchar(50) NOT NULL,
  `date_de_production` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `element_id` (`element_id`),
  CONSTRAINT `production_ibfk_1` FOREIGN KEY (`element_id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `types_element`
--

DROP TABLE IF EXISTS `types_element`;
CREATE TABLE `types_element` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_type_element` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
