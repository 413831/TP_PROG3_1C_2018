-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2019 a las 02:53:32
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_trabajo_practico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_mesa`
--

CREATE TABLE `estado_mesa` (
  `id` int(11) NOT NULL,
  `estado` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `estado_mesa`
--

INSERT INTO `estado_mesa` (`id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'con cliente esperando pedido', '2019-11-09 19:21:00', '2019-11-09 19:21:00'),
(2, 'con clientes\r\ncomiendo', '2019-11-09 19:24:48', '2019-11-09 19:24:48'),
(3, 'con clientes pagando', '2019-11-09 19:25:03', '2019-11-09 19:25:03'),
(4, 'cerrada', '2019-11-09 19:25:16', '2019-11-09 19:25:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedido`
--

CREATE TABLE `estado_pedido` (
  `id` int(11) NOT NULL,
  `estado` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `estado_pedido`
--

INSERT INTO `estado_pedido` (`id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'en preparacion', '2019-11-09 19:41:26', '2019-11-09 19:41:26'),
(2, 'listo para servir', '2019-11-09 19:41:26', '2019-11-09 19:41:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_producto`
--

CREATE TABLE `estado_producto` (
  `id` int(11) NOT NULL,
  `estado` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `estado_producto`
--

INSERT INTO `estado_producto` (`id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'pendiente', '2019-11-09 19:48:28', '2019-11-09 19:48:28'),
(2, 'en preparacion', '2019-11-09 19:48:28', '2019-11-09 19:48:28'),
(3, 'listo', '2019-11-09 19:48:28', '2019-11-09 19:48:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `codigoMesa` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id`, `estado`, `codigoMesa`, `created_at`, `updated_at`) VALUES
(1, 1, 'A1', '2019-11-09 20:04:43', '2019-12-01 23:49:34'),
(2, 1, 'A2', '2019-11-09 20:04:44', '2019-12-01 23:51:46'),
(3, 1, 'A3', '2019-11-09 20:04:44', '2019-12-01 23:53:11'),
(4, 1, 'A4', '2019-11-09 20:04:44', '2019-12-01 23:55:02'),
(5, 1, 'B1', '2019-11-09 20:04:44', '2019-12-01 23:55:38'),
(6, 1, 'B2', '2019-11-09 20:04:44', '2019-12-02 01:37:41'),
(7, 1, 'B4', '2019-12-01 21:43:24', '2019-12-02 01:44:28'),
(8, 1, 'B3', '2019-12-01 21:43:51', '2019-12-02 01:46:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `estadoPedido` int(11) NOT NULL,
  `imagen` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `tiempo` int(5) NOT NULL,
  `mesa` varchar(11) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `encargado` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `codigo`, `estadoPedido`, `imagen`, `tiempo`, `mesa`, `cliente`, `encargado`, `created_at`, `updated_at`) VALUES
(1, '', 1, '', 60, 'A1', 'ClienteUno', 3, '2019-11-11 01:27:09', '2019-11-11 01:27:09'),
(4, '', 1, '', 30, 'A4', 'ClienteDos', 3, '2019-11-30 22:12:56', '2019-11-30 22:12:56'),
(5, '', 1, './images/pedidoClienteDos.jpeg', 30, 'A4', 'ClienteDos', 3, '2019-11-30 23:20:24', '2019-11-30 23:20:24'),
(6, '', 1, './images/pedidoClienteTres.jpg', 54, 'A1', 'ClienteTres', 3, '2019-12-01 23:05:02', '2019-12-01 23:05:02'),
(7, '', 1, './images/pedidoClienteTres.jpg', 54, 'A1', 'ClienteTres', 3, '2019-12-01 23:05:33', '2019-12-01 23:05:33'),
(8, '', 1, './images/pedidoClienteCuatro.jpg', 45, 'A1', 'ClienteCuatro', 3, '2019-12-01 23:07:18', '2019-12-01 23:07:18'),
(9, '', 1, './images/pedidoClienteCinco.jpg', 45, 'A1', 'ClienteCinco', 3, '2019-12-01 23:09:26', '2019-12-01 23:09:26'),
(10, '', 1, './images/pedidoClienteSeis.jpg', 30, 'A1', 'ClienteSeis', 7, '2019-12-01 23:49:33', '2019-12-01 23:49:33'),
(11, '', 1, './images/pedidoClienteSeis.jpg', 30, 'A2', 'ClienteSeis', 7, '2019-12-01 23:51:45', '2019-12-01 23:51:45'),
(12, '', 1, './images/pedidoClienteSeis.jpg', 30, 'A3', 'ClienteSeis', 7, '2019-12-01 23:53:10', '2019-12-01 23:53:10'),
(13, '', 1, './images/pedidoClienteSeis.jpg', 30, 'A4', 'ClienteSeis', 7, '2019-12-01 23:55:01', '2019-12-01 23:55:01'),
(14, '', 1, './images/pedidoClienteSeis.jpg', 30, 'B1', 'ClienteSeis', 7, '2019-12-01 23:55:37', '2019-12-01 23:55:37'),
(15, '03bfd', 1, './images/pedidoClienteSeis.jpg', 30, 'B2', 'ClienteSeis', 7, '2019-12-02 01:36:27', '2019-12-02 01:36:27'),
(16, '11f60', 1, './images/pedidoClienteSiete.jpg', 25, 'B2', 'ClienteSiete', 11, '2019-12-02 01:37:41', '2019-12-02 01:37:41'),
(17, '26d19', 1, './images/pedidoClienteOcho.jpg', 30, 'B4', 'ClienteOcho', 11, '2019-12-02 01:44:23', '2019-12-02 01:44:23'),
(18, 'fa4d4', 1, './images/pedidoClienteOcho.jpg', 30, 'B3', 'ClienteOcho', 11, '2019-12-02 01:46:00', '2019-12-02 01:46:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_productos`
--

CREATE TABLE `pedidos_productos` (
  `pedido` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `estado_producto` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedidos_productos`
--

INSERT INTO `pedidos_productos` (`pedido`, `producto`, `estado_producto`, `created_at`, `updated_at`) VALUES
(2, 1, 0, '2019-11-11 01:27:29', '2019-11-11 01:27:29'),
(2, 2, 0, '2019-11-11 01:27:29', '2019-11-11 01:27:29'),
(2, 2, 0, '2019-11-11 01:27:30', '2019-11-11 01:27:30'),
(2, 4, 0, '2019-11-11 01:27:30', '2019-11-11 01:27:30'),
(2, 6, 0, '2019-11-11 01:27:30', '2019-11-11 01:27:30'),
(4, 13, 0, '2019-11-30 22:12:57', '2019-11-30 22:12:57'),
(4, 14, 0, '2019-11-30 22:12:57', '2019-11-30 22:12:57'),
(4, 8, 0, '2019-11-30 22:12:57', '2019-11-30 22:12:57'),
(4, 5, 0, '2019-11-30 22:12:57', '2019-11-30 22:12:57'),
(5, 13, 0, '2019-11-30 23:20:24', '2019-11-30 23:20:24'),
(5, 14, 0, '2019-11-30 23:20:24', '2019-11-30 23:20:24'),
(5, 8, 0, '2019-11-30 23:20:24', '2019-11-30 23:20:24'),
(5, 5, 0, '2019-11-30 23:20:24', '2019-11-30 23:20:24'),
(7, 13, 1, '2019-12-01 23:05:33', '2019-12-01 23:05:33'),
(7, 5, 1, '2019-12-01 23:05:34', '2019-12-01 23:05:34'),
(7, 2, 1, '2019-12-01 23:05:34', '2019-12-01 23:05:34'),
(7, 3, 1, '2019-12-01 23:05:34', '2019-12-01 23:05:34'),
(8, 1, 1, '2019-12-01 23:07:18', '2019-12-01 23:07:18'),
(8, 5, 3, '2019-12-01 23:07:18', '2019-12-01 23:07:18'),
(8, 2, 1, '2019-12-01 23:07:19', '2019-12-01 23:07:19'),
(8, 3, 1, '2019-12-01 23:07:19', '2019-12-01 23:07:19'),
(9, 1, 1, '2019-12-01 23:09:26', '2019-12-01 23:09:26'),
(9, 5, 1, '2019-12-01 23:09:26', '2019-12-01 23:09:26'),
(9, 2, 1, '2019-12-01 23:09:26', '2019-12-01 23:09:26'),
(9, 3, 1, '2019-12-01 23:09:27', '2019-12-01 23:09:27'),
(10, 1, 2, '2019-12-01 23:49:33', '2019-12-01 23:49:33'),
(10, 5, 2, '2019-12-01 23:49:34', '2019-12-01 23:49:34'),
(10, 2, 2, '2019-12-01 23:49:34', '2019-12-01 23:49:34'),
(10, 13, 2, '2019-12-01 23:49:34', '2019-12-01 23:49:34'),
(11, 1, 2, '2019-12-01 23:51:45', '2019-12-01 23:51:45'),
(11, 5, 2, '2019-12-01 23:51:45', '2019-12-01 23:51:45'),
(11, 2, 2, '2019-12-01 23:51:45', '2019-12-01 23:51:45'),
(11, 13, 2, '2019-12-01 23:51:45', '2019-12-01 23:51:45'),
(12, 1, 2, '2019-12-01 23:53:10', '2019-12-01 23:53:10'),
(12, 5, 2, '2019-12-01 23:53:11', '2019-12-01 23:53:11'),
(12, 2, 2, '2019-12-01 23:53:11', '2019-12-01 23:53:11'),
(12, 13, 2, '2019-12-01 23:53:11', '2019-12-01 23:53:11'),
(13, 1, 2, '2019-12-01 23:55:01', '2019-12-01 23:55:01'),
(13, 5, 2, '2019-12-01 23:55:02', '2019-12-01 23:55:02'),
(13, 2, 2, '2019-12-01 23:55:02', '2019-12-01 23:55:02'),
(13, 13, 2, '2019-12-01 23:55:02', '2019-12-01 23:55:02'),
(14, 1, 2, '2019-12-01 23:55:37', '2019-12-01 23:55:37'),
(14, 5, 2, '2019-12-01 23:55:37', '2019-12-01 23:55:37'),
(14, 2, 2, '2019-12-01 23:55:37', '2019-12-01 23:55:37'),
(14, 13, 2, '2019-12-01 23:55:37', '2019-12-01 23:55:37'),
(16, 1, 2, '2019-12-02 01:37:41', '2019-12-02 01:37:41'),
(16, 2, 2, '2019-12-02 01:37:41', '2019-12-02 01:37:41'),
(16, 10, 2, '2019-12-02 01:37:41', '2019-12-02 01:37:41'),
(17, 14, 2, '2019-12-02 01:44:23', '2019-12-02 01:44:23'),
(17, 12, 2, '2019-12-02 01:44:25', '2019-12-02 01:44:25'),
(17, 3, 2, '2019-12-02 01:44:26', '2019-12-02 01:44:26'),
(17, 3, 2, '2019-12-02 01:44:26', '2019-12-02 01:44:26'),
(18, 14, 2, '2019-12-02 01:46:00', '2019-12-02 01:46:00'),
(18, 12, 2, '2019-12-02 01:46:00', '2019-12-02 01:46:00'),
(18, 3, 2, '2019-12-02 01:46:01', '2019-12-02 01:46:01'),
(18, 3, 2, '2019-12-02 01:46:01', '2019-12-02 01:46:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` int(5) NOT NULL,
  `tipo` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `descripcion`, `precio`, `tipo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Aquarius', 80, 3, 1, '2019-11-09 19:56:28', '2019-11-09 19:56:28'),
(2, 'Coca-cola', 95, 3, 1, '2019-11-09 19:56:28', '2019-11-09 19:56:28'),
(3, 'Agua mineral', 80, 3, 1, '2019-11-09 19:56:28', '2019-11-09 19:56:28'),
(4, 'Mani', 15, 3, 1, '2019-11-09 19:56:28', '2019-11-09 19:56:28'),
(5, 'Fernet con Coca-cola', 120, 1, 3, '2019-11-09 19:57:27', '2019-12-02 02:37:17'),
(6, 'Cuba libre', 150, 1, 1, '2019-11-09 19:57:27', '2019-11-09 19:57:27'),
(7, 'Satanas', 130, 1, 1, '2019-11-09 19:57:27', '2019-11-09 19:57:27'),
(8, 'Vino chardonnay', 200, 1, 3, '2019-11-09 19:57:27', '2019-12-02 02:28:08'),
(9, 'IPA', 100, 2, 1, '2019-11-09 19:59:38', '2019-11-09 19:59:38'),
(10, 'Honey', 80, 2, 1, '2019-11-09 19:59:38', '2019-11-09 19:59:38'),
(11, 'Stout', 90, 2, 1, '2019-11-09 19:59:38', '2019-11-09 19:59:38'),
(12, 'Amber', 95, 2, 1, '2019-11-09 19:59:38', '2019-11-09 19:59:38'),
(13, 'Milanesas a caballo', 200, 4, 1, '2019-11-09 20:01:33', '2019-11-09 20:01:33'),
(14, 'Risotto al verdeo', 250, 4, 1, '2019-11-09 20:01:33', '2019-11-09 20:01:33'),
(15, 'Pan de carne al ajo', 220, 4, 1, '2019-11-09 20:01:33', '2019-11-09 20:01:33'),
(16, 'Ravioles al pesto', 210, 4, 1, '2019-11-09 20:01:34', '2019-11-09 20:01:34'),
(17, '', 0, 0, 0, '2019-11-09 20:01:34', '2019-11-30 22:04:43'),
(18, 'Scotch', 90, 2, 1, '2019-11-30 21:57:11', '2019-11-30 21:57:11'),
(19, 'Ensalada Caesar', 100, 4, 1, '2019-12-01 23:39:02', '2019-12-01 23:39:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `rol` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`, `created_at`, `updated_at`) VALUES
(1, 'bartender', '2019-11-09 19:18:25', '2019-11-09 19:18:25'),
(2, 'cervecero', '2019-11-09 19:19:00', '2019-11-09 19:19:00'),
(3, 'mozo', '2019-11-09 19:19:10', '2019-11-09 19:19:10'),
(4, 'cocinero', '2019-11-09 19:19:21', '2019-11-09 19:19:21'),
(5, 'socio', '2019-11-09 19:19:36', '2019-11-09 19:19:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `mesa` varchar(3) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `codigo` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `detalle` varchar(400) COLLATE utf8_spanish2_ci NOT NULL,
  `importe` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `mesa`, `cliente`, `codigo`, `detalle`, `importe`, `created_at`, `updated_at`) VALUES
(0, 'B2', 'ClienteSiete', '11f60', 'Aquarius - $ 80 / Coca-cola - $ 95 / Honey - $ 80 / ', 255, '2019-12-02 05:35:13', '2019-12-02 05:35:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `rol` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `clave` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `rol`, `nombre`, `clave`, `created_at`, `updated_at`) VALUES
(1, 5, 'Pepito Gomez', 'elpepedelagente', '2019-11-09 19:52:44', '2019-11-09 19:52:44'),
(2, 4, 'Manuela Pedraza', 'manolita1234', '2019-11-09 19:52:44', '2019-11-09 19:52:44'),
(3, 3, 'Juancito Laprida', 'juanchotin321', '2019-11-09 19:52:44', '2019-11-09 19:52:44'),
(4, 2, 'Gabriel Gabrielo', 'sarasa', '2019-11-09 19:52:44', '2019-11-09 19:52:44'),
(6, 5, 'Mauricio Marcri', 'elgatoconbotas666', '2019-11-09 19:52:44', '2019-11-09 19:52:44'),
(7, 3, 'Eugenio Borcitracio', 'eugenesia1234', '2019-11-10 23:03:01', '2019-11-11 00:12:11'),
(8, 1, 'Pancho Villegas', 'secretisima', '2019-11-10 23:04:38', '2019-11-10 23:04:38'),
(9, 1, 'pepe Villegas', 'secretisima', '2019-11-10 23:06:06', '2019-11-10 23:06:06'),
(11, 3, 'Juana Villegas', 'secretisima', '2019-11-10 23:38:04', '2019-11-10 23:38:04'),
(12, 3, 'Maria Villegas', 'secretisima', '2019-11-10 23:39:37', '2019-11-10 23:39:37'),
(13, 3, 'Josefina Villegas', 'secretisima', '2019-11-10 23:39:57', '2019-11-10 23:39:57'),
(15, 2, 'Natasha Polanski', 'lacontrasenia', '2019-11-30 21:26:40', '2019-11-30 21:26:40'),
(16, 0, '', '', '2019-11-30 21:28:35', '2019-12-02 02:08:07');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado_mesa`
--
ALTER TABLE `estado_mesa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_producto`
--
ALTER TABLE `estado_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado_mesa`
--
ALTER TABLE `estado_mesa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_producto`
--
ALTER TABLE `estado_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
