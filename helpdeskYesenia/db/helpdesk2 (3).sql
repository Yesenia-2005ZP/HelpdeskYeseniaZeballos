-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2026 a las 05:44:31
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
-- Base de datos: `helpdesk2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`) VALUES
(1, 'Hardware'),
(2, 'Software'),
(3, 'Redes'),
(4, 'Sistemas'),
(5, 'Impresoras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id_especialidad`, `nombres`) VALUES
(1, 'Soporte Técnico'),
(2, 'Desarrollo de Software'),
(3, 'Redes y Comunicaciones'),
(4, 'Base de Datos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre`) VALUES
(1, 'Pendiente'),
(2, 'En proceso'),
(3, 'Resuelto'),
(4, 'Cerrado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia`
--

CREATE TABLE `incidencia` (
  `id_incidencia` int(11) NOT NULL,
  `ticket` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `descripcion` text NOT NULL,
  `equipo` varchar(80) DEFAULT NULL,
  `sistema_operativo` varchar(80) DEFAULT NULL,
  `ubicacion` varchar(120) DEFAULT NULL,
  `categoria_ia` varchar(50) DEFAULT NULL,
  `prioridad_ia` varchar(10) DEFAULT NULL,
  `solucion_ia` text DEFAULT NULL,
  `solucion_final` text DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `tecnico_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `incidencia`
--

INSERT INTO `incidencia` (`id_incidencia`, `ticket`, `fecha`, `hora`, `titulo`, `descripcion`, `equipo`, `sistema_operativo`, `ubicacion`, `categoria_ia`, `prioridad_ia`, `solucion_ia`, `solucion_final`, `fecha_cierre`, `usuario_id`, `tecnico_id`, `categoria_id`, `estado_id`) VALUES
(1, 'INC-0001', '2026-07-01', '08:30:00', 'Computadora no enciende', 'El equipo del laboratorio no enciende al presionar el botón de encendido.', 'PC Laboratorio 1', 'Windows 11', 'Laboratorio de Sistemas', 'Hardware', 'Alta', 'Verificar fuente de alimentación.', 'Se reemplazó el cable de alimentación y el equipo volvió a funcionar.', '2026-07-01 10:00:00', 1, 1, 1, 3),
(2, 'INC-0002', '2026-07-02', '09:15:00', 'Problema de conexión a Internet', 'El usuario no puede acceder a Internet desde su computadora.', 'PC Oficina 1', 'Windows 10', 'Oficina Administrativa', 'Redes', 'Alta', 'Revisar conexión de red.', 'Se reinició el router y se configuró nuevamente la conexión.', '2026-07-02 11:00:00', 2, 3, 3, 3),
(3, 'INC-0003', '2026-07-03', '10:00:00', 'Microsoft Word no abre', 'El programa Microsoft Word presenta un error al iniciar.', 'PC Aula 2', 'Windows 11', 'Aula 2', 'Software', 'Media', 'Reinstalar el programa.', 'Se reparó la instalación de Microsoft Office.', '2026-07-03 12:30:00', 3, 2, 2, 3),
(4, 'INC-0004', '2026-07-04', '11:20:00', 'Impresora no imprime', 'La impresora muestra documentos en cola pero no realiza la impresión.', 'Impresora HP', 'Windows 10', 'Secretaría', 'Impresoras', 'Media', 'Revisar cola de impresión.', 'Se reinició el servicio de impresión y se eliminaron los documentos bloqueados.', '2026-07-04 13:00:00', 4, 1, 5, 3),
(5, 'INC-0005', '2026-07-05', '08:45:00', 'Contraseña olvidada', 'El estudiante no puede ingresar al sistema académico.', 'Computadora personal', 'Windows 11', 'Laboratorio de Sistemas', 'Sistemas', 'Media', 'Reestablecer contraseña.', 'Se realizó el cambio de contraseña del usuario.', '2026-07-05 09:30:00', 5, 2, 4, 3),
(6, 'INC-0006', '2026-07-07', '14:00:00', 'Internet lento', 'La conexión de Internet presenta una velocidad muy baja.', 'PC Laboratorio 2', 'Windows 11', 'Laboratorio de Sistemas', 'Redes', 'Media', 'Verificar la red.', 'Se revisó la conexión y se reemplazó el cable de red.', '2026-07-07 15:30:00', 1, 3, 3, 3),
(7, 'INC-0007', '2026-07-08', '15:10:00', 'Computadora se reinicia', 'El equipo se reinicia constantemente durante las clases.', 'PC Aula 3', 'Windows 10', 'Aula 3', 'Hardware', 'Alta', 'Revisar temperatura del equipo.', 'Se realizó limpieza interna y mantenimiento preventivo.', '2026-07-08 17:00:00', 2, 1, 1, 3),
(8, 'INC-0008', '2026-07-09', '09:30:00', 'Error en sistema académico', 'El sistema académico muestra un mensaje de error al registrar notas.', 'Servidor Web', 'Linux Ubuntu', 'Sala de Servidores', 'Sistemas', 'Alta', 'Revisar el sistema y la base de datos.', 'Se corrigió un error en el módulo de registro de calificaciones.', '2026-07-09 12:00:00', 3, 2, 4, 3),
(9, 'INC-0009', '2026-07-10', '10:45:00', 'No reconoce teclado', 'La computadora no reconoce el teclado conectado.', 'PC Oficina 2', 'Windows 11', 'Oficina Administrativa', 'Hardware', 'Baja', 'Verificar el dispositivo USB.', 'Se reemplazó el teclado defectuoso.', '2026-07-10 11:30:00', 4, 1, 1, 3),
(10, 'INC-0010', '2026-07-11', '16:00:00', 'Problema con correo institucional', 'El usuario no puede enviar correos desde su cuenta institucional.', 'PC Docente', 'Windows 11', 'Sala de Docentes', 'Sistemas', 'Media', 'Revisar la configuración del correo.', 'Se configuró nuevamente la cuenta de correo institucional.', '2026-07-11 17:00:00', 5, 2, 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `tecnico_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id_login`, `usuario`, `password`, `rol`, `tecnico_id`) VALUES
(1, 'pedro.mendoza', '123456', 'Técnico', 1),
(2, 'laura.vargas', '123456', 'Técnico', 2),
(3, 'miguel.condori', '123456', 'Técnico', 3),
(4, 'sofia.rojas', '123456', 'Técnico', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `id_tecnico` int(11) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `especialidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tecnico`
--

INSERT INTO `tecnico` (`id_tecnico`, `nombres`, `apellidos`, `correo`, `telefono`, `especialidad_id`) VALUES
(1, 'Pedro', 'Mendoza', 'pedro.mendoza@instituto.edu.bo', 71000001, 1),
(2, 'Laura', 'Vargas', 'laura.vargas@instituto.edu.bo', 71000002, 2),
(3, 'Miguel', 'Condori', 'miguel.condori@instituto.edu.bo', 71000003, 3),
(4, 'Sofía', 'Rojas', 'sofia.rojas@instituto.edu.bo', 71000004, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `cargo` varchar(80) DEFAULT NULL,
  `area` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombres`, `apellidos`, `correo`, `telefono`, `cargo`, `area`) VALUES
(1, 'Juan', 'García Rivera', 'juan.garcia@instituto.edu.bo', 70000001, 'Estudiante', 'Sistemas Informáticos'),
(2, 'María', 'López Pérez', 'maria.lopez@instituto.edu.bo', 70000002, 'Docente', 'Informática'),
(3, 'Carlos', 'Mamani Quispe', 'carlos.mamani@instituto.edu.bo', 70000003, 'Estudiante', 'Sistemas Informáticos'),
(4, 'Ana', 'Fernández Rojas', 'ana.fernandez@instituto.edu.bo', 70000004, 'Administrativa', 'Secretaría'),
(5, 'Luis', 'Choque Flores', 'luis.choque@instituto.edu.bo', 70000005, 'Estudiante', 'Contaduría');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD PRIMARY KEY (`id_incidencia`),
  ADD UNIQUE KEY `ticket` (`ticket`),
  ADD KEY `fk_incidencia_usuario` (`usuario_id`),
  ADD KEY `fk_incidencia_tecnico` (`tecnico_id`),
  ADD KEY `fk_incidencia_categoria` (`categoria_id`),
  ADD KEY `fk_incidencia_estado` (`estado_id`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `fk_login_tecnico` (`tecnico_id`);

--
-- Indices de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`id_tecnico`),
  ADD KEY `fk_tecnico_especialidad` (`especialidad_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  MODIFY `id_incidencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `id_tecnico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD CONSTRAINT `fk_incidencia_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id_categoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_incidencia_estado` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id_estado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_incidencia_tecnico` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`id_tecnico`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_incidencia_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_login_tecnico` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`id_tecnico`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD CONSTRAINT `fk_tecnico_especialidad` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidad` (`id_especialidad`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
