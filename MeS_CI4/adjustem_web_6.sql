-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 03 fév. 2023 à 10:32
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `adjustem_web`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

DROP TABLE IF EXISTS `activite`;
CREATE TABLE IF NOT EXISTS `activite` (
  `IdActivite` int(11) NOT NULL AUTO_INCREMENT,
  `NomActivite` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdActivite`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`IdActivite`, `NomActivite`) VALUES
(0, '(Aucun)'),
(1, 'Pavillonneur'),
(2, 'Artisan'),
(3, 'Entreprise générale'),
(4, 'Menuiserie'),
(5, 'Négoce'),
(6, 'Préscripteur'),
(7, 'Particulier'),
(8, 'Administration'),
(9, 'Grands chantiers'),
(10, 'Utilisateur'),
(11, 'Maçon');

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE IF NOT EXISTS `agent` (
  `Code` char(2) NOT NULL,
  `Nom` char(30) DEFAULT NULL,
  `Lieu` char(40) DEFAULT NULL,
  `Ville` char(40) DEFAULT NULL,
  `CP` char(5) DEFAULT NULL,
  `Rue1` char(40) DEFAULT NULL,
  `Rue2` char(40) DEFAULT NULL,
  `Tel` char(20) DEFAULT NULL,
  `Fax` char(20) DEFAULT NULL,
  `Portable` char(20) DEFAULT NULL,
  `Mail` char(50) DEFAULT NULL,
  `Contact` char(30) DEFAULT NULL,
  `CommCA` float DEFAULT NULL,
  `CommMB` float DEFAULT NULL,
  `Limite` float DEFAULT NULL,
  `CodeExport` char(10) DEFAULT NULL,
  `Supprimer` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `agent`
--

INSERT INTO `agent` (`Code`, `Nom`, `Lieu`, `Ville`, `CP`, `Rue1`, `Rue2`, `Tel`, `Fax`, `Portable`, `Mail`, `Contact`, `CommCA`, `CommMB`, `Limite`, `CodeExport`, `Supprimer`) VALUES
('01', 'aaabvc', NULL, NULL, NULL, NULL, NULL, '022241414', '1111', '1111', NULL, NULL, NULL, NULL, 1, '111', 0),
('02', 'bb', NULL, NULL, NULL, NULL, NULL, '111', '1111', '111', NULL, NULL, NULL, NULL, 2, '111', 0),
('03', 'ccc', NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, 0, '', 0),
('04', 'eee', NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, 0, '', 0),
('05', 'fffe', NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, 0, '', 0),
('06', 'harold', NULL, NULL, NULL, NULL, NULL, '0610012548', '03224575', '0783411412', NULL, NULL, NULL, NULL, 1, 'xxx', 0);

-- --------------------------------------------------------

--
-- Structure de la table `biblio`
--

DROP TABLE IF EXISTS `biblio`;
CREATE TABLE IF NOT EXISTS `biblio` (
  `Type` smallint(6) DEFAULT NULL,
  `Code` char(6) NOT NULL,
  `Lieu` char(40) DEFAULT NULL,
  `Ville` char(40) DEFAULT NULL,
  `CP` char(5) DEFAULT NULL,
  `Rue1` char(40) DEFAULT NULL,
  `Rue2` char(40) DEFAULT NULL,
  `Tel` char(20) DEFAULT NULL,
  `Fax` char(20) DEFAULT NULL,
  `Portable` char(20) DEFAULT NULL,
  `Mail` char(30) DEFAULT NULL,
  `Contact` char(30) DEFAULT NULL,
  `Xml` varchar(4998) DEFAULT NULL,
  `Supprimer` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `biblio`
--

INSERT INTO `biblio` (`Type`, `Code`, `Lieu`, `Ville`, `CP`, `Rue1`, `Rue2`, `Tel`, `Fax`, `Portable`, `Mail`, `Contact`, `Xml`, `Supprimer`) VALUES
(1, '000000', 'teste', 'AMIENS', '80090', 'teste autre rue 1111', 'teste autre rue 2', '032265656', NULL, NULL, 'contact@lefebvreharold.fr', 'testeur', NULL, 0),
(1, '000001', 'henry', 'Amiens', '80090', 'marcellin berthelot', 'rue2', '0610012548', '03224242424', '02542424', 'a@a.com', 'teste', NULL, 0),
(1, '000010', 'bbn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, '000009', 'xxcc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, '000008', 'ok', NULL, NULL, 'ij', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, '000007', 'abc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, '000006', 'a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, '000011', 'uuuu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, '000012', 'vvv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, '000013', 'vvv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, '000014', 'pppp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, '000015', 'ammj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, '000016', 'janine', NULL, NULL, 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, '000017', 'jack', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, '000018', 'alice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, '000019', 'tttttt', NULL, NULL, 'ttt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, '000020', 'daniel', 'amiens', '80090', 'a', 'a', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, '000021', 'martin', NULL, NULL, 'a', 'a', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, '000022', 'aa', NULL, NULL, 'cc', 'c', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, '000023', 'janine', 'paris', '80090', 'aaa', 'aa', '0610012548', '0610012548', '0610012548', 'ba@a.com', NULL, NULL, 0),
(2, '000024', 'janine', 'paris', '80090', 'aaa', 'aa', '0610012548', '0610012548', '0610012548', 'ba@a.com', NULL, NULL, 0),
(2, '000025', 'janine', 'paris', '80090', 'aaa', 'aa', '0610012548', '0610012548', '0610012548', 'ba@a.com', NULL, NULL, 0),
(1, '000026', 'jean', 'corbie', '80800', '10 rue de la rue', NULL, '0322564565', '0236951222', '0610012548', 'monmail@teste.fr', NULL, NULL, 0),
(2, '000027', '', 'Amiens', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, '000028', '', 'Amiens', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, '000029', '', 'am', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_droit`
--

DROP TABLE IF EXISTS `categorie_droit`;
CREATE TABLE IF NOT EXISTS `categorie_droit` (
  `id_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `intitule_categorie` varchar(50) NOT NULL,
  `controller` varchar(50) NOT NULL,
  `categorie_parent` varchar(255) NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie_droit`
--

INSERT INTO `categorie_droit` (`id_categorie`, `intitule_categorie`, `controller`, `categorie_parent`) VALUES
(1, 'Gestion utilisateur', 'utilisateur', 'Administration'),
(2, 'Gestion client', 'gestionclient', 'Administration'),
(3, 'Gestion représentant', 'gestionrepresentant', 'Administration'),
(4, 'Gestion poseur', 'gestionposeur', 'Administration'),
(5, 'Gestion fournisseur', 'gestionfournisseur', 'Administration'),
(6, 'Gestion raf', 'gestionraf', 'Administration'),
(7, 'Gestion evt', 'gestionevt', 'Administration'),
(8, 'Gestion livraison', 'gestionlivraison', 'Administration'),
(9, 'Gestion destination', 'gestiondestination', 'Administration'),
(10, 'Gestion reglement', 'gestionreglement', 'Administration'),
(11, 'Messages', 'gestionmessage', 'Fonctionnalite'),
(12, 'Documents', 'gestiondocument', 'Fonctionnalite'),
(13, 'Configuration message', 'configurationmessage', 'Configuration'),
(14, 'Configuration document', 'configurationdocument', 'Configuration');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `CODE` varchar(10) NOT NULL,
  `Nom` varchar(30) DEFAULT NULL,
  `Reglement` smallint(6) DEFAULT NULL,
  `Observation` blob,
  `Qualite` varchar(10) DEFAULT NULL,
  `Lieu` varchar(40) DEFAULT NULL,
  `Ville` varchar(40) DEFAULT NULL,
  `CP` varchar(5) DEFAULT NULL,
  `Rue1` varchar(40) DEFAULT NULL,
  `Rue2` varchar(40) DEFAULT NULL,
  `Tel` varchar(20) DEFAULT NULL,
  `Fax` varchar(20) DEFAULT NULL,
  `Portable` varchar(20) DEFAULT NULL,
  `Mail` varchar(255) DEFAULT NULL,
  `Contact` varchar(30) DEFAULT NULL,
  `Siren` varchar(30) DEFAULT NULL,
  `TVAIntracom` varchar(30) DEFAULT NULL,
  `APE` varchar(30) DEFAULT NULL,
  `STATUS` smallint(6) DEFAULT NULL,
  `Capital` varchar(10) DEFAULT NULL,
  `Banque` varchar(6) DEFAULT NULL,
  `Guichet` varchar(6) DEFAULT NULL,
  `Compte` varchar(11) DEFAULT NULL,
  `Cle` varchar(2) DEFAULT NULL,
  `Domiciliation` varchar(24) DEFAULT NULL,
  `LivraisonLieu` varchar(40) DEFAULT NULL,
  `LivraisonVille` varchar(40) DEFAULT NULL,
  `LivraisonCP` varchar(5) DEFAULT NULL,
  `LivraisonRue1` varchar(40) DEFAULT NULL,
  `LivraisonRue2` varchar(40) DEFAULT NULL,
  `LivraisonTel` varchar(20) DEFAULT NULL,
  `LivraisonFax` varchar(20) DEFAULT NULL,
  `LivraisonPortable` varchar(20) DEFAULT NULL,
  `LivraisonMail` varchar(50) DEFAULT NULL,
  `LivraisonContact` varchar(30) DEFAULT NULL,
  `LivraisonType` smallint(6) DEFAULT NULL,
  `LivraisonCode` varchar(6) DEFAULT NULL,
  `FermetureJour` smallint(6) DEFAULT NULL,
  `FermetureHeure` smallint(6) DEFAULT NULL,
  `Flag` smallint(6) DEFAULT NULL,
  `ReglementA` smallint(6) DEFAULT NULL,
  `ReglementLe` smallint(6) DEFAULT NULL,
  `TVA` smallint(6) DEFAULT NULL,
  `Pays` varchar(2) DEFAULT NULL,
  `Activite` smallint(6) DEFAULT NULL,
  `Representant` varchar(2) DEFAULT NULL,
  `Marque` varchar(2) DEFAULT NULL,
  `Escompte` float DEFAULT NULL,
  `Marge` float DEFAULT NULL,
  `FraisDePort` float DEFAULT NULL,
  `ExportCode` varchar(15) DEFAULT NULL,
  `Prescripteur` varchar(15) DEFAULT NULL,
  `IMPORT` smallint(6) DEFAULT NULL,
  `MargeDebloque` smallint(6) DEFAULT NULL,
  `Perso1` varchar(255) DEFAULT NULL,
  `Perso2` varchar(255) DEFAULT NULL,
  `Perso3` varchar(255) DEFAULT NULL,
  `Perso4` varchar(255) DEFAULT NULL,
  `Costume` smallint(6) DEFAULT NULL,
  `CostumeExterne` varchar(10) DEFAULT NULL,
  `FlagAccord` smallint(6) DEFAULT NULL,
  `DateAccordMail` date DEFAULT NULL,
  `DateAccordSms` date DEFAULT NULL,
  `TYPE` smallint(6) DEFAULT NULL,
  `DateAccordCourrier` date DEFAULT NULL,
  `Professionnel` smallint(6) DEFAULT NULL,
  `Proprietaire` smallint(6) DEFAULT NULL,
  `Perso5` varchar(255) DEFAULT NULL,
  `Perso6` varchar(255) DEFAULT NULL,
  `Perso7` varchar(255) DEFAULT NULL,
  `Perso8` varchar(255) DEFAULT NULL,
  `Perso9` varchar(255) DEFAULT NULL,
  `Perso10` varchar(255) DEFAULT NULL,
  `Perso11` varchar(255) DEFAULT NULL,
  `Perso12` varchar(255) DEFAULT NULL,
  `Perso13` varchar(255) DEFAULT NULL,
  `Perso14` varchar(255) DEFAULT NULL,
  `Perso15` varchar(255) DEFAULT NULL,
  `DateCreation` date DEFAULT NULL,
  `DateMaj` date DEFAULT NULL,
  `Supprimer` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`CODE`, `Nom`, `Reglement`, `Observation`, `Qualite`, `Lieu`, `Ville`, `CP`, `Rue1`, `Rue2`, `Tel`, `Fax`, `Portable`, `Mail`, `Contact`, `Siren`, `TVAIntracom`, `APE`, `STATUS`, `Capital`, `Banque`, `Guichet`, `Compte`, `Cle`, `Domiciliation`, `LivraisonLieu`, `LivraisonVille`, `LivraisonCP`, `LivraisonRue1`, `LivraisonRue2`, `LivraisonTel`, `LivraisonFax`, `LivraisonPortable`, `LivraisonMail`, `LivraisonContact`, `LivraisonType`, `LivraisonCode`, `FermetureJour`, `FermetureHeure`, `Flag`, `ReglementA`, `ReglementLe`, `TVA`, `Pays`, `Activite`, `Representant`, `Marque`, `Escompte`, `Marge`, `FraisDePort`, `ExportCode`, `Prescripteur`, `IMPORT`, `MargeDebloque`, `Perso1`, `Perso2`, `Perso3`, `Perso4`, `Costume`, `CostumeExterne`, `FlagAccord`, `DateAccordMail`, `DateAccordSms`, `TYPE`, `DateAccordCourrier`, `Professionnel`, `Proprietaire`, `Perso5`, `Perso6`, `Perso7`, `Perso8`, `Perso9`, `Perso10`, `Perso11`, `Perso12`, `Perso13`, `Perso14`, `Perso15`, `DateCreation`, `DateMaj`, `Supprimer`) VALUES
('000016', 'harry', -1, 0x626c61626c61, '', 'harry', 'Corbie', '80800', '2 rue de la poupée qui tousse', '', '032242414', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '024444', '01111', '1424353', '12', 'bnp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, NULL, 7, NULL, '', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2022-06-24', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-01', '2022-06-24', 0),
('000017', 'jacky', 14, '', 'ei', 'jacky et michel', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'aa', 'cc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-01', '2022-06-27', 0),
('000018', 'Toto', -1, '', 'sarl', 'toto', '', '', '2 rue général leclerc', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-15', '2022-06-15', 2, '2022-06-15', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-02', '2022-06-15', 0),
('000019', 'tata', 2, NULL, 'sarl', 'tata', NULL, NULL, '2 rue tata', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 0, NULL, 11, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-03', NULL, 2, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-02', '2022-06-03', 0),
('000020', 'titi', -1, NULL, 'sarl', 'titi', NULL, NULL, '2 rue titi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-03', '2022-06-03', 2, '2022-06-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-02', '2022-06-03', 0),
('000021', 'Alice', -1, NULL, 'sasu', 'Alice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-07', NULL, 0),
('000022', 'Jean', -1, NULL, 'Sarl', 'Jean', NULL, NULL, '10 rue de jean', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-07', '2022-06-07', 0),
('000013', 'Marc', -1, '', 'Sasu', 'Adjustem', 'Amiens', '80000', 'avenu de l\'europe', '', '0322412174', '0322912174', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-01', '2022-06-17', 0),
('000014', 'Janine', -1, '', '', 'Janine', 'Nanterre', '92000', '10 rue de la poupée qui tousse', '', '0422412174', '0422912174', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-01', '2022-06-17', 0),
('000023', 'harold', -1, NULL, NULL, 'teste', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-09', NULL, 1),
('000024', 'rené', -1, 0x616263, NULL, 'la taupe', 'Amiens', '80090', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-09', '2022-06-09', NULL, '2022-06-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-09', NULL, 1),
('000027', 'martin', 1, NULL, 'Sarl', 'sarl martin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, '0', NULL, 1, 0.01, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-15', '2022-06-15', 2, '2022-06-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-15', NULL, 0),
('000028', 'c', -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 0.01, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-27', NULL, 0),
('000029', 'c', -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 0.01, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-27', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `clientevts`
--

DROP TABLE IF EXISTS `clientevts`;
CREATE TABLE IF NOT EXISTS `clientevts` (
  `IdClientEvt` int(11) NOT NULL AUTO_INCREMENT,
  `IdClientEvtType` int(11) NOT NULL,
  `Client` char(10) DEFAULT NULL,
  `Utilisateur` char(2) DEFAULT NULL,
  `DateEvt` datetime DEFAULT NULL,
  `Description` blob,
  `DateCreation` date DEFAULT NULL,
  `Supprimer` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdClientEvt`),
  KEY `ClientEvtsListe` (`DateEvt`),
  KEY `ClientEvtsDate` (`Client`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clientevts`
--

INSERT INTO `clientevts` (`IdClientEvt`, `IdClientEvtType`, `Client`, `Utilisateur`, `DateEvt`, `Description`, `DateCreation`, `Supprimer`) VALUES
(8, 8, '000017', NULL, '2022-05-25 09:34:00', 0x746573746561, '2022-05-25', 0),
(7, 7, '000021', NULL, '2022-12-25 16:50:00', 0x746573746520626262, '2022-05-24', 0),
(6, 8, '000008', NULL, '2022-05-27 16:29:00', 0x61616161, '2022-05-24', 0),
(9, 7, '000009', NULL, '2022-05-28 13:35:00', 0x7465737465, '2022-05-25', 0),
(10, 9, '000009', NULL, '2022-08-25 09:35:00', 0x7465737465, '2022-05-25', 0),
(20, 7, '000011', NULL, '2022-09-04 07:00:00', 0x796573, '2022-05-30', 0),
(19, 8, '000011', NULL, '2022-05-31 13:15:00', 0x7465737465206f6f, '2022-05-30', 0),
(17, 7, '000010', NULL, '2022-05-29 09:45:00', 0x7465737465, '2022-05-25', 0),
(25, 8, '000016', NULL, '2022-07-29 12:25:00', 0x6262657665207465737465, '2022-06-02', 0),
(22, 7, '000012', NULL, '2022-12-15 12:21:00', 0x7265726664666473666473, '2022-05-30', 0),
(23, 10, '000012', NULL, '2022-05-31 14:55:00', 0x7465737465, '2022-05-30', 0),
(27, 10, '000016', NULL, '2022-06-17 18:06:00', 0x616176637663, '2022-06-03', 0),
(32, 16, '000018', NULL, '2022-06-17 13:47:00', 0x7465737465, '2022-06-16', 0),
(33, 10, '000017', NULL, '2022-06-28 11:42:00', 0x7465737465, '2022-06-28', 0);

-- --------------------------------------------------------

--
-- Structure de la table `clientevtstype`
--

DROP TABLE IF EXISTS `clientevtstype`;
CREATE TABLE IF NOT EXISTS `clientevtstype` (
  `IdClientEvtType` int(11) NOT NULL AUTO_INCREMENT,
  `Libelle` char(50) DEFAULT NULL,
  `Supprimer` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdClientEvtType`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clientevtstype`
--

INSERT INTO `clientevtstype` (`IdClientEvtType`, `Libelle`, `Supprimer`) VALUES
(10, 'arrivage', 0),
(9, 'teste', 0),
(8, 'commande', 1),
(7, 'livraison', 0),
(11, 'aaa', 1),
(12, 'zzz', 0),
(13, 'xxxx', 0),
(14, 'eee', 0),
(15, 'axxxx', 0),
(16, 'testeaacxxx', 0),
(17, 'a2', 1),
(18, 'xxx', 0),
(19, 'eeee', 0),
(20, 'ooo', 0);

-- --------------------------------------------------------

--
-- Structure de la table `clientraf`
--

DROP TABLE IF EXISTS `clientraf`;
CREATE TABLE IF NOT EXISTS `clientraf` (
  `IdClientRaf` int(11) NOT NULL AUTO_INCREMENT,
  `IdClientRafType` int(11) DEFAULT NULL,
  `Client` char(10) DEFAULT NULL,
  `Utilisateur` char(2) DEFAULT NULL,
  `DateRaf` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Description` blob,
  `Quantite` int(11) DEFAULT NULL,
  `Potentiel` int(11) DEFAULT NULL,
  `DateCreation` date DEFAULT NULL,
  `Categorie` char(20) DEFAULT NULL,
  `Etat` smallint(6) DEFAULT NULL,
  `Supprimer` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdClientRaf`),
  KEY `ClientRafDate` (`Client`),
  KEY `ClientRafListe` (`DateRaf`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clientraf`
--

INSERT INTO `clientraf` (`IdClientRaf`, `IdClientRafType`, `Client`, `Utilisateur`, `DateRaf`, `Description`, `Quantite`, `Potentiel`, `DateCreation`, `Categorie`, `Etat`, `Supprimer`) VALUES
(1, 2, '000017', NULL, '2022-06-14 09:35:04', 0x6663636678636365, 1, 1, '2022-05-31', NULL, 1, 0),
(2, 4, '000012', NULL, '2022-12-31 09:14:00', 0x6b68676a676b, 21, 230000, '2022-05-31', NULL, 0, 0),
(4, 5, '000012', NULL, '2022-10-31 10:41:00', 0x626c61626c61626c61, 500, 2000000, '2022-05-31', NULL, 1, 0),
(5, 5, '000018', NULL, '2022-06-16 09:48:04', 0x6263766263766263, 4, 3, '2022-06-02', NULL, 0, 1),
(7, 5, '000016', NULL, '2022-06-18 12:35:00', 0x63637863786f6f, 2, 2, '2022-06-03', NULL, 0, 0),
(8, 6, '000016', NULL, '2022-06-03 17:38:00', 0x7676767272, 1, 14, '2022-06-03', NULL, 1, 0),
(12, 5, '000021', NULL, '2022-06-16 18:27:00', 0x61616161, 8, 6000000, '2022-06-14', NULL, 1, 0),
(13, 5, '000017', NULL, '2022-06-28 10:46:00', 0x74657465, 3, 3, '2022-06-28', NULL, 0, 0),
(14, 11, '000017', NULL, '2022-06-28 13:35:00', 0x6378776377786377, 2, 3, '2022-06-28', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `clientraftype`
--

DROP TABLE IF EXISTS `clientraftype`;
CREATE TABLE IF NOT EXISTS `clientraftype` (
  `IdClientRafType` int(11) NOT NULL AUTO_INCREMENT,
  `Libelle` char(50) DEFAULT NULL,
  `Supprimer` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdClientRafType`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clientraftype`
--

INSERT INTO `clientraftype` (`IdClientRafType`, `Libelle`, `Supprimer`) VALUES
(2, 'teste', 1),
(4, 'teste2', 0),
(5, 'Fenêtre', 0),
(6, 'Porte', 0),
(7, 'volet', 0),
(8, 'vitre', 0),
(9, 'aaatestexxx', 1),
(10, 'eeex', 0),
(11, 'blabla', 0);

-- --------------------------------------------------------

--
-- Structure de la table `configuration_impression`
--

DROP TABLE IF EXISTS `configuration_impression`;
CREATE TABLE IF NOT EXISTS `configuration_impression` (
  `id_user` varchar(255) NOT NULL,
  `parametres` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `destination`
--

DROP TABLE IF EXISTS `destination`;
CREATE TABLE IF NOT EXISTS `destination` (
  `Code` varchar(255) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Mortaise_et_grille` tinyint(1) NOT NULL,
  `Vitrage_granite` tinyint(1) NOT NULL,
  `Bec_de_cane` tinyint(1) NOT NULL,
  `Pas_d_isolation` tinyint(1) NOT NULL,
  `Supprimer` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `destination`
--

INSERT INTO `destination` (`Code`, `Nom`, `Mortaise_et_grille`, `Vitrage_granite`, `Bec_de_cane`, `Pas_d_isolation`, `Supprimer`) VALUES
('000001', 'ooooooooo', 0, 0, 0, 1, 0),
('000002', 'oooooop', 1, 1, 1, 1, 0),
('000003', 'nnnnnnnnnn', 0, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `devis`
--

DROP TABLE IF EXISTS `devis`;
CREATE TABLE IF NOT EXISTS `devis` (
  `numero_de_devis` varchar(25) NOT NULL,
  `reference` varchar(30) NOT NULL,
  `date_creation` date NOT NULL,
  `date_maj` date NOT NULL,
  `montant_HT` varchar(255) NOT NULL,
  `montant_TTC` varchar(255) NOT NULL,
  `montant_TVA` varchar(255) NOT NULL,
  `taux_TVA` float NOT NULL,
  `id_client` varchar(255) NOT NULL,
  `adresse_client` varchar(255) NOT NULL,
  PRIMARY KEY (`numero_de_devis`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `devis`
--

INSERT INTO `devis` (`numero_de_devis`, `reference`, `date_creation`, `date_maj`, `montant_HT`, `montant_TTC`, `montant_TVA`, `taux_TVA`, `id_client`, `adresse_client`) VALUES
('000001', 'o1', '2022-12-21', '0000-00-00', '612.55', '655.28', '47.73', 0, '000016', '');

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `Externe` smallint(6) NOT NULL,
  `IdDocument` varchar(10) NOT NULL,
  `IdTypeDocument` varchar(10) NOT NULL,
  `Libelle` varchar(50) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Date_Creation` date NOT NULL,
  `Lien` varchar(255) NOT NULL,
  `LienFlag` smallint(6) NOT NULL,
  `Fournisseur` varchar(255) NOT NULL,
  `Famille` varchar(2) NOT NULL,
  `Modele` varchar(2) NOT NULL,
  `TypeTva` smallint(6) NOT NULL,
  `Popup` smallint(6) NOT NULL,
  `DossierNumero` varchar(10) NOT NULL,
  `CodeClient` varchar(10) NOT NULL,
  `Print` smallint(6) NOT NULL,
  `Supprimer` int(1) NOT NULL,
  PRIMARY KEY (`IdDocument`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `document`
--

INSERT INTO `document` (`Externe`, `IdDocument`, `IdTypeDocument`, `Libelle`, `Description`, `Date_Creation`, `Lien`, `LienFlag`, `Fournisseur`, `Famille`, `Modele`, `TypeTva`, `Popup`, `DossierNumero`, `CodeClient`, `Print`, `Supprimer`) VALUES
(0, '000003', '000006', 'o', 'o8', '2022-08-31', 'https://google.com', 0, 'PROFALUX*', '', '', 0, 0, '', '', 13, 1),
(0, '000002', '000007', 'o3', 'o3', '2022-08-31', 'https://google.com', 0, 'SER-PUG', '', '', 0, 0, '', '', 11, 1),
(0, '000001', '000001', 'o', 'o', '2022-08-31', 'https://google.com', 0, 'NEOBAIE PE **', '', '', 0, 0, '', '', 6, 0),
(0, '000004', '000007', 'a', 'a', '2022-09-01', 'https://google.com', 0, 'PROFALUX*', '', '', 0, 0, '', '', 6, 1),
(0, '000005', '000007', 'o', 'o', '2022-09-01', 'https://google.com', 0, 'PROFALUX*', '', '', 0, 0, '', '', 6, 1),
(0, '000006', '000006', 'o', 'o7', '2022-09-02', 'https://google.com', 0, 'PROFALUX*', '', '', 0, 0, '', '', 9, 0),
(0, '000007', '000007', 'o', 'o', '2022-09-02', 'https://google.com', 1, 'SER-PUG', '', '', 0, 0, '', '', 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `document_type`
--

DROP TABLE IF EXISTS `document_type`;
CREATE TABLE IF NOT EXISTS `document_type` (
  `Externe_type` smallint(6) NOT NULL,
  `IdTypeDocument` varchar(10) NOT NULL,
  `IdParent` varchar(10) NOT NULL DEFAULT '000000',
  `Libelle_type` varchar(50) NOT NULL,
  PRIMARY KEY (`IdTypeDocument`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `document_type`
--

INSERT INTO `document_type` (`Externe_type`, `IdTypeDocument`, `IdParent`, `Libelle_type`) VALUES
(0, '000002', '000000', 'type o2 '),
(0, '000003', '000000', 'type o3'),
(0, '000004', '000003', 'type o4 => attaché à o3'),
(0, '000001', '000000', 'type o'),
(0, '000005', '000003', 'type o6 => attaché à o3'),
(0, '000006', '000005', 'o7 => attaché a o6'),
(0, '000007', '000006', 'o8 => attaché à o7');

-- --------------------------------------------------------

--
-- Structure de la table `droit`
--

DROP TABLE IF EXISTS `droit`;
CREATE TABLE IF NOT EXISTS `droit` (
  `id_droit` int(11) NOT NULL AUTO_INCREMENT,
  `code_parent` varchar(255) NOT NULL,
  `intitule_droit` varchar(255) NOT NULL,
  `code_droit` varchar(255) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  PRIMARY KEY (`id_droit`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `droit`
--

INSERT INTO `droit` (`id_droit`, `code_parent`, `intitule_droit`, `code_droit`, `id_categorie`) VALUES
(21, '17', 'Modifier utilisateur', 'liste_utilisateur_modifier', 1),
(22, '', 'Liste client', 'liste_client', 2),
(23, '', 'Ajouter client', 'ajouter_client', 2),
(24, '', 'Rechercher client', 'recherche_client', 2),
(25, '', 'Rechercher fournisseur', 'recherche_fournisseur', 5),
(26, '', 'Liste fournisseur', 'liste_fournisseur', 5),
(27, '', 'Rechercher représentant', 'recherche_representant', 3),
(20, '17', 'Supprimer utilisateur', 'liste_utilisateur_supprimer', 1),
(18, '', 'Ajouter utilisateur', 'ajout_utilisateur', 1),
(1, '', 'Rechercher utilisateur', 'recherche_utilisateur', 1),
(11, '1', 'Supprimer utilisateur', 'recherche_utilisateur_supprimer', 1),
(12, '1', 'Modifier utilisateur', 'recherche_utilisateur_modifier', 1),
(13, '', 'Validation compte', 'validation_utilisateur', 1),
(14, '1', 'Modifier droit', 'recherche_utilisateur_modifier_droit', 1),
(15, '13', 'Validation compte', 'validation_utilisateur_valider', 1),
(16, '13', 'Suppression compte', 'validation_utilisateur_supprimer', 1),
(17, '', 'Liste utilisateur', 'liste_utilisateur', 1),
(28, '', 'Ajout représentant', 'ajout_representant', 3),
(29, '', 'Liste représentant', 'liste_representant', 3),
(30, '', 'Liste poseur', 'liste_poseur', 4),
(31, '', 'Ajout poseur', 'ajout_poseur', 4),
(32, '', 'Rechercher poseur', 'recherche_poseur', 4),
(33, '', 'Afficher Type Evenement', 'afficher_type_evt', 7),
(34, '', 'Afficher Type Reste à faire', 'afficher_type_raf', 6),
(35, '17', 'Modifier droit', 'liste_utilisateur_modifier_droit', 1),
(36, '22', 'Modifier client', 'liste_client_modifier', 2),
(37, '22', 'Supprimer client', 'liste_client_supprimer', 2),
(38, '24', 'Modifier client', 'recherche_client_modifier', 2),
(39, '24', 'Supprimer client', 'recherche_client_supprimer', 2),
(40, '27', 'Supprimer répresentant', 'recherche_representant_supprimer', 3),
(41, '27', 'Modifier représentant', 'recherche_representant_modifier', 3),
(42, '29', 'Supprimer représentant', 'liste_representant_supprimer', 3),
(43, '29', 'Modifier représentant', 'liste_representant_modifier', 3),
(44, '30', 'Supprimer poseur', 'liste_poseur_supprimer', 4),
(45, '30', 'Modifier poseur', 'liste_poseur_modifier', 4),
(46, '32', 'Modifier poseur', 'rechercher_poseur_modifier', 4),
(47, '32', 'Supprimer poseur', 'recherche_poseur_supprimer', 4),
(48, '25', 'Supprimer fournisseur', 'recherche_fournisseur_supprimer', 5),
(49, '25', 'Modifier fournisseur', 'recherche_fournisseur_modifier', 5),
(50, '26', 'Modifier fournisseur', 'liste_fournisseur_modifier', 5),
(51, '26', 'Supprimer fournisseur', 'liste_fournisseur_supprimer', 5),
(52, '', 'Liste événement', 'liste_evenement', 7),
(53, '', 'Liste reste à faire', 'liste_raf', 6),
(54, '', 'Recherche événement', 'recherche_evenement', 7),
(55, '', 'Recherche reste à faire', 'recherche_raf', 6),
(56, '52', 'Supprimer évènement', 'liste_evenement_supprimer', 7),
(57, '52', 'Modifier évènement', 'liste_evenement_modifier', 7),
(58, '54', 'Supprimer évènement', 'recherche_evenement_supprimer', 7),
(59, '54', 'Modifier évènement', 'recherche_evenement_modifier', 7),
(60, '53', 'Supprimer RAF', 'liste_raf_supprimer', 6),
(61, '53', 'Modifier RAF', 'liste_raf_modifier', 6),
(62, '55', 'Supprimer RAF', 'recherche_raf_supprimer', 6),
(63, '55', 'Modifier RAF', 'recherche_raf_modifier', 6),
(64, '', 'Liste livraison', 'liste_livraison', 8),
(65, '', 'Recherche livraison', 'recherche_livraison', 8),
(66, '', 'Ajout livraison', 'ajout_livraison', 8),
(67, '65', 'Supprimer livraison', 'recherche_livraison_supprimer', 8),
(68, '65', 'Modifier livraison', 'recherche_livraison_modifier', 8),
(69, '64', 'Modifier livraison', 'liste_livraison_modifier', 8),
(70, '64', 'Supprimer livraison', 'liste_livraison_supprimer', 8),
(71, '', 'Liste destination', 'liste_destination', 9),
(72, '', 'Recherche destination', 'recherche_destination', 9),
(73, '', 'Ajout destination', 'ajout_destination', 9),
(74, '72', 'Supprimer destination', 'recherche_destination_supprimer', 9),
(75, '72', 'Modifier destination', 'recherche_destination_modifier', 9),
(76, '71', 'Modifier destination', 'liste_destination_modifier', 9),
(77, '71', 'Supprimer destination', 'liste_destination_supprimer', 9),
(78, '', 'Liste reglement', 'liste_reglement', 10),
(79, '', 'Recherche reglement', 'recherche_reglement', 10),
(80, '', 'Ajout reglement', 'ajout_reglement', 10),
(81, '79', 'Supprimer reglement', 'recherche_reglement_supprimer', 10),
(82, '79', 'Modifier reglement', 'recherche_reglement_modifier', 10),
(83, '78', 'Modifier reglement', 'liste_reglement_modifier', 10),
(84, '78', 'Supprimer reglement', 'liste_reglement_supprimer', 10),
(86, '', 'Liste document', 'liste_document', 12),
(94, '', 'Liste message', 'liste_message', 11),
(87, '', 'Rechercher message', 'recherche_message', 11),
(88, '', 'Ajouter message', 'ajout_message', 13),
(95, '93', 'Supprimer message', 'edition_message_supprimer', 13),
(93, '', 'Edition message', 'edition_message', 13),
(91, '87', 'Visualier message ', 'recherche_message_visualiser', 11),
(96, '93', 'Modifier message', 'edition_message_modifier', 13),
(97, '', 'Ajouter document', 'ajout_document', 14),
(98, '', 'Edition type document', 'edition_type_document', 14),
(99, '100', 'Supprimer document', 'edition_document_supprimer', 14),
(100, '', 'Edition document', 'edition_document', 14),
(101, '100', 'Modifier document', 'edition_document_modifier', 14);

-- --------------------------------------------------------

--
-- Structure de la table `fournis`
--

DROP TABLE IF EXISTS `fournis`;
CREATE TABLE IF NOT EXISTS `fournis` (
  `Code` char(2) NOT NULL,
  `Nom` char(30) DEFAULT NULL,
  `Reglement` smallint(6) DEFAULT NULL,
  `Observation` varchar(4998) DEFAULT NULL,
  `Qualite` char(10) DEFAULT NULL,
  `Lieu` char(40) DEFAULT NULL,
  `Ville` char(40) DEFAULT NULL,
  `CP` char(5) DEFAULT NULL,
  `Rue1` char(40) DEFAULT NULL,
  `Rue2` char(40) DEFAULT NULL,
  `Tel` char(20) DEFAULT NULL,
  `Fax` char(20) DEFAULT NULL,
  `Portable` char(20) DEFAULT NULL,
  `Mail` char(50) DEFAULT NULL,
  `Contact` char(30) DEFAULT NULL,
  `Siren` char(30) DEFAULT NULL,
  `TVAIntracom` char(30) DEFAULT NULL,
  `APE` char(30) DEFAULT NULL,
  `Status` smallint(6) DEFAULT NULL,
  `Capital` char(10) DEFAULT NULL,
  `Banque` char(5) DEFAULT NULL,
  `Guichet` char(5) DEFAULT NULL,
  `Compte` char(11) DEFAULT NULL,
  `Cle` char(2) DEFAULT NULL,
  `Domiciliation` char(20) DEFAULT NULL,
  `LivraisonLieu` char(40) DEFAULT NULL,
  `LivraisonVille` char(40) DEFAULT NULL,
  `LivraisonCP` char(5) DEFAULT NULL,
  `LivraisonRue1` char(40) DEFAULT NULL,
  `LivraisonRue2` char(40) DEFAULT NULL,
  `LivraisonTel` char(20) DEFAULT NULL,
  `LivraisonFax` char(20) DEFAULT NULL,
  `LivraisonPortable` char(20) DEFAULT NULL,
  `LivraisonMail` char(50) DEFAULT NULL,
  `LivraisonContact` char(30) DEFAULT NULL,
  `LivraisonType` smallint(6) DEFAULT NULL,
  `LivraisonCode` char(6) DEFAULT NULL,
  `FermetureJour` smallint(6) DEFAULT NULL,
  `FermetureHeure` smallint(6) DEFAULT NULL,
  `Ferme` smallint(6) DEFAULT NULL,
  `ReglementA` smallint(6) DEFAULT NULL,
  `ReglementLe` smallint(6) DEFAULT NULL,
  `TVA` smallint(6) DEFAULT NULL,
  `CommCA` float DEFAULT NULL,
  `CommMB` float DEFAULT NULL,
  `Message` varchar(4998) DEFAULT NULL,
  `Franco` char(50) DEFAULT NULL,
  `ForfaitPort` float DEFAULT NULL,
  `MargeAveugle` float DEFAULT NULL,
  `CoefTarif` float DEFAULT NULL,
  `Remises` char(100) DEFAULT NULL,
  `MentionFlag` smallint(6) DEFAULT NULL,
  `MentionLibelle` char(100) DEFAULT NULL,
  `MentionImage` char(255) DEFAULT NULL,
  `Supprimer` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fournis`
--

INSERT INTO `fournis` (`Code`, `Nom`, `Reglement`, `Observation`, `Qualite`, `Lieu`, `Ville`, `CP`, `Rue1`, `Rue2`, `Tel`, `Fax`, `Portable`, `Mail`, `Contact`, `Siren`, `TVAIntracom`, `APE`, `Status`, `Capital`, `Banque`, `Guichet`, `Compte`, `Cle`, `Domiciliation`, `LivraisonLieu`, `LivraisonVille`, `LivraisonCP`, `LivraisonRue1`, `LivraisonRue2`, `LivraisonTel`, `LivraisonFax`, `LivraisonPortable`, `LivraisonMail`, `LivraisonContact`, `LivraisonType`, `LivraisonCode`, `FermetureJour`, `FermetureHeure`, `Ferme`, `ReglementA`, `ReglementLe`, `TVA`, `CommCA`, `CommMB`, `Message`, `Franco`, `ForfaitPort`, `MargeAveugle`, `CoefTarif`, `Remises`, `MentionFlag`, `MentionLibelle`, `MentionImage`, `Supprimer`) VALUES
('00', 'UNIVERSEL', 0, '', '', 'a', 'Amiens', '80080', 'a', 'a', '0610012548', '0000000', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'jack', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '000017', NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '', 0, NULL, NULL, '', NULL, NULL, NULL, 0),
('AL', 'BREMAUD PE**', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Fabrication 100% fran�aise', 'drapeau_france.png', 0),
('AO', 'BEL\'M  Bois*', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
('AP', 'BEL\'M  Aluminium*', 0, '', '', '', '', '', '', '', '', '', '', '', '', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '', 0, NULL, NULL, '', 0, NULL, NULL, 0),
('AZ', 'TUBAUTO *', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('BC', 'FRANCE FERMETURES', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
('BJ', 'SIFISA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('BW', 'BEL\'M  Mixte*', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
('CE', 'EVENO*', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
('DG', 'SOTHOFERM', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('DJ', 'BREMAUD**', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Fabrication 100% fran�aise', 'drapeau_france.png', 0),
('DN', 'ALUPREFERENCE', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
('FT', 'SER-PUG', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('FU', 'ECLISSE', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
('GL', 'FUTUROL\'', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
('GQ', 'NEOBAIE **', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
('HD', 'PROFALUX*', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Fabrication Fran�aise', 'drapeau_france.png', 0),
('JJ', 'ALUPREFERENCE PORTAIL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
('MG', 'MOLENAT BOIS*', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'GK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
('MJ', 'MOLENAT ALU*', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'GK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
('MM', 'MOLENAT PVC*', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'GK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
('OE', 'NEOBAIE PE **', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0),
('RR', 'SOTHOFERM PORTAIL', 0, '', '', '', '', '', '', '', '', '', '', '', '', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 'c', 0.03, NULL, NULL, '', NULL, NULL, NULL, 0),
('TX', ' MES DECHETS', 0, '', '', '', '', '', '', '', '', '', '', '', '', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'henry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '000001', NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, '', 0, NULL, NULL, '', 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `libelle`
--

DROP TABLE IF EXISTS `libelle`;
CREATE TABLE IF NOT EXISTS `libelle` (
  `Famille` smallint(6) NOT NULL,
  `TypeFamille` smallint(6) NOT NULL,
  `TypeModele` smallint(6) NOT NULL,
  `Nom` char(50) DEFAULT NULL,
  `CodeFamille` char(2) DEFAULT NULL,
  `CodeModele` char(2) DEFAULT NULL,
  `Flag` smallint(6) DEFAULT NULL,
  `Data` blob,
  `Xml` blob,
  `Image` blob,
  `Delete` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Famille`,`TypeFamille`,`TypeModele`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `libelle`
--

INSERT INTO `libelle` (`Famille`, `TypeFamille`, `TypeModele`, `Nom`, `CodeFamille`, `CodeModele`, `Flag`, `Data`, `Xml`, `Image`, `Delete`) VALUES
(1, 1, 0, 'Menuiseries', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 1, 1, 'Sans V.R.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 1, 2, 'V.R. dans la hauteur', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 1, 3, 'V.R. compris hauteur', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 2, 0, 'Volet Battant', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 3, 0, 'Volet Roulant', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 4, 0, 'Bloc Porte', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 5, 0, 'Porte d\'entrée', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 5, 1, 'Imposte', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 5, 2, 'Latéral', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 6, 0, 'Porte de Garage', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 7, 0, 'Grille de défense', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 8, 0, 'Persienne', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 0, 'Ouverture', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 1, 'Fixe', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 2, 'O.F.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 3, 'O.B.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 4, 'Porte serrure', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 5, 'Porte crémone', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 6, 'BCC', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 7, 'Pène dormant', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 0, 'Dormant', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, 'F.T.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 2, 'T.V.R.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 3, 0, 'Vitrage', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 3, 1, 'Clair', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 3, 2, 'Granité', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 4, 0, 'Serrure', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 4, 1, 'BCC', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 4, 2, 'Pène dormant', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 5, 0, 'Matière', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 6, 0, 'Couleur', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 7, 0, 'Finition', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 8, 0, 'Forme', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 9, 0, 'Tapées Persienne', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 9, 1, 'Existante', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 10, 0, 'Divers', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 10, 1, 'TVR', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 0, 'Poignée', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, 0, 'Fixation', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 0, 'Gond', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 4, 0, 'Mortaise & Grille', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 5, 0, 'Petits Bois', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 6, 0, 'Couvre-Fiches', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 7, 0, 'Arrêt', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 8, 0, 'Divers', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 8, 1, 'Option', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 8, 2, 'Accessoire', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 9, 0, 'V.R.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 10, 0, 'Habillage', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 11, 0, 'Imposte/Allege', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 11, 1, 'Hauteur Allege', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 0, '(Aucun)', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 1, 'Hauteur', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 2, 'Largeur', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 3, 'Tableau', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 4, 'ML 2 x H + L', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 5, 'ML Hauteur', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 6, 'ML Largeur', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 7, 'Périphérie', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 8, 'Surface', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 9, 'Au vantail', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 10, 'Unitaire', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 11, 'Tableau (sans vantaux)', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 12, '2 x H + L', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 13, 'Sur cases bleues', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 14, '@4 Vtx -> 3Vtx', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 15, 'Largeur/Nb vantaux', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 16, 'Tableau/Nb vantaux', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 17, 'Surface/Zone', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 18, 'H + L', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 19, 'ML H + L', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 20, 'Hauteur 5 - Largeur 0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 0, 'Habituel', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 1, 'ch. à la cde', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 2, 'ch. à la livraison au livreur', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 3, '30 % à la cde, solde à la livraison au livreur', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 4, '30 % à la cde, solde à réception de la facture', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 5, 'à réception de facture', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 6, 'à réception de facture moins 2% d\'escompte', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 7, 'à réception de facture moins 3% d\'escompte', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 8, 'par ch. à 30 J.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 9, 'par ch. à 60 J.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 10, 'par LCR à 30 J.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 11, 'par LCR à 30 J. le 10', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 12, 'par LCR à 60 J.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 13, 'par LCR à 60 J. le 10', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 14, 'par billet à ordre à 30 J date de facture', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 15, 'par billet à ordre à 60 J date de facture', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 16, 'par retour', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 17, 'Billet à Ordre', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 18, 'L.C.C.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 19, 'L.C.R.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 20, 'L.C.R. Acceptée', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 21, '30 % Cde, 40 % Livraison, 30 % Fin Pose', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 22, '30 % Cde, 50 % Livraison, 20 % Fin Pose', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 23, '30 % Cde, 60 % Livraison, 10 % Fin Pose', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 24, 'Acompte 30%, solde à l\'enlévement', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 25, 'à l\'enlévement', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 26, '40 % à la cde, solde à réception de la facture', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 0, '(Aucun)', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 1, 'Pavillonneur', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 2, 'Artisan', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 3, 'Entreprise générale', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 4, 'Menuiserie', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 5, 'Négoce', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 6, 'Préscripteur', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 7, 'Particulier', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 8, 'Administration', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 9, 'Grands chantiers', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 10, 'Utilisateur', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 11, 'Maçon', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 0, 1, 'Sur le chantier', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 0, 2, 'Liste  :', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 0, 3, 'Autre :', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 0, 4, 'Chez le client (facturation)', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 0, 5, 'Chez le poseur', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 0, 0, '(Aucun)', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 0, 1, 'Lundi', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 0, 2, 'Mardi', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 0, 3, 'Mercredi', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 0, 4, 'Jeudi', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 0, 5, 'Vendredi', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 0, 6, 'Samedi', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 0, 7, 'Dimanche', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 0, -1, '(Aucun)', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 0, 0, 'Toute la journée', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 0, 1, 'Matin', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 0, 2, 'Aprés-midi', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ligne`
--

DROP TABLE IF EXISTS `ligne`;
CREATE TABLE IF NOT EXISTS `ligne` (
  `id_ligne` int(11) NOT NULL AUTO_INCREMENT,
  `id_ligne_type` int(11) NOT NULL,
  `numero_de_devis` varchar(25) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT '1',
  `titre` varchar(50) NOT NULL,
  `produit` int(11) NOT NULL,
  `ordre` int(11) NOT NULL,
  `libelle` text NOT NULL,
  `contenu` text NOT NULL,
  `montant_HT` float NOT NULL,
  `montant_TTC` float NOT NULL,
  `montant_TVA` float NOT NULL,
  `taux_TVA` float NOT NULL,
  `type_remise` float NOT NULL,
  `remise` float NOT NULL,
  `image` text NOT NULL,
  `supprimer` tinyint(1) NOT NULL DEFAULT '0',
  `date_creation` date NOT NULL,
  `date_modification` date NOT NULL,
  `date_supression` date NOT NULL,
  PRIMARY KEY (`id_ligne`)
) ENGINE=MyISAM AUTO_INCREMENT=433 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ligne`
--

INSERT INTO `ligne` (`id_ligne`, `id_ligne_type`, `numero_de_devis`, `quantite`, `titre`, `produit`, `ordre`, `libelle`, `contenu`, `montant_HT`, `montant_TTC`, `montant_TVA`, `taux_TVA`, `type_remise`, `remise`, `image`, `supprimer`, `date_creation`, `date_modification`, `date_supression`) VALUES
(427, 1, '000001', 1, 'produit text1 ', 1, 0, 'pt1', '', 100, 114, 19, 20, 0, 5, '', 0, '2022-12-21', '0000-00-00', '0000-00-00'),
(428, 2, '000001', 1, 'remise 50€ sur la 20', 2, 0, 'r', '', 0, 0, 0, 20, 1, 50, '', 0, '2022-12-22', '0000-00-00', '0000-00-00'),
(429, 5, '000001', 1, 'produit 1 ', 3, 0, '<br> Référence : p1<br> Code export : <br> Description : ooooooo<br> <strong>Caractéristiques du produit</strong> : <br> Libelle : largeur - Unite : cm2 - Valeur : 20<br> Libelle : hauteur - Unite : cm - Valeur : 20<br>', '<PRODUIT><ID_PRODUIT valeur=\"6\"/><PRIX><PRIX_TARIF_HT valeur=\"50.95\"/><PRIX_ACHAT_HT valeur=\"0\"/><PRIX_VENTE_HT valeur=\"0\"/></PRIX><STOCK valeur=\"500\"/><STOCK_MINI valeur=\"5\"/><CARACTERISTIQUES><CARACTERISTIQUE><LIBELLE valeur=\"largeur\" /><UNITE valeur=\"cm2\" /><VALEUR valeur=\"20\" /></CARACTERISTIQUE><CARACTERISTIQUE><LIBELLE valeur=\"hauteur\" /><UNITE valeur=\"cm\" /><VALEUR valeur=\"20\" /></CARACTERISTIQUE></CARACTERISTIQUES></PRODUIT>', 50.95, 61.14, 10.19, 20, 1, 0, '', 1, '2022-12-22', '0000-00-00', '2022-12-22'),
(430, 4, '000001', 1, 'mes dechets', 4, 0, '', '<PRODUIT><ID>430</ID><MATIERES><MATIERE><ID valeur=\"1\" /><NOM valeur=\"bois\" /><QUANTITE valeur=\"5\" /><UNITE valeur=\"kg\" /><PRIX_UNITAIRE valeur=\"20.99\" /><PRIX_TOTAL valeur=\"104.95\" /></MATIERE></MATIERES><ENTREPRISES></ENTREPRISES></PRODUIT>', 124.95, 137.44, 12.49, 10, 0, 20, '', 0, '0000-00-00', '2022-12-22', '0000-00-00'),
(431, 5, '000001', 5, 'produit 1 ', 5, 0, '<br> Référence : p1<br> Code export : <br> Description : ooooooo<br> <strong>Caractéristiques du produit</strong> : <br> Libelle : largeur - Unite : cm2 - Valeur : 20<br> Libelle : hauteur - Unite : cm - Valeur : 20<br>', '<PRODUIT><ID_PRODUIT valeur=\"6\"/><PRIX><PRIX_TARIF_HT valeur=\"50.95\"/><PRIX_ACHAT_HT valeur=\"0\"/><PRIX_VENTE_HT valeur=\"0\"/></PRIX><STOCK valeur=\"500\"/><STOCK_MINI valeur=\"5\"/><CARACTERISTIQUES><CARACTERISTIQUE><LIBELLE valeur=\"largeur\" /><UNITE valeur=\"cm2\" /><VALEUR valeur=\"20\" /></CARACTERISTIQUE><CARACTERISTIQUE><LIBELLE valeur=\"hauteur\" /><UNITE valeur=\"cm\" /><VALEUR valeur=\"20\" /></CARACTERISTIQUE></CARACTERISTIQUES></PRODUIT>', 50.95, 61.14, 10.19, 20, 1, 0, '', 0, '2022-12-22', '0000-00-00', '0000-00-00'),
(432, 5, '000001', 3, 'produit 1 ', 6, 0, '<br> Référence : p1<br> Code export : <br> Description : ooooooo<br> <strong>Caractéristiques du produit</strong> : <br> Libelle : largeur - Unite : cm2 - Valeur : 20<br> Libelle : hauteur - Unite : cm - Valeur : 20<br>', '<PRODUIT><ID_PRODUIT valeur=\"6\"/><PRIX><PRIX_TARIF_HT valeur=\"50.95\"/><PRIX_ACHAT_HT valeur=\"0\"/><PRIX_VENTE_HT valeur=\"0\"/></PRIX><STOCK valeur=\"500\"/><STOCK_MINI valeur=\"5\"/><CARACTERISTIQUES><CARACTERISTIQUE><LIBELLE valeur=\"largeur\" /><UNITE valeur=\"cm2\" /><VALEUR valeur=\"20\" /></CARACTERISTIQUE><CARACTERISTIQUE><LIBELLE valeur=\"hauteur\" /><UNITE valeur=\"cm\" /><VALEUR valeur=\"20\" /></CARACTERISTIQUE></CARACTERISTIQUES></PRODUIT>', 50.95, 56.045, 5.095, 10, 1, 0, '', 0, '2022-12-22', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_type`
--

DROP TABLE IF EXISTS `ligne_type`;
CREATE TABLE IF NOT EXISTS `ligne_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ligne_type`
--

INSERT INTO `ligne_type` (`id`, `code`) VALUES
(1, 'texte'),
(2, 'remise_fixe'),
(3, 'remise_variable');

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `Code` varchar(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Rue1` varchar(255) DEFAULT NULL,
  `Rue2` varchar(255) DEFAULT NULL,
  `CP` int(11) DEFAULT NULL,
  `Ville` varchar(255) DEFAULT NULL,
  `Tel` int(11) DEFAULT NULL,
  `Mail` varchar(255) DEFAULT NULL,
  `Contact` varchar(255) DEFAULT NULL,
  `Fax` int(11) DEFAULT NULL,
  `Supprimer` tinyint(1) NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`Code`, `Nom`, `Rue1`, `Rue2`, `CP`, `Ville`, `Tel`, `Mail`, `Contact`, `Fax`, `Supprimer`) VALUES
('000003', 'c', NULL, NULL, NULL, NULL, NULL, 'leemickael.darmon@outlook.fr', NULL, NULL, 0),
('000002', 'b', 'oooooooo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('000001', 'a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('000004', 'd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
('000005', 'e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `livraisontypeclient`
--

DROP TABLE IF EXISTS `livraisontypeclient`;
CREATE TABLE IF NOT EXISTS `livraisontypeclient` (
  `Id_Livraisontypeclient` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Livraisontypeclient` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_Livraisontypeclient`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livraisontypeclient`
--

INSERT INTO `livraisontypeclient` (`Id_Livraisontypeclient`, `Nom_Livraisontypeclient`) VALUES
(0, 'Enlèvement par vos soins'),
(1, 'A l\'agence/Dépôt'),
(2, 'Chez le client (Facturation)'),
(3, 'Chez le poseur');

-- --------------------------------------------------------

--
-- Structure de la table `livraisontypefns`
--

DROP TABLE IF EXISTS `livraisontypefns`;
CREATE TABLE IF NOT EXISTS `livraisontypefns` (
  `Id_Livraisontypefns` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Livraisontypefns` varchar(25) NOT NULL,
  PRIMARY KEY (`Id_Livraisontypefns`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livraisontypefns`
--

INSERT INTO `livraisontypefns` (`Id_Livraisontypefns`, `Nom_Livraisontypefns`) VALUES
(0, 'Aucun'),
(1, 'Sur le chantier'),
(2, 'Liste  :'),
(3, 'Autre :'),
(4, 'Chez le client '),
(5, 'Chez le poseur'),
(7, 'Enlèvement par vos soins'),
(8, 'A l\'agence/Dépôt');

-- --------------------------------------------------------

--
-- Structure de la table `mesdechets_entreprise`
--

DROP TABLE IF EXISTS `mesdechets_entreprise`;
CREATE TABLE IF NOT EXISTS `mesdechets_entreprise` (
  `Id_entreprise` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `Rue1` varchar(255) NOT NULL,
  `Rue2` varchar(255) NOT NULL,
  `Codepostal` varchar(255) NOT NULL,
  `Ville` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  PRIMARY KEY (`Id_entreprise`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `mesdechets_entreprise`
--

INSERT INTO `mesdechets_entreprise` (`Id_entreprise`, `Nom`, `Rue1`, `Rue2`, `Codepostal`, `Ville`, `Type`) VALUES
(1, 'Adjustem', '53 avenue de l\'europe', '', '80000', 'Amiens', 'SSII');

-- --------------------------------------------------------

--
-- Structure de la table `mesdechets_matiere`
--

DROP TABLE IF EXISTS `mesdechets_matiere`;
CREATE TABLE IF NOT EXISTS `mesdechets_matiere` (
  `Id_matiere` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  PRIMARY KEY (`Id_matiere`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `mesdechets_matiere`
--

INSERT INTO `mesdechets_matiere` (`Id_matiere`, `Nom`) VALUES
(1, 'PVC'),
(2, 'plastique'),
(3, 'bois'),
(4, 'FER'),
(5, 'FER'),
(6, 'FER'),
(7, 'FER');

-- --------------------------------------------------------

--
-- Structure de la table `mesproduits_caracteristique`
--

DROP TABLE IF EXISTS `mesproduits_caracteristique`;
CREATE TABLE IF NOT EXISTS `mesproduits_caracteristique` (
  `Id_caracteristique` int(11) NOT NULL AUTO_INCREMENT,
  `Libelle` varchar(50) NOT NULL,
  `Unite` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_caracteristique`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `mesproduits_caracteristique`
--

INSERT INTO `mesproduits_caracteristique` (`Id_caracteristique`, `Libelle`, `Unite`) VALUES
(1, 'largeur', 'cm2'),
(2, 'hauteur', 'cm'),
(4, 'couleur', ''),
(5, 'profondeur', 'cm');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `Externe` smallint(1) NOT NULL,
  `IdMessage` varchar(6) NOT NULL,
  `IdTypeMessage` int(11) NOT NULL,
  `Libelle` varchar(255) NOT NULL,
  `Date_Creation` date NOT NULL,
  `Importance` varchar(20) NOT NULL,
  `Lien` varchar(255) DEFAULT NULL,
  `Fournisseur` varchar(255) DEFAULT NULL,
  `Famille` varchar(2) DEFAULT NULL,
  `Modele` varchar(2) DEFAULT NULL,
  `Date_Debut` date NOT NULL,
  `Date_Fin` date NOT NULL,
  PRIMARY KEY (`Externe`,`IdMessage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`Externe`, `IdMessage`, `IdTypeMessage`, `Libelle`, `Date_Creation`, `Importance`, `Lien`, `Fournisseur`, `Famille`, `Modele`, `Date_Debut`, `Date_Fin`) VALUES
(0, '000003', 1, 'eclisse', '2022-07-26', 'Faible', 'https://google.com', 'ECLISSE', NULL, NULL, '2022-07-17', '2100-01-01'),
(0, '000004', 1, 'ser pug', '2022-07-26', 'Elevee', '', 'SER-PUG', NULL, NULL, '2022-07-21', '2100-01-01'),
(0, '000002', 1, 'eveno', '2022-07-26', 'Elevee', 'https://google.com', 'BEL\'M  Bois*', NULL, NULL, '2100-01-01', '2100-01-01'),
(0, '000001', 1, 'alupreference', '2022-07-26', 'Moyenne', '', 'ALUPREFERENCE', NULL, NULL, '2100-01-01', '2100-01-01'),
(0, '000010', 1, 'belm', '2022-07-27', 'Elevee', 'https://google.com', 'BREMAUD PE**', NULL, NULL, '2022-07-22', '2100-01-01'),
(0, '000009', 2, 'nouveau type', '2022-07-27', 'Elevee', 'https://google.com', 'ALUPREFERENCE PORTAIL', NULL, NULL, '2022-07-21', '2022-07-29'),
(0, '000008', 1, 'aaaaaaaaaa', '2022-07-26', 'Faible', 'https://google.com', 'ALUPREFERENCE PORTAIL', NULL, NULL, '2022-07-20', '2100-01-01'),
(0, '000007', 1, 'tubauto', '2022-07-26', 'Elevee', 'https://google.com', 'TUBAUTO *', NULL, NULL, '2022-07-21', '2100-01-01'),
(0, '000005', 1, 'copie 0 : eclisse', '2022-07-26', 'Faible', 'https://google.com', 'ECLISSE', NULL, NULL, '2022-07-17', '2100-01-01'),
(0, '000006', 1, 'copie 1 : eclisse', '2022-07-26', 'Faible', 'https://google.com', 'ECLISSE', NULL, NULL, '2022-07-17', '2100-01-01');

-- --------------------------------------------------------

--
-- Structure de la table `message_type`
--

DROP TABLE IF EXISTS `message_type`;
CREATE TABLE IF NOT EXISTS `message_type` (
  `Externe_type` tinyint(1) NOT NULL,
  `IdTypeMessage` int(11) NOT NULL AUTO_INCREMENT,
  `Libelle_type` varchar(50) NOT NULL,
  PRIMARY KEY (`Externe_type`,`IdTypeMessage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `message_type`
--

INSERT INTO `message_type` (`Externe_type`, `IdTypeMessage`, `Libelle_type`) VALUES
(1, 1, 'fournisseur'),
(0, 2, 'NouveauType'),
(0, 3, 'ooooo'),
(0, 4, 'aaaaaaaa'),
(0, 5, 'aaaaaaaa'),
(0, 6, 'okb'),
(0, 7, 'okb'),
(0, 8, 'okb'),
(0, 9, 'non');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `Externe` smallint(6) NOT NULL,
  `IdProduit` int(11) NOT NULL AUTO_INCREMENT,
  `IdTypeProduit` varchar(50) NOT NULL,
  `Libelle` varchar(50) NOT NULL,
  `Reference` varchar(50) NOT NULL,
  `Prix_tarif_HT` float NOT NULL,
  `Prix_achat_HT` float NOT NULL,
  `Prix_vente_HT` float NOT NULL,
  `Stock` int(11) NOT NULL,
  `Code_export` varchar(50) NOT NULL,
  `Date_creation` date NOT NULL,
  `Description` text NOT NULL,
  `Stock_mini` int(11) NOT NULL,
  `contenu` text NOT NULL,
  `taux_TVA` float NOT NULL,
  `image` text NOT NULL,
  `Supprimer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdProduit`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`Externe`, `IdProduit`, `IdTypeProduit`, `Libelle`, `Reference`, `Prix_tarif_HT`, `Prix_achat_HT`, `Prix_vente_HT`, `Stock`, `Code_export`, `Date_creation`, `Description`, `Stock_mini`, `contenu`, `taux_TVA`, `image`, `Supprimer`) VALUES
(0, 5, '000002', 'produit 3', 'p3', 51, 0, 0, 200, '', '2022-11-23', 'ceci est le produit 3', 2, '<PRODUIT><CARACTERISTIQUES><CARACTERISTIQUE><LIBELLE valeur=\"largeur\" /><VALEUR valeur=\"20\" /><UNITE valeur=\"cm2\" /></CARACTERISTIQUE><CARACTERISTIQUE><LIBELLE valeur=\"profondeur\" /><VALEUR valeur=\"30\" /><UNITE valeur=\"cm\" /></CARACTERISTIQUE></CARACTERISTIQUES></PRODUIT>', 20, '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', 1),
(0, 4, '000002', 'produit 2', 'p2', 30, 0, 0, 500, '', '2022-11-22', 'ceci est le produit 2', 2, '<PRODUIT><CARACTERISTIQUES><CARACTERISTIQUE><LIBELLE valeur=\"couleur\" /><VALEUR valeur=\"rouge\" /><UNITE valeur=\"\" /></CARACTERISTIQUE></CARACTERISTIQUES></PRODUIT>', 5.5, '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', 1),
(0, 6, '000002', 'produit 1 ', 'p1', 50.95, 0, 0, 500, '', '2022-11-23', 'ooooooo', 5, '<PRODUIT><CARACTERISTIQUES><CARACTERISTIQUE><LIBELLE valeur=\"largeur\" /><VALEUR valeur=\"20\" /><UNITE valeur=\"cm2\" /></CARACTERISTIQUE><CARACTERISTIQUE><LIBELLE valeur=\"hauteur\" /><VALEUR valeur=\"20\" /><UNITE valeur=\"cm\" /></CARACTERISTIQUE></CARACTERISTIQUES></PRODUIT>', 20, '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `produit_type`
--

DROP TABLE IF EXISTS `produit_type`;
CREATE TABLE IF NOT EXISTS `produit_type` (
  `Externe_type` smallint(6) NOT NULL,
  `IdTypeProduit` varchar(10) NOT NULL,
  `IdParent` varchar(10) NOT NULL,
  `Libelle_type` varchar(50) NOT NULL,
  PRIMARY KEY (`IdTypeProduit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit_type`
--

INSERT INTO `produit_type` (`Externe_type`, `IdTypeProduit`, `IdParent`, `Libelle_type`) VALUES
(0, '000001', '000000', 'cat 1'),
(0, '000002', '000000', 'cat 2'),
(0, '000003', '000000', 'cat 3'),
(0, '000004', '000003', 'c4'),
(0, '000005', '000004', 'cat 5'),
(0, '000006', '000002', 'cat 6'),
(0, '000007', '000005', 'cat 7'),
(0, '000008', '000007', 'cat 8'),
(0, '000009', '000001', 'cat 9'),
(0, '000010', '000003', 'cat9'),
(0, '000011', '000009', 'cat 10');

-- --------------------------------------------------------

--
-- Structure de la table `reglement`
--

DROP TABLE IF EXISTS `reglement`;
CREATE TABLE IF NOT EXISTS `reglement` (
  `IdReglement` int(11) NOT NULL AUTO_INCREMENT,
  `NomReglement` varchar(50) DEFAULT NULL,
  `Supprimer` tinyint(1) NOT NULL,
  PRIMARY KEY (`IdReglement`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reglement`
--

INSERT INTO `reglement` (`IdReglement`, `NomReglement`, `Supprimer`) VALUES
(0, 'Habituel2', 0),
(1, 'ch. à la cde', 0),
(2, 'ch. à la livraison au livreur', 0),
(3, '30 % à la cde, solde à la livraison au livreur', 0),
(4, '30 % à la cde, solde à réception de la facture', 0),
(5, 'à réception de facture', 0),
(6, 'à réception de facture moins 2% d\'escompte', 0),
(7, 'à réception de facture moins 3% d\'escompte', 0),
(8, 'par ch. à 30 J.', 0),
(9, 'par ch. à 60 J.', 0),
(10, 'par LCR à 30 J.', 0),
(11, 'par LCR à 30 J. le 10', 0),
(12, 'par LCR à 60 J.', 0),
(13, 'par LCR à 60 J. le 10', 0),
(14, 'par billet à ordre à 30 J date de facture', 0),
(15, 'par billet à ordre à 60 J date de facture', 0),
(16, 'par retour', 0),
(17, 'Billet à Ordre', 0),
(18, 'L.C.C.', 0),
(19, 'L.C.R.', 0),
(20, 'L.C.R. Acceptée', 0),
(21, '30 % Cde, 40 % Livraison, 30 % Fin Pose', 0),
(22, '30 % Cde, 50 % Livraison, 20 % Fin Pose', 0),
(23, '30 % Cde, 60 % Livraison, 10 % Fin Pose', 0),
(24, 'Acompte 30%, solde à l\'enlévement', 0),
(25, 'à l\'enlévement', 0),
(26, '40 % à la cde, solde à réception de la facture', 0),
(27, '100% cash', 0);

-- --------------------------------------------------------

--
-- Structure de la table `tva`
--

DROP TABLE IF EXISTS `tva`;
CREATE TABLE IF NOT EXISTS `tva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(20) NOT NULL,
  `taux` float NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `tva`
--

INSERT INTO `tva` (`id`, `intitule`, `taux`, `date_debut`, `date_fin`) VALUES
(1, 'corse', 0, '2014-01-01', '2030-01-01'),
(2, 'normale', 20, '2014-01-01', '2030-01-01'),
(3, 'intermediaire', 10, '2014-01-01', '2030-01-01'),
(4, 'reduite', 5.5, '2014-01-01', '2030-01-01');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `login_user` varchar(255) NOT NULL,
  `password_user` varchar(255) NOT NULL,
  `email_user` varchar(255) NOT NULL,
  `validation_user` tinyint(1) NOT NULL,
  `supprimer_utilisateur` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `login_user`, `password_user`, `email_user`, `validation_user`, `supprimer_utilisateur`) VALUES
(1, 'test', '$2y$10$C9/i9G7OmSSyMvQpk3QJi.enx9Nne8u5T3hV7Z5ciJaUOViN6QBA.', 'test@test.fr', 1, 0),
(2, 'harold', '$2y$10$6NJDzO63VVRN90gn1M6fseMMpAAVMbrbw/JjYS4YNQCRBkG3/qmI6', 'dfdssfsfd@gmail.com', 1, 0),
(3, 'test2', '$2y$10$dTp8myl7HctegJv5ymgOd.M.W5sQUh/Ljt8oBUUr1WVbu3jPVr48m', 'test2@test.fr', 1, 0),
(4, 'test3', '$2y$10$SrI6ivF5V6lnzKwL4ddHte.IHNy3nCVoAtMbkyMKPg2rOerh2iKo2', 'test3@test.fr', 1, 1),
(5, 'test4', '$2y$10$pzihpLkugo7eac7TBXK4W.3iesH8Rv2a2tIN8XW.mpY5S3yIhIyKW', 'test4@test.fr', 1, 1),
(6, 'test5', '$2y$10$IFsfl1xWcIfdIu.NNITBb.KdFdb1CqW9dbPA5KxA.kMUHHwbbVUU2', 'test5@test.fr', 1, 1),
(7, 'o', '$2y$10$hIWjAjQaycTifyNDa4cad.7KIgceOXP.DY7yZgquDUYLZwowoHWJe', 'o@o.fr', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_droit`
--

DROP TABLE IF EXISTS `user_droit`;
CREATE TABLE IF NOT EXISTS `user_droit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_droit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user_droit`
--

INSERT INTO `user_droit` (`id`, `id_user`, `id_droit`) VALUES
(1, 2, 1),
(2, 2, 12),
(3, 2, 22),
(4, 2, 23),
(5, 2, 24),
(6, 2, 25),
(7, 2, 26),
(8, 2, 27),
(9, 2, 28),
(10, 2, 29),
(11, 2, 30),
(12, 2, 31),
(13, 2, 32),
(14, 2, 33),
(15, 2, 34),
(64, 1, 46),
(67, 1, 50),
(63, 1, 45),
(65, 1, 32),
(60, 1, 27),
(43, 1, 17),
(44, 1, 21),
(57, 1, 38),
(59, 1, 43),
(49, 1, 3),
(61, 1, 41),
(54, 1, 22),
(55, 1, 36),
(47, 1, 12),
(89, 1, 69),
(50, 1, 35),
(56, 1, 24),
(58, 1, 29),
(66, 1, 26),
(62, 1, 30),
(46, 1, 1),
(68, 1, 25),
(69, 1, 49),
(70, 1, 53),
(71, 1, 61),
(72, 1, 55),
(73, 1, 63),
(74, 1, 52),
(75, 1, 57),
(76, 1, 54),
(77, 1, 59),
(78, 1, 20),
(79, 1, 13),
(80, 1, 15),
(81, 1, 33),
(82, 1, 34),
(83, 1, 23),
(84, 1, 28),
(85, 1, 31),
(86, 1, 66),
(87, 1, 64),
(102, 1, 75),
(90, 1, 68),
(91, 1, 70),
(92, 1, 44),
(99, 1, 72),
(94, 1, 73),
(95, 1, 71),
(96, 1, 76),
(100, 1, 65),
(101, 1, 77),
(103, 1, 80),
(104, 1, 78),
(105, 1, 79),
(106, 1, 83),
(107, 1, 84),
(108, 1, 82),
(121, 1, 94),
(110, 1, 86),
(111, 1, 88),
(120, 1, 93),
(113, 1, 89),
(114, 1, 90),
(115, 1, 18),
(119, 1, 91),
(118, 1, 87),
(122, 1, 96),
(123, 1, 95),
(124, 1, 11),
(125, 1, 97),
(126, 1, 98),
(127, 1, 100),
(128, 1, 101),
(129, 1, 99);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
