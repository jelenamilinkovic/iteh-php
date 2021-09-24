-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2021 at 04:30 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restoran`
--

-- --------------------------------------------------------

--
-- Table structure for table `hrana`
--

CREATE TABLE `hrana` (
  `id` int(11) NOT NULL,
  `naziv` varchar(100) COLLATE utf8mb4_croatian_ci NOT NULL,
  `opis` varchar(500) COLLATE utf8mb4_croatian_ci NOT NULL,
  `slika` varchar(1000) COLLATE utf8mb4_croatian_ci NOT NULL,
  `cena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `hrana`
--

INSERT INTO `hrana` (`id`, `naziv`, `opis`, `slika`, `cena`) VALUES
(1, 'pljeskavica', 'punjena gurmanska pljeskavica, punjena sirom i lukom', 'https://www.kuvarancije.com/images/stories/recepti/meso/rostilj/pljeskavica-6.JPG', 240),
(11, 'pita sa jabukama', 'domaca pita sa jabukama', 'https://i.ytimg.com/vi/RoHWiA6pogg/maxresdefault.jpg', 550),
(15, 'pasulj', 'domaci corbasti pasulj', 'https://www.stvarukusa.rs/wp-content/uploads/2019/11/napravite-cuveni-corbast-pasulj-po-receptu-iz-jna.jpg', 499);

-- --------------------------------------------------------

--
-- Table structure for table `narudzbina`
--

CREATE TABLE `narudzbina` (
  `id` int(11) NOT NULL,
  `ime` varchar(30) COLLATE utf8mb4_croatian_ci NOT NULL,
  `prezime` varchar(30) COLLATE utf8mb4_croatian_ci NOT NULL,
  `adresa` varchar(50) COLLATE utf8mb4_croatian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `narudzbina`
--

INSERT INTO `narudzbina` (`id`, `ime`, `prezime`, `adresa`) VALUES
(20, 'Stefan', 'Matic', 'Cara Dusana 79, Zemun'),
(21, 'Tamara', 'Ignjatovic', 'Goce Delceva 15, Novi Beograd');

-- --------------------------------------------------------

--
-- Table structure for table `stavka_narudzbine`
--

CREATE TABLE `stavka_narudzbine` (
  `hrada_id` int(11) NOT NULL,
  `narudzbina_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `stavka_narudzbine`
--

INSERT INTO `stavka_narudzbine` (`hrada_id`, `narudzbina_id`) VALUES
(15, 20),
(11, 20),
(1, 21),
(15, 21),
(11, 21);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hrana`
--
ALTER TABLE `hrana`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `narudzbina`
--
ALTER TABLE `narudzbina`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stavka_narudzbine`
--
ALTER TABLE `stavka_narudzbine`
  ADD KEY `fk_hrana` (`hrada_id`),
  ADD KEY `fk_narudzbina` (`narudzbina_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hrana`
--
ALTER TABLE `hrana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `narudzbina`
--
ALTER TABLE `narudzbina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `stavka_narudzbine`
--
ALTER TABLE `stavka_narudzbine`
  ADD CONSTRAINT `fk_hrana` FOREIGN KEY (`hrada_id`) REFERENCES `hrana` (`id`),
  ADD CONSTRAINT `fk_narudzbina` FOREIGN KEY (`narudzbina_id`) REFERENCES `narudzbina` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
