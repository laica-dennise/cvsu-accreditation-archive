-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2023 at 01:53 PM
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
-- Database: `cvsuaccr_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_size` int(11) NOT NULL,
  `file_type` varchar(100) NOT NULL,
  `file_id` varchar(200) NOT NULL,
  `file_viewLink` varchar(200) NOT NULL,
  `file_downloadLink` varchar(200) NOT NULL,
  `file_owner` varchar(200) NOT NULL,
  `file_directory` varchar(100) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `file_name`, `file_size`, `file_type`, `file_id`, `file_viewLink`, `file_downloadLink`, `file_owner`, `file_directory`, `upload_date`) VALUES
(94, 'Authorization-Letter.pdf', 172546, 'application/pdf', '', '', '', 'LAICA DENNISE MIRANDA', '', '2023-10-12 12:25:30'),
(95, 'document.pdf', 59630, 'application/pdf', '', '', '', 'LAICA DENNISE MIRANDA', '', '2023-10-12 12:33:03'),
(96, 'Pre-registration Form.docx.pdf', 96775, 'application/pdf', '', '', '', 'LAICA DENNISE MIRANDA', '', '2023-10-12 12:41:59'),
(97, 'Authorization-Letter.pdf', 172546, 'application/pdf', '', '', '', 'LAICA DENNISE MIRANDA', '', '2023-10-12 12:44:10'),
(98, 'Screenshot 2023-09-30 014043.png', 86370, 'image/png', '', '', '', 'LAICA DENNISE MIRANDA', '', '2023-10-12 12:51:24'),
(99, 'Authorization-Letter.pdf', 172546, 'application/pdf', '', '', '', 'LAICA DENNISE MIRANDA', '', '2023-10-12 12:51:57'),
(100, 'Screenshot 2023-09-30 014043.png', 86370, 'image/png', '', '', '', 'LAICA DENNISE MIRANDA', '', '2023-10-12 12:59:13'),
(101, 'Authorization-Letter.pdf', 172546, 'application/pdf', '', '', '', 'LAICA DENNISE MIRANDA', '', '2023-10-12 13:32:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `oauth_uid` varchar(50) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `profile_pic` varchar(200) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `local` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `oauth_uid`, `first_name`, `last_name`, `email`, `profile_pic`, `gender`, `local`) VALUES
(2, '102958130049128401532', 'LAICA DENNISE', 'MIRANDA', 'laicadennise.miranda@cvsu.edu.ph', '', '', 'https://lh3.googleus'),
(3, '101333192880725710175', 'Laica Dennise', 'Miranda', 'laicadennise.miranda@gmail.com', '', '', 'https://lh3.googleus');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_owner` (`file_owner`) USING BTREE,
  ADD KEY `file_id` (`file_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `oauth_uid` (`oauth_uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
