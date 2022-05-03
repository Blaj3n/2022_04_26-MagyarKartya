-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Máj 05. 15:35
-- Kiszolgáló verziója: 10.1.36-MariaDB
-- PHP verzió: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `magyarkartya`
--
CREATE DATABASE IF NOT EXISTS `magyarkartya` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `magyarkartya`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `forma`
--

DROP TABLE IF EXISTS `forma`;
CREATE TABLE IF NOT EXISTS `forma` (
  `formAzon` int(11) NOT NULL AUTO_INCREMENT,
  
  `nev` varchar(200) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`formAzon`),
  UNIQUE KEY `formAzon` (`formAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `forma`:
--

--
-- A tábla adatainak kiíratása `forma`
--

INSERT INTO `forma` (`formAzon`, `nev`) VALUES
(1,  'alsó'),
(2,  'felső'),
(3,  'király'),
(4, 'ász'),
(5,  '7'),
(6,  '8'),
(7,  '9'),
(8,  '10');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kartya`
--

DROP TABLE IF EXISTS `kartya`;
CREATE TABLE IF NOT EXISTS `kartya` (
  `kartyaAzon` int(11) NOT NULL AUTO_INCREMENT,
  `szinAzon` int(11) NOT NULL,
  `formAzon` int(11) NOT NULL,
  PRIMARY KEY (`kartyaAzon`),
  UNIQUE KEY `kartyaAzon` (`kartyaAzon`),
  KEY `formAzon` (`formAzon`),
  KEY `szinAzon` (`szinAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `kartya`:
--   `formAzon`
--       `forma` -> `formAzon`
--   `szinAzon`
--       `szin` -> `szinAzon`
--

--
-- A tábla adatainak kiíratása `kartya`
--



-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szin`
--

DROP TABLE IF EXISTS `szin`;
CREATE TABLE IF NOT EXISTS `szin` (
  `szinAzon` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `kep` varchar(200) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`szinAzon`),
  UNIQUE KEY `szinAzon` (`szinAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `szin`:
--

--
-- A tábla adatainak kiíratása `szin`
--

INSERT INTO `szin` (`szinAzon`, `nev`, `kep`) VALUES
(1, 'tök', 'tok.png'),
(2, 'piros', 'piros.png'),
(3, 'makk', 'makk.png'),
(4, 'zöld', 'zold.png');

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `kartya`
--
ALTER TABLE `kartya`
  ADD CONSTRAINT `kartya_ibfk_1` FOREIGN KEY (`formAzon`) REFERENCES `forma` (`formAzon`),
  ADD CONSTRAINT `kartya_ibfk_2` FOREIGN KEY (`szinAzon`) REFERENCES `szin` (`szinAzon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
