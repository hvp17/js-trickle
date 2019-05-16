-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 16, 2019 at 05:30 PM
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
  `answer` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_fk`, `user_fk`, `answer`, `date`) VALUES
(1, 33, 5, 'blablabla', '2019-05-15 16:32:30'),
(2, 33, 4, 'avenpvnpaevne', '2019-05-15 16:32:30'),
(3, 33, 4, 'number 3', '2019-05-15 16:32:30'),
(4, 34, 1, 'aepogaegnea', '2019-05-15 16:32:30'),
(5, 34, 4, 'gkaevpae', '2019-05-15 16:32:30');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `img`) VALUES
(1, 'avatar.jpg');

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
(1, 'Easy'),
(2, 'Intermediate'),
(3, 'Advanced');

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
(299, 1557216308, 0, 'e@e.come'),
(300, 1557216365, 0, 'e@e.comd'),
(301, 1557219604, 0, 'e@e.coms'),
(302, 1557219699, 0, 'e@e.coms'),
(303, 1557219719, 0, 'e@e.coms'),
(304, 1557219743, 0, 'e@e.com'),
(305, 1557219745, 0, 'e@e.com'),
(306, 1557219748, 0, 'e@e.com'),
(307, 1557219832, 0, 'e@e.coms'),
(308, 1557219908, 0, 'e@e.coms'),
(309, 1557220430, 0, 'e@e.com'),
(310, 1557220544, 0, 'e@e.com'),
(311, 1557220544, 0, 'e@e.com'),
(312, 1557220545, 0, 'e@e.com'),
(313, 1557221428, 0, 'e@e.com'),
(314, 1557221466, 0, 'e@e.com'),
(315, 1557221517, 0, 'e@e.com'),
(316, 1557221565, 0, 'e@e.com'),
(317, 1557221609, 0, 'e@e.com'),
(318, 1557221632, 0, 'e@e.com'),
(319, 1557221662, 0, 'e@e.com'),
(320, 1557221695, 0, 'e@e.com'),
(321, 1557221708, 0, 'e@e.com'),
(322, 1557221716, 0, 'e@e.com'),
(323, 1557221719, 0, 'e@e.com'),
(324, 1557221722, 0, 'e@e.com'),
(325, 1557221813, 0, 'e@e.com'),
(326, 1557221827, 0, 'e@e.com'),
(327, 1557221854, 0, 'e@e.com'),
(328, 1557221874, 0, 'e@e.com'),
(329, 1557221883, 0, 'e@e.com'),
(330, 1557221885, 0, 'e@e.com'),
(331, 1557221887, 0, 'e@e.com'),
(332, 1557221899, 0, 'e@e.com'),
(333, 1557221910, 0, 'e@e.com'),
(334, 1557221912, 0, 'e@e.com'),
(335, 1557221913, 0, 'e@e.com'),
(336, 1557221980, 0, 'e@e.com'),
(337, 1557222009, 0, 'e@e.com'),
(338, 1557222044, 0, 'e@e.com'),
(339, 1557222056, 0, 'e@e.com'),
(340, 1557222061, 0, 'e@e.com'),
(341, 1557222108, 0, 'e@e.com'),
(342, 1557222164, 0, 'e@e.com'),
(343, 1557222189, 0, 'e@e.com'),
(344, 1557222267, 0, 'e@e.com'),
(345, 1557222312, 0, 'e@e.com'),
(346, 1557222320, 0, 'a@e.com'),
(347, 1557222368, 0, 'e@e.com'),
(348, 1557222375, 0, 'e@e.com'),
(349, 1557222411, 0, 'e@e.com'),
(350, 1557222419, 0, 'e@e.com'),
(351, 1557222484, 0, 'abab@e.com'),
(352, 1557222517, 0, 'e@e.com'),
(353, 1557222591, 0, 'efaw@e.com'),
(354, 1557222594, 0, 'efaw@e.com'),
(355, 1557222597, 0, 'efaw@e.com'),
(356, 1557222599, 0, 'efaw@e.com'),
(357, 1557222599, 0, 'efaw@e.com'),
(358, 1557222600, 0, 'efaw@e.com'),
(359, 1557222620, 0, 'e@e.com'),
(360, 1557222622, 0, 'e@e.com'),
(361, 1557222649, 0, 'eefa@e.com'),
(362, 1557222651, 0, 'eefa@e.com'),
(363, 1557222654, 0, 'eefa@e.com'),
(364, 1557222666, 0, 'esd@e.com'),
(365, 1557222713, 0, 'e@edssd.com'),
(366, 1557222756, 0, 'dase@e.com'),
(367, 1557222794, 0, 'e@easd.com'),
(368, 1557222825, 0, 'e@e.com'),
(369, 1557222853, 0, 'e@e.com'),
(370, 1557222899, 0, 'e@e.com'),
(371, 1557222913, 0, 'e@e.com'),
(372, 1557223056, 0, 'emmaam@e.com'),
(373, 1557223060, 0, 'emmaam@e.com'),
(374, 1557223066, 0, 'emmaam@e.com'),
(375, 1557223069, 0, 'emmaam@e.com'),
(376, 1557223071, 0, 'emmaam@e.com'),
(377, 1557223141, 0, 'emmaam@e.com'),
(378, 1557223153, 0, 'emmaam@e.com'),
(379, 1557223175, 0, 'emmaam@e.com'),
(380, 1557223687, 0, 'emmaam@e.com'),
(381, 1557223692, 0, 'emmaam@e.com'),
(382, 1557223726, 0, 'emmaam@e.com'),
(383, 1557223740, 0, 'emmaam@e.com'),
(384, 1557223756, 0, 'emmaam@e.com'),
(385, 1557223759, 0, 'emmaam@e.com'),
(386, 1557223762, 0, 'emmaam@e.com'),
(387, 1557223871, 0, 'emmaam@e.com'),
(388, 1557223970, 0, 'emmaam@e.com'),
(389, 1557223975, 0, 'emmaamsd@e.com'),
(390, 1557224077, 0, 'emmaamfs@e.com'),
(391, 1557224106, 0, 'sdsdemmaam@e.com'),
(392, 1557224160, 0, 'emmaam@eaeffe.com'),
(393, 1557224215, 0, 'emmaaaefm@e.com'),
(394, 1557224218, 0, 'emmaaaefm@e.com'),
(395, 1557224224, 0, 'emmaaaefm@e.com'),
(396, 1557224269, 0, 'emmaageagem@e.com'),
(397, 1557224273, 0, 'emmaageagem@e.com'),
(398, 1557224355, 0, 'emmapaoegnam@e.com'),
(399, 1557224360, 0, 'emmapaoegnam@e.com'),
(400, 1557224363, 0, 'emmapaoegnam@e.com'),
(401, 1557224916, 0, 'eeee@eeee.com'),
(402, 1557224918, 0, 'eeee@eeee.com'),
(403, 1557224920, 0, 'eeee@eeee.com'),
(404, 1557224928, 0, 'eeee@eeee.com'),
(405, 1557225095, 0, 'e@e.com'),
(406, 1557225097, 0, 'e@e.com'),
(407, 1557225103, 0, 'e@e.com'),
(408, 1557225145, 0, 'e@e.com'),
(409, 1557225153, 0, 'e@e.com'),
(410, 1557225157, 0, 'e@e.com'),
(411, 1557225159, 0, 'e@e.com'),
(412, 1557225161, 0, 'e@e.com'),
(413, 1557225180, 0, 'e@e.com'),
(414, 1557225185, 0, 'e@e.com'),
(415, 1557225270, 0, 'mo@mo.com'),
(416, 1557225481, 0, 'mo@mo.com'),
(417, 1557225589, 0, 'mo@mo.com'),
(418, 1557225610, 0, 'mo@mo.com'),
(419, 1557225657, 0, 'mom@mom.com'),
(420, 1557225708, 0, 'mom@mom.com'),
(421, 1557225731, 0, 'mom@mom.com'),
(422, 1557225783, 0, 'eon@e.com'),
(423, 1557225804, 0, 'eon@e.com'),
(424, 1557225805, 0, 'eon@e.com'),
(425, 1557225862, 0, 'eeg@e.com'),
(426, 1557426400, 0, 'ww@ww.com'),
(427, 1557426477, 1, 'e@e.com'),
(428, 1557426686, 0, 'ww@ww.com'),
(429, 1557426701, 0, 'ww@ww.com'),
(430, 1557426704, 0, 'ww@ww.com'),
(431, 1557476079, 0, 'eon@e.com'),
(514, 1557569040, 0, 'ww@ww.com'),
(515, 1557569135, 0, 'ee@ee.com'),
(516, 1557569187, 1, 'e@e.com'),
(517, 1557570584, 1, 'e@e.com'),
(518, 1557571396, 1, 'e@e.com'),
(519, 1557573684, 1, 'e@e.com'),
(520, 1557592165, 1, 'e@e.com'),
(521, 1557735811, 1, 'eon@e.com'),
(522, 1558020583, 1, 'eon@e.com');

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
(33, 2, 'new test', 1, 'aeffea', '2019-05-11 16:29:52'),
(34, 2, 'aegeg', 3, 'argrgarag', '2019-05-11 16:30:05'),
(35, 1, 'test1', 1, 'okokok', '2019-05-13 08:17:21'),
(36, 1, 'test2', 2, 'okokokok', '2019-05-13 08:17:21'),
(37, 1, 'test3', 3, 'okokokokokok', '2019-05-13 08:17:37');

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
(8, 33, 4),
(9, 33, 2),
(10, 34, 1),
(11, 35, 4),
(12, 36, 1),
(13, 37, 2);

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
  `image_fk` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varbinary(64) NOT NULL,
  `blocked` tinyint(1) NOT NULL,
  `blocked_date` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `image_fk`, `email`, `password`, `blocked`, `blocked_date`) VALUES
(1, 'eeeeee', 1, 'eeee@eeee.com', 0x243279243035243755512e4f37764268367a565a55575839544c5053756568546169413632364d6c774348594350774a7564784275474c6e57565943, 0, 1556015833),
(2, 'eee', 1, 'e@e.com', 0x24327924303524766e68795a484b574d7045433874385a2e376748732e554c7175624c534a63586b726865383539486a4d73614448336f55462f5953, 0, 1556016150),
(3, 'momo', 1, 'mo@mo.com', 0x243279243035243232694a6576654a4c35435373794a63305454763575386e4c326773336938383775375a484e704b6d33746f4d795a2f776c61472e, 0, 1557225261),
(4, 'momommoom', 1, 'mom@mom.com', 0x24327924303524313142726d5936796f375a4c4c4c65362e74412f6c6549476b776572365956386270576d6550563651516e78696e2f2f6f4c744a71, 0, 1557225646),
(5, 'eon', 1, 'eon@e.com', 0x243279243035246a435977584270493755572e33303378592f5247392e73574a46655539672e5655496273527974484c394a33645155653647477579, 0, 1557225766),
(6, 'eeege', 1, 'eeg@e.com', 0x24327924303524467961414c78574844657863455a6b7a452f526c364f4b6d3852417441616759496e52674f5479516e2e30315932716952626a6e2e, 0, 1557225857);

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
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `question_fk` (`question_fk`),
  ADD KEY `user_fk` (`user_fk`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
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
  ADD KEY `password` (`password`),
  ADD KEY `users_ibfk_1` (`image_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=523;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `questions_tags`
--
ALTER TABLE `questions_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_fk`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_3` FOREIGN KEY (`level_fk`) REFERENCES `levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions_tags`
--
ALTER TABLE `questions_tags`
  ADD CONSTRAINT `questions_tags_ibfk_1` FOREIGN KEY (`questions_fk`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_tags_ibfk_2` FOREIGN KEY (`tags_fk`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`image_fk`) REFERENCES `images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
