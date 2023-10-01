-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 01, 2023 at 04:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tpay`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_ID` int(225) NOT NULL,
  `admin_name` varchar(25) NOT NULL,
  `admin_username` varchar(25) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_profile` varchar(255) NOT NULL,
  `Balance` int(255) NOT NULL,
  `admin_pin` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_ID`, `admin_name`, `admin_username`, `admin_email`, `admin_password`, `admin_profile`, `Balance`, `admin_pin`) VALUES
(1, 'IRERE UMUHIRE DIANE', 'diane', 'ireneudiane@gmail.com', '1dc8ed480f98d79c8938a45efd7d759a', 'WhatsApp Image 2023-09-21 at 06.36.10.jpeg', 614600, 60422);

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `created_at` datetime NOT NULL,
  `aID` int(10) NOT NULL,
  `agent_name` varchar(255) NOT NULL,
  `agent_gender` varchar(255) NOT NULL,
  `agent_username` varchar(255) NOT NULL,
  `agent_tel` varchar(12) NOT NULL,
  `agent_mail` varchar(255) NOT NULL,
  `agent_password` varchar(255) NOT NULL,
  `agent_pin` int(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `agent_balance` int(220) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`created_at`, `aID`, `agent_name`, `agent_gender`, `agent_username`, `agent_tel`, `agent_mail`, `agent_password`, `agent_pin`, `photo`, `agent_balance`, `status`) VALUES
('2023-06-06 02:22:03', 36, 'RUMUMBA Patrice', 'male', 'Patrice', '257886754123', 'patrice@gmail.com', '597673be8ea7215c682c809347ba60ec', 5502, 'download.jpg', 23000, 'active'),
('2023-09-01 17:02:12', 46, 'NYIRAMINANI Maria', 'female', 'Maria', '257886754123', 'maria@gmail.com', '202cb962ac59075b964b07152d234b70', 5617, 're.PNG', 51300, 'active'),
('2023-09-04 09:06:27', 49, 'NSHUTI Yves', 'male', 'Yves', '257886754123', 'nshuti@gmail.com', '202cb962ac59075b964b07152d234b70', 2703, 'NSHUTI.PNG', 10000, 'active'),
('2023-09-02 03:10:09', 50, 'KAGABO Yvette', 'female', 'kagabo', '257886754123', 'kagabo@gmail.com', '202cb962ac59075b964b07152d234b70', 2307, 'mik.PNG', 290000, 'active'),
('2023-09-08 06:50:58', 53, 'IDUKUNDATWESE DANNY', 'male', 'Idt', '257886754123', 'idtdanny@gmail.com', '11c8b3d8abc3809f566f9e259e1d55e7', 5931, 'WhatsApp Image 2023-08-07 at 21.27.01.jpeg', 225600, 'active'),
('2023-09-19 09:05:32', 75, 'MUJAWABERA Josee', 'female', 'josee', '250780012634', 'ireneudiane@gmail.com', '1dc8ed480f98d79c8938a45efd7d759a', 6133, 'user_photo_2.png', 98000, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `agent_location`
--

CREATE TABLE `agent_location` (
  `no` int(255) NOT NULL,
  `aID` int(255) NOT NULL,
  `agent_name` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `sector` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agent_location`
--

INSERT INTO `agent_location` (`no`, `aID`, `agent_name`, `district`, `sector`) VALUES
(19, 75, 'MUJAWABERA Josee', 'Nyamagabe', 'Ubutwari');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `Date` datetime NOT NULL,
  `bID` int(255) NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `business_tin` int(9) NOT NULL,
  `business_mail` varchar(255) NOT NULL,
  `business_password` varchar(255) NOT NULL,
  `business_pin` int(255) NOT NULL,
  `business_type` varchar(255) NOT NULL,
  `balance` int(255) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `photo` varchar(255) NOT NULL,
  `approved_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`Date`, `bID`, `business_name`, `business_tin`, `business_mail`, `business_password`, `business_pin`, `business_type`, `balance`, `status`, `photo`, `approved_by`) VALUES
('2022-12-27 01:08:06', 11, 'IDA TECHNOLOGY', 120582059, 'ida@gmail.com', 'e7e158399a1fe6378cf2dcc1996b1848', 1748, 'others', 4100, 'Active', 'IMG_6505.JPG', 'N/A'),
('2023-01-28 09:34:12', 12, 'ENGEN RDA', 100800300, 'engen@gmail.com', 'e2a01a3c474b5068e68073afe5669468', 1496, 'gas', 800, 'Active', 'ENGEN.PNG', 'admin'),
('2022-12-22 01:32:16', 14, 'Quincallelie', 100999777, 'quin@gmail.com', '5524e1290a1549764984c32c23b06938', 8491, 'others', 300000, 'Active', 'NSHUTI.PNG', 'N/A'),
('2023-09-16 06:34:58', 55, 'SIMBA SuperMarket Ltd', 111189338, 'idtbusy@gmail.com', '1dc8ed480f98d79c8938a45efd7d759a', 9703, 'others', 10900, 'Inactive', 'SimbaLogo1.jpeg', 'admin'),
('2023-09-20 07:25:40', 56, 'Rubis Energy Rwanda', 102345698, 'rubis@gmail.com', '1dc8ed480f98d79c8938a45efd7d759a', 5125, 'gas', 0, 'Inactive', 'rubis.png', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `business_location`
--

CREATE TABLE `business_location` (
  `no` int(255) NOT NULL,
  `bID` int(255) NOT NULL,
  `business_tin` int(9) NOT NULL,
  `district` varchar(255) NOT NULL,
  `sector` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `business_location`
--

INSERT INTO `business_location` (`no`, `bID`, `business_tin`, `district`, `sector`) VALUES
(9, 55, 111189338, 'Gasabo', 'Kacyiru'),
(10, 56, 102345698, 'Gasabo', 'Kacyiru');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `created_at` datetime DEFAULT NULL,
  `cID` int(255) NOT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `client_tel` varchar(12) NOT NULL,
  `client_mail` varchar(25) NOT NULL,
  `client_balance` int(255) NOT NULL,
  `referral_agent` varchar(255) NOT NULL,
  `status` text DEFAULT NULL,
  `approve` text DEFAULT NULL,
  `client_pin` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`created_at`, `cID`, `client_id`, `client_name`, `client_tel`, `client_mail`, `client_balance`, `referral_agent`, `status`, `approve`, `client_pin`) VALUES
('2023-01-28 01:12:23', 20, '0000695191', 'MUKESHIMANA', '250788778999', 'idtbusy@gmail.com', 103000, '5931', 'active', 'Approved', 7965),
('2023-04-28 01:12:23', 21, '0000695192', 'MUGISHA', '25078855788', 'mugisha@gmail.com', 11000, '5931', 'active', 'Approved', 4325),
('2023-09-14 12:48:32', 22, '0000575321', 'MUGISHA EMMANUEL', 'Optional', 'idtbusy@gmail.com', 10000, '5931', 'active', 'Approved', 87843),
('2023-09-16 12:59:55', 23, '0000575322', 'INEZA Aliane', '250780012634', 'ireneudiane@gmail.com', 3000, '5931', 'active', 'Approved', 21701);

-- --------------------------------------------------------

--
-- Table structure for table `client_location`
--

CREATE TABLE `client_location` (
  `no` int(255) NOT NULL,
  `cID` int(255) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `sector` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_location`
--

INSERT INTO `client_location` (`no`, `cID`, `client_name`, `district`, `sector`) VALUES
(1, 22, 'MUGISHA EMMANUEL', 'Optional', 'Optional'),
(2, 23, 'INEZA Aliane', 'Gasabo', 'Kacyiru');

-- --------------------------------------------------------

--
-- Table structure for table `notification_all`
--

CREATE TABLE `notification_all` (
  `nID` int(255) NOT NULL,
  `date_sent` date NOT NULL,
  `time_sent` time NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `sender_id` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `action` varchar(25) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification_all`
--

INSERT INTO `notification_all` (`nID`, `date_sent`, `time_sent`, `receiver_id`, `sender_id`, `amount`, `action`, `status`) VALUES
(1, '2023-09-16', '00:00:00', '0000575321', '5931', '200', 'topup', 'read'),
(2, '2023-09-16', '00:00:00', '0000575321', '5931', '1000', 'topup', 'read'),
(44, '2023-09-16', '04:37:42', '0000575322', '5931', '1000', 'topup', 'unread'),
(45, '2023-09-16', '04:39:58', '0000575322', '5931', '1000', 'topup', 'unread'),
(46, '2023-09-16', '04:40:45', '0000575322', '5931', '2000', 'withdraw', 'unread'),
(47, '2023-09-17', '12:15:49', '111189338', '0000575321', '1000', 'payment', 'read'),
(48, '2023-09-17', '12:19:40', '111189338', '0000695191', '10000', 'payment', 'read'),
(49, '2023-09-17', '12:22:06', '111189338', '0000695192', '900', 'payment', 'unread'),
(50, '2023-09-17', '07:31:03', '5931', 'admin', '1000', 'recharge', 'read'),
(51, '2023-09-17', '07:32:48', '5931', 'admin', '1000', 'recharge', 'unread'),
(52, '2023-09-17', '10:46:03', '5931', 'admin', '10000', 'transfer', 'unread'),
(53, '2023-09-17', '10:47:35', '5931', 'admin', '10000', 'transfer', 'unread'),
(54, '2023-09-17', '10:54:55', '5931', 'admin', '50000', 'recharge', 'unread'),
(55, '2023-09-17', '11:08:43', '5931', 'admin', '10000', 'transfer', 'unread'),
(56, '2023-09-17', '11:38:14', '2703', 'admin', '10000', 'recharge', 'unread'),
(57, '2023-09-18', '01:39:34', '111189338', 'admin', '500', 'transfer', 'unread'),
(58, '2023-09-20', '06:55:07', '6133', 'admin', '1000', 'recharge', 'unread'),
(59, '2023-09-20', '07:21:52', '6133', 'admin', '1000', 'transfer', 'unread'),
(60, '2023-09-20', '07:31:05', '102345698', '0000695191', '3900', 'payment', 'unread'),
(61, '2023-09-20', '07:32:38', '102345698', '0000575321', '2000', 'payment', 'unread'),
(62, '2023-09-20', '07:32:42', '102345698', '0000575321', '2000', 'payment', 'unread'),
(63, '2023-09-20', '07:37:43', '102345698', 'admin', '7900', 'transfer', 'unread'),
(64, '2023-09-20', '07:40:26', '6133', 'admin', '100000', 'recharge', 'unread'),
(65, '2023-09-20', '07:44:14', '0000695191', '6133', '50000', 'topup', 'unread'),
(66, '2023-09-20', '07:44:17', '0000695191', '6133', '50000', 'topup', 'unread'),
(67, '2023-09-20', '08:05:15', '0000695191', '6133', '2000', 'topup', 'unread'),
(68, '2023-09-20', '08:09:35', '0000695191', '6133', '1000', 'topup', 'unread'),
(69, '2023-09-24', '11:49:49', '0000575321', '6133', '1000', 'topup', 'unread');

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `no` int(255) NOT NULL,
  `rdate` date DEFAULT NULL,
  `rtime` time NOT NULL,
  `rID` int(9) NOT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `amount` int(255) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`no`, `rdate`, `rtime`, `rID`, `client_id`, `client_name`, `amount`, `action`, `status`) VALUES
(2, '2023-09-17', '12:15:49', 111189338, '0000575321', 'MUGISHA EMMANUEL', 1000, 'paid', 'approved'),
(3, '2023-09-17', '12:19:40', 111189338, '0000695191', 'MUKESHIMANA', 10000, 'paid', 'approved'),
(4, '2023-09-17', '12:22:06', 111189338, '0000695192', 'MUGISHA', 900, 'paid', 'approved'),
(5, '2023-09-20', '07:31:05', 102345698, '0000695191', 'MUKESHIMANA', 3900, 'paid', 'approved'),
(6, '2023-09-20', '07:32:38', 102345698, '0000575321', 'MUGISHA', 2000, 'paid', 'approved'),
(7, '2023-09-20', '07:32:42', 102345698, '0000575321', 'MUGISHA', 2000, 'paid', 'approved'),
(8, '2023-09-20', '08:05:15', 6133, '0000695191', 'MUKESHIMANA', NULL, 'topup', 'approved'),
(9, '2023-09-20', '08:09:35', 6133, '0000695191', 'MUKESHIMANA', NULL, 'topup', 'approved'),
(10, '2023-09-24', '11:49:49', 6133, '0000575321', 'MUGISHA EMMANUEL', NULL, 'topup', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `reID` int(255) NOT NULL,
  `request_date` date NOT NULL,
  `request_time` time NOT NULL,
  `confirmed_date` date DEFAULT NULL,
  `confirmed_time` time DEFAULT NULL,
  `request_type` varchar(25) NOT NULL,
  `user_id` varchar(25) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `activation_key` varchar(25) NOT NULL,
  `status` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`reID`, `request_date`, `request_time`, `confirmed_date`, `confirmed_time`, `request_type`, `user_id`, `amount`, `activation_key`, `status`) VALUES
(1, '2023-09-17', '10:06:15', '2023-09-17', '11:08:43', 'withdraw', '5931', '10000', 'pIEGWMrsnb', 'confirmed'),
(2, '2023-09-18', '01:26:59', '2023-09-18', '01:39:34', 'withdraw', '111189338', '500', 'ZJO2cKS7Ft', 'confirmed'),
(3, '2023-09-20', '07:01:21', '2023-09-20', '07:21:52', 'withdraw', '6133', '1000', 'bKkGZedNwh', 'confirmed'),
(4, '2023-09-20', '07:35:46', '2023-09-20', '07:37:43', 'withdraw', '102345698', '7900', 'r6cDu1FVwz', 'confirmed');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_ID`);

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`aID`);

--
-- Indexes for table `agent_location`
--
ALTER TABLE `agent_location`
  ADD PRIMARY KEY (`no`),
  ADD KEY `aID` (`aID`),
  ADD KEY `aID_2` (`aID`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`bID`),
  ADD UNIQUE KEY `business_tin` (`business_tin`);

--
-- Indexes for table `business_location`
--
ALTER TABLE `business_location`
  ADD PRIMARY KEY (`no`),
  ADD KEY `bID` (`bID`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`cID`);

--
-- Indexes for table `client_location`
--
ALTER TABLE `client_location`
  ADD PRIMARY KEY (`no`),
  ADD KEY `cID` (`cID`);

--
-- Indexes for table `notification_all`
--
ALTER TABLE `notification_all`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`reID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_ID` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `aID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `agent_location`
--
ALTER TABLE `agent_location`
  MODIFY `no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `bID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `business_location`
--
ALTER TABLE `business_location`
  MODIFY `no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `cID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `client_location`
--
ALTER TABLE `client_location`
  MODIFY `no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notification_all`
--
ALTER TABLE `notification_all`
  MODIFY `nID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `reID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agent_location`
--
ALTER TABLE `agent_location`
  ADD CONSTRAINT `agent_location_ibfk_1` FOREIGN KEY (`aID`) REFERENCES `agent` (`aID`);

--
-- Constraints for table `business_location`
--
ALTER TABLE `business_location`
  ADD CONSTRAINT `business_location_ibfk_1` FOREIGN KEY (`bID`) REFERENCES `business` (`bID`);

--
-- Constraints for table `client_location`
--
ALTER TABLE `client_location`
  ADD CONSTRAINT `client_location_ibfk_1` FOREIGN KEY (`cID`) REFERENCES `client` (`cID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
