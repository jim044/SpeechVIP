-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 05, 2019 at 10:28 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audio`
--

INSERT INTO `audio` (`id`, `id_video`, `id_format`, `nom`, `duree`) VALUES
(1, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_192bitrate_mono', 769.490045);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `langue`
--

INSERT INTO `langue` (`id`, `language`, `languageCode`) VALUES
(1, 'Anglais', 'en-US'),
(2, 'Français', 'fr-FR'),
(3, 'Allemand', 'de-DE'),
(4, 'Italien', 'it-IT'),
(5, 'Espagnol', 'es-ES'),
(6, 'Français', 'fr-CA'),
(7, 'Afrique du sud', 'af-ZA'),
(8, 'Catalan', 'ca-ES'),
(9, 'Danois', 'da-DK'),
(10, 'Anglais', 'en-AU'),
(11, 'Anglais', 'en-CA'),
(12, 'Portugais (Portugal)', 'pt-PT'),
(13, 'Portugais (Brésil)', 'pt-BR');

-- --------------------------------------------------------

--
-- Table structure for table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
`id` int(11) NOT NULL,
  `PrenomNom` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personne`
--

INSERT INTO `personne` (`id`, `PrenomNom`) VALUES
(1, 'Emmanuel Macron'),
(2, 'George W.Bush'),
(3, 'Hillary Clinton');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `id_personne`, `id_language`, `id_format`, `nom`, `duree`) VALUES
(1, 1, 2, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron.mp4', 769.4687);

-- --------------------------------------------------------

--
-- Table structure for table `video_create`
--

CREATE TABLE IF NOT EXISTS `video_create` (
`id` int(11) NOT NULL,
  `nom` varchar(500) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video_create`
--

INSERT INTO `video_create` (`id`, `nom`) VALUES
(1, 'LES LÉGITIMES PROFONDÉMENT VOUS BÉNÉFICIERONT QU''UNE INDULGENCE QUI PROFITER.mp4'),
(2, 'L''ORGANISATION SE DÉPLACER POUR ABORDER LA PRÉSENTATION CLIMATIQUE.mp4');

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
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video_cut`
--

INSERT INTO `video_cut` (`id`, `id_video`, `id_format`, `nom`, `duree`, `mot`) VALUES
(1, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_0', 0.7, 'LES'),
(2, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1', 0.5999999999999996, 'ILS'),
(3, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_7', 0.5, 'DANS'),
(4, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_11', 0.9000000000000004, 'LÉGITIMES'),
(5, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_14', 0.9000000000000004, 'AU'),
(6, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_15', 0.6999999999999993, 'PROFONDÉMENT'),
(7, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_21', 0.5, 'VOUS'),
(8, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_18', 0.5, 'ET'),
(9, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_22', 0.8000000000000007, 'BÉNÉFICIERONT'),
(10, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_29', 1.1999999999999993, 'INADMISSIBLE'),
(11, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_30', 0.5, 'QU''UNE'),
(12, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_31', 0.5, 'INDULGENCE'),
(13, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_32', 1.1999999999999993, 'NOUS'),
(14, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_34', 0.6000000000000014, 'TOUS'),
(15, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_36', 1.1999999999999993, 'LE'),
(16, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_39', 0.7999999999999972, 'OPPORTUNISTES'),
(17, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_40', 0.5, 'QUI'),
(18, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_43', 0.40000000000000213, 'DE'),
(19, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_44', 0.5999999999999979, 'PROFITER'),
(20, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_49', 0.9000000000000021, 'NOUS'),
(21, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_50', 0.8999999999999986, 'LES'),
(22, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_52', 0.6000000000000014, 'POLITIQUES'),
(23, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_53', 0.5, 'DANS'),
(24, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_56', 0.5, 'PROJET'),
(25, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_57', 0.7999999999999972, 'ÉTAIT'),
(26, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_59', 0.5, 'BOUSCULER'),
(27, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_61', 0.6000000000000014, 'RÉPUBLIQUE'),
(28, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_62', 1.2999999999999972, 'CHERCHANT'),
(29, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_65', 1, 'ET'),
(30, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_66', 0.5, 'L''ANARCHIE'),
(31, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_67', 0.8000000000000043, 'AUCUNE'),
(32, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_69', 1, 'NE'),
(33, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_70', 0.5, 'JUSTIFIE'),
(34, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_72', 0.5, 'S''ATTAQUE'),
(35, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_75', 0.5, 'POLICIER'),
(36, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_76', 0.8999999999999986, 'UN'),
(37, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_77', 0.5, 'GENDARME'),
(38, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_78', 0.5, 'COMMERCE'),
(39, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_83', 0.5999999999999943, 'NOTRE'),
(40, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_85', 1.7000000000000028, 'N''EXISTE'),
(41, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_86', 0.7999999999999972, 'QUE'),
(42, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_94', 0.8000000000000043, 'QUE'),
(43, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_105', 0.5999999999999943, 'LA'),
(44, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_106', 0.5, 'C''EST'),
(45, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_104', 0.6000000000000014, 'LA'),
(46, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_109', 0.8999999999999915, 'DÉSORMAIS'),
(47, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_113', 0.4000000000000057, 'LE'),
(48, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_115', 0.5, 'ET'),
(49, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_116', 0.5999999999999943, 'NOUS'),
(50, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_118', 0.4000000000000057, 'METTRONS'),
(51, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_117', 0.6000000000000085, 'RÉPUBLICAIN'),
(52, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_119', 0.7000000000000028, 'TOUS'),
(53, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_124', 1.1000000000000085, 'CAR'),
(54, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_129', 0.5, 'DURABLE'),
(55, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_130', 0.5, 'TANT'),
(56, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_131', 0.4000000000000057, 'QU''ON'),
(57, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_134', 0.5999999999999943, 'J''AI'),
(58, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_133', 0.5, 'POUR'),
(59, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_136', 0.4000000000000057, 'EN'),
(60, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_143', 0.8999999999999915, 'LES'),
(61, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_144', 0.4000000000000057, 'INSTRUCTIONS'),
(62, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_145', 0.5, 'LES'),
(63, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_147', 0.4000000000000057, 'AU'),
(64, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_149', 0.5999999999999943, 'UNE'),
(65, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_150', 0.5, 'ET'),
(66, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_148', 0.5999999999999943, 'JE'),
(67, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_151', 0.4000000000000057, 'DÉBUT'),
(68, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_170', 0.5, 'RÉDUIRE'),
(69, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_163', 0.5999999999999943, 'BEAUCOUP'),
(70, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_173', 0.6000000000000085, 'INACCEPTABLE'),
(71, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_177', 0.5999999999999943, 'QUE'),
(72, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_176', 1.0999999999999943, 'BEAUCOUP'),
(73, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_181', 0.4000000000000057, 'FRANÇAIS'),
(74, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_184', 0.5, 'PARTAGER'),
(75, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_185', 0.6000000000000085, 'CE'),
(76, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_188', 0.5999999999999943, 'LA'),
(77, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_196', 0.5, 'APPORTER'),
(78, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_197', 0.5999999999999943, 'UNE'),
(79, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_199', 1, 'EN'),
(80, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_204', 0.5999999999999943, 'TOUTES'),
(81, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_209', 0.5999999999999943, 'ELLE'),
(82, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_208', 0.5999999999999943, 'JE'),
(83, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_217', 0.4000000000000057, 'RESSENS'),
(84, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_215', 1.5, 'MAIS'),
(85, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_218', 0.5999999999999943, 'COMME'),
(86, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_223', 0.5, 'JUSTE'),
(87, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_228', 0.5, 'C''EST'),
(88, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_245', 0.5, 'ET'),
(89, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_248', 1, 'POUR'),
(90, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_257', 0.5, 'FAMILLE'),
(91, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_258', 0.799999999999983, 'CÉLIBATAIRE'),
(92, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_259', 0.5, 'VEUF'),
(93, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_261', 0.4000000000000057, 'DIVORCÉ'),
(94, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_262', 0.4000000000000057, 'QUI'),
(95, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_265', 0.5999999999999943, 'QUI'),
(96, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_275', 0.4000000000000057, 'ET'),
(97, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_276', 0.5, 'D''AMÉLIORER'),
(98, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_281', 1, 'ET'),
(99, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_283', 0.4000000000000057, 'D''ESPOIR'),
(100, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_284', 0.5999999999999943, 'JE'),
(101, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_288', 0.5999999999999943, 'POUR'),
(102, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_286', 0.5, 'C''EST'),
(103, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_299', 0.4000000000000057, 'RETRAITÉS'),
(104, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_296', 1.0999999999999943, 'SUR'),
(105, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_301', 0.5999999999999943, 'C''EST'),
(106, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_300', 0.9000000000000057, 'QUI'),
(107, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_305', 0.4000000000000057, 'FRAGILE'),
(108, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_308', 0.9000000000000057, 'TOUTE'),
(109, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_316', 0.4000000000000057, 'ENFANTS'),
(110, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_322', 0.5999999999999943, 'SITUATION'),
(111, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_328', 1, 'DANS'),
(112, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_334', 0.5, 'N''EST'),
(113, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_341', 0.700000000000017, 'FINI'),
(114, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_342', 1.6999999999999886, 'LÂCHEMENT'),
(115, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_343', 0.8000000000000114, 'PAR'),
(116, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_349', 0.5999999999999943, 'TOUT'),
(117, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_351', 0.4000000000000057, 'PASSAIT'),
(118, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_353', 0.5, 'CE'),
(119, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_361', 0.6999999999999886, 'TRAVAILLEURS'),
(120, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_367', 0.5999999999999943, 'MALAISE'),
(121, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_369', 0.5999999999999943, 'TERRITOIRES'),
(122, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_370', 0.6999999999999886, 'QUARTIER'),
(123, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_373', 0.4000000000000057, 'SERVICES'),
(124, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_374', 0.4000000000000057, 'PUBLICS'),
(125, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_375', 0.5, 'SE'),
(126, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_376', 0.5, 'RÉDUIRE'),
(127, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_382', 0.5999999999999943, 'DISPARAÎTRE'),
(128, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_383', 0.5999999999999943, 'MALAISE'),
(129, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_393', 0.5, 'ENTENDU'),
(130, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_394', 0.8000000000000114, 'MALAISE'),
(131, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_395', 0.4000000000000057, 'FASO'),
(132, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_397', 0.5999999999999943, 'CELA'),
(133, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_399', 0.799999999999983, 'A'),
(134, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_406', 0.4000000000000057, 'EST'),
(135, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_407', 0.4000000000000057, 'DEVANT'),
(136, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_415', 0.5, 'BARRIÈRES'),
(137, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_416', 0.4000000000000057, 'DE'),
(138, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_421', 0.5, 'SANS'),
(139, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_419', 0.5999999999999943, 'MAIS'),
(140, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_420', 0.6999999999999886, 'MAINTENANT'),
(141, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_423', 1, 'N''AVONS-NOUS'),
(142, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_430', 0.4000000000000057, 'ET'),
(143, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_431', 0.4000000000000057, 'APPORTER'),
(144, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_434', 0.700000000000017, 'SUFFISAMMENT'),
(145, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_436', 0.5999999999999943, 'IL'),
(146, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_435', 0.5999999999999943, 'JE'),
(147, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_439', 0.6000000000000227, 'M''ARRIVER'),
(148, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_458', 0.5, 'JE'),
(149, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_457', 0.5, 'QUE'),
(150, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_461', 0.4000000000000057, 'QU''IL'),
(151, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_467', 0.4000000000000057, 'DE'),
(152, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_468', 0.4000000000000057, 'BLESSER'),
(153, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_472', 1, 'PAR'),
(154, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_475', 0.5, 'SOIR'),
(155, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_476', 0.5, 'SI'),
(156, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_483', 0.700000000000017, 'POUR'),
(157, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_478', 0.8000000000000114, 'TRÈS'),
(158, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_484', 0.5, 'BOUSCULER'),
(159, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_491', 0.5, 'EN'),
(160, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_493', 0.8000000000000114, 'LES'),
(161, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_494', 0.5, 'HABITUDES'),
(162, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_495', 0.5, 'LES'),
(163, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_496', 0.5, 'HYPOCRISIE'),
(164, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_498', 0.5, 'ET'),
(165, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_497', 0.5, 'C''EST'),
(166, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_502', 0.6999999999999886, 'PRÉCISÉMENT'),
(167, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_501', 1.6000000000000227, 'JE'),
(168, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_521', 0.4000000000000341, 'TITRE'),
(169, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_522', 0.5, 'PARTIE'),
(170, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_523', 0.6000000000000227, 'JE'),
(171, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_524', 0.8000000000000114, 'NOMBRE'),
(172, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_536', 0.8999999999999773, 'PROFONDÉMENT'),
(173, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_537', 0.4000000000000341, 'QUE'),
(174, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_541', 0.6000000000000227, 'UNE'),
(175, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_545', 0.5, 'TOUS'),
(176, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_547', 1.3000000000000114, 'JE'),
(177, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_553', 1, 'PARCE'),
(178, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_557', 0.5, 'VOCATION'),
(179, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_558', 0.5, 'AU'),
(180, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_559', 0.4000000000000341, 'TRAVERS'),
(181, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_563', 1.099999999999966, 'JAMAIS'),
(182, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_564', 0.5, 'EXPLORÉ'),
(183, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_565', 0.8000000000000114, 'POUR'),
(184, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_571', 1, 'JE'),
(185, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_577', 0.6999999999999886, 'FRANÇAIS'),
(186, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_578', 1.1999999999999886, 'PARCE'),
(187, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_587', 0.6000000000000227, 'QUI'),
(188, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_590', 0.6000000000000227, 'PLUS'),
(189, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_592', 0.6000000000000227, 'ET'),
(190, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_593', 0.5, 'L''AMITIÉ'),
(191, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_597', 1, 'ET'),
(192, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_605', 1.1999999999999886, 'JE'),
(193, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_609', 1.1999999999999886, 'PARCE'),
(194, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_613', 0.5, 'QUE'),
(195, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_614', 0.4000000000000341, 'ET'),
(196, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_621', 0.5, 'SUFFRAGE'),
(197, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_628', 0.9000000000000341, 'ET'),
(198, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_629', 0.6000000000000227, 'POUR'),
(199, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_632', 0.8000000000000114, 'RÉCONCILIER'),
(200, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_633', 0.5, 'C''EST'),
(201, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_635', 1, 'L''ÉTAT'),
(202, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_638', 0.7999999999999545, 'QUE'),
(203, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_641', 0.5, 'DÉCRÉTÉ'),
(204, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_647', 0.5, 'UNE'),
(205, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_653', 1.6000000000000227, 'CELA'),
(206, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_664', 0.6999999999999886, 'UNIVERSITÉS'),
(207, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_666', 0.5999999999999659, 'L''APPRENTISSAGE'),
(208, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_667', 0.8000000000000114, 'ET'),
(209, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_670', 0.6000000000000227, 'APRÈS'),
(210, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_685', 0.5, 'TRAVAILLER'),
(211, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_686', 1.8000000000000114, 'L''INVESTISSEMENT'),
(212, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_689', 0.5, 'NATION'),
(213, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_690', 0.6999999999999886, 'DANS'),
(214, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_697', 0.6000000000000227, 'SUR'),
(215, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_700', 1.3999999999999773, 'NOUS'),
(216, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_703', 1.1999999999999886, 'NOUS'),
(217, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_706', 0.5, 'FRANCE'),
(218, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_715', 0.5999999999999659, 'DIGNEMENT'),
(219, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_720', 0.5999999999999659, 'JE'),
(220, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_719', 0.6000000000000227, 'JE'),
(221, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_726', 0.5, 'VITE'),
(222, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_723', 0.5, 'GOUVERNEMENT'),
(223, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_728', 0.4000000000000341, 'CONCRÈTEMENT'),
(224, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_735', 0.5, 'AFIN'),
(225, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_749', 1.5, 'LE'),
(226, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_754', 0.4000000000000341, '€'),
(227, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_757', 0.7000000000000455, '2019'),
(228, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_758', 0.8999999999999773, 'SANS'),
(229, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_768', 0.5999999999999659, 'JE'),
(230, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_775', 0.6999999999999886, 'QUE'),
(231, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_780', 0.5999999999999659, 'ACCEPTÉ'),
(232, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_784', 1.5, 'LES'),
(233, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_787', 1.1999999999999886, 'SERONT'),
(234, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_791', 0.5, 'CHARGE'),
(235, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_792', 0.6000000000000227, '2019'),
(236, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_793', 1.3000000000000114, 'JE'),
(237, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_795', 0.5, 'UNE'),
(238, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_797', 0.8000000000000114, 'AMÉLIORATION'),
(239, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_801', 1, 'C''EST'),
(240, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_804', 0.5, 'DEMANDERAI'),
(241, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_809', 0.5, 'PEUVENT'),
(242, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_810', 0.5, 'DE'),
(243, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_813', 0.4000000000000341, 'PRIME'),
(244, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_818', 0.7999999999999545, 'ET'),
(245, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_820', 0.6000000000000227, 'NORA'),
(246, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_821', 1.099999999999966, 'NI'),
(247, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_829', 1.400000000000034, 'POUR'),
(248, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_837', 1.3000000000000114, 'NOUS'),
(249, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_840', 0.6999999999999886, '2019'),
(250, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_841', 0.4000000000000341, 'LA'),
(251, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_847', 0.5, 'ET'),
(252, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_849', 0.6000000000000227, 'DEMANDÉ'),
(253, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_854', 0.5, 'IMPORTANT'),
(254, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_851', 1, 'LE'),
(255, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_855', 0.9000000000000341, 'ET'),
(256, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_861', 0.5999999999999659, 'MAIS'),
(257, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_860', 0.5, 'L''ENSEMBLE'),
(258, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_862', 0.9000000000000341, 'NOUS'),
(259, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_873', 1.099999999999966, 'J''AI'),
(260, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_878', 0.5, 'ENTREPRISES'),
(261, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_879', 0.5, 'FORTUNE'),
(262, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_881', 0.4000000000000341, 'AIDE'),
(263, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_884', 0.5, 'RÉUSSIR'),
(264, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_885', 1.1999999999999886, 'JE'),
(265, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_886', 0.4000000000000341, 'RÉUNIR'),
(266, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_888', 0.5, 'ET'),
(267, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_889', 0.4000000000000341, 'PRENDRE'),
(268, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_891', 0.5, 'DÉCISIONS'),
(269, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_898', 1.1999999999999886, 'JE'),
(270, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_902', 0.9000000000000341, 'DANS'),
(271, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_907', 0.5, 'SUR'),
(272, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_905', 0.6999999999999886, 'VISION'),
(273, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_915', 1.5, 'MAIS'),
(274, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_917', 0.5999999999999659, 'PENDANT'),
(275, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_922', 0.7999999999999545, 'IL'),
(276, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_924', 0.5, 'EXISTÉ'),
(277, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_925', 0.6000000000000227, 'PÉRIODE'),
(278, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_926', 0.8999999999999773, 'LES'),
(279, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_929', 0.5999999999999659, 'ET'),
(280, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_932', 1.5, 'CONFORMÉMENT'),
(281, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_933', 0.4000000000000341, 'AUX'),
(282, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_935', 0.5, 'PRIS'),
(283, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_940', 0.6000000000000227, 'SUPPRIMÉ'),
(284, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_945', 0.6000000000000227, 'IL'),
(285, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_947', 0.5999999999999659, 'ET'),
(286, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_950', 0.5, 'MAINTENU'),
(287, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_958', 0.5, 'CONTRAIRE'),
(288, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_959', 0.7999999999999545, 'POUR'),
(289, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_971', 0.6000000000000227, 'ALORS'),
(290, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_967', 0.5, 'LE'),
(291, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_979', 0.4000000000000341, 'RECRÉER'),
(292, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_980', 0.4000000000000341, 'GOUVERNEMENT'),
(293, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_987', 2, 'CEPENDANT'),
(294, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_990', 0.5, 'PLUS'),
(295, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_992', 1, 'POUR'),
(296, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_993', 0.4000000000000341, 'METTRE'),
(297, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_995', 0.5999999999999659, 'AUX'),
(298, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_996', 0.4000000000000341, 'AVANTAGES'),
(299, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1001', 1.2999999999999545, 'LE'),
(300, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1002', 0.4000000000000341, 'DIRIGEANT'),
(301, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1005', 0.8000000000000114, 'FRANÇAISE'),
(302, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1006', 0.5999999999999659, 'DOIT'),
(303, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1010', 0.5, 'EN'),
(304, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1013', 0.5, 'VOUS'),
(305, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1021', 0.4000000000000341, 'DOIVENT-ILS'),
(306, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1026', 0.8000000000000114, 'ÉCONOMIQUE'),
(307, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1028', 1, 'C''EST'),
(308, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1032', 0.8000000000000682, 'J''ENTENDS'),
(309, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1035', 0.6999999999999886, 'PAR'),
(310, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1042', 0.5, 'PAR'),
(311, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1036', 0.599999999999909, 'QUE'),
(312, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1045', 0.5, 'MAÎTRISE'),
(313, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1048', 0.8999999999999773, 'PLUTÔT'),
(314, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1052', 0.5, 'FERMEMENT'),
(315, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1053', 0.8999999999999773, 'POURSUIVRE'),
(316, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1054', 0.8999999999999773, 'L''AMBITION'),
(317, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1056', 0.6000000000000227, 'TRANSFORMATIONS'),
(318, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1060', 0.7999999999999545, 'QUE'),
(319, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1069', 0.7999999999999545, '18'),
(320, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1071', 1.2000000000000455, 'NOUS'),
(321, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1075', 0.5, 'CONDUIRE'),
(322, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1078', 0.5, 'DE'),
(323, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1079', 0.40000000000009095, 'L''INDEMNISATION'),
(324, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1082', 0.5, 'ET'),
(325, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1084', 1, 'ELLES'),
(326, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1086', 1.1000000000000227, 'INDISPENSABLES'),
(327, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1087', 1.2999999999999545, 'VOULONS'),
(328, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1092', 0.7000000000000455, 'PLUS'),
(329, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1093', 0.5, 'SIMPLE'),
(330, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1095', 0.6000000000000227, 'MAIS'),
(331, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1094', 0.7999999999999545, 'LECLERC'),
(332, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1098', 0.7000000000000455, 'ET'),
(333, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1097', 1.599999999999909, 'C''EST'),
(334, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1100', 0.5, 'CEUX'),
(335, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1106', 1, 'QUE'),
(336, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1112', 0.5, 'C''EST'),
(337, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1111', 0.6000000000000227, 'POUR'),
(338, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1113', 0.5, 'POUR'),
(339, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1125', 0.5, 'ET'),
(340, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1129', 0.599999999999909, 'NOUS'),
(341, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1134', 1.3000000000000682, 'ASSUMER'),
(342, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1135', 1, 'TOUS'),
(343, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1136', 0.6000000000000227, 'ENSEMBLE'),
(344, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1137', 0.7999999999999545, 'TOUS'),
(345, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1141', 0.6000000000000227, 'PRODUIRE'),
(346, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1142', 0.5, 'POUR'),
(347, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1144', 1, 'D''APPRENDRE'),
(348, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1149', 0.7000000000000455, 'LE'),
(349, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1152', 0.6000000000000227, 'CHANGER'),
(350, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1153', 0.8000000000000682, 'POUR'),
(351, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1161', 0.6000000000000227, 'CLIMATIQUE'),
(352, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1164', 0.6000000000000227, 'POUR'),
(353, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1166', 1.3999999999999773, 'NOUS'),
(354, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1169', 0.6000000000000227, 'RASSEMBLER'),
(355, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1171', 0.5, 'ABORDER'),
(356, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1172', 0.6000000000000227, 'ENSEMBLE'),
(357, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1176', 0.5, 'ESSENTIELLES'),
(358, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1179', 1.1000000000000227, 'JE'),
(359, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1187', 0.7999999999999545, 'PRÉSENTATION'),
(360, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1188', 0.6000000000000227, 'LA'),
(361, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1189', 0.5, 'POSSIBILITÉ'),
(362, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1195', 0.8000000000000682, 'MIEUX'),
(363, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1196', 0.5, 'ENTENDU'),
(364, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1200', 0.8999999999999773, 'UNE'),
(365, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1204', 0.40000000000009095, 'JUSTE'),
(366, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1215', 0.599999999999909, 'JE'),
(367, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1216', 0.6999999999999318, 'PARTICIPER'),
(368, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1227', 0.6000000000000227, 'FISCALITÉ'),
(369, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1231', 0.6000000000000227, 'CITOYENS'),
(370, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1232', 0.5, 'POUR'),
(371, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1233', 0.6000000000000227, 'N''APPARTENANT'),
(372, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1241', 0.6000000000000227, 'CITÉ'),
(373, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1243', 1.2000000000000455, 'JE'),
(374, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1248', 0.5, 'LA'),
(375, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1252', 0.599999999999909, 'QUOTIDIEN'),
(376, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1253', 0.8000000000000682, 'POUR'),
(377, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1259', 1, 'SE'),
(378, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1261', 0.6000000000000227, 'SE'),
(379, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1262', 0.6000000000000227, 'DÉPLACER'),
(380, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1263', 0.5, 'SE'),
(381, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1264', 0.6000000000000227, 'LES'),
(382, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1267', 0.5, 'ET'),
(383, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1273', 1, 'JE'),
(384, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1281', 0.6999999999999318, 'L''ORGANISATION'),
(385, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1283', 0.7999999999999545, 'DE'),
(386, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1290', 0.5, 'JE'),
(387, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1289', 0.7000000000000455, 'DEPUIS'),
(388, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1305', 0.8999999999999773, 'DANS'),
(389, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1312', 0.8000000000000682, 'DE'),
(390, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1309', 1, 'D''ACCORD'),
(391, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1314', 0.5, 'LA'),
(392, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1313', 0.6000000000000227, 'L''IMMIGRATION'),
(393, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1317', 0.5, 'SUR'),
(394, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1321', 0.5, 'IDENTITÉ'),
(395, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1322', 0.6000000000000227, 'PROFONDE'),
(396, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1326', 0.7999999999999545, 'QUI'),
(397, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1331', 0.6000000000000227, 'RÉFLEXION'),
(398, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1334', 0.5, 'PARTAGER'),
(399, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1335', 0.8999999999999773, 'UN'),
(400, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1339', 0.6000000000000227, 'SANS'),
(401, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1341', 0.6000000000000227, 'IL'),
(402, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1348', 1.3000000000000682, 'DANS'),
(403, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1351', 0.7000000000000455, 'CHACUN'),
(404, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1355', 1.5, 'GOUVERNEMENT'),
(405, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1356', 1.1000000000000227, 'PARTENAIRES'),
(406, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1358', 0.40000000000009095, 'ET'),
(407, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1361', 0.6000000000000227, 'JE'),
(408, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1360', 1.7999999999999545, 'VOUS'),
(409, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1365', 0.40000000000009095, 'MOI-MÊME'),
(410, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1368', 0.40000000000009095, 'PART'),
(411, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1370', 0.7000000000000455, 'COORDINATION');
INSERT INTO `video_cut` (`id`, `id_video`, `id_format`, `nom`, `duree`, `mot`) VALUES
(412, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1375', 0.599999999999909, 'POUR'),
(413, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1382', 0.5, 'METS'),
(414, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1386', 0.6999999999999318, 'N''EST'),
(415, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1390', 0.8999999999999773, 'IL'),
(416, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1394', 0.5, 'AUSSI'),
(417, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1399', 0.7999999999999545, 'ET'),
(418, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1404', 0.6000000000000227, 'IL'),
(419, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1403', 0.5, 'LOCUTEUR'),
(420, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1411', 0.6000000000000227, 'DEMANDÉ'),
(421, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1407', 0.5, 'RÉPUBLIQUE'),
(422, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1416', 1.1999999999999318, 'CE'),
(423, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1423', 0.5, 'C''EST'),
(424, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1426', 0.6000000000000227, 'RENCONTRERAI'),
(425, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1428', 0.40000000000009095, 'LES'),
(426, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1432', 0.8999999999999773, 'RÉGION'),
(427, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1435', 1.2000000000000455, 'POUR'),
(428, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1439', 0.8000000000000682, 'DE'),
(429, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1442', 0.5, 'CONTRAT'),
(430, 1, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_1443', 0.599999999999909, 'POUR');

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
-- Indexes for table `video_create`
--
ALTER TABLE `video_create`
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `personne`
--
ALTER TABLE `personne`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `video_create`
--
ALTER TABLE `video_create`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `video_cut`
--
ALTER TABLE `video_cut`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=431;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
