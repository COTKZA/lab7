-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2024 at 11:28 AM
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
-- Database: `student_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_code` char(8) NOT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_code`, `course_name`, `credit`) VALUES
('01204113', 'ComPro for CPE', 3),
('01204114', 'Intro to Hardware Development', 3),
('01204223', 'Practicum in Computer Engineering', 1),
('01204271', 'Intro to CPE', 1),
('01204332', 'Operting System', 3),
('01204351', 'Database System', 3);

-- --------------------------------------------------------

--
-- Table structure for table `exam_result`
--

CREATE TABLE `exam_result` (
  `id` int(11) NOT NULL,
  `course_code` char(8) DEFAULT NULL,
  `student_code` char(10) DEFAULT NULL,
  `point` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_result`
--

INSERT INTO `exam_result` (`id`, `course_code`, `student_code`, `point`) VALUES
(1, '01204113', '6540201111', 22.5),
(2, '01204113', '6540202222', 15.4),
(3, '01204113', '6540203333', 15.5),
(4, '01204113', '6540204444', 20.6),
(5, '01204271', '6540205555', 19.5),
(6, '01204271', '6540206666', 19.5),
(7, '01204113', '6540205555', 22),
(8, '01204271', '6540207777', 25.5);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_code` char(10) NOT NULL,
  `student_name` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_code`, `student_name`, `gender`) VALUES
('6540201111', 'Juan', 'F'),
('6540202222', 'Juan', 'M'),
('6540203333', 'Juan', 'M'),
('6540204444', 'Juan', 'F'),
('6540205555', 'Juan', 'M'),
('6540206666', 'Juan', 'F'),
('6540207777', 'Juan', 'F');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_code`);

--
-- Indexes for table `exam_result`
--
ALTER TABLE `exam_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_code` (`course_code`),
  ADD KEY `student_code` (`student_code`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exam_result`
--
ALTER TABLE `exam_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exam_result`
--
ALTER TABLE `exam_result`
  ADD CONSTRAINT `exam_result_ibfk_1` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`),
  ADD CONSTRAINT `exam_result_ibfk_2` FOREIGN KEY (`student_code`) REFERENCES `student` (`student_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
