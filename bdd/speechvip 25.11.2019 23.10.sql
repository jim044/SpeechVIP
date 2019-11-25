-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Lun 25 Novembre 2019 à 22:09
-- Version du serveur :  10.1.38-MariaDB-0+deb9u1
-- Version de PHP :  7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `speechvip`
--

-- --------------------------------------------------------

--
-- Structure de la table `administration`
--

CREATE TABLE `administration` (
  `id` int(11) NOT NULL,
  `nom` varchar(250) NOT NULL,
  `prenom` varchar(250) NOT NULL,
  `identifiant` varchar(250) NOT NULL,
  `mot_de_passe` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `administration`
--

INSERT INTO `administration` (`id`, `nom`, `prenom`, `identifiant`, `mot_de_passe`) VALUES
(1, 'VILLOSSEL', 'JIMMY', 'jim044', 'fa542a57fc5789f179df544a4396eb12');

-- --------------------------------------------------------

--
-- Structure de la table `audio`
--

CREATE TABLE `audio` (
  `id` int(11) NOT NULL,
  `id_video` int(11) DEFAULT NULL,
  `id_format` int(11) DEFAULT NULL,
  `nom` varchar(500) CHARACTER SET utf8 NOT NULL,
  `duree` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `audio`
--

INSERT INTO `audio` (`id`, `id_video`, `id_format`, `nom`, `duree`) VALUES
(1, 0, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_192bitrate_mono', 769.486077);

-- --------------------------------------------------------

--
-- Structure de la table `audio_cut`
--

CREATE TABLE `audio_cut` (
  `id` int(11) NOT NULL,
  `id_audio` int(11) NOT NULL,
  `id_format` int(11) DEFAULT NULL,
  `duree` double NOT NULL,
  `nom` varchar(500) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `format`
--

CREATE TABLE `format` (
  `id` int(11) NOT NULL,
  `format` varchar(254) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `langue`
--

CREATE TABLE `langue` (
  `id` int(11) NOT NULL,
  `language` varchar(254) CHARACTER SET utf8 NOT NULL,
  `languageCode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `langue`
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
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `id` int(11) NOT NULL,
  `PrenomNom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`id`, `PrenomNom`) VALUES
(1, 'Emmanuel Macron'),
(2, 'George W.Bush'),
(3, 'Hillary Clinton');

-- --------------------------------------------------------

--
-- Structure de la table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `id_personne` int(11) DEFAULT NULL,
  `id_language` int(11) DEFAULT NULL,
  `id_format` int(11) DEFAULT NULL,
  `nom` varchar(254) CHARACTER SET utf8 NOT NULL,
  `duree` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `video`
--

INSERT INTO `video` (`id`, `id_personne`, `id_language`, `id_format`, `nom`, `duree`) VALUES
(0, 1, 2, NULL, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron.mp4', 769.4687);

-- --------------------------------------------------------

--
-- Structure de la table `video_create`
--

CREATE TABLE `video_create` (
  `id` int(11) NOT NULL,
  `nom` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `video_create`
--

INSERT INTO `video_create` (`id`, `nom`) VALUES
(1, 'LES ÉVÉNEMENTS DE CES DERNIÈRES SEMAINES DANS L\'HEXAGONE ET PROFONDÉMENT.mp4'),
(2, 'JEU DES OPPORTUNISTES.mp4'),
(3, 'QUI ONT ESSAYÉ.mp4'),
(4, 'DES BÂTIMENTS PUBLICS.mp4'),
(5, 'QU\'ON S\'ATTAQUE À.mp4'),
(6, 'DÉSORDRE ET L\'ANARCHIE.mp4'),
(7, 'METTRONS TOUS LES.mp4'),
(8, 'LEUR VIE À.mp4'),
(9, 'QUI ONT CONTRIBUÉ TOUTE.mp4'),
(10, 'Y HABITUER ET.mp4'),
(11, 'MAIS NOUS AVIONS FINI.mp4'),
(12, 'SE PASSAIT COMME.mp4'),
(13, 'AU FOND TOUT.mp4'),
(14, 'LES SERVICES PUBLICS.mp4'),
(15, 'N\'EST PAS ENCORE.mp4'),
(16, 'L\'AMITIÉ QUI DOIT.mp4'),
(17, 'C\'EST PRÉCISÉMENT PARCE QUE.mp4'),
(18, 'DIVISE À CE.mp4'),
(19, 'DE D\'OUVRIR.mp4'),
(20, 'POUR NOUS TOUS.mp4'),
(21, 'SOIR ÊTRE TRÈS.mp4');

-- --------------------------------------------------------

--
-- Structure de la table `video_cut`
--

CREATE TABLE `video_cut` (
  `id` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `nom` varchar(500) NOT NULL,
  `duree` int(11) NOT NULL,
  `mot` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `video_cut`
--

INSERT INTO `video_cut` (`id`, `id_video`, `nom`, `duree`, `mot`) VALUES
(1, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_6', 1, 'DERNIÈRES SEMAINES DANS'),
(2, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_3', 1, 'LES ÉVÉNEMENTS DE CES'),
(3, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_12', 3, 'L\'HEXAGONE ET PROFONDÉMENT'),
(4, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_19', 1, 'ET UN ENCHAÎNEMENT DE'),
(5, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_34', 1, 'QUI ONT ESSAYÉ'),
(6, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_31', 1, 'JEU DES OPPORTUNISTES'),
(7, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_57', 1, 'DE BOUSCULER LA'),
(8, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_40', 1, 'COLÈRES POUR'),
(9, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_82', 1, 'DES BÂTIMENTS PUBLICS'),
(10, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_70', 1, 'QU\'ON S\'ATTAQUE À'),
(11, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_37', 1, 'DE PROFITER DES'),
(12, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_92', 1, 'PEUT EXPRIMER SES'),
(13, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_89', 1, 'PARCE QUE CHACUN'),
(14, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_127', 1, 'À DE DURABLE'),
(15, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_54', 2, 'SEUL PROJET ÉTAIT'),
(16, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_63', 2, 'DÉSORDRE ET L\'ANARCHIE'),
(17, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_28', 2, 'TOUS VU LE'),
(18, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_73', 2, 'UN POLICIER UN'),
(19, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_136', 1, 'POUR LA PAIX CIVILE'),
(20, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_95', 1, 'OPINIONS QUE D\'AUTRES'),
(21, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_25', 2, 'QU\'UNE INDULGENCE NOUS AVONS'),
(22, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_118', 1, 'METTRONS TOUS LES'),
(23, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_112', 2, 'ET QUI'),
(24, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_148', 1, 'DE FRANÇAIS PEUVENT'),
(25, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_60', 2, 'RÉPUBLIQUE CHERCHANT LE'),
(26, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_140', 1, 'AU DÉBUT DE TOUT'),
(27, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_121', 1, 'MOYENS CAR RIEN'),
(28, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_115', 2, 'DOIVENT NOUS'),
(29, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_191', 1, 'GARDER LES ENFANTS'),
(30, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_170', 1, 'CELLE DE LA MÈRE'),
(31, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_194', 1, 'ET SES'),
(32, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_51', 2, 'LES POLITIQUES DANS LE'),
(33, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_67', 3, 'AUCUNE COLÈRE NE JUSTIFIE'),
(34, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_79', 3, 'GENDARME COMMERCE OU'),
(35, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_176', 1, 'VEUF OU DIVORCÉ'),
(36, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_86', 3, 'NOTRE LIBERTÉ N\'EXISTE QUE'),
(37, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_161', 2, 'PROCHAINE MAIS CETTE'),
(38, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_221', 1, 'AN ENFANTS'),
(39, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_182', 2, 'QUI NE MÊME PLUS QUI'),
(40, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_173', 1, 'DE FAMILLE CÉLIBATAIRE'),
(41, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_230', 1, 'SITUATION DE HANDICAP'),
(42, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_145', 2, 'BEAUCOUP D\'ENTRE NOUS BEAUCOUP'),
(43, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_239', 1, 'N\'EST PAS ENCORE'),
(44, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_268', 1, 'LES SERVICES PUBLICS'),
(45, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_254', 1, 'AU FOND TOUT'),
(46, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_257', 1, 'SE PASSAIT COMME'),
(47, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_245', 1, 'MAIS NOUS AVIONS FINI'),
(48, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_251', 1, 'Y HABITUER ET'),
(49, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_209', 2, 'QUI ONT CONTRIBUÉ TOUTE'),
(50, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_215', 2, 'LEUR VIE À'),
(51, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_233', 2, 'DANS LA PLACE'),
(52, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_309', 1, 'BARRIÈRES DE LA'),
(53, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_294', 1, 'NOTRE SOCIÉTÉ A'),
(54, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_265', 1, 'QUARTIER VOIT'),
(55, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_271', 1, 'SE RÉDUIRE ET'),
(56, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_327', 1, 'CLAIR AVEC VOUS'),
(57, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_277', 1, 'VIE DISPARAÎTRE MALAISE'),
(58, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_340', 1, 'NOTRE PAYS ET'),
(59, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_337', 1, 'QUE TOUT DANS'),
(60, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_320', 1, 'QUE J\'AVAIS D\'AUTRES PRIORITÉS'),
(61, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_248', 3, 'LÂCHEMENT PAR NOUS'),
(62, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_300', 2, 'UNE LAÏCITÉ EST DEVANT DES'),
(63, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_347', 1, 'JE QUE'),
(64, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_324', 2, 'SOIR ÊTRE TRÈS'),
(65, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_396', 1, 'POUR NOUS TOUS'),
(66, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_380', 1, 'DE D\'OUVRIR'),
(67, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_405', 1, 'DIVISE À CE'),
(68, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_331', 2, 'C\'EST PRÉCISÉMENT PARCE QUE'),
(69, 0, 'Gilets_jaunes_-_réécoutez_lintégralité_du_discours_dEmmanuel_Macron_Cut_416', 1, 'L\'AMITIÉ QUI DOIT');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `administration`
--
ALTER TABLE `administration`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `audio`
--
ALTER TABLE `audio`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `audio_cut`
--
ALTER TABLE `audio_cut`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `format`
--
ALTER TABLE `format`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `langue`
--
ALTER TABLE `langue`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `video_create`
--
ALTER TABLE `video_create`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `video_cut`
--
ALTER TABLE `video_cut`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `administration`
--
ALTER TABLE `administration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `audio`
--
ALTER TABLE `audio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `audio_cut`
--
ALTER TABLE `audio_cut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `format`
--
ALTER TABLE `format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `langue`
--
ALTER TABLE `langue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `video_create`
--
ALTER TABLE `video_create`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `video_cut`
--
ALTER TABLE `video_cut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
