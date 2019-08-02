-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 02, 2019 at 11:47 PM
-- Server version: 5.5.62-0+deb8u1
-- PHP Version: 5.6.40-0+deb8u4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `speechvip`
--

-- --------------------------------------------------------

--
-- Table structure for table `audio`
--

CREATE TABLE IF NOT EXISTS `audio` (
`id` int(11) NOT NULL,
  `id_video` int(11) DEFAULT NULL,
  `id_format` int(11) DEFAULT NULL,
  `nom` varchar(500) CHARACTER SET utf8 NOT NULL,
  `duree` double DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audio`
--

INSERT INTO `audio` (`id`, `id_video`, `id_format`, `nom`, `duree`) VALUES
(1, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_192bitrate_mono', 270.211678),
(2, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._192bitrate_mono', 299.78229);

-- --------------------------------------------------------

--
-- Table structure for table `audio_cut`
--

CREATE TABLE IF NOT EXISTS `audio_cut` (
`id` int(11) NOT NULL,
  `id_audio` int(11) NOT NULL,
  `id_format` int(11) DEFAULT NULL,
  `duree` double NOT NULL,
  `nom` varchar(500) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `format`
--

CREATE TABLE IF NOT EXISTS `format` (
`id` int(11) NOT NULL,
  `format` varchar(254) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `langue`
--

CREATE TABLE IF NOT EXISTS `langue` (
`id` int(11) NOT NULL,
  `language` varchar(254) CHARACTER SET utf8 NOT NULL,
  `languageCode` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `langue`
--

INSERT INTO `langue` (`id`, `language`, `languageCode`) VALUES
(1, 'Anglais', 'en-US');

-- --------------------------------------------------------

--
-- Table structure for table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
`id` int(11) NOT NULL,
  `PrenomNom` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personne`
--

INSERT INTO `personne` (`id`, `PrenomNom`) VALUES
(1, 'Barack Obama'),
(2, 'Donald Trump');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
`id` int(11) NOT NULL,
  `id_personne` int(11) DEFAULT NULL,
  `id_language` int(11) DEFAULT NULL,
  `id_format` int(11) DEFAULT NULL,
  `nom` varchar(254) CHARACTER SET utf8 NOT NULL,
  `duree` double NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `id_personne`, `id_language`, `id_format`, `nom`, `duree`) VALUES
(4, 1, 1, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights.mp4', 270.2),
(5, 2, 1, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal..mp4', 299.766133);

-- --------------------------------------------------------

--
-- Table structure for table `video_cut`
--

CREATE TABLE IF NOT EXISTS `video_cut` (
`id` int(11) NOT NULL,
  `id_video` int(11) DEFAULT NULL,
  `id_format` int(11) DEFAULT NULL,
  `nom` varchar(500) NOT NULL,
  `duree` double NOT NULL,
  `mot` varchar(500) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=564 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video_cut`
--

INSERT INTO `video_cut` (`id`, `id_video`, `id_format`, `nom`, `duree`, `mot`) VALUES
(1, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_0', 0.5, 'hello'),
(2, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_1', 0.5, 'it''s'),
(3, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_3', 0.29999999999999893, 'good'),
(4, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_2', 0.6000000000000001, 'Chicago'),
(5, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_4', 0.10000000000000142, 'to'),
(6, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_5', 0.09999999999999964, 'be'),
(7, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_6', 0.29999999999999893, 'home'),
(8, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_7', 0.3999999999999986, 'if'),
(9, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_8', 0.3000000000000007, 'the'),
(10, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_9', 0.7000000000000028, 'reboot'),
(11, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_10', 0.10000000000000142, 'I'),
(12, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_13', 0.09999999999999964, 'had'),
(13, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_12', 0.09999999999999787, 'our'),
(14, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_11', 0.5, 'America'),
(15, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_14', 0.1999999999999993, 'told'),
(16, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_16', 0.1999999999999993, 'would'),
(17, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_15', 0.40000000000000213, 'Auto'),
(18, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_17', 0.3000000000000007, 'you'),
(19, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_18', 0.40000000000000036, 'reverse'),
(20, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_20', 0.1999999999999993, 'eight'),
(21, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_21', 0, 'the'),
(22, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_22', 0.09999999999999964, 'years'),
(23, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_19', 0.5, 'industry'),
(24, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_23', 0.3000000000000007, 'Great'),
(25, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_24', 0.3000000000000007, 'ago'),
(26, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_25', 0.3000000000000007, 'Recession'),
(27, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_26', 0.40000000000000213, 'and'),
(28, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_27', 0.5999999999999979, 'unleash'),
(29, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_28', 0.20000000000000284, 'the'),
(30, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_29', 0.5999999999999979, 'longest'),
(31, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_30', 0.10000000000000142, 'stretch'),
(32, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_31', 0.3000000000000007, 'of'),
(33, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_32', 0.29999999999999716, 'job'),
(34, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_33', 0.40000000000000213, 'creation'),
(35, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_34', 0.3000000000000007, 'in'),
(36, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_35', 0.09999999999999787, 'our'),
(37, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_36', 0.5, 'history'),
(38, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_38', 0.3999999999999986, 'are'),
(39, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_37', 0.3999999999999986, '5'),
(40, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_39', 0.10000000000000142, 'we'),
(41, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_41', 0.20000000000000284, 'would'),
(42, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_40', 0.40000000000000213, 'told'),
(43, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_42', 0.19999999999999574, 'open'),
(44, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_43', 0.09999999999999787, 'you'),
(45, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_44', 0.10000000000000142, 'up'),
(46, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_45', 0.20000000000000284, 'a'),
(47, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_46', 0.09999999999999432, 'new'),
(48, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_47', 0.30000000000000426, 'chapter'),
(49, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_48', 0.5, 'with'),
(50, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_49', 0.10000000000000142, 'the'),
(51, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_50', 0.3999999999999986, 'Cuban'),
(52, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_51', 0.10000000000000142, 'people'),
(53, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_52', 1.2999999999999972, 'shut'),
(54, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_53', 0.20000000000000284, 'down'),
(55, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_54', 0.29999999999999716, 'around'),
(56, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_55', 0.3999999999999986, 'nuclear'),
(57, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_56', 0.6000000000000014, 'weapons'),
(58, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_57', 0.3999999999999986, 'program'),
(59, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_58', 0.30000000000000426, 'without'),
(60, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_59', 0.3999999999999986, 'firing'),
(61, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_60', 0.10000000000000142, 'a'),
(62, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_61', 0.09999999999999432, 'shot'),
(63, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_63', 0.4000000000000057, 'if'),
(64, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_64', 0.09999999999999432, 'I'),
(65, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_62', 0.5, 'take'),
(66, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_65', 0.20000000000000284, 'had'),
(67, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_67', 0.20000000000000284, 'told'),
(68, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_66', 0.20000000000000284, 'out'),
(69, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_68', 0.29999999999999716, 'you'),
(70, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_69', 0.09999999999999432, 'the'),
(71, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_70', 0.10000000000000142, 'that'),
(72, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_72', 0.29999999999999716, 'we'),
(73, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_73', 0.10000000000000142, 'would'),
(74, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_71', 0.9000000000000057, 'Mastermind'),
(75, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_74', 0.3999999999999986, 'win'),
(76, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_75', 0.19999999999999574, 'of'),
(77, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_76', 0.10000000000000142, 'the'),
(78, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_77', 0.8000000000000043, '9/11'),
(79, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_78', 0.5, 'marriage'),
(80, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_79', 0.29999999999999716, 'equality'),
(81, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_80', 0.7999999999999972, 'insecure'),
(82, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_81', 1, 'the'),
(83, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_82', 0.5, 'wife'),
(84, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_83', 0.10000000000000142, 'to'),
(85, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_84', 0.3999999999999986, 'health'),
(86, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_85', 0.30000000000000426, 'insurance'),
(87, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_86', 1.1000000000000014, 'for'),
(88, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_87', 0.3999999999999986, 'another'),
(89, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_88', 0.5, '20'),
(90, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_89', 0.6000000000000014, 'million'),
(91, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_90', 0.3999999999999986, 'of'),
(92, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_91', 0.10000000000000142, 'our'),
(93, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_0', 0.3, 'I'),
(94, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_92', 0.5999999999999943, 'fellow'),
(95, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_93', 0.20000000000000284, 'citizens'),
(96, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_1', 0.39999999999999997, 'give'),
(97, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_2', 0.20000000000000007, 'too'),
(98, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_3', 0.20000000000000007, 'many'),
(99, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_4', 0.5, 'people'),
(100, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_5', 0.2999999999999998, 'before'),
(101, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_6', 0.30000000000000027, 'this'),
(102, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_7', 0.2999999999999998, 'before'),
(103, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_8', 0.2999999999999998, 'two'),
(104, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_9', 0.30000000000000027, 'months'),
(105, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_10', 0, 'ago'),
(106, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_11', 0.10000000000000009, 'I'),
(107, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_12', 0.09999999999999964, 'was'),
(108, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_13', 0.10000000000000009, 'a'),
(109, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_14', 0.5, 'businessman'),
(110, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_15', 0.19999999999999973, 'I'),
(111, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_16', 0.40000000000000036, 'give'),
(112, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_17', 0.20000000000000018, 'to'),
(113, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_18', 0.39999999999999947, 'everybody'),
(114, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_19', 0.20000000000000018, 'when'),
(115, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_20', 0, 'they'),
(116, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_21', 0.5, 'call'),
(117, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_95', 0.29999999999999716, 'you'),
(118, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_22', 0.10000000000000053, 'I'),
(119, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_97', 0.20000000000000284, 'might'),
(120, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_96', 0.5, 'sites'),
(121, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_98', 0, 'have'),
(122, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_94', 0.4000000000000057, 'if'),
(123, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_23', 0.39999999999999947, 'give'),
(124, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_99', 0.20000000000000284, 'were'),
(125, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_100', 0.20000000000000284, 'said'),
(126, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_101', 0.09999999999999432, 'I'),
(127, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_24', 0.40000000000000036, 'and'),
(128, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_102', 0.4000000000000057, 'settled'),
(129, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_25', 0.09999999999999964, 'you'),
(130, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_26', 0.10000000000000053, 'know'),
(131, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_103', 0.29999999999999716, 'told'),
(132, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_27', 0.2999999999999998, 'what'),
(133, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_104', 0.20000000000000284, 'you'),
(134, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_28', 0.39999999999999947, 'when'),
(135, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_105', 0.10000000000000853, 'all'),
(136, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_29', 0.10000000000000053, 'I'),
(137, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_106', 0.09999999999999432, 'that'),
(138, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_30', 0.2999999999999998, 'need'),
(139, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_31', 0.40000000000000036, 'something'),
(140, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_32', 0.1999999999999993, 'from'),
(141, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_33', 0.3000000000000007, 'them'),
(142, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_34', 0.29999999999999893, 'two'),
(143, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_35', 0.20000000000000107, 'years'),
(144, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_36', 0.1999999999999993, 'later'),
(145, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_107', 0.6000000000000085, 'that''s'),
(146, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_108', 0.20000000000000284, 'what'),
(147, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_109', 0.09999999999999432, 'we'),
(148, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_110', 0.09999999999999432, 'did'),
(149, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_37', 0.1999999999999993, 'years'),
(150, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_38', 0.20000000000000107, 'later'),
(151, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_39', 0.5, 'I'),
(152, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_40', 0.1999999999999993, 'called'),
(153, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_41', 0.5, 'them'),
(154, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_42', 0.40000000000000036, 'they'),
(155, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_43', 0.3000000000000007, 'are'),
(156, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_44', 0.5, 'there'),
(157, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_45', 0.1999999999999993, 'for'),
(158, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_46', 0.1999999999999993, 'me'),
(159, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_47', 1.3000000000000007, 'broken'),
(160, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_48', 0.5, 'system'),
(161, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_111', 0.29999999999999716, 'I'),
(162, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_112', 0.5, 'after'),
(163, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_114', 0.09999999999999432, 'my'),
(164, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_113', 0.4000000000000057, 'can''t'),
(165, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_115', 0.29999999999999716, 'election'),
(166, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_116', 0.09999999999999432, 'do'),
(167, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_117', 0.30000000000001137, 'there'),
(168, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_118', 0.30000000000001137, 'that'),
(169, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_119', 0.3999999999999915, 'was'),
(170, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_49', 0.3999999999999986, 'and'),
(171, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_50', 0.10000000000000142, 'she'),
(172, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_51', 0.1999999999999993, 'came'),
(173, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_52', 0.1999999999999993, 'to'),
(174, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_53', 0.10000000000000142, 'my'),
(175, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_54', 0.1999999999999993, 'wedding'),
(176, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_55', 0.3000000000000007, 'you'),
(177, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_56', 0.10000000000000142, 'know'),
(178, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_57', 0.1999999999999993, 'why'),
(179, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_58', 0.8000000000000007, 'she'),
(180, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_59', 0.3999999999999986, 'had'),
(181, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_60', 0.10000000000000142, 'no'),
(182, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_61', 0.5, 'choice'),
(183, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_62', 0.1999999999999993, 'because'),
(184, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_63', 0.3000000000000007, 'I'),
(185, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_64', 0.3999999999999986, 'gave'),
(186, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_65', 0.3000000000000007, 'I'),
(187, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_66', 0.1999999999999993, 'don''t'),
(188, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_67', 0.10000000000000142, 'need'),
(189, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_68', 0.5, 'anybody''s'),
(190, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_69', 0.1999999999999993, 'money'),
(191, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_70', 0.1999999999999993, 'it''s'),
(192, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_71', 0.1999999999999993, 'nice'),
(193, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_72', 0.5, 'I'),
(194, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_73', 0.10000000000000142, 'don''t'),
(195, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_74', 0.3000000000000007, 'need'),
(196, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_75', 0.3999999999999986, 'anybody''s'),
(197, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_76', 0.1999999999999993, 'money'),
(198, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_122', 0.4000000000000057, 'was'),
(199, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_121', 0.3999999999999915, 'and'),
(200, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_120', 0.20000000000000284, 'talk'),
(201, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_123', 0.19999999999998863, 'never'),
(202, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_124', 0.20000000000000284, 'such'),
(203, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_125', 0.09999999999999432, 'of'),
(204, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_127', 0.09999999999999432, 'a'),
(205, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_126', 0.30000000000001137, 'realistic'),
(206, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_128', 0.10000000000000853, 'a'),
(207, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_77', 1, 'I''m'),
(208, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_129', 0.30000000000001137, 'vision'),
(209, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_78', 0.10000000000000142, 'using'),
(210, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_79', 0.3999999999999986, 'my'),
(211, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_130', 0.7999999999999972, 'post-racial'),
(212, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_80', 0.10000000000000142, 'own'),
(213, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_131', 1.0999999999999943, 'however'),
(214, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_81', 0.1999999999999993, 'money'),
(215, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_132', 0.20000000000000284, 'America'),
(216, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_133', 0.20000000000000284, 'well'),
(217, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_134', 0.5, 'intended'),
(218, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_136', 0.4000000000000057, 'if'),
(219, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_135', 0.5999999999999943, 'race'),
(220, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_137', 0.19999999999998863, 'you''re'),
(221, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_139', 0.20000000000000284, 'tired'),
(222, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_138', 0.4000000000000057, 'remains'),
(223, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_140', 0.29999999999999716, 'a'),
(224, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_141', 0.5999999999999943, 'potent'),
(225, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_142', 0.9000000000000057, 'and'),
(226, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_143', 0.4000000000000057, 'often'),
(227, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_144', 0.5999999999999943, 'divisive'),
(228, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_145', 0.09999999999999432, 'force'),
(229, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_146', 0.7000000000000028, 'in'),
(230, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_147', 0.10000000000000853, 'our'),
(231, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_148', 0.29999999999999716, 'society'),
(232, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_82', 0.1999999999999993, 'I''m'),
(233, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_83', 0.10000000000000142, 'not'),
(234, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_84', 0.1999999999999993, 'using'),
(235, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_85', 0.1999999999999993, 'the'),
(236, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_151', 0.4000000000000057, 'if'),
(237, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_150', 0.5, 'try'),
(238, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_149', 0.5, 'arguing'),
(239, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_86', 0.5, 'lobbyists'),
(240, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_152', 0.19999999999998863, 'you''re'),
(241, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_154', 0.09999999999999432, 'with'),
(242, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_155', 0.30000000000001137, 'disappointed'),
(243, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_87', 0.1999999999999993, 'I''m'),
(244, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_88', 0.10000000000000142, 'not'),
(245, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_153', 1, 'talking'),
(246, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_156', 0.6000000000000085, 'strangers'),
(247, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_158', 0.20000000000000284, 'with'),
(248, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_159', 0.20000000000000284, 'on'),
(249, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_89', 0.3000000000000007, 'using'),
(250, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_160', 0.19999999999998863, 'one'),
(251, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_161', 0.09999999999999432, 'the'),
(252, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_157', 0.8999999999999915, 'by'),
(253, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_162', 0.10000000000000853, 'of'),
(254, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_163', 0, 'internet'),
(255, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_164', 0.29999999999999716, 'your'),
(256, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_165', 0.29999999999999716, 'them'),
(257, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_90', 0.5999999999999979, 'donors'),
(258, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_167', 0.20000000000000284, 'in'),
(259, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_91', 0.10000000000000142, 'I'),
(260, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_166', 0.30000000000001137, 'ass'),
(261, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_92', 0.20000000000000284, 'don''t'),
(262, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_168', 0.29999999999999716, 'real'),
(263, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_93', 0.19999999999999574, 'care'),
(264, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_169', 0.09999999999999432, 'life'),
(265, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_94', 2.1000000000000014, 'what''s'),
(266, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_95', 0.10000000000000142, 'the'),
(267, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_96', 0.6000000000000014, 'worst'),
(268, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_97', 0.6999999999999957, 'Secretary'),
(269, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_98', 0.7000000000000028, 'of'),
(270, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_99', 0.3999999999999986, 'State'),
(271, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_100', 0.6000000000000014, 'in'),
(272, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_101', 0.10000000000000142, 'the'),
(273, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_102', 0.3999999999999986, 'history'),
(274, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_103', 0.10000000000000142, 'of'),
(275, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_104', 0.09999999999999432, 'our'),
(276, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_171', 0.4000000000000057, 'show'),
(277, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_105', 0.10000000000000142, 'country'),
(278, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_173', 0.3999999999999915, 'up'),
(279, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_172', 0.799999999999983, 'Diamond'),
(280, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_170', 0.7999999999999972, 'officials'),
(281, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_174', 0.7999999999999972, 'rabbit'),
(282, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_175', 0.6000000000000085, 'clipboard'),
(283, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_176', 0.5, 'get'),
(284, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_177', 0.20000000000000284, 'some'),
(285, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_178', 0.3999999999999915, 'signatures'),
(286, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_179', 0.5, 'and'),
(287, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_180', 0.29999999999999716, 'run'),
(288, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_181', 0.20000000000000284, 'for'),
(289, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_182', 0.20000000000000284, 'office'),
(290, 4, NULL, 'Barack_Obamas_final_speech_as_president_video_highlights_Cut_183', 0.5, 'yourself'),
(291, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_107', 0.29999999999999716, 'the'),
(292, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_108', 0.3999999999999986, 'that'),
(293, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_106', 0.5, 'Dwarfs'),
(294, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_110', 0.29999999999999716, 'she'),
(295, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_109', 0.3999999999999986, 'world'),
(296, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_111', 0.6000000000000014, 'touched'),
(297, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_112', 0.20000000000000284, 'blew'),
(298, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_114', 0.20000000000000284, 'up'),
(299, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_113', 0.29999999999999716, 'turned'),
(300, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_115', 0.09999999999999432, 'around'),
(301, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_116', 0.10000000000000142, 'to'),
(302, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_117', 0.4000000000000057, 'her'),
(303, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_118', 0.5, 'garbage'),
(304, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_119', 1.1999999999999957, 'every'),
(305, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_120', 0.30000000000000426, 'single'),
(306, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_121', 0.8999999999999986, 'thing'),
(307, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_124', 0.4000000000000057, 'and'),
(308, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_125', 0.09999999999999432, 'you'),
(309, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_122', 0.3999999999999986, 'the'),
(310, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_123', 0.5, 'what'),
(311, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_126', 0.20000000000000284, 'have'),
(312, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_129', 0.10000000000000142, 'a'),
(313, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_128', 0.10000000000000142, 'the'),
(314, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_130', 0.19999999999999574, 'son'),
(315, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_127', 0.4000000000000057, 'entire'),
(316, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_131', 0.3999999999999986, 'hell'),
(317, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_132', 0.5, 'Middle'),
(318, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_133', 0.09999999999999432, 'East'),
(319, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_134', 0.4000000000000057, 'in'),
(320, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_135', 0.09999999999999432, 'her'),
(321, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_136', 0.6000000000000014, 'rain'),
(322, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_137', 1.2000000000000028, 'and'),
(323, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_138', 0.10000000000000142, 'the'),
(324, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_139', 0.19999999999999574, 'rain'),
(325, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_140', 0.10000000000000142, 'is'),
(326, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_141', 0.3999999999999986, 'Barack'),
(327, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_142', 0.5, 'Obama'),
(328, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_143', 0.3999999999999986, 'and'),
(329, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_144', 0.10000000000000142, 'then'),
(330, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_145', 0.10000000000000142, 'you'),
(331, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_146', 0.10000000000000142, 'have'),
(332, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_147', 1.0999999999999943, 'how'),
(333, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_148', 0.10000000000000142, 'many'),
(334, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_149', 0.3999999999999986, 'times'),
(335, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_150', 0.10000000000000142, 'have'),
(336, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_151', 0, 'we'),
(337, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_152', 0.20000000000000284, 'been'),
(338, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_153', 0.3999999999999986, 'backing'),
(339, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_154', 0.6000000000000014, 'Rebels'),
(340, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_155', 0.8000000000000043, 'to'),
(341, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_156', 0.29999999999999716, 'find'),
(342, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_157', 0.20000000000000284, 'out'),
(343, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_158', 0.09999999999999432, 'that'),
(344, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_159', 0.20000000000000284, 'they''re'),
(345, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_160', 0.20000000000000284, 'always'),
(346, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_161', 0.5, 'worse'),
(347, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_162', 0.19999999999998863, 'than'),
(348, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_163', 0.10000000000000853, 'the'),
(349, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_164', 0.09999999999999432, 'guy'),
(350, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_165', 0.20000000000000284, 'that''s'),
(351, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_166', 0.20000000000000284, 'in'),
(352, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_167', 0.3999999999999915, 'there'),
(353, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_168', 1.1000000000000085, 'right'),
(354, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_169', 0.7000000000000028, 'all'),
(355, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_170', 0.09999999999999432, 'the'),
(356, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_171', 0.09999999999999432, 'time'),
(357, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_172', 0.3999999999999915, 'they'),
(358, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_173', 0.10000000000000853, 'all'),
(359, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_174', 0.19999999999998863, 'say'),
(360, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_175', 1, 'Fireside'),
(361, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_176', 0.8000000000000114, 'try'),
(362, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_177', 0.09999999999999432, 'to'),
(363, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_178', 0.09999999999999432, 'say'),
(364, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_179', 0.5, 'it''s'),
(365, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_180', 0.10000000000000853, 'not'),
(366, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_181', 0.20000000000000284, 'the'),
(367, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_182', 0.29999999999999716, 'bad'),
(368, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_183', 0.20000000000000284, 'guy'),
(369, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_184', 0.09999999999999432, 'they''re'),
(370, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_185', 0.20000000000000284, 'all'),
(371, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_186', 0.20000000000000284, 'bad'),
(372, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_187', 0.8999999999999915, 'guys.'),
(373, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_188', 0.20000000000000284, 'So'),
(374, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_189', 0.20000000000000284, 'many'),
(375, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_190', 0.09999999999999432, 'good'),
(376, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_191', 0.20000000000000284, 'guys'),
(377, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_192', 0.4000000000000057, 'over'),
(378, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_193', 0.09999999999999432, 'there'),
(379, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_194', 0.29999999999999716, 'right'),
(380, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_195', 0.7999999999999972, 'there'),
(381, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_196', 0.20000000000000284, 'all'),
(382, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_197', 0.20000000000000284, 'bad'),
(383, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_198', 0.09999999999999432, 'guys'),
(384, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_199', 0.20000000000000284, 'what'),
(385, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_201', 0.20000000000000284, 'if'),
(386, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_200', 0.7000000000000028, 'nothing'),
(387, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_202', 0.19999999999998863, 'we'),
(388, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_204', 0.20000000000000284, 'get'),
(389, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_203', 0.5, 'why'),
(390, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_206', 0.19999999999998863, 'did'),
(391, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_207', 0.10000000000000853, 'we'),
(392, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_205', 0.7000000000000028, 'by'),
(393, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_208', 0.20000000000000284, 'get'),
(394, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_210', 0.19999999999998863, 'by'),
(395, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_209', 0.5, 'knocking'),
(396, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_212', 0.20000000000000284, 'out'),
(397, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_211', 0.5, 'knocking'),
(398, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_214', 0.20000000000000284, 'out'),
(399, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_215', 0.29999999999999716, 'Saddam'),
(400, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_213', 0.7000000000000028, 'Khadafi'),
(401, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_216', 0.20000000000000284, 'Hussein'),
(402, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_217', 0.9000000000000057, 'and'),
(403, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_218', 0.5999999999999943, 'frankly'),
(404, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_219', 0.20000000000000284, 'can'),
(405, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_220', 0.20000000000000284, 'what'),
(406, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_221', 0.09999999999999432, 'is'),
(407, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_222', 0.10000000000000853, 'the'),
(408, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_223', 0.19999999999998863, 'word'),
(409, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_224', 0.10000000000000853, 'no'),
(410, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_225', 0.3999999999999915, 'weapons'),
(411, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_226', 0.10000000000000853, 'of'),
(412, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_227', 0.29999999999999716, 'mass'),
(413, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_228', 0.29999999999999716, 'destruction'),
(414, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_229', 2.1000000000000085, 'Saddam'),
(415, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_230', 0.19999999999998863, 'Hussein'),
(416, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_231', 1.3000000000000114, 'killed'),
(417, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_232', 0.7999999999999972, 'terrorists'),
(418, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_233', 0.5999999999999943, 'he'),
(419, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_234', 0.10000000000000853, 'would'),
(420, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_235', 0.29999999999999716, 'kill'),
(421, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_236', 0.09999999999999432, 'them');
INSERT INTO `video_cut` (`id`, `id_video`, `id_format`, `nom`, `duree`, `mot`) VALUES
(422, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_237', 0.6000000000000085, 'immediately'),
(423, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_238', 1.7999999999999972, 'correct'),
(424, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_239', 0.20000000000000284, 'he'),
(425, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_240', 0.5, 'we''re'),
(426, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_241', 0.29999999999999716, 'found'),
(427, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_242', 0.30000000000001137, 'back'),
(428, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_243', 0, 'a'),
(429, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_244', 0.09999999999999432, 'in'),
(430, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_246', 0.29999999999999716, 'time'),
(431, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_245', 0.5, 'terrorist'),
(432, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_247', 0.09999999999999432, 'they'),
(433, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_248', 0.10000000000000853, 'were'),
(434, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_249', 0.20000000000000284, 'gone'),
(435, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_250', 0.29999999999999716, 'within'),
(436, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_251', 0.29999999999999716, '5'),
(437, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_252', 0.4000000000000057, 'Seconds'),
(438, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_253', 0.29999999999999716, 'okay'),
(439, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_254', 0.7000000000000028, 'with'),
(440, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_255', 0.19999999999998863, 'us'),
(441, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_256', 0.20000000000000284, 'we'),
(442, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_257', 0.29999999999999716, 'find'),
(443, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_258', 0.10000000000000853, 'a'),
(444, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_259', 0.5, 'terrorist'),
(445, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_260', 0.09999999999999432, 'it''s'),
(446, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_261', 0.10000000000000853, 'going'),
(447, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_262', 0.09999999999999432, 'to'),
(448, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_263', 0.09999999999999432, 'be'),
(449, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_264', 0.6000000000000085, '25'),
(450, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_265', 0.20000000000000284, 'years'),
(451, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_266', 0.29999999999999716, 'at'),
(452, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_267', 0.09999999999999432, 'a'),
(453, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_268', 0.5, 'trial'),
(454, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_269', 0.5, 'it''s'),
(455, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_270', 0, 'a'),
(456, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_271', 0.5, 'Winedale'),
(457, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_272', 0.20000000000000284, 'end'),
(458, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_273', 0.09999999999999432, 'up'),
(459, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_274', 0.10000000000000853, 'being'),
(460, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_275', 0.29999999999999716, 'worse'),
(461, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_276', 0.09999999999999432, 'to'),
(462, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_277', 0.6000000000000085, 'decide'),
(463, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_278', 0.09999999999999432, 'I'),
(464, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_279', 0, 'want'),
(465, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_280', 0.29999999999999716, 'to'),
(466, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_281', 0.20000000000000284, 'spend'),
(467, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_282', 0.09999999999999432, 'another'),
(468, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_283', 0.7000000000000028, 'trillion'),
(469, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_284', 0.29999999999999716, 'dollars'),
(470, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_285', 0.20000000000000284, 'or'),
(471, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_286', 0.29999999999999716, 'them'),
(472, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_287', 1.2000000000000028, 'nice'),
(473, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_288', 0.10000000000000853, 'and'),
(474, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_289', 0.29999999999999716, 'easy'),
(475, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_290', 0.3999999999999915, 'Fox'),
(476, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_291', 1.5999999999999943, 'the'),
(477, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_292', 0.30000000000001137, 'people'),
(478, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_293', 0, 'are'),
(479, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_294', 0.19999999999998863, 'saying'),
(480, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_295', 0.30000000000001137, 'that'),
(481, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_296', 0.5999999999999943, 'Isis'),
(482, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_297', 1.2000000000000028, 'Isis'),
(483, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_298', 0.3999999999999915, 'worse'),
(484, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_299', 0.20000000000000284, 'than'),
(485, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_300', 0, 'the'),
(486, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_301', 0.29999999999999716, 'sudden'),
(487, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_302', 0.10000000000000853, 'High'),
(488, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_303', 0.3999999999999915, 'Saddam'),
(489, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_304', 0.10000000000000853, 'Hussein'),
(490, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_305', 0.3999999999999915, 'was'),
(491, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_306', 0.30000000000001137, 'never'),
(492, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_307', 0.09999999999999432, 'as'),
(493, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_308', 0.09999999999999432, 'bad'),
(494, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_309', 0.20000000000000284, 'as'),
(495, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_310', 0.10000000000000853, 'these'),
(496, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_311', 0.29999999999999716, 'people'),
(497, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_312', 0.7000000000000028, 'these'),
(498, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_313', 0.29999999999998295, 'people'),
(499, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_314', 0.10000000000002274, 'are'),
(500, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_315', 0.29999999999998295, 'brutal'),
(501, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_316', 0.09999999999999432, 'that'),
(502, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_317', 0.20000000000001705, 'chop'),
(503, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_318', 0.09999999999999432, 'it'),
(504, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_319', 0.09999999999999432, 'off'),
(505, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_320', 0.5999999999999943, 'everybody''s'),
(506, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_321', 0.20000000000001705, 'head'),
(507, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_322', 0.4000000000000057, 'especially'),
(508, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_323', 0.29999999999998295, 'if'),
(509, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_324', 0.10000000000002274, 'you'),
(510, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_325', 0.09999999999999432, 'happen'),
(511, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_326', 0.19999999999998863, 'to'),
(512, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_327', 0, 'be'),
(513, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_328', 0.5, 'Christian'),
(514, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_329', 0.8000000000000114, 'they'),
(515, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_330', 0.29999999999998295, 'chop'),
(516, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_331', 0, 'off'),
(517, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_332', 0.30000000000001137, 'your'),
(518, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_333', 0, 'head'),
(519, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_334', 1.4000000000000057, 'they'),
(520, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_335', 0.4000000000000057, 'don''t'),
(521, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_336', 0.19999999999998863, 'people'),
(522, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_337', 0.30000000000001137, 'with'),
(523, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_338', 0.09999999999999432, 'a'),
(524, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_339', 0.4000000000000057, 'cage'),
(525, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_340', 0.19999999999998863, 'and'),
(526, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_341', 0.09999999999999432, 'you'),
(527, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_342', 0.09999999999999432, 'see'),
(528, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_343', 0.10000000000002274, 'that'),
(529, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_344', 0.29999999999998295, 'they'),
(530, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_345', 0.4000000000000057, 'dumped'),
(531, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_346', 0.19999999999998863, 'them'),
(532, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_347', 0.4000000000000057, 'and'),
(533, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_348', 0.4000000000000057, 'drowned'),
(534, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_349', 0, 'them'),
(535, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_350', 0.6999999999999886, 'these'),
(536, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_351', 0.5, 'people'),
(537, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_352', 0.20000000000001705, 'make'),
(538, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_353', 0.4000000000000057, 'sure.'),
(539, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_354', 0.09999999999999432, 'how'),
(540, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_355', 0.09999999999999432, 'to'),
(541, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_356', 0.20000000000001705, 'say'),
(542, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_357', 0.19999999999998863, 'look'),
(543, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_358', 0.20000000000001705, 'like'),
(544, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_359', 0.09999999999999432, 'a'),
(545, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_360', 0.29999999999998295, 'choirboy'),
(546, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_361', 1.9000000000000057, 'okay'),
(547, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_362', 0.30000000000001137, 'and'),
(548, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_363', 0.09999999999999432, 'I'),
(549, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_364', 0.30000000000001137, 'said'),
(550, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_365', 0.09999999999999432, 'this'),
(551, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_366', 0.19999999999998863, 'in'),
(552, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_367', 0.9000000000000057, '2004'),
(553, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_368', 0.4000000000000057, 'in'),
(554, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_369', 0.5999999999999943, 'Reuters'),
(555, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_370', 0.5999999999999943, 'anybody'),
(556, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_371', 0.09999999999999432, 'from'),
(557, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_372', 0.20000000000001705, 'Reuters'),
(558, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_373', 0.29999999999998295, 'back'),
(559, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_374', 0.20000000000001705, 'there'),
(560, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_375', 0.6999999999999886, 'I''m'),
(561, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_376', 0.20000000000001705, 'sure'),
(562, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_377', 0.19999999999998863, 'they'),
(563, 5, NULL, 'Les_discours_de_Donald_Trump_que_vous_ne_verrez_pas_dans_le_petit_journal._Cut_378', 0.09999999999999432, 'are');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audio`
--
ALTER TABLE `audio`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audio_cut`
--
ALTER TABLE `audio_cut`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `format`
--
ALTER TABLE `format`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `langue`
--
ALTER TABLE `langue`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personne`
--
ALTER TABLE `personne`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_cut`
--
ALTER TABLE `video_cut`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audio`
--
ALTER TABLE `audio`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `audio_cut`
--
ALTER TABLE `audio_cut`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `format`
--
ALTER TABLE `format`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `langue`
--
ALTER TABLE `langue`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `personne`
--
ALTER TABLE `personne`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `video_cut`
--
ALTER TABLE `video_cut`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=564;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
