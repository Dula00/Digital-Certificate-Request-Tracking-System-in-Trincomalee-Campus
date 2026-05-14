-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2026 at 07:17 AM
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
-- Database: `universitydetails_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `role` enum('student','staff','registrar','admin') DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `role`, `title`, `message`, `is_read`, `created_at`) VALUES
(1, '3', 'student', NULL, 'Request Submitted! 🚀 Your request for \"Semester Result Sheet\" (#REQ-14) has been successfully submitted and is pending approval.', 0, '2026-03-18 10:50:59'),
(2, 'STAFF_GROUP', 'staff', NULL, 'New Request Received: Sahan Silva (EU/TR/2021/CS/15) has requested a Semester Result Sheet.', 0, '2026-03-18 10:50:59'),
(3, 'AR_GROUP', 'registrar', NULL, 'Action Required: New Semester Result Sheet request (#REQ-14) is waiting for your review.', 0, '2026-03-18 10:50:59'),
(4, '3', 'student', NULL, 'Request Submitted! 🚀 Your request for \"Semester Result Sheet\" (#REQ-15) has been successfully submitted and is pending approval.', 0, '2026-03-18 10:57:17'),
(5, 'STAFF_GROUP', 'staff', NULL, 'New Request Received: Sahan Silva (EU/TR/2021/CS/15) has requested a Semester Result Sheet.', 0, '2026-03-18 10:57:17'),
(6, 'AR_GROUP', 'registrar', NULL, 'Action Required: New Semester Result Sheet request (#REQ-15) is waiting for your review.', 0, '2026-03-18 10:57:17'),
(7, '3', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-16) has been successfully submitted and is pending approval.', 0, '2026-03-18 12:00:13'),
(8, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student Sahan Silva has requested a Degree Certificate.', 0, '2026-03-18 12:00:13'),
(9, 'AR_GROUP', 'registrar', 'Action Required', 'New Degree Certificate request (#REQ-16) needs review.', 0, '2026-03-18 12:00:13'),
(10, '3', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-17) has been successfully submitted and is pending approval.', 0, '2026-03-18 12:27:01'),
(11, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student Sahan Silva has requested a Semester Result Sheet.', 0, '2026-03-18 12:27:01'),
(12, 'AR_GROUP', 'registrar', 'Action Required', 'New Degree Certificate request (#REQ-17) needs review.', 0, '2026-03-18 12:27:01'),
(13, '3', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-18) has been successfully submitted and is pending approval.', 0, '2026-03-18 12:53:28'),
(14, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student Sahan Silva has requested a Semester Result Sheet.', 0, '2026-03-18 12:53:28'),
(15, 'AR_GROUP', 'registrar', 'Action Required', 'New Degree Certificate request (#REQ-18) needs review.', 0, '2026-03-18 12:53:28'),
(16, '3', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-19) has been successfully submitted and is pending approval.', 0, '2026-03-18 13:59:08'),
(17, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student Sahan Silva has requested a Degree Certificate.', 0, '2026-03-18 13:59:08'),
(18, 'AR_GROUP', 'registrar', 'Action Required', 'New Degree Certificate request (#REQ-19) needs review.', 0, '2026-03-18 13:59:08'),
(19, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-20) has been successfully submitted and is pending approval.', 1, '2026-03-18 19:51:48'),
(20, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika has requested a Degree Certificate.', 0, '2026-03-18 19:51:48'),
(21, 'AR_GROUP', 'registrar', 'Action Required', 'New Degree Certificate request (#REQ-20) needs review.', 0, '2026-03-18 19:51:48'),
(22, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-21) is pending.', 1, '2026-03-19 03:25:25'),
(23, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-19 03:25:25'),
(24, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-21 needs review.', 0, '2026-03-19 03:25:25'),
(25, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-22) is pending.', 1, '2026-03-19 03:48:46'),
(26, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-19 03:48:46'),
(27, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-22 needs review.', 0, '2026-03-19 03:48:46'),
(28, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-23) is pending.', 1, '2026-03-19 03:54:18'),
(29, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-19 03:54:18'),
(30, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-23 needs review.', 0, '2026-03-19 03:54:18'),
(31, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-24) is pending.', 1, '2026-03-20 07:55:54'),
(32, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-20 07:55:54'),
(33, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-24 needs review.', 0, '2026-03-20 07:55:54'),
(34, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-25) is pending.', 1, '2026-03-21 05:06:07'),
(35, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-03-21 05:06:07'),
(36, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-25 needs review.', 0, '2026-03-21 05:06:07'),
(37, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-26) is pending.', 1, '2026-03-21 05:40:29'),
(38, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-03-21 05:40:29'),
(39, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-26 needs review.', 0, '2026-03-21 05:40:29'),
(40, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-27) is pending.', 1, '2026-03-21 05:49:16'),
(41, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-21 05:49:16'),
(42, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-27 needs review.', 0, '2026-03-21 05:49:16'),
(43, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-28) is pending.', 1, '2026-03-21 10:13:32'),
(44, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-21 10:13:32'),
(45, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-28 needs review.', 0, '2026-03-21 10:13:32'),
(46, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-29) is pending.', 1, '2026-03-21 18:03:14'),
(47, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-21 18:03:14'),
(48, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-29 needs review.', 0, '2026-03-21 18:03:14'),
(49, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-30) is pending.', 1, '2026-03-22 06:40:37'),
(50, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-22 06:40:37'),
(51, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-30 needs review.', 0, '2026-03-22 06:40:37'),
(52, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-31) is pending.', 1, '2026-03-22 09:45:20'),
(53, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-22 09:45:20'),
(54, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-31 needs review.', 0, '2026-03-22 09:45:20'),
(55, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-32) is pending.', 1, '2026-03-22 10:15:55'),
(56, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-22 10:15:55'),
(57, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-32 needs review.', 0, '2026-03-22 10:15:55'),
(58, '2', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-33) is pending.', 0, '2026-03-22 10:26:50'),
(59, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student Kamal Perera requested Degree Certificate.', 0, '2026-03-22 10:26:50'),
(60, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-33 needs review.', 0, '2026-03-22 10:26:50'),
(61, '2', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-34) is pending.', 0, '2026-03-22 11:56:25'),
(62, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student Kamal Perera requested Degree Certificate.', 0, '2026-03-22 11:56:25'),
(63, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-34 needs review.', 0, '2026-03-22 11:56:25'),
(64, '2', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-35) is pending.', 0, '2026-03-22 12:09:59'),
(65, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student Kamal Perera requested Degree Certificate.', 0, '2026-03-22 12:09:59'),
(66, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-35 needs review.', 0, '2026-03-22 12:09:59'),
(67, '2', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-36) is pending.', 0, '2026-03-22 12:44:37'),
(68, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student Kamal Perera requested Degree Certificate.', 0, '2026-03-22 12:44:37'),
(69, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-36 needs review.', 0, '2026-03-22 12:44:37'),
(70, '2', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-37) is pending.', 0, '2026-03-22 12:44:37'),
(71, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student Kamal Perera requested Degree Certificate.', 0, '2026-03-22 12:44:37'),
(72, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-37 needs review.', 0, '2026-03-22 12:44:37'),
(73, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-39) is pending.', 1, '2026-03-24 09:24:58'),
(74, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 09:24:58'),
(75, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-39 needs review.', 0, '2026-03-24 09:24:58'),
(76, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-38) is pending.', 1, '2026-03-24 09:24:58'),
(77, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 09:24:58'),
(78, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-38 needs review.', 0, '2026-03-24 09:24:58'),
(79, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-40) is pending.', 1, '2026-03-24 11:26:39'),
(80, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 11:26:39'),
(81, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-40 needs review.', 0, '2026-03-24 11:26:39'),
(82, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-41) is pending.', 1, '2026-03-24 11:45:47'),
(83, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 11:45:47'),
(84, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-41 needs review.', 0, '2026-03-24 11:45:47'),
(85, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-42) is pending.', 1, '2026-03-24 11:59:26'),
(86, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 11:59:26'),
(87, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-42 needs review.', 0, '2026-03-24 11:59:26'),
(88, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-43) is pending.', 1, '2026-03-24 12:44:33'),
(89, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 12:44:33'),
(90, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-43 needs review.', 0, '2026-03-24 12:44:33'),
(91, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-44) is pending.', 1, '2026-03-24 12:47:08'),
(92, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 12:47:08'),
(93, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-44 needs review.', 0, '2026-03-24 12:47:08'),
(94, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-45) is pending.', 1, '2026-03-24 12:47:14'),
(95, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 12:47:14'),
(96, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-45 needs review.', 0, '2026-03-24 12:47:14'),
(97, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-46) is pending.', 1, '2026-03-24 12:47:14'),
(98, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 12:47:14'),
(99, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-46 needs review.', 0, '2026-03-24 12:47:14'),
(100, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-47) is pending.', 1, '2026-03-24 12:47:15'),
(101, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 12:47:15'),
(102, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-47 needs review.', 0, '2026-03-24 12:47:15'),
(103, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-48) is pending.', 1, '2026-03-24 12:47:19'),
(104, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 12:47:19'),
(105, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-48 needs review.', 0, '2026-03-24 12:47:19'),
(106, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-49) is pending.', 1, '2026-03-24 12:47:30'),
(107, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 12:47:30'),
(108, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-49 needs review.', 0, '2026-03-24 12:47:30'),
(109, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-50) is pending.', 1, '2026-03-24 13:39:53'),
(110, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:39:53'),
(111, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-50 needs review.', 0, '2026-03-24 13:39:53'),
(112, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-51) is pending.', 1, '2026-03-24 13:39:54'),
(113, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:39:54'),
(114, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-51 needs review.', 0, '2026-03-24 13:39:54'),
(115, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-52) is pending.', 1, '2026-03-24 13:39:55'),
(116, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:39:55'),
(117, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-52 needs review.', 0, '2026-03-24 13:39:55'),
(118, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-53) is pending.', 1, '2026-03-24 13:39:55'),
(119, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:39:55'),
(120, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-53 needs review.', 0, '2026-03-24 13:39:55'),
(121, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-54) is pending.', 1, '2026-03-24 13:39:56'),
(122, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:39:56'),
(123, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-54 needs review.', 0, '2026-03-24 13:39:56'),
(124, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-55) is pending.', 1, '2026-03-24 13:39:56'),
(125, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:39:56'),
(126, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-55 needs review.', 0, '2026-03-24 13:39:56'),
(127, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-56) is pending.', 1, '2026-03-24 13:39:56'),
(128, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:39:56'),
(129, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-56 needs review.', 0, '2026-03-24 13:39:56'),
(130, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-57) is pending.', 1, '2026-03-24 13:39:56'),
(131, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:39:56'),
(132, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-57 needs review.', 0, '2026-03-24 13:39:56'),
(133, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-58) is pending.', 1, '2026-03-24 13:39:57'),
(134, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:39:57'),
(135, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-58 needs review.', 0, '2026-03-24 13:39:57'),
(136, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-59) is pending.', 1, '2026-03-24 13:39:58'),
(137, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:39:58'),
(138, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-59 needs review.', 0, '2026-03-24 13:39:58'),
(139, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-60) is pending.', 1, '2026-03-24 13:39:58'),
(140, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:39:58'),
(141, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-60 needs review.', 0, '2026-03-24 13:39:58'),
(142, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-61) is pending.', 1, '2026-03-24 13:40:01'),
(143, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:40:01'),
(144, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-61 needs review.', 0, '2026-03-24 13:40:01'),
(145, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-62) is pending.', 1, '2026-03-24 13:40:01'),
(146, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:40:01'),
(147, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-62 needs review.', 0, '2026-03-24 13:40:01'),
(148, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-63) is pending.', 1, '2026-03-24 13:40:01'),
(149, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:40:01'),
(150, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-63 needs review.', 0, '2026-03-24 13:40:01'),
(151, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-64) is pending.', 1, '2026-03-24 13:40:02'),
(152, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:40:02'),
(153, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-64 needs review.', 0, '2026-03-24 13:40:02'),
(154, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-65) is pending.', 1, '2026-03-24 13:40:02'),
(155, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:40:02'),
(156, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-65 needs review.', 0, '2026-03-24 13:40:02'),
(157, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-66) is pending.', 1, '2026-03-24 13:40:03'),
(158, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:40:03'),
(159, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-66 needs review.', 0, '2026-03-24 13:40:03'),
(160, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-67) is pending.', 1, '2026-03-24 13:40:07'),
(161, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:40:07'),
(162, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-67 needs review.', 0, '2026-03-24 13:40:07'),
(163, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-68) is pending.', 1, '2026-03-24 13:40:08'),
(164, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:40:08'),
(165, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-68 needs review.', 0, '2026-03-24 13:40:08'),
(166, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-69) is pending.', 1, '2026-03-24 13:40:08'),
(167, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:40:08'),
(168, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-69 needs review.', 0, '2026-03-24 13:40:08'),
(169, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-70) is pending.', 1, '2026-03-24 13:40:08'),
(170, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:40:08'),
(171, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-70 needs review.', 0, '2026-03-24 13:40:08'),
(172, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-71) is pending.', 1, '2026-03-24 13:40:08'),
(173, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:40:08'),
(174, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-71 needs review.', 0, '2026-03-24 13:40:08'),
(175, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-72) is pending.', 1, '2026-03-24 13:40:09'),
(176, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:40:09'),
(177, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-72 needs review.', 0, '2026-03-24 13:40:09'),
(178, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-73) is pending.', 1, '2026-03-24 13:40:09'),
(179, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:40:09'),
(180, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-73 needs review.', 0, '2026-03-24 13:40:09'),
(181, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-74) is pending.', 1, '2026-03-24 13:52:47'),
(182, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 13:52:47'),
(183, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-74 needs review.', 0, '2026-03-24 13:52:47'),
(184, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-75) is pending.', 1, '2026-03-24 14:08:37'),
(185, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 14:08:37'),
(186, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-75 needs review.', 0, '2026-03-24 14:08:37'),
(187, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-76) is pending.', 1, '2026-03-24 15:10:37'),
(188, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-03-24 15:10:37'),
(189, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-76 needs review.', 0, '2026-03-24 15:10:37'),
(190, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-77) is pending.', 1, '2026-03-24 15:31:06'),
(191, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-03-24 15:31:06'),
(192, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-77 needs review.', 0, '2026-03-24 15:31:06'),
(193, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-78) is pending.', 1, '2026-03-24 15:42:41'),
(194, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 15:42:41'),
(195, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-78 needs review.', 0, '2026-03-24 15:42:41'),
(196, '4', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-79) is pending.', 0, '2026-03-24 15:55:18'),
(197, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student Dilini Fernando requested Semester Result Sheet.', 0, '2026-03-24 15:55:18'),
(198, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-79 needs review.', 0, '2026-03-24 15:55:18'),
(199, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-80) is pending.', 1, '2026-03-24 22:21:50'),
(200, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 22:21:50'),
(201, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-80 needs review.', 0, '2026-03-24 22:21:50'),
(202, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-81) is pending.', 1, '2026-03-24 22:38:00'),
(203, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 22:38:00'),
(204, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-81 needs review.', 0, '2026-03-24 22:38:00'),
(205, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-82) is pending.', 1, '2026-03-24 23:08:28'),
(206, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 23:08:28'),
(207, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-82 needs review.', 0, '2026-03-24 23:08:28'),
(208, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-83) is pending.', 1, '2026-03-24 23:18:05'),
(209, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 23:18:05'),
(210, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-83 needs review.', 0, '2026-03-24 23:18:05'),
(211, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-84) is pending.', 1, '2026-03-24 23:23:55'),
(212, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 23:23:55'),
(213, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-84 needs review.', 0, '2026-03-24 23:23:55'),
(214, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-85) is pending.', 0, '2026-03-24 23:45:02'),
(215, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-24 23:45:02'),
(216, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-85 needs review.', 0, '2026-03-24 23:45:02'),
(217, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-86) is pending.', 0, '2026-03-25 00:01:28'),
(218, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-25 00:01:28'),
(219, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-86 needs review.', 0, '2026-03-25 00:01:28'),
(220, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-87) is pending.', 0, '2026-03-25 05:23:52'),
(221, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-25 05:23:52'),
(222, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-87 needs review.', 0, '2026-03-25 05:23:52'),
(223, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-88) is pending.', 0, '2026-03-25 13:55:54'),
(224, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-03-25 13:55:54'),
(225, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-88 needs review.', 0, '2026-03-25 13:55:54'),
(226, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-89) is pending.', 0, '2026-03-25 20:13:54'),
(227, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-25 20:13:54'),
(228, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-89 needs review.', 0, '2026-03-25 20:13:54'),
(229, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-90) is pending.', 0, '2026-03-25 20:14:37'),
(230, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-03-25 20:14:37'),
(231, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-90 needs review.', 0, '2026-03-25 20:14:37'),
(232, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-91) is pending.', 0, '2026-03-25 20:57:58'),
(233, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-25 20:57:58'),
(234, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-91 needs review.', 0, '2026-03-25 20:57:58'),
(235, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-92) is pending.', 0, '2026-03-26 03:38:50'),
(236, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-03-26 03:38:50'),
(237, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-92 needs review.', 0, '2026-03-26 03:38:50'),
(238, '9', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-93) is pending.', 0, '2026-03-26 04:03:07'),
(239, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student Priya Raman requested Degree Certificate.', 0, '2026-03-26 04:03:07'),
(240, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-93 needs review.', 0, '2026-03-26 04:03:07'),
(241, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-94) is pending.', 0, '2026-03-26 05:21:15'),
(242, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-03-26 05:21:15'),
(243, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-94 needs review.', 0, '2026-03-26 05:21:15'),
(244, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-95) is pending.', 0, '2026-03-26 05:32:05'),
(245, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-03-26 05:32:05'),
(246, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-95 needs review.', 0, '2026-03-26 05:32:05'),
(247, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-96) is pending.', 0, '2026-03-26 07:13:20'),
(248, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-26 07:13:20'),
(249, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-96 needs review.', 0, '2026-03-26 07:13:20'),
(250, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-97) is pending.', 0, '2026-03-29 14:23:54'),
(251, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-03-29 14:23:54'),
(252, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-97 needs review.', 0, '2026-03-29 14:23:54'),
(253, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-98) is pending.', 0, '2026-03-31 14:47:13'),
(254, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-03-31 14:47:13'),
(255, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-98 needs review.', 0, '2026-03-31 14:47:13'),
(256, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-99) is pending.', 0, '2026-04-08 17:16:07'),
(257, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-04-08 17:16:07'),
(258, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-99 needs review.', 0, '2026-04-08 17:16:07'),
(259, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-100) is pending.', 0, '2026-04-08 21:28:26'),
(260, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-04-08 21:28:26'),
(261, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-100 needs review.', 0, '2026-04-08 21:28:26'),
(262, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-101) is pending.', 0, '2026-04-19 14:22:51'),
(263, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-04-19 14:22:51'),
(264, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-101 needs review.', 0, '2026-04-19 14:22:51'),
(265, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-102) is pending.', 0, '2026-04-19 14:24:33'),
(266, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-04-19 14:24:33'),
(267, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-102 needs review.', 0, '2026-04-19 14:24:33'),
(268, '9', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-103) is pending.', 0, '2026-04-20 15:09:44'),
(269, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student Priya Raman requested Semester Result Sheet.', 0, '2026-04-20 15:09:44'),
(270, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-103 needs review.', 0, '2026-04-20 15:09:44'),
(271, '9', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-104) is pending.', 0, '2026-04-20 20:07:01'),
(272, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student Priya Raman requested Degree Certificate.', 0, '2026-04-20 20:07:01'),
(273, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-104 needs review.', 0, '2026-04-20 20:07:01'),
(274, '9', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-105) is pending.', 0, '2026-04-22 05:34:04'),
(275, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student Priya Raman requested Semester Result Sheet.', 0, '2026-04-22 05:34:04'),
(276, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-105 needs review.', 0, '2026-04-22 05:34:04'),
(277, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-106) is pending.', 0, '2026-04-25 06:58:09'),
(278, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-04-25 06:58:09'),
(279, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-106 needs review.', 0, '2026-04-25 06:58:09'),
(280, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-107) is pending.', 0, '2026-04-25 07:05:49'),
(281, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-04-25 07:05:49'),
(282, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-107 needs review.', 0, '2026-04-25 07:05:49'),
(283, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-108) is pending.', 0, '2026-04-25 08:57:04'),
(284, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-04-25 08:57:04'),
(285, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-108 needs review.', 0, '2026-04-25 08:57:04'),
(286, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-109) is pending.', 0, '2026-04-25 08:59:54'),
(287, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-04-25 08:59:54'),
(288, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-109 needs review.', 0, '2026-04-25 08:59:54'),
(289, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-110) is pending.', 0, '2026-04-25 19:42:48'),
(290, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-04-25 19:42:48'),
(291, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-110 needs review.', 0, '2026-04-25 19:42:48'),
(292, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-111) is pending.', 0, '2026-04-25 19:44:35'),
(293, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-04-25 19:44:35'),
(294, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-111 needs review.', 0, '2026-04-25 19:44:35'),
(295, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-112) is pending.', 0, '2026-04-25 20:07:32'),
(296, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-04-25 20:07:32'),
(297, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-112 needs review.', 0, '2026-04-25 20:07:32'),
(298, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-113) is pending.', 0, '2026-04-25 20:21:22'),
(299, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-04-25 20:21:22'),
(300, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-113 needs review.', 0, '2026-04-25 20:21:22'),
(301, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-114) is pending.', 0, '2026-04-26 03:45:17'),
(302, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-04-26 03:45:17'),
(303, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-114 needs review.', 0, '2026-04-26 03:45:17'),
(304, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-115) is pending.', 0, '2026-04-26 03:46:00'),
(305, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-04-26 03:46:00'),
(306, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-115 needs review.', 0, '2026-04-26 03:46:00'),
(307, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-116) is pending.', 0, '2026-04-26 04:34:57'),
(308, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-04-26 04:34:57'),
(309, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-116 needs review.', 0, '2026-04-26 04:34:57'),
(310, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Semester Result Sheet\" (#REQ-117) is pending.', 0, '2026-04-26 13:07:01'),
(311, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Semester Result Sheet.', 0, '2026-04-26 13:07:01'),
(312, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-117 needs review.', 0, '2026-04-26 13:07:01'),
(313, '1', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-118) is pending.', 0, '2026-05-08 05:22:12'),
(314, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student L.G.D. Nilushika requested Degree Certificate.', 0, '2026-05-08 05:22:12'),
(315, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-118 needs review.', 0, '2026-05-08 05:22:12'),
(316, '9', 'student', 'Request Submitted! 🚀', 'Your request for \"Degree Certificate\" (#REQ-119) is pending.', 0, '2026-05-08 12:21:11'),
(317, 'STAFF_GROUP', 'staff', 'New Request Received', 'Student Priya Raman requested Degree Certificate.', 0, '2026-05-08 12:21:11'),
(318, 'AR_GROUP', 'registrar', 'Action Required', 'New request #REQ-119 needs review.', 0, '2026-05-08 12:21:11');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `reg_number` varchar(50) DEFAULT NULL,
  `certificate_type` varchar(100) DEFAULT NULL,
  `semester_details` varchar(100) DEFAULT NULL,
  `speed` varchar(20) DEFAULT NULL,
  `document_path` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Staff Review Pending',
  `submitted_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `library_clearance` tinyint(1) DEFAULT 0,
  `hostel_clearance` tinyint(1) DEFAULT 0,
  `other_fees_clearance` tinyint(1) DEFAULT 0,
  `staff_remarks` text DEFAULT NULL,
  `staff_approval` enum('pending','approved','rejected') DEFAULT 'pending',
  `hod_approval` enum('pending','approved','rejected') DEFAULT 'pending',
  `dean_approval` enum('pending','approved','rejected') DEFAULT 'pending',
  `rector_approval` enum('pending','approved','rejected') DEFAULT 'pending',
  `rejection_reason` text DEFAULT NULL,
  `warden_status` varchar(20) DEFAULT 'Pending',
  `library_status` varchar(20) DEFAULT 'Pending',
  `sub_warden_status` varchar(20) DEFAULT 'Pending',
  `student_affairs_status` varchar(20) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `student_id`, `student_name`, `reg_number`, `certificate_type`, `semester_details`, `speed`, `document_path`, `status`, `submitted_date`, `library_clearance`, `hostel_clearance`, `other_fees_clearance`, `staff_remarks`, `staff_approval`, `hod_approval`, `dean_approval`, `rector_approval`, `rejection_reason`, `warden_status`, `library_status`, `sub_warden_status`, `student_affairs_status`) VALUES
(1, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', '0d9ab696cb74783487b85324509a5e8f', 'Approved', '2026-03-15 15:58:13', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(6, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Provisional Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-18 08:38:40', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(7, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, NULL, '2026-03-18 09:00:11', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(8, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-18 09:00:11', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(9, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-18 09:00:11', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(10, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Provisional Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-18 09:07:25', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(11, 3, 'Sahan Silva', 'EU/TR/2021/CS/15', 'Degree Certificate', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-18 10:05:15', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Approved', 'Approved', 'Approved', 'Approved'),
(12, 3, 'Sahan Silva', 'EU/TR/2021/CS/15', 'Provisional Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-18 10:34:07', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(13, 3, 'Sahan Silva', 'EU/TR/2021/CS/15', 'Degree Certificate', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-18 10:48:06', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(14, 3, 'Sahan Silva', 'EU/TR/2021/CS/15', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-18 10:50:58', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(15, 3, 'Sahan Silva', 'EU/TR/2021/CS/15', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-18 10:57:17', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(16, 3, 'Sahan Silva', 'EU/TR/2021/CS/15', 'Degree Certificate', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-18 12:00:13', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Approved', 'Approved', 'Approved', 'Approved'),
(17, 3, 'Sahan Silva', 'EU/TR/2021/CS/15', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-18 12:27:00', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(18, 3, 'Sahan Silva', 'EU/TR/2021/CS/15', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-18 12:53:28', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(19, 3, 'Sahan Silva', 'EU/TR/2021/CS/15', 'Degree Certificate', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-18 13:59:07', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(20, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-18 19:51:47', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(21, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-19 03:25:25', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(22, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-19 03:48:46', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(23, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-19 03:54:18', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(26, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-21 05:40:28', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(27, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-21 05:49:16', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(28, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-21 10:13:32', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(29, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-21 18:03:13', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(30, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-22 06:40:37', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(31, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-22 09:45:20', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(32, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-22 10:15:55', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(33, 2, 'Kamal Perera', 'EU/TR/2020/MS/02', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-22 10:26:50', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(34, 2, 'Kamal Perera', 'EU/TR/2020/MS/02', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-22 11:56:25', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(35, 2, 'Kamal Perera', 'EU/TR/2020/MS/02', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-22 12:09:59', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(36, 2, 'Kamal Perera', 'EU/TR/2020/MS/02', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-22 12:44:36', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(37, 2, 'Kamal Perera', 'EU/TR/2020/MS/02', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-22 12:44:36', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(38, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 09:24:57', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(39, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 09:24:57', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(40, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 11:26:39', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(41, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 11:45:47', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(42, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 11:59:26', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(43, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 12:44:33', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(44, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 12:47:08', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(45, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 12:47:14', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(46, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 12:47:14', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(47, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 12:47:15', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(48, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 12:47:19', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(49, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 12:47:30', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(50, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:39:52', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(51, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:39:54', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(52, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:39:55', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(53, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:39:55', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(54, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:39:55', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(55, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:39:56', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(56, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:39:56', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(57, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:39:56', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(58, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:39:57', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(59, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:39:58', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(60, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:39:58', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(61, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:40:01', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(62, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:40:01', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(63, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:40:01', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(64, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:40:02', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(65, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:40:02', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(66, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:40:03', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(67, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:40:07', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(68, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:40:07', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(69, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:40:08', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(70, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:40:08', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(71, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:40:08', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(72, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:40:08', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(73, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:40:09', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(74, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 13:52:46', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(75, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 14:08:37', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(76, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-24 15:10:37', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(77, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, '', '2026-03-24 15:31:05', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(78, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 15:42:40', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(79, 4, 'Dilini Fernando', 'EU/TR/2021/CS/20', 'Semester Result Sheet', NULL, 'Standard', NULL, NULL, '2026-03-24 15:55:18', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(80, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 22:21:49', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(81, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 22:38:00', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(82, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 23:08:27', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(83, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 23:18:05', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(84, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 23:23:54', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(85, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-24 23:45:02', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(86, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-25 00:01:27', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(87, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', '1774416231793-867275208-class2.png', 'Pending', '2026-03-25 05:23:52', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(88, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, NULL, '2026-03-25 13:55:54', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(89, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-25 20:13:54', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(90, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Approved', '2026-03-25 20:14:37', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(91, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-25 20:57:57', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(92, 1, 'L.G.D. Nilushika', 'EU/TR/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, NULL, '2026-03-26 03:38:50', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(93, 9, 'Priya Raman', 'EUSL/TC/IS/2022/MS/08', 'Degree Certificate', NULL, 'Standard', '1774497786771-484720717-e148e3378d14662ad97a762026e5cc26.jpg', 'Forwarded to AR', '2026-03-26 04:03:06', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(94, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Approved', '2026-03-26 05:21:15', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(95, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Rejected', '2026-03-26 05:32:05', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(96, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Pending', '2026-03-26 07:13:20', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(97, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-03-29 14:23:54', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(98, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, '', '2026-03-31 14:47:12', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(99, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-04-08 17:16:06', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(100, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-04-08 21:28:26', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Approved', 'Pending'),
(101, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-04-19 14:22:50', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(102, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-04-19 14:24:32', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(103, 9, 'Priya Raman', 'EUSL/TC/IS/2022/MS/08', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-04-20 15:09:44', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(104, 9, 'Priya Raman', 'EUSL/TC/IS/2022/MS/08', 'Degree Certificate', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-04-20 20:07:00', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(105, 9, 'Priya Raman', 'EUSL/TC/IS/2022/MS/08', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-04-22 05:34:04', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(106, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Degree Certificate', NULL, 'Standard', '1777100288442-390945952-ZLLDRnen4BqZyHz67DBqa5J9iOfGA3HIf4IgGj8hSdTdmOhNtjZUK5JrltVyjHY3ed90xBptPdRUZCsjiKpRlXNZaS36WbMW-NfZeUOQAykL78_CAvSTqwo5ZbMlR8rBknC83cToBJ1dc0shrPRBDJHC68B68rPPfM6oj7sDqaw06J2s7k8B9ALj.png', 'Forwarded to AR', '2026-04-25 06:58:08', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Approved', 'Approved', 'Approved', 'Approved'),
(107, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-04-25 07:05:49', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(108, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-04-25 08:57:04', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Approved', 'Approved', 'Approved', 'Approved'),
(109, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-04-25 08:59:53', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(110, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', '1777146167312-22333045-42223ed4-8399-4e77-b624-aea0ce4d63fd.png', 'Forwarded to AR', '2026-04-25 19:42:47', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(111, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Degree Certificate', NULL, 'Standard', '1777146273246-324355151-42223ed4-8399-4e77-b624-aea0ce4d63fd.png', 'Forwarded to AR', '2026-04-25 19:44:34', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Approved', 'Approved', 'Approved', 'Approved'),
(112, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-04-25 20:07:31', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(113, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-04-25 20:21:22', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(114, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Semester Result Sheet', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-04-26 03:45:17', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(115, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Degree Certificate', NULL, 'Standard', NULL, 'Forwarded to AR', '2026-04-26 03:45:59', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Approved', 'Approved', 'Approved', 'Approved'),
(116, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Degree Certificate', 'Year 4 - Semester 1', 'Standard', '1777178097654-203484681-42223ed4-8399-4e77-b624-aea0ce4d63fd.png', 'Forwarded to AR', '2026-04-26 04:34:57', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Approved', 'Approved', 'Approved', 'Approved'),
(117, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Semester Result Sheet', 'Year 4 - Semester 1', 'Standard', NULL, 'Forwarded to AR', '2026-04-26 13:07:00', 0, 0, 0, NULL, 'approved', 'approved', 'approved', 'approved', NULL, 'Pending', 'Pending', 'Pending', 'Pending'),
(118, 1, 'L.G.D. Nilushika', 'EUSL/TC/IS/2020/MS/01', 'Degree Certificate', 'Year 3 - Semester 2', 'Standard', NULL, 'Forwarded to AR', '2026-05-08 05:22:12', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Approved', 'Approved', 'Approved', 'Approved'),
(119, 9, 'Priya Raman', 'EUSL/TC/IS/2022/MS/08', 'Degree Certificate', 'Year 4 - Semester 1', 'Standard', '1778242871462-932075873-42223ed4-8399-4e77-b624-aea0ce4d63fd.png', 'Forwarded to AR', '2026-05-08 12:21:11', 0, 0, 0, NULL, 'pending', 'pending', 'pending', 'pending', NULL, 'Approved', 'Approved', 'Approved', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `registration_number` varchar(50) NOT NULL,
  `index_number` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `program` varchar(100) DEFAULT NULL,
  `academic_year` varchar(50) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `role` enum('student','staff','admin','registrar') NOT NULL,
  `reset_otp` varchar(10) DEFAULT NULL,
  `otp_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `registration_number`, `index_number`, `password`, `full_name`, `email`, `program`, `academic_year`, `department`, `role`, `reset_otp`, `otp_expiry`) VALUES
(1, 'EUSL/TC/IS/2020/MS/01', '20/MS/843', 'pass1234', 'L.G.D. Nilushika', 'dula2000nilushika@gmail.com', 'B.Sc. Management', '2020/2021', 'Business Management', 'student', '941035', '2026-04-09 03:38:28'),
(2, 'EUSL/TC/IS/2020/MS/02', '20/MS/854', 'pass123', 'Kamal Perera', 'nilu33512@gmail.com', 'B.Sc. Management', '2020/2021', 'Business Management', 'student', '805734', '2026-03-25 15:57:07'),
(3, 'EUSL/TC/IS/2021/CS/15', '21/CS/15', 'pass123', 'Sahan Silva', 'sahan@gmail.com', 'B.Sc. Computer Science', '2021/2022', 'Computer Science', 'student', NULL, NULL),
(4, 'EUSL/TC/IS/2021/COM/20', '21/COM/20', 'pass123', 'Dilini Fernando', 'dilini@gmail.com', 'B.Sc. Computer Science', '2021/2022', 'Computer Science', 'student', NULL, NULL),
(6, 'EUSL/TC/IS/2022/CS/45', '22/CS/145', 'pass123', 'M.R.F. Nasna', 'nasna@gmail.com', 'B.A.Language', '2022/2023', 'Communication & Language', 'student', NULL, NULL),
(7, 'EUSL/TC/IS/2020/MS/107', '20/MS/844', 'pass123', 'L.P. Tharushi Perera', 'tharu@gmail.com', 'B.Sc. Management', '2024-2025 (Final Year)', 'Business Management', 'student', NULL, NULL),
(8, 'EUSL/TC/IS/2021/IS/12', '21/IS/122', 'pass123', 'Nuwan Kumara', 'nuwan@gmail.com', 'B.Sc. Information System', '2023-2024 (3rd Year)', 'Computer Science', 'student', NULL, NULL),
(9, 'EUSL/TC/IS/2022/MS/08', '22/MS/1342', 'pass123', 'Priya Raman', 'priya@gmail.com', 'BS. C Management', '2022/2023', 'Management', 'student', NULL, NULL),
(10, 'ADMIN/001', NULL, 'admin123', 'System Administrator', 'admin@eusl.lk', NULL, NULL, 'IT Center', 'admin', NULL, NULL),
(11, 'REG/001', NULL, 'reg123', 'Mr. Perera ', 'registrar@eusl.lk', NULL, NULL, 'null', 'registrar', NULL, NULL),
(12, 'STF/101', NULL, 'staff123', 'Dr. Silva ', 'silva@eusl.lk', NULL, NULL, 'Computer Science', 'staff', NULL, NULL),
(13, 'STF/102', NULL, 'staff123', 'Dr. Perera', 'perera@eusl.lk', NULL, NULL, 'Business & Management Studies', 'staff', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `registration_number` (`registration_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
