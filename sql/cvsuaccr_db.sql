-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2024 at 08:58 AM
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
-- Table structure for table `access_request`
--

CREATE TABLE `access_request` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birthdate` date NOT NULL,
  `user_level` varchar(5) DEFAULT NULL,
  `college` varchar(80) DEFAULT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `owner_email` varchar(255) NOT NULL,
  `file_directory` varchar(100) NOT NULL,
  `file_course` varchar(255) NOT NULL,
  `file_area` varchar(50) NOT NULL,
  `file_tags` varchar(255) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `valid_until` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `file_name`, `file_size`, `file_type`, `file_id`, `file_viewLink`, `file_downloadLink`, `file_owner`, `owner_email`, `file_directory`, `file_course`, `file_area`, `file_tags`, `upload_date`, `valid_until`) VALUES
(1, 'Test File.pdf', 31443, 'application/pdf', '12Bw8RZSBeGgaK-oNxYju2hsrZeQfqs20', 'https://drive.google.com/file/d/12Bw8RZSBeGgaK-oNxYju2hsrZeQfqs20/view?usp=drivesdk', 'https://drive.google.com/uc?id=12Bw8RZSBeGgaK-oNxYju2hsrZeQfqs20&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CAFENR', 'Bachelor of Science in Agriculture', 'Area 1', 'test', '2024-01-06 06:59:44', '2024-01-13'),
(2, 'TECHNICAL-EVALUATIONproper.docx', 93424, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '1ER5zM99WIfO2DjhpGaQujNsgxVYGAYR5', 'https://docs.google.com/document/d/1ER5zM99WIfO2DjhpGaQujNsgxVYGAYR5/edit?usp=drivesdk&ouid=101333192880725710175&rtpof=true&sd=true', 'https://drive.google.com/uc?id=1ER5zM99WIfO2DjhpGaQujNsgxVYGAYR5&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'General', '', 'Area 4', '', '2024-01-06 07:01:18', '2024-01-13'),
(5, 'Test File for College of Medicine.docx', 12091, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '1xkAtQYSOkjOeZvgu5Z39UPKIEFrp5ikb', 'https://docs.google.com/document/d/1xkAtQYSOkjOeZvgu5Z39UPKIEFrp5ikb/edit?usp=drivesdk&ouid=102958130049128401532&rtpof=true&sd=true', 'https://drive.google.com/uc?id=1xkAtQYSOkjOeZvgu5Z39UPKIEFrp5ikb&export=download', 'LAICA DENNISE MIRANDA', 'laicadennise.miranda@cvsu.edu.ph', 'College of Medicine', '', 'Area 9', 'test', '2024-01-06 07:27:10', '2024-01-25'),
(6, 'Revision-Sheet.docx', 31290, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '1DTuK1j4k-pLo-N04en9_nOPUq8UBd9x1', 'https://docs.google.com/document/d/1DTuK1j4k-pLo-N04en9_nOPUq8UBd9x1/edit?usp=drivesdk&ouid=102958130049128401532&rtpof=true&sd=true', 'https://drive.google.com/uc?id=1DTuK1j4k-pLo-N04en9_nOPUq8UBd9x1&export=download', 'LAICA DENNISE MIRANDA', 'laicadennise.miranda@cvsu.edu.ph', 'CEIT', 'Bachelor of Science in Computer Science', 'Area 4', '', '2024-01-06 07:28:02', '2024-01-01'),
(7, 'Test File for CAS.pdf', 36252, 'application/pdf', '1z0HqfwSwM_qepLGZEC5bO15B8kXD2k-n', 'https://drive.google.com/file/d/1z0HqfwSwM_qepLGZEC5bO15B8kXD2k-n/view?usp=drivesdk', 'https://drive.google.com/uc?id=1z0HqfwSwM_qepLGZEC5bO15B8kXD2k-n&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CAS', 'Bachelor of Arts in English', 'Area 2', 'cas', '2024-01-06 07:30:36', '2024-01-18'),
(9, 'Test File for CCJ.pdf', 35405, 'application/pdf', '16vRo3wCMiROKCpHnwaXnt_bA51mWzudH', 'https://drive.google.com/file/d/16vRo3wCMiROKCpHnwaXnt_bA51mWzudH/view?usp=drivesdk', 'https://drive.google.com/uc?id=16vRo3wCMiROKCpHnwaXnt_bA51mWzudH&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CCJ', 'Bachelor of Science in Criminology', 'Area 6', '', '2024-01-06 07:35:54', '2024-01-11'),
(10, 'Test File for CED.pdf', 35660, 'application/pdf', '1fqm2dPPtLd41v8UQehwtkSPsEIaQjbAj', 'https://drive.google.com/file/d/1fqm2dPPtLd41v8UQehwtkSPsEIaQjbAj/view?usp=drivesdk', 'https://drive.google.com/uc?id=1fqm2dPPtLd41v8UQehwtkSPsEIaQjbAj&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CED', 'Bachelor of Secondary Education', 'Area 7', '', '2024-01-06 07:45:22', '2024-01-17'),
(12, 'Signed Form 1.png', 8917180, 'image/png', '', '', '', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CAFENR', 'Bachelor of Science in Agriculture', 'Area 7', '', '2024-01-06 07:49:58', '2024-01-09'),
(13, 'Test File for CEMDS.pdf', 36290, 'application/pdf', '140lQEmMpS_83jfNRlfs2PpxzPMM5CrfH', 'https://drive.google.com/file/d/140lQEmMpS_83jfNRlfs2PpxzPMM5CrfH/view?usp=drivesdk', 'https://drive.google.com/uc?id=140lQEmMpS_83jfNRlfs2PpxzPMM5CrfH&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CEMDS', 'Bachelor of Science in Development Management', 'Area 2', '', '2024-01-06 07:51:31', '2024-01-11'),
(14, 'Test File for CEIT.png', 5579, 'image/png', '1hXNeksya72IwNk7k1Y014QVEP643bvej', 'https://drive.google.com/file/d/1hXNeksya72IwNk7k1Y014QVEP643bvej/view?usp=drivesdk', 'https://drive.google.com/uc?id=1hXNeksya72IwNk7k1Y014QVEP643bvej&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CEIT', 'Bachelor of Science in Electrical Engineering', 'Area 1', '', '2024-01-06 07:52:35', '2024-01-16'),
(15, 'Test File for CON.jpg', 14442, 'image/jpeg', '1zCZk-7IyqgYwu0RwYcVcYfXzXecp-sKq', 'https://drive.google.com/file/d/1zCZk-7IyqgYwu0RwYcVcYfXzXecp-sKq/view?usp=drivesdk', 'https://drive.google.com/uc?id=1zCZk-7IyqgYwu0RwYcVcYfXzXecp-sKq&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CON', 'Bachelor of Science in Medical Technology', 'Area 4', '', '2024-01-06 07:53:11', '2023-10-11'),
(16, 'Test File for CSPEAR.pdf', 37644, 'application/pdf', '18wOr_ykp3SSc-3jZ62e9W5Xjb5Mdndbf', 'https://drive.google.com/file/d/18wOr_ykp3SSc-3jZ62e9W5Xjb5Mdndbf/view?usp=drivesdk', 'https://drive.google.com/uc?id=18wOr_ykp3SSc-3jZ62e9W5Xjb5Mdndbf&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CSPEAR', 'Bachelor in Sports and Recreational Management', 'Area 2', '', '2024-01-06 07:54:00', '2024-01-18'),
(17, 'Test File for CVMBS.docx', 12059, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '16ynIrvOnw_vfzQFhrCqp_22awOj-OCjQ', 'https://docs.google.com/document/d/16ynIrvOnw_vfzQFhrCqp_22awOj-OCjQ/edit?usp=drivesdk&ouid=101333192880725710175&rtpof=true&sd=true', 'https://drive.google.com/uc?id=16ynIrvOnw_vfzQFhrCqp_22awOj-OCjQ&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CVMBS', 'Bachelor of Science in Veterinary Technology', 'Area 8', '', '2024-01-06 07:54:34', '2024-01-14'),
(18, 'Test File for Grad School.pdf', 42217, 'application/pdf', '1Cl0Z3EpEl2mfcDTVyJ3eqaswta6uB8qT', 'https://drive.google.com/file/d/1Cl0Z3EpEl2mfcDTVyJ3eqaswta6uB8qT/view?usp=drivesdk', 'https://drive.google.com/uc?id=1Cl0Z3EpEl2mfcDTVyJ3eqaswta6uB8qT&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'Graduate School and Open Learning College', 'Master of Professional Studies', 'Area 1', '', '2024-01-06 07:55:18', '2028-06-22');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_level` int(11) NOT NULL,
  `college` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `activity` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `email`, `user_level`, `college`, `time`, `activity`) VALUES
(1, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 06:45:21', 'laicadennise.miranda@gmail.com has logged into the system'),
(2, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 06:46:22', 'laicadennise.miranda@gmail.com has deleted a user access request from the database'),
(3, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 06:46:26', 'laicadennise.miranda@gmail.com has logged out from the system'),
(4, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 06:47:56', 'laicadennise.miranda@gmail.com has logged into the system'),
(5, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 06:49:11', 'laicadennise.miranda@gmail.com has uploaded a file: Test File.pdf at CAFENR'),
(6, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 06:50:20', 'laicadennise.miranda@gmail.com has uploaded a file: document.pdf at General'),
(7, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-06 06:54:11', 'File \'Test File.pdf\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(8, 'laicadennise.miranda@gmail.com', 0, 'General', '2024-01-06 06:54:20', 'File \'document.pdf\' owned by \'Laica Dennise Miranda\' in \'General\' was deleted by \'laicadennise.miranda@gmail.com\''),
(9, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 06:54:45', 'laicadennise.miranda@gmail.com has deleted a user access request from the database'),
(10, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 06:55:08', 'laicadennise.miranda@gmail.com has logged out from the system'),
(11, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 06:56:02', 'laicadennise.miranda@gmail.com has logged into the system'),
(12, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 06:56:30', 'laicadennise.miranda@gmail.com has uploaded a file: Test File.pdf at General'),
(13, 'laicadennise.miranda@gmail.com', 0, 'General', '2024-01-06 06:56:48', 'File \'Test File.pdf\' owned by \'Laica Dennise Miranda\' in \'General\' was deleted by \'laicadennise.miranda@gmail.com\''),
(14, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 06:57:34', 'laicadennise.miranda@gmail.com has logged out from the system'),
(15, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 06:58:22', 'laicadennise.miranda@gmail.com has logged into the system'),
(16, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 06:59:44', 'laicadennise.miranda@gmail.com has uploaded a file: Test File.pdf at CAFENR'),
(17, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:01:18', 'laicadennise.miranda@gmail.com has uploaded a file: TECHNICAL-EVALUATIONproper.docx at General'),
(18, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:02:53', 'laicadennise.miranda@gmail.com has uploaded a file: NON-TECHNICAL-EVALUATION.docx at General'),
(19, 'laicadennise.miranda@gmail.com', 0, 'General', '2024-01-06 07:17:29', 'File \'NON-TECHNICAL-EVALUATION.docx\' owned by \'Laica Dennise Miranda\' in \'General\' was deleted by \'laicadennise.miranda@gmail.com\''),
(20, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:18:10', 'laicadennise.miranda@gmail.com has uploaded a file: NON-TECHNICAL-EVALUATION.docx at CEIT'),
(21, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:20:10', 'laicadennise.miranda@gmail.com has logged out from the system'),
(22, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:20:18', 'laicadennise.miranda@gmail.com has logged into the system'),
(23, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:20:25', 'laicadennise.miranda@gmail.com has logged out from the system'),
(24, 'laicadennise.miranda@cvsu.edu.ph', 0, '', '2024-01-06 07:20:48', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(25, 'laicadennise.miranda@cvsu.edu.ph', 0, '', '2024-01-06 07:27:10', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: Test File for College of Medicine.docx at College of Medicine'),
(26, 'laicadennise.miranda@cvsu.edu.ph', 0, '', '2024-01-06 07:28:02', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: Revision-Sheet.docx at CEIT'),
(27, 'laicadennise.miranda@cvsu.edu.ph', 0, '', '2024-01-06 07:28:35', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(28, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:29:36', 'laicadennise.miranda@gmail.com has logged into the system'),
(29, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:30:36', 'laicadennise.miranda@gmail.com has uploaded a file: Test File for CAS.pdf at CAS'),
(30, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:32:39', 'laicadennise.miranda@gmail.com has added the user: testuser@gmail.com to the database'),
(31, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:32:48', 'laicadennise.miranda@gmail.com has deleted a user from the database'),
(32, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-06 07:33:30', 'File \'NON-TECHNICAL-EVALUATION.docx\' owned by \'Laica Dennise Miranda\' in \'CEIT\' was deleted by \'laicadennise.miranda@gmail.com\''),
(33, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:34:59', 'laicadennise.miranda@gmail.com has uploaded a file: document.pdf at CAFENR'),
(34, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:35:54', 'laicadennise.miranda@gmail.com has uploaded a file: Test File for CCJ.pdf at CCJ'),
(35, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:42:36', 'laicadennise.miranda@gmail.com has logged out from the system'),
(36, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:43:45', 'laicadennise.miranda@gmail.com has logged into the system'),
(37, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:45:22', 'laicadennise.miranda@gmail.com has uploaded a file: Test File for CED.pdf at CED'),
(38, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-06 07:46:46', 'File \'document.pdf\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(39, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:47:27', 'laicadennise.miranda@gmail.com has uploaded a file: Authorization-Letter.pdf at CVMBS'),
(40, 'laicadennise.miranda@gmail.com', 0, 'CVMBS', '2024-01-06 07:48:01', 'File \'Authorization-Letter.pdf\' owned by \'Laica Dennise Miranda\' in \'CVMBS\' was deleted by \'laicadennise.miranda@gmail.com\''),
(41, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:48:28', 'laicadennise.miranda@gmail.com has added the user: testuser@gmail.com to the database'),
(42, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:48:34', 'laicadennise.miranda@gmail.com has deleted a user from the database'),
(43, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:48:38', 'laicadennise.miranda@gmail.com has deleted a user access request from the database'),
(44, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:49:58', 'laicadennise.miranda@gmail.com has uploaded a file: Signed Form 1.png at CAFENR'),
(45, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:51:31', 'laicadennise.miranda@gmail.com has uploaded a file: Test File for CEMDS.pdf at CEMDS'),
(46, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:52:35', 'laicadennise.miranda@gmail.com has uploaded a file: Test File for CEIT.png at CEIT'),
(47, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:53:11', 'laicadennise.miranda@gmail.com has uploaded a file: Test File for CON.jpg at CON'),
(48, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:54:00', 'laicadennise.miranda@gmail.com has uploaded a file: Test File for CSPEAR.pdf at CSPEAR'),
(49, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:54:34', 'laicadennise.miranda@gmail.com has uploaded a file: Test File for CVMBS.docx at CVMBS'),
(50, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:55:18', 'laicadennise.miranda@gmail.com has uploaded a file: Test File for Grad School.pdf at Graduate School and Open Learning College'),
(51, 'laicadennise.miranda@gmail.com', 0, '', '2024-01-06 07:56:41', 'laicadennise.miranda@gmail.com has logged out from the system');

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
  `user_level` int(3) NOT NULL,
  `local` varchar(20) DEFAULT NULL,
  `college` varchar(50) NOT NULL,
  `active_status` varchar(50) NOT NULL DEFAULT 'Offline'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `oauth_uid`, `first_name`, `last_name`, `email`, `profile_pic`, `user_level`, `local`, `college`, `active_status`) VALUES
(2, '102958130049128401532', 'LAICA DENNISE', 'MIRANDA', 'laicadennise.miranda@cvsu.edu.ph', '', 0, 'https://lh3.googleus', '', 'Offline'),
(3, '101333192880725710175', 'Laica Dennise', 'Miranda', 'laicadennise.miranda@gmail.com', '', 0, 'https://lh3.googleus', '', 'Offline');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_request`
--
ALTER TABLE `access_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_owner` (`file_owner`) USING BTREE,
  ADD KEY `file_id` (`file_id`) USING BTREE;

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_request`
--
ALTER TABLE `access_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
