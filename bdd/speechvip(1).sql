-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 11, 2019 at 03:06 PM
-- Server version: 5.5.62-0+deb8u1
-- PHP Version: 5.6.40-0+deb8u2

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
  `id_video_cut` int(11) DEFAULT NULL,
  `id_format` int(11) DEFAULT NULL,
  `nom` varchar(500) CHARACTER SET utf8 NOT NULL,
  `duree` double DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

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
  `language` varchar(254) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
`id` int(11) NOT NULL,
  `nom` varchar(254) CHARACTER SET utf8 NOT NULL,
  `prenom` varchar(254) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=437 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video_cut`
--

INSERT INTO `video_cut` (`id`, `id_video`, `id_format`, `nom`, `duree`, `mot`) VALUES
(325, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_0', 0.9, 'members'),
(326, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_1', 0.09999999999999998, 'of'),
(327, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_2', 0.3999999999999999, 'Congress'),
(328, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_3', 0.8999999999999999, 'the'),
(329, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_4', 0.5, 'state'),
(330, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_5', 0.7000000000000002, 'of'),
(331, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_6', 0.20000000000000018, 'our'),
(332, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_7', 0.2999999999999998, 'Union'),
(333, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_8', 1, 'is'),
(334, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_9', 0.9000000000000004, 'strong'),
(335, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_10', 0.6999999999999993, 'making'),
(336, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_11', 0.1999999999999993, 'cement'),
(337, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_12', 0.3000000000000007, 'with'),
(338, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_13', 0.09999999999999964, 'that'),
(339, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_14', 0.20000000000000107, 'book'),
(340, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_15', 0.1999999999999993, 'was'),
(341, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_16', 0, 'the'),
(342, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_17', 0.3000000000000007, 'shutdown'),
(343, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_18', 0.8999999999999986, 'do'),
(344, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_19', 0.10000000000000142, 'when'),
(345, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_20', 0.3999999999999986, 'somebody'),
(346, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_21', 0.20000000000000107, 'play'),
(347, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_22', 0.1999999999999993, 'some'),
(348, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_23', 0.3000000000000007, 'disco'),
(349, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_24', 0.5, 'anniversary'),
(350, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_25', 1.8000000000000007, 'is'),
(351, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_26', 1.1999999999999993, 'cool'),
(352, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_27', 1, 'but'),
(353, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_28', 0.10000000000000142, 'asked'),
(354, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_29', 0.09999999999999787, 'if'),
(355, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_30', 0.10000000000000142, 'we'),
(356, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_31', 0.09999999999999787, 'come'),
(357, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_32', 0.10000000000000142, 'with'),
(358, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_33', 0.1999999999999993, 'me'),
(359, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_34', 0.3000000000000007, 'the'),
(360, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_35', 0.3000000000000007, 'agenda'),
(361, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_36', 0.29999999999999716, 'I'),
(362, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_37', 0.20000000000000284, 'will'),
(363, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_38', 0.1999999999999993, 'lay'),
(364, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_39', 0.1999999999999993, 'out'),
(365, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_40', 0.5, 'this'),
(366, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_41', 0.29999999999999716, 'evening'),
(367, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_42', 0.30000000000000426, 'is'),
(368, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_43', 0.10000000000000142, 'not'),
(369, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_44', 1.0999999999999943, 'a'),
(370, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_45', 0.30000000000000426, 'republican'),
(371, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_46', 0.6000000000000014, 'agenda'),
(372, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_47', 1.3999999999999986, 'or'),
(373, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_48', 0, 'a'),
(374, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_49', 0.6999999999999957, 'Democrat'),
(375, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_50', 0.20000000000000284, 'agenda'),
(376, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_51', 1.6000000000000014, 'it''s'),
(377, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_52', 0.19999999999999574, 'the'),
(378, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_53', 0.6000000000000014, 'agenda'),
(379, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_54', 0.10000000000000142, 'of'),
(380, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_55', 0.20000000000000284, 'the'),
(381, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_56', 0.20000000000000284, 'can'),
(382, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_57', 0.5, 'people'),
(383, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_58', 0.20000000000000284, 'play'),
(384, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_59', 3.1999999999999957, 'together'),
(385, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_60', 0.3999999999999986, 'we'),
(386, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_61', 0.10000000000000142, 'will'),
(387, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_62', 0.5, 'defeat'),
(388, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_63', 0.6000000000000014, 'age'),
(389, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_64', 0.29999999999999716, 'in'),
(390, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_65', 0.10000000000000142, 'America'),
(391, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_66', 0.7000000000000028, 'and'),
(392, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_67', 0.5, 'Beyond'),
(393, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_68', 0.5, 'give'),
(394, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_69', 0.10000000000000142, 'me'),
(395, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_70', 0.10000000000000142, 'the'),
(396, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_71', 0.29999999999999716, 'prettiest'),
(397, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_72', 0.10000000000000142, 'lyrics'),
(398, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_73', 0.19999999999999574, 'on'),
(399, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_74', 0.10000000000000142, 'the'),
(400, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_75', 0.5, 'remodel'),
(401, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_76', 0.29999999999999716, 'explain'),
(402, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_77', 0.6000000000000085, 'America''s'),
(403, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_78', 0.3999999999999915, 'working'),
(404, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_79', 0.5, 'class'),
(405, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_80', 1, 'and'),
(406, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_81', 0.5, 'America''s'),
(407, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_82', 0.29999999999999716, 'political'),
(408, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_83', 0.8000000000000114, 'class'),
(409, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_84', 0.7999999999999972, 'then'),
(410, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_85', 0.8999999999999915, 'illegal'),
(411, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_86', 0.5, 'immigration'),
(412, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_87', 1.6000000000000085, 'wealthy'),
(413, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_88', 0.29999999999999716, 'politicians'),
(414, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_89', 0.7999999999999972, 'and'),
(415, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_90', 0.5, 'donors'),
(416, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_91', 0.5, 'push'),
(417, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_92', 0.5999999999999943, 'Lucas'),
(418, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_93', 0.20000000000000284, 'for'),
(419, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_94', 0.20000000000000284, 'Joyner'),
(420, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_95', 0.6000000000000085, 'open'),
(421, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_96', 0.09999999999999432, 'borders'),
(422, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_97', 1.5, 'while'),
(423, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_98', 0.29999999999999716, 'living'),
(424, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_99', 0.5, 'their'),
(425, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_100', 0.29999999999999716, 'lives'),
(426, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_101', 0.6000000000000085, 'behind'),
(427, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_102', 0.7999999999999972, 'walls'),
(428, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_103', 0.29999999999999716, 'and'),
(429, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_105', 0.20000000000000284, 'Gates'),
(430, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_106', 0.9000000000000057, 'and'),
(431, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_107', 0.5999999999999943, 'guards'),
(432, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_104', 3.5999999999999943, 'don''t'),
(433, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_108', 0.10000000000000853, 'you'),
(434, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_109', 0.09999999999999432, 'have'),
(435, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_110', 0, 'a'),
(436, NULL, NULL, 'Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_Cut_111', 1, 'seat.');

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `personne`
--
ALTER TABLE `personne`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `video_cut`
--
ALTER TABLE `video_cut`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=437;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
