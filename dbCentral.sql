-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.32-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para dbcentral
DROP DATABASE IF EXISTS `dbcentral`;
CREATE DATABASE IF NOT EXISTS `dbcentral` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbcentral`;

-- Volcando estructura para tabla dbcentral.agencias
DROP TABLE IF EXISTS `agencias`;
CREATE TABLE IF NOT EXISTS `agencias` (
  `agencia_id` int(11) NOT NULL AUTO_INCREMENT,
  `desc_agencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`agencia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbcentral.agencias: ~140 rows (aproximadamente)
DELETE FROM `agencias`;
/*!40000 ALTER TABLE `agencias` DISABLE KEYS */;
INSERT INTO `agencias` (`agencia_id`, `desc_agencia`) VALUES
	(1, 'AGENCIA #1'),
	(2, 'AGENCIA #2'),
	(3, 'AGENCIA #3'),
	(4, 'AGENCIA #4'),
	(5, 'AGENCIA #5'),
	(6, 'AGENCIA #6'),
	(7, 'AGENCIA #7'),
	(8, 'AGENCIA #8'),
	(9, 'AGENCIA #9'),
	(10, 'AGENCIA #10'),
	(11, 'AGENCIA #11'),
	(12, 'AGENCIA #12'),
	(13, 'AGENCIA #13'),
	(14, 'AGENCIA #14'),
	(15, 'AGENCIA #15'),
	(16, 'AGENCIA #16'),
	(17, 'AGENCIA #17'),
	(18, 'AGENCIA #18'),
	(19, 'AGENCIA #19'),
	(20, 'AGENCIA #20'),
	(21, 'AGENCIA #21'),
	(22, 'AGENCIA #22'),
	(23, 'AGENCIA #23'),
	(24, 'AGENCIA #24'),
	(25, 'AGENCIA #25'),
	(26, 'AGENCIA #26'),
	(27, 'AGENCIA #27'),
	(28, 'AGENCIA #28'),
	(29, 'AGENCIA #29'),
	(30, 'AGENCIA #30'),
	(31, 'AGENCIA #31'),
	(32, 'AGENCIA #32'),
	(33, 'AGENCIA #33'),
	(34, 'AGENCIA #34'),
	(35, 'AGENCIA #35'),
	(36, 'AGENCIA #36'),
	(37, 'AGENCIA #37'),
	(38, 'AGENCIA #38'),
	(39, 'AGENCIA #39'),
	(40, 'AGENCIA #40'),
	(41, 'AGENCIA #41'),
	(42, 'AGENCIA #42'),
	(43, 'AGENCIA #43'),
	(44, 'AGENCIA #44'),
	(45, 'AGENCIA #45'),
	(46, 'AGENCIA #46'),
	(47, 'AGENCIA #47'),
	(48, 'AGENCIA #48'),
	(49, 'AGENCIA #49'),
	(50, 'AGENCIA #50'),
	(51, 'AGENCIA #51'),
	(52, 'AGENCIA #52'),
	(53, 'AGENCIA #53'),
	(54, 'AGENCIA #54'),
	(55, 'AGENCIA #55'),
	(56, 'AGENCIA #56'),
	(57, 'AGENCIA #57'),
	(58, 'AGENCIA #58'),
	(59, 'AGENCIA #59'),
	(60, 'AGENCIA #60'),
	(61, 'AGENCIA #61'),
	(62, 'AGENCIA #62'),
	(63, 'AGENCIA #63'),
	(64, 'AGENCIA #64'),
	(65, 'AGENCIA #65'),
	(66, 'AGENCIA #66'),
	(67, 'AGENCIA #67'),
	(68, 'AGENCIA #68'),
	(69, 'AGENCIA #69'),
	(70, 'AGENCIA #70'),
	(71, 'AGENCIA #71'),
	(72, 'AGENCIA #72'),
	(73, 'AGENCIA #73'),
	(74, 'AGENCIA #74'),
	(75, 'AGENCIA #75'),
	(76, 'AGENCIA #76'),
	(77, 'AGENCIA #77'),
	(78, 'AGENCIA #78'),
	(79, 'AGENCIA #79'),
	(80, 'AGENCIA #80'),
	(81, 'AGENCIA #81'),
	(82, 'AGENCIA #82'),
	(83, 'AGENCIA #83'),
	(84, 'AGENCIA #84'),
	(85, 'AGENCIA #85'),
	(86, 'AGENCIA #86'),
	(87, 'AGENCIA #87'),
	(88, 'AGENCIA #88'),
	(89, 'AGENCIA #89'),
	(90, 'AGENCIA #90'),
	(91, 'AGENCIA #91'),
	(92, 'AGENCIA #92'),
	(93, 'AGENCIA #93'),
	(94, 'AGENCIA #94'),
	(95, 'AGENCIA #95'),
	(96, 'AGENCIA #96'),
	(97, 'AGENCIA #97'),
	(98, 'AGENCIA #98'),
	(99, 'AGENCIA #99'),
	(100, 'AGENCIA #100'),
	(101, 'AGENCIA #101'),
	(102, 'AGENCIA #102'),
	(103, 'AGENCIA #103'),
	(104, 'AGENCIA #104'),
	(105, 'AGENCIA #105'),
	(106, 'AGENCIA #106'),
	(107, 'AGENCIA #107'),
	(108, 'AGENCIA #108'),
	(109, 'AGENCIA #109'),
	(110, 'AGENCIA #110'),
	(111, 'AGENCIA #111'),
	(112, 'AGENCIA #112'),
	(113, 'AGENCIA #113'),
	(114, 'AGENCIA #114'),
	(115, 'AGENCIA #115'),
	(116, 'AGENCIA #116'),
	(117, 'AGENCIA #117'),
	(118, 'AGENCIA #118'),
	(119, 'AGENCIA #119'),
	(120, 'AGENCIA #120'),
	(121, 'AGENCIA #121'),
	(122, 'AGENCIA #122'),
	(123, 'AGENCIA #123'),
	(124, 'AGENCIA #124'),
	(125, 'AGENCIA #125'),
	(126, 'AGENCIA #126'),
	(127, 'AGENCIA #127'),
	(128, 'AGENCIA #128'),
	(129, 'AGENCIA #129'),
	(130, 'AGENCIA #130'),
	(131, 'AGENCIA #131'),
	(132, 'AGENCIA #132'),
	(133, 'AGENCIA #133'),
	(134, 'AGENCIA #134'),
	(135, 'AGENCIA #135'),
	(136, 'AGENCIA #136'),
	(137, 'AGENCIA #137'),
	(138, 'AGENCIA #138'),
	(139, 'AGENCIA #139'),
	(140, 'AGENCIA #140');
/*!40000 ALTER TABLE `agencias` ENABLE KEYS */;

-- Volcando estructura para tabla dbcentral.resumen_facturas
DROP TABLE IF EXISTS `resumen_facturas`;
CREATE TABLE IF NOT EXISTS `resumen_facturas` (
  `fecha` datetime NOT NULL,
  `agencia_id` int(11) DEFAULT NULL,
  `importe` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbcentral.resumen_facturas: ~545,853 rows (aproximadamente)
DELETE FROM `resumen_facturas`;
/*!40000 ALTER TABLE `resumen_facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `resumen_facturas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
