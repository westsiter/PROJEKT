-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Cze 26, 2024 at 12:57 AM
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
-- Struktura tabeli dla tabeli `admin`
--

CREATE TABLE `admin` (
  `ID` int(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `haslo` varchar(255) NOT NULL,
  `PIN` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `login`, `haslo`, `PIN`) VALUES
(1, 'Admin', 'PJWSTK', 1234);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `koszyk`
--

CREATE TABLE `koszyk` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `koszyk`
--

INSERT INTO `koszyk` (`id`, `user_id`, `product_id`, `quantity`, `added_at`) VALUES
(16, 1, 117, 1, '2024-06-06 10:32:07'),
(17, 1, 119, 1, '2024-06-06 10:33:40'),
(18, 1, 120, 1, '2024-06-06 11:45:13'),
(19, 3, 60, 1, '2024-06-08 14:33:59');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kupon`
--

CREATE TABLE `kupon` (
  `ID` int(11) NOT NULL,
  `kod` varchar(255) NOT NULL,
  `procent` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kupon`
--

INSERT INTO `kupon` (`ID`, `kod`, `procent`) VALUES
(4, 'PJATK', 20),
(5, 'KOD99', 15);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `contact_details` text DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `shipping_address`, `payment_method`, `contact_details`, `status`, `created_at`) VALUES
(1, 2, 776.00, 'Imię: Łukasz\nNazwisko: Pikuła\nAdres: Piaskowa 20a\nKod pocztowy: 18-400\nTelefon: 663434066', 'credit_card', 'E-mail: luizab@wp.pl', 'test', '2024-06-12 13:12:00'),
(2, 2, 656.00, 'Imię: Luiza\nNazwisko: Zaluska\nAdres: luz2 20\nKod pocztowy: 18-400.\nTelefon: 123123123123', 'credit_card', 'E-mail: luizab@wp.pl', 'completed', '2024-06-12 13:40:56'),
(3, 2, 259.00, 'Imię: asd\nNazwisko: asd\nAdres: asd\nKod pocztowy: asd\nTelefon: asd', 'paypal', 'E-mail: luizab@wp.pl', 'completed', '2024-06-18 17:48:09'),
(4, 2, 0.00, 'Imię: asd\nNazwisko: asd\nAdres: asd\nKod pocztowy: asd\nTelefon: asd', 'paypal', 'E-mail: luizab@wp.pl', 'pending', '2024-06-18 17:48:11'),
(5, 2, 0.00, 'Imię: asd\nNazwisko: asd\nAdres: asd\nKod pocztowy: asd\nTelefon: asd', 'paypal', 'E-mail: luizab@wp.pl', 'pending', '2024-06-18 17:48:13'),
(6, 2, 0.00, 'Imię: asd\nNazwisko: asd\nAdres: asd\nKod pocztowy: asd\nTelefon: asd', 'paypal', 'E-mail: luizab@wp.pl', 'pending', '2024-06-18 17:48:15'),
(7, 2, 259.00, 'Imię: a\nNazwisko: a\nAdres: a\nKod pocztowy: a\nTelefon: a', 'credit_card', 'E-mail: luizab@wp.pl', 'pending', '2024-06-18 17:48:45'),
(8, 2, 0.00, 'Imię: 1\nNazwisko: 1\nAdres: 1\nKod pocztowy: 1\nTelefon: 1', 'credit_card', 'E-mail: luizab@wp.pl', 'pending', '2024-06-18 17:50:29'),
(9, 2, 0.00, 'Imię: 1\nNazwisko: 1\nAdres: 1\nKod pocztowy: 1\nTelefon: 1', 'credit_card', 'E-mail: luizab@wp.pl', 'pending', '2024-06-18 17:53:12'),
(10, 2, 1792.00, 'Imię: 1\nNazwisko: 1\nAdres: 1\nKod pocztowy: 1\nTelefon: 1', 'credit_card', 'E-mail: luizab@wp.pl', 'pending', '2024-06-18 18:14:56'),
(11, 4, 537.00, 'Imię: asd\nNazwisko: asd\nAdres: asd\nKod pocztowy: asd\nTelefon: asd', 'credit_card', 'E-mail: kamil@kamil.pl', 'pending', '2024-06-25 13:51:07');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 60, 1, 259.00),
(2, 1, 59, 1, 219.00),
(3, 1, 58, 1, 199.00),
(4, 1, 120, 1, 99.00),
(5, 2, 114, 1, 99.00),
(6, 2, 113, 1, 99.00),
(7, 2, 60, 1, 259.00),
(8, 2, 58, 1, 199.00),
(9, 3, 60, 1, 259.00),
(10, 7, 60, 1, 259.00),
(11, 10, 60, 4, 259.00),
(12, 10, 59, 1, 219.00),
(13, 10, 92, 2, 219.00),
(14, 10, 91, 1, 99.00),
(15, 11, 92, 2, 219.00),
(16, 11, 91, 1, 99.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `polecane`
--

CREATE TABLE `polecane` (
  `ID` int(255) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `cena` int(255) NOT NULL,
  `zdjecie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `polecane`
--

INSERT INTO `polecane` (`ID`, `nazwa`, `cena`, `zdjecie`) VALUES
(1, 'Nike VTest2', 124, '../uploads/test2.webp'),
(2, 'Nike TestV2', 129, '../uploads/2.webp'),
(3, 'Nike Test', 129, '../uploads/3.webp');

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
  `opis` varchar(1000) NOT NULL,
  `plec` varchar(255) NOT NULL,
  `zdjecie` varchar(255) NOT NULL,
  `ilosc` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produkty`
--

INSERT INTO `produkty` (`ID`, `nazwa`, `cena`, `kolor`, `kategoria`, `rozmiar`, `opis`, `plec`, `zdjecie`, `ilosc`) VALUES
(1, 'Nike SuperFly', 289, 'szary', 'spodnie', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/test5.webp', 5),
(2, 'Nike SuperFly', 199, 'bialy', 'spodnie', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/2.webp', 6),
(3, 'Nike Dzwon', 289, 'czarny', 'spodnie', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/3.webp', 22),
(4, 'Nike Gym', 189, 'czarny', 'spodnie', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/4.webp\r\n', 43),
(5, 'Nike Chill', 219, 'niebieski', 'spodnie', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/5.webp\r\n', 53),
(6, 'Nike FWHITE', 229, 'bialy', 'spodnie', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/6.webp\r\n', 2),
(7, 'Nike Elegant', 139, 'szary', 'spodnie', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/7.webp', 1),
(8, 'Nike AirPair', 329, 'szary', 'spodnie', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/8.jpg', 4),
(9, 'Nike SlimPeak', 409, 'czarny', 'spodnie', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/9.webp', 3),
(10, 'Nike GymFit', 209, 'czarny', 'spodnie', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/10.webp', 1),
(11, 'Nike JustPlay', 289, 'niebieski', 'spodnie', 'L', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/11.webp\r\n', 5),
(12, 'Nike BallPro', 449, 'czarny', 'spodnie', 'L', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/12.webp\r\n', 9),
(13, 'Nike NoWay', 229, 'szary', 'spodnie', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/13.webp\r\n', 44),
(14, 'Nike Kolab', 229, 'zielony', 'spodnie', 'L', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/14.webp', 12),
(15, 'Nike Jordan', 129, 'czarny', 'spodnie', 'L', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/15.webp', 17),
(16, 'Nike AirFrayer', 119, 'czarny', 'spodnie', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/16.webp', 19),
(17, 'Nike WhiteS', 99, 'bialy', 'spodnie', 'L', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/17.webp', 21),
(18, 'Nike AirRed', 89, 'czarny', 'spodnie', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/18.webp\r\n', 24),
(19, '0', 49, 'czarny', 'spodnie', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/19.webp\r\n', 28),
(20, '0', 219, 'szary', 'spodnie', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/20.webp\r\n', 4),
(21, 'Nike ProKit', 999, 'niebieski', 'spodnie', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/21.webp', 5),
(22, 'Nike Barcelona', 449, 'niebieski', 'spodnie', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/22.webp', 3),
(23, 'Nike Balls', 389, 'rozowy', 'spodnie', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/23.webp', 11),
(24, 'Nike FitMe', 99, 'niebieski', 'spodnie', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into ', 'meskie', '../uploads/24.webp', 21),
(25, 'Nike PL', 89, 'czerwony', 'spodnie', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 'meskie', '../uploads/25.webp\r\n', 9),
(26, 'nike pro', 99, 'niebieski', 'koszulki', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/26.webp\r\n', 12),
(27, 'Nike Shirt', 129, 'zielony', 'koszulki', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/27.webp\r\n', 12),
(28, 'Nike Skate', 189, 'zielony', 'koszulki', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/28.webp\r\n', 5),
(29, 'Nike Air', 49, 'czarny', 'koszulki', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/29.webp\r\n', 12),
(30, 'Nike GymElite', 119, 'czarny', 'koszulki', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/30.webp\r\n', 7),
(31, 'Nike Cleo', 149, 'czarny', 'koszulki', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/31.webp\r\n', 91),
(32, 'Nike Vel', 89, 'biały', 'koszulki', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/32.webp\r\n', 8),
(33, 'Nike PreLite', 139, 'czarny', 'koszulki', 'L', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/33.webp\r\n', 6),
(34, 'Nike GymPro', 99, 'niebieski', 'koszulki', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/34.webp\r\n', 11),
(35, 'Nike Screen', 109, 'szary', 'koszulki', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/35.webp\r\n', 14),
(36, 'Nike Custom', 319, 'szary', 'koszulki', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/36.webp\r\n', 31),
(37, 'Nike Woriro', 79, 'szary', 'koszulki', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/37.webp\r\n', 18),
(38, 'Nike Casual', 99, 'biały', 'koszulki', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/38.webp\r\n', 15),
(39, 'Nike Vivo', 189, 'czarny', 'koszulki', 'L', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/39.webp\r\n', 19),
(40, 'Nike Ellow', 209, 'biały', 'koszulki', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/40.webp\r\n', 11),
(41, 'Nike Chicken', 129, 'niebieski', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/41.webp', 12),
(42, 'Nike AirPro', 129, 'szary', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/42.webp', 12),
(43, 'Nike AirFry', 229, 'czarny', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/43.webp', 18),
(44, 'Nike AirPlay', 219, 'szary', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/44.webp', 12),
(45, 'Nike GPro', 219, 'niebieski', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/45.webp', 12),
(46, 'Nike BluePair', 229, 'biały', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/46.webp', 12),
(47, 'Nike Club', 219, 'niebieski', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/47.webp', 12),
(48, 'Nike Colap', 249, 'szary', 'bluzy', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/48.webp', 14),
(49, 'Nike Casual', 149, 'szary', 'bluzy', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/49.webp', 14),
(50, 'Nike GymElite', 319, 'czarny', 'bluzy', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/50.webp', 19),
(51, 'Nike Classic', 129, 'niebieski', 'bluzy', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/51.webp', 12),
(52, 'Nike NikeV', 249, 'szary', 'bluzy', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/52.webp', 21),
(53, 'Nike AirAir', 289, 'szary', 'bluzy', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/53.webp', 12),
(54, 'Nike GrayClassic', 419, 'zielony', 'bluzy', 'L', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/54.webp', 23),
(55, 'Nike Vivo', 199, 'czarny', 'bluzy', 'L', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/55.webp', 12),
(56, 'Nike Cool', 229, 'czarny', 'bluzy', 'L', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/56.webp', 15),
(57, 'Nike Lool', 299, 'czerwony', 'bluzy', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/57.webp', 15),
(58, 'Nike FitWell', 199, 'czarny', 'bluzy', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/58.webp', 12),
(59, 'Nike EliteAir', 219, 'czarny', 'bluzy', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/59.webp', 9),
(60, 'Nike ProKit', 259, 'czarny', 'bluzy', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'meskie', '../uploads/60.webp', 4),
(61, 'Nike Stick', 99, 'bialy', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/61.webp\r\n', 12),
(62, 'Nike Aero', 149, 'niebieski', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/61.webp\r\n', 12),
(63, 'Nike Vivo', 129, 'szary', 'bluzy', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/63.webp\r\n', 11),
(64, 'Nike Bluir', 199, 'czarny', 'bluzy', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/64.webp\r\n', 6),
(65, 'Nike Classic', 199, 'czarny', 'bluzy', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/65.webp\r\n', 8),
(66, 'Nike ProKit', 199, 'szary', 'spodnie', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/66.webp\r\n', 19),
(67, 'Nike Luz', 89, 'czarny', 'koszulki', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/67.webp\r\n', 19),
(68, 'Nike FitMe', 189, 'niebieski', 'bluzy', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/68.webp\r\n', 12),
(69, 'Nike Free', 99, 'szary', 'bluzy', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/69.webp\r\n', 89),
(70, 'Nike Ulik', 99, 'niebieski', 'bluzy', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/70.webp\r\n', 12),
(71, 'Nike FreeFit', 89, 'biały', 'koszulki', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/71.webp\r\n', 14),
(72, 'Nike FreeFity', 199, 'bialy', 'koszulki', 'L', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/72.webp\r\n', 11),
(74, 'Nike FreeWay', 189, 'szary', 'spodnie', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/74.webp\r\n', 12),
(75, 'Nike FreeWay', 199, 'czarny', 'spodnie', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/75.webp\r\n', 99),
(76, 'Nike Lizard', 139, 'czarny', 'spodnie', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/76.webp\r\n', 17),
(77, 'Nike Virt', 149, 'czarny', 'spodnie', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/77.webp\r\n', 15),
(78, 'Nike FreeWaves', 289, 'niebieski', 'spodnie', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/78.webp\r\n', 12),
(79, 'Nike Plus', 189, 'szary', 'bluzy', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/79.webp\r\n', 14),
(80, 'Nike Wurt', 89, 'czarny', 'spodnie', 'L', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/80.webp\r\n', 24),
(81, 'Nike Frewagon', 129, 'czarny', 'spodnie', 'L', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/81.webp\r\n', 31),
(82, 'Nike FreeWall', 199, 'szary', 'spodnie', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/82.webp\r\n', 41),
(83, 'Nike Wird', 149, 'bialy', 'spodnie', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/83.webp\r\n', 41),
(84, 'Nike Logic', 179, 'czarny', 'spodnie', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/84.webp\r\n', 31),
(85, 'Nike Loose', 99, 'czarny', 'bluzy', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/85.webp\r\n', 21),
(86, 'Nike Walls', 189, 'bialy', 'spodnie', 'M', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/86.webp\r\n', 21),
(87, 'Nike Face', 89, 'bialy', 'koszulki', 'L', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/87.webp\r\n', 12),
(88, 'Nike Walt', 69, 'czarny', 'koszulki', 'L', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/88.webp\r\n', 21),
(89, 'Nike GymPro', 119, 'bialy', 'koszulki', 'S', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/89.webp\r\n', 41),
(90, 'Nike Casual', 99, 'czarny', 'koszulki', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/90.webp\r\n', 12),
(91, 'Nike Gym', 99, 'bialy', 'koszulki', 'XL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/91.webp\r\n', 10),
(92, 'Nike Whats', 219, 'czarny', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'damskie', '../uploads/92.webp\r\n', 8),
(93, 'Nike El', 99, 'szary', 'koszulki', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/93.webp\r\n', 7),
(94, 'Nike Vertep', 99, 'czarny', 'spodnie', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/94.webp', 9),
(95, 'Nike Vest', 99, 'czarny', 'spodnie', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/95.webp', 11),
(96, 'Nike Sport', 99, 'czarny', 'koszulki', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/96.webp', 21),
(97, 'Nike Fast', 99, 'szary', 'spodnie', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/97.webp', 17),
(98, 'Nike Nice', 99, 'szary', 'spodnie', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/98.webp', 13),
(99, 'Nike Vital', 99, 'szary', 'spodnie', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/99.webp', 14),
(100, 'Nike Perst', 99, 'niebieski', 'spodnie', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/100.webp', 11),
(101, 'Nike Bert', 99, 'czarny', 'spodnie', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/101.webp', 12),
(102, 'Nike Kurl', 99, 'szary', 'koszulki', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/102.webp', 22),
(103, 'Nike Nike', 99, 'bialy', 'koszulki', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/103.webp', 61),
(104, 'Nike Lust', 99, 'szary', 'koszulki', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/104.webp', 19),
(105, 'Nike Air', 99, 'czarny', 'koszulki', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/105.webp', 7),
(106, 'Nike Loor', 99, 'czarny', 'koszulki', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/106.webp', 10),
(107, 'Nike Pro', 99, 'bialy', 'koszulki', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/107.webp', 9),
(108, 'Nike Nice', 99, 'bialy', 'koszulki', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/108.webp', 41),
(109, 'Nike Free', 99, 'czarny', 'koszulki', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/109.webp', 11),
(110, 'Nike Paris', 99, 'czarny', 'koszulki', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/110.webp', 21),
(111, 'Nike Gym', 99, 'bialy', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/111.webp', 14),
(112, 'Nike Free', 99, 'czarny', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/112.webp', 7),
(113, 'Nike Air', 99, 'czarny', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/113.webp', 16),
(114, 'Nike Nike', 99, 'czarny', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/114.webp', 11),
(115, 'Nike Pro', 99, 'szary', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/115.webp', 5),
(116, 'Nike Classic', 99, 'czarny', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/116.webp', 2),
(117, 'Nike Casual', 99, 'bialy', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/117.webp', 31),
(118, 'Nike History', 99, 'niebieski', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/118.webp', 21),
(119, 'Nike Fit', 99, 'niebieski', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/119.webp', 14),
(120, 'Nike SuperFly', 99, 'szary', 'bluzy', 'XS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', 'dzieci', '../uploads/120.webp', 17);

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
(1, 'lukasz', 'pikula', 'lpikula@wp.pl', '$2y$10$JpDF9AYxINzKH/W6JlYqLOpZEJFQ5mdlDLsdA.5WsS6MKLfDm4Oxi'),
(2, 'Kamil', 'Fuiz', 'west@wp.pl', '$2y$10$NR/SJdscpaBvSB0VoVztGOUCmGJzejl/f7CILmQP9e6ywUZetM1lu'),
(3, 'nowekonto', 'nowekonto', 'nowekonto@nowekonto.pl', '$2y$10$KbbtD4va6bGmuJfMM7HskOF0emiMiEWGyu6IkbPAd7Uu7z/Pk5Dgy'),
(4, 'kamil', 'kamil', 'kamil@kamil.pl', '$2y$10$s4do0SSHZY0egs1iKsSvCurWeWAE6f8MJ9QaGt6WXyYnmiX9SgE/e');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `koszyk`
--
ALTER TABLE `koszyk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeksy dla tabeli `kupon`
--
ALTER TABLE `kupon`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeksy dla tabeli `polecane`
--
ALTER TABLE `polecane`
  ADD PRIMARY KEY (`ID`);

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
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `koszyk`
--
ALTER TABLE `koszyk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `kupon`
--
ALTER TABLE `kupon`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `polecane`
--
ALTER TABLE `polecane`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produkty`
--
ALTER TABLE `produkty`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `koszyk`
--
ALTER TABLE `koszyk`
  ADD CONSTRAINT `koszyk_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `koszyk_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `produkty` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `produkty` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
