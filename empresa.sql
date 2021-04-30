-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: empresa
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `CLIENTE_NO` int NOT NULL,
  `NOMBRE` varchar(25) DEFAULT NULL,
  `LOCALIDAD` varchar(14) DEFAULT NULL,
  `VENDEDOR_NO` int DEFAULT NULL,
  `DEBE` float(9,2) DEFAULT NULL,
  `HABER` float(9,2) DEFAULT NULL,
  `LIMITE_CREDITO` float(9,2) DEFAULT NULL,
  PRIMARY KEY (`CLIENTE_NO`),
  KEY `FK_CLI_EMP_NO` (`VENDEDOR_NO`),
  CONSTRAINT `FK_CLI_EMP_NO` FOREIGN KEY (`VENDEDOR_NO`) REFERENCES `empleados` (`EMP_NO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (101,'DISTRIBUCIONES GOMEZ','MADRID',7499,0.00,0.00,5000.00),(102,'LOGITRONICA S.L','BARCELONA',7654,0.00,0.00,5000.00),(103,'INDUSTRIAS LACTEAS S.A.','LAS ROZAS',7844,0.00,0.00,10000.00),(104,'TALLERES ESTESO S.A.','SEVILLA',7654,0.00,0.00,5000.00),(105,'EDICIONES SANZ','BARCELONA',7499,0.00,0.00,5000.00),(106,'SIGNOLOGIC S.A.','MADRID',7654,0.00,0.00,5000.00),(107,'MARTIN Y ASOCIADOS S.L.','ARAVACA',7844,0.00,0.00,10000.00),(108,'MANUFACTURAS ALI S.A.','SEVILLA',7654,0.00,0.00,5000.00);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `DEP_NO` int NOT NULL,
  `DNOMBRE` varchar(14) DEFAULT NULL,
  `LOCALIDAD` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`DEP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (10,'CONTABILIDAD','BARCELONA'),(20,'INVESTIGACION','VALENCIA'),(30,'VENTAS','MADRID'),(40,'PRODUCCION','SEVILLA');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `EMP_NO` int NOT NULL,
  `APELLIDO` varchar(8) DEFAULT NULL,
  `OFICIO` varchar(10) DEFAULT NULL,
  `DIRECTOR` int DEFAULT NULL,
  `FECHA_ALTA` date DEFAULT NULL,
  `SALARIO` float(6,2) DEFAULT NULL,
  `COMISION` float(6,2) DEFAULT NULL,
  `DEP_NO` int DEFAULT NULL,
  PRIMARY KEY (`EMP_NO`),
  KEY `FK_EMP_DIRECTOR` (`DIRECTOR`),
  KEY `FK_EMP_DEP_NO` (`DEP_NO`),
  CONSTRAINT `FK_EMP_DEP_NO` FOREIGN KEY (`DEP_NO`) REFERENCES `departamentos` (`DEP_NO`),
  CONSTRAINT `FK_EMP_DIRECTOR` FOREIGN KEY (`DIRECTOR`) REFERENCES `empleados` (`EMP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (7499,'ALONSO','VENDEDOR',7698,'1981-02-23',1428.00,400.00,30),(7521,'LOPEZ','EMPLEADO',7782,'1981-05-08',1350.50,NULL,10),(7654,'MARTIN','VENDEDOR',7698,'1981-09-28',1530.00,1600.00,30),(7698,'GARRIDO','DIRECTOR',7839,'1981-05-01',3850.12,NULL,30),(7782,'MARTINEZ','DIRECTOR',7839,'1981-06-09',2450.00,NULL,10),(7839,'REY','PRESIDENTE',NULL,'1981-11-17',6000.00,NULL,10),(7844,'CALVO','VENDEDOR',7698,'1981-09-08',1818.00,0.00,30),(7876,'GIL','ANALISTA',7782,'1982-05-06',3350.00,NULL,20),(7900,'JIMENEZ','EMPLEADO',7782,'1983-03-24',1400.00,NULL,20);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `PEDIDO_NO` int NOT NULL,
  `PRODUCTO_NO` int DEFAULT NULL,
  `CLIENTE_NO` int DEFAULT NULL,
  `UNIDADES` int DEFAULT NULL,
  `FECHA_PEDIDO` date DEFAULT NULL,
  PRIMARY KEY (`PEDIDO_NO`),
  KEY `FK_PEDIDOS_PRODUCTO_NO` (`PRODUCTO_NO`),
  KEY `FK_PEDIDOS_CLIENTE_NO` (`CLIENTE_NO`),
  CONSTRAINT `FK_PEDIDOS_CLIENTE_NO` FOREIGN KEY (`CLIENTE_NO`) REFERENCES `clientes` (`CLIENTE_NO`) ON DELETE CASCADE,
  CONSTRAINT `FK_PEDIDOS_PRODUCTO_NO` FOREIGN KEY (`PRODUCTO_NO`) REFERENCES `productos` (`PRODUCTO_NO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1000,20,103,3,'1999-10-06'),(1001,50,106,2,'1999-10-06'),(1002,10,101,4,'1999-10-07'),(1003,20,105,4,'1999-10-16'),(1004,40,106,8,'1999-10-20'),(1005,30,105,2,'1999-10-20'),(1006,70,103,3,'1999-11-03'),(1007,50,101,2,'1999-11-06'),(1008,10,106,6,'1999-11-16'),(1009,20,105,2,'1999-11-26'),(1010,40,102,3,'1999-12-08'),(1011,30,106,2,'1999-12-15'),(1012,10,105,3,'1999-12-06'),(1013,30,106,2,'1999-12-06'),(1014,20,101,4,'2000-01-07'),(1015,70,105,4,'2000-01-16'),(1017,20,105,6,'2000-01-20');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `PRODUCTO_NO` int NOT NULL,
  `DESCRIPCION` varchar(30) DEFAULT NULL,
  `PRECIO_ACTUAL` float(8,2) DEFAULT NULL,
  `STOCK_DISPONIBLE` int DEFAULT NULL,
  PRIMARY KEY (`PRODUCTO_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (10,'MESA DESPACHO MOD. GAVIOTA',550.00,50),(20,'SILLA DIRECTOR MOD. BUFALO',670.00,25),(30,'ARMARIO NOGAL DOS PUERTAS',460.00,20),(40,'MESA MODELO UNION',340.00,15),(50,'ARCHIVADOR CEREZO',1050.00,20),(60,'CAJA SEGURIDAD MOD B222',280.00,15),(70,'DESTRUCTORA DE PAPEL A3',450.00,25),(80,'MODULO ORDENADOR MOD. ERGOS',550.00,25);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'empresa'
--
/*!50003 DROP FUNCTION IF EXISTS `reves` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `reves`(cadena char(255)) RETURNS char(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	declare cadena_reves char(255) default '';
    declare contador int default 1;
    declare tamaño int default length(cadena);
    
    while contador<=tamaño do
		set cadena_reves = concat(substr(cadena,contador,1), cadena_reves);
        set contador = contador + 1;
    end while;

RETURN cadena_reves;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `aumenta_salario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `aumenta_salario`(IN _oficio VARCHAR(10))
BEGIN

	DECLARE fin INT default 0;
	DECLARE aux_emp_no INT;
	DECLARE aux_salario FLOAT(6,2);
	DECLARE aumento FLOAT;
	DECLARE total_aumentos FLOAT;
	DECLARE cursor_salario CURSOR FOR SELECT EMP_NO, SALARIO FROM EMPLEADOS WHERE OFICIO = _oficio;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;

	SET total_aumentos = 0;
	OPEN cursor_salario;

	loop_lectura: LOOP
		FETCH cursor_salario INTO aux_emp_no, aux_salario;
		IF fin = 1 THEN
			LEAVE loop_lectura;
		END IF;
        
		IF aux_salario<=1500 THEN
			SET aumento=aux_salario*0.02;
		ELSE
			SET aumento=aux_salario*0.01;
		END IF;
		SET total_aumentos = total_aumentos + aumento;
		UPDATE EMPLEADOS SET SALARIO = aux_salario + aumento WHERE EMP_NO=aux_emp_no;
	END LOOP
	loop_lectura;

	SELECT total_aumentos AS 'CANTIDAD TOTAL INVERTIDA EN LA SUBIDA DE SUELDO';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-30 17:46:07
