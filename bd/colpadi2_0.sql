-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-09-2019 a las 04:17:52
-- Versión del servidor: 5.7.23
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `colpadi2.0`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afectado`
--

DROP TABLE IF EXISTS `afectado`;
CREATE TABLE IF NOT EXISTS `afectado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provincia_id` int(11) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `primerApellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `segundoApellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `carnetIdentidad` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_667AD151AED35FCB` (`carnetIdentidad`),
  KEY `IDX_667AD1514E7121AF` (`provincia_id`),
  KEY `IDX_667AD151C604D5C6` (`pais_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cod_categoria_promovente`
--

DROP TABLE IF EXISTS `cod_categoria_promovente`;
CREATE TABLE IF NOT EXISTS `cod_categoria_promovente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B2B6C8DF3A909126` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cod_categoria_promovente`
--

INSERT INTO `cod_categoria_promovente` (`id`, `nombre`) VALUES
(1, 'ANÓNIMO'),
(2, 'COLABORADOR'),
(3, 'FAMILIAR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cod_clasificacion_reclamacion`
--

DROP TABLE IF EXISTS `cod_clasificacion_reclamacion`;
CREATE TABLE IF NOT EXISTS `cod_clasificacion_reclamacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C1571B7B3A909126` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cod_concepto_reclamacion`
--

DROP TABLE IF EXISTS `cod_concepto_reclamacion`;
CREATE TABLE IF NOT EXISTS `cod_concepto_reclamacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_707FFA1D3A909126` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cod_concepto_reclamacion`
--

INSERT INTO `cod_concepto_reclamacion` (`id`, `nombre`) VALUES
(2, 'CUMPLIR MISION'),
(4, 'ESTIPENDIO'),
(1, 'EVALUACION Y DIPLOMA'),
(3, 'FIN DE MISION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cod_conclusion`
--

DROP TABLE IF EXISTS `cod_conclusion`;
CREATE TABLE IF NOT EXISTS `cod_conclusion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3644D3483A909126` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cod_conclusion`
--

INSERT INTO `cod_conclusion` (`id`, `nombre`) VALUES
(4, 'CON LUGAR EN PARTE'),
(6, 'EN VIAS DE SOLUCION'),
(5, 'ORIENTADO'),
(2, 'SIN LUGAR'),
(1, 'SIN RAZON'),
(3, 'SOLUCIONADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cod_conformidad`
--

DROP TABLE IF EXISTS `cod_conformidad`;
CREATE TABLE IF NOT EXISTS `cod_conformidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D0FC39313A909126` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cod_estado_reclamacion`
--

DROP TABLE IF EXISTS `cod_estado_reclamacion`;
CREATE TABLE IF NOT EXISTS `cod_estado_reclamacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DE393D343A909126` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cod_municipio`
--

DROP TABLE IF EXISTS `cod_municipio`;
CREATE TABLE IF NOT EXISTS `cod_municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provincia_id` int(11) DEFAULT NULL,
  `codigo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5608DA5A20332D99` (`codigo`),
  KEY `IDX_5608DA5A4E7121AF` (`provincia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cod_municipio`
--

INSERT INTO `cod_municipio` (`id`, `provincia_id`, `codigo`, `nombre`) VALUES
(1, 1, '2101', 'SANDINO'),
(2, 1, '2102', 'MANTUA'),
(3, 1, '2103', 'MINAS DE MATAHAMBRE'),
(4, 1, '2104', 'VINALES'),
(5, 1, '2105', 'LA PALMA'),
(6, 1, '2106', 'LOS PALACIOS'),
(7, 1, '2107', 'CONSOLACION DEL SUR'),
(8, 1, '2108', 'PINAR DEL RIO'),
(9, 1, '2109', 'SAN LUIS'),
(10, 1, '2110', 'SAN JUAN Y MARTINEZ'),
(11, 1, '2111', 'GUANE'),
(12, 2, '2201', 'BAHIA HONDA'),
(13, 2, '2202', 'MARIEL'),
(14, 2, '2203', 'GUANAJAY'),
(15, 2, '2204', 'CAIMITO'),
(16, 2, '2205', 'BAUTA'),
(17, 2, '2206', 'SAN ANTONIO DE LOS BANOS'),
(18, 2, '2207', 'GUIRA DE MELENA'),
(19, 2, '2208', 'ALQUIZAR'),
(20, 2, '2209', 'ARTEMISA'),
(21, 2, '2210', 'CANDELARIA'),
(22, 2, '2211', 'SAN CRISTOBAL'),
(23, 3, '2301', 'PLAYA'),
(24, 3, '2302', 'PLAZA DE LA REVOLUCION'),
(25, 3, '2303', 'CENTRO HABANA'),
(26, 3, '2304', 'LA HABANA VIEJA'),
(27, 3, '2305', 'REGLA'),
(28, 3, '2306', 'LA HABANA DEL ESTE'),
(29, 3, '2307', 'GUANABACOA'),
(30, 3, '2308', 'SAN MIGUEL DEL PADRON'),
(31, 3, '2309', 'DIEZ DE OCTUBRE'),
(32, 3, '2310', 'CERRO'),
(33, 3, '2311', 'MARIANAO'),
(34, 3, '2312', 'LA LISA'),
(35, 3, '2313', 'BOYEROS'),
(36, 3, '2314', 'ARROYO NARANJO'),
(37, 3, '2315', 'COTORRO'),
(38, 4, '2401', 'BEJUCAL'),
(39, 4, '2402', 'SAN JOSE DE LAS LAJAS'),
(40, 4, '2403', 'JARUCO'),
(41, 4, '2404', 'SANTA CRUZ DEL NORTE'),
(42, 4, '2405', 'MADRUGA'),
(43, 4, '2406', 'NUEVA PAZ'),
(44, 4, '2407', 'SAN NICOLAS'),
(45, 4, '2408', 'GUINES'),
(46, 4, '2409', 'MELENA DEL SUR'),
(47, 4, '2410', 'BATABANO'),
(48, 4, '2411', 'QUIVICAN'),
(49, 5, '2501', 'MATANZAS'),
(50, 5, '2502', 'CARDENAS'),
(51, 5, '2503', 'MARTI'),
(52, 5, '2504', 'COLON'),
(53, 5, '2505', 'PERICO'),
(54, 5, '2506', 'JOVELLANOS'),
(55, 5, '2507', 'PEDRO BETANCOURT'),
(56, 5, '2508', 'LIMONAR'),
(57, 5, '2509', 'UNION DE REYES'),
(58, 5, '2510', 'CIENAGA DE ZAPATA'),
(59, 5, '2511', 'JAGUEY GRANDE'),
(60, 5, '2512', 'CALIMETE'),
(61, 5, '2513', 'LOS ARABOS'),
(62, 6, '2601', 'CORRALILLO'),
(63, 6, '2602', 'QUEMADO DE GUINES'),
(64, 6, '2603', 'SAGUA LA GRANDE'),
(65, 6, '2604', 'ENCRUCIJADA'),
(66, 6, '2605', 'CAMAJUANI'),
(67, 6, '2606', 'CAIBARIEN'),
(68, 6, '2607', 'REMEDIOS'),
(69, 6, '2608', 'PLACETAS'),
(70, 6, '2609', 'SANTA CLARA'),
(71, 6, '2610', 'CIFUENTES'),
(72, 6, '2611', 'SANTO DOMINGO'),
(73, 6, '2612', 'RANCHUELO'),
(74, 6, '2613', 'MANICARAGUA'),
(75, 7, '2701', 'AGUADA DE PASAJEROS'),
(76, 7, '2702', 'RODAS'),
(77, 7, '2703', 'PALMIRA'),
(78, 7, '2704', 'LAJAS'),
(79, 7, '2705', 'CRUCES'),
(80, 7, '2706', 'CUMANAYAGUA'),
(81, 7, '2707', 'CIENFUEGOS'),
(82, 7, '2708', 'ABREUS'),
(83, 8, '2801', 'YAGUAJAY'),
(84, 8, '2802', 'JATIBONICO'),
(85, 8, '2803', 'TAGUASCO'),
(86, 8, '2804', 'CABAIGUAN'),
(87, 8, '2805', 'FOMENTO'),
(88, 8, '2806', 'TRINIDAD'),
(89, 8, '2807', 'SANCTI SPIRITUS'),
(90, 8, '2808', 'LA SIERPE'),
(91, 9, '2901', 'CHAMBAS'),
(92, 9, '2902', 'MORON'),
(93, 9, '2903', 'BOLIVIA'),
(94, 9, '2904', 'PRIMERO DE ENERO'),
(95, 9, '2905', 'CIRO REDONDO'),
(96, 9, '2906', 'FLORENCIA'),
(97, 9, '2907', 'MAJAGUA'),
(98, 9, '2908', 'CIEGO DE AVILA'),
(99, 9, '2909', 'VENEZUELA'),
(100, 9, '2910', 'BARAGUA'),
(101, 10, '3001', 'CARLOS MANUEL DE CESPEDES'),
(102, 10, '3002', 'ESMERALDA'),
(103, 10, '3003', 'SIERRA DE CUBITAS'),
(104, 10, '3004', 'MINAS'),
(105, 10, '3005', 'NUEVITAS'),
(106, 10, '3006', 'GUAIMARO'),
(107, 10, '3007', 'SIBANICU'),
(108, 10, '3008', 'CAMAGUEY'),
(109, 10, '3009', 'FLORIDA'),
(110, 10, '3010', 'VERTIENTES'),
(111, 10, '3011', 'JIMAGUAYU'),
(112, 10, '3012', 'NAJASA'),
(113, 10, '3013', 'SANTA CRUZ DEL SUR'),
(114, 11, '3101', 'MANATI'),
(115, 11, '3102', 'PUERTO PADRE'),
(116, 11, '3103', 'JESUS MENENDEZ'),
(117, 11, '3104', 'MAJIBACOA'),
(118, 11, '3105', 'LAS TUNAS'),
(119, 11, '3106', 'JOBABO'),
(120, 11, '3107', 'COLOMBIA'),
(121, 11, '3108', 'AMANCIO'),
(122, 12, '3201', 'GIBARA'),
(123, 12, '3202', 'RAFAEL FREYRE'),
(124, 12, '3203', 'BANES'),
(125, 12, '3204', 'ANTILLA'),
(126, 12, '3205', 'BAGUANOS'),
(127, 12, '3206', 'HOLGUIN'),
(128, 12, '3207', 'CALIXTO GARCIA'),
(129, 12, '3208', 'CACOCUM'),
(130, 12, '3209', 'URBANO NORIS'),
(131, 12, '3210', 'CUETO'),
(132, 12, '3211', 'MAYARI'),
(133, 12, '3212', 'FRANK PAIS'),
(134, 12, '3213', 'SAGUA DE TANAMO'),
(135, 12, '3214', 'MOA'),
(136, 13, '3301', 'RIO CAUTO'),
(137, 13, '3302', 'CAUTO CRISTO'),
(138, 13, '3303', 'JIGUANI'),
(139, 13, '3304', 'BAYAMO'),
(140, 13, '3305', 'YARA'),
(141, 13, '3306', 'MANZANILLO'),
(142, 13, '3307', 'CAMPECHUELA'),
(143, 13, '3308', 'MEDIA LUNA'),
(144, 13, '3309', 'NIQUERO'),
(145, 13, '3310', 'PILON'),
(146, 13, '3311', 'BARTOLOME MASO'),
(147, 13, '3312', 'BUEY ARRIBA'),
(148, 13, '3313', 'GUISA'),
(149, 14, '3401', 'CONTRAMAESTRE'),
(150, 14, '3402', 'MELLA'),
(151, 14, '3403', 'SAN LUIS'),
(152, 14, '3404', 'SEGUNDO FRENTE'),
(153, 14, '3405', 'SONGO - LA MAYA'),
(154, 14, '3406', 'SANTIAGO DE CUBA'),
(155, 14, '3407', 'PALMA SORIANO'),
(156, 14, '3408', 'TERCER FRENTE'),
(157, 14, '3409', 'GUAMA'),
(158, 15, '3501', 'EL SALVADOR'),
(159, 15, '3502', 'MANUEL TAMES'),
(160, 15, '3503', 'YATERAS'),
(161, 15, '3504', 'BARACOA'),
(162, 15, '3505', 'MAISI'),
(163, 15, '3506', 'IMIAS'),
(164, 15, '3507', 'SAN ANTONIO DEL SUR'),
(165, 15, '3508', 'CAIMANERA'),
(166, 15, '3509', 'GUANTANAMO'),
(167, 15, '3510', 'NICETO PEREZ'),
(168, 16, '4001', 'ISLA DE LA JUVENTUD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cod_pais`
--

DROP TABLE IF EXISTS `cod_pais`;
CREATE TABLE IF NOT EXISTS `cod_pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3087A08820332D99` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cod_pais`
--

INSERT INTO `cod_pais` (`id`, `codigo`, `nombre`) VALUES
(1, 'AF', 'Afganistán'),
(2, 'AX', 'Islas Gland'),
(3, 'AL', 'Albania'),
(4, 'DE', 'Alemania'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antártida'),
(9, 'AG', 'Antigua y Barbuda'),
(10, 'AN', 'Antillas Holandesas'),
(11, 'SA', 'Arabia Saudí'),
(12, 'DZ', 'Argelia'),
(13, 'AR', 'Argentina'),
(14, 'AM', 'Armenia'),
(15, 'AW', 'Aruba'),
(16, 'AU', 'Australia'),
(17, 'AT', 'Austria'),
(18, 'AZ', 'Azerbaiyán'),
(19, 'BS', 'Bahamas'),
(20, 'BH', 'Bahréin'),
(21, 'BD', 'Bangladesh'),
(22, 'BB', 'Barbados'),
(23, 'BY', 'Bielorrusia'),
(24, 'BE', 'Bélgica'),
(25, 'BZ', 'Belice'),
(26, 'BJ', 'Benin'),
(27, 'BM', 'Bermudas'),
(28, 'BT', 'Bhután'),
(29, 'BO', 'Bolivia'),
(30, 'BA', 'Bosnia y Herzegovina'),
(31, 'BW', 'Botsuana'),
(32, 'BV', 'Isla Bouvet'),
(33, 'BR', 'Brasil'),
(34, 'BN', 'Brunéi'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'CV', 'Cabo Verde'),
(39, 'KY', 'Islas Caimán'),
(40, 'KH', 'Camboya'),
(41, 'CM', 'Camerún'),
(42, 'CA', 'Canadá'),
(43, 'CF', 'República Centroafricana'),
(44, 'TD', 'Chad'),
(45, 'CZ', 'República Checa'),
(46, 'CL', 'Chile'),
(47, 'CN', 'China'),
(48, 'CY', 'Chipre'),
(49, 'CX', 'Isla de Navidad'),
(50, 'VA', 'Ciudad del Vaticano'),
(51, 'CC', 'Islas Cocos'),
(52, 'CO', 'Colombia'),
(53, 'KM', 'Comoras'),
(54, 'CD', 'República Democrática del Congo'),
(55, 'CG', 'Congo'),
(56, 'CK', 'Islas Cook'),
(57, 'KP', 'Corea del Norte'),
(58, 'KR', 'Corea del Sur'),
(59, 'CI', 'Costa de Marfil'),
(60, 'CR', 'Costa Rica'),
(61, 'HR', 'Croacia'),
(62, 'CU', 'Cuba'),
(63, 'DK', 'Dinamarca'),
(64, 'DM', 'Dominica'),
(65, 'DO', 'República Dominicana'),
(66, 'EC', 'Ecuador'),
(67, 'EG', 'Egipto'),
(68, 'SV', 'El Salvador'),
(69, 'AE', 'Emiratos Árabes Unidos'),
(70, 'ER', 'Eritrea'),
(71, 'SK', 'Eslovaquia'),
(72, 'SI', 'Eslovenia'),
(73, 'ES', 'España'),
(74, 'UM', 'Islas ultramarinas de Estados Unidos'),
(75, 'US', 'Estados Unidos'),
(76, 'EE', 'Estonia'),
(77, 'ET', 'Etiopía'),
(78, 'FO', 'Islas Feroe'),
(79, 'PH', 'Filipinas'),
(80, 'FI', 'Finlandia'),
(81, 'FJ', 'Fiyi'),
(82, 'FR', 'Francia'),
(83, 'GA', 'Gabón'),
(84, 'GM', 'Gambia'),
(85, 'GE', 'Georgia'),
(86, 'GS', 'Islas Georgias del Sur y Sandwich del Sur'),
(87, 'GH', 'Ghana'),
(88, 'GI', 'Gibraltar'),
(89, 'GD', 'Granada'),
(90, 'GR', 'Grecia'),
(91, 'GL', 'Groenlandia'),
(92, 'GP', 'Guadalupe'),
(93, 'GU', 'Guam'),
(94, 'GT', 'Guatemala'),
(95, 'GF', 'Guayana Francesa'),
(96, 'GN', 'Guinea'),
(97, 'GQ', 'Guinea Ecuatorial'),
(98, 'GW', 'Guinea-Bissau'),
(99, 'GY', 'Guyana'),
(100, 'HT', 'Haití'),
(101, 'HM', 'Islas Heard y McDonald'),
(102, 'HN', 'Honduras'),
(103, 'HK', 'Hong Kong'),
(104, 'HU', 'Hungría'),
(105, 'IN', 'India'),
(106, 'ID', 'Indonesia'),
(107, 'IR', 'Irán'),
(108, 'IQ', 'Iraq'),
(109, 'IE', 'Irlanda'),
(110, 'IS', 'Islandia'),
(111, 'IL', 'Israel'),
(112, 'IT', 'Italia'),
(113, 'JM', 'Jamaica'),
(114, 'JP', 'Japón'),
(115, 'JO', 'Jordania'),
(116, 'KZ', 'Kazajstán'),
(117, 'KE', 'Kenia'),
(118, 'KG', 'Kirguistán'),
(119, 'KI', 'Kiribati'),
(120, 'KW', 'Kuwait'),
(121, 'LA', 'Laos'),
(122, 'LS', 'Lesotho'),
(123, 'LV', 'Letonia'),
(124, 'LB', 'Líbano'),
(125, 'LR', 'Liberia'),
(126, 'LY', 'Libia'),
(127, 'LI', 'Liechtenstein'),
(128, 'LT', 'Lituania'),
(129, 'LU', 'Luxemburgo'),
(130, 'MO', 'Macao'),
(131, 'MK', 'ARY Macedonia'),
(132, 'MG', 'Madagascar'),
(133, 'MY', 'Malasia'),
(134, 'MW', 'Malawi'),
(135, 'MV', 'Maldivas'),
(136, 'ML', 'Malí'),
(137, 'MT', 'Malta'),
(138, 'FK', 'Islas Malvinas'),
(139, 'MP', 'Islas Marianas del Norte'),
(140, 'MA', 'Marruecos'),
(141, 'MH', 'Islas Marshall'),
(142, 'MQ', 'Martinica'),
(143, 'MU', 'Mauricio'),
(144, 'MR', 'Mauritania'),
(145, 'YT', 'Mayotte'),
(146, 'MX', 'México'),
(147, 'FM', 'Micronesia'),
(148, 'MD', 'Moldavia'),
(149, 'MC', 'Mónaco'),
(150, 'MN', 'Mongolia'),
(151, 'MS', 'Montserrat'),
(152, 'MZ', 'Mozambique'),
(153, 'MM', 'Myanmar'),
(154, 'NA', 'Namibia'),
(155, 'NR', 'Nauru'),
(156, 'NP', 'Nepal'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Níger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Isla Norfolk'),
(162, 'NO', 'Noruega'),
(163, 'NC', 'Nueva Caledonia'),
(164, 'NZ', 'Nueva Zelanda'),
(165, 'OM', 'Omán'),
(166, 'NL', 'Países Bajos'),
(167, 'PK', 'Pakistán'),
(168, 'PW', 'Palau'),
(169, 'PS', 'Palestina'),
(170, 'PA', 'Panamá'),
(171, 'PG', 'Papúa Nueva Guinea'),
(172, 'PY', 'Paraguay'),
(173, 'PE', 'Perú'),
(174, 'PN', 'Islas Pitcairn'),
(175, 'PF', 'Polinesia Francesa'),
(176, 'PL', 'Polonia'),
(177, 'PT', 'Portugal'),
(178, 'PR', 'Puerto Rico'),
(179, 'QA', 'Qatar'),
(180, 'GB', 'Reino Unido'),
(181, 'RE', 'Reunión'),
(182, 'RW', 'Ruanda'),
(183, 'RO', 'Rumania'),
(184, 'RU', 'Rusia'),
(185, 'EH', 'Sahara Occidental'),
(186, 'SB', 'Islas Salomón'),
(187, 'WS', 'Samoa'),
(188, 'AS', 'Samoa Americana'),
(189, 'KN', 'San Cristóbal y Nevis'),
(190, 'SM', 'San Marino'),
(191, 'PM', 'San Pedro y Miquelón'),
(192, 'VC', 'San Vicente y las Granadinas'),
(193, 'SH', 'Santa Helena'),
(194, 'LC', 'Santa Lucía'),
(195, 'ST', 'Santo Tomé y Príncipe'),
(196, 'SN', 'Senegal'),
(197, 'CS', 'Serbia y Montenegro'),
(198, 'SC', 'Seychelles'),
(199, 'SL', 'Sierra Leona'),
(200, 'SG', 'Singapur'),
(201, 'SY', 'Siria'),
(202, 'SO', 'Somalia'),
(203, 'LK', 'Sri Lanka'),
(204, 'SZ', 'Suazilandia'),
(205, 'ZA', 'Sudáfrica'),
(206, 'SD', 'Sudán'),
(207, 'SE', 'Suecia'),
(208, 'CH', 'Suiza'),
(209, 'SR', 'Surinam'),
(210, 'SJ', 'Svalbard y Jan Mayen'),
(211, 'TH', 'Tailandia'),
(212, 'TW', 'Taiwán'),
(213, 'TZ', 'Tanzania'),
(214, 'TJ', 'Tayikistán'),
(215, 'IO', 'Territorio Británico del Océano Índico'),
(216, 'TF', 'Territorios Australes Franceses'),
(217, 'TL', 'Timor Oriental'),
(218, 'TG', 'Togo'),
(219, 'TK', 'Tokelau'),
(220, 'TO', 'Tonga'),
(221, 'TT', 'Trinidad y Tobago'),
(222, 'TN', 'Túnez'),
(223, 'TC', 'Islas Turcas y Caicos'),
(224, 'TM', 'Turkmenistán'),
(225, 'TR', 'Turquía'),
(226, 'TV', 'Tuvalu'),
(227, 'UA', 'Ucrania'),
(228, 'UG', 'Uganda'),
(229, 'UY', 'Uruguay'),
(230, 'UZ', 'Uzbekistán'),
(231, 'VU', 'Vanuatu'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Islas Vírgenes Británicas'),
(235, 'VI', 'Islas Vírgenes de los Estados Unidos'),
(236, 'WF', 'Wallis y Futuna'),
(237, 'YE', 'Yemen'),
(238, 'DJ', 'Yibuti'),
(239, 'ZM', 'Zambia'),
(240, 'ZW', 'Zimbabue');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cod_procedencia`
--

DROP TABLE IF EXISTS `cod_procedencia`;
CREATE TABLE IF NOT EXISTS `cod_procedencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B872E363A909126` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cod_provincia`
--

DROP TABLE IF EXISTS `cod_provincia`;
CREATE TABLE IF NOT EXISTS `cod_provincia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7B0ADDA920332D99` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cod_provincia`
--

INSERT INTO `cod_provincia` (`id`, `codigo`, `nombre`) VALUES
(1, '21', 'PINAR DEL RIO'),
(2, '22', 'ARTEMISA'),
(3, '23', 'LA HABANA'),
(4, '24', 'MAYABEQUE'),
(5, '25', 'MATANZAS'),
(6, '26', 'VILLA CLARA'),
(7, '27', 'CIENFUEGOS'),
(8, '28', 'SANCTI SPIRITUS'),
(9, '29', 'CIEGO DE AVILA'),
(10, '30', 'CAMAGUEY'),
(11, '31', 'LAS TUNAS'),
(12, '32', 'HOLGUIN'),
(13, '33', 'GRANMA'),
(14, '34', 'SANTIAGO DE CUBA'),
(15, '35', 'GUANTANAMO'),
(16, '4001', 'ISLA DE LA JUVENTUD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cod_reclamacion_lugar`
--

DROP TABLE IF EXISTS `cod_reclamacion_lugar`;
CREATE TABLE IF NOT EXISTS `cod_reclamacion_lugar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_72F8427D3A909126` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cod_reclamacion_lugar`
--

INSERT INTO `cod_reclamacion_lugar` (`id`, `nombre`) VALUES
(2, 'DPTO BRASIL'),
(5, 'DPTO COLABORACION GRANMA'),
(1, 'DPTO COOPERACION INTERNACIONAL'),
(6, 'DPTO PROCESOS MIGRATORIOS'),
(4, 'SUBDIRECCION ECONOMICA'),
(3, 'VENEZUELA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_acceso`
--

DROP TABLE IF EXISTS `nivel_acceso`;
CREATE TABLE IF NOT EXISTS `nivel_acceso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8DFF1AE2AAFC20CB` (`nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `nivel_acceso`
--

INSERT INTO `nivel_acceso` (`id`, `nivel`) VALUES
(4, 'Completo'),
(1, 'Internacional'),
(2, 'Nacional'),
(3, 'Provincial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promovente`
--

DROP TABLE IF EXISTS `promovente`;
CREATE TABLE IF NOT EXISTS `promovente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `municipio_id` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `primerApellido` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `segundoApellido` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carnetIdentidad` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fonNombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fonPrimerApellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fonSegundoApellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9F36F95158BC1BE0` (`municipio_id`),
  KEY `IDX_9F36F9513397707A` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamacion`
--

DROP TABLE IF EXISTS `reclamacion`;
CREATE TABLE IF NOT EXISTS `reclamacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clasificacion_id` int(11) DEFAULT NULL,
  `provincia_ocurrencia_id` int(11) DEFAULT NULL,
  `procedencia_id` int(11) DEFAULT NULL,
  `conclusion_id` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `conformidad_id` int(11) DEFAULT NULL,
  `promovente_id` int(11) DEFAULT NULL,
  `afectado_id` int(11) DEFAULT NULL,
  `fechaEntrada` datetime NOT NULL,
  `fechaRespuesta` datetime DEFAULT NULL,
  `asunto` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3AE0B221FB4E45` (`promovente_id`),
  UNIQUE KEY `UNIQ_3AE0B2223CCEDAD` (`afectado_id`),
  KEY `IDX_3AE0B2278ECAC4A` (`clasificacion_id`),
  KEY `IDX_3AE0B2246E99B3B` (`provincia_ocurrencia_id`),
  KEY `IDX_3AE0B22797627A` (`procedencia_id`),
  KEY `IDX_3AE0B222BFE04C8` (`conclusion_id`),
  KEY `IDX_3AE0B229F5A440B` (`estado_id`),
  KEY `IDX_3AE0B22C08C5806` (`conformidad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamacion_unidad`
--

DROP TABLE IF EXISTS `reclamacion_unidad`;
CREATE TABLE IF NOT EXISTS `reclamacion_unidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concepto_id` int(11) DEFAULT NULL,
  `lugar_id` int(11) DEFAULT NULL,
  `reclamacion_id` int(11) DEFAULT NULL,
  `fechaEntrada` datetime DEFAULT NULL,
  `fechaRespuesta` datetime DEFAULT NULL,
  `gestion` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_E59261C36C2330BD` (`concepto_id`),
  KEY `IDX_E59261C3B5A3803B` (`lugar_id`),
  KEY `IDX_E59261C38F120099` (`reclamacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_57698A6A3A909126` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `nombre`) VALUES
(3, 'ROLE_ADMINISTRADOR'),
(2, 'ROLE_EDITOR'),
(4, 'ROLE_SUPERUSUARIO'),
(1, 'ROLE_VISUALIZADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `municipio_id` int(11) DEFAULT NULL,
  `nivel_acceso_id` int(11) DEFAULT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `primerApellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `segundoApellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2265B05DF85E0677` (`username`),
  KEY `IDX_2265B05D58BC1BE0` (`municipio_id`),
  KEY `IDX_2265B05D5108D425` (`nivel_acceso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `municipio_id`, `nivel_acceso_id`, `username`, `password`, `nombre`, `primerApellido`, `segundoApellido`, `email`, `isActive`) VALUES
(1, 32, 4, 'system', '$2y$12$xUs.6Tq/1Pt.gvtHaw.io.oF5qkcPR5YcCODvQynZb7uPZ3CVBET.', 'Yadrian', 'Esteris', 'Guevara', 'yesteris@infomed.sld.cu', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_role`
--

DROP TABLE IF EXISTS `usuario_role`;
CREATE TABLE IF NOT EXISTS `usuario_role` (
  `usuario_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`usuario_id`,`role_id`),
  KEY `IDX_3E13F07ADB38439E` (`usuario_id`),
  KEY `IDX_3E13F07AD60322AC` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario_role`
--

INSERT INTO `usuario_role` (`usuario_id`, `role_id`) VALUES
(1, 4);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `afectado`
--
ALTER TABLE `afectado`
  ADD CONSTRAINT `FK_667AD1514E7121AF` FOREIGN KEY (`provincia_id`) REFERENCES `cod_provincia` (`id`),
  ADD CONSTRAINT `FK_667AD151C604D5C6` FOREIGN KEY (`pais_id`) REFERENCES `cod_pais` (`id`);

--
-- Filtros para la tabla `cod_municipio`
--
ALTER TABLE `cod_municipio`
  ADD CONSTRAINT `FK_5608DA5A4E7121AF` FOREIGN KEY (`provincia_id`) REFERENCES `cod_provincia` (`id`);

--
-- Filtros para la tabla `promovente`
--
ALTER TABLE `promovente`
  ADD CONSTRAINT `FK_9F36F9513397707A` FOREIGN KEY (`categoria_id`) REFERENCES `cod_categoria_promovente` (`id`),
  ADD CONSTRAINT `FK_9F36F95158BC1BE0` FOREIGN KEY (`municipio_id`) REFERENCES `cod_municipio` (`id`);

--
-- Filtros para la tabla `reclamacion`
--
ALTER TABLE `reclamacion`
  ADD CONSTRAINT `FK_3AE0B221FB4E45` FOREIGN KEY (`promovente_id`) REFERENCES `promovente` (`id`),
  ADD CONSTRAINT `FK_3AE0B2223CCEDAD` FOREIGN KEY (`afectado_id`) REFERENCES `afectado` (`id`),
  ADD CONSTRAINT `FK_3AE0B222BFE04C8` FOREIGN KEY (`conclusion_id`) REFERENCES `cod_conclusion` (`id`),
  ADD CONSTRAINT `FK_3AE0B2246E99B3B` FOREIGN KEY (`provincia_ocurrencia_id`) REFERENCES `cod_provincia` (`id`),
  ADD CONSTRAINT `FK_3AE0B2278ECAC4A` FOREIGN KEY (`clasificacion_id`) REFERENCES `cod_clasificacion_reclamacion` (`id`),
  ADD CONSTRAINT `FK_3AE0B22797627A` FOREIGN KEY (`procedencia_id`) REFERENCES `cod_procedencia` (`id`),
  ADD CONSTRAINT `FK_3AE0B229F5A440B` FOREIGN KEY (`estado_id`) REFERENCES `cod_estado_reclamacion` (`id`),
  ADD CONSTRAINT `FK_3AE0B22C08C5806` FOREIGN KEY (`conformidad_id`) REFERENCES `cod_conformidad` (`id`);

--
-- Filtros para la tabla `reclamacion_unidad`
--
ALTER TABLE `reclamacion_unidad`
  ADD CONSTRAINT `FK_E59261C36C2330BD` FOREIGN KEY (`concepto_id`) REFERENCES `cod_concepto_reclamacion` (`id`),
  ADD CONSTRAINT `FK_E59261C38F120099` FOREIGN KEY (`reclamacion_id`) REFERENCES `reclamacion` (`id`),
  ADD CONSTRAINT `FK_E59261C3B5A3803B` FOREIGN KEY (`lugar_id`) REFERENCES `cod_reclamacion_lugar` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_2265B05D5108D425` FOREIGN KEY (`nivel_acceso_id`) REFERENCES `nivel_acceso` (`id`),
  ADD CONSTRAINT `FK_2265B05D58BC1BE0` FOREIGN KEY (`municipio_id`) REFERENCES `cod_municipio` (`id`);

--
-- Filtros para la tabla `usuario_role`
--
ALTER TABLE `usuario_role`
  ADD CONSTRAINT `FK_3E13F07AD60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `FK_3E13F07ADB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
