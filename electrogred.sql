-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2022 at 07:05 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electrogred`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `billId` varchar(20) NOT NULL,
  `accountId` varchar(20) DEFAULT NULL,
  `joinDate` varchar(14) DEFAULT NULL,
  `meterReadingBeforeDate` varchar(40) DEFAULT NULL,
  `meterReadingBefore` varchar(40) DEFAULT NULL,
  `meterReadingNowDate` varchar(40) DEFAULT NULL,
  `meterReadingNow` varchar(40) DEFAULT NULL,
  `noOfUntitsConsumed` varchar(40) DEFAULT NULL,
  `chargeforelectricityConsume` varchar(40) DEFAULT NULL,
  `adjustments` varchar(40) DEFAULT NULL,
  `totalAmountDue` double(6,2) DEFAULT NULL,
  `billDate` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`billId`, `accountId`, `joinDate`, `meterReadingBeforeDate`, `meterReadingBefore`, `meterReadingNowDate`, `meterReadingNow`, `noOfUntitsConsumed`, `chargeforelectricityConsume`, `adjustments`, `totalAmountDue`, `billDate`) VALUES
('BIAN657567100000', 'AN657567', 'dfsf', '159756769', 'sdfsdf', '43242', '5454354', 'gfdfg', 'cgfdg', 'ddfgv', 5667.00, '432sdfs');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notificationId` varchar(20) NOT NULL,
  `accountId` varchar(20) DEFAULT NULL,
  `billId` varchar(20) DEFAULT NULL,
  `amountToBePaid` double(6,2) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `mobileNumber` varchar(50) DEFAULT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `massage` varchar(90) DEFAULT NULL,
  `dateNotify` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notificationId`, `accountId`, `billId`, `amountToBePaid`, `email`, `mobileNumber`, `subject`, `massage`, `dateNotify`) VALUES
('NI220425025227427', 'AN159756', 'BIAN657567100000', 545.00, 'Darlene_Kuphal@gmail.com', '307-541-5613', 'dgdfgdfggd', 'bhfgbhfgbn', '1650835346'),
('NIBIAN657567100000', 'AN159756', 'BIAN657567100000', 545.00, 'Damon.Howell2@gmail.com', '847-536-5925', 'dgdfgdfggd', 'bhfgbhfgbn', '1650833671');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentId` varchar(20) NOT NULL,
  `accountId` varchar(20) DEFAULT NULL,
  `billId` varchar(20) DEFAULT NULL,
  `payeeName` varchar(20) DEFAULT NULL,
  `paymentType` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `totalAmountBill` double(6,2) DEFAULT NULL,
  `amountToBePaid` double(6,2) DEFAULT NULL,
  `datePayment` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentId`, `accountId`, `billId`, `payeeName`, `paymentType`, `email`, `totalAmountBill`, `amountToBePaid`, `datePayment`) VALUES
('PI220425044847447', 'AN159756', 'BIAN657567100000', 'rachita', 'gdrg', '52540gmail.com', 5555.00, 3434.00, '2022-05-01'),
('PI220425045517417', 'AN159756', 'BIAN657567100000', 'asanka', 'cash', '40gmail.com', 5555.00, 3434.00, '2022-05-06'),
('PI220515010317517', 'AN159756', 'BIAN657567100000', 'jeewan', 'card', 'hgsonaligamage22%252540gmai.com', 4323.00, 3322.00, '2022-05-19'),
('PI220515010318518', 'AN159756', 'BIAN657567100000', 'sashi', 'cash', 'hgsonaligamage22%40gmai.com', 4323.00, 3322.00, '2022-05-19'),
('PI220515020530530', 'AN159756', 'BIAN657567100000', 'wq', 'qweq', 'it19953366@my.sliit.lk', 2121.00, 3423.00, '2022-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `accountId` varchar(20) NOT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `nic` varchar(50) DEFAULT NULL,
  `permanantAddress` varchar(50) DEFAULT NULL,
  `mobileNumber` varchar(50) DEFAULT NULL,
  `landNumber` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `userPassword` varchar(20) DEFAULT NULL,
  `areaoffice` varchar(20) DEFAULT NULL,
  `joinDate` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`accountId`, `isAdmin`, `firstName`, `lastName`, `nic`, `permanantAddress`, `mobileNumber`, `landNumber`, `email`, `userPassword`, `areaoffice`, `joinDate`) VALUES
('AN159756', 1, 'fsdfdse5', 'dfsf', '159756769', 'sdfsdf', '43242', '5454354', 'gfdfg', 'cgfdg', 'ddfgv', '5667867'),
('AN434354', 0, 'fsdfds', NULL, '434354534534', 'sdfsdf', '43242', '5454354', 'gfdfg', 'cgfdg', 'ddfgv', '5667867'),
('AN657567', 0, 'fsdfds', 'dfsf', '6575676576', 'sdfsdf', '43242', '5454354', 'gfdfg', 'cgfdg', 'ddfgv', '5667867'),
('AN897567', 0, 'fsdfdse5', 'dfsf', '897567699', 'sdfsdf', '43242', '5454354', 'gfdfg', 'cgfdg', 'ddfgv', '5667867'),
('AN997567', 0, 'fsdfdse5', 'dfsf', '997567699', 'sdfsdf', '43242', '5454354', 'gfdfg', 'cgfdg', 'ddfgv', '5667867');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`billId`),
  ADD KEY `accountId` (`accountId`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notificationId`),
  ADD KEY `accountId` (`accountId`),
  ADD KEY `billId` (`billId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentId`),
  ADD KEY `accountId` (`accountId`),
  ADD KEY `billId` (`billId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`accountId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `users` (`accountId`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `users` (`accountId`),
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`billId`) REFERENCES `bill` (`billId`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `users` (`accountId`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`billId`) REFERENCES `bill` (`billId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
