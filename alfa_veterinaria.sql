-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-09-2024 a las 05:29:45
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alfa_veterinaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id_admin` int(20) NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Apellido_p` varchar(25) DEFAULT NULL,
  `Apellido_m` varchar(25) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  `Contraseña` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id_admin`, `Nombre`, `Apellido_p`, `Apellido_m`, `Correo`, `Contraseña`) VALUES
(99, 'ALEJANDRA', 'ORTEGA', 'SANCHEZ', 'zaid@gmail.com', '12345'),
(123, 'Zaid', 'Orozco', 'Sanchez', 'zaid@gmail.com', '12345'),
(3456, 'ANTONIO', 'GOMEZ', 'MARQUEZ', 'anto@gmail.com', '12345'),
(6565, 'ALANSITO', 'PEREZ', 'RUIZ', 'alan@gmail.com', '12345'),
(9478, 'DIANA', 'GOMEZ', 'SANCHEZ', 'pao@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico`
--

CREATE TABLE `diagnostico` (
  `Num_diagnostico` int(10) NOT NULL,
  `P_codigo` int(10) NOT NULL,
  `id_dueño` int(10) NOT NULL,
  `id_medico` int(10) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Padecimiento` varchar(100) DEFAULT NULL,
  `Sintomas` varchar(100) DEFAULT NULL,
  `Comentarios` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `diagnostico`
--

INSERT INTO `diagnostico` (`Num_diagnostico`, `P_codigo`, `id_dueño`, `id_medico`, `Fecha`, `Padecimiento`, `Sintomas`, `Comentarios`) VALUES
(4545, 9589, 45675, 8689, '2024-09-12', 'coma', 'agotamiento, dolor, sangrado', 'Ninguno'),
(8585, 9, 899025, 8689, '2024-09-12', 'cancer', 'agotamiento, dolor, sangrado', 'ninguno'),
(34556, 45353, 899025, 3221, '2024-09-11', 'cancer', 'agotamiento, dolor, sangrado', 'ninguno'),
(57087, 45353, 899025, 3221, '2024-09-12', 'coma', 'Escurrimiento nazal, ojos llorosos, espasmos.', 'Ninguno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dueños`
--

CREATE TABLE `dueños` (
  `id_dueño` int(10) NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Apellido_p` varchar(25) DEFAULT NULL,
  `Apellido_m` varchar(25) DEFAULT NULL,
  `Num_cuenta` bigint(100) DEFAULT NULL,
  `Direccion` varchar(60) DEFAULT NULL,
  `Telefono` bigint(15) DEFAULT NULL,
  `Correo` varchar(40) DEFAULT NULL,
  `Codigo_postal` int(10) DEFAULT NULL,
  `RFC` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dueños`
--

INSERT INTO `dueños` (`id_dueño`, `Nombre`, `Apellido_p`, `Apellido_m`, `Num_cuenta`, `Direccion`, `Telefono`, `Correo`, `Codigo_postal`, `RFC`) VALUES
(12, 'ARMANDO', 'MORENO', 'AGUIRRE', 8758495878498594, 'RIBERA LAS FLECHAS', 9611788662, 'armando@gmail.com', 29163, 'FJFJ958NFJ85I'),
(568, 'ANTO', 'MORENO', 'ROJAS', 9223372036855555, 'RIBERA EL AMATAL', 9611999999, 'anto@gmail.com', 29168, 'HSCJD097H5555'),
(6545, 'XIMENA', 'MORENO', 'POSADA', 5555555555555555, 'RIBERA LAS FLECHAS', 9611788663, 'xime@gmail.com', 29170, 'FJFJJ78FJRU8R'),
(8598, 'GERARDO', 'MARTINEZ', 'LOPEZ', 9999999999999999, 'RIBERA LAS FLECHAS', 9611788663, 'gera@gmail.com', 29178, 'JDYD8475JF764'),
(9584, 'PAOLA', 'MORENO', 'AGUIRRE', 4859485948548848, 'RIBERA LAS FLECHAS', 9612567384, 'diana@gmail.com', 29178, 'DJJFJ8475FJFK'),
(9879, 'PAOLA', 'PEREZ', 'RAMIREZ', 9223372036854775807, 'RIBERA LAS FLECHAS', 9612567384, 'pao@gmail.com', 29160, 'PAOSJD975NFJ8'),
(45675, 'HORACIO', 'OROZCO', 'PEREZ', 467654, 'RIBERA LAS FLECHAS', 9611788663, 'lacho@gmail.com', 29178, 'EDU857HR'),
(85904, 'ANTONIO', 'OROZCO', 'AGUIRRE', 9223372036854775807, 'RIBERA EL AMATAL', 9611788663, 'antonito@gmail.com', 29160, 'HSJDIRUT875J4'),
(95894, 'ANTONIO', 'OROZCO', 'POSADA', 2147483647, 'RIBERA LAS FLECHAS', 9611788663, 'antoni@gmail.com', 29160, 'HDKSURHTI9873'),
(498504, 'AZENETH', 'AGUIRRE', 'ESPONDA', 9223372036854775807, 'RIBERA EL AMATAL', 9611788663, 'azeneth@gmail.com', 29170, 'HF875NNUF8U5J'),
(899025, 'Alejandra', 'Orozco', 'posada', 2147483647, 'Ribera las flechas', 9611045000, 'ale@gmail.com', 29160, 'oosahhcjste3'),
(984738, 'HORAcio', 'orozco', 'perez', 4567654, 'Ribera las flechas', 9611788663, 'hora@gmail.com', 29178, 'hora987fjd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `id_medico` int(10) NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Apellido_p` varchar(25) DEFAULT NULL,
  `Apellido_m` varchar(25) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  `Telefono` bigint(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`id_medico`, `Nombre`, `Apellido_p`, `Apellido_m`, `Correo`, `Telefono`) VALUES
(987, 'MANUELANGAS', 'GOMEZ', 'GOMEZ', 'manu@gmail.com', 9611788663),
(3221, 'Angel', 'orozco', 'sanchez', 'gael@gmail.com', 9611896543),
(5955, 'MIGUELITO', 'MENDEZ', 'JIMENEZ', 'migue@gmail.com', 9611784748),
(8689, 'Alejandra', 'orozco', 'sanchez', 'zaid@gmail.com', 9611788663),
(56765, 'ALAN', 'SANCHEZ', 'OROZCO', 'alan@gmail.com', 9611788663),
(95785, 'PAOLA', 'PEREZ', 'GOMEZ', 'pao@gmail.com', 9611788662),
(95849, 'PAO', 'GOMEZ', 'GOMEZ', 'paolita@gmail.com', 9611788663);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `P_codigo` int(10) NOT NULL,
  `Alias` varchar(20) NOT NULL,
  `Especie` varchar(20) NOT NULL,
  `Raza` varchar(20) NOT NULL,
  `Color` varchar(20) NOT NULL,
  `Fecha_Nac` date NOT NULL,
  `Peso_medio` int(10) NOT NULL,
  `Peso_actual` int(10) NOT NULL,
  `id_dueño` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`P_codigo`, `Alias`, `Especie`, `Raza`, `Color`, `Fecha_Nac`, `Peso_medio`, `Peso_actual`, `id_dueño`) VALUES
(9, 'princesas', 'perro', 'pastor belga', 'rosa', '2024-09-05', 22, 23, 899025),
(2323, 'princesita', 'perro', 'chihuahua', 'rosa', '2024-09-11', 23, 23, 899025),
(9589, 'TERRY', 'PERRO', 'CHIHUAHUA', 'ROSA', '2024-09-06', 23, 23, 45675),
(9758, 'BONITA', 'PERRO', 'CHIHUAHUA', 'CAFE', '2024-09-05', 23, 23, 6545),
(45353, 'Canela', 'Perro', 'Labrador', 'Blanco', '2024-09-02', 12, 12, 899025),
(46543, 'DRACO', 'PERRO', 'PASTOR BELGA', 'CAFE', '2024-09-04', 23, 23, 45675);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `Num_receta` int(10) NOT NULL,
  `P_codigo` int(10) DEFAULT NULL,
  `id_dueño` int(10) DEFAULT NULL,
  `id_medico` int(10) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Medicamentos` varchar(100) DEFAULT NULL,
  `Tratamiento` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`Num_receta`, `P_codigo`, `id_dueño`, `id_medico`, `Fecha`, `Medicamentos`, `Tratamiento`) VALUES
(2323, 9, 899025, 3221, '2024-09-12', 'paracetamol', '1 cada 8 horas'),
(4545, 45353, 899025, 8689, '2024-09-12', 'paracetamol', '1 cada 8 horas'),
(5665, 9, 899025, 8689, '2024-09-12', 'paracetamol', '1 cada 8 horas'),
(34654, 2323, 899025, 3221, '2024-09-07', 'paracetamol', '1 cada 8 horas'),
(76087, 9, 899025, 3221, '2024-09-05', 'paracetamol', '1 cada 8 horas'),
(85754, 9, 899025, 3221, '2024-09-06', 'paracetamol', '1 cada 8 horas');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`Num_diagnostico`),
  ADD KEY `diagnostico_ibfk_1` (`P_codigo`),
  ADD KEY `diagnostico_ibfk_2` (`id_dueño`),
  ADD KEY `diagnostico_ibfk_3` (`id_medico`);

--
-- Indices de la tabla `dueños`
--
ALTER TABLE `dueños`
  ADD PRIMARY KEY (`id_dueño`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`P_codigo`),
  ADD KEY `fk_id_dueño` (`id_dueño`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`Num_receta`),
  ADD KEY `receta_ibfk_1` (`P_codigo`),
  ADD KEY `receta_ibfk_2` (`id_dueño`),
  ADD KEY `receta_ibfk_3` (`id_medico`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD CONSTRAINT `diagnostico_ibfk_1` FOREIGN KEY (`P_codigo`) REFERENCES `pacientes` (`P_codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `diagnostico_ibfk_2` FOREIGN KEY (`id_dueño`) REFERENCES `dueños` (`id_dueño`) ON UPDATE CASCADE,
  ADD CONSTRAINT `diagnostico_ibfk_3` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `fk_id_dueño` FOREIGN KEY (`id_dueño`) REFERENCES `dueños` (`id_dueño`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`P_codigo`) REFERENCES `pacientes` (`P_codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `receta_ibfk_2` FOREIGN KEY (`id_dueño`) REFERENCES `dueños` (`id_dueño`) ON UPDATE CASCADE,
  ADD CONSTRAINT `receta_ibfk_3` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
