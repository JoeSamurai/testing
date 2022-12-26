CREATE DATABASE  IF NOT EXISTS `trade11_5` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trade11_5`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: trade11_5
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `orderpickuppoint`
--

DROP TABLE IF EXISTS `orderpickuppoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderpickuppoint` (
  `PickUpID` int NOT NULL,
  `PickUpName` varchar(120) NOT NULL,
  PRIMARY KEY (`PickUpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderpickuppoint`
--

LOCK TABLES `orderpickuppoint` WRITE;
/*!40000 ALTER TABLE `orderpickuppoint` DISABLE KEYS */;
INSERT INTO `orderpickuppoint` VALUES (1,'410172, г. Кропоткин, ул. Северная, 13'),(2,'125837, г. Кропоткин, ул. Шоссейная, 40'),(3,'125061, г. Кропоткин, ул. Подгорная, 8'),(4,'660007, г.Кропоткин, ул. Октябрьская, 19'),(5,'614753, г. Кропоткин, ул. Полевая, 35'),(6,'426030, г. Кропоткин, ул. Маяковского, 44'),(7,'400562, г. Кропоткин, ул. Зеленая, 32'),(8,'625560, г. Кропоткин, ул. Некрасова, 12'),(9,'630201, г. Кропоткин, ул. Комсомольская, 17'),(10,'190949, г. Кропоткин, ул. Мичурина, 26');
/*!40000 ALTER TABLE `orderpickuppoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderproduct`
--

DROP TABLE IF EXISTS `orderproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderproduct` (
  `OrderID` int NOT NULL,
  `ProductArticleNumber` varchar(100) NOT NULL,
  PRIMARY KEY (`OrderID`,`ProductArticleNumber`),
  KEY `ProductArticleNumber` (`ProductArticleNumber`),
  CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orderr` (`OrderID`),
  CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`ProductArticleNumber`) REFERENCES `product` (`ProductArticleNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderproduct`
--

LOCK TABLES `orderproduct` WRITE;
/*!40000 ALTER TABLE `orderproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderr`
--

DROP TABLE IF EXISTS `orderr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderr` (
  `OrderID` int NOT NULL,
  `OrderStatus` text NOT NULL,
  `OrderDeliveryDate` date NOT NULL,
  `OrderPickupPoint` int NOT NULL,
  `OrderInside` varchar(25) NOT NULL,
  `OrderDate` date NOT NULL,
  `OrderSurname` text NOT NULL,
  `OrderName` text NOT NULL,
  `OrderPatronymic` text NOT NULL,
  `OrderCode` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `OrderPickupPoint` (`OrderPickupPoint`),
  CONSTRAINT `orderr_ibfk_1` FOREIGN KEY (`OrderPickupPoint`) REFERENCES `orderpickuppoint` (`PickUpID`),
  CONSTRAINT `orderr_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderr`
--

LOCK TABLES `orderr` WRITE;
/*!40000 ALTER TABLE `orderr` DISABLE KEYS */;
INSERT INTO `orderr` VALUES (1,'Новый ','2016-05-20',1,'B111C5, 5, T238C7, 7  ','2010-05-20','Маслов','Максим','Иванович',811),(2,'Новый ','2017-05-20',2,'E112C6, 5, T238C7,9','2011-05-20','Симонов','Михаил','Тимурович',812),(3,'Новый ','2018-05-20',3,'M112C8, 4, L293S9, 8','2012-05-20','Симонов','Михаил','Тимурович',813),(4,'Новый ','2019-05-20',4,'M294G9, 6, S384K2, 1','2013-05-20','Симонов','Михаил','Тимурович',814),(5,'Новый ','2020-05-20',5,'W874J3, 2, Q836H4, 1 ','2014-05-20','Симонов','Михаил','Тимурович',815),(6,'Новый ','2021-05-20',6,'O947D8, 4, R983K4, 1','2015-05-20','Павлова','Ксения','Михайловна',816),(7,'Новый ','2022-05-20',7,'H497J3, 2, N394K2, 5 ','2016-05-20','Павлова','Ксения','Михайловна',817),(8,'Завершен','2023-05-20',8,'X846D3, 1, P495H8, 3','2017-05-20','Павлова','Ксения','Михайловна',818),(9,'Новый ','2024-05-20',9,'V378J3, 2, K284U8, 3','2018-05-20','Трифонов','Григорий','Юрьевич',819),(10,'Завершен','2025-05-20',10,'N387I8, 6, I483H3, 7','2019-05-20','Трифонов','Григорий','Юрьевич',820);
/*!40000 ALTER TABLE `orderr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodcategory`
--

DROP TABLE IF EXISTS `prodcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodcategory` (
  `CategoryID` int NOT NULL,
  `CategoryName` varchar(20) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodcategory`
--

LOCK TABLES `prodcategory` WRITE;
/*!40000 ALTER TABLE `prodcategory` DISABLE KEYS */;
INSERT INTO `prodcategory` VALUES (1,'Постельные ткани'),(2,'Детские ткани'),(3,'Ткани для изделий');
/*!40000 ALTER TABLE `prodcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodmanufacturer`
--

DROP TABLE IF EXISTS `prodmanufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodmanufacturer` (
  `ManufacturerID` int NOT NULL,
  `ManufacturerName` varchar(20) NOT NULL,
  PRIMARY KEY (`ManufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodmanufacturer`
--

LOCK TABLES `prodmanufacturer` WRITE;
/*!40000 ALTER TABLE `prodmanufacturer` DISABLE KEYS */;
INSERT INTO `prodmanufacturer` VALUES (1,'БТК Текстиль'),(2,'Империя ткани'),(3,'Комильфо'),(4,'Май Фабрик');
/*!40000 ALTER TABLE `prodmanufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodsupplier`
--

DROP TABLE IF EXISTS `prodsupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodsupplier` (
  `SupplierID` int NOT NULL,
  `SupplierName` varchar(20) NOT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodsupplier`
--

LOCK TABLES `prodsupplier` WRITE;
/*!40000 ALTER TABLE `prodsupplier` DISABLE KEYS */;
INSERT INTO `prodsupplier` VALUES (1,'Раута'),(2,'ООО Афо-Тек'),(3,'ГК Петров');
/*!40000 ALTER TABLE `prodsupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductArticleNumber` varchar(100) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `ProductDescription` varchar(220) NOT NULL,
  `ProductCategory` int NOT NULL,
  `ProductPhoto` varchar(20) DEFAULT NULL,
  `ProductManufacturer` int NOT NULL,
  `ProductCost` decimal(19,4) NOT NULL,
  `ProductDiscountAmount` int DEFAULT NULL,
  `ProductQuantityInStock` int NOT NULL,
  `ProductStatus` text NOT NULL,
  `ProductUnit` text NOT NULL,
  `ProductMaxDiscount` int NOT NULL,
  `ProductSupplier` int NOT NULL,
  PRIMARY KEY (`ProductArticleNumber`),
  KEY `ProductCategory` (`ProductCategory`),
  KEY `ProductManufacturer` (`ProductManufacturer`),
  KEY `ProductSupplier` (`ProductSupplier`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ProductCategory`) REFERENCES `prodcategory` (`CategoryID`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`ProductManufacturer`) REFERENCES `prodmanufacturer` (`ManufacturerID`),
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`ProductSupplier`) REFERENCES `prodsupplier` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('B111C5','Поплин «Розовый жемчуг»','Поплин «Розовый жемчуг» шириной 220 см с изображением на ткани — крупные цветы, чайная роза; цветовая гамма: бледно-розовая.',1,'B111C5.jpg',1,8500.0000,4,6,'Продается','Рулон',5,1),('C384D8','Сатин «Дымчатая роза» однотонный','Сатин «Дымчатая роза» однотонный шириной 250 см с изображением на ткани цветовая гамма: розовый зефир.',1,'',2,1133.0000,3,4,'Продается','Рулон',10,1),('D938K3','Фланель однотонная светлая','Фланель однотонная светлая оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: голубая, желтая, розовая, сирень, фисташка.',3,'',4,1300.0000,4,10,'Продается','Рулон',10,3),('E112C6','Муслин «Bej»','Муслин «Bej» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: кофе с молоком.',2,'E112C6.jpg',2,10500.0000,3,13,'Продается','Рулон',15,2),('F374S8','Фланель рубашечная','Фланель рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.',3,'',1,2100.0000,2,5,'Продается','Рулон',5,1),('H483D9','Фланель детская H483D9','Фланель детская 21212-2 шириной 90 см с изображением на ткани — россыпь звездочек; цветовая гамма: баклажан, оранжевый, розовая.',2,'',3,318.0000,2,18,'Продается','Рулон',5,2),('H497J3','Ситец детский','Ситец детский шириной 95 см с изображением на ткани — котята, сердечки; цветовая гамма: белоземельная, оранжевый.',2,'',1,523.0000,2,8,'Продается','Рулон',5,3),('I483H3','Ткань поплин «Вивьен»','Ткань поплин «Вивьен» шириной 220 см с изображением на ткани — горошек; цветовая гамма: синяя, фисташка.',1,'',1,11300.0000,2,5,'Продается','Рулон',10,2),('K284U8','Бязь детская «Самолеты»','Бязь детская «Самолеты» шириной 150 см с изображением на ткани — игрушки, самолетики; цветовая гамма: белая, зеленая, синяя. ',2,'',2,5100.0000,3,2,'Продается','Рулон',25,3),('K839K3','Плюш белый в клетку','Плюш белый в клетку шириной 180 см с изображением на ткани — клетка, однотонный; цветовая гамма: белая, однотонная.',2,'K839K3.jpg',2,765.0000,2,3,'Продается','Рулон',5,3),('L293S9','Плюш розовый гладкий','Плюш розовый гладкий шириной 180 см с изображением на ткани — однотонный; цветовая гамма: однотонная, розовая.',2,'L293S9.jpg',3,30000.0000,3,2,'Продается','Рулон',40,1),('M112C8','Бязь детская «Совята»','Бязь детская «Совята» шириной 150 см с изображением на ткани — совы; цветовая гамма: бордо, желтая, салатовая.',2,'M112C8.jpg',2,26000.0000,2,14,'Продается','Рулон',20,1),('M294G9','Полотно вафельное «8 марта»','Полотно вафельное «8 марта» шириной 50 см с изображением на ткани — белые розы; цветовая гамма: розовая.',3,'M294G9.jpg',2,5130.0000,2,1,'Продается','Рулон',5,1),('M398S9','Поплин Мокко','Поплин Мокко 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: коричневая, кофе, шоколад.',1,'M398S9.jpg',4,1800.0000,2,6,'Продается','Рулон',15,3),('N283K3','Сатин «Миндальный» однотонный','Сатин «Миндальный» однотонный шириной 250 см с изображением на ткани цветовая гамма: миндаль. ',1,'N283K3.jpg',3,6500.0000,3,7,'Продается','Рулон',5,1),('N385L2','Сатин «Фисташковый» однотонный','Сатин «Фисташковый» однотонный шириной 250 см с изображением на ткани цветовая гамма: фисташка.',1,'',1,7000.0000,2,2,'Продается','Рулон',20,3),('N387I8','Полотно вафельное «Кухня»','Полотно вафельное «Кухня» шириной 50 см с изображением на ткани — кухня; цветовая гамма: желтая, малина. ',3,'',1,1000.0000,3,5,'Продается','Рулон',15,2),('N394K2','Ткань поплин «Лакшери»','Ткань поплин «Лакшери» шириной 220 см с изображением на ткани — надписи, сердечки; цветовая гамма: белая, красная, черная. ',1,'',2,30660.0000,4,15,'Продается','Рулон',10,2),('O947D8','Ткань для скатертей под рогожку','Ткань для скатертей под рогожку «рис 18825» шириной 150 см с изображением на ткани — ромашки, россыпь цветов; цветовая гамма: красная, синяя.',3,'',4,3550.0000,3,9,'Продается','Рулон',10,2),('P495H8','Поплин «Густав»','Поплин «Густав» шириной 220 см с изображением на ткани — листья, папортник; цветовая гамма: зеленая, светло-серая.',1,'',3,1000.0000,2,14,'Продается','Рулон',15,1),('Q836H4','Фланель рубашечная','Фланель арт 535 рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.',3,'',4,1350.0000,4,7,'Продается','Рулон',5,1),('R748K3','Поплин Морская волна','Поплин Морская волна 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: аквамарин, бирюзовая.',1,'',4,2300.0000,2,6,'Продается','Рулон',15,3),('R983K4','Сатин «Серо-бежевый» однотонный','Сатин «Серо-бежевый» однотонный шириной 250 см с изображением на ткани цветовая гамма: серо-бежевая.',1,'',2,1645.0000,2,13,'Продается','Рулон',15,2),('S384K2','Фланель черная','Фланель черная оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: черная.',3,'S384K2.jpg',1,69000.0000,4,2,'Продается','Рулон',40,3),('T238C7','Муслин «Gri»','Муслин «Gri» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: серая.',2,'T238C7.jpg',1,6500.0000,2,12,'Продается','Рулон',15,2),('U947E9','Муслин белый горошек на однотонном фоне','Муслин белый горошек на однотонном фоне шириной 150 см с изображением на ткани — мелкий горошек; цветовая гамма: желтая.',2,'',2,3411.0000,3,4,'Продается','Рулон',10,3),('V378J3','Фланель детская H483D9','Ситец детский шириной 95 см с изображением на ткани — котенок, облака, полумесяц, радуга; цветовая гамма: бледно-розовая, голубая, салатовая, серо-бежевая.',2,'',3,2400.0000,3,14,'Продается','Рулон',15,3),('W874J3','Ткань поплин «Натурель»','Ткань поплин «Натурель» шириной 220 см с изображением на ткани — мелкие цветы; цветовая гамма: пепельная, розовая. ',1,'',1,1600.0000,3,9,'Продается','Рулон',5,3),('X846D3','Фланель детская H483D9','Ситец детский шириной 95 см с изображением на ткани — жираф, полумесяц, пчелки; цветовая гамма: темно-фиолетовая.',2,'',2,9300.0000,3,5,'Продается','Рулон',25,1),('Z937S2','Поплин Голубой','Поплин Голубой 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: голубая.',1,'',1,9000.0000,2,15,'Продается','Рулон',10,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleID` int NOT NULL,
  `RoleName` varchar(20) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Администратор'),(2,'Менеджер'),(3,'Клиент');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL,
  `UserSurname` varchar(50) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `UserPatronymic` varchar(50) DEFAULT NULL,
  `UserLogin` text NOT NULL,
  `UserPassword` text NOT NULL,
  `UserRole` int NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `UserRole` (`UserRole`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`UserRole`) REFERENCES `role` (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Лавров','Богдан','Львович','8lf0g@yandex.ru','2L6KZG',1),(2,'Смирнова','Полина','Фёдоровна','1zx8@yandex.ru','uzWC67',1),(3,'Полякова','София','Данииловна','x@mail.ru','8ntwUp',1),(4,'Чеботарева','Марина','Данииловна','34d@gmail.com','YOyhfR',2),(5,'Ермолов','Адам','Иванович','pxacl@mail.ru','RSbvHv',2),(6,'Васильев','Андрей','Кириллович','7o1@gmail.com','rwVDh9',2),(7,'Маслов','Максим','Иванович','1@gmail.com','LdNyos',3),(8,'Симонов','Михаил','Тимурович','iut@gmail.com','gynQMT',3),(9,'Павлова','Ксения','Михайловна','e3t@outlook.com','AtnDjr',3),(10,'Трифонов','Григорий','Юрьевич','41clb6o2g@yandex.ru','JlFRCZ',3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-26 20:54:05
