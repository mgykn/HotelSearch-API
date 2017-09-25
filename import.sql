-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 25 Eyl 2017, 17:11:30
-- Sunucu sürümü: 5.7.19
-- PHP Sürümü: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `search`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `inventories`
--

DROP TABLE IF EXISTS `inventories`;
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_code` varchar(255) NOT NULL,
  `allotment` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `date` date NOT NULL,
  `discount` int(11) NOT NULL,
  `max_pax` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `inventories`
--

INSERT INTO `inventories` (`id`, `room_code`, `allotment`, `price`, `date`, `discount`, `max_pax`) VALUES
(1, 'STDDBL', '2', 75.00, '2017-11-25', 10, 2),
(2, 'STDDBL', '1', 80.00, '2017-11-26', 0, 2),
(3, 'STDDBL', '1', 50.00, '2017-11-27', 0, 2),
(4, 'STDDBL', '0', 40.00, '2017-11-28', 15, 1),
(5, 'STDSNGL', '1', 40.00, '2017-11-25', 20, 1),
(6, 'STDSNGL', '1', 40.00, '2017-11-26', 0, 1),
(7, 'STDSNGL', '1', 40.00, '2017-11-27', 0, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
