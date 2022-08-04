-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: beltron_db
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria_tbl`
--

DROP TABLE IF EXISTS `categoria_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_tbl` (
  `id_categoria` smallint(6) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_tbl`
--

LOCK TABLES `categoria_tbl` WRITE;
/*!40000 ALTER TABLE `categoria_tbl` DISABLE KEYS */;
INSERT INTO `categoria_tbl` VALUES (1,'Prendas');
/*!40000 ALTER TABLE `categoria_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_tbl`
--

DROP TABLE IF EXISTS `producto_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_tbl` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(120) NOT NULL,
  `portada` varchar(100) NOT NULL,
  `precio` float(8,2) NOT NULL,
  `existencia` int(11) NOT NULL,
  `id_categoria` smallint(6) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `productos_tbl_FK` (`id_categoria`),
  CONSTRAINT `productos_tbl_FK` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_tbl` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_tbl`
--

LOCK TABLES `producto_tbl` WRITE;
/*!40000 ALTER TABLE `producto_tbl` DISABLE KEYS */;
INSERT INTO `producto_tbl` VALUES (1,'Adidas','Polo Clásico juveníl','item01.jpeg',12.40,5,1),(2,'Filippo Alpi','Pantalón juvenil, color verde, talla 25','item02.jpeg',85.60,6,1);
/*!40000 ALTER TABLE `producto_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_tbl`
--

DROP TABLE IF EXISTS `usuario_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_tbl` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `dni` char(8) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(120) NOT NULL,
  `genero` char(1) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `is_delete` char(1) NOT NULL,
  `is_staff` char(1) NOT NULL,
  `is_superuser` char(1) NOT NULL,
  `is_active` char(1) NOT NULL,
  `correo` varchar(320) NOT NULL,
  `contrasena` varchar(320) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_tbl`
--

LOCK TABLES `usuario_tbl` WRITE;
/*!40000 ALTER TABLE `usuario_tbl` DISABLE KEYS */;
INSERT INTO `usuario_tbl` VALUES (1,'12345678','Jahirshiño','Paco Huayllahuaman','1','Av. Tambopata','0','1','1','0','paco@gmail.com','e10adc3949ba59abbe56e057f20f883e'),(2,'12345679','Roberto','Huamani Puma','1','Av. Tambopata','0','1','0','0','free.soft@gmail.com','e10adc3949ba59abbe56e057f20f883e');
/*!40000 ALTER TABLE `usuario_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_detalle_tbl`
--

DROP TABLE IF EXISTS `venta_detalle_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_detalle_tbl` (
  `id_venta_detalle` int(11) NOT NULL,
  `id_encabezado` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_venta_detalle`),
  KEY `venta_detalle_FK` (`id_producto`),
  KEY `venta_detalle_FK_1` (`id_encabezado`),
  CONSTRAINT `venta_detalle_FK` FOREIGN KEY (`id_producto`) REFERENCES `producto_tbl` (`id_producto`),
  CONSTRAINT `venta_detalle_FK_1` FOREIGN KEY (`id_encabezado`) REFERENCES `venta_encabezado_tbl` (`id_encabezado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_detalle_tbl`
--

LOCK TABLES `venta_detalle_tbl` WRITE;
/*!40000 ALTER TABLE `venta_detalle_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_detalle_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_encabezado_tbl`
--

DROP TABLE IF EXISTS `venta_encabezado_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_encabezado_tbl` (
  `id_encabezado` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_encabezado`),
  KEY `venta_encabezado_tbl_FK` (`id_usuario`),
  CONSTRAINT `venta_encabezado_tbl_FK` FOREIGN KEY (`id_usuario`) REFERENCES `usuario_tbl` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_encabezado_tbl`
--

LOCK TABLES `venta_encabezado_tbl` WRITE;
/*!40000 ALTER TABLE `venta_encabezado_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_encabezado_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-05 13:33:18
