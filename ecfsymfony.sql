-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 18, 2023 at 05:22 PM
-- Server version: 8.0.32-0ubuntu0.22.04.2
-- PHP Version: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecfsymfony`
--

-- --------------------------------------------------------

--
-- Table structure for table `auteur`
--

CREATE TABLE `auteur` (
  `id` int NOT NULL,
  `nom` varchar(190) NOT NULL,
  `prenom` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auteur`
--

INSERT INTO `auteur` (`id`, `nom`, `prenom`) VALUES
(1, 'auteur inconnu', ''),
(2, 'Cartier', 'Hugues'),
(3, 'Lambert', 'Armand'),
(4, 'Moitessier', 'Thomas');

-- --------------------------------------------------------

--
-- Table structure for table `emprunt`
--

CREATE TABLE `emprunt` (
  `id` int NOT NULL,
  `date_emprunt` datetime NOT NULL,
  `date_retour` datetime DEFAULT NULL,
  `emprunteur_id` int NOT NULL,
  `livre_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `emprunt`
--

INSERT INTO `emprunt` (`id`, `date_emprunt`, `date_retour`, `emprunteur_id`, `livre_id`) VALUES
(1, '2020-02-01 10:00:00', '2020-03-01 10:00:00', 1, 1),
(2, '2020-03-01 10:00:00', '2020-04-01 10:00:00', 2, 2),
(3, '2020-04-01 10:00:00', NULL, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `emprunteur`
--

CREATE TABLE `emprunteur` (
  `id` int NOT NULL,
  `nom` varchar(190) NOT NULL,
  `prenom` varchar(190) NOT NULL,
  `tel` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `emprunteur`
--

INSERT INTO `emprunteur` (`id`, `nom`, `prenom`, `tel`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'foo', 'foo', '123456789', '2020-01-01 10:00:00', '2020-01-01 10:00:00', 2),
(2, 'bar', 'bar', '123456789', '2020-02-01 11:00:00', '2020-05-01 12:00:00', 3),
(3, 'baz', 'baz', '123456789', '2020-03-01 12:00:00', '2020-03-01 12:00:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int NOT NULL,
  `nom` varchar(190) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `nom`, `description`) VALUES
(1, 'poésie', NULL),
(2, 'nouvelle', NULL),
(3, 'roman historique', NULL),
(4, 'roman d\'amour', NULL),
(5, 'roman d\'aventure', NULL),
(6, 'science-fiction', NULL),
(7, 'fantasy', NULL),
(8, 'biographie', NULL),
(9, 'conte', NULL),
(10, 'témoignage', NULL),
(11, 'théâtre', NULL),
(12, 'essai', NULL),
(13, 'journal intime', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `livre`
--

CREATE TABLE `livre` (
  `id` int NOT NULL,
  `titre` varchar(190) DEFAULT NULL,
  `annee_edition` int DEFAULT NULL,
  `nombre_pages` int DEFAULT NULL,
  `code_isbn` varchar(190) DEFAULT NULL,
  `auteur_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `livre`
--

INSERT INTO `livre` (`id`, `titre`, `annee_edition`, `nombre_pages`, `code_isbn`, `auteur_id`) VALUES
(1, 'Lorem ipsum dolor sit amet', 2010, 100, '9785786930024', 1),
(2, 'Aperiendum est igitur', 2011, 150, '9783817260935', 2),
(3, 'Mihi quidem Antiochum', 2012, 200, '9782020493727', 3),
(4, 'Quem audis satis belle', 2013, 250, '9794059561353', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Livre_Genre`
--

CREATE TABLE `Livre_Genre` (
  `livre_id` int NOT NULL,
  `genre_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Livre_Genre`
--

INSERT INTO `Livre_Genre` (`livre_id`, `genre_id`) VALUES
(1, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(190) NOT NULL,
  `roles` text NOT NULL,
  `password` varchar(190) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `emprunteur_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `enabled`, `created_at`, `updated_at`, `emprunteur_id`) VALUES
(1, 'admin@example.com', '[\"ROLE_ADMIN\"]', '123', 1, '2020-01-01 09:00:00', '2020-01-01 09:00:00', 0),
(2, 'foo.foo@example.com', '[\"ROLE_USER\"]', '123', 1, '2020-01-01 10:00:00', '2020-01-01 10:00:00', 0),
(3, 'bar.bar@example.com', '[\"ROLE_USER\"]', '123', 0, '2020-02-01 11:00:00', '2020-05-01 12:00:00', 0),
(4, 'baz.baz@example.com', '[\"ROLE_USER\"]', '123', 1, '2020-03-01 12:00:00', '2020-03-01 12:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emprunt`
--
ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_emprunteur` (`emprunteur_id`),
  ADD KEY `fk_livre` (`livre_id`);

--
-- Indexes for table `emprunteur`
--
ALTER TABLE `emprunteur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_auteur_id` (`auteur_id`);

--
-- Indexes for table `Livre_Genre`
--
ALTER TABLE `Livre_Genre`
  ADD PRIMARY KEY (`livre_id`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `emprunt`
--
ALTER TABLE `emprunt`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `emprunteur`
--
ALTER TABLE `emprunteur`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `livre`
--
ALTER TABLE `livre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `emprunt_ibfk_1` FOREIGN KEY (`emprunteur_id`) REFERENCES `emprunteur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `emprunt_ibfk_2` FOREIGN KEY (`livre_id`) REFERENCES `livre` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_emprunteur` FOREIGN KEY (`emprunteur_id`) REFERENCES `emprunteur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_livre` FOREIGN KEY (`livre_id`) REFERENCES `livre` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `emprunteur`
--
ALTER TABLE `emprunteur`
  ADD CONSTRAINT `emprunteur_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `fk_auteur_id` FOREIGN KEY (`auteur_id`) REFERENCES `auteur` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `Livre_Genre`
--
ALTER TABLE `Livre_Genre`
  ADD CONSTRAINT `Livre_Genre_ibfk_1` FOREIGN KEY (`livre_id`) REFERENCES `livre` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Livre_Genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
