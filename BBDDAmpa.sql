SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
CREATE DATABASE IF NOT EXISTS `4337274_ampa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `4337274_ampa`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO`--El regex le cogi de aqui: https://es.stackoverflow.com/questions/447347/validar-dni-cif-y-nie-espa%c3%b1a-en-mysql
--

CREATE TABLE `USUARIO` (
  `ID_Us` int(11) NOT NULL,
  `Documento` varchar(9) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Roles` int(1),
  `Permisos` int(1),
  `Nombre` varchar(20) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Direccion` varchar(200),
  `Poblacion` varchar(15),
  `CP` int(5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `USUARIO`
--

INSERT INTO `USUARIO` (`ID_Us`,`Documento`,`Email`,`Password`,`Roles`,`Permisos`,`Nombre`,`Apellidos`,`Direccion`,`Poblacion`,`CP`) VALUES
(1, 'X8820475K', 'ampadmin@gmail.com', '12345', 1, 1, 'Mariya', 'Valentinova Ivanova', 'Calle Arco de Tito 31','Mojados', 47250);

--
-- Estructura de tabla para la tabla `USUARIO_TELEFONO`--necesitare el id para hacer INSERT INTO `USUARIO_TELEFONO` (`ID_Us`,`Telefono`) VALUES(SELECT `ID_Us` FROM `USUARIO` WHERE , '0034622630767');
--

CREATE TABLE `USUARIO_TELEFONO` (
`ID_Us` int(11) NOT NULL,
`Telefono` varchar(15) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `USUARIO_TELEFONO`
--

INSERT INTO `USUARIO_TELEFONO` (`ID_Us`,`Telefono`) VALUES (1, '622630767');

--
-- Estructura de tabla para la tabla `ADMIN`
--

CREATE TABLE `ADMIN`(
`ID_Ad` int(11) NOT NULL,
`ID_Us` int(11) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `ADMIN` (`ID_Ad`,`ID_Us`) VALUES ('1','1');
--
-- Estructura de tabla para la tabla `INICIO`
--


CREATE TABLE `INICIO`(
`ID_Inicio` int(11) NOT NULL,
`Fecha` DATETIME NOT NULL,
`Texto` text
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `INICIO`
--

INSERT INTO `INICIO` (`ID_Inicio`,`Fecha`,`Texto`) VALUES
(1,'2023-09-10 15:30:00', 'Estimadas familias , El objetivo de esta presentación es recordar que el fin primordial, cuando se crea el AMPA, es el incremento de las posibilidades de participación de madres, padres, familia y tutores en la escuela, para mejorar colectivamente las actividades generales del centro. Por ello, AMPA puede definirse como una plataforma abierta para la participación, que se implica en los órganos de gobierno de la escuela y organiza y colabora tanto en actividades escolares como extraescolares.<br>AMPA es un instrumento para los que creemos que merece la pena trabajar e implicarse por un colegio y una enseñanza pública cada vez mejor y de mayor calidad. La formamos todos los que ponemos una idea encima de la mesa y luchamos por ella, y en esa tarea os esperamos.<br>La asociación no recibe ningún beneficio económico por lo que hacemos, sólo invertimos nuestro tiempo en la felicidad de nuestros hijos y los vuestros. Todo el dinero que recaudamos está dedicado íntegramente a los alumnos de este colegio, por eso damos las GRACIAS a los que nos ayudan y confían en nosotros.<br>En nombre de la asociación, quisiéramos dar la bienvenida a las familias que os incorporáis al colegio por primera vez y saludar a las que ya formabais parte de él.');

--
-- Estructura de tabla para la tabla `ADMIN_INICIO`
--

CREATE TABLE `ADMIN_INICIO`(
`ID_Ad` int(11) NOT NULL,
`ID_Inicio` int(100) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `ARCHIVOS`
--


CREATE TABLE `ARCHIVOS`(
`src` varchar(100) NOT NULL,
`Nombre` varchar(30),
`Descripcion` varchar(300)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ARCHIVOS`
--

--
-- Estructura de tabla para la tabla `ADMIN_ARCHIVOS`
--

CREATE TABLE `ADMIN_ARCHIVOS`(
`ID_Ad` int(11) NOT NULL,
`src` varchar(100) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `NOTICIAS`--como usar tipo de dato text https://www.educba.com/mysql-text/
--

CREATE TABLE `NOTICIAS`(
`ID_Noticia` int(11) NOT NULL,
`Fecha_Pub` DATETIME NOT NULL COMMENT 'Fecha y hora del evento',
`Fecha_Lim` DATE,
`Texto` text
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `ADMIN_NOTICIAS`
--

CREATE TABLE `ADMIN_NOTICIAS`(
`ID_Ad` int(11) NOT NULL ,
`ID_Noticia` int(11) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `JUEGOS`
--

CREATE TABLE `JUEGOS`(
`ID_Juego` int(11) NOT NULL,
`Nombre` varchar(100),
`src` varchar(100)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `JUGADOR`
--

CREATE TABLE `JUGADOR`(
`ID_Us` int(11) NOT NULL,
`ID_Juego` int(11) NOT NULL,
`Apodo` varchar(50),
`Puntos` int(11)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `CORREO`
--

CREATE TABLE `CORREO`(
`ID_Mail` int(11) NOT NULL,
`ID_Us` int(11) NOT NULL,
`Nombre` varchar(50),
`Asunto` varchar(100),
`Fecha` DATETIME NOT NULL,
`Contenido` text
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `SOCIO`--el valor de cuota depende de cuantos hijos tiene el socio
--

CREATE TABLE `SOCIO`(
`ID_Soc` int(11) NOT NULL,
`ID_Us` int(11) NOT NULL,
`Aut_img` int(1),
`Cuota` int(3)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `ADMIN_SOCIO`
--

CREATE TABLE `ADMIN_SOCIO`(
`ID_Ad` int(11) NOT NULL,
`ID_Soc` int(11) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `HIJOS`
--

CREATE TABLE `HIJOS`(
`ID_H` int(11) NOT NULL,
`Documento` varchar(9) NOT NULL,
`Nombre` varchar(20) NOT NULL,
`Apellidos` varchar(50) NOT NULL,
`Curso` varchar(4),
`ID_Soc` int(11) NOT NULL   
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `MENSAJES`
--

CREATE TABLE `MENSAJES`(
`ID_Msg` int(11) NOT NULL,
`ID_Ad` int(11),
`ID_Ad1` int(11),
`ID_Soc` int(11),
`ID_Soc1` int(11),
`Remitente` varchar(50),
`Destinatario` varchar(50),
`Fecha` DATETIME NOT NULL,
`Contenido` text
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `MSG_AD`
--

CREATE TABLE `MSG_AD`(
`ID_Msg_Ad` int(11) NOT NULL,
`ID_Msg` int(11),
`ID_Ad` int(11),
`Remitente` varchar(50),
`Destinatario` varchar(50),
`Fecha` DATETIME NOT NULL,
`Contenido` text
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `MSG_SOC`
--

CREATE TABLE `MSG_SOC`(
`ID_Msg_Soc` int(11) NOT NULL,
`ID_Msg` int(11),
`ID_Soc` int(11),
`Remitente` varchar(50),
`Destinatario` varchar(50),
`Fecha` DATETIME NOT NULL,
`Contenido` text
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices  y restricciones para tablas volcadas
--

--
-- Indices de la tabla `USUARIO`
--

ALTER TABLE `USUARIO`
  ADD PRIMARY KEY (`ID_Us`);

--
-- AUTO_INCREMENT de la tabla `USUARIO`
--

ALTER TABLE `USUARIO`
  MODIFY `ID_Us` int(11) NOT NULL AUTO_INCREMENT;
--
-- Indices y restricciones de la tabla `USUARIO_TELEFONO`
--

ALTER TABLE `USUARIO_TELEFONO`
  ADD PRIMARY KEY (`ID_Us`, `Telefono`),
  ADD CONSTRAINT `FK_US_TLF` FOREIGN KEY (`ID_Us`) REFERENCES `USUARIO` (`ID_Us`) ON DELETE CASCADE ON UPDATE CASCADE;
  
--
-- Indices y restricciones de la tabla `ADMIN`
--

ALTER TABLE `ADMIN`
  ADD PRIMARY KEY (`ID_Ad`),
  ADD CONSTRAINT `FK_ADMIN` FOREIGN KEY (`ID_Us`) REFERENCES `USUARIO` (`ID_Us`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- AUTO_INCREMENT de la tabla `ADMIN`
--

ALTER TABLE `ADMIN`
  MODIFY `ID_Ad` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- Indices de la tabla `INICIO`
--

ALTER TABLE `INICIO`
  ADD PRIMARY KEY (`ID_Inicio`);

--
-- AUTO_INCREMENT de la tabla `INICIO`
--

ALTER TABLE `INICIO`
  MODIFY `ID_Inicio` int(11) NOT NULL AUTO_INCREMENT;   
  
--
-- Indices y restricciones de la tabla `ADMIN_INICIO`
--

ALTER TABLE `ADMIN_INICIO`
  ADD PRIMARY KEY (`ID_Ad`, `ID_Inicio`),
  ADD CONSTRAINT `FK_AD_AD` FOREIGN KEY (`ID_Ad`) REFERENCES `ADMIN` (`ID_Ad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AD_IN` FOREIGN KEY (`ID_Inicio`) REFERENCES `INICIO` (`ID_Inicio`) ON DELETE CASCADE ON UPDATE CASCADE;
  
--
-- Indices de la tabla `ARCHIVOS`
--

ALTER TABLE `ARCHIVOS`
  ADD PRIMARY KEY (`src`);

--
-- Indices y restricciones de la tabla `ADMIN_ARCHIVOS`
--

ALTER TABLE `ADMIN_ARCHIVOS`
  ADD PRIMARY KEY (`ID_Ad`, `src`),
  ADD CONSTRAINT `FK_ADMIN_ARCH` FOREIGN KEY (`ID_Ad`) REFERENCES `ADMIN` (`ID_Ad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ADMIN_AR` FOREIGN KEY (`src`) REFERENCES `ARCHIVOS` (`src`) ON DELETE CASCADE ON UPDATE CASCADE;
  
--
-- Indices de la tabla `NOTICIAS`
--

ALTER TABLE `NOTICIAS`
  ADD PRIMARY KEY (`ID_Noticia`);
 
--
-- AUTO_INCREMENT de la tabla `NOTICIAS`
--

ALTER TABLE `NOTICIAS`
  MODIFY `ID_Noticia` int(11) NOT NULL AUTO_INCREMENT;    

--
-- Indices y restricciones de la tabla `ADMIN_NOTICIAS`
--

ALTER TABLE `ADMIN_NOTICIAS`
  ADD PRIMARY KEY (`ID_Ad`, `ID_Noticia`),
  ADD CONSTRAINT `FK_ADMIN_NOTICIA` FOREIGN KEY (`ID_Ad`) REFERENCES `ADMIN` (`ID_Ad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ADMIN_NOT` FOREIGN KEY (`ID_Noticia`) REFERENCES `NOTICIAS` (`ID_Noticia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Indices de la tabla `JUEGOS`
--

ALTER TABLE `JUEGOS`
  ADD PRIMARY KEY (`ID_Juego`);
 
--
-- AUTO_INCREMENT de la tabla `JUEGOS`
--

ALTER TABLE `JUEGOS`
  MODIFY `ID_Juego` int(11) NOT NULL AUTO_INCREMENT;    

--
-- Indices y restricciones de la tabla `JUGADOR`
--

ALTER TABLE `JUGADOR`
  ADD PRIMARY KEY (`ID_Us`, `ID_Juego`),
  ADD CONSTRAINT `FK_JUGADOR` FOREIGN KEY (`ID_Us`) REFERENCES `USUARIO` (`ID_Us`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_JUG` FOREIGN KEY (`ID_Juego`) REFERENCES `JUEGOS` (`ID_Juego`) ON DELETE CASCADE ON UPDATE CASCADE;
  
--
-- Indices y restricciones de la tabla `CORREO`
--

ALTER TABLE `CORREO`
  ADD PRIMARY KEY (`ID_Mail`),
  ADD CONSTRAINT `FK_CORREO` FOREIGN KEY (`ID_Us`) REFERENCES `USUARIO` (`ID_Us`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- AUTO_INCREMENT de la tabla `CORREO`
--

ALTER TABLE `CORREO`
  MODIFY `ID_Mail` int(11) NOT NULL AUTO_INCREMENT;    
  
--
-- Indices de la tabla `SOCIO`
--

ALTER TABLE `SOCIO`
  ADD PRIMARY KEY (`ID_Soc`),
  ADD CONSTRAINT `FK_SOCIO` FOREIGN KEY (`ID_Us`) REFERENCES `USUARIO` (`ID_Us`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- AUTO_INCREMENT de la tabla `SOCIO`
--

ALTER TABLE `SOCIO`
  MODIFY `ID_Soc` int(11) NOT NULL AUTO_INCREMENT;  
  
--
-- Indices y restricciones de la tabla `ADMIN_SOCIO`
--

ALTER TABLE `ADMIN_SOCIO`
  ADD PRIMARY KEY (`ID_Soc`, `ID_Ad`),
  ADD CONSTRAINT `FK_AD_SOC` FOREIGN KEY (`ID_Ad`) REFERENCES `ADMIN` (`ID_Ad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AD_S` FOREIGN KEY (`ID_Soc`) REFERENCES `SOCIO` (`ID_Soc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Indices de la tabla `CORREO`
--

ALTER TABLE `HIJOS`
  ADD PRIMARY KEY (`ID_H`),
  ADD CONSTRAINT `FK_HIJOS` FOREIGN KEY (`ID_Soc`) REFERENCES `SOCIO` (`ID_Soc`) ON DELETE CASCADE ON UPDATE CASCADE;
 
--
-- AUTO_INCREMENT de la tabla `HIJOS`
--

ALTER TABLE `HIJOS`
  MODIFY `ID_H` int(11) NOT NULL AUTO_INCREMENT;   

--
-- Indices de la tabla `MENSAJES`
--

ALTER TABLE `MENSAJES`
  ADD PRIMARY KEY (`ID_Msg`);

--
-- AUTO_INCREMENT de la tabla `MENSAJES`
--

ALTER TABLE `MENSAJES`
  MODIFY `ID_Msg` int(11) NOT NULL AUTO_INCREMENT;     
    
--
-- Indices y restricciones de la tabla `MSG_AD`
--

ALTER TABLE `MSG_AD`
  ADD PRIMARY KEY (`ID_Msg_Ad`, `ID_Ad`),
  ADD CONSTRAINT `FK_MSG_AD` FOREIGN KEY (`ID_Ad`) REFERENCES `ADMIN` (`ID_Ad`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_MSG_M` FOREIGN KEY (`ID_Msg`) REFERENCES `MENSAJES` (`ID_Msg`);

--
-- Indices y restricciones de la tabla `MSG_SOC`
--

ALTER TABLE `MSG_SOC`
  ADD PRIMARY KEY (`ID_Msg_Soc`, `ID_Soc`),
  ADD CONSTRAINT `FK_MSG_SOC` FOREIGN KEY (`ID_Soc`) REFERENCES `SOCIO` (`ID_Soc`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_MSG_Msg` FOREIGN KEY (`ID_Msg`) REFERENCES `MENSAJES` (`ID_Msg`);    
  
COMMIT;


