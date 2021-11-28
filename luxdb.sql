-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 29-11-2021 a las 00:53:16
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `luxdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambiente`
--

CREATE TABLE `ambiente` (
  `id` int(11) NOT NULL,
  `clasificacionAmbiente` varchar(35) NOT NULL,
  `descripcion` text NOT NULL,
  `volumen` float NOT NULL,
  `inmueble_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ambiente`
--

INSERT INTO `ambiente` (`id`, `clasificacionAmbiente`, `descripcion`, `volumen`, `inmueble_id`) VALUES
(1, 'Climatizado', 'cocina', 15.5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artefacto`
--

CREATE TABLE `artefacto` (
  `id` int(11) NOT NULL,
  `calorResidual` varchar(35) NOT NULL,
  `categoria` varchar(35) NOT NULL,
  `consumo` float NOT NULL,
  `hsUsoDiario` int(11) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `tipoEnergia` varchar(35) NOT NULL,
  `ambiente_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `artefacto`
--

INSERT INTO `artefacto` (`id`, `calorResidual`, `categoria`, `consumo`, `hsUsoDiario`, `nombre`, `tipoEnergia`, `ambiente_id`, `proveedor_id`) VALUES
(1, '15', 'categoria', 564.56, 24, 'Aire Acondicionado', 'Electricidad', 1, 1),
(2, '15', 'categoria', 564.56, 24, 'Aire Acondicionado', 'Electricidad', 1, 1),
(3, '15', 'categoria', 564.56, 24, 'Aire Acondicionado', 'Electricidad', 1, 1),
(4, '15', 'categoria', 564.56, 24, 'Aire Acondicionado', 'Electricidad', 1, 1),
(5, '15', 'categoria', 564.56, 24, 'Aire Acondicionado', 'Electricidad', 1, 1),
(6, '15', 'categoria', 564.56, 24, 'Aire Acondicionado', 'Electricidad', 1, 1),
(7, '15', 'categoria', 564.56, 24, 'Aire Acondicionado', 'Electricidad', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuadrosTarifario`
--

CREATE TABLE `cuadrosTarifario` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `finVigencia` date NOT NULL,
  `inicioVigencia` date NOT NULL,
  `localidad` varchar(35) NOT NULL,
  `proveedor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico`
--

CREATE TABLE `historico` (
  `registroSimulacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmuebles`
--

CREATE TABLE `inmuebles` (
  `id` int(11) NOT NULL,
  `antiguedad` int(11) NOT NULL,
  `habitantes` int(11) NOT NULL,
  `localidad` varchar(35) NOT NULL,
  `serviciosHabilitados` int(11) NOT NULL,
  `tipoAntiguedad` varchar(35) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`id`, `antiguedad`, `habitantes`, `localidad`, `serviciosHabilitados`, `tipoAntiguedad`, `usuario_id`, `nombre`) VALUES
(1, 15, 5, 'ENSENADA', 2, 'REECIENTE', 1, 'casa principal'),
(3, 60, 2, 'LA PLATA', 2, 'ANTIGUA', 1, 'casa papa'),
(4, 15, 5, 'ENSENADA', 2, 'REECIENTE', 1, 'casa vacaciones'),
(5, 10, 5, 'BERISSO', 5, 'NUEVA', 1, 'casa fin de semana'),
(6, 20, 5, 'Buenos Aires', 5, 'REECIENTE', 1, 'dpto'),
(7, 20, 5, 'Buenos Aires', 5, 'REECIENTE', 1, 'dpto'),
(8, 20, 5, 'Buenos Aires', 5, 'REECIENTE', 1, 'dpto'),
(9, 20, 5, 'Buenos Aires', 5, 'REECIENTE', 1, 'dpto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble_has_registroSimulacion`
--

CREATE TABLE `inmueble_has_registroSimulacion` (
  `inmueble_id` int(11) NOT NULL,
  `registroSimulacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `cuit` int(30) NOT NULL,
  `domicilio` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `tipoEnergia` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registroSimulacion`
--

CREATE TABLE `registroSimulacion` (
  `ID` int(11) NOT NULL,
  `artefactosIngresados` varchar(45) NOT NULL,
  `consumoPorArtefacto` float NOT NULL,
  `consumoTotal` float NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_usuarios`
--

CREATE TABLE `registro_usuarios` (
  `id` int(11) NOT NULL,
  `tipoUsuario` varchar(35) NOT NULL,
  `email` varchar(35) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifa`
--

CREATE TABLE `tarifa` (
  `id` int(11) NOT NULL,
  `cargoFijo` float NOT NULL,
  `cargoVariable` float NOT NULL,
  `subCategoria` varchar(35) NOT NULL,
  `tarifaGas_id` int(11) NOT NULL,
  `tarifaElectricidad_id` int(11) NOT NULL,
  `cuadroTarifario_id` int(11) NOT NULL,
  `categoria` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `nombre` varchar(35) DEFAULT NULL,
  `apellido` varchar(35) DEFAULT NULL,
  `rol` int(35) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date NOT NULL DEFAULT current_timestamp(),
  `email` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`nombre`, `apellido`, `rol`, `id`, `created_at`, `updated_at`, `email`) VALUES
('ian', 'Bifano', 1, 1, '2021-11-28', '2021-11-28', ''),
('ian', 'Bifano', 1, 2, '2021-11-28', '2021-11-28', 'iaanbifano@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ambiente`
--
ALTER TABLE `ambiente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inmueble_id` (`inmueble_id`);

--
-- Indices de la tabla `artefacto`
--
ALTER TABLE `artefacto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ambiente_id` (`ambiente_id`),
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `cuadrosTarifario`
--
ALTER TABLE `cuadrosTarifario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `historico`
--
ALTER TABLE `historico`
  ADD KEY `registroSimulacion_id` (`registroSimulacion_id`);

--
-- Indices de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `inmueble_has_registroSimulacion`
--
ALTER TABLE `inmueble_has_registroSimulacion`
  ADD KEY `inmueble_id` (`inmueble_id`),
  ADD KEY `registroSimulacion_id` (`registroSimulacion_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registroSimulacion`
--
ALTER TABLE `registroSimulacion`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `registro_usuarios`
--
ALTER TABLE `registro_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `tarifa`
--
ALTER TABLE `tarifa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cuadroTarifario_id` (`cuadroTarifario_id`),
  ADD KEY `tarifaElectricidad_id` (`tarifaElectricidad_id`),
  ADD KEY `tarifaGas_id` (`tarifaGas_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ambiente`
--
ALTER TABLE `ambiente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `artefacto`
--
ALTER TABLE `artefacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cuadrosTarifario`
--
ALTER TABLE `cuadrosTarifario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registroSimulacion`
--
ALTER TABLE `registroSimulacion`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro_usuarios`
--
ALTER TABLE `registro_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarifa`
--
ALTER TABLE `tarifa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ambiente`
--
ALTER TABLE `ambiente`
  ADD CONSTRAINT `ambiente_ibfk_1` FOREIGN KEY (`inmueble_id`) REFERENCES `inmuebles` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cuadrosTarifario`
--
ALTER TABLE `cuadrosTarifario`
  ADD CONSTRAINT `cuadrosTarifario_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registro_usuarios`
--
ALTER TABLE `registro_usuarios`
  ADD CONSTRAINT `registro_usuarios_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tarifa`
--
ALTER TABLE `tarifa`
  ADD CONSTRAINT `tarifa_ibfk_1` FOREIGN KEY (`cuadroTarifario_id`) REFERENCES `cuadrosTarifario` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
