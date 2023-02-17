-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 192.168.0.200
-- Létrehozás ideje: 2023. Feb 10. 15:03
-- Kiszolgáló verziója: 10.5.17-MariaDB-log
-- PHP verzió: 8.0.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `s51_db`
--
CREATE DATABASE IF NOT EXISTS `s51_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `s51_db`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `buli`
--

CREATE TABLE `buli` (
  `buli_id` int(11) NOT NULL,
  `buli_helyszin_id` int(11) NOT NULL,
  `buli_datum` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `buli_kep` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `buli_esemeny` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `buli`
--

INSERT INTO `buli` (`buli_id`, `buli_helyszin_id`, `buli_datum`, `buli_kep`, `buli_esemeny`) VALUES
(1, 1, '2022-12-20', '1.jpg', 'Pálinka fesztivál'),
(2, 3, '2022-11-30', '2.jpg', 'Exclusive night show'),
(3, 2, '2023-01-01', '3.jpg', 'Magyar dalok estélye'),
(4, 4, '2022-12-01', '4.jpg', 'Color fesztivál '),
(5, 5, '2022-12-06', '5.jpg', 'Mikulás party');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `helyszin`
--

CREATE TABLE `helyszin` (
  `helyszin_id` int(11) NOT NULL,
  `helyszin_varos` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `helyszin`
--

INSERT INTO `helyszin` (`helyszin_id`, `helyszin_varos`) VALUES
(1, 'Debrecen'),
(2, 'Balmazújváros'),
(3, 'Hajdúszoboszló'),
(4, 'Nyíregyháza'),
(5, 'Berettyóújfalu');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jelentkezes`
--

CREATE TABLE `jelentkezes` (
  `jelentkezes_id` int(11) NOT NULL,
  `jelentkezes_esemeny_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `jelentkezes`
--

INSERT INTO `jelentkezes` (`jelentkezes_id`, `jelentkezes_esemeny_id`) VALUES
(1, 1),
(2, 5),
(3, 4),
(4, 4),
(5, 5),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 2),
(26, 2),
(27, 1),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 1),
(33, 1),
(34, 5),
(35, 4),
(36, 4),
(37, 4),
(38, 5),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(43, 3),
(44, 4),
(45, 1),
(46, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kialitas`
--

CREATE TABLE `kialitas` (
  `id` int(10) NOT NULL,
  `esemenynev` varchar(100) NOT NULL,
  `helyszin_id` int(11) NOT NULL,
  `datum1` date NOT NULL,
  `datum2` date NOT NULL,
  `kep` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `kialitas`
--

INSERT INTO `kialitas` (`id`, `esemenynev`, `helyszin_id`, `datum1`, `datum2`, `kep`) VALUES
(1, 'A Pioneer Cdj átalakulásai', 1, '2023-02-01', '2023-02-05', 'k1.jpg'),
(2, 'Zenei stílusok a kezdettől', 1, '2023-03-15', '2023-03-17', 'k2.jpg'),
(3, ' Zámbó Jimmy Emlékkiállítás ', 1, '2023-04-10', '2023-04-11', 'k3.jpg'),
(4, 'A magyar zeneipar fejlődése', 1, '2023-05-10', '2023-05-15', 'k4.jpg'),
(5, 'Avicii emlékkiállítás', 1, '2023-09-27', '2023-09-28', 'k5.jpg');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `buli`
--
ALTER TABLE `buli`
  ADD PRIMARY KEY (`buli_id`),
  ADD KEY `buli_helyszin_id` (`buli_helyszin_id`);

--
-- A tábla indexei `helyszin`
--
ALTER TABLE `helyszin`
  ADD PRIMARY KEY (`helyszin_id`);

--
-- A tábla indexei `jelentkezes`
--
ALTER TABLE `jelentkezes`
  ADD PRIMARY KEY (`jelentkezes_id`);

--
-- A tábla indexei `kialitas`
--
ALTER TABLE `kialitas`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `buli`
--
ALTER TABLE `buli`
  MODIFY `buli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `helyszin`
--
ALTER TABLE `helyszin`
  MODIFY `helyszin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `jelentkezes`
--
ALTER TABLE `jelentkezes`
  MODIFY `jelentkezes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT a táblához `kialitas`
--
ALTER TABLE `kialitas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `buli`
--
ALTER TABLE `buli`
  ADD CONSTRAINT `buli_ibfk_1` FOREIGN KEY (`buli_helyszin_id`) REFERENCES `helyszin` (`helyszin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
