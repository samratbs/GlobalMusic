-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2019 at 05:34 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `musicfestival`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent_info`
--

CREATE TABLE `agent_info` (
  `agent_id` int(11) NOT NULL,
  `agent_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agent_info`
--

INSERT INTO `agent_info` (`agent_id`, `agent_name`) VALUES
(5, 'Blackend'),
(6, 'BigHit'),
(7, 'Cara Lewis'),
(8, 'Peter Parker');

-- --------------------------------------------------------

--
-- Table structure for table `band_info`
--

CREATE TABLE `band_info` (
  `band_id` int(11) NOT NULL,
  `top_bands` varchar(255) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `concert_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `book_info`
--

CREATE TABLE `book_info` (
  `booking_id` int(11) NOT NULL,
  `ticket_booker` varchar(255) NOT NULL,
  `concert_id` int(11) NOT NULL,
  `ticket_type` varchar(15) NOT NULL,
  `tickets_bought` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `book_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paid_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `concert_info`
--

CREATE TABLE `concert_info` (
  `concert_id` int(11) NOT NULL,
  `concert_name` varchar(255) NOT NULL,
  `concert_venue` varchar(255) NOT NULL,
  `concert_createdby` varchar(255) NOT NULL,
  `ticketa_price` double NOT NULL,
  `ticketb_price` double NOT NULL,
  `ticketc_price` double NOT NULL,
  `sponsor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `concert_info`
--

INSERT INTO `concert_info` (`concert_id`, `concert_name`, `concert_venue`, `concert_createdby`, `ticketa_price`, `ticketb_price`, `ticketc_price`, `sponsor`) VALUES
(14, 'Popfesta', 'Popshala', 'org', 200, 300, 400, 'Coca Cola'),
(15, 'popfesta', 'popshala', 'org', 200, 300, 400, 'KFC');

-- --------------------------------------------------------

--
-- Table structure for table `concert_schedule`
--

CREATE TABLE `concert_schedule` (
  `schedule_id` int(11) NOT NULL,
  `concert_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(25) NOT NULL,
  `phoneno` varchar(15) NOT NULL,
  `creditno` varchar(50) NOT NULL,
  `account_type` varchar(10) NOT NULL,
  `web_address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`username`, `password`, `name`, `email`, `address`, `phoneno`, `creditno`, `account_type`, `web_address`) VALUES
('a', 'a', 'a', 'a@gmail.com', 'a', '99999999', 'a999', 'General', 'a'),
('abc', '123', 'samrat', 'tr', 'rqew', 'qwre', 'qwre', 'General', 'qwer'),
('asdf', 'asfdsadf', 'asf', 'fsd', 'dsf', '2342', 'sdf', 'General', '2dsfa'),
('cor', '123', 'corporate', 'asdasdasd', 'sdasdasd', '98467826727', '134245151324515', 'Corporate', 'waeawe13 .com'),
('gen', '123', 'gen', 'gen@gmail.com', 'UK-1', '31231243123', '412412412412', 'General', 'www.gen.com'),
('org', '123', 'Festival Organizer', 'organizer@gmail.com', 'Organizer Street ', '98419191919', '4444444444444444', 'Organizer', 'www.organizer.com'),
('qq', '12345', 'qqq', 'sfds@ytrty.bh', 'qq', '99898989898', 'rtsdf56', 'Organizer', 'qq'),
('test', '123', 'asd', 'asd', 'asd', '65543', '53252', 'General', '524');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent_info`
--
ALTER TABLE `agent_info`
  ADD PRIMARY KEY (`agent_id`);

--
-- Indexes for table `band_info`
--
ALTER TABLE `band_info`
  ADD PRIMARY KEY (`band_id`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `conid2` (`concert_id`);

--
-- Indexes for table `book_info`
--
ALTER TABLE `book_info`
  ADD PRIMARY KEY (`booking_id`),
  ADD UNIQUE KEY `unique` (`ticket_booker`,`concert_id`) USING BTREE,
  ADD KEY `conid` (`concert_id`);

--
-- Indexes for table `concert_info`
--
ALTER TABLE `concert_info`
  ADD PRIMARY KEY (`concert_id`);

--
-- Indexes for table `concert_schedule`
--
ALTER TABLE `concert_schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `conid3` (`concert_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agent_info`
--
ALTER TABLE `agent_info`
  MODIFY `agent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `band_info`
--
ALTER TABLE `band_info`
  MODIFY `band_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_info`
--
ALTER TABLE `book_info`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `concert_info`
--
ALTER TABLE `concert_info`
  MODIFY `concert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `concert_schedule`
--
ALTER TABLE `concert_schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `band_info`
--
ALTER TABLE `band_info`
  ADD CONSTRAINT `band_info_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agent_info` (`agent_id`),
  ADD CONSTRAINT `conid2` FOREIGN KEY (`concert_id`) REFERENCES `concert_info` (`concert_id`) ON DELETE CASCADE;

--
-- Constraints for table `book_info`
--
ALTER TABLE `book_info`
  ADD CONSTRAINT `conid` FOREIGN KEY (`concert_id`) REFERENCES `concert_info` (`concert_id`) ON DELETE CASCADE;

--
-- Constraints for table `concert_schedule`
--
ALTER TABLE `concert_schedule`
  ADD CONSTRAINT `conid3` FOREIGN KEY (`concert_id`) REFERENCES `concert_info` (`concert_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
