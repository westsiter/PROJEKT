-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Cze 02, 2024 at 03:16 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toronto`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `ID` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `cena` int(255) NOT NULL,
  `kolor` varchar(255) NOT NULL,
  `kategoria` varchar(255) NOT NULL,
  `rozmiar` varchar(255) NOT NULL,
  `opis` varchar(255) NOT NULL,
  `plec` varchar(255) NOT NULL,
  `zdjecie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produkty`
--

INSERT INTO `produkty` (`ID`, `nazwa`, `cena`, `kolor`, `kategoria`, `rozmiar`, `opis`, `plec`, `zdjecie`) VALUES
(1, 'Nike SuperFly', 289, 'szare', 'spodnie', 'M', 'Super spodnie', 'meskie', '../uploads/1.webp'),
(2, 'Nike SuperFly', 199, 'białe', 'spodnie', 'S', 'Białe superspodnie', 'meskie', '../uploads/2.webp'),
(3, 'Nike Dzwon', 289, 'czarne', 'spodnie', 'XL', 'fajne czarne szerokie spodnie', 'meskie', '../uploads/3.webp'),
(4, 'Nike Gym', 189, 'czarne', 'spodnie', 'S', 'spodnie czarne fajne na silke pozdro', 'meskie', '../uploads/4.webp\r\n'),
(5, 'Nike Chill', 219, 'niebieskie', 'spodnie', 'M', 'nike niebieskie szerokie spodnie', 'meskie', '../uploads/5.webp\r\n'),
(6, 'Nike FWHITE', 229, 'białe', 'spodnie', 'M', 'biale spodnie na zime', 'meskie', '../uploads/6.webp\r\n'),
(7, 'Nike Elegant', 139, 'szare', 'spodnie', 'XL', 'bluza z kapturem różowa', 'meskie', '../uploads/7.webp'),
(8, 'Nike AirPair', 329, 'szare', 'spodnie', 'M', 'spodnie unisex', 'meskie', '../uploads/8.webp'),
(9, 'Nike SlimPeak', 409, 'czarne', 'spodnie', 'XS', 'Opinajace sie spodnie', 'meskie', '../uploads/9.webp'),
(10, 'Nike GymFit', 209, 'czarne', 'spodnie', 'M', 'fajen spodnie na silke', 'meskie', '../uploads/10.webp'),
(11, 'Nike JustPlay', 289, 'niebieskie', 'spodnie', 'L', 'niebieskie spodnie otakieo', 'meskie', '../uploads/11.webp\r\n'),
(12, 'Nike BallPro', 449, 'czarne', 'spodnie', 'L', 'lorem ipsum', 'meskie', '../uploads/12.webp\r\n'),
(13, 'Nike NoWay', 229, 'szare', 'spodnie', 'M', 'Lorem Ipsum', 'meskie', '../uploads/13.webp\r\n'),
(14, 'Nike Kolab', 229, 'Zielone', 'spodnie', 'L', 'Lorem ipsum', 'meskie', '../uploads/14.webp'),
(15, 'Nike Jordan', 129, 'czarne', 'spodnie', 'L', 'Lorem ipsum', 'meskie', '../uploads/15.webp'),
(16, 'Nike AirFrayer', 119, 'czarne', 'spodnie', 'XS', 'Lorem ipsum', 'meskie', '../uploads/16.webp'),
(17, 'Nike WhiteS', 99, 'białe', 'spodnie', 'L', 'Lorem ipsum', 'meskie', '../uploads/17.webp'),
(18, 'Nike AirRed', 89, 'czarny', 'spodnie', 'S', 'Lorem ipsum', 'meskie', '../uploads/18.webp\r\n'),
(19, 'Nike Classic', 49, 'czarny', 'spodnie', 'XL', 'Lorem ipsum', 'meskie', '../uploads/19.webp\r\n'),
(20, 'Nike FitV2', 29, 'szary', 'spodnie', 'XL', 'Lorem ipsum', 'meskie', '../uploads/20.webp\r\n'),
(21, 'Nike Barcelona', 999, 'niebieski', 'spodnie', 'M', 'Lorem ipsum', 'meskie', '../uploads/21.webp'),
(22, 'Nike Barcelona', 449, 'niebieskie', 'spodnie', 'S', 'Lorem ipsum', 'meskie', '../uploads/23.webp'),
(23, 'Nike Balls', 389, 'rozowy', 'spodnie', 'XS', 'Lorem ipsum', 'meskie', '../uploads/23.webp'),
(24, 'Nike FitMe', 99, 'niebieskie', 'spodnie', 'XL', 'Lorem ipsum', 'meskie', '../uploads/24.webp'),
(25, 'Nike PL', 89, 'czerwony', 'spodnie', 'S', 'Lorem ipsum', 'meskie', '../uploads/25.webp\r\n');


-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `haslo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `imie`, `nazwisko`, `mail`, `haslo`) VALUES
(1, 'lukasz', 'pikula', 'lpikula@wp.pl', '$2y$10$JpDF9AYxINzKH/W6JlYqLOpZEJFQ5mdlDLsdA.5WsS6MKLfDm4Oxi');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `produkty`
--
ALTER TABLE `produkty`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
