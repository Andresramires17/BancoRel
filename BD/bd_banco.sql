-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-09-2021 a las 02:55:49
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_banco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `PK_CARCodigo` int(11) NOT NULL,
  `CARDescripcion` text NOT NULL,
  `CARSalario` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `PK_EMPCodigo` int(11) NOT NULL,
  `EMPDocumento` varchar(50) NOT NULL,
  `EMPNombre` text NOT NULL,
  `EMPApellido` text NOT NULL,
  `FK_CARCodigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `PK_SUCCodigo` int(11) NOT NULL,
  `SUCNombre` text NOT NULL,
  `SUCCiudad` text NOT NULL,
  `SUCLocalidad` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal-empleado`
--

CREATE TABLE `sucursal-empleado` (
  `PK_SUCEMP` int(11) NOT NULL,
  `FK_SUCCodigo` int(11) NOT NULL,
  `FK_EMPCodigo` int(11) NOT NULL,
  `FechaInicio` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`PK_CARCodigo`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`PK_EMPCodigo`),
  ADD KEY `FK_CARCodigo` (`FK_CARCodigo`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`PK_SUCCodigo`);

--
-- Indices de la tabla `sucursal-empleado`
--
ALTER TABLE `sucursal-empleado`
  ADD PRIMARY KEY (`PK_SUCEMP`),
  ADD KEY `FK_SUCCodigo` (`FK_SUCCodigo`),
  ADD KEY `FK_EMPCodigo` (`FK_EMPCodigo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_CARCodigo` FOREIGN KEY (`FK_CARCodigo`) REFERENCES `cargo` (`PK_CARCodigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sucursal-empleado`
--
ALTER TABLE `sucursal-empleado`
  ADD CONSTRAINT `FK_EMPCodigo` FOREIGN KEY (`FK_EMPCodigo`) REFERENCES `empleado` (`PK_EMPCodigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SUCCodigo` FOREIGN KEY (`FK_SUCCodigo`) REFERENCES `sucursal` (`PK_SUCCodigo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
