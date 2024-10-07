-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-10-2024 a las 17:44:42
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
-- Base de datos: `vitalclinic`
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
  `status` enum('1','2','','') NOT NULL COMMENT '1-Habilitado,2-Inhabilitado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `accounts`
--

INSERT INTO `accounts` (`id_account`, `id_empleado`, `username`, `password`, `role_id`, `status`) VALUES
(1, 1, 'mvblanco', '26532066', 1, '1'),
(2, 3, 'miguelr', '12345', 4, '1'),
(3, 4, 'flori', '31487', 4, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `art` bigint(20) NOT NULL,
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
(4, 'Recepción');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `status` enum('1','2') NOT NULL COMMENT '1-habilitdo,2-inhabilitado',
  `departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `cedula`, `nombre`, `apellido`, `status`, `departamento`) VALUES
(1, '26532066', 'Manuel', 'Blanco', '1', 0),
(3, '23896869', 'Miguel', 'Rengel', '1', 0),
(4, '26689817', 'Floriana', 'Sucre', '1', 0),
(5, '26532065', 'Jose', 'Miguel', '1', 0),
(6, '28599775', 'Disanny', 'Monagas', '1', 0),
(7, '2555555', 'Luis', 'Gimenez', '1', 0);

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

--
-- Volcado de datos para la tabla `fallas_despachador`
--

INSERT INTO `fallas_despachador` (`id`, `despachador`, `id_pedido_d_r_e`, `motivo`, `descripcion`, `fecha`) VALUES
(2, 4, 3, 1, 'Le falto un acetaminofen', '2024-10-05 17:39:13'),
(5, 3, 41, 2, 'kadkmadkadm', '2024-10-05 17:43:53'),
(6, 4, 45, 1, 'Le sobro dos diclofenac', '2024-10-06 10:50:02'),
(7, 6, 47, 1, 'Le falto 1 amiodarona de land', '2024-10-06 10:50:21'),
(8, 3, 44, 1, 'Le falto 1 atorvastatina', '2024-10-06 10:51:05'),
(9, 3, 44, 1, 'falto una Dexametosa de kmplus', '2024-10-06 11:18:43'),
(10, 3, 53, 1, 'admkadmkad', '2024-10-06 11:46:50'),
(11, 3, 54, 2, 'Trajo un bisolvon demas', '2024-10-06 12:32:36'),
(12, 3, 55, 1, 'Le falto una dexametasona', '2024-10-06 13:59:14'),
(13, 3, 55, 2, 'Trajo un bisolvon demas', '2024-10-06 13:59:29'),
(14, 4, 56, 3, 'Trajo un aceminofen de la sante en vez de calox', '2024-10-06 13:59:47'),
(18, 1, 2, 1, '15151515', '2024-10-06 15:15:40'),
(19, 4, 3, 1, 'ghibhbjhbjb', '2024-10-06 15:16:16'),
(20, 6, 1, 1, 'fassffsfsf', '2024-10-07 10:07:44'),
(21, 3, 4, 2, '8298952898', '2024-10-07 10:08:49'),
(22, 1, 62, 1, 'wsfsfssf', '2024-10-07 10:48:46'),
(23, 1, 62, 2, 'sfsfffsfsf', '2024-10-07 10:48:54'),
(24, 1, 62, 3, 'wfwffw', '2024-10-07 10:49:00'),
(25, 5, 63, 1, 'rwrwrwrr', '2024-10-07 10:49:07'),
(26, 5, 63, 3, 'wrwrwwrwr', '2024-10-07 10:49:13'),
(27, 6, 64, 1, 'wrwrwwrwr', '2024-10-07 10:49:19'),
(28, 6, 64, 2, 'wrwrrwr', '2024-10-07 10:49:25'),
(29, 6, 64, 1, 'wrrwrwrwr', '2024-10-07 10:49:30'),
(30, 6, 64, 1, 'wrwrwrrrwrwrwr', '2024-10-07 10:49:37'),
(31, 6, 64, 2, 'wrwwrrwrwrw', '2024-10-07 10:49:43');

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
-- Estructura de tabla para la tabla `mesa_rechequeadores`
--

CREATE TABLE `mesa_rechequeadores` (
  `id` int(11) NOT NULL,
  `num_mesa` int(11) NOT NULL,
  `id_rechequeador` int(11) NOT NULL,
  `id_embalador` int(11) NOT NULL,
  `horario_almuerzo` varchar(8) NOT NULL,
  `dia_libre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `mesa_rechequeadores`
--

INSERT INTO `mesa_rechequeadores` (`id`, `num_mesa`, `id_rechequeador`, `id_embalador`, `horario_almuerzo`, `dia_libre`) VALUES
(1, 1, 1, 3, '12pm', 'Viernes');

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

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `numero_pedido`, `id_ruta`, `fecha`, `cantidad_unidades`, `distribuidor_pedidos`) VALUES
(5, '123456789', 3, '2024-09-28 14:46:35', 5000, 1),
(14, '1234567', 1, '2024-09-28 10:38:21', 10000, 1),
(15, '12345', 1, '2024-09-28 10:39:17', 10000, 1),
(16, '4545454', 1, '2024-09-28 11:16:11', 10000, 1),
(17, '12334545', 1, '2024-09-28 11:21:34', 2000, 1),
(18, '123456789987', 1, '2024-09-28 13:20:23', 100000, 1),
(19, '123456321', 1, '2024-09-30 12:37:36', 1000, 1),
(20, '1234561234', 1, '2024-09-30 12:40:51', 2000, 1),
(21, '1234569784563', 1, '2024-09-30 12:42:23', 850, 1),
(22, '123456121551', 1, '2024-09-30 12:42:58', 10000, 1),
(23, '123456515151', 1, '2024-09-30 12:43:51', 2021, 1),
(24, '18118', 1, '2024-09-30 12:44:19', 1200, 1),
(25, '215185151515', 1, '2024-09-30 12:47:14', 1200, 1),
(26, '51125151245', 1, '2024-09-30 12:47:41', 1200, 1),
(27, '241442154125', 1, '2024-09-30 12:48:12', 15151, 1),
(28, '1234545', 1, '2024-10-02 16:54:05', 1000, 1),
(29, '1189189515', 2, '2024-10-02 16:54:29', 152111212, 1),
(30, '26532055', 1, '2024-10-03 12:21:37', 10000, 1),
(31, '26532066', 1, '2024-10-03 17:46:37', 5200, 1),
(32, '123321123', 1, '2024-10-03 17:48:11', 100, 1),
(33, '123654', 1, '2024-10-05 17:42:51', 10000, 1),
(34, '256314', 1, '2024-10-06 10:48:32', 10000, 1),
(36, '151851515', 1, '2024-10-06 11:40:12', 51515, 1),
(37, '1230321', 1, '2024-10-06 13:57:45', 1000, 1),
(39, '1230456', 1, '2024-10-07 09:22:03', 1000, 1),
(40, '3210321', 1, '2024-10-07 10:47:56', 1000, 1),
(41, '1230456789', 1, '2024-10-07 11:00:23', 1000, 1),
(42, '1234569870', 1, '2024-10-07 11:01:33', 1000, 1);

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

--
-- Volcado de datos para la tabla `pedidos_d_r_e`
--

INSERT INTO `pedidos_d_r_e` (`id`, `id_pedido`, `id_despachador`, `id_rechequeador`, `id_embalador`, `fecha_rechequeado`) VALUES
(1, 5, 6, 1, 3, '2024-10-03 17:21:04'),
(2, 5, 1, 1, 3, '2024-10-03 17:45:44'),
(3, 5, 4, 3, 3, '2024-09-17 16:05:25'),
(4, 5, 3, 1, 3, '2024-10-03 17:26:50'),
(5, 5, 1, 1, 3, '2024-10-03 17:21:04'),
(6, 14, 1, NULL, NULL, NULL),
(7, 14, 3, NULL, NULL, NULL),
(8, 14, 4, NULL, NULL, NULL),
(9, 15, 1, NULL, NULL, NULL),
(10, 15, 3, NULL, NULL, NULL),
(11, 15, 4, NULL, NULL, NULL),
(12, 16, 1, NULL, NULL, NULL),
(13, 16, 3, NULL, NULL, NULL),
(14, 17, 1, NULL, NULL, NULL),
(15, 17, 3, NULL, NULL, NULL),
(16, 17, 4, NULL, NULL, NULL),
(17, 18, 1, NULL, NULL, NULL),
(18, 18, 3, NULL, NULL, NULL),
(19, 18, 4, NULL, NULL, NULL),
(20, 19, 1, NULL, NULL, NULL),
(21, 20, 1, NULL, NULL, NULL),
(22, 21, 1, NULL, NULL, NULL),
(23, 22, 1, NULL, NULL, NULL),
(24, 23, 1, NULL, NULL, NULL),
(25, 24, 1, NULL, NULL, NULL),
(26, 25, 5, NULL, NULL, NULL),
(27, 26, 5, NULL, NULL, NULL),
(28, 27, 7, NULL, NULL, NULL),
(29, 28, 3, NULL, NULL, NULL),
(30, 29, 4, NULL, NULL, NULL),
(31, 29, 7, NULL, NULL, NULL),
(32, 29, 4, NULL, NULL, NULL),
(33, 29, 3, NULL, NULL, NULL),
(34, 30, 1, 1, 3, '2024-10-03 16:50:49'),
(35, 31, 1, 1, 6, '2024-10-03 17:46:57'),
(36, 31, 3, 1, 5, '2024-10-03 17:47:15'),
(37, 31, 4, 1, 5, '2024-10-03 17:47:15'),
(38, 31, 5, 1, 4, '2024-10-03 17:47:28'),
(39, 31, 6, 1, 6, '2024-10-03 17:46:57'),
(40, 32, 6, 1, 3, '2024-10-03 17:48:21'),
(41, 33, 3, 1, 3, '2024-10-05 17:43:28'),
(42, 33, 7, 1, 3, '2024-10-05 17:43:28'),
(43, 34, 1, 1, 3, '2024-10-06 10:49:24'),
(44, 34, 3, 1, 3, '2024-10-06 10:49:24'),
(45, 34, 4, 1, 3, '2024-10-06 10:49:24'),
(46, 34, 5, 1, 3, '2024-10-06 10:49:24'),
(47, 34, 6, 1, 3, '2024-10-06 10:49:24'),
(52, 36, 1, 3, 4, '2024-10-06 12:19:32'),
(53, 36, 3, 1, 3, '2024-10-06 11:43:48'),
(54, 36, 3, 2, 3, '2024-10-23 12:16:35'),
(55, 37, 3, 1, 3, '2024-10-06 13:58:06'),
(56, 37, 4, 1, 3, '2024-10-06 13:58:06'),
(57, 37, 5, 1, 3, '2024-10-06 13:58:06'),
(62, 39, 1, 1, 1, '2024-10-07 10:48:28'),
(63, 39, 5, 1, 1, '2024-10-07 10:48:28'),
(64, 39, 6, 1, 1, '2024-10-07 10:48:28'),
(65, 40, 3, NULL, NULL, NULL),
(66, 40, 6, NULL, NULL, NULL),
(67, 40, 5, NULL, NULL, NULL),
(68, 41, 1, 1, 3, '2024-10-07 11:00:39'),
(69, 41, 3, 1, 3, '2024-10-07 11:00:39'),
(70, 41, 4, 1, 3, '2024-10-07 11:00:39'),
(71, 42, 1, NULL, NULL, NULL),
(72, 42, 3, 1, 7, '2024-10-07 11:24:13'),
(73, 42, 4, NULL, NULL, NULL);

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
(19, 'visualizar_estadisticas_fallas_despachador');

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
(54, 3, 21);

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
  ADD PRIMARY KEY (`art`);

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
-- Indices de la tabla `mesa_rechequeadores`
--
ALTER TABLE `mesa_rechequeadores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `num_mesa` (`num_mesa`),
  ADD KEY `id_rechequeador` (`id_rechequeador`),
  ADD KEY `id_embalador` (`id_embalador`);

--
-- Indices de la tabla `motivo_fallas`
--
ALTER TABLE `motivo_fallas`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `art` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `entrada_existencia_lotes_productos`
--
ALTER TABLE `entrada_existencia_lotes_productos`
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
-- AUTO_INCREMENT de la tabla `mesa_rechequeadores`
--
ALTER TABLE `mesa_rechequeadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `motivo_fallas`
--
ALTER TABLE `motivo_fallas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `roles_privilegios`
--
ALTER TABLE `roles_privilegios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

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
-- Filtros para la tabla `mesa_rechequeadores`
--
ALTER TABLE `mesa_rechequeadores`
  ADD CONSTRAINT `mesa_rechequeadores_ibfk_1` FOREIGN KEY (`id_embalador`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `mesa_rechequeadores_ibfk_2` FOREIGN KEY (`id_rechequeador`) REFERENCES `accounts` (`id_account`);

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
