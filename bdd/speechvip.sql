-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 08, 2019 at 11:14 AM
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
  `id_video_cut` int(11) NOT NULL,
  `id_format` int(11) DEFAULT NULL,
  `nom` varchar(500) CHARACTER SET utf8 NOT NULL,
  `duree` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_cut`
--

CREATE TABLE IF NOT EXISTS `video_cut` (
`id` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `id_format` int(11) DEFAULT NULL,
  `duree` double NOT NULL,
  `nom` varchar(500) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `video_cut`
--
ALTER TABLE `video_cut`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
