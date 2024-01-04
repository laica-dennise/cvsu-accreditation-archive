-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2024 at 07:58 PM
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
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `file_name`, `file_size`, `file_type`, `file_id`, `file_viewLink`, `file_downloadLink`, `file_owner`, `owner_email`, `file_directory`, `file_course`, `file_area`, `file_tags`, `upload_date`) VALUES
(171, 'TECHNICAL-EVALUATIONproper.docx', 93424, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '17iq53rpHu4eXjmOJ66_GbqPL50xRwAhm', 'https://docs.google.com/document/d/17iq53rpHu4eXjmOJ66_GbqPL50xRwAhm/edit?usp=drivesdk&ouid=101333192880725710175&rtpof=true&sd=true', 'https://drive.google.com/uc?id=17iq53rpHu4eXjmOJ66_GbqPL50xRwAhm&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'CAFENR', 'Bachelor of Science in Agriculture', '', '', '2018-01-03 17:42:08'),
(174, 'f1c03dbd67a6af703d8e25b2e1078750.png', 1970200, 'image/png', '', '', '', 'LAICA DENNISE MIRANDA', 'laicadennise.miranda@cvsu.edu.ph', 'CAFENR', 'Bachelor of Science in Agriculture', '', 'cat,,windows', '2024-01-04 18:03:40'),
(175, 'Revision-Sheet.docx', 31290, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '1nt2ZPwqCL9bwHAPVTAcWOXoJ8f1j3g0C', 'https://docs.google.com/document/d/1nt2ZPwqCL9bwHAPVTAcWOXoJ8f1j3g0C/edit?usp=drivesdk&ouid=101333192880725710175&rtpof=true&sd=true', 'https://drive.google.com/uc?id=1nt2ZPwqCL9bwHAPVTAcWOXoJ8f1j3g0C&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'General', '', '', '', '2018-01-02 18:11:25'),
(176, '05-21-2023 ONLINE ARCHIVE SYSTEM OF ACCREDITATION FILES IN CAVITE STATE UNIVERSITY MAIN .docx', 2165785, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '1221C29MF6n1mNMWxgGZWunI5kPOr65Ua', 'https://docs.google.com/document/d/1221C29MF6n1mNMWxgGZWunI5kPOr65Ua/edit?usp=drivesdk&ouid=101333192880725710175&rtpof=true&sd=true', 'https://drive.google.com/uc?id=1221C29MF6n1mNMWxgGZWunI5kPOr65Ua&export=download', 'Laica Dennise Miranda', 'laicadennise.miranda@gmail.com', 'General', '', '', 'thesis', '2024-01-04 18:38:24');

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
(216, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-03 19:24:46', 'laicadennise.miranda@gmail.com has logged out from the system'),
(217, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 05:35:39', 'laicadennise.miranda@gmail.com has logged into the system'),
(218, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-04 05:55:35', 'File \'COLLEGE-COURSES.docx\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(219, 'laicadennise.miranda@gmail.com', 0, 'CAS', '2024-01-04 06:02:55', 'File \'Screenshot 2023-08-20 162119.png\' owned by \'Laica Dennise Miranda\' in \'CAS\' was deleted by \'laicadennise.miranda@gmail.com\''),
(220, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 06:03:51', 'laicadennise.miranda@gmail.com has uploaded a file: PobSet1_BSCS4-4_MIRANDA.pdf at CAS'),
(221, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 06:05:42', 'laicadennise.miranda@gmail.com has uploaded a file: Spiderjep.png at General'),
(222, 'laicadennise.miranda@gmail.com', 0, 'General', '2024-01-04 06:08:23', 'File \'0_0.jpg\' owned by \'Laica Dennise Miranda\' in \'General\' was deleted by \'laicadennise.miranda@gmail.com\''),
(223, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 06:09:28', 'laicadennise.miranda@gmail.com has uploaded a file: 279439063_3475440109365162_8337583866455949661_n.jpg at CEIT'),
(224, 'laicadennise.miranda@gmail.com', 0, 'CAS', '2024-01-04 06:09:48', 'File \'PobSet1_BSCS4-4_MIRANDA.pdf\' owned by \'Laica Dennise Miranda\' in \'CAS\' was deleted by \'laicadennise.miranda@gmail.com\''),
(225, 'laicadennise.miranda@gmail.com', 0, 'General', '2024-01-04 06:22:38', 'File \'344580511_1027307464897773_5447173843129030941_n.png\' owned by \'LAICA DENNISE MIRANDA\' in \'General\' was deleted by \'laicadennise.miranda@gmail.com\''),
(226, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-04 06:23:12', 'File \'IMG_20230302_211437.png\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(227, 'laicadennise.miranda@gmail.com', 0, 'General', '2024-01-04 06:24:32', 'File \'797355.jpg\' owned by \'Laica Dennise Miranda\' in \'General\' was deleted by \'laicadennise.miranda@gmail.com\''),
(228, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 06:24:52', 'laicadennise.miranda@gmail.com has logged out from the system'),
(229, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-04 06:25:16', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(230, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-04 06:25:38', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: Revision-Sheet.docx at General'),
(231, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-04 06:26:08', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: ebcbdb25171d1809.png at CAFENR'),
(232, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-04 06:26:55', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(233, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 06:27:01', 'laicadennise.miranda@gmail.com has logged into the system'),
(234, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-04 06:27:48', 'File \'ebcbdb25171d1809.png\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(235, 'laicadennise.miranda@gmail.com', 0, 'General', '2024-01-04 06:27:48', 'File \'Revision-Sheet.docx\' owned by \'LAICA DENNISE MIRANDA\' in \'General\' was deleted by \'laicadennise.miranda@gmail.com\''),
(236, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 06:28:35', 'laicadennise.miranda@gmail.com has logged out from the system'),
(237, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-04 06:28:54', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(238, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-04 06:29:31', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: 9211-catwaitwhat.png at CAFENR'),
(239, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-04 06:29:37', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(240, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 06:29:47', 'laicadennise.miranda@gmail.com has logged into the system'),
(241, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-04 06:30:33', 'File \'9211-catwaitwhat.png\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(242, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-04 06:32:25', 'File \'NBI-Clearance Reference Number.png\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(243, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 06:32:31', 'laicadennise.miranda@gmail.com has logged out from the system'),
(244, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-04 06:32:41', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(245, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-04 06:33:05', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: 05-21-2023 ONLINE ARCHIVE SYSTEM OF ACCREDITATION FILES IN CAVITE STATE UNIVERSITY MAIN .docx at General'),
(246, 'laicadennise.miranda@cvsu.edu.ph', 2, 'CAFENR', '2024-01-04 06:33:10', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(247, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 06:33:19', 'laicadennise.miranda@gmail.com has logged into the system'),
(248, 'laicadennise.miranda@gmail.com', 0, 'General', '2024-01-04 06:33:51', 'File \'05-21-2023 ONLINE ARCHIVE SYSTEM OF ACCREDITATION FILES IN CAVITE STATE UNIVERSITY MAIN .docx\' owned by \'LAICA DENNISE MIRANDA\' in \'General\' was deleted by \'laicadennise.miranda@gmail.com\''),
(249, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 06:35:53', 'laicadennise.miranda@gmail.com has logged out from the system'),
(250, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 06:36:47', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(251, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 06:37:10', 'File \'2x2.png\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(252, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 06:44:29', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: 05-21-2023 ONLINE ARCHIVE SYSTEM OF ACCREDITATION FILES IN CAVITE STATE UNIVERSITY MAIN  (1).docx at CAFENR'),
(253, 'laicadennise.miranda@cvsu.edu.ph', 0, 'General', '2024-01-04 06:44:45', 'File \'Spiderjep.png\' owned by \'Laica Dennise Miranda\' in \'General\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(254, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 06:48:14', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(255, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 06:48:26', 'laicadennise.miranda@gmail.com has logged into the system'),
(256, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-04 06:50:14', 'File \'05-21-2023 ONLINE ARCHIVE SYSTEM OF ACCREDITATION FILES IN CAVITE STATE UNIVERSITY MAIN  (1).docx\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(257, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 06:53:40', 'laicadennise.miranda@gmail.com has uploaded a file: signal-2023-06-15-152729_002.jpeg at CAFENR'),
(258, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 06:53:44', 'laicadennise.miranda@gmail.com has logged out from the system'),
(259, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 06:53:51', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(260, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 06:54:12', 'File \'signal-2023-06-15-152729_002.jpeg\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(261, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:06:59', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: Revision-Sheet.docx at CAFENR'),
(262, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:07:03', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(263, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 07:07:11', 'laicadennise.miranda@gmail.com has logged into the system'),
(264, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-04 07:07:41', 'File \'Revision-Sheet.docx\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(265, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 07:23:56', 'laicadennise.miranda@gmail.com has uploaded a file: 8509-peepohappygun.png at General'),
(266, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 07:24:03', 'laicadennise.miranda@gmail.com has logged out from the system'),
(267, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:24:11', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(268, 'laicadennise.miranda@cvsu.edu.ph', 0, 'General', '2024-01-04 07:24:32', 'File \'8509-peepohappygun.png\' owned by \'Laica Dennise Miranda\' in \'General\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(269, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CEIT', '2024-01-04 07:26:29', 'File \'279439063_3475440109365162_8337583866455949661_n.jpg\' owned by \'Laica Dennise Miranda\' in \'CEIT\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(270, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:28:41', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(271, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:28:58', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: IMG_20200829_132309.jpg at CAFENR'),
(272, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:29:07', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(273, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 07:29:21', 'laicadennise.miranda@gmail.com has logged into the system'),
(274, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-04 07:30:36', 'File \'TECHNICAL-EVALUATIONproper.docx\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(275, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-04 07:31:28', 'File \'IMG_20200829_132309.jpg\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(276, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 07:31:59', 'laicadennise.miranda@gmail.com has uploaded a file: NON-TECHNICAL-EVALUATIONproper.docx at General'),
(277, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 07:32:17', 'laicadennise.miranda@gmail.com has uploaded a file: Screenshot 2023-09-30 014043.png at General'),
(278, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 07:32:22', 'laicadennise.miranda@gmail.com has logged out from the system'),
(279, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:32:35', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(280, 'laicadennise.miranda@cvsu.edu.ph', 0, 'General', '2024-01-04 07:34:29', 'File \'NON-TECHNICAL-EVALUATIONproper.docx\' owned by \'Laica Dennise Miranda\' in \'General\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(281, 'laicadennise.miranda@cvsu.edu.ph', 0, 'General', '2024-01-04 07:35:57', 'File \'Screenshot 2023-09-30 014043.png\' owned by \'Laica Dennise Miranda\' in \'General\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(282, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:37:45', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: NON-TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(283, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:38:12', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: Screenshot 2023-09-30 014043.png at CAFENR'),
(284, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:38:16', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(285, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 07:38:22', 'laicadennise.miranda@gmail.com has logged into the system'),
(286, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-04 07:38:45', 'File \'NON-TECHNICAL-EVALUATIONproper.docx\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(287, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 07:40:29', 'laicadennise.miranda@gmail.com has logged out from the system'),
(288, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:40:37', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(289, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:40:55', 'File \'Screenshot 2023-09-30 014043.png\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(290, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:44:48', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: IMG_20200829_132309.jpg at CAFENR'),
(291, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:44:52', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(292, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 07:45:00', 'laicadennise.miranda@gmail.com has logged into the system'),
(293, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-04 07:45:40', 'File \'IMG_20200829_132309.jpg\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(294, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 07:46:35', 'laicadennise.miranda@gmail.com has uploaded a file: Authorization-Letter.pdf at CAFENR'),
(295, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 07:47:03', 'laicadennise.miranda@gmail.com has logged out from the system'),
(296, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:47:09', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(297, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 07:47:28', 'File \'Authorization-Letter.pdf\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(298, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 08:49:05', 'laicadennise.miranda@gmail.com has logged into the system'),
(299, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 09:04:08', 'laicadennise.miranda@gmail.com has added the user: testt@gmail.com to the database'),
(300, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 09:04:18', 'laicadennise.miranda@gmail.com has changed the info of user: '),
(301, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 09:04:27', 'laicadennise.miranda@gmail.com has changed the info of user: '),
(302, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 09:04:52', 'laicadennise.miranda@gmail.com has changed the info of user: '),
(303, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 09:04:56', 'laicadennise.miranda@gmail.com has changed the info of user: '),
(304, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 09:10:59', 'laicadennise.miranda@gmail.com has changed the info of user: testt@gmail.com');
INSERT INTO `logs` (`id`, `email`, `user_level`, `college`, `time`, `activity`) VALUES
(305, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 09:11:35', 'laicadennise.miranda@gmail.com has uploaded a file: 05-21-2023 ONLINE ARCHIVE SYSTEM OF ACCREDITATION FILES IN CAVITE STATE UNIVERSITY MAIN  (1).docx at General'),
(306, 'laicadennise.miranda@gmail.com', 0, 'General', '2024-01-04 09:14:18', 'File \'05-21-2023 ONLINE ARCHIVE SYSTEM OF ACCREDITATION FILES IN CAVITE STATE UNIVERSITY MAIN  (1).docx\' owned by \'Laica Dennise Miranda\' in \'General\' was deleted by \'laicadennise.miranda@gmail.com\''),
(307, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 09:15:35', 'laicadennise.miranda@gmail.com has changed the info of user: testt@gmail.com'),
(308, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 09:15:44', 'laicadennise.miranda@gmail.com has changed the info of user: testt@gmail.com'),
(309, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 09:18:53', 'laicadennise.miranda@gmail.com has logged out from the system'),
(310, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 15:41:10', 'laicadennise.miranda@gmail.com has logged into the system'),
(311, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:23:15', 'laicadennise.miranda@gmail.com has uploaded a file: Authorization-Letter.pdf at General'),
(312, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:23:21', 'laicadennise.miranda@gmail.com has logged out from the system'),
(313, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 16:23:47', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(314, 'laicadennise.miranda@cvsu.edu.ph', 0, 'General', '2024-01-04 16:24:32', 'File \'Authorization-Letter.pdf\' owned by \'Laica Dennise Miranda\' in \'General\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(315, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 16:28:00', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(316, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 16:28:04', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(317, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:28:12', 'laicadennise.miranda@gmail.com has logged into the system'),
(318, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-04 16:29:09', 'File \'TECHNICAL-EVALUATIONproper.docx\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(319, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:41:50', 'laicadennise.miranda@gmail.com has added the user: purpleden120@gmail.com to the database'),
(320, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:41:55', 'laicadennise.miranda@gmail.com has logged out from the system'),
(321, 'purpleden120@gmail.com', 1, '', '2024-01-04 16:42:18', 'purpleden120@gmail.com has logged into the system'),
(322, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:52:13', 'laicadennise.miranda@gmail.com has logged into the system'),
(323, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:52:48', 'laicadennise.miranda@gmail.com has logged into the system'),
(324, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:52:56', 'laicadennise.miranda@gmail.com has logged out from the system'),
(325, 'purpleden120@gmail.com', 1, '', '2024-01-04 16:53:08', 'purpleden120@gmail.com has logged into the system'),
(326, 'purpleden120@gmail.com', 1, '', '2024-01-04 16:53:12', 'purpleden120@gmail.com has logged out from the system'),
(327, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:54:25', 'laicadennise.miranda@gmail.com has logged into the system'),
(328, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:56:20', 'laicadennise.miranda@gmail.com has uploaded a file: IMG_20200829_132309.jpg at CAFENR'),
(329, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:56:25', 'laicadennise.miranda@gmail.com has logged out from the system'),
(330, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 16:56:31', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(331, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 16:56:55', 'File \'IMG_20200829_132309.jpg\' owned by \'Laica Dennise Miranda\' in \'CAFENR\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(332, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 16:58:14', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(333, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 16:58:36', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: 8509-peepohappygun.png at CAFENR'),
(334, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 16:58:56', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: 349254670_3189896371310774_2540417281485182667_n.jpg at CAFENR'),
(335, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 16:59:02', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(336, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:59:08', 'laicadennise.miranda@gmail.com has logged into the system'),
(337, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:59:15', 'laicadennise.miranda@gmail.com has changed the info of user: purpleden120@gmail.com'),
(338, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:59:21', 'laicadennise.miranda@gmail.com has changed the info of user: purpleden120@gmail.com'),
(339, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:59:30', 'laicadennise.miranda@gmail.com has changed the info of user: purpleden120@gmail.com'),
(340, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 16:59:32', 'laicadennise.miranda@gmail.com has deleted a user from the database'),
(341, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-04 17:00:02', 'File \'8509-peepohappygun.png\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(342, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-04 17:01:16', 'File \'349254670_3189896371310774_2540417281485182667_n.jpg\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(343, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 17:34:07', 'laicadennise.miranda@gmail.com has logged out from the system'),
(344, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 17:34:13', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(345, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 17:34:46', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(346, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 17:35:06', 'laicadennise.miranda@gmail.com has logged into the system'),
(347, 'laicadennise.miranda@gmail.com', 0, 'CAFENR', '2024-01-04 17:37:39', 'File \'TECHNICAL-EVALUATIONproper.docx\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@gmail.com\''),
(348, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 17:42:08', 'laicadennise.miranda@gmail.com has uploaded a file: TECHNICAL-EVALUATIONproper.docx at CAFENR'),
(349, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 17:43:11', 'laicadennise.miranda@gmail.com has logged out from the system'),
(350, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 17:43:28', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(351, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 17:43:48', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(352, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 17:43:55', 'laicadennise.miranda@gmail.com has logged into the system'),
(353, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 17:45:05', 'laicadennise.miranda@gmail.com has logged out from the system'),
(354, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 17:45:30', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(355, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 17:49:20', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: Pre-registration Form.docx.pdf at CAFENR'),
(356, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 17:51:29', 'File \'Pre-registration Form.docx.pdf\' owned by \'LAICA DENNISE MIRANDA\' in \'CAFENR\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(357, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 17:52:46', 'laicadennise.miranda@cvsu.edu.ph has changed the info of user: testt@gmail.com'),
(358, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 17:52:58', 'laicadennise.miranda@cvsu.edu.ph has changed the info of user: testt@gmail.com'),
(359, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 17:53:26', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: COLLEGE-COURSES.docx at General'),
(360, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 18:03:40', 'laicadennise.miranda@cvsu.edu.ph has uploaded a file: f1c03dbd67a6af703d8e25b2e1078750.png at CAFENR'),
(361, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 18:10:32', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(362, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 18:10:41', 'laicadennise.miranda@gmail.com has logged into the system'),
(363, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 18:11:25', 'laicadennise.miranda@gmail.com has uploaded a file: Revision-Sheet.docx at General'),
(364, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 18:11:55', 'laicadennise.miranda@gmail.com has logged out from the system'),
(365, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 18:12:02', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(366, 'laicadennise.miranda@cvsu.edu.ph', 0, 'General', '2024-01-04 18:13:01', 'File \'COLLEGE-COURSES.docx\' owned by \'LAICA DENNISE MIRANDA\' in \'General\' was deleted by \'laicadennise.miranda@cvsu.edu.ph\''),
(367, 'laicadennise.miranda@cvsu.edu.ph', 0, 'CAFENR', '2024-01-04 18:13:47', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(368, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 18:13:59', 'laicadennise.miranda@gmail.com has logged into the system'),
(369, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 18:15:37', 'laicadennise.miranda@gmail.com has changed the info of user: laicadennise.miranda@cvsu.edu.ph'),
(370, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 18:16:51', 'laicadennise.miranda@gmail.com has logged out from the system'),
(371, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 18:22:37', 'laicadennise.miranda@gmail.com has logged into the system'),
(372, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 18:23:00', 'laicadennise.miranda@gmail.com has logged out from the system'),
(373, 'laicadennise.miranda@cvsu.edu.ph', 3, 'CAFENR', '2024-01-04 18:23:06', 'laicadennise.miranda@cvsu.edu.ph has logged into the system'),
(374, 'laicadennise.miranda@cvsu.edu.ph', 3, 'CAFENR', '2024-01-04 18:35:09', 'laicadennise.miranda@cvsu.edu.ph has logged out from the system'),
(375, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 18:35:17', 'laicadennise.miranda@gmail.com has logged into the system'),
(376, 'laicadennise.miranda@gmail.com', 0, 'CEIT', '2024-01-04 18:38:24', 'laicadennise.miranda@gmail.com has uploaded a file: 05-21-2023 ONLINE ARCHIVE SYSTEM OF ACCREDITATION FILES IN CAVITE STATE UNIVERSITY MAIN .docx at General');

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
  `active_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `oauth_uid`, `first_name`, `last_name`, `email`, `profile_pic`, `user_level`, `local`, `college`, `active_status`) VALUES
(2, '102958130049128401532', 'LAICA DENNISE', 'MIRANDA', 'laicadennise.miranda@cvsu.edu.ph', '', 3, 'https://lh3.googleus', 'CAFENR', 'offline'),
(3, '101333192880725710175', 'Laica Dennise', 'Miranda', 'laicadennise.miranda@gmail.com', '', 0, 'https://lh3.googleus', 'CEIT', 'online'),
(23, '', 'Test', 'User', 'testt@gmail.com', '', 2, NULL, 'CAS', '');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=377;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
