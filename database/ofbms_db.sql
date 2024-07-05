-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1

-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";




--
-- Database: `ofbms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_uname` varchar(20) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_pwd` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_uname`, `admin_email`, `admin_pwd`) VALUES
(1, 'admin', 'admin@mail.com', '$2y$10$AFMhdlwEaWjj
BzoCfdq62uNQqopNGW4vk8GXrDBNGKPAgB0mON0TC');

-- --------------------------------------------------------

--
-- Table structure for table `airline`
--

CREATE TABLE `airline` (
  `airline_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airline`
--

INSERT INTO `airline` (`airline_id`, `name`, `seats`) VALUES
(1, 'AirAsia', 200),
(2, 'Qatar Airline', 350),
(3, 'Indigo', 180);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city`) VALUES
('Pune'),
('Kolkatta'),
('Delhi'),
('Bengaluru');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feed_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `q1` varchar(250) NOT NULL,
  `q2` varchar(20) NOT NULL,
  `q3` varchar(250) NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feed_id`, `email`, `q1`, `q2`, `q3`, `rate`) VALUES
(1, 'Kaveri@mail.com', 'Good.... ', 'Other', '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flight_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `arrivale` datetime NOT NULL,
  `departure` datetime NOT NULL,
  `Destination` varchar(20) NOT NULL,
  `source` varchar(20) NOT NULL,
  `airline` varchar(20) NOT NULL,
  `Seats` varchar(110) NOT NULL,
  `duration` varchar(20) NOT NULL,
  `Price` int(11) NOT NULL,
  `status` varchar(6) DEFAULT NULL,
  `issue` varchar(50) DEFAULT NULL,
  `last_seat` varchar(5) DEFAULT '',
  `bus_seats` int(11) DEFAULT 20,
  `last_bus_seat` varchar(5) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flight_id`, `admin_id`, `arrivale`, `departure`, `Destination`, `source`, `airline`, `Seats`, `duration`, `Price`, `status`, `issue`, `last_seat`, `bus_seats`, `last_bus_seat`) VALUES
(1, 1, '2022-11-22 07:00:00', '2022-11-22 06:00:00', 'Delhi', 'Bengaluru', 'AirAsia', '350', '1 Hour', 4500, '', '', '', 20, ''),
(2, 1, '2022-11-22 08:30:00', '2022-11-22 07:30:00', 'Kolkatta', 'Pune', 'Indigo', '171', '1 Hour', 3500, '', '', '22C', 20, ''),
(3, 1, '2022-11-21 16:00:00', '2022-11-21 15:00:00', 'Pune', 'Bengaluru', 'Qatar Airline', '350', '1 Hour', 4800, '', 'solved', '', 20, ''),
(4, 1, '2022-11-21 15:30:00', '2022-11-21 14:30:00', 'Pune', 'Kolkatta', 'Indigo', '195', '1 Hour', 3800, 'arr', '', '21E', 20, ''),
(5, 1, '2022-11-21 17:00:00', '2022-11-21 16:00:00', 'Delhi', 'Bengaluru', 'AirAsia', '192', '1 Hour', 2500, 'issue', '60', '22B', 20, ''),
(7, 1, '2022-11-22 19:00:00', '2022-11-22 18:00:00', 'Kolkatta', 'Delhi', 'Qatar Airline', '350', '1 Hour', 3800, '', '', '', 20, ''),
(9, 1, '2023-06-22 03:02:00', '2023-06-21 04:23:00', 'Delhi', 'Pune', 'AirAsia', '198', '2 hours ', 2000, '', '', '21B', 20, ''),
(10, 1, '2023-06-23 09:25:00', '2023-06-22 02:03:00', 'Kolkatta', 'Pune', 'Qatar Airline', '347', '2 hours ', 5000, '', '', '21C', 20, ''),
(11, 1, '2023-06-25 09:03:00', '2023-06-24 05:03:00', 'Kolkatta', 'Pune', 'AirAsia', '200', '2 hours ', 2000, '', '', '', 20, '');

-- --------------------------------------------------------

--
-- Table structure for table `passenger_profile`
--

CREATE TABLE `passenger_profile` (
  `passenger_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `mobile` varchar(110) NOT NULL,
  `dob` datetime NOT NULL,
  `f_name` varchar(20) DEFAULT NULL,
  `m_name` varchar(20) DEFAULT NULL,
  `l_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_profile`
--

INSERT INTO `passenger_profile` (`passenger_id`, `user_id`, `flight_id`, `mobile`, `dob`, `f_name`, `m_name`, `l_name`) VALUES
(1, 1, 5, '9123564789', '1997-06-23 00:00:00', 'Kaveri', 'B', 'Kadam'),
(2, 4, 2, '9123654789', '1997-06-23 00:00:00', 'Sushant', 'B', 'Iraj'),
(4, 3, 3, '9123564879', '1997-10-14 00:00:00', 'Rakesh', 'R', 'Mirje'),
(5, 2, 7, '9654123897', '1990-07-15 00:00:00', 'Prateek', 'K', 'Bastawade');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `card_no` varchar(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `expire_date` varchar(5) DEFAULT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`card_no`, `user_id`, `flight_id`, `expire_date`, `amount`) VALUES
('1234321211112222', 5, 5, '06/27', 2500),
('1234654456455', 5, 2, '06/27', 3500),
('4616182753905953', 5, 2, '06/27', 3500),
('4616182753905953', 5, 2, '06/27', 3500),
('4616182753905953', 5, 2, '06/27', 3500),
('4616182753905953', 5, 2, '06/27', 3500),
('4616182753905953', 5, 2, '06/27', 3500),
('111112333311', 5, 2, '01/25', 3500),
('111123655663', 6, 9, '9/202', 4000),
('123365447886', 6, 9, '8/202', 4000),
('123456789214', 7, 10, '6/202', 10000),
('123654789254', 7, 10, '06/28', 10000),
('1112223335556664', 7, 10, '06/20', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `pwdreset`
--

CREATE TABLE `pwdreset` (
  `pwd_reset_id` int(11) NOT NULL,
  `pwd_reset_email` varchar(50) NOT NULL,
  `pwd_reset_selector` varchar(80) NOT NULL,
  `pwd_reset_token` varchar(120) NOT NULL,
  `pwd_reset_expires` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pwdreset`
--

INSERT INTO `pwdreset` (`pwd_reset_id`, `pwd_reset_email`, `pwd_reset_selector`, `pwd_reset_token`, `pwd_reset_expires`) VALUES
(1, 'prateek@mail.com', '041475300a212fef', '$2y$10$Tc6l/VD0iJWz.MqtKjnA6es7z7rOSRVnG1LJFyr72j8uxwP9Dx1G.', '1687418373');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seat_no` varchar(10) NOT NULL,
  `cost` int(11) NOT NULL,
  `class` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `passenger_id`, `flight_id`, `user_id`, `seat_no`, `cost`, `class`) VALUES
(1, 1, 5, 2, '22A', 2500, 'E'),
(3, 1, 2, 3, '21A', 3500, 'E'),
(9, 3, 5, 4, '22B', 3500, 'E'),
(10, 5, 2, 5, '22C', 3500, 'E'),
(11, 1, 9, 6, '21A', 4000, 'E'),
(12, 1, 9, 6, '21B', 4000, 'E'),
(13, 1, 10, 7, '21A', 10000, 'E'),
(14, 1, 10, 7, '21B', 10000, 'E'),
(15, 1, 10, 7, '21C', 10000, 'E');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`) VALUES
(1, 'Kaveri', 'Kaveri@mail.com', '$2y$10$KRXGkY.dxYjD8FLZclW/Tu04wl76lD7IA4Z3nAsxtpdZxHNbYo4ZW'),
(2, 'Prateek', 'prateek@mail.com', '$2y$10$KRXGkY.dxYjD8FLZclW/Tu04wl76lD7IA4Z3nAsxtpdZxHNbYo4ZW'),
(3, 'Rakesh', 'rakesh@mail.com', '$2y$10$KRXGkY.dxYjD8FLZclW/Tu04wl76lD7IA4Z3nAsxtpdZxHNbYo4ZW'),
(4, 'Sushant', 'sushant@mail.com', '$2y$10$KRXGkY.dxYjD8FLZclW/Tu04wl76lD7IA4Z3nAsxtpdZxHNbYo4ZW'),
(5, 'Rushi', 'rushi@mail.com', '$2y$10$.FUiqi1YNqPBTxstbratouNEux7TsPPZ8/YOrV.Bd2JbVFD95G1nS'),
(6, 'Komal', 'komal@mail.com', '$2y$10$FnKfOayVXl.9LOU4FoFSUOGmJjz1Xma53heJIhsOupUQk9N7raqLK'),
(7, 'Abhi', 'abbhi@mail.com', '$2y$10$GkqNVZwepV50i2LBUOHhp.Uk87ZuGUzmD6/wiXCjP8MPnzrbng4rq'),
(8, 'supriya', 'supriya@mail.com', '$2y$10$0uCHiWubfjvyyxWuunvAWOH7FOzYWNi1zd6bOtVDFdnFBSUc6ghX6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`airline_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feed_id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flight_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `passenger_profile`
--
ALTER TABLE `passenger_profile`
  ADD PRIMARY KEY (`passenger_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `pwdreset`
--
ALTER TABLE `pwdreset`
  ADD PRIMARY KEY (`pwd_reset_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `flight_id` (`flight_id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `airline`
--
ALTER TABLE `airline`
  MODIFY `airline_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `passenger_profile`
--
ALTER TABLE `passenger_profile`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pwdreset`
--
ALTER TABLE `pwdreset`
  MODIFY `pwd_reset_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `passenger_profile`
--
ALTER TABLE `passenger_profile`
  ADD CONSTRAINT `passenger_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `passenger_profile_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
