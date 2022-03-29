-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 29 mars 2022 à 11:38
-- Version du serveur :  5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gstmedicament`
--

-- --------------------------------------------------------

--
-- Structure de la table `dosage`
--

DROP TABLE IF EXISTS `dosage`;
CREATE TABLE IF NOT EXISTS `dosage` (
  `DOS_CODE` int(10) NOT NULL,
  `DOS_QUANTITE` int(10) NOT NULL,
  `DOS_UNITE` char(10) NOT NULL,
  PRIMARY KEY (`DOS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dosage`
--

INSERT INTO `dosage` (`DOS_CODE`, `DOS_QUANTITE`, `DOS_UNITE`) VALUES
(1, 100, 'mg'),
(2, 500, 'mg'),
(3, 1000, 'mg'),
(4, 50, 'mg');

-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

DROP TABLE IF EXISTS `famille`;
CREATE TABLE IF NOT EXISTS `famille` (
  `FAM_code` int(3) NOT NULL AUTO_INCREMENT,
  `FAM_libelle` char(30) NOT NULL,
  PRIMARY KEY (`FAM_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `famille`
--

INSERT INTO `famille` (`FAM_code`, `FAM_libelle`) VALUES
(1, 'ANTIANGINEUX'),
(2, 'ANTIARYTHMIQUES'),
(3, 'ANTIASTHMATIQUES'),
(4, 'ANTIBIOTIQUES'),
(5, 'ANTICANCÉREUX'),
(6, 'ANTIDIABÉTIQUES'),
(7, 'ANTIDÉPRESSEURS'),
(8, 'ANTIDIARRHÉIQUES'),
(9, 'ANTIPSYCHOTIQUES'),
(10, 'ANTI-HYPERTENSEURS');

-- --------------------------------------------------------

--
-- Structure de la table `interagir`
--

DROP TABLE IF EXISTS `interagir`;
CREATE TABLE IF NOT EXISTS `interagir` (
  `Med_Pertubateur` int(10) NOT NULL,
  `MED_MED_Perturbe` int(10) NOT NULL,
  PRIMARY KEY (`Med_Pertubateur`,`MED_MED_Perturbe`),
  KEY `Med_Pertubateur` (`Med_Pertubateur`,`MED_MED_Perturbe`),
  KEY `MED_MED_Perturbe` (`MED_MED_Perturbe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `interagir`
--

INSERT INTO `interagir` (`Med_Pertubateur`, `MED_MED_Perturbe`) VALUES
(4, 1),
(5, 3),
(6, 3),
(3, 4),
(5, 4),
(1, 5),
(1, 6),
(4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `medicaments`
--

DROP TABLE IF EXISTS `medicaments`;
CREATE TABLE IF NOT EXISTS `medicaments` (
  `MED_DepotLegal` int(10) NOT NULL AUTO_INCREMENT,
  `MED_NomCommercial` char(25) NOT NULL,
  `FAM_Code` int(3) NOT NULL,
  `MED_Composition` char(255) NOT NULL,
  `MED_Effets` char(255) NOT NULL,
  `MED_Contreindic` char(255) NOT NULL,
  `MED_PrixChantillon` double NOT NULL,
  PRIMARY KEY (`MED_DepotLegal`),
  KEY `FAM_Code` (`FAM_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `medicaments`
--

INSERT INTO `medicaments` (`MED_DepotLegal`, `MED_NomCommercial`, `FAM_Code`, `MED_Composition`, `MED_Effets`, `MED_Contreindic`, `MED_PrixChantillon`) VALUES
(1, 'DOLIPRANE', 3, 'Amidon de riz', 'Choc anaphylactique', 'Enfant 6 ans', 2),
(3, 'SOTALOL', 3, ' Amidon de maïs, Hydroxypropylcellulose, Carboxyméthylamidon sodique (type A), Magnésium stéarate, Silice colloïdale anhydre', 'Douleur thoracique cardiaque,Palpitation', 'Allergie sotalol,Asthme', 14.5),
(4, 'ATENOLOL', 2, 'Magnésium carbonate lourd , Amidon de maïs , Sodium laurylsulfate , Gélatine , Magnésium stéarate , Cellulose microcristalline , Talc', 'Trouble du sommeil,Hallucination', 'Choc cardiogénique,Maladie du sinus', 7),
(5, 'SALBUTAMOL', 5, 'Sodium chlorure , Sulfurique acide dilué qs pH 4 , Eau purifiée', 'Tremblement des extrémités,Crampe musculaire', 'Allergie salbutamol,Intolérance au salbutamol pour inhalation', 4.7),
(6, 'TERBUTALINE', 10, ' Edétate disodique , Sodium chlorure , Sulfurique acide 0,1 M , Eau pour préparations injectables', 'Tremblement des extrémités,Palpitation', 'Intolérance à terbutaline nébuliseur,Hypersensibilité terbutaline', 2.7),
(7, 'VASTAREL', 7, 'Calcium hydrogénophosphate dihydraté', 'Vertige', 'Tremblement', 5);

-- --------------------------------------------------------

--
-- Structure de la table `prescrire`
--

DROP TABLE IF EXISTS `prescrire`;
CREATE TABLE IF NOT EXISTS `prescrire` (
  `MED_DepotLegal` int(10) NOT NULL,
  `TIN_CODE` int(5) NOT NULL,
  `DOS_CODE` int(10) NOT NULL,
  `PRE_POSOLOGIE` char(40) NOT NULL,
  PRIMARY KEY (`MED_DepotLegal`,`TIN_CODE`,`DOS_CODE`),
  KEY `TIN_CODE` (`TIN_CODE`),
  KEY `MED_DepotLegal` (`MED_DepotLegal`),
  KEY `DOS_CODE` (`DOS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `prescrire`
--

INSERT INTO `prescrire` (`MED_DepotLegal`, `TIN_CODE`, `DOS_CODE`, `PRE_POSOLOGIE`) VALUES
(1, 1, 1, ' 1 comprimé à 20 mg par jour'),
(3, 2, 3, 'jours'),
(3, 3, 1, '80 mg en 1 ou 2 prises'),
(4, 1, 1, '1 medoc par jour'),
(4, 4, 3, ' toutes les 20 à 30 minutes'),
(5, 3, 3, 'hebdomadaire'),
(5, 5, 4, 'un délai de 4 à 5 jours.'),
(6, 1, 2, '3 fois par jour'),
(6, 3, 1, '1 jour');

-- --------------------------------------------------------

--
-- Structure de la table `type_individu`
--

DROP TABLE IF EXISTS `type_individu`;
CREATE TABLE IF NOT EXISTS `type_individu` (
  `TIN_CODE` int(5) NOT NULL AUTO_INCREMENT,
  `TIN_LIBELLE` char(50) NOT NULL,
  PRIMARY KEY (`TIN_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_individu`
--

INSERT INTO `type_individu` (`TIN_CODE`, `TIN_LIBELLE`) VALUES
(1, 'Femme enceinte'),
(2, 'Personne âgée'),
(3, 'Enfant'),
(4, 'Adulte'),
(5, 'Nourisson'),
(6, 'Handicapés');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `interagir`
--
ALTER TABLE `interagir`
  ADD CONSTRAINT `interagir_ibfk_1` FOREIGN KEY (`Med_Pertubateur`) REFERENCES `medicaments` (`MED_DepotLegal`),
  ADD CONSTRAINT `interagir_ibfk_2` FOREIGN KEY (`MED_MED_Perturbe`) REFERENCES `medicaments` (`MED_DepotLegal`);

--
-- Contraintes pour la table `medicaments`
--
ALTER TABLE `medicaments`
  ADD CONSTRAINT `medicaments_ibfk_1` FOREIGN KEY (`FAM_Code`) REFERENCES `famille` (`FAM_code`);

--
-- Contraintes pour la table `prescrire`
--
ALTER TABLE `prescrire`
  ADD CONSTRAINT `prescrire_ibfk_1` FOREIGN KEY (`TIN_CODE`) REFERENCES `type_individu` (`TIN_CODE`),
  ADD CONSTRAINT `prescrire_ibfk_2` FOREIGN KEY (`MED_DepotLegal`) REFERENCES `medicaments` (`MED_DepotLegal`),
  ADD CONSTRAINT `prescrire_ibfk_3` FOREIGN KEY (`DOS_CODE`) REFERENCES `dosage` (`DOS_CODE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
