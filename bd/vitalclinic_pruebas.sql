-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2024 a las 21:50:08
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vitalclinic_pruebas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts`
--

CREATE TABLE `accounts` (
  `id_account` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` enum('1','2') NOT NULL COMMENT '1-Habilitado,2-Inhabilitado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `accounts`
--

INSERT INTO `accounts` (`id_account`, `id_empleado`, `username`, `password`, `role_id`, `status`) VALUES
(5, 133, 'mvblanco', '26532066', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `art` bigint(20) NOT NULL,
  `codigo_profit` text NOT NULL,
  `codigo_barra` text NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `departamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `departamento`) VALUES
(1, 'Almacén'),
(2, 'Depósito'),
(3, 'Devoluciones'),
(4, 'Recepción'),
(5, 'Sistemas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `status` enum('1','2') NOT NULL COMMENT '1-Habilitado, 2-Inhabilitado',
  `departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `cedula`, `nombre`, `apellido`, `status`, `departamento`) VALUES
(9, '30537905', 'RAMIREZ', 'ROSMARVIS', '1', 1),
(10, '25576833', 'FARIAS', 'JOSE', '1', 1),
(11, '30563807', 'MARCANO', 'LOREN', '1', 1),
(12, '15633017', 'SEQUEA', 'ZAYLETT', '1', 1),
(13, '27946909', 'VELASQUEZ', 'ENMANUEL', '1', 1),
(14, '20139224', 'RODRIGUEZ', 'GUSTAVO', '1', 1),
(15, '31511191', 'GARCIA', 'LEONARDO', '1', 1),
(16, '28198149', 'SALGADO', 'JESUS', '1', 1),
(17, '27478807', 'CARMONA', 'JESUS', '1', 1),
(18, '28429561', 'GASPAR', 'MARCELO', '1', 1),
(19, '23534300', 'RODRIGUEZ', 'OMAR', '1', 1),
(20, '25581123', 'RONDON', 'JESUS', '1', 1),
(21, '30982507', 'RONDON', 'MICHELLE', '1', 1),
(22, '26157491', 'CARABALLO', 'ERIKA', '1', 1),
(23, '16517257', 'MARTINEZ', 'ALEXANDER', '1', 1),
(24, '24503943', 'ALCALA', 'DARWIN', '1', 1),
(25, '15903308', 'SALAZAR', 'YORMIS', '1', 1),
(26, '28544551', 'SUBERO', 'ISABELLA', '1', 1),
(27, '28599775', 'MONAGAS', 'DISANNY', '1', 1),
(28, '31303400', 'QUIJADA', 'MARITZABETH', '1', 1),
(29, '27325137', 'CORO', 'ELY SAUL', '1', 1),
(30, '17405013', 'ALVAREZ', 'ALMIRA', '1', 1),
(31, '25431302', 'LIRA', 'ROSIBEL', '1', 1),
(32, '24865739', 'GARCIA', 'JORGE', '1', 1),
(33, '29735524', 'MEDINA', 'ANGEL', '1', 1),
(34, '24511617', 'LOPEZ', 'EDZABETH', '1', 1),
(35, '29843827', 'BARRIOS', 'ROBERTO', '1', 1),
(36, '17708432', 'JARAMILLO', 'ANGELIS', '1', 1),
(37, '26061445', 'MATOS', 'ELIANNY', '1', 1),
(38, '27719813', 'BRITO', 'FELCRIZE', '1', 1),
(39, '25753475', 'RODRIGUEZ', 'DANIEL', '1', 1),
(40, '31625332', 'RAMIREZ', 'VICTOR', '1', 1),
(41, '29914065', 'GONZALEZ', 'MANUEL', '1', 1),
(42, '20312562', 'CABELLO', 'JOSE', '1', 1),
(43, '16516149', 'ALVAREZ', 'JOSE', '1', 1),
(44, '26157804', 'BERMUDEZ', 'YAMIL', '1', 1),
(45, '18825576', 'RODRIGUEZ', 'ALVIN', '1', 1),
(46, '30784517', 'ORTIZ', 'FRANKLIN', '1', 1),
(47, '22966872', 'BOLIVAR', 'ISAIC', '1', 1),
(48, '22714197', 'VILLAHERMOSA', 'ROGER', '1', 1),
(49, '27710312', 'RODRIGUEZ', 'JORGE', '1', 1),
(50, '18236222', 'GONZALEZ', 'LUIS ', '1', 1),
(51, '20140822', 'GUERRA', 'JOSE', '1', 1),
(52, '29735742', 'MEDINA', 'JOSE', '1', 1),
(53, '23534480', 'RODRIGUEZ', 'PEDRO', '1', 1),
(54, '30386615', 'LEON ', 'SEBASTIAN', '1', 1),
(55, '30198536', 'SEQUEA', 'KENYERSON', '1', 1),
(56, '18826648', 'ROJAS', 'JOSE', '1', 1),
(57, '22722906', 'BOLIVAR', 'DENYS', '1', 1),
(58, '23534649', 'PALMA', 'NERIELIS', '1', 1),
(59, '30367839', 'CA?A', 'LUIS', '1', 1),
(60, '21349873', 'TRUJILLO', 'PABLO', '1', 1),
(61, '27946636', 'TRUJILLO', 'SAMUEL', '1', 1),
(62, '24864437', 'ROJAS', 'MARIO', '1', 1),
(63, '25568479', 'ASTUDILLO', 'FIDEL', '1', 1),
(64, '26531656', 'BOLIVAR', 'LUIS', '1', 1),
(65, '30744649', 'LICETT', 'YORDANNY', '1', 1),
(66, '26865440', 'MAESTRE', 'MAYLIS', '1', 1),
(67, '21381040', 'LEZAMA', 'JOSE', '1', 1),
(68, '28608667', 'CASTILLO', 'DEIVIS', '1', 1),
(69, '22618623', 'RIVERO', 'HENDER', '1', 1),
(70, '23818085', 'RAMOS', 'GENESIS', '1', 1),
(71, '26101881', 'LA ROSA', 'RICARDO', '1', 1),
(72, '25428342', 'RIOS', 'ANTHONY', '1', 1),
(73, '25898123', 'BRAVO', 'ELIANY', '1', 1),
(74, '29974595', 'RODRIGUEZ', 'BRYANT', '1', 1),
(75, '31315468', 'LEONETT', 'LEANDRYS', '1', 1),
(76, '26291741', 'VALERA', 'ANDRES', '1', 1),
(77, '26532923', 'ZAMORA', 'JUAN', '1', 1),
(78, '25930478', 'BOUTTO', 'DIEGO', '1', 1),
(79, '30843160', 'DUARTE', 'CARLOS', '1', 1),
(80, '30487691', 'GUERRA', 'HERMES', '1', 1),
(81, '27767449', 'SANZONETTI', 'ROBERT', '1', 1),
(82, '30794761', 'LOPEZ', 'NELSON', '1', 1),
(83, '29642940', 'PEREZ', 'JESUS', '1', 1),
(84, '26212748', 'CHIGUITA', 'ELIEZER', '1', 1),
(85, '16062678', 'VILLARROEL', 'EDGAR', '1', 1),
(86, '19663519', 'MAITA', 'MAITA DANIEL', '1', 1),
(87, '26532072', 'LUNA', 'ANIBAL', '1', 1),
(88, '22722391', 'RODRIGUEZ', 'DENNYS', '1', 1),
(89, '21050078', 'D?ARTHENAY ', 'CARLOS', '1', 1),
(90, '20140012', 'RODRIGUEZ', 'ANTHONY', '1', 1),
(91, '18652530', 'RONDON', 'JESUS', '1', 1),
(92, '30340898', 'HERNANDEZ', 'MIGUEL', '1', 1),
(93, '32051041', 'RODRIGUEZ', 'JORGE', '1', 1),
(94, '16176887', 'MARCANO', 'COLUMBA', '1', 1),
(95, '30274774', 'GIL', 'ADELIANNY', '1', 1),
(96, '16174078', 'CHACON', 'JOSE', '1', 1),
(97, '24864537', 'HERNANDEZ', 'MOISES', '1', 1),
(98, '28216052', 'ANTUAREZ', 'GABRIEL', '1', 1),
(99, '14423623', 'SUAREZ', 'MARIANGELA', '1', 1),
(100, '25909211', 'BOLIVAR', 'YENFRINSO', '1', 1),
(101, '27001065', 'RODRIGUEZ', 'JOEL', '1', 1),
(102, '31649963', 'SALAZAR', 'MANUEL', '1', 1),
(103, '19875984', 'BLANCO', 'ALEJANDRO', '1', 1),
(104, '31532286', 'GUERRA', 'ALFREDO', '1', 1),
(105, '30564549', 'BELISARIO', 'DANIELA', '1', 1),
(106, '25049902', 'SCHOLTZ', 'GERALD', '1', 1),
(107, '29974593', 'BRITO', 'ANGELICA', '1', 1),
(108, '26517350', 'RODRIGUEZ', 'STHEFANI', '1', 1),
(109, '28366574', 'GUZMAN', 'CARELYS', '1', 1),
(110, '20919843', 'COLINA', 'BRYAN', '1', 1),
(111, '31419072', 'CARRABS', 'GERARDO', '1', 1),
(112, '30776375', 'PALACIOS', 'JESUS', '1', 1),
(113, '21123356', 'RAMOS', 'CARLOS', '1', 1),
(114, '31532416', 'SANCLER', 'NICOLE', '1', 1),
(115, '25612658', 'RAMIREZ', 'ROSMARIANT', '1', 1),
(116, '17933428', 'DIAZ', 'NORELIS', '1', 1),
(117, '20918219', 'RODRIGUEZ', 'ANGEL', '1', 1),
(118, '29700203', 'VALLENILLA', 'JOSE', '1', 1),
(119, '21689435', 'HERNANDEZ', 'LEANDRO', '1', 1),
(120, '31733641', 'RAMOS', 'LUIS', '1', 1),
(121, '28274888', 'BASILE ', 'RINO', '1', 1),
(122, '31675876', 'CAMACHO', 'MIGUEL', '1', 1),
(123, '26695018', 'SANTA ROSA ', 'EDINSON', '1', 1),
(124, '27559508', 'IDROGO BRITO', 'ERWIN', '1', 1),
(125, '30117905', 'CONTRERAS', 'FERNANDO', '1', 1),
(126, '12538556', 'HERRERA ', 'ARISTIDES', '1', 1),
(127, '29549086', 'ZARAGOZA', 'JOSE', '1', 1),
(128, '25026142', 'SALAZAR', 'JOSE', '1', 1),
(129, '26650214', 'PEREZ', 'LUIS', '1', 1),
(130, '25282878', 'CEDEÑO', 'CARLOS', '1', 1),
(131, '25452974', 'CORTEZ', 'DANIEL', '1', 1),
(132, '27325306', 'AGUILAR', 'IVAN', '1', 1),
(133, '26532066', 'MANUEL', 'BLANCO', '1', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_existencia_lotes_productos`
--

CREATE TABLE `entrada_existencia_lotes_productos` (
  `id` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_accounts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `errores_fabrica`
--

CREATE TABLE `errores_fabrica` (
  `id` int(11) NOT NULL,
  `id_revision_productos` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `error_no_reportado`
--

CREATE TABLE `error_no_reportado` (
  `id` int(11) NOT NULL,
  `id_revision_productos` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fallas_despachador`
--

CREATE TABLE `fallas_despachador` (
  `id` bigint(20) NOT NULL,
  `despachador` int(11) NOT NULL,
  `id_pedido_d_r_e` bigint(20) NOT NULL,
  `motivo` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotes`
--

CREATE TABLE `lotes` (
  `id` int(11) NOT NULL,
  `descripcion_lote` text NOT NULL,
  `art` bigint(20) NOT NULL,
  `fecha_venc` date NOT NULL,
  `existencia_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas_rechequeadoras`
--

CREATE TABLE `mesas_rechequeadoras` (
  `id` int(11) NOT NULL,
  `num_mesa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `mesas_rechequeadoras`
--

INSERT INTO `mesas_rechequeadoras` (`id`, `num_mesa`) VALUES
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 6),
(8, 7),
(9, 8),
(10, 9),
(11, 10),
(12, 11),
(13, 12),
(14, 13),
(15, 14),
(16, 15),
(17, 16),
(18, 17),
(19, 18),
(20, 19),
(21, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo_fallas`
--

CREATE TABLE `motivo_fallas` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `motivo_fallas`
--

INSERT INTO `motivo_fallas` (`id`, `descripcion`) VALUES
(1, 'Faltante'),
(2, 'Sobrante'),
(3, 'Invertido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pareja_rechequeadores_embaladores`
--

CREATE TABLE `pareja_rechequeadores_embaladores` (
  `id` int(11) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `id_rechequeador` int(11) DEFAULT NULL,
  `id_embalador` int(11) DEFAULT NULL,
  `turno` enum('1','2') NOT NULL COMMENT '1-Mañana,2-Tarde'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pareja_rechequeadores_embaladores`
--

INSERT INTO `pareja_rechequeadores_embaladores` (`id`, `id_mesa`, `id_rechequeador`, `id_embalador`, `turno`) VALUES
(21, 2, NULL, NULL, '1'),
(22, 3, NULL, NULL, '1'),
(23, 4, NULL, NULL, '1'),
(24, 5, NULL, NULL, '1'),
(25, 6, NULL, NULL, '1'),
(26, 7, NULL, NULL, '1'),
(27, 8, NULL, NULL, '1'),
(28, 9, NULL, NULL, '1'),
(29, 10, NULL, NULL, '1'),
(30, 11, NULL, NULL, '1'),
(31, 12, NULL, NULL, '1'),
(32, 13, NULL, NULL, '1'),
(33, 14, NULL, NULL, '1'),
(34, 15, NULL, NULL, '1'),
(35, 16, NULL, NULL, '1'),
(36, 17, NULL, NULL, '1'),
(37, 18, NULL, NULL, '1'),
(38, 19, NULL, NULL, '1'),
(39, 20, NULL, NULL, '1'),
(40, 21, NULL, NULL, '1'),
(41, 2, NULL, NULL, '2'),
(42, 3, NULL, NULL, '2'),
(43, 4, NULL, NULL, '2'),
(44, 5, NULL, NULL, '2'),
(45, 6, NULL, NULL, '2'),
(46, 7, NULL, NULL, '2'),
(47, 8, NULL, NULL, '2'),
(48, 9, NULL, NULL, '2'),
(49, 10, NULL, NULL, '2'),
(50, 11, NULL, NULL, '2'),
(51, 12, NULL, NULL, '2'),
(52, 13, NULL, NULL, '2'),
(53, 14, NULL, NULL, '2'),
(54, 15, NULL, NULL, '2'),
(55, 16, NULL, NULL, '2'),
(56, 17, NULL, NULL, '2'),
(57, 18, NULL, NULL, '2'),
(58, 19, NULL, NULL, '2'),
(59, 20, NULL, NULL, '2'),
(60, 21, NULL, NULL, '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` bigint(20) NOT NULL,
  `numero_pedido` varchar(100) NOT NULL,
  `id_ruta` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `cantidad_unidades` int(11) NOT NULL,
  `distribuidor_pedidos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_d_r_e`
--

CREATE TABLE `pedidos_d_r_e` (
  `id` bigint(20) NOT NULL,
  `id_pedido` bigint(20) NOT NULL,
  `id_despachador` int(11) NOT NULL,
  `id_rechequeador` int(11) DEFAULT NULL,
  `id_embalador` int(11) DEFAULT NULL,
  `fecha_rechequeado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

CREATE TABLE `privilegios` (
  `id` int(11) NOT NULL,
  `accion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `privilegios`
--

INSERT INTO `privilegios` (`id`, `accion`) VALUES
(23, 'asignar_mesa'),
(5, 'consultar_pedido'),
(12, 'eliminar_fallas_pedido'),
(4, 'eliminar_pedido'),
(21, 'modificar_cuenta_sistema'),
(20, 'modificar_empleado'),
(3, 'modificar_pedido'),
(18, 'pedidos_por_despachador'),
(17, 'pedidos_por_fecha'),
(13, 'rechequear'),
(7, 'registar_lote'),
(6, 'registrar_articulo'),
(14, 'registrar_cuenta_sistema'),
(2, 'registrar_empleado'),
(8, 'registrar_entrada_articulo'),
(11, 'registrar_fallas_pedido'),
(1, 'registrar_pedido'),
(15, 'registrar_ruta'),
(9, 'registrar_salida_articulo'),
(10, 'registrar_salida_excepcional_articulos'),
(16, 'visualizar_estadisticas'),
(19, 'visualizar_estadisticas_fallas_despachador'),
(22, 'visualizar_total_pedidos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre_proveedor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revision_mercancia`
--

CREATE TABLE `revision_mercancia` (
  `id` int(11) NOT NULL,
  `numero_factura` text NOT NULL,
  `proveedor` int(11) NOT NULL,
  `tiempo_revision` int(11) NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revision_mercancia_productos`
--

CREATE TABLE `revision_mercancia_productos` (
  `id` int(11) NOT NULL,
  `id_revision` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `lote` text NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revision_responsables`
--

CREATE TABLE `revision_responsables` (
  `id` int(11) NOT NULL,
  `id_revision` int(11) NOT NULL,
  `id_responsable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'Super'),
(2, 'Supervisor de almacen'),
(3, 'Supervisor de inventario'),
(4, 'Rechequeador'),
(5, 'Inventario'),
(6, 'Entrega de pedidos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_privilegios`
--

CREATE TABLE `roles_privilegios` (
  `id` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_privilegio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles_privilegios`
--

INSERT INTO `roles_privilegios` (`id`, `id_role`, `id_privilegio`) VALUES
(1, 3, 14),
(2, 3, 9),
(3, 3, 10),
(4, 3, 7),
(5, 3, 8),
(6, 3, 6),
(7, 5, 6),
(8, 5, 7),
(9, 5, 8),
(10, 5, 9),
(11, 6, 2),
(12, 6, 1),
(13, 6, 3),
(14, 6, 4),
(15, 6, 5),
(16, 4, 13),
(17, 4, 11),
(18, 4, 12),
(19, 2, 14),
(20, 2, 15),
(21, 2, 16),
(22, 2, 17),
(25, 2, 2),
(26, 2, 18),
(27, 2, 19),
(28, 1, 1),
(29, 1, 2),
(30, 1, 3),
(31, 1, 4),
(32, 1, 5),
(33, 1, 6),
(34, 1, 7),
(35, 1, 8),
(36, 1, 9),
(37, 1, 10),
(38, 1, 11),
(39, 1, 12),
(40, 1, 13),
(41, 1, 14),
(42, 1, 15),
(43, 1, 17),
(44, 1, 18),
(45, 1, 19),
(46, 1, 16),
(47, 2, 13),
(48, 1, 20),
(49, 2, 20),
(50, 3, 20),
(51, 6, 20),
(52, 1, 21),
(53, 2, 21),
(54, 3, 21),
(55, 1, 22),
(56, 1, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutas`
--

CREATE TABLE `rutas` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `rutas`
--

INSERT INTO `rutas` (`id`, `name`) VALUES
(1, 'Maturin'),
(2, 'caripito'),
(3, 'sucre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida_excepcional_articulos`
--

CREATE TABLE `salida_excepcional_articulos` (
  `id` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `fecha_salida` datetime NOT NULL,
  `cantidad` int(11) NOT NULL,
  `motivo` text NOT NULL,
  `id_accounts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida_existencia_lotes_productos`
--

CREATE TABLE `salida_existencia_lotes_productos` (
  `id` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `fecha_salida` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_accounts` int(11) NOT NULL,
  `pasillero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id_account`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `role_id` (`role_id`);

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`art`),
  ADD UNIQUE KEY `codigo_profit` (`codigo_profit`) USING HASH,
  ADD UNIQUE KEY `codigo_barra` (`codigo_barra`) USING HASH;

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departamento` (`departamento`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD KEY `departamento` (`departamento`);

--
-- Indices de la tabla `entrada_existencia_lotes_productos`
--
ALTER TABLE `entrada_existencia_lotes_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lote` (`id_lote`),
  ADD KEY `id_accounts` (`id_accounts`);

--
-- Indices de la tabla `errores_fabrica`
--
ALTER TABLE `errores_fabrica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_revision_productos` (`id_revision_productos`),
  ADD KEY `user` (`user`);

--
-- Indices de la tabla `error_no_reportado`
--
ALTER TABLE `error_no_reportado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_revision_productos` (`id_revision_productos`),
  ADD KEY `user` (`user`);

--
-- Indices de la tabla `fallas_despachador`
--
ALTER TABLE `fallas_despachador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `motivo` (`motivo`),
  ADD KEY `id_pedido_d_r_e` (`id_pedido_d_r_e`),
  ADD KEY `despachador` (`despachador`);

--
-- Indices de la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `art` (`art`);

--
-- Indices de la tabla `mesas_rechequeadoras`
--
ALTER TABLE `mesas_rechequeadoras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `num_mesa` (`num_mesa`);

--
-- Indices de la tabla `motivo_fallas`
--
ALTER TABLE `motivo_fallas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pareja_rechequeadores_embaladores`
--
ALTER TABLE `pareja_rechequeadores_embaladores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mesa` (`id_mesa`),
  ADD KEY `id_rechequeador` (`id_rechequeador`),
  ADD KEY `id_embalador` (`id_embalador`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD UNIQUE KEY `numero_pedido` (`numero_pedido`),
  ADD KEY `id_ruta` (`id_ruta`),
  ADD KEY `distribuidor_pedidos` (`distribuidor_pedidos`);

--
-- Indices de la tabla `pedidos_d_r_e`
--
ALTER TABLE `pedidos_d_r_e`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_despachador` (`id_despachador`),
  ADD KEY `id_rechequeador` (`id_rechequeador`),
  ADD KEY `id_embalador` (`id_embalador`);

--
-- Indices de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accion` (`accion`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `revision_mercancia`
--
ALTER TABLE `revision_mercancia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_factura` (`numero_factura`) USING HASH,
  ADD KEY `proveedor` (`proveedor`),
  ADD KEY `user` (`user`);

--
-- Indices de la tabla `revision_mercancia_productos`
--
ALTER TABLE `revision_mercancia_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_revision` (`id_revision`),
  ADD KEY `producto` (`producto`);

--
-- Indices de la tabla `revision_responsables`
--
ALTER TABLE `revision_responsables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_revision` (`id_revision`),
  ADD KEY `id_responsable` (`id_responsable`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_priveilegio` (`id_privilegio`),
  ADD KEY `id_role` (`id_role`);

--
-- Indices de la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salida_excepcional_articulos`
--
ALTER TABLE `salida_excepcional_articulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lote` (`id_lote`),
  ADD KEY `id_accounts` (`id_accounts`);

--
-- Indices de la tabla `salida_existencia_lotes_productos`
--
ALTER TABLE `salida_existencia_lotes_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lote` (`id_lote`),
  ADD KEY `id_accounts` (`id_accounts`),
  ADD KEY `pasillero` (`pasillero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `art` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT de la tabla `entrada_existencia_lotes_productos`
--
ALTER TABLE `entrada_existencia_lotes_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `errores_fabrica`
--
ALTER TABLE `errores_fabrica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `error_no_reportado`
--
ALTER TABLE `error_no_reportado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fallas_despachador`
--
ALTER TABLE `fallas_despachador`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `lotes`
--
ALTER TABLE `lotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesas_rechequeadoras`
--
ALTER TABLE `mesas_rechequeadoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `motivo_fallas`
--
ALTER TABLE `motivo_fallas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pareja_rechequeadores_embaladores`
--
ALTER TABLE `pareja_rechequeadores_embaladores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `pedidos_d_r_e`
--
ALTER TABLE `pedidos_d_r_e`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `revision_mercancia`
--
ALTER TABLE `revision_mercancia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `revision_mercancia_productos`
--
ALTER TABLE `revision_mercancia_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `revision_responsables`
--
ALTER TABLE `revision_responsables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `rutas`
--
ALTER TABLE `rutas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `salida_excepcional_articulos`
--
ALTER TABLE `salida_excepcional_articulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salida_existencia_lotes_productos`
--
ALTER TABLE `salida_existencia_lotes_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`departamento`) REFERENCES `departamento` (`id`);

--
-- Filtros para la tabla `entrada_existencia_lotes_productos`
--
ALTER TABLE `entrada_existencia_lotes_productos`
  ADD CONSTRAINT `entrada_existencia_lotes_productos_ibfk_1` FOREIGN KEY (`id_accounts`) REFERENCES `accounts` (`id_account`),
  ADD CONSTRAINT `entrada_existencia_lotes_productos_ibfk_2` FOREIGN KEY (`id_lote`) REFERENCES `lotes` (`id`);

--
-- Filtros para la tabla `fallas_despachador`
--
ALTER TABLE `fallas_despachador`
  ADD CONSTRAINT `fallas_despachador_ibfk_1` FOREIGN KEY (`motivo`) REFERENCES `motivo_fallas` (`id`),
  ADD CONSTRAINT `fallas_despachador_ibfk_2` FOREIGN KEY (`despachador`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fallas_despachador_ibfk_3` FOREIGN KEY (`id_pedido_d_r_e`) REFERENCES `pedidos_d_r_e` (`id`);

--
-- Filtros para la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD CONSTRAINT `lotes_ibfk_1` FOREIGN KEY (`art`) REFERENCES `articulos` (`art`);

--
-- Filtros para la tabla `pareja_rechequeadores_embaladores`
--
ALTER TABLE `pareja_rechequeadores_embaladores`
  ADD CONSTRAINT `pareja_rechequeadores_embaladores_ibfk_1` FOREIGN KEY (`id_mesa`) REFERENCES `mesas_rechequeadoras` (`id`),
  ADD CONSTRAINT `pareja_rechequeadores_embaladores_ibfk_2` FOREIGN KEY (`id_rechequeador`) REFERENCES `accounts` (`id_account`),
  ADD CONSTRAINT `pareja_rechequeadores_embaladores_ibfk_3` FOREIGN KEY (`id_embalador`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `rutas` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_5` FOREIGN KEY (`distribuidor_pedidos`) REFERENCES `accounts` (`id_account`);

--
-- Filtros para la tabla `pedidos_d_r_e`
--
ALTER TABLE `pedidos_d_r_e`
  ADD CONSTRAINT `pedidos_d_r_e_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `pedidos_d_r_e_ibfk_2` FOREIGN KEY (`id_despachador`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `pedidos_d_r_e_ibfk_3` FOREIGN KEY (`id_rechequeador`) REFERENCES `accounts` (`id_account`),
  ADD CONSTRAINT `pedidos_d_r_e_ibfk_4` FOREIGN KEY (`id_embalador`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  ADD CONSTRAINT `roles_privilegios_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `roles_privilegios_ibfk_2` FOREIGN KEY (`id_privilegio`) REFERENCES `privilegios` (`id`);

--
-- Filtros para la tabla `salida_excepcional_articulos`
--
ALTER TABLE `salida_excepcional_articulos`
  ADD CONSTRAINT `salida_excepcional_articulos_ibfk_1` FOREIGN KEY (`id_lote`) REFERENCES `lotes` (`id`);

--
-- Filtros para la tabla `salida_existencia_lotes_productos`
--
ALTER TABLE `salida_existencia_lotes_productos`
  ADD CONSTRAINT `salida_existencia_lotes_productos_ibfk_1` FOREIGN KEY (`id_accounts`) REFERENCES `accounts` (`id_account`),
  ADD CONSTRAINT `salida_existencia_lotes_productos_ibfk_2` FOREIGN KEY (`id_lote`) REFERENCES `lotes` (`id`),
  ADD CONSTRAINT `salida_existencia_lotes_productos_ibfk_3` FOREIGN KEY (`pasillero`) REFERENCES `empleados` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
