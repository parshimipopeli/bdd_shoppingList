SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
DROP DATABASE  IF EXISTS `shopping_list`;
CREATE DATABASE IF NOT EXISTS `shopping_list`;
USE `shopping_list`;
--
-- Base de données :  `shopping_list`
--

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `house_number` int(10) NOT NULL,
  `phone_number` TEXT not null,
  `login` varchar(255) not null,
  `password` varchar(255) not null,
    `date_add` datetime DEFAULT NOW() ,
    `date_update` datetime DEFAULT NOW(),
    `date_delete`datetime,
    `activate` boolean default 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Structure de la table 'category'
--


DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
    `id` int(10)  UNSIGNED NOT NULL AUTO_INCREMENT,
    `category_name` varchar(255) NOT NULL,
    `date_add` datetime DEFAULT NOW(),
    `date_update` datetime DEFAULT NOW(),
    `date_delete`datetime,
    `activate` boolean default 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Structure de la table `liste`;
--


DROP TABLE IF EXISTS `liste`;
CREATE TABLE IF NOT EXISTS `liste` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_user` int(10)  UNSIGNED  NOT NULL,
    `date_add` datetime DEFAULT NOW(),
    `date_update` datetime DEFAULT NOW(),
    `date_delete`datetime,
    `activate` boolean default 1,
  PRIMARY KEY (`id`),
    FOREIGN KEY (id_user) REFERENCES users (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Structure de la table articles
--


DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` int(10)  UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
    `prix_article` decimal NOT NULL,
    `date_add` datetime DEFAULT NOW(),
    `date_update` datetime DEFAULT NOW(),
    `date_delete`datetime,
    `activate` boolean default 1,
  PRIMARY KEY (`id`),
    FOREIGN KEY (id_category) REFERENCES category (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Structure de la table listes_articles
--


DROP TABLE IF EXISTS `listes_articles`;
CREATE TABLE IF NOT EXISTS `listes_articles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_article` int(10) UNSIGNED NOT NULL,
  `id_liste`int(10) UNSIGNED NOT NULL,
    `quantites` decimal NOT NULL,
    `date_ajout` datetime NOT NULL,
    `date_add` datetime DEFAULT NOW(),
    `date_update` datetime DEFAULT NOW(),
    `date_delete`datetime,
    `activate` boolean default 1,
  PRIMARY KEY (`id`),
    FOREIGN KEY (id_article) REFERENCES articles (id),
    FOREIGN KEY (id_liste) REFERENCES liste (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






COMMIT;







