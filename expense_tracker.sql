-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2024 at 08:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expense_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `budget` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `budget`) VALUES
(1, 'Groceries', 100),
(2, 'Utilities', 200),
(3, 'Entertainment', 400),
(4, 'Custom', 200),
(5, 'Groceries', 200),
(6, 'Utilities', 100),
(7, 'Entertainment', 50),
(8, 'Custom', 100),
(9, 'Groceries', 100),
(10, 'Utilities', 200),
(11, 'Entertainment', 200),
(12, 'Custom', 800),
(13, 'Groceries', 1000),
(14, 'Utilities', 200),
(15, 'Entertainment', 100),
(16, 'Custom', 100),
(17, 'Groceries', 100),
(18, 'Utilities', 200),
(19, 'Entertainment', 100),
(20, 'Custom', 29),
(21, 'Groceries', 100),
(22, 'Utilities', 50),
(23, 'Entertainment', 20),
(24, 'Custom', 20),
(25, 'Groceries', 200),
(26, 'Utilities', 100),
(27, 'Entertainment', 300),
(28, 'Custom', 50),
(29, 'Groceries', 400),
(30, 'Utilities', 100),
(31, 'Entertainment', 20),
(32, 'Custom', 100),
(33, 'Groceries', 200),
(34, 'Utilities', 100),
(35, 'Entertainment', 20),
(36, 'Custom', 10),
(37, 'Groceries', 1000),
(38, 'Utilities', 2000),
(39, 'Entertainment', 300),
(40, 'Custom', 400),
(41, 'Groceries', 100),
(42, 'Utilities', 200),
(43, 'Entertainment', 100),
(44, 'Custom', 200),
(45, 'Groceries', 1000),
(46, 'Utilities', 200),
(47, 'Entertainment', 300),
(48, 'Custom', 200),
(49, 'Groceries', 100),
(50, 'Utilities', 200),
(51, 'Entertainment', 400),
(52, 'Custom', 200),
(53, 'Groceries', 100),
(54, 'Utilities', 200),
(55, 'Entertainment', 300),
(56, 'Custom', 900),
(57, 'Groceries', 500),
(58, 'Utilities', 800),
(59, 'Entertainment', 300),
(60, 'Custom', 200),
(61, 'Groceries', 200),
(62, 'Utilities', 300),
(63, 'Entertainment', 400),
(64, 'Custom', 100),
(65, 'Groceries', 100),
(66, 'Utilities', 300),
(67, 'Entertainment', 400),
(68, 'Custom', 200),
(69, 'Groceries', 200),
(70, 'Utilities', 100),
(71, 'Entertainment', 300),
(72, 'Custom', 200),
(73, 'Groceries', 100),
(74, 'Utilities', 200),
(75, 'Entertainment', 300),
(76, 'Custom', 100),
(77, 'Groceries', 200),
(78, 'Utilities', 200),
(79, 'Entertainment', 200),
(80, 'Custom', 200),
(81, 'Groceries', 300),
(82, 'Utilities', 300),
(83, 'Entertainment', 600),
(84, 'Custom', 600),
(85, 'Groceries', 100),
(86, 'Utilities', 200),
(87, 'Entertainment', 300),
(88, 'Custom', 100);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `category_id`, `amount`, `description`, `location`, `date`, `payment`) VALUES
(1, 5, 50, '20', 'd', '2024-04-02', 'f'),
(2, 12, 100, 'g', 'd', '2024-04-02', 's'),
(3, 13, 100, 'ddd', 'ddd', '2024-04-02', 'kkjj'),
(4, 17, 20, 'ddd', 'jjj', '2024-04-02', 'bkash'),
(5, 21, 10, 'ddd', 'dff', '2024-04-02', 'ddd'),
(6, 33, 100, 'ssdd', 'ddf', '2024-04-02', 'mhg'),
(7, 37, 400, 'jhgg', 'bbv', '2024-04-02', 'bkash'),
(8, 44, 1, 'fgg', 'dfg', '2024-04-02', 'wef'),
(9, 45, 40, 'fff', 'fff', '2024-04-02', 'fff'),
(10, 53, 2, 'fffff', 'gggff', '2024-04-02', 'k'),
(11, 57, 2, 'dfg', 'dfggh', '2024-04-02', 'fgh'),
(12, 61, 200, 'dkhgvghj', 'hbgvfcfgbh', '2024-04-02', 'jhgfdfg'),
(13, 65, 20, 'dfgh', 'fcvhb', '2024-04-02', 'jhgfd'),
(14, 69, 40, 'sdfghjk', 'sdfghj', '2024-04-02', 'sdfghj'),
(15, 73, 20, 'dsdfxcghj', 'sdfghj', '2024-04-02', 'sdfgh'),
(16, 80, 10, 'sdfghjk', 'sdfgh', '2024-04-02', 'dfgh'),
(17, 85, 100, 'buying some groceries', 'dhaka', '2024-04-02', 'bkash');

-- --------------------------------------------------------

--
-- Table structure for table `monthly_budget`
--

CREATE TABLE `monthly_budget` (
  `id` int(11) NOT NULL,
  `month_year` varchar(7) DEFAULT NULL,
  `budget` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `monthly_budget`
--

INSERT INTO `monthly_budget` (`id`, `month_year`, `budget`) VALUES
(1, '2024-04', 5000),
(2, '2024-04', 5000),
(3, '2024-04', 5000),
(4, '2024-04', 50000),
(5, '2024-04', 60000),
(6, '2024-04', 5000),
(7, '2024-04', 5000),
(8, '2024-04', 1000),
(9, '2024-04', 1000),
(10, '2024-04', 5000),
(11, '2024-04', 50000),
(12, '2024-04', 20000),
(13, '2024-04', 500000),
(14, '2024-04', 5000),
(15, '2024-04', 20000),
(16, '2024-04', 30000),
(17, '2024-04', 40000),
(18, '2024-04', 300),
(19, '2024-04', 5000),
(20, '2024-04', 20000),
(21, '2024-04', 20000),
(22, '2024-04', 2000),
(23, '2024-04', 40000),
(24, '2024-04', 10000),
(25, '2024-04', 10000),
(26, '2024-04', 2000),
(27, '2024-04', 10000),
(28, '2024-04', 200000),
(29, '2024-04', 10000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monthly_budget`
--
ALTER TABLE `monthly_budget`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `monthly_budget`
--
ALTER TABLE `monthly_budget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
