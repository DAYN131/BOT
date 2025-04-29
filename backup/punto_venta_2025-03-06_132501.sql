-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: PuntoVenta
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Libros'),(2,'Bebidas'),(3,'Electrónica'),(4,'Alimentos'),(5,'Hogar'),(6,'Salud'),(7,'Electrónica'),(8,'Ropa'),(9,'Electrónica'),(10,'Electrónica'),(11,'Deportes'),(12,'Deportes'),(13,'Hogar'),(14,'Deportes'),(15,'Automotriz'),(16,'Juguetes'),(17,'Salud'),(18,'Bebidas'),(19,'Alimentos'),(20,'Alimentos'),(21,'Juguetes'),(22,'Salud'),(23,'Hogar'),(24,'Alimentos'),(25,'Alimentos'),(26,'Automotriz'),(27,'Alimentos'),(28,'Bebidas'),(29,'Juguetes'),(30,'Deportes'),(31,'Juguetes'),(32,'Electrónica'),(33,'Deportes'),(34,'Salud'),(35,'Ropa'),(36,'Automotriz'),(37,'Juguetes'),(38,'Alimentos'),(39,'Deportes'),(40,'Juguetes'),(41,'Automotriz'),(42,'Libros'),(43,'Deportes'),(44,'Automotriz'),(45,'Salud'),(46,'Libros'),(47,'Salud'),(48,'Bebidas'),(49,'Automotriz'),(50,'Alimentos'),(51,'Ropa'),(52,'Hogar'),(53,'Alimentos'),(54,'Libros'),(55,'Deportes'),(56,'Libros'),(57,'Hogar'),(58,'Salud'),(59,'Salud'),(60,'Automotriz'),(61,'Deportes'),(62,'Juguetes'),(63,'Salud'),(64,'Salud'),(65,'Automotriz'),(66,'Hogar'),(67,'Bebidas'),(68,'Electrónica'),(69,'Ropa'),(70,'Salud'),(71,'Automotriz'),(72,'Electrónica'),(73,'Automotriz'),(74,'Electrónica'),(75,'Hogar'),(76,'Ropa'),(77,'Bebidas'),(78,'Juguetes'),(79,'Automotriz'),(80,'Bebidas'),(81,'Juguetes'),(82,'Alimentos'),(83,'Alimentos'),(84,'Automotriz'),(85,'Alimentos'),(86,'Libros'),(87,'Libros'),(88,'Ropa'),(89,'Automotriz'),(90,'Electrónica'),(91,'Electrónica'),(92,'Libros'),(93,'Ropa'),(94,'Hogar'),(95,'Salud'),(96,'Salud'),(97,'Electrónica'),(98,'Libros'),(99,'Juguetes'),(100,'Ropa');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Cliente 1','cliente1@correo.com','555933910'),(2,'Cliente 2','cliente2@correo.com','559484823'),(3,'Cliente 3','cliente3@correo.com','556174353'),(4,'Cliente 4','cliente4@correo.com','555129718'),(5,'Cliente 5','cliente5@correo.com','555047651'),(6,'Cliente 6','cliente6@correo.com','552529847'),(7,'Cliente 7','cliente7@correo.com','558610549'),(8,'Cliente 8','cliente8@correo.com','555056194'),(9,'Cliente 9','cliente9@correo.com','559850492'),(10,'Cliente 10','cliente10@correo.com','552429200'),(11,'Cliente 11','cliente11@correo.com','556087398'),(12,'Cliente 12','cliente12@correo.com','559919274'),(13,'Cliente 13','cliente13@correo.com','551411800'),(14,'Cliente 14','cliente14@correo.com','559401883'),(15,'Cliente 15','cliente15@correo.com','551066175'),(16,'Cliente 16','cliente16@correo.com','553207004'),(17,'Cliente 17','cliente17@correo.com','559080458'),(18,'Cliente 18','cliente18@correo.com','558322064'),(19,'Cliente 19','cliente19@correo.com','553054682'),(20,'Cliente 20','cliente20@correo.com','555135566'),(21,'Cliente 21','cliente21@correo.com','551208090'),(22,'Cliente 22','cliente22@correo.com','551673015'),(23,'Cliente 23','cliente23@correo.com','554516629'),(24,'Cliente 24','cliente24@correo.com','553357641'),(25,'Cliente 25','cliente25@correo.com','552606339'),(26,'Cliente 26','cliente26@correo.com','558380730'),(27,'Cliente 27','cliente27@correo.com','555314174'),(28,'Cliente 28','cliente28@correo.com','551502339'),(29,'Cliente 29','cliente29@correo.com','558843136'),(30,'Cliente 30','cliente30@correo.com','552919766'),(31,'Cliente 31','cliente31@correo.com','556793269'),(32,'Cliente 32','cliente32@correo.com','559087283'),(33,'Cliente 33','cliente33@correo.com','553189634'),(34,'Cliente 34','cliente34@correo.com','554253203'),(35,'Cliente 35','cliente35@correo.com','551702517'),(36,'Cliente 36','cliente36@correo.com','558114759'),(37,'Cliente 37','cliente37@correo.com','553132306'),(38,'Cliente 38','cliente38@correo.com','555362931'),(39,'Cliente 39','cliente39@correo.com','557109959'),(40,'Cliente 40','cliente40@correo.com','556755006'),(41,'Cliente 41','cliente41@correo.com','553888602'),(42,'Cliente 42','cliente42@correo.com','558227955'),(43,'Cliente 43','cliente43@correo.com','556450350'),(44,'Cliente 44','cliente44@correo.com','554535807'),(45,'Cliente 45','cliente45@correo.com','559824524'),(46,'Cliente 46','cliente46@correo.com','559414554'),(47,'Cliente 47','cliente47@correo.com','555055093'),(48,'Cliente 48','cliente48@correo.com','559979618'),(49,'Cliente 49','cliente49@correo.com','553203975'),(50,'Cliente 50','cliente50@correo.com','552446114'),(51,'Cliente 51','cliente51@correo.com','557813416'),(52,'Cliente 52','cliente52@correo.com','554413373'),(53,'Cliente 53','cliente53@correo.com','552249635'),(54,'Cliente 54','cliente54@correo.com','555971436'),(55,'Cliente 55','cliente55@correo.com','553421681'),(56,'Cliente 56','cliente56@correo.com','557183163'),(57,'Cliente 57','cliente57@correo.com','552490558'),(58,'Cliente 58','cliente58@correo.com','553402146'),(59,'Cliente 59','cliente59@correo.com','555689927'),(60,'Cliente 60','cliente60@correo.com','554062345'),(61,'Cliente 61','cliente61@correo.com','556365371'),(62,'Cliente 62','cliente62@correo.com','556170414'),(63,'Cliente 63','cliente63@correo.com','552755221'),(64,'Cliente 64','cliente64@correo.com','557637484'),(65,'Cliente 65','cliente65@correo.com','552088464'),(66,'Cliente 66','cliente66@correo.com','556315525'),(67,'Cliente 67','cliente67@correo.com','556110324'),(68,'Cliente 68','cliente68@correo.com','558029107'),(69,'Cliente 69','cliente69@correo.com','557185980'),(70,'Cliente 70','cliente70@correo.com','556900150'),(71,'Cliente 71','cliente71@correo.com','556564240'),(72,'Cliente 72','cliente72@correo.com','555144090'),(73,'Cliente 73','cliente73@correo.com','551142938'),(74,'Cliente 74','cliente74@correo.com','559058854'),(75,'Cliente 75','cliente75@correo.com','557413816'),(76,'Cliente 76','cliente76@correo.com','557366001'),(77,'Cliente 77','cliente77@correo.com','552665431'),(78,'Cliente 78','cliente78@correo.com','553441367'),(79,'Cliente 79','cliente79@correo.com','559272762'),(80,'Cliente 80','cliente80@correo.com','559860341'),(81,'Cliente 81','cliente81@correo.com','557353499'),(82,'Cliente 82','cliente82@correo.com','558427784'),(83,'Cliente 83','cliente83@correo.com','551302562'),(84,'Cliente 84','cliente84@correo.com','559362615'),(85,'Cliente 85','cliente85@correo.com','556510303'),(86,'Cliente 86','cliente86@correo.com','553700345'),(87,'Cliente 87','cliente87@correo.com','555386592'),(88,'Cliente 88','cliente88@correo.com','554879752'),(89,'Cliente 89','cliente89@correo.com','553060627'),(90,'Cliente 90','cliente90@correo.com','553113096'),(91,'Cliente 91','cliente91@correo.com','558793687'),(92,'Cliente 92','cliente92@correo.com','559703685'),(93,'Cliente 93','cliente93@correo.com','553264583'),(94,'Cliente 94','cliente94@correo.com','559655132'),(95,'Cliente 95','cliente95@correo.com','557009215'),(96,'Cliente 96','cliente96@correo.com','554778397'),(97,'Cliente 97','cliente97@correo.com','558883575'),(98,'Cliente 98','cliente98@correo.com','553761393'),(99,'Cliente 99','cliente99@correo.com','556541204'),(100,'Cliente 100','cliente100@correo.com','558327304');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_ventas`
--

DROP TABLE IF EXISTS `detalles_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ventas_id` int DEFAULT NULL,
  `productos_id` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ventas_id` (`ventas_id`),
  KEY `productos_id` (`productos_id`),
  CONSTRAINT `detalles_ventas_ibfk_1` FOREIGN KEY (`ventas_id`) REFERENCES `ventas` (`id`),
  CONSTRAINT `detalles_ventas_ibfk_2` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_ventas`
--

LOCK TABLES `detalles_ventas` WRITE;
/*!40000 ALTER TABLE `detalles_ventas` DISABLE KEYS */;
INSERT INTO `detalles_ventas` VALUES (1,72,19,5,634.88),(2,73,32,5,547.25),(3,44,70,4,697.66),(4,77,14,5,797.15),(5,53,97,4,108.50),(6,54,63,1,679.36),(7,70,65,5,935.70),(8,62,57,1,622.39),(9,94,46,5,495.57),(10,68,40,2,297.44),(11,42,34,5,238.39),(12,53,31,3,917.33),(13,100,96,1,217.97),(14,12,10,5,729.20),(15,59,90,2,285.07),(16,64,8,2,827.81),(17,70,13,4,595.24),(18,16,95,3,646.80),(19,48,52,1,25.90),(20,67,55,5,271.81),(21,91,67,4,971.12),(22,13,57,4,698.67),(23,71,16,3,777.44),(24,52,9,5,353.07),(25,81,52,3,736.04),(26,48,22,3,207.23),(27,4,40,1,179.07),(28,18,91,2,203.22),(29,66,56,1,330.03),(30,53,52,1,399.10),(31,11,91,4,649.10),(32,83,48,2,134.82),(33,1,94,1,205.04),(34,90,72,1,233.78),(35,2,98,3,258.14),(36,58,65,2,353.45),(37,77,71,1,685.91),(38,53,75,2,160.99),(39,47,41,5,789.15),(40,73,21,1,116.82),(41,8,67,2,934.91),(42,95,100,2,426.60),(43,74,53,1,178.07),(44,65,10,1,264.52),(45,14,48,2,507.57),(46,88,100,3,767.66),(47,84,38,3,106.52),(48,32,91,5,751.30),(49,73,16,2,665.17),(50,27,68,3,172.72),(51,77,48,2,880.61),(52,98,30,2,432.77),(53,10,19,4,612.08),(54,90,34,5,449.69),(55,56,34,2,816.47),(56,84,14,3,369.91),(57,69,53,1,971.49),(58,52,59,4,63.42),(59,71,28,2,894.56),(60,56,63,4,580.90),(61,88,22,1,73.90),(62,34,52,2,585.20),(63,100,69,4,421.91),(64,99,28,4,824.01),(65,59,49,3,240.37),(66,64,85,3,929.58),(67,71,84,5,301.72),(68,58,57,1,455.17),(69,78,92,5,350.55),(70,97,43,4,535.19),(71,13,75,4,384.78),(72,89,99,5,748.04),(73,46,97,4,695.48),(74,11,68,3,838.80),(75,10,9,5,980.36),(76,69,52,5,671.85),(77,55,47,1,465.22),(78,55,51,4,452.45),(79,26,30,1,339.90),(80,80,98,5,864.45),(81,30,85,3,581.10),(82,39,8,4,67.73),(83,16,85,1,14.09),(84,95,6,2,132.19),(85,91,97,4,237.99),(86,98,29,2,424.85),(87,45,49,4,523.86),(88,65,36,5,64.37),(89,40,83,4,856.77),(90,65,81,4,716.48),(91,75,22,5,863.90),(92,14,18,5,247.58),(93,53,97,5,556.93),(94,60,34,4,681.97),(95,57,25,2,284.44),(96,26,28,4,61.24),(97,20,87,2,517.23),(98,62,96,3,43.88),(99,64,8,5,497.72),(100,24,23,1,722.92);
/*!40000 ALTER TABLE `detalles_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Empleado 1','empleado1@tienda.com','551566814'),(2,'Empleado 2','empleado2@tienda.com','551721930'),(3,'Empleado 3','empleado3@tienda.com','557491016'),(4,'Empleado 4','empleado4@tienda.com','554961382'),(5,'Empleado 5','empleado5@tienda.com','556960151'),(6,'Empleado 6','empleado6@tienda.com','553805713'),(7,'Empleado 7','empleado7@tienda.com','556838454'),(8,'Empleado 8','empleado8@tienda.com','555755904'),(9,'Empleado 9','empleado9@tienda.com','557714546'),(10,'Empleado 10','empleado10@tienda.com','554617859'),(11,'Empleado 11','empleado11@tienda.com','556619630'),(12,'Empleado 12','empleado12@tienda.com','558376127'),(13,'Empleado 13','empleado13@tienda.com','551473064'),(14,'Empleado 14','empleado14@tienda.com','551283933'),(15,'Empleado 15','empleado15@tienda.com','551022793'),(16,'Empleado 16','empleado16@tienda.com','558058507'),(17,'Empleado 17','empleado17@tienda.com','555583868'),(18,'Empleado 18','empleado18@tienda.com','555204881'),(19,'Empleado 19','empleado19@tienda.com','554213965'),(20,'Empleado 20','empleado20@tienda.com','553675924'),(21,'Empleado 21','empleado21@tienda.com','552312728'),(22,'Empleado 22','empleado22@tienda.com','553651993'),(23,'Empleado 23','empleado23@tienda.com','555265135'),(24,'Empleado 24','empleado24@tienda.com','556884092'),(25,'Empleado 25','empleado25@tienda.com','552166130'),(26,'Empleado 26','empleado26@tienda.com','552185540'),(27,'Empleado 27','empleado27@tienda.com','555591969'),(28,'Empleado 28','empleado28@tienda.com','558763253'),(29,'Empleado 29','empleado29@tienda.com','558336187'),(30,'Empleado 30','empleado30@tienda.com','551376413'),(31,'Empleado 31','empleado31@tienda.com','553041761'),(32,'Empleado 32','empleado32@tienda.com','556961778'),(33,'Empleado 33','empleado33@tienda.com','559670661'),(34,'Empleado 34','empleado34@tienda.com','556198950'),(35,'Empleado 35','empleado35@tienda.com','556512522'),(36,'Empleado 36','empleado36@tienda.com','558500226'),(37,'Empleado 37','empleado37@tienda.com','554289903'),(38,'Empleado 38','empleado38@tienda.com','559401581'),(39,'Empleado 39','empleado39@tienda.com','554897247'),(40,'Empleado 40','empleado40@tienda.com','553087388'),(41,'Empleado 41','empleado41@tienda.com','555424855'),(42,'Empleado 42','empleado42@tienda.com','556197890'),(43,'Empleado 43','empleado43@tienda.com','558440696'),(44,'Empleado 44','empleado44@tienda.com','554943896'),(45,'Empleado 45','empleado45@tienda.com','558934205'),(46,'Empleado 46','empleado46@tienda.com','551771298'),(47,'Empleado 47','empleado47@tienda.com','558779220'),(48,'Empleado 48','empleado48@tienda.com','558627959'),(49,'Empleado 49','empleado49@tienda.com','553821872'),(50,'Empleado 50','empleado50@tienda.com','559316067'),(51,'Empleado 51','empleado51@tienda.com','559161367'),(52,'Empleado 52','empleado52@tienda.com','551616036'),(53,'Empleado 53','empleado53@tienda.com','552893965'),(54,'Empleado 54','empleado54@tienda.com','558434873'),(55,'Empleado 55','empleado55@tienda.com','556750252'),(56,'Empleado 56','empleado56@tienda.com','551883387'),(57,'Empleado 57','empleado57@tienda.com','551800590'),(58,'Empleado 58','empleado58@tienda.com','551205574'),(59,'Empleado 59','empleado59@tienda.com','554474848'),(60,'Empleado 60','empleado60@tienda.com','552402116'),(61,'Empleado 61','empleado61@tienda.com','551664095'),(62,'Empleado 62','empleado62@tienda.com','559298942'),(63,'Empleado 63','empleado63@tienda.com','555370425'),(64,'Empleado 64','empleado64@tienda.com','556717949'),(65,'Empleado 65','empleado65@tienda.com','551780556'),(66,'Empleado 66','empleado66@tienda.com','559312021'),(67,'Empleado 67','empleado67@tienda.com','557026655'),(68,'Empleado 68','empleado68@tienda.com','557345967'),(69,'Empleado 69','empleado69@tienda.com','555118157'),(70,'Empleado 70','empleado70@tienda.com','557698962'),(71,'Empleado 71','empleado71@tienda.com','552005722'),(72,'Empleado 72','empleado72@tienda.com','553011504'),(73,'Empleado 73','empleado73@tienda.com','556053718'),(74,'Empleado 74','empleado74@tienda.com','551237665'),(75,'Empleado 75','empleado75@tienda.com','556027102'),(76,'Empleado 76','empleado76@tienda.com','551031243'),(77,'Empleado 77','empleado77@tienda.com','552971712'),(78,'Empleado 78','empleado78@tienda.com','552998849'),(79,'Empleado 79','empleado79@tienda.com','558754783'),(80,'Empleado 80','empleado80@tienda.com','554155308'),(81,'Empleado 81','empleado81@tienda.com','551236989'),(82,'Empleado 82','empleado82@tienda.com','557983933'),(83,'Empleado 83','empleado83@tienda.com','551413985'),(84,'Empleado 84','empleado84@tienda.com','558085540'),(85,'Empleado 85','empleado85@tienda.com','559128739'),(86,'Empleado 86','empleado86@tienda.com','555060992'),(87,'Empleado 87','empleado87@tienda.com','559662029'),(88,'Empleado 88','empleado88@tienda.com','551597642'),(89,'Empleado 89','empleado89@tienda.com','556676457'),(90,'Empleado 90','empleado90@tienda.com','551375961'),(91,'Empleado 91','empleado91@tienda.com','554338253'),(92,'Empleado 92','empleado92@tienda.com','554625105'),(93,'Empleado 93','empleado93@tienda.com','553015020'),(94,'Empleado 94','empleado94@tienda.com','556338032'),(95,'Empleado 95','empleado95@tienda.com','552573629'),(96,'Empleado 96','empleado96@tienda.com','555651719'),(97,'Empleado 97','empleado97@tienda.com','552671971'),(98,'Empleado 98','empleado98@tienda.com','551505903'),(99,'Empleado 99','empleado99@tienda.com','552138453'),(100,'Empleado 100','empleado100@tienda.com','556479463');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodos_pago`
--

DROP TABLE IF EXISTS `metodos_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodos_pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_pago`
--

LOCK TABLES `metodos_pago` WRITE;
/*!40000 ALTER TABLE `metodos_pago` DISABLE KEYS */;
INSERT INTO `metodos_pago` VALUES (1,'Efectivo'),(2,'Tarjeta de Crédito'),(3,'Tarjeta de Débito'),(4,'Transferencia'),(5,'PayPal');
/*!40000 ALTER TABLE `metodos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `categorias_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categorias_id` (`categorias_id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Producto 1',440.29,54,59),(2,'Producto 2',348.12,138,42),(3,'Producto 3',340.86,54,72),(4,'Producto 4',240.88,193,59),(5,'Producto 5',365.30,193,83),(6,'Producto 6',173.36,106,33),(7,'Producto 7',321.02,137,81),(8,'Producto 8',210.05,149,53),(9,'Producto 9',137.28,16,90),(10,'Producto 10',435.44,161,38),(11,'Producto 11',332.51,124,97),(12,'Producto 12',86.42,86,51),(13,'Producto 13',5.40,73,20),(14,'Producto 14',233.32,23,53),(15,'Producto 15',282.28,88,92),(16,'Producto 16',88.89,191,57),(17,'Producto 17',10.69,180,22),(18,'Producto 18',355.28,62,66),(19,'Producto 19',234.44,132,97),(20,'Producto 20',387.75,151,43),(21,'Producto 21',55.63,138,55),(22,'Producto 22',247.90,113,70),(23,'Producto 23',494.22,199,72),(24,'Producto 24',205.31,162,95),(25,'Producto 25',37.46,4,12),(26,'Producto 26',103.88,56,10),(27,'Producto 27',110.23,138,26),(28,'Producto 28',499.40,122,81),(29,'Producto 29',316.83,131,1),(30,'Producto 30',178.52,50,8),(31,'Producto 31',288.48,91,31),(32,'Producto 32',428.53,46,2),(33,'Producto 33',412.76,180,6),(34,'Producto 34',39.66,74,53),(35,'Producto 35',314.04,121,35),(36,'Producto 36',218.10,25,71),(37,'Producto 37',26.09,120,25),(38,'Producto 38',365.17,156,88),(39,'Producto 39',376.44,76,92),(40,'Producto 40',179.44,69,41),(41,'Producto 41',162.21,43,65),(42,'Producto 42',129.23,86,45),(43,'Producto 43',395.66,23,47),(44,'Producto 44',193.36,197,44),(45,'Producto 45',484.39,71,93),(46,'Producto 46',281.99,71,95),(47,'Producto 47',464.47,125,13),(48,'Producto 48',240.06,149,13),(49,'Producto 49',460.69,139,5),(50,'Producto 50',129.28,186,79),(51,'Producto 51',360.08,48,85),(52,'Producto 52',268.65,108,18),(53,'Producto 53',52.10,180,45),(54,'Producto 54',394.29,192,17),(55,'Producto 55',475.52,165,88),(56,'Producto 56',394.24,33,57),(57,'Producto 57',379.63,117,16),(58,'Producto 58',468.28,107,24),(59,'Producto 59',281.91,110,5),(60,'Producto 60',199.79,23,45),(61,'Producto 61',410.01,71,94),(62,'Producto 62',132.26,98,53),(63,'Producto 63',85.49,2,92),(64,'Producto 64',348.31,153,35),(65,'Producto 65',233.40,61,79),(66,'Producto 66',414.89,194,88),(67,'Producto 67',283.19,13,76),(68,'Producto 68',467.56,111,83),(69,'Producto 69',424.63,90,67),(70,'Producto 70',107.82,187,85),(71,'Producto 71',42.77,31,84),(72,'Producto 72',136.58,140,48),(73,'Producto 73',498.84,176,82),(74,'Producto 74',485.64,29,55),(75,'Producto 75',203.35,184,25),(76,'Producto 76',74.89,104,5),(77,'Producto 77',149.38,180,13),(78,'Producto 78',182.20,79,12),(79,'Producto 79',276.83,194,31),(80,'Producto 80',377.14,46,78),(81,'Producto 81',166.55,40,59),(82,'Producto 82',128.25,61,83),(83,'Producto 83',449.02,171,78),(84,'Producto 84',114.27,93,22),(85,'Producto 85',14.59,198,59),(86,'Producto 86',37.84,155,65),(87,'Producto 87',472.98,97,68),(88,'Producto 88',470.44,178,78),(89,'Producto 89',354.87,49,87),(90,'Producto 90',458.89,14,55),(91,'Producto 91',427.15,123,86),(92,'Producto 92',259.64,92,42),(93,'Producto 93',172.87,198,25),(94,'Producto 94',108.61,56,56),(95,'Producto 95',182.60,113,55),(96,'Producto 96',152.13,80,65),(97,'Producto 97',198.03,74,40),(98,'Producto 98',365.68,67,91),(99,'Producto 99',208.70,77,25),(100,'Producto 100',363.25,191,64);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clientes_id` int DEFAULT NULL,
  `empleados_id` int DEFAULT NULL,
  `metodos_pago_id` int DEFAULT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_id` (`clientes_id`),
  KEY `empleados_id` (`empleados_id`),
  KEY `metodos_pago_id` (`metodos_pago_id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`empleados_id`) REFERENCES `empleados` (`id`),
  CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`metodos_pago_id`) REFERENCES `metodos_pago` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,16,60,2,'2024-04-11'),(2,76,31,3,'2024-08-19'),(3,16,88,5,'2024-03-18'),(4,39,93,3,'2024-09-14'),(5,20,28,1,'2024-03-14'),(6,45,20,3,'2024-05-17'),(7,53,9,2,'2024-06-05'),(8,98,46,2,'2024-06-12'),(9,72,93,3,'2024-11-22'),(10,59,5,1,'2024-07-22'),(11,60,30,5,'2024-02-24'),(12,9,52,1,'2024-12-07'),(13,16,91,2,'2024-11-07'),(14,68,28,2,'2024-06-06'),(15,69,54,1,'2024-12-21'),(16,31,94,2,'2024-12-28'),(17,68,40,5,'2024-02-08'),(18,76,59,3,'2024-11-26'),(19,9,12,3,'2024-10-21'),(20,22,24,1,'2024-02-07'),(21,23,42,2,'2024-04-17'),(22,81,54,4,'2024-01-17'),(23,1,57,5,'2024-12-16'),(24,32,43,3,'2024-01-02'),(25,11,83,2,'2024-11-21'),(26,92,35,2,'2024-06-18'),(27,89,60,4,'2024-08-14'),(28,47,74,2,'2024-06-07'),(29,57,9,4,'2024-10-20'),(30,23,14,4,'2024-07-17'),(31,90,31,3,'2024-09-07'),(32,52,69,3,'2024-04-01'),(33,82,93,1,'2024-04-13'),(34,38,15,1,'2024-11-17'),(35,67,72,5,'2024-03-02'),(36,7,52,4,'2024-02-14'),(37,70,67,1,'2024-06-03'),(38,90,88,3,'2024-08-17'),(39,93,6,3,'2024-04-14'),(40,50,91,1,'2024-07-17'),(41,18,64,4,'2024-11-07'),(42,92,7,2,'2024-03-18'),(43,67,67,2,'2024-03-22'),(44,56,40,1,'2024-02-01'),(45,46,94,5,'2024-01-21'),(46,65,53,1,'2024-05-09'),(47,10,22,5,'2024-10-01'),(48,59,4,4,'2024-09-25'),(49,3,85,1,'2024-08-27'),(50,72,95,1,'2024-03-11'),(51,62,60,2,'2024-03-12'),(52,49,29,1,'2024-03-06'),(53,44,9,1,'2024-11-06'),(54,78,19,3,'2024-10-13'),(55,31,42,3,'2024-07-03'),(56,78,84,4,'2024-07-23'),(57,38,82,2,'2024-04-17'),(58,55,88,5,'2024-12-01'),(59,17,30,2,'2024-10-17'),(60,38,63,2,'2024-05-08'),(61,15,84,4,'2024-09-05'),(62,84,72,4,'2024-03-08'),(63,58,82,5,'2024-06-13'),(64,60,81,2,'2024-08-18'),(65,100,40,1,'2024-09-02'),(66,38,53,3,'2024-01-26'),(67,46,23,5,'2024-08-22'),(68,96,17,3,'2024-09-24'),(69,89,69,3,'2024-11-03'),(70,1,94,5,'2024-07-02'),(71,91,6,1,'2024-06-06'),(72,5,90,1,'2024-10-25'),(73,63,56,3,'2024-08-25'),(74,19,32,2,'2024-07-24'),(75,2,36,4,'2024-10-06'),(76,6,50,4,'2024-04-22'),(77,65,18,3,'2024-01-27'),(78,80,32,2,'2024-01-03'),(79,40,84,1,'2024-08-21'),(80,87,35,1,'2024-03-23'),(81,8,15,1,'2024-05-14'),(82,34,51,3,'2024-05-02'),(83,43,23,1,'2024-02-13'),(84,41,80,5,'2024-11-08'),(85,49,42,4,'2024-02-19'),(86,35,35,1,'2024-12-25'),(87,100,59,5,'2024-06-11'),(88,23,31,2,'2024-06-18'),(89,44,72,3,'2024-06-13'),(90,19,75,3,'2024-07-01'),(91,98,10,2,'2024-12-19'),(92,33,65,2,'2024-09-25'),(93,25,53,2,'2024-08-21'),(94,63,37,4,'2024-04-15'),(95,8,51,1,'2024-11-16'),(96,27,81,2,'2024-04-26'),(97,87,6,2,'2024-02-01'),(98,82,76,1,'2024-04-25'),(99,25,14,5,'2024-05-05'),(100,45,97,4,'2024-07-14');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-06 13:25:02
