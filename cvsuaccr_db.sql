-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2024 at 09:37 PM
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

--
-- Dumping data for table `access_request`
--

INSERT INTO `access_request` (`id`, `first_name`, `last_name`, `email`, `gender`, `birthdate`, `user_level`, `college`, `request_date`) VALUES
(29, 'Test', 'User', 'testt@gmail.com', 'Male', '2024-01-04', '2', ' ', '2024-01-03 18:39:01');

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
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `file_name`, `file_size`, `file_type`, `file_id`, `file_viewLink`, `file_downloadLink`, `file_owner`, `owner_email`, `file_directory`, `file_course`, `file_area`, `file_tags`, `upload_date`) VALUES
(130, 'TECHNICAL-EVALUATIONproper.docx', 93424, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '1cme5nj6A_TPfr4qBBC3dvCZf-8K9Ln4x', 'https://docs.google.com/document/d/1cme5nj6A_TPfr4qBBC3dvCZf-8K9Ln4x/edit?usp=drivesdk&ouid=101333192880725710175&rtpof=true&sd=true', 'https://drive.google.com/uc?id=1cme5nj6A_TPfr4qBBC3dvCZf-8K9Ln4x&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CAFENR', 'Bachelor of Science in Agriculture', '', '', '2024-01-03 07:17:05'),
(132, 'COLLEGE-COURSES.docx', 16177, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '1xxAt-4Q8AucHeqwuaTywiA70Vw_BfYm8', 'https://docs.google.com/document/d/1xxAt-4Q8AucHeqwuaTywiA70Vw_BfYm8/edit?usp=drivesdk&ouid=101333192880725710175&rtpof=true&sd=true', 'https://drive.google.com/uc?id=1xxAt-4Q8AucHeqwuaTywiA70Vw_BfYm8&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CAFENR', 'Bachelor of Science in Agriculture', '', '', '2024-01-03 07:31:58'),
(133, '2x2.png', 398283, 'image/png', '12t1s8-jPUSthLu4FZQu963Cw20_WyfqX', 'https://drive.google.com/file/d/12t1s8-jPUSthLu4FZQu963Cw20_WyfqX/view?usp=drivesdk', 'https://drive.google.com/uc?id=12t1s8-jPUSthLu4FZQu963Cw20_WyfqX&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CAFENR', 'Bachelor of Science in Agriculture', '', '', '2024-01-03 07:35:05'),
(136, 'NBI-Clearance Reference Number.png', 12954, 'image/png', '1NLosyIkicWWryPCmtVikZAcLstv-eb2d', 'https://drive.google.com/file/d/1NLosyIkicWWryPCmtVikZAcLstv-eb2d/view?usp=drivesdk', 'https://drive.google.com/uc?id=1NLosyIkicWWryPCmtVikZAcLstv-eb2d&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CAFENR', 'Bachelor of Science in Agriculture', '', '', '2024-01-03 14:25:57'),
(137, 'Screenshot 2023-08-20 162119.png', 13766, 'image/png', '1FggaHBERaw95OBfwYDcmnCPjS7VICF4d', 'https://drive.google.com/file/d/1FggaHBERaw95OBfwYDcmnCPjS7VICF4d/view?usp=drivesdk', 'https://drive.google.com/uc?id=1FggaHBERaw95OBfwYDcmnCPjS7VICF4d&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CAS', 'Bachelor of Science in Biology', '', '', '2018-01-03 14:26:28'),
(140, 'IMG_20230302_211437.png', 448613, 'image/png', '17BZc0T4jJaEi1DfX9Q2RqSFm18jiuS3C', 'https://drive.google.com/file/d/17BZc0T4jJaEi1DfX9Q2RqSFm18jiuS3C/view?usp=drivesdk', 'https://drive.google.com/uc?id=17BZc0T4jJaEi1DfX9Q2RqSFm18jiuS3C&export=download', 'LAICA DENNISE MIRANDA', 'laicadennise.miranda@cvsu.edu.ph', 'CAFENR', 'Bachelor of Science in Agriculture', '', '', '2018-01-03 14:46:07'),
(142, '344580511_1027307464897773_5447173843129030941_n.png', 67937, 'image/png', '1L7hOhq7_X2Bz6HoxC0F0cdvzAIIN8Zrt', 'https://drive.google.com/file/d/1L7hOhq7_X2Bz6HoxC0F0cdvzAIIN8Zrt/view?usp=drivesdk', 'https://drive.google.com/uc?id=1L7hOhq7_X2Bz6HoxC0F0cdvzAIIN8Zrt&export=download', 'LAICA DENNISE MIRANDA', 'laicadennise.miranda@cvsu.edu.ph', 'General', '', '', '', '2024-01-03 18:12:28'),
(143, '797355.jpg', 100611, 'image/jpeg', '1_y8PYoQPJB67AP6idTq0l2oGO3-GtdR5', 'https://drive.google.com/file/d/1_y8PYoQPJB67AP6idTq0l2oGO3-GtdR5/view?usp=drivesdk', 'https://drive.google.com/uc?id=1_y8PYoQPJB67AP6idTq0l2oGO3-GtdR5&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'General', '', 'Area 1', 'duck', '2024-01-03 18:22:01'),
(144, '0_0.jpg', 49647, 'image/jpeg', '1yU1Tf36659Jz3PZ3mei-qvt8tfKShhhr', 'https://drive.google.com/file/d/1yU1Tf36659Jz3PZ3mei-qvt8tfKShhhr/view?usp=drivesdk', 'https://drive.google.com/uc?id=1yU1Tf36659Jz3PZ3mei-qvt8tfKShhhr&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'General', '', '', '', '2024-01-03 18:27:07');

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
(3, 'williamdave.agravante@cvsu.edu.ph', 1, 'CAS', '2023-12-17 16:46:21', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(4, 'williamdave.agravante@cvsu.edu.ph', 1, 'Unknown', '2023-12-17 16:48:18', 'williamdave.agravante@cvsu.edu.ph has logged out from the system'),
(5, 'williamdave.agravante@cvsu.edu.ph', 1, 'CAS', '2023-12-17 16:48:40', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(6, 'williamdave.agravante@cvsu.edu.ph', 1, 'Unknown', '2023-12-17 16:49:56', 'williamdave.agravante@cvsu.edu.ph has logged out from the system'),
(7, 'williamdave.agravante@cvsu.edu.ph', 1, 'CAS', '2023-12-17 16:54:46', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(8, 'williamdave.agravante@cvsu.edu.ph', 1, 'CAS', '2023-12-17 16:55:07', 'williamdave.agravante@cvsu.edu.ph has logged out from the system'),
(9, 'williamdave.agravante@cvsu.edu.ph', 1, 'CAS', '2023-12-17 17:00:58', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(10, 'aeioudreyahlenn.bingcan@cvsu.edu.ph', 0, '', '2023-12-17 17:05:51', 'aeioudreyahlenn.bingcan@cvsu.edu.ph has logged into the system'),
(11, 'aeioudreyahlenn.bingcan@cvsu.edu.ph', 3, 'CEMDS', '2023-12-17 17:07:13', 'aeioudreyahlenn.bingcan@cvsu.edu.ph has logged into the system'),
(12, 'aeioudreyahlenn.bingcan@cvsu.edu.ph', 3, 'CEMDS', '2023-12-17 17:10:14', 'aeioudreyahlenn.bingcan@cvsu.edu.ph has logged into the system'),
(13, 'aeioudreyahlenn.bingcan@cvsu.edu.ph', 3, 'CEMDS', '2023-12-17 17:12:32', 'aeioudreyahlenn.bingcan@cvsu.edu.ph has logged into the system'),
(14, 'williamdave.agravante@cvsu.edu.ph', 1, 'CAS', '2023-12-17 17:46:51', 'williamdave.agravante@cvsu.edu.ph has logged out from the system'),
(15, 'williamdave.agravante@cvsu.edu.ph', 1, 'CAS', '2023-12-18 03:38:47', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(16, 'williamdave.agravante@cvsu.edu.ph', 1, 'CAS', '2023-12-18 13:41:43', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(17, 'williamdave.agravante@cvsu.edu.ph', 1, 'CAS', '2023-12-19 01:00:22', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(18, 'williamdave.agravante@cvsu.edu.ph', 1, '', '2023-12-19 01:02:49', 'williamdave.agravante@cvsu.edu.ph has logged out from the system'),
(19, 'williamdave.agravante@cvsu.edu.ph', 2, '', '2023-12-19 01:03:12', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(20, 'williamdave.agravante@cvsu.edu.ph', 2, '', '2023-12-19 01:08:42', 'williamdave.agravante@cvsu.edu.ph has logged out from the system'),
(21, 'williamdave.agravante@cvsu.edu.ph', 2, '', '2023-12-19 01:10:09', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(22, 'williamdave.agravante@cvsu.edu.ph', 2, '', '2023-12-19 14:10:46', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(23, 'williamdave.agravante@cvsu.edu.ph', 2, '', '2023-12-19 15:12:20', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(24, 'williamdave.agravante@cvsu.edu.ph', 2, '', '2023-12-19 15:14:57', 'williamdave.agravante@cvsu.edu.ph has uploaded a file: ABSTRACT.pdf'),
(25, 'williamdave.agravante@cvsu.edu.ph', 2, '', '2023-12-19 15:19:08', 'williamdave.agravante@cvsu.edu.ph has uploaded a file: TLE-TechDraft-Exploratory-4 (1).pdf at CON'),
(26, 'williamdave.agravante@cvsu.edu.ph', 2, '', '2023-12-19 15:21:18', 'williamdave.agravante@cvsu.edu.ph has uploaded a file: Agravante_Graduation-Application.pdf at CVMBS'),
(27, 'williamdave.agravante@cvsu.edu.ph', 2, '', '2023-12-19 15:22:25', 'williamdave.agravante@cvsu.edu.ph has uploaded a file: Inventory_Management_System_.pdf at CSPEAR'),
(28, 'williamdave.agravante@cvsu.edu.ph', 2, '', '2023-12-19 15:48:23', 'williamdave.agravante@cvsu.edu.ph has uploaded a file: Agravante-checklist.pdf at CSPEAR'),
(29, 'williamdave.agravante@cvsu.edu.ph', 2, 'CSPEAR', '2023-12-19 15:49:15', 'File \'Agravante-checklist.pdf\' owned by \'William Dave Agravante\' in \'CSPEAR\' deleted by \'williamdave.agravante@cvsu.edu.ph\''),
(30, 'williamdave.agravante@cvsu.edu.ph', 2, '', '2023-12-19 16:01:37', 'williamdave.agravante@cvsu.edu.ph has logged out from the system'),
(31, 'williamdave.agravante@cvsu.edu.ph', 2, '', '2023-12-19 16:02:09', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(32, 'williamdave.agravante@cvsu.edu.ph', 2, '', '2023-12-19 16:03:36', 'williamdave.agravante@cvsu.edu.ph has logged out from the system'),
(33, 'williamdave.agravante@cvsu.edu.ph', 1, '', '2023-12-19 16:41:57', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(34, 'williamdave.agravante@cvsu.edu.ph', 1, '', '2023-12-19 17:00:56', 'williamdave.agravante@cvsu.edu.ph has logged out from the system'),
(35, 'williamdave.agravante@cvsu.edu.ph', 2, '', '2023-12-19 17:01:37', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(36, 'williamdave.agravante@cvsu.edu.ph', 2, '', '2023-12-19 17:03:56', 'williamdave.agravante@cvsu.edu.ph has logged out from the system'),
(37, 'williamdave.agravante@cvsu.edu.ph', 1, '', '2023-12-19 17:04:17', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(38, 'williamdave.agravante@cvsu.edu.ph', 1, '', '2023-12-19 17:04:36', 'williamdave.agravante@cvsu.edu.ph has logged out from the system'),
(39, 'williamdave.agravante@cvsu.edu.ph', 1, '', '2023-12-19 17:05:36', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(40, 'williamdave.agravante@cvsu.edu.ph', 1, '', '2023-12-19 17:30:16', 'williamdave.agravante@cvsu.edu.ph has uploaded a file: Agravante-checklist.pdf at CED'),
(41, 'williamdave.agravante@cvsu.edu.ph', 1, '', '2023-12-19 22:33:27', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(42, 'williamdave.agravante@cvsu.edu.ph', 1, '', '2023-12-20 15:42:27', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(43, 'williamdave.agravante@cvsu.edu.ph', 1, '', '2023-12-20 15:43:55', 'williamdave.agravante@cvsu.edu.ph has logged out from the system'),
(44, 'williamdave.agravante@cvsu.edu.ph', 1, '', '2023-12-20 15:44:26', 'williamdave.agravante@cvsu.edu.ph has logged out from the system'),
(45, 'williamdave.agravante@cvsu.edu.ph', 1, '', '2023-12-20 15:46:12', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(46, 'williamdave.agravante@cvsu.edu.ph', 1, '', '2023-12-20 15:51:13', 'williamdave.agravante@cvsu.edu.ph has uploaded a file: Agravante-checklist (1).pdf at CAFENR'),
(47, 'williamdave.agravante@cvsu.edu.ph', 1, '', '2023-12-20 16:00:17', 'williamdave.agravante@cvsu.edu.ph has logged out from the system'),
(48, 'williamdave.agravante@cvsu.edu.ph', 1, 'CAFENR', '2023-12-20 16:01:13', 'williamdave.agravante@cvsu.edu.ph has logged out from the system'),
(49, 'williamdave.agravante@cvsu.edu.ph', 3, 'CAFENR', '2023-12-20 16:01:45', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(50, 'williamdave.agravante@cvsu.edu.ph', 3, 'CAFENR', '2023-12-20 16:34:02', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(51, 'williamdave.agravante@cvsu.edu.ph', 3, 'CAFENR', '2023-12-20 16:36:40', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(52, 'williamdave.agravante@cvsu.edu.ph', 3, 'CAFENR', '2023-12-20 16:42:47', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(53, 'williamdave.agravante@cvsu.edu.ph', 3, 'CAFENR', '2023-12-20 17:30:25', 'williamdave.agravante@cvsu.edu.ph has uploaded a file: Fishbone diagram worksheet - Color.png at CAFENR'),
(54, 'williamdave.agravante@cvsu.edu.ph', 3, 'CED', '2023-12-20 17:39:20', 'File \'Agravante-checklist.pdf\' owned by \'William Dave Agravante\' in \'CED\' deleted by \'williamdave.agravante@cvsu.edu.ph\''),
(55, 'williamdave.agravante@cvsu.edu.ph', 3, 'CAFENR', '2023-12-20 17:44:45', 'williamdave.agravante@cvsu.edu.ph has logged into the system'),
(56, 'williamdave.agravante@cvsu.edu.ph', 3, 'CAFENR', '2023-12-20 17:50:50', 'williamdave.agravante@cvsu.edu.ph has uploaded a file: Agravante-checklist.pdf at CAFENR'),
(57, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:13:18', 'laicadennise.miranda@gmail.com has logged into the system'),
(58, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:18:53', 'laicadennise.miranda@gmail.com has added the user: testuser@gmail.com to the database.'),
(59, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:23:18', 'laicadennise.miranda@gmail.com has added the user: test@gmail.com to the database'),
(60, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:24:59', 'laicadennise.miranda@gmail.com has added the user: test@gmail.com to the database'),
(61, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:26:01', 'laicadennise.miranda@gmail.com has uploaded a file: Pre-registration Form.docx.pdf at CAFENR'),
(62, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:26:47', 'File \'COLLEGE-COURSES.docx\' owned by \'Laica Dennise Miranda\' in \'CEIT\' was deleted by \'laicadennise.miranda@gmail.com\' .'),
(63, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:31:58', 'laicadennise.miranda@gmail.com has uploaded a file: IMG_20200829_132309.jpg at CAFENR'),
(64, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-01 15:32:34', 'File \'Pre-registration Form.docx.pdf\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(65, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:33:09', 'laicadennise.miranda@gmail.com has added the user: testt@gmail.com to the database'),
(66, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:33:22', 'laicadennise.miranda@gmail.com has deleted the user with ID: 18 from the database'),
(67, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:37:03', 'laicadennise.miranda@gmail.com has added the user: testing@gmail.com to the database'),
(68, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:40:51', 'laicadennise.miranda@gmail.com has deleted a user from the database'),
(69, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:42:48', 'laicadennise.miranda@gmail.com has added the user: abc@gmail.com to the database'),
(70, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:44:05', 'laicadennise.miranda@gmail.com has deleted a user from the database'),
(71, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:58:55', 'laicadennise.miranda@gmail.com has logged out from the system'),
(72, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:59:03', 'laicadennise.miranda@gmail.com has logged into the system'),
(73, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 15:59:06', 'laicadennise.miranda@gmail.com has logged out from the system'),
(74, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CEIT', '2024-01-01 16:00:20', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(75, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CEIT', '2024-01-01 16:08:47', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(76, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CEIT', '2024-01-01 16:18:45', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(77, 'laicadennise.miranda@cvsu.edu.ph', 3, 'CAFENR', '2024-01-01 16:19:16', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(78, 'laicadennise.miranda@cvsu.edu.ph', 3, 'CAFENR', '2024-01-01 16:29:39', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: IMG_20200829_132309.jpg at CAFENR'),
(79, 'laicadennise.miranda@cvsu.edu.ph', 3, 'CAFENR', '2024-01-01 16:37:44', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(80, 'laicadennise.miranda@cvsu.edu.ph', 3, 'CAFENR', '2024-01-01 16:38:12', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(81, 'laicadennise.miranda@cvsu.edu.ph', 3, 'CAFENR', '2024-01-01 16:40:50', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(82, 'laicadennise.miranda@cvsu.edu.ph', 1, 'CAFENR', '2024-01-01 16:41:08', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(83, 'laicadennise.miranda@cvsu.edu.ph', 1, 'CAFENR', '2024-01-01 16:41:28', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(84, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 17:27:51', 'laicadennise.miranda@gmail.com has logged into the system'),
(85, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 17:29:47', 'laicadennise.miranda@gmail.com has added the user: testuser@gmail.com to the database'),
(86, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 17:30:08', 'laicadennise.miranda@gmail.com has deleted a user from the database'),
(87, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 17:36:55', 'laicadennise.miranda@gmail.com has logged out from the system'),
(88, 'laicadennise.miranda@cvsu.edu.ph', 1, 'CAFENR', '2024-01-01 17:37:17', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(89, 'laicadennise.miranda@cvsu.edu.ph', 1, 'CAFENR', '2024-01-01 17:47:13', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(90, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 17:47:57', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(91, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 17:48:24', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(92, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 17:49:28', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(93, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 17:49:51', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: NON-TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(94, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 17:52:26', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(95, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 17:53:37', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: NON-TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(96, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 17:54:19', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: 410952229_668877278652072_4996126838385053421_n.jpg at CAFENR'),
(97, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 17:54:53', 'File \'IMG_20200829_132309.jpg\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(98, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 17:55:24', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(99, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 17:56:17', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(100, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 17:56:47', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: 410952229_668877278652072_4996126838385053421_n.jpg at CAFENR'),
(101, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 17:57:17', 'File \'TECHNICAL-EVALUATIONproper.docx\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(102, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 17:58:32', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: NON-TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(103, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 17:59:34', 'File \'410952229_668877278652072_4996126838385053421_n.jpg\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(104, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 18:00:46', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: 410952229_668877278652072_4996126838385053421_n.jpg at CAFENR'),
(105, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 18:01:03', 'File \'NON-TECHNICAL-EVALUATIONproper.docx\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(106, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 18:02:13', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: NON-TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(107, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 18:02:33', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(108, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 18:03:25', 'File \'NON-TECHNICAL-EVALUATIONproper.docx\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(109, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 18:04:00', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: 2x2.png at CAFENR'),
(110, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 18:04:18', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: Authorization-Letter.pdf at CAFENR'),
(111, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 18:04:33', 'File \'2x2.png\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(112, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 18:08:48', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(113, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 18:09:04', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: 410952229_668877278652072_4996126838385053421_n.jpg at CAFENR'),
(114, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 18:15:03', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: NON-TECHNICAL-EVALUATION.docx at CAFENR'),
(115, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 18:15:22', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: 2x2.png at CAFENR'),
(116, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 18:19:46', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: 410952229_668877278652072_4996126838385053421_n.jpg at CAS'),
(117, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-01 18:20:56', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(118, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 18:21:10', 'laicadennise.miranda@gmail.com has logged into the system'),
(119, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 18:22:59', 'laicadennise.miranda@gmail.com has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAS'),
(120, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 18:25:39', 'laicadennise.miranda@gmail.com has uploaded a file: NON-TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(121, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 18:27:33', 'laicadennise.miranda@gmail.com has added the user: test@gmail.com to the database'),
(122, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 18:27:38', 'laicadennise.miranda@gmail.com has deleted a user from the database'),
(123, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-01 18:28:36', 'laicadennise.miranda@gmail.com has logged out from the system'),
(124, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 00:27:50', 'laicadennise.miranda@gmail.com has logged into the system'),
(125, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 00:28:23', 'laicadennise.miranda@gmail.com has uploaded a file: IMG_20200829_132309.jpg at CAFENR'),
(126, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 00:29:03', 'File \'NON-TECHNICAL-EVALUATIONproper.docx\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(127, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 00:29:47', 'laicadennise.miranda@gmail.com has uploaded a file: NON-TECHNICAL-EVALUATIONproper.docx at CAS'),
(128, 'laicadennise.miranda@gmail.com', 0, 'CAS', '2024-01-03 00:30:12', 'File \'NON-TECHNICAL-EVALUATIONproper.docx\' owned by \'Laica Dennise Miranda\' in \'CAS\' was deleted by \'laicadennise.miranda@gmail.com\''),
(129, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 00:35:40', 'laicadennise.miranda@gmail.com has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(130, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 00:36:03', 'laicadennise.miranda@gmail.com has uploaded a file: COLLEGE-COURSES.docx at CAFENR'),
(131, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 00:37:17', 'File \'TECHNICAL-EVALUATIONproper.docx\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(132, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 00:39:12', 'laicadennise.miranda@gmail.com has uploaded a file: NON-TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(133, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 00:39:41', 'laicadennise.miranda@gmail.com has uploaded a file: COLLEGE-COURSES.docx at CAFENR'),
(134, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 00:40:01', 'File \'NON-TECHNICAL-EVALUATIONproper.docx\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(135, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 00:44:33', 'laicadennise.miranda@gmail.com has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(136, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 00:45:02', 'laicadennise.miranda@gmail.com has uploaded a file: IMG_20200829_132309.jpg at CAFENR'),
(137, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 00:45:51', 'File \'TECHNICAL-EVALUATIONproper.docx\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(138, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 00:54:40', 'laicadennise.miranda@gmail.com has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(139, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 00:55:51', 'laicadennise.miranda@gmail.com has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(140, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 00:56:27', 'laicadennise.miranda@gmail.com has uploaded a file: COLLEGE-COURSES.docx at CAFENR'),
(141, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 00:59:20', 'laicadennise.miranda@gmail.com has uploaded a file: Pre-registration Form.docx.pdf at CAFENR'),
(142, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 00:59:42', 'File \'COLLEGE-COURSES.docx\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(143, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 01:00:24', 'laicadennise.miranda@gmail.com has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(144, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 01:00:52', 'File \'Pre-registration Form.docx.pdf\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(145, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 01:01:27', 'laicadennise.miranda@gmail.com has uploaded a file: 2x2.png at CAFENR'),
(146, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 01:01:49', 'File \'TECHNICAL-EVALUATIONproper.docx\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(147, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 01:08:50', 'laicadennise.miranda@gmail.com has uploaded a file: IMG_20200829_132309.jpg at CAFENR'),
(148, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 01:14:56', 'laicadennise.miranda@gmail.com has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(149, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 01:27:24', 'laicadennise.miranda@gmail.com has logged out from the system'),
(150, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 01:27:31', 'laicadennise.miranda@gmail.com has logged into the system'),
(151, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 01:33:07', 'laicadennise.miranda@gmail.com has uploaded a file: COLLEGE-COURSES.docx at CAFENR'),
(152, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 01:33:30', 'File \'TECHNICAL-EVALUATIONproper.docx\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(153, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 01:35:16', 'laicadennise.miranda@gmail.com has logged into the system'),
(154, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 01:36:12', 'laicadennise.miranda@gmail.com has uploaded a file: IMG_20200829_132309.jpg at CAFENR'),
(155, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 01:36:35', 'File \'COLLEGE-COURSES.docx\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(156, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 01:39:22', 'laicadennise.miranda@gmail.com has uploaded a file: Pre-registration Form.docx.pdf at CAFENR'),
(157, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 01:42:16', 'File \'IMG_20200829_132309.jpg\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(158, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 01:42:59', 'laicadennise.miranda@gmail.com has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(159, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 02:02:28', 'File \'Pre-registration Form.docx.pdf\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(160, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 02:05:35', 'laicadennise.miranda@gmail.com has uploaded a file: Authorization-Letter.pdf at CAFENR'),
(161, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 02:06:00', 'File \'TECHNICAL-EVALUATIONproper.docx\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(162, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 02:07:07', 'laicadennise.miranda@gmail.com has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(163, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 02:07:23', 'File \'Authorization-Letter.pdf\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(164, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 02:08:24', 'laicadennise.miranda@gmail.com has uploaded a file: Authorization-Letter.pdf at CAFENR'),
(165, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 02:08:56', 'File \'TECHNICAL-EVALUATIONproper.docx\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(166, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 02:10:43', 'laicadennise.miranda@gmail.com has uploaded a file: NON-TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(167, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 02:11:55', 'File \'NON-TECHNICAL-EVALUATIONproper.docx\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(168, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 02:32:08', 'laicadennise.miranda@gmail.com has uploaded a file: REGISTRATION-FORM.pdf at CAFENR'),
(169, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 02:35:10', 'laicadennise.miranda@gmail.com has logged out from the system'),
(170, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 02:35:16', 'laicadennise.miranda@gmail.com has logged into the system'),
(171, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 03:22:01', 'File \'Authorization-Letter.pdf\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(172, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 07:16:33', 'laicadennise.miranda@gmail.com has logged into the system'),
(173, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 07:16:36', 'laicadennise.miranda@gmail.com has logged out from the system'),
(174, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 07:16:43', 'laicadennise.miranda@gmail.com has logged into the system'),
(175, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 07:17:05', 'laicadennise.miranda@gmail.com has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(176, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 07:21:57', 'File \'REGISTRATION-FORM.pdf\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(177, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 07:24:10', 'laicadennise.miranda@gmail.com has uploaded a file: IMG_20200829_132309.jpg at CAFENR'),
(178, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 07:31:09', 'File \'IMG_20200829_132309.jpg\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(179, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 07:31:58', 'laicadennise.miranda@gmail.com has uploaded a file: COLLEGE-COURSES.docx at CAFENR'),
(180, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 07:35:05', 'laicadennise.miranda@gmail.com has uploaded a file: 2x2.png at CAFENR'),
(181, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 08:12:12', 'laicadennise.miranda@gmail.com has logged out from the system'),
(182, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 08:12:34', 'laicadennise.miranda@gmail.com has logged into the system'),
(183, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 13:19:07', 'laicadennise.miranda@gmail.com has logged into the system'),
(184, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 14:20:58', 'laicadennise.miranda@gmail.com has logged into the system'),
(185, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 14:21:52', 'laicadennise.miranda@gmail.com has uploaded a file: 410952229_668877278652072_4996126838385053421_n.jpg at CAFENR'),
(186, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-03 14:23:07', 'File \'410952229_668877278652072_4996126838385053421_n.jpg\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(187, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 14:24:05', 'laicadennise.miranda@gmail.com has uploaded a file: IMG_20230801_174533.jpg at CAFENR'),
(188, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 14:25:57', 'laicadennise.miranda@gmail.com has uploaded a file: NBI-Clearance Reference Number.png at CAFENR'),
(189, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 14:26:28', 'laicadennise.miranda@gmail.com has uploaded a file: Screenshot 2023-08-20 162119.png at CAS'),
(190, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 14:30:44', 'laicadennise.miranda@gmail.com has logged out from the system'),
(191, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-03 14:32:39', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(192, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-03 14:33:12', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: TIN-ID-Miranda-Laica-Dennise.png at CAFENR'),
(193, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-03 14:40:37', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(194, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-03 14:40:46', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(195, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-03 14:42:16', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: f1c03dbd67a6af703d8e25b2e1078750.png at CAFENR'),
(196, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-03 14:45:38', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(197, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-03 14:46:07', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: IMG_20230302_211437.png at CAFENR'),
(198, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-03 16:31:25', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(199, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-03 16:42:04', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(200, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 16:42:17', 'laicadennise.miranda@gmail.com has logged into the system'),
(201, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 16:43:59', 'laicadennise.miranda@gmail.com has logged out from the system'),
(202, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-03 16:44:07', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(203, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-03 17:51:50', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(204, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-03 17:52:26', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(205, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 17:52:34', 'laicadennise.miranda@gmail.com has logged into the system'),
(206, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 17:55:16', 'laicadennise.miranda@gmail.com has logged out from the system'),
(207, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-03 17:55:25', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(208, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-03 18:04:13', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: 05-21-2023 ONLINE ARCHIVE SYSTEM OF ACCREDITATION FILES IN CAVITE STATE UNIVERSITY MAIN .docx at '),
(209, 'laicadennise.miranda@cvsu.edu.ph', 2, '', '2024-01-03 18:06:01', 'File \'05-21-2023 ONLINE ARCHIVE SYSTEM OF ACCREDITATION FILES IN CAVITE STATE UNIVERSITY MAIN .docx\' owned by \'LAICA DENNISE MIRANDA\' in \'\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(210, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-03 18:12:28', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: 344580511_1027307464897773_5447173843129030941_n.png at General'),
(211, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 18:19:37', 'laicadennise.miranda@gmail.com has logged into the system'),
(212, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 18:22:01', 'laicadennise.miranda@gmail.com has uploaded a file: 797355.jpg at General'),
(213, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 18:27:07', 'laicadennise.miranda@gmail.com has uploaded a file: 0_0.jpg at General'),
(214, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 18:38:30', 'laicadennise.miranda@gmail.com has logged out from the system'),
(215, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 18:39:20', 'laicadennise.miranda@gmail.com has logged into the system'),
(216, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 19:24:46', 'laicadennise.miranda@gmail.com has logged out from the system');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `oauth_uid` varchar(50) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `profile_pic` varchar(200) NOT NULL,
  `user_level` int(3) NOT NULL,
  `local` varchar(20) DEFAULT NULL,
  `college` varchar(50) NOT NULL,
  `active_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `oauth_uid`, `first_name`, `last_name`, `gender`, `birthdate`, `email`, `profile_pic`, `user_level`, `local`, `college`, `active_status`) VALUES
(2, '102958130049128401532', 'LAICA DENNISE', 'MIRANDA', 'Female', '2024-01-01', 'laicadennise.miranda@cvsu.edu.ph', '', 2, 'https://lh3.googleus', 'CAFENR', 'online'),
(3, '101333192880725710175', 'Laica Dennise', 'Miranda', 'Female', '2001-08-26', 'laicadennise.miranda@gmail.com', '', 0, 'https://lh3.googleus', 'CEIT', 'offline');

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
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `oauth_uid` (`oauth_uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_request`
--
ALTER TABLE `access_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
