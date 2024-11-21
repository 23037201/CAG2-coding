-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2024 at 07:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `miniproject_c237`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productId` int(10) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `info` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productId`, `productName`, `quantity`, `price`, `image`, `info`) VALUES
(1, 'Plain Bagel', 50, 2.50, 'plain.jpg', '100-110g/per serving.                     \r\nMade with Wholewheat polish, Fresh milk, salt and High protein flour.'),
(2, 'Peach cream cheese', 20, 4.50, 'peach cream cheese.jpg', '100g dough, 40g filing.\r\nMade with Wholewheat polish, High protein flour, Salt and Homemade peach cream cheese '),
(3, 'Taro bagel', 35, 3.00, 'taro.jpg', '100-110g.\r\nMade with Wholewheat Polish, Water, High protein flour, salt and taro.'),
(4, 'Matcha black sesame', 20, 4.00, 'matcha black sesame.jpg', '90-100g dough, 30g black sesame filing.\r\nMade with Wholewheat polish, High protein, Black sesame, Unsalted butter, Salt and Sugar.'),
(5, 'Hazelnut coffee bagel', 20, 3.50, 'hazelnut coffee.jpg', '100-110g.\r\nMade with Wholewheat polish, Wholewheat flour, high protein flour, Coffee, Salt and Hazelnut. '),
(9, 'Coconut sea salt bagel', 35, 4.00, 'coconut sea salt.jpg', ''),
(10, 'Almond cream cheese bagel', 30, 4.50, 'almond.jpg', ''),
(11, '3pcs pistachio bread', 20, 6.50, '3pcs pistachios.jpg', '100g dough with 20g pistachios filing. Made with Wholewheat polish, High protein, Natural pistachio, Unsalted butter, Salt and Sugar.'),
(12, '3pcs strawberry bread', 20, 6.50, '3pcs strawberry.jpg', '100g dough with 20g strawberry cream filing. Made with Wholewheat polish, High protein, Cream, Strawberry, Unsalted butter, Salt and Sugar.'),
(13, '3pcs sweet potato bread', 20, 7.00, '3pcs sweet potato.jpg', '100g dough with 20g sweet potato creamchees filing. Made with Wholewheat polish, High protein, Cream cheese, Sweet potato, Unsalted butter, Salt and Sugar.'),
(16, 'chocolatebagel', 20, 7.00, 'mulberry cream cheese.jpg', '100g dough with 20g  filing. Made with Wholewheat polish, High protein, Cream cheese, Sweet potato, Unsalted butter, Salt and Sugar.');

-- --------------------------------------------------------

--
-- Table structure for table `summer`
--

CREATE TABLE `summer` (
  `id` int(10) NOT NULL,
  `productname` varchar(200) NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `info` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `summer`
--

INSERT INTO `summer` (`id`, `productname`, `quantity`, `price`, `image`, `info`) VALUES
(1, 'Matcha cinnamon apple', 40, 4.50, 'matcha cinnamon.jpg', '90-100g dough, 30g black sesame filing.\r\nMade with Wholewheat polish, High protein, Red bean, Unsalted butter, Salt and Sugar.'),
(2, 'Red Bean', 45, 4.00, 'redbean.jpg', '90-100g dough, 30g black sesame filing.\r\nMade with Wholewheat polish, High protein, Red bean, Unsalted butter, Salt and Sugar.'),
(3, 'Mulberry cream cheese', 35, 5.00, 'mulberry cream cheese.jpg', '90-100g dough, 30g cream cheese filing.\r\nMade with Wholewheat polish, High protein, mulberry, Unsalted butter, Salt and cream cheese.'),
(4, 'Special doughnut shape bagel', 30, 5.00, 'doughnut.jpg', '90-100g dough with white chocolate on top.\r\nMade with Wholewheat polish, High protein, white chocolate, Unsalted butter, Salt and Sugar.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `summer`
--
ALTER TABLE `summer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `summer`
--
ALTER TABLE `summer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
