-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 10, 2019 at 11:02 AM
-- Server version: 5.7.23
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `js_trickle`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getNumberOfUsers` ()  SELECT COUNT(*) AS numberOfUsers FROM users$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsers` ()  SELECT * FROM users$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsersFromEmail` (IN `sEmail` VARCHAR(10))  SELECT name,last_name FROM users	WHERE email = sEmail$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_fk` bigint(20) UNSIGNED NOT NULL,
  `user_fk` bigint(20) UNSIGNED NOT NULL,
  `answer` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `name`) VALUES
(1, 'I have a question about some code'),
(2, 'I need help with a homework problem'),
(3, 'I need a hardware recommendation'),
(4, 'I need a software recommendation'),
(5, 'I need to troubleshoot some software or hardware'),
(6, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `likes_answers`
--

CREATE TABLE `likes_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `b_like` tinyint(1) NOT NULL,
  `user_fk` bigint(20) NOT NULL,
  `answer_fk` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `likes_answers`
--

INSERT INTO `likes_answers` (`id`, `b_like`, `user_fk`, `answer_fk`) VALUES
(1, 0, 2, 13),
(2, 0, 1, 14),
(3, 0, 1, 39),
(4, 0, 1, 39),
(5, 0, 1, 39),
(6, 0, 1, 14),
(7, 0, 1, 14),
(8, 0, 1, 14),
(9, 0, 1, 14),
(10, 0, 1, 43);

-- --------------------------------------------------------

--
-- Table structure for table `likes_questions`
--

CREATE TABLE `likes_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `b_like` tinyint(1) NOT NULL,
  `user_fk` bigint(20) NOT NULL,
  `question_fk` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `likes_questions`
--

INSERT INTO `likes_questions` (`id`, `b_like`, `user_fk`, `question_fk`) VALUES
(1, 0, 2, 13),
(2, 0, 1, 14),
(3, 0, 1, 39),
(4, 0, 1, 39),
(5, 0, 1, 39),
(6, 0, 1, 14),
(7, 0, 1, 14),
(8, 0, 1, 14),
(9, 0, 1, 14),
(10, 0, 1, 43);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `time` int(10) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `time`, `status`, `email`) VALUES
(1, 1550840890, 0, 'A@A.com'),
(2, 1550841116, 0, 'A@A.com'),
(3, 1550841116, 1, 'A@A.com'),
(4, 1550842465, 0, 'A@A.com'),
(5, 1550842465, 1, 'A@A.com'),
(6, 1550842479, 0, 'A@A.com'),
(7, 1550842484, 0, 'A@A.com'),
(11, 1553255679, 0, 'A@A.com'),
(12, 1553255682, 0, 'A@A.com'),
(13, 1553255683, 0, 'A@A.com'),
(14, 1553255727, 0, 'A@A.com'),
(15, 1553255730, 0, 'A@A.com'),
(16, 1553255731, 0, 'A@A.com'),
(17, 1553255865, 0, 'R@R.COM'),
(18, 1553255871, 0, 'R@R.COM'),
(19, 1553255873, 0, 'R@R.COM'),
(20, 1553255913, 0, 'R@R.COM'),
(21, 1553255914, 0, 'R@R.COM'),
(22, 1553255914, 0, 'R@R.COM'),
(23, 1553257122, 0, 't@A.com'),
(24, 1553257335, 0, 'u@u.com'),
(25, 1553257414, 0, 'u@u.com'),
(26, 1553257857, 0, 'u@u.com'),
(27, 1553257903, 0, 't@A.com'),
(28, 1553258068, 0, 'p@p.com'),
(29, 1553865646, 0, 'AA@A.com'),
(30, 1553865654, 0, 'AA@A.com'),
(31, 1553865656, 0, 'AA@A.com'),
(32, 1553865667, 0, 'A@A.com'),
(33, 1553865675, 0, 'AA@A.com'),
(34, 1553865772, 0, 'A@A.com'),
(35, 1553865795, 0, 'A@A.com'),
(36, 1553865816, 0, 'A@A.com'),
(37, 1554913307, 0, 'A@A.com'),
(38, 1554913310, 0, 'A@A.com'),
(39, 1554913418, 0, 'A@A.com'),
(40, 1554913419, 0, 'A@A.com'),
(41, 1554913419, 0, 'A@A.com'),
(42, 1554913419, 0, 'A@A.com'),
(43, 1554913419, 0, 'A@A.com'),
(44, 1554913419, 0, 'A@A.com'),
(45, 1554913419, 0, 'A@A.com'),
(46, 1554913420, 0, 'A@A.com'),
(47, 1554913420, 0, 'A@A.com'),
(48, 1554913420, 0, 'A@A.com'),
(49, 1554914795, 0, 'Arg@Arg.com'),
(50, 1554914951, 0, 'Arg@Arg.com'),
(51, 1554914957, 0, 'Arg@Arg.com'),
(52, 1554914963, 0, 'Arg@Arg.com'),
(53, 1554915026, 0, 'AA@A.com'),
(54, 1554915084, 0, 'AA@A.com'),
(55, 1554915261, 0, 'AA@A.com'),
(56, 1554915379, 0, 'AA@A.com'),
(57, 1554915682, 0, 'Arg@Arg.com'),
(58, 1554915790, 0, 'Arg@Arg.com'),
(59, 1554917173, 0, 'AA@A.com'),
(60, 1554917182, 0, 'AA@A.com'),
(61, 1554917250, 0, 'AA@A.com'),
(62, 1554917254, 0, 'AA@A.com'),
(63, 1554917315, 0, 'Arg@Arg.com'),
(64, 1554917317, 0, 'Arg@Arg.com'),
(65, 1554917351, 0, 'Arg@Arg.com'),
(66, 1554917354, 0, 'Arg@Arg.com'),
(67, 1554918374, 0, 'Arg@Arg.com'),
(68, 1554918376, 0, 'Arg@Arg.com'),
(69, 1554918479, 0, 'AA@A.com'),
(70, 1554918480, 0, 'AA@A.com'),
(71, 1554918543, 0, 'A@A.com'),
(72, 1554918571, 0, 'Af@Af.com'),
(73, 1554918579, 0, 'Af@Af.com'),
(74, 1554918621, 0, 'A@A.com'),
(75, 1554918663, 0, 'Ab@A.com'),
(76, 1554918666, 0, 'Ab@A.com'),
(77, 1554918842, 0, 'Ab@A.com'),
(78, 1554918886, 0, 'Arg@Arg.com'),
(79, 1554918887, 0, 'Arg@Arg.com'),
(80, 1554918954, 0, 'Arg@Arg.com'),
(81, 1554919168, 0, 'CC@A.com'),
(82, 1554919175, 0, 'CC@A.com'),
(83, 1554919259, 0, 'CC@A.com'),
(84, 1554919273, 0, 'B@A.com'),
(85, 1554919275, 0, 'B@A.com'),
(86, 1554919302, 0, 'B@A.com'),
(87, 1554919342, 0, 'Af@Af.com'),
(88, 1554919374, 0, 'Af@Af.com'),
(89, 1554919377, 0, 'A@A.com'),
(90, 1554919424, 0, 'Az@A.com'),
(91, 1554919433, 0, 'Az@A.com'),
(92, 1554919480, 0, 'A@A.com'),
(93, 1554919601, 0, 'AA@A.com'),
(94, 1554919607, 0, 'AA@A.com'),
(95, 1554919611, 0, 'AA@A.com'),
(96, 1554919648, 0, 'AA@A.com'),
(97, 1554919656, 0, 'AA@A.com'),
(98, 1554919660, 0, 'AA@A.com'),
(99, 1554919808, 0, 'AA@A.com'),
(100, 1554919817, 0, 'AA@A.com'),
(101, 1554919821, 0, 'AA@A.com'),
(102, 1554919824, 0, 'AA@A.com'),
(103, 1554919828, 0, 'AA@A.com'),
(104, 1554919903, 0, 'AA@A.com'),
(105, 1554919921, 0, 'AA@A.com'),
(106, 1554920049, 0, 'Af@Af.com'),
(107, 1554920239, 0, 'Af@Af.com'),
(108, 1554920646, 0, 'Af@Af.com'),
(109, 1554920708, 0, 'Af@Af.com'),
(110, 1554920714, 0, 'Af@Af.com'),
(111, 1554920728, 0, 'Af@Af.com'),
(112, 1554920728, 0, 'Af@Af.com'),
(113, 1554920748, 0, 'B@A.com'),
(114, 1554920749, 0, 'B@A.com'),
(115, 1554920749, 0, 'B@A.com'),
(116, 1554920749, 0, 'B@A.com'),
(117, 1554920749, 0, 'B@A.com'),
(118, 1554920750, 0, 'B@A.com'),
(119, 1554920760, 0, 'B@A.com'),
(120, 1554920835, 0, 'B@A.com'),
(121, 1554920874, 0, 'B@A.com'),
(122, 1554920882, 0, 'B@A.com'),
(123, 1554920899, 0, 'B@A.com'),
(124, 1554920939, 0, 'B@A.com'),
(125, 1554920949, 0, 'B@A.com'),
(126, 1554920966, 0, 'B@A.com'),
(127, 1554920974, 0, 'B@A.com'),
(128, 1554921028, 0, 'B@A.com'),
(129, 1554921040, 0, 'B@A.com'),
(130, 1554921050, 0, 'B@A.com'),
(131, 1554921056, 0, 'B@A.com'),
(132, 1554921065, 0, 'B@A.com'),
(133, 1554921076, 0, 'B@A.com'),
(134, 1554921144, 0, 'B@A.com'),
(135, 1554921172, 0, 'B@A.com'),
(136, 1554921199, 0, 'B@A.com'),
(137, 1554921275, 0, 'B@A.com'),
(138, 1554921286, 0, 'B@A.com'),
(139, 1554921394, 0, 'B@A.com'),
(140, 1554921538, 0, 'B@A.com'),
(141, 1554921547, 0, 'B@A.com'),
(142, 1554921571, 0, 'B@A.com'),
(143, 1554922433, 0, 'B@A.com'),
(144, 1554922461, 0, 'B@A.com'),
(145, 1554922496, 0, 'B@A.com'),
(146, 1554922496, 1, 'B@A.com'),
(147, 1554922598, 0, 'B@A.com'),
(148, 1554922606, 0, 'B@A.com'),
(149, 1554922619, 0, 'B@A.com'),
(150, 1554922697, 0, 'Arg@Arg.com'),
(151, 1554922697, 1, 'Arg@Arg.com'),
(152, 1554922787, 0, 'Arg@Arg.com'),
(153, 1554922787, 1, 'Arg@Arg.com'),
(154, 1554922796, 0, 'Arg@Arg.com'),
(155, 1554922796, 1, 'Arg@Arg.com'),
(156, 1554922805, 0, 'Arg@Arg.com'),
(157, 1554922813, 0, 'Arg@Arg.com'),
(158, 1554922868, 0, 'Arg@Arg.com'),
(159, 1554922868, 1, 'Arg@Arg.com'),
(160, 1554922871, 0, 'Arg@Arg.com'),
(161, 1554922878, 0, 'Arg@Arg.com'),
(162, 1554922985, 0, 'Arg@Arg.com'),
(163, 1554922985, 1, 'Arg@Arg.com'),
(164, 1554922988, 0, 'Arg@Arg.com'),
(165, 1554923001, 0, 'Arg@Arg.com'),
(166, 1554923001, 1, 'Arg@Arg.com'),
(167, 1554923009, 0, 'Arg@Arg.com'),
(168, 1554923021, 0, 'Arg@Arg.com'),
(169, 1554923128, 0, 'B@A.com'),
(170, 1554923128, 1, 'B@A.com'),
(171, 1554923134, 0, 'B@A.com'),
(172, 1554923137, 0, 'B@A.com'),
(173, 1554923145, 0, 'C@A.com'),
(174, 1554923215, 0, 'Az@A.com'),
(175, 1554923215, 1, 'Az@A.com'),
(176, 1554923218, 0, 'Az@A.com'),
(177, 1554923220, 0, 'Az@A.com'),
(178, 1554923331, 0, 'Az@A.com'),
(179, 1554923331, 1, 'Az@A.com'),
(180, 1554923339, 0, 'Az@A.com'),
(181, 1554923341, 0, 'Az@A.com'),
(182, 1554923349, 0, 'Az@A.com'),
(183, 1554923350, 0, 'Az@A.com'),
(184, 1554923352, 0, 'Az@A.com'),
(185, 1554923353, 0, 'Az@A.com'),
(186, 1554923354, 0, 'Az@A.com'),
(187, 1554923355, 0, 'Az@A.com'),
(188, 1554923398, 0, 'CC@A.com'),
(189, 1554923398, 1, 'CC@A.com'),
(190, 1554923403, 0, 'CC@A.com'),
(191, 1554923413, 0, 'CC@A.com'),
(192, 1554923482, 0, 'Ab@A.com'),
(193, 1554923482, 1, 'Ab@A.com'),
(194, 1554923486, 0, 'Ab@A.com'),
(195, 1554923491, 0, 'Ab@A.com'),
(196, 1554923672, 0, 'AA@A.com'),
(197, 1554923672, 1, 'AA@A.com'),
(198, 1554923675, 0, 'AA@A.com'),
(199, 1554923710, 0, 'AA@A.com'),
(200, 1554923710, 1, 'AA@A.com'),
(201, 1554923774, 0, 'q@A.com'),
(202, 1554923774, 1, 'q@A.com'),
(203, 1554923777, 0, 'q@A.com'),
(204, 1554923817, 0, 'q@A.com'),
(205, 1554923817, 1, 'q@A.com'),
(206, 1554923911, 0, 'q@A.com'),
(207, 1554923916, 0, 'q@A.com'),
(208, 1554924076, 0, 'q@A.com'),
(209, 1554924076, 1, 'q@A.com'),
(210, 1554924078, 0, 'q@A.com'),
(211, 1554924246, 0, 'q@A.com'),
(212, 1554924246, 1, 'q@A.com'),
(213, 1554924248, 0, 'q@A.com'),
(214, 1554924248, 1, 'q@A.com'),
(215, 1554924250, 0, 'q@A.com'),
(216, 1554924250, 1, 'q@A.com'),
(217, 1554924250, 0, 'q@A.com'),
(218, 1554924250, 1, 'q@A.com'),
(219, 1554924251, 0, 'q@A.com'),
(220, 1554924251, 1, 'q@A.com'),
(221, 1554924251, 0, 'q@A.com'),
(222, 1554924251, 1, 'q@A.com'),
(223, 1554924254, 0, 'q@A.com'),
(224, 1554924255, 0, 'q@A.com'),
(225, 1554924263, 0, 'q@A.com'),
(226, 1554924264, 0, 'q@A.com'),
(227, 1554924265, 0, 'q@A.com'),
(228, 1554924265, 0, 'q@A.com'),
(229, 1554924265, 0, 'q@A.com'),
(230, 1554924304, 0, 'q@A.com'),
(231, 1554924304, 1, 'q@A.com'),
(232, 1554924307, 0, 'q@A.com'),
(233, 1554924308, 0, 'q@A.com'),
(234, 1554924310, 0, 'q@A.com'),
(235, 1554924311, 0, 'q@A.com'),
(236, 1554924311, 0, 'q@A.com'),
(237, 1554924311, 0, 'q@A.com'),
(238, 1554924312, 0, 'q@A.com'),
(239, 1554924312, 0, 'q@A.com'),
(240, 1554924312, 0, 'q@A.com'),
(241, 1554924312, 0, 'q@A.com'),
(242, 1554924312, 0, 'q@A.com'),
(243, 1554924353, 0, 'q@A.com'),
(244, 1554924355, 0, 'q@A.com'),
(245, 1554924414, 0, 'q@A.com'),
(246, 1554924415, 0, 'q@A.com'),
(247, 1554924415, 0, 'q@A.com'),
(248, 1554924415, 0, 'q@A.com'),
(249, 1554924416, 0, 'q@A.com'),
(250, 1554924416, 0, 'q@A.com'),
(251, 1554924416, 0, 'q@A.com'),
(252, 1554924416, 0, 'q@A.com'),
(253, 1554924510, 0, 'q@A.com'),
(254, 1554924510, 1, 'q@A.com'),
(255, 1554924512, 0, 'q@A.com'),
(256, 1554924514, 0, 'q@A.com'),
(257, 1554924515, 0, 'q@A.com'),
(258, 1554924655, 0, 'q@A.com'),
(259, 1554924661, 0, 'q@A.com'),
(260, 1554924670, 0, 'q@A.com'),
(261, 1554924812, 0, 'q@A.com'),
(262, 1554924812, 1, 'q@A.com'),
(263, 1554924814, 0, 'q@A.com'),
(264, 1554924819, 0, 'q@A.com'),
(265, 1554924851, 0, 'q@A.com'),
(266, 1554924851, 1, 'q@A.com'),
(267, 1554924853, 0, 'q@A.com'),
(268, 1554924865, 0, 'q@A.com'),
(269, 1554925035, 0, 'q@A.com'),
(270, 1554925069, 0, 'q@A.com'),
(271, 1554925072, 0, 'q@A.com'),
(272, 1554925122, 0, 'q@A.com'),
(273, 1554925123, 0, 'q@A.com'),
(274, 1554925193, 0, 'q@A.com'),
(275, 1554925216, 0, 'q@A.com'),
(276, 1554925249, 0, 'q@A.com'),
(277, 1554925250, 0, 'q@A.com'),
(278, 1554925357, 0, 'q@A.com'),
(279, 1554925368, 0, 'q@A.com'),
(280, 1554925401, 0, 'q@A.com'),
(281, 1554925414, 0, 'q@A.com'),
(282, 1554925503, 0, 'q@A.com'),
(283, 1554925504, 0, 'q@A.com'),
(284, 1554925665, 0, 'q@A.com'),
(285, 1554925674, 0, 'q@A.com'),
(286, 1554925719, 0, 'q@A.com'),
(287, 1554925737, 0, 'q@A.com'),
(288, 1554925745, 0, 'q@A.com'),
(289, 1554925811, 0, 'q@A.com'),
(290, 1554925816, 0, 'q@A.com'),
(291, 1554925840, 0, 'q@A.com'),
(292, 1554925842, 0, 'q@A.com'),
(293, 1554925928, 0, 'q@A.com'),
(294, 1554926051, 0, 'q@A.com'),
(295, 1554926053, 0, 'q@A.com'),
(296, 1554926165, 0, 'q@A.com'),
(297, 1554926203, 0, 'q@A.com'),
(298, 1554926205, 0, 'q@A.com'),
(299, 1556016798, 0, 'a@a.com'),
(300, 1556016965, 0, 'e@e.com'),
(301, 1556017059, 0, 'e@e.com'),
(302, 1557216466, 0, 'e@e.com'),
(303, 1557216524, 0, 'e@e.com'),
(304, 1557216589, 0, 'e@e.com'),
(305, 1557219049, 0, 'e@e.com'),
(306, 1557219060, 0, 'e@e.com'),
(307, 1557219147, 0, 'a@a.com'),
(308, 1557219156, 0, 'a@a.com'),
(309, 1557219399, 0, 'e@e.com'),
(310, 1557219404, 0, 'e@e.com'),
(311, 1557219515, 0, 'e@e.com'),
(312, 1557219523, 0, 'e@e.com'),
(313, 1557219535, 0, 'e@e.com'),
(314, 1557219548, 0, 'e@e.com'),
(315, 1557219619, 0, 'a@a.com'),
(316, 1557219624, 0, 'a@a.com'),
(317, 1557219661, 0, 'a@a.com'),
(318, 1557220134, 0, 'q@A.com'),
(319, 1557220142, 0, 'q@A.com'),
(320, 1557220148, 0, 'q@A.com'),
(321, 1557220152, 0, 'q@A.com'),
(322, 1557221994, 0, 'C@A.com'),
(323, 1557222011, 0, 'C@A.com'),
(324, 1557222081, 0, 'C@A.com'),
(325, 1557222101, 0, 'C@A.com'),
(326, 1557222176, 0, 'C@A.com'),
(327, 1557222197, 0, 'C@A.com'),
(328, 1557222206, 0, 'C@A.com'),
(329, 1557222339, 0, 'C@A.com'),
(330, 1557222455, 0, 'C@A.com'),
(331, 1557222470, 0, 'C@A.com'),
(332, 1557222472, 0, 'C@A.com'),
(333, 1557222473, 0, 'C@A.com'),
(334, 1557222478, 0, 'C@A.com'),
(335, 1557222591, 0, 'C@A.com'),
(336, 1557222715, 0, 'CC@A.com'),
(337, 1557222747, 0, 'CC@A.com'),
(338, 1557222884, 0, 'CC@A.com'),
(339, 1557222888, 0, 'CC@A.com'),
(340, 1557222895, 0, 'CC@A.com'),
(341, 1557222902, 0, 'CC@A.com'),
(342, 1557222908, 0, 'CC@A.com'),
(343, 1557222917, 0, 'CC@A.com'),
(344, 1557222978, 0, 'CC@A.com'),
(345, 1557223040, 0, 'CC@A.com'),
(346, 1557223045, 0, 'CC@A.com'),
(347, 1557223074, 0, 'CC@A.com'),
(348, 1557223091, 0, 'CC@A.com'),
(349, 1557223124, 0, 'CC@A.com'),
(350, 1557223300, 0, 'CC@A.com'),
(351, 1557223314, 0, 'CC@A.com'),
(352, 1557223317, 0, 'CC@A.com'),
(353, 1557223320, 0, 'CC@A.com'),
(354, 1557223330, 0, 'CC@A.com'),
(355, 1557223354, 0, 'CC@A.com'),
(356, 1557223466, 0, 'CC@A.com'),
(357, 1557223518, 0, 'CC@A.com'),
(358, 1557223525, 0, 'CC@A.com'),
(359, 1557223565, 0, 'CC@A.com'),
(360, 1557223615, 0, 'CC@A.com'),
(361, 1557223985, 0, 'CC@A.com'),
(362, 1557224010, 0, 'CC@A.com'),
(363, 1557224027, 0, 'CC@A.com'),
(364, 1557224050, 0, 'CC@A.com'),
(365, 1557224115, 0, 'CC@A.com'),
(366, 1557224161, 0, 'CC@A.com'),
(367, 1557224218, 0, 'CC@A.com'),
(368, 1557224259, 0, 'CC@A.com'),
(369, 1557310096, 0, 'e@e.com'),
(370, 1557310348, 0, 'e@e.com'),
(371, 1557310462, 0, 'e@e.com'),
(372, 1557310582, 0, 'Af@Af.com'),
(373, 1557310629, 0, 'Af@Af.com'),
(374, 1557310667, 0, 'Af@Af.com'),
(375, 1557310695, 0, 'Af@Af.com'),
(376, 1557310760, 0, 'Af@Af.com'),
(377, 1557310766, 0, 'Af@Af.com'),
(378, 1557310816, 0, 'Arg@Arg.com'),
(379, 1557310921, 0, 'Arg@Arg.com'),
(380, 1557310935, 0, 'Arg@Arg.com'),
(381, 1557310996, 0, 'Arg@Arg.com'),
(382, 1557311008, 0, 'Arg@Arg.com'),
(383, 1557311024, 0, 'Arg@Arg.com'),
(384, 1557311116, 0, 'Arg@Arg.com'),
(385, 1557311184, 0, 'Arg@Arg.com'),
(386, 1557311194, 0, 'Arg@Arg.com'),
(387, 1557311216, 0, 'Arg@Arg.com'),
(388, 1557311278, 0, 'Arg@Arg.com'),
(389, 1557311348, 0, 'Arg@Arg.com'),
(390, 1557311361, 0, 'Arg@Arg.com'),
(391, 1557311411, 0, 'Arg@Arg.com'),
(392, 1557311626, 0, 'Arg@Arg.com'),
(393, 1557311637, 0, 'Arg@Arg.com'),
(394, 1557311649, 0, 'Arg@Arg.com'),
(395, 1557311702, 0, 'Ab@A.com'),
(396, 1557311738, 0, 'Ab@A.com'),
(397, 1557311752, 0, 'Ab@A.com'),
(398, 1557311782, 0, 'Ab@A.com'),
(399, 1557311797, 0, 'Ab@A.com'),
(400, 1557311859, 0, 'q@q.com'),
(401, 1557311966, 0, 'r@r.com'),
(402, 1557311981, 0, 'r@r.com'),
(403, 1557312239, 0, 'r@r.com'),
(490, 1557393316, 1, 'ww@ww.com'),
(491, 1557393353, 1, 'ww@ww.com'),
(492, 1557393423, 1, 'ww@ww.com'),
(493, 1557393436, 1, 'ww@ww.com'),
(494, 1557393464, 1, 'ww@ww.com'),
(495, 1557393621, 1, 'ww@ww.com'),
(496, 1557393730, 1, 'ww@ww.com'),
(497, 1557393776, 1, 'ww@ww.com'),
(498, 1557393857, 1, 'ww@ww.com'),
(499, 1557393889, 1, 'ww@ww.com'),
(500, 1557393932, 1, 'ww@ww.com'),
(501, 1557394192, 0, 'ww@ww.com'),
(502, 1557394367, 1, 'ww@ww.com'),
(503, 1557399263, 1, 'ww@ww.com'),
(504, 1557400483, 1, 'ww@ww.com'),
(505, 1557405320, 1, 'ww@ww.com'),
(506, 1557413634, 1, 'ww@ww.com'),
(507, 1557417246, 1, 'ww@ww.com'),
(508, 1557475299, 1, 'ww@ww.com'),
(509, 1557475928, 1, 'ww@ww.com'),
(510, 1557475944, 0, 'wrrrr@ww.com'),
(511, 1557476003, 0, 'wwrrrrrrrrr@ww.com'),
(512, 1557477215, 1, 'Arg@Arg.com');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_fk` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_fk` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `user_fk`, `title`, `level_fk`, `description`, `date`) VALUES
(2, 42, 'Ajax::problem', 1, 'My problem is that every time I bla bla bla', '2019-05-09 14:39:57'),
(3, 42, 'JQuery::problem', 6, 'in this field i write a description of my problem', '2019-05-09 14:40:05'),
(11, 42, 'Javascript::ISSUE', 6, 'I must tell you that in this field i\'m wondering to write a short description of my problem.', '2019-05-09 14:40:19'),
(13, 42, 'Angular::NOT CLEAR', 5, 'I Have this huge problem where... I must tell you that in this field i\'m wondering to write a short description of my problem.', '2019-05-09 14:40:27'),
(14, 42, 'tit', 2, 'dfgadgdgfadfaadf', '2019-05-09 14:40:37'),
(15, 42, '<script>alert(\'under attack\')</script>', 2, 'under attack!', '2019-05-09 14:40:39'),
(16, 42, '<script>alert(\'under attack\')</script>', 5, '<script>alert(\'under attack\')</script>', '2019-05-09 14:40:43'),
(17, 42, '<script>alert(\'under attack\')</script>', 5, 'blablabla', '2019-05-09 14:40:45'),
(26, 42, 'bam!', 5, 'hsdjhsdjhjds', '2019-05-10 08:04:20'),
(27, 42, 'bam!', 4, 'bla', '2019-05-10 08:04:59'),
(28, 42, 'dshdsjhsdhj', 5, 'hsdjhdsjhdsfjh', '2019-05-10 08:05:38');

-- --------------------------------------------------------

--
-- Table structure for table `questions_tags`
--

CREATE TABLE `questions_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `questions_fk` bigint(20) UNSIGNED NOT NULL,
  `tags_fk` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions_tags`
--

INSERT INTO `questions_tags` (`id`, `questions_fk`, `tags_fk`) VALUES
(1, 2, 4),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `show_questions`
-- (See below for the actual view)
--
CREATE TABLE `show_questions` (
`id` bigint(20) unsigned
,`title` varchar(50)
,`level_fk` bigint(20) unsigned
,`description` varchar(250)
,`date` timestamp
,`username` varchar(25)
,`levels_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(1, 'Javascript'),
(2, 'JQuery'),
(3, 'Angular'),
(4, 'Ajax');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varbinary(64) NOT NULL,
  `blocked` tinyint(1) NOT NULL,
  `blocked_date` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `blocked`, `blocked_date`) VALUES
(1, '', 'a@a.com', 0x313233343536, 1, 0),
(2, '', 'B@B.com', 0x313233343536, 1, 0),
(3, '', 'c@c.com', 0x313233343536, 0, 1550837892),
(4, '', 'G@G.com', 0x313233343536, 0, 1553256641),
(22, '', 'h@h.com', 0x313233343536, 0, 1553256858),
(23, '', 'f@f.com', 0x313233343536, 0, 1553256902),
(24, '', 'y@y.com', 0x313233343536, 0, 1553256951),
(25, '', 't@A.com', 0x435a3063555042564875383d, 0, 1553257015),
(26, '', 'u@u.com', 0x595157432f78395053476f3d, 0, 1553257326),
(27, '', 'p@p.com', 0x54304b5145307363306c493d, 0, 1553258063),
(28, '', 'AA@A.com', 0x243279243035247a74574e465042457a59536645556a5775486d38654f786d666c5159304735626b4c555347494476486d7a625975684c696e656b53, 0, 1553865036),
(30, '', 'Af@Af.com', 0x243279243035242f4c38577434562f4843453841506e6c75665555714f304777747157507743796759414c764b6b5a4d6e68334136594b554e4f3957, 0, 1554911858),
(31, '', 'Arg@Arg.com', 0x243279243035246c313354704b306b5479762f364a76634c4955534e4f796e51446149576963513673795838664e63446c4e445450756d587849442e, 0, 1554913800),
(32, '', 'Ab@A.com', 0x243279243130243441664f4c33317539577744634a736158616d57314f79355a6d456143632e5852797a626449694271535663696c7743436844594f, 0, 1554916012),
(33, '', 'B@A.com', 0x243279243035244a7769394b343949704c713949722e523667734667754e366f51473462644a58306a454c4a65695278714b58386a616b3237444869, 0, 1554919099),
(34, '', 'C@A.com', 0x24327924303524442e364f453159704275415a6c4d7843796178503665727663726746724e764e7346315453394e4c7a6c584e4334664c4b51785269, 0, 1554919126),
(35, '', 'CC@A.com', 0x24327924303524544363696b787a726c6a4b72425a337635776f72677571543838466f686f765a59703554754832754f61615337554f4e572e64344b, 0, 1554919156),
(36, '', 'Az@A.com', 0x243279243035245a6248586f6e5636562f384d51377950476d506d394f35577078535a326357685061786e4f7957696b6a66344c324b524e33336f4f, 0, 1554919420),
(37, '', 'q@A.com', 0x243279243035244f37436d49397a6d69776e396c4f4a6949456a70376572634e6563744b466353556f7a6b6d542f695a313337454556745364523253, 0, 1554923764),
(38, '', '', 0x24327924303524424271494e4a6a7a43677543454c375461514b66524f754e394d66466c3152704476342e4854764c2e77444d684b4b455a79304265, 0, 1556016951),
(39, '', 'e@e.com', 0x243279243035247249595251494a4f6e6b43705162362e766877654e7579622f6662586c486d5949793754347535314771587737477947583835772e, 0, 1556017191),
(40, 'eee', 'q@q.com', 0x2432792430352451324a4c44744278306d516e567a78314b74735a572e7634734479355047737946504c615379486336472f61674a5339336d315743, 0, 1557311828),
(41, 'eee', 'r@r.com', 0x243279243035243656484379584b4c7846545a39376655335739384c655977374c6b6762486a7849736e4256753344594b6e4c464f776c5831354375, 0, 1557311963),
(42, 'c4m1', 'ww@ww.com', 0x2432792430352436774e6831703259436d75375271584e496a762e672e584171315158362e63394f645063557a646f2f724d75676d3333666264556d, 0, 1557312372);

-- --------------------------------------------------------

--
-- Structure for view `show_questions`
--
DROP TABLE IF EXISTS `show_questions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `show_questions`  AS  select `questions`.`id` AS `id`,`questions`.`title` AS `title`,`questions`.`level_fk` AS `level_fk`,`questions`.`description` AS `description`,`questions`.`date` AS `date`,`users`.`username` AS `username`,`levels`.`name` AS `levels_name` from ((`questions` join `users` on((`questions`.`user_fk` = `users`.`id`))) join `levels` on((`questions`.`level_fk` = `levels`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `likes_answers`
--
ALTER TABLE `likes_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `likes_questions`
--
ALTER TABLE `likes_questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_fk` (`user_fk`),
  ADD KEY `questions_ibfk_3` (`level_fk`);

--
-- Indexes for table `questions_tags`
--
ALTER TABLE `questions_tags`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `questions_fk` (`questions_fk`),
  ADD KEY `tags_fk` (`tags_fk`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `password` (`password`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `likes_answers`
--
ALTER TABLE `likes_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `likes_questions`
--
ALTER TABLE `likes_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=513;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `questions_tags`
--
ALTER TABLE `questions_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_3` FOREIGN KEY (`level_fk`) REFERENCES `levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
