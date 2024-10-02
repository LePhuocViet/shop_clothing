-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: clothing
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('1','admin','$2a$10$M/Eiqy4XMj8P2VADSF9jW.owdMcx2Q8.sJ49jlt6wgdf9qThtCuOu'),('2','user1','$2a$10$M/Eiqy4XMj8P2VADSF9jW.owdMcx2Q8.sJ49jlt6wgdf9qThtCuOu'),('3','user2','$2a$10$M/Eiqy4XMj8P2VADSF9jW.owdMcx2Q8.sJ49jlt6wgdf9qThtCuOu');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_roles`
--

DROP TABLE IF EXISTS `account_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_roles` (
  `account_id` varchar(255) NOT NULL,
  `roles_name` varchar(255) NOT NULL,
  PRIMARY KEY (`account_id`,`roles_name`),
  KEY `fk_accrol_on_role` (`roles_name`),
  CONSTRAINT `fk_accrol_on_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_accrol_on_role` FOREIGN KEY (`roles_name`) REFERENCES `role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_roles`
--

LOCK TABLES `account_roles` WRITE;
/*!40000 ALTER TABLE `account_roles` DISABLE KEYS */;
INSERT INTO `account_roles` VALUES ('1','ADMIN'),('1','USER'),('2','USER'),('3','USER');
/*!40000 ALTER TABLE `account_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` varchar(255) NOT NULL,
  `quantity` int DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CART_ON_CUSTOMER` (`customer_id`),
  KEY `FK_CART_ON_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CART_ON_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_CART_ON_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('10',1,'2','3'),('9',4,'2','9');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('1','Clothing'),('2','Menu');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES ('1','Red'),('2','Yellow'),('3','Green'),('4','Black');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `account_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_customer_account` (`account_id`),
  CONSTRAINT `FK_CUSTOMER_ON_ACCOUNT` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('1','username1','06 Báº¡ch Äáº±ng, ÄÃ  Náºµng','08394875947','username1@gmail.com','2'),('2','username2','36 Tháº¡ch HÅ©, ÄÃ  Náºµng','03948495867','username2@gmail.com','3');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `id` varchar(255) NOT NULL,
  `quantity` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ORDERITEM_ON_ORDER` (`order_id`),
  KEY `FK_ORDERITEM_ON_PRODUCT` (`product_id`),
  CONSTRAINT `FK_ORDERITEM_ON_ORDER` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_ORDERITEM_ON_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES ('04727f8b-250d-448c-bb0c-117ae0fc7874',1,23.6,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','3'),('13e4f896-f1f4-4db4-a970-866da63f2927',1,45.8,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','2'),('19a9c35d-9d6c-444d-b7ec-89e6494a2ff1',1,87.8,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','6'),('2b0d5f64-1ff3-4166-ae6e-eb7a1c63e650',2,47.4,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','4'),('37979be1-3550-4c1b-b11b-ad03567d7594',1,23.6,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','3'),('4113055c-ba65-4d03-ae26-1d69791614ca',3,37.8,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','5'),('4a5cb065-978a-4cb6-bd5f-e517695aae13',3,37.8,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','5'),('4c6a69fb-10c1-46b7-96d7-742fc5ff2170',1,45.8,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','2'),('4c9331cc-d88d-480c-82fc-308c00af3188',3,37.8,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','5'),('4e61c53b-bf05-4421-b799-e832dc849ffd',1,45.8,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','2'),('4f5b2108-a383-49f8-ad40-be37da31af08',1,45.8,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','2'),('63b02967-9b37-4b8c-9ace-e4863601017d',2,38.4,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','1'),('743c0675-f60f-4866-a23b-040875b76929',2,38.4,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','1'),('82708a8c-0333-410e-b743-1a451445231d',1,54,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','10'),('c4a122ad-af3d-4de4-ac3e-c0e0a224d5cc',1,23.6,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','3'),('cb1ce5fc-a564-41fd-9897-43a43729c37d',2,47.4,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','4'),('d89de9b7-6e18-41aa-9c61-c59509a24b89',2,47.4,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','4'),('de2733fc-d43e-45c5-b429-8d83aea06c18',3,228,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','8'),('ea73d991-fd4d-4e7f-8615-a4f52096f364',2,38.4,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','1'),('ed80988a-5005-424e-998e-98115e79e650',2,47.4,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','4'),('ee96d74c-f293-4d8a-84b6-c3dd800676b4',2,90,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','7'),('fac22488-c4e9-4cbd-a264-7b035b142ced',1,23.6,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','3'),('fe3d9b78-0e77-4007-b486-4d76b92f42a1',3,37.8,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','5'),('ff2ae5aa-1d91-4732-8b74-22e9fe3eb7b0',2,38.4,'ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b','1');
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `total` double NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `datecreate` datetime DEFAULT NULL,
  `datecome` datetime DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ORDER_ON_CUSTOMER` (`customer_id`),
  CONSTRAINT `FK_ORDER_ON_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b',43,1231.7999999999997,'06 Báº¡ch Äáº±ng, ÄÃ  Náºµng','cash','2024-10-02 13:55:30','2024-10-05 13:55:30','1');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` longblob,
  `category_id` varchar(255) DEFAULT NULL,
  `style_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PRODUCT_ON_CATEGORY` (`category_id`),
  KEY `FK_PRODUCT_ON_STYLE` (`style_id`),
  CONSTRAINT `FK_PRODUCT_ON_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_PRODUCT_ON_STYLE` FOREIGN KEY (`style_id`) REFERENCES `style` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('1','Clothing1',19.2,'Clothing description',NULL,'1','1'),('10','Clothing10',54,'Clothing description',NULL,'1','1'),('2','Clothing2',45.8,'Clothing description',NULL,'1','2'),('3','Clothing3',23.6,'Clothing description',NULL,'1','1'),('4','Clothing4',23.7,'Clothing description',NULL,'1','3'),('5','Clothing5',12.6,'Clothing description',NULL,'1','5'),('6','Clothing6',87.8,'Clothing description',NULL,'1','4'),('7','Clothing7',45,'Clothing description',NULL,'1','1'),('8','Clothing8',76,'Clothing description',NULL,'1','2'),('9','Clothing9',78.7,'Clothing description',NULL,'1','3'),('9b115ef4-ac24-4bec-821d-1b87e672ad96','clothingtest',30,'clothingtest',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\\\0\0‹\0\0\0¼óÚ‰\0\0\0`PLTEÿôw¤U)ü\ÄKÙ…,½X\Ðw%\0\ï\ï\îÿÿÿ\è¾Aõ²G\ã”4\ì¤=SXC	J4m­QXœJþ\ËbJˆ@¸d\'ÿýˆÿ\á‰s[‘|5-o%½¢?ð\ÛbÿúÀ ¡\ËÌ½.\Çb\í\0\0 \0IDATx\Ú\ì\éŽ\â:F#ÿ¸Ž\ÑÈ‘Œ­8	\ïÿ–×®òžÍ¦{€AxF½\ZšC\ås­\é®\Ï\Í\×÷\èOŽvÿ\Ò\Ë\è·\×îš\Ël×²|\áþòÑž\ÎrpK._¸¿x´\ï>\Ü-ó\Õò…û[G{ª\0-\Z.|!\é\î\ï]\ä\0ö:2\ÍF6œ\ï\îOŽR`+\ÇNÀ\êFd=\áþü(å–¥\êD‡\Ëð\á¦ù÷\ÇGÁNG\á\Ù_\Ðý\Â}ü\èŒl»l‰«/\Ü]¶\Â|?¹/;\å\é~\á>z\Ô\n\î \"[{Ó”\Óý\Â}ô¨9û‰{™ˆ÷°¯9º_¸Á\Õ9[\n;\ãU¸«½-\Ü÷NƒQ7\ë\'³\"\Ý\å]\í\ã\Í\á*+\n)[øzš]ð†aù\Âm?\nžGQ˜\àf\ïˆY¸\"Ð•ô·ý¨%7FÁ¥\ÑÏ„@º6š\än\ëQ»›yOö±4˜\Ä\r©\ë$þÂ­.=€‹;zQ0\ÛX¤á§±\ØÔ¾pk\à\Îa7--\"\à\0\Ù\îz¼\æ‘ñ›/\\¯¸~7£º¸°©\ÍÇLga9/\Ù=>n\á¬‹f\Ñp\Í/é¼ƒmº,†çµ…¬™O3\í?nO%¥1$\Z\Î\×®µG††K§#¸(r÷y\é\Ëo–¯\\ú‡;»‚˜=S\éF+‚õq½á† aWx\"\åÓ†ò–6±Bô\Ép¡pk¹r^ÃC6B†\ÃEa{Zþ¤3G¨ŠisG%ŒH÷\áb\á&3¨¹Œ²x\ÈØœ®¥›\ìi\éSBe\Ó<™Ò¶öfþ¹D¥¤ý\Ç\ÂÅ¢3¯vT‹¹°\Ñ$\Û]®\n\â˜-„\Þt\ã3bAÞ \íb\È\Öß’D\å\çÁµ\Æ\ÃG°%³ô(&\î¨\Â\èUAŠBaº\Ñlñü:/¿a\Ô\á•\îóÛ²(fùºM\'\ì\ã˜$wy\\\Ãöv\n\×FÁNö˜\n³\Í\Ñú˜neæŸ’,ç«‚£\ÇÆ‹g´ùÎ©‚E{\ÆÖ¹cK„‹½IA¾\æŸFs´ðš\Íù.J¼\n­oI*gf\Ý\Î\áZsT.J‚dþ	¤,§P˜7‡\é\çÁ\í£\0¯·ö\ä:=`#O%÷V\Ö.û¸\Ô\Å#Ëõ‘\Ä\ê[b\æ\ê\á*o“ñ{ƒŠn\ÜK‹4ûU¥3Âµl‡\ØG’þ*Iž’~\Ü`¸\éÁ)\Â;«ŠµX“@B\Ü\Ù\íd.ó›e40·\æÞ‰ƒýWÿš§	ª¹Â»IÐµ¡[×´„×…œm¬\ÛH„úÊ¦7\ÝÏ‚\Ä4=KC†\Âkœö³zº\Î\Z­tl\Ã[(BñM$\ÎÅ‡Áµ›–=ß§dÁ@Á½|\Æ1\í\Ðýhr\Å!¨`Ð©Obÿ.\â?Ls½*\Ð`·sf60nôÞ.]\Ø\Ë\"[@;\å>5ì¦„û \ãc\à‚\äZje5w\Õú\\\ËKfl·òi\è\Ø\ét|\\/¹[Ç¬²\ÐWŸ\ÇôzK÷\Ói‚„ \ãß€[‚Üº\Íû¯PÛ«8bj…µÁš(\Ô¦\Ø÷„€÷ý?\×\Í\à\Ù1<ºœò ¹G)Z\Ø\Ë\áv\Ì\Zc´ø\ã»`\Ä\ïwQ¾l\ãJ7\Ëv+Bðróß°—?7d$N’ÀlSÞ¯\Ëb<]HX-´\Ïw©}\é¯\ÃÕŒ0H¥y\Ã=N¥1\Æx\ÑõŽ\Ér[K‰xaK8\Ð\'Ð‡Ÿ\r\Î\ÂI\ÅqZ74A.‘8\\‡p‰\Ñ}k¸>\áÏ•\Z\Í\ëcz\Ä\ÒM\0¬f\ZŠ\ç)\\q’\'hôX\n÷­\ÐEwyk¸>s\ê\'ð\ÜóÅ±¼ú\áš”\Ä\Ú\"4Á­y/@t\çw†‹\ÝrX\Ë\Ã KXy¾o\È,L‡	ðv¸Â²%õp\á½ðIÝ·…«ö]R\ËW«Øˆ\á\àÂ\ÅIU\Ì\ÆÍªÀ\Z\á®w´cþ\Ép³)±mÀw0’`¹gšØšÏµ°H#\\\ÂW;Z\â\×,¸\è\áª!õ,\Ý*JÙ‚!^¹Í­Jj\Ñh¸õpÁ·€py\Ýhƒ!Ü’ñ\Êóò\Z¸IAL\ä‡2À&ž\ÅZ\ìR\r·\Ñ\Ów¨†\Ë\Üafºh(u\Ù\ç\×ÀmžY1…N¶\é3\Å\Û)(1\ÈÊ„L\ëŽh1\æ\Õ?\0¾Xöš£¡\Äe÷\Êüd¸*Xz«Kõ¥xEL‚WÃ•¢M~\nw¾£ý,,T4õ\n¸\Ò\Õ¼\áb?,õlSqZ6$Á…l]–À­\Ó\àzA¥³\ï\ä&\Ò\Ñk\×*L´<®¥%Š<!\Ú[\êq\á-\Ü\Ñe®¬\ÎH”p©\ï4\å¶=P\Æ\àZHž\n·\Ä.«ˆ‹`\ÃQø\rj¨†[­š¸P2µûYwqh\å¸8\ÂY¤ž\ïŠe\r\å(Óª\Å\Ëu}\Ô\ÑMJ\n\Ç9‚¸\ê\Ý\\–j.uŽ¸\Ô\Û!¹\í~Ÿ\í¹]Ž\î´wwð†\ëZO÷øm]†¶u?ópgL<©­\í¥H^˜\î\Ò?9YžÃ­AÖ¥\ÄÃ³ýÏ¡.[3cl·Rs‚FóE¡³\ÐNS\Ö\Ë-^—öu•.^c_\æ\å\Ûtë–¿\0·h\ÍV«a?#.D7<´•	Ú¯Øš¦…^\0\×õ&\í\×\×nÀ©“Ò­Å» \r\Õ-®^rk“=þ\Ýð³S:i4¥ý\ê,\Ôð\ÐO¯¡ñ\îT\'wBƒO\ÃpNVÿ\ì m\\¼i7$ô’\Ñiµ{°qÚ¿\n®­„«O\Ýx\Ö#a•‹¨j\Éu?À0\Õ”\Ä\ç\ÊSPlf!ž\n·\Ör1>\ç.\0\êB=\\KŠU´óz÷¨!—„i\ÚiuØ¬=.Fhbj€\Û\É]‰¢¢eU³…·\Ì\Öðô1\ß\à\Zƒ9\Æ\æsñ\ì”ö^\×Z\àbùq\Ó\ËÊ½+<\ÑIƒ*x;\×‚\ïL†2\Äm¯\Zÿ\"¸!§]3+–D_›N“\Þ0F.I½*p\ïlxÓ‚õ\Þ¸_w\Ò/‚Ž“¨œ	Í±bOr\Ï55]²±RU(\ß\ÌT<rÏ­*\ï&È‹\à†‰&\Ñ`¸\ØaŸ¥XôŽ’\0•\ãhS¬¸\ÌW\æ{lßµ Ú­\Çu^ñk¼…žûY¼šA¼½\ÄÁnXÀ¬›?š\Ã\Ðqÿok\Ým\ß\Ôhz%9’?zn¯ƒrÚ¢©\Ë M(\î‡Df\Þ5\ë~\çh\â•\îEµ*h\Ë=¿\Ë1\ãÝºº^vT@\Ýÿk[w	:Q\é¹\Õ\Çss|v—c:F\Ú<y£»}°d”÷\Õù¯\Æ\Ùx7¿ŒŠ\Z\r\æ÷5\àsnˆ\ç´O\Ú\"\å\Ó{\ÅjÏ®-ì™¬Ê”`0šjBEËƒ\Å/&w›6š<d?¢Ž\r˜°ú\ßÛ›ùÚ™\æ\á\Ñ²\Ûra²w\Ãõ–B\ÝYp¦Rk?\äKTµ¯ôC>\î\ÒT¿òVhjž\Þ5\\Â©œp+À?4\\ñ¸þ;ù@‡}\ç2Û¤4\ÚHÀ\ÞÚ—\rf\Æ(roƒ\áv.ñû\È,k\\w\Ã2[7/ª¤\æ\å--C|±€„³\ÛC`£	\ßt8†q¥h¸\r®\é\æoÁµõ\çYfM>~ò·Ž5­ó‰\æ\å¯\Ä\àö\ãeÂŸªÀ§$ºVrÇ¿ZZ²iwZÙ¬V¯º¾8˜¸V\îž\Ã9\Ù\ë\íj|²\ì\r{ö6U©2ö[­\n.³ð7\à\Úµx)D\×I%­6Àõ¦¢ŸhI¤ö>ž½^	¹˜„\\\ã\Â[,\ï\r¾£w=R¼Ò½±;šöå ¿\ÔÎ”ü½,\Ët!›=?\Zþ\Ä\ÔO»¶\Ö#\æ3\áF¼m\0\é\Ö5…\Ë_\ío7¯\Ê\Ñ\Å\Ý6ÓªŠPP…ß‡/\Ø\'GJ\â\èƒ\Æ\Þ[%ª%!M\'’Ñ¹\ê&NÀ\Æ\Ë\ÛpÛš°Q‡w´xq÷R]1ôƒ¿\é_iÄ³fe< »3ù0V6)\é\Â\â£sš\î\Ûhª\ÒF×·]r\Ü‰ls»;\Ý!\è)„’…8W\Üx\Èýa\ç\áª\Õû6ðªª&¥u™a8°Z\ä\æÝ¶%\áº\'\0¾¶^\É\àw\r¶>ŸœPñ\"d\Ëó\Í\nþ\ÍùÀD;\ÜpMñó&¥•¯9­\Ý!¨Ý¢&¬\íö²b{ñœð\r\Ú{·)\â\è:\Ô.L·ÿ>Å]MLœY.\ç5­]\î\n\ÜO¬\ndÌ©z\Ö\Ñq{\Ô-\Ö\ÂO\Ø6\å‹nñ’¯\Ó žU,tC>ó\Ìõ\Ì]R¹\ÐGº\Ý\ÌC\Âlš\\\ßx\ÑzW¶–B\Ô\Èm\ê#¬¯«Û´¹¼d¶>ÿ»\Í\Ð\â-ž¯éœ®8\Ø\ÍF7¥È‹\é\æ$˜²#¸Ë–ŸÀµ\Z»&¨¿X•YEY7µ]\Û\Õ+M\Ø\Û+\ÉÑ¦ë’“\Ü\Æ}ñ¼ñÿ\Å|0û\Û\ÅÙ¯—\Þ\"«±‰¦©X¸ú˜(\í|I\Î\Öódøk®ªµ‘¤¼Ä”^žk¥\ë \é–f;ú˜a…qE–	Ù”\å¾)_¶ð\á\â–Ã«\ï\Ñ+;\Ä:û\ÝÅ©\rU±Zd’\ÎWƒ®\çp\çôr?hµ\Ô\Ù\ífqa‡\î¶$”\Ù5\r½2ª»Æœ‹‚#{ñFkþ_,[’\ãu\Ï^ds´\Þj¿KÅ„\ØöDq$…—e¥®\rl“\ã+¹-&6<²R§¶{hm\Ò`cùRX®³õL®ž\ëüšo!\r\ÙÞ¦\Ó@Yž]¼Á5\Âõ\r5\áÊ€‡sü¨|,\î´)	<7Ûˆö–c\Ïo%Y¸tý[«€÷\â\r¬˜ õz¯\ì´S\n<…\Ø\ã”\Í.\êŽ\\Á\Â\ç6¸¾¬¯y€k¦^³Å“R‰]A(\ë\r,\ãK.N.@Ö«-ñfk¾% W\È\çdÙ†¶I\ä™À-\Ûe\Ã\Ö\æ-ødb[~Ä¶\ÌÒ½%l\æ\Î\Ä\Ú÷ºþ\ÏÚµ(©®\ã@0\ÅØ®P\ëCKøÿ¿\ÜØ’eÉ\à\Ìl˜ójnÎ¥i\ÚR[’oo®	HT5-a]b®JŠ\àƒ«ÿM)kI\Ãj	`Kž‰/ƒl”˜\Î\Ø0¿Ü“\0·¯(\Îz2lCv’À`¼9ž3\èjV›†„¬\æ\rOh¶’ùPW#¾Z[»°w¼\r\r\áMŸ±Ü\Âb¸¹\Z\ã61·³n|‡\Ý1 \rµ¤\ì.¡\Õ]†A\Ö2\Î\nl9c%oý\Ú\å\á\á]hx‡‘Z\ã\í\Ôå¤žkÓˆz4—¦Zö–6‡¸H\Þ\Z¶<J iM+Ù­j¸zà¥’\0gu\r^\à­¡°€¯\'ï£½¬©óÔ-\íanŽÂ‚\æ§un\ØÈ™°µ+\ëÁ¯\å9V2]\æ}m2¿pÃˆ)€ u„¬…§£ðVÐ\Øvmw¶¹Oš¼ø\éü)\rlJ<«[n\Ó0x\ë8—?˜¶Zô\ÈC8 «²€\ÉD\Ä\ÖF\Ð\Ç\è”*\n\ÉpV¿\ê\ßpý¸af\è÷\ÏÏ–\n\ÑHÞ\àEloc‘\ë\ê\ÜXlñ\ÖeØ¦Œ\Ú^FZÿÀ°\êFY†.b\ëŸ\í\ßq\Ý\Z-¤2»ñ{swt.—\Þ\í\ØJ\ïK~øu\Ýý.ŒEf~ù\\·¶˜¡\npd‰¸~asã£anVô¶c6B±õÁ¢hÜŒ?›˜!/\Z\Z¡\æðž…`.Kb]\æ,¶÷\Èo´N\Õ\ØJ2h#º\Ö_nœ$º(·\èùö\ï¹S7?›\åqÈ§±“õ\Ú@hµ&\Ø;g¯È³jŽA™ª¹´©R¶\0É˜tt¼/\Â\Ã\Ö\Â\ß\Âe4¸TBAr{\îw¦2Œ\çFpŸl<\àFl\Ãÿ)¸¡a\Ù\Æ\"%û\èu©–i\Ð3Ü§]\ÎIhýsZh\Íñz½€»°À\â\Å\ÐUg”„¸Tlš.ð\Ú.‰\îx·bÿ³\Þm™¦„\"5X\01\ÆØ¦I^	\ÒR&\Í/S]\Ï\×\ë>\\Wƒ\ì- õÒ€\èF\Ú\És\è-r©Œ—\ïØ Œ\åõ\ãö©•¢RI`›\\ \ìMƒ\Ìr‡ˆw\Z8¶˜\çbX¶\Üõº÷\â´\ßüVƒÖ£‹º«T\Ï›¤QXÏ¶\îþ\ÞQ\Û,Üšù!±eŸp¶]~ð(\0Ç¸ô\êdÒ‚Š¤,L\Þ*¶\×R]\Ï\Ó\å~T\ßwPº†¬ñ_°\à\âñ\"!\î$n)¹=\àþ¦¶y.ò2†­sÒµ\r\×q·f§«\Î\íD\áyi®¸’¶Œ·@\Ü\åýb•\æFqPƒF@wù.p÷B¡c\'¸¼G;?¡§(dºl\îy(°¥µ\Ì)\î+¶vMå—’»\ãKk–”%ƒñ\åkY\Â\Çv¹qÒ„=DxMD÷žû8/µr¢G¸\ÏÍµ\Í%¶7m™\ì÷\ïÆ¹*a,V¡¥‹k‚0µ\Þ_\ßP§€\Ò0i	­F]\0\î†l¢ð\È\æ±\ã3Úš-ÿ¹Vlc»Ž(¶>\åeNqÏ–Ì˜ù öõ¶2œ`°FLËŒÁ‚\Újòlâ†·,T\0¼‡-°×€\ä.aŠ\ÑúRE·+(š*§¥tU9>5B…[©·\Ð\"¶ÿ^¯\'–\íË¢:¶É ª¾Aà©‹+]D\ï\êoû\ÆÖ–\çiq93\È\çw\r\ÝyµC-z¡T\ï\àúñ\Ã\Ã<n¥.5lsq!®ÿD¾áŸ†b‘\ëœg!^Ph,f\îŒ\Å_1\0¸±\æ\î»W<\æÐ†%\î]s\Ï\ÇÏ“j\Çyô?Ÿ\îTwþõ$lU%Lð;wµ$.Y4!BU}ðQ\Ø\è• uiu†\íòŒñ?4\ä\r\ãG\Å\Ó/\î÷¥_u¹(\Üù¾O\Ëd-¸Ä¥Z+P†iA\Z‹Ú‰¨¶€—%UH%\\x_E?€5–5\ã\ßø™>\ÕÄ~[¶ÿ¼l›‘\È…\'\ÃV‹\Û\Ý\Ñ3Œù\Ì\ïD]’*DÈ°eŽ\"2‘›×}¢.¼9‰·†’	}­Ù»\ãú¨œ@\Ü×¯g9½\ÂÀ§ÿð½\ÈJ}™¶\×I0\ìô(¶s1 óKUˆ†—e “y\àcÿ\Þ\æ\à.À‘Þ†(3\×£÷•Ÿy=ÃŸ\è`\Ñ_xõ Å¢0¦1sok†Á\Õ/{Üˆœ#ƒFÅº¯,\Ã0-s\Â\ÞEr«\àuM\ÂÖ<…p7_\Ô\Ö>£Pcúú=¸§¾²|.\n\n\Þj\Æ]²ÿ\ÜIE\Þ*4lY‡)\ÄòXž\í¥ƒoû\Ô¡5\É]0xY\ë\ß\ë‹ú„®l\Æ|žþ2Ì¢kv\èœ-f·1\Û@e2HÞ£ˆ\no\ÂBŒ 2I`\Ù£¬f;úx©ƒ»\×\ÆpºF\í%tMEv\ç& óûO\à¾>Žgÿ\âC\nN\Õ\êl£g\ãö\ßS®¹__†ˆ«—\Øa\Ä$—\ÐM\Ø\â\ÒR\ßù:	Â’5\Ã.XÔ¤\ì\Úsë•†Ò‘\×\éocX:Ð‹™\ãåŸ…G$—37¶<JSU]\ÚÆ±‘¶\Þ(³<†ðø\n\éuQró\ÝHZ	--j…ƒ3Ö––\Çe ü\á3nž\âdøu\âÌ­á›º•Ž@\à\à\n\nq•§\ÛZ”…À¿…¤‡\0mÔ€\Ùð,\ÈnQ¼‹\Ç\Þ\ÌržFˆüe€\Ðs½¾g¬n}û–3÷K0Œ´q¡ø‡\Ü\ç’\Ë<¸ ¶sAŠ»~\Ýu@´Ž+“Ý²gö\ã{•¨o\Âþÿ\Ãt¦§˜\ãûA[\Ý\è\ÃS\nL›g¡þ\Õ	CÀV!°NË­r­\Ï	[Õœa»„!Æ´t¯ð\Éù<\à)œ–õ\Ç\ÑWß¯\çc’Ù¸\Ùq/)\Â]©XŒ%^\è6ž*S•úªM*¡å¼µš\\\Ì\ç\ë%\æ7½U\Ù\ÃòÀ?\ìP«r\ÊK\äá¸¡\ÓoçŠ…\ã)ð„%\êj»W—5!\no(\èz^øA˜\nl¿Þ®’\ç*\Úl \Ð6±–Š–\'¯\Í\ÙcÚ–\ÌeÀ†¿>•õC\í\È0±\á,›ÀÂ²™\ntPÙ­:JQ˜G™™­T\ÕE†ù\Ã\è¾ÿ	*Ž8h‚\Ó,i(hk\Âû\Ð÷lK\Î2d—\ÇB\Ý=„\ÚmI€b¸û3uOn\0—Á³|§ûýµ>Åº&\"Œ\Â*EÉ¢u¸þ\Å\ä(¨¼‚Î¢ 7\Ã+öv\×À}Ø–$\â\ã\0Ck¼¬R÷\ÔS9 Àý\àúsÁYÀ\Ò‚3J\nò\Î<}x§\ÞVonznßžøP(·6+GÒ¬ü  ­Ÿ<¶o«Û’{H\ê¦—ö‰\î¯\ï\ÞöTvÄ’?ci\Ç:\Üb\áøE	~\r´“TûG\çr°\rVÀ½\'\æ\æ\ÖL8J2y‡\è-š·}\ê*°Œ¶þ\ËNAª+\Öå°µ¨\ÒþÛªrh/4¤\èz\Èg0\Ì|óab\Øê¢ªŽ°Å§¯+\à:›*\é¤Y«e	‚\å¶,ü\àa\å=;´\ÐM_‹0¼«VAr±94t\ï³ü\ÏjÁC¹ôŠÕŒÖ²Z#\×`õ\Üi¶i{’Y^Õ’$¶Kž6\Ä\Z\ïÙ¡M\Û\íòu¬\ÖR»R\â\Ôû‹^€Ó‚Z§WeuùÞ‘™ò¥Em3w\Z£$øg+\à\î`—\Çé”ŒI²J\\MÂ^zÁ\ÈFt—«\ìú*\ÈKžJyœt\ï“%l¸ñl\ï\é¼\êÑ„ó\í¼3_\ÍF\Ö\\FS\ÑWˆ¥ð\nßš6¸\Ã.\"\ëø¾b–.\Øb+\ên‡.p°V¸€º)\Øõ}‡(	E{5žÀ\×Àõ\æ\×²°³A|\ÛC8V³\â:Y‘¤³º$G\Í7\Ëw\íùÃ—å¹¤²e.f\Ø>MÚ¯1z\ß\îA\èmü-\"=¤pLEhÃ®Á¸RK[-ÁEs\æò\è;\r\ÙZ\æavZ\Íd–[­I\Âòµ\îûœt+a¨\Â4\ÅüÁ\r\È\n<³+8v9\ÌJö±ÁP¥m\Ùg3\á®\ÏN\ÊmN\ÛO­ðlœ\Û=Œ—\nfXn\ÏÔª½¨utX×±\ì·b\Úò5L¢‹\Ö\Ö\n¸i£6$]{§—{šýç—¢5L\âb4À\Ét;†\í”iõø±žœ\àõ7|\Ç\Ü,o…Ö¼·<o\ÄS\í@w©òK¦lÿÖ¦\Ø«&&‡:u¯a\ï2P¶\à\'¢÷4‰\á\Éò»\ÛDúñ§§\Ë$\ÌÉ€•2…a²\çFóŠ\Å\ÔN\Z™{XW\ë´]ÎE“\Ç\r\\pCe]\ë]›\Ý!m\Î¸ûT\í\'±¨Ï­iq¦‡`\î	›´\ÙKòd\Ù\æ\Ý\Üùüðœ¨¸E\ç3\åõö\Æv(6Bœy\ÑE€\"\ê\ÏI\ÛxµÞµ›.b\Ú\Êuô¿ \Õc»¨.ÛŸù\Ó~¸°–=\Ò ¦òDúµ¶b“T\\1N	Zœør†%‹ªŽ¬‹[»6\î~±\ruZÈ¨*´‡Œ6\Ï\ÆJ|\È\\¨c\ã\çO¨º\á\ÎZ·\È\â‰vav\Ø\Øu\Ü\ÍÃ\ä\Å\äUJuE\ïmß´E÷~³ÒŸ±,&3Yºf¢Ô’@4Œ±i”W“¹\Ëc\Ô\åiZG\ÑÌ£Y„a—rÒ„Ÿ8ßª«#•%g>\Æ-\rš˜Q\á§\Â%\Øwl§Ï›À\Ö&cQ\'\"¶$Ç»õ»ŽBgM\Øðµ‡~‚i¸tóŽ+\Ð\æc˜\ä\á\í;³$¹\n\ïD\Ü4\Êo±\'u’7#\Ý\Ùe\Æ\"@?ûºF[Œ;U\ïz[Eöj™[P·k7Ã¼#QÀr¥Šõ»›}ç´¹óŒ\Äec’¢‰@\Ó|ˆµ¸Áôº·V\'d!B‹‰%m\Äv\ÉÒª’\ëkœM\È\0\ÜI:]\à\Â	.\Ï•1>ˆ·\'?^a[µ³g_$®\âƒ0—u\Ümv<kÝŒ\Ä*McE\É2“\ê¸•·mú±M¡=rI@\æ\î÷\Ò\×\í72²‹¾S\Â\Ö\ËÂ¶Þ°œùÂ±™3	\ÚT\Ó!°µˆ®š\ZÁB­/®V[*ð¡\îò\Ñw¥\â\ÜF³\n-°\r\à^a\ßÌ¤­§\Ðø+Dqj\ÖÖ†¾\0Ï²œ9ž\å’Ú¶x‹%µ­Pw¾å†¢a\03d-—!\ë©û(?.&·\rh\é™»µU[Áým×¶©\\NvAcj8	ÿÿ—\ß%[3É’©}\Èm³½Š,K\Ý-\ã`\ã\×Va\Ú\róó¾\Ê\×gºC.Iþ kil½hI¿›\Ý\åjƒ<rQ\Ð:p\ã\Ë5„˜\ÒÄ°-’ŸE-„–YÅ¬>\Òö·ÁÂ–\Î*k¶BVøŽk_Im\Û;V}\Ð\ê/YNús¨Ž¢LEØ¢q®|\î\É7}–S-Ö¼¸\n\æ…Úœ«lZˆû_þ»¿À(¹\Çi\Ö\'\î^m\ê\ïÕ¢t+ƒ\ng\"Nž\çæŽ€N8Š)\ÅK‚þ·Ã¸\â>\Û\ÒóZtˆyt¸&/^^ò\Æ\î,~|½¹tf…\Ö\Æ\Ä\ÔC‘!Ç›Ú”°\ìY¶\Ï1\\›\0\ÕÓ§_\ÈT.3“\Ü\Û\Ð\ÕTw:\0\\¹…6F®-uÛ®þúûp‚Un÷¸\Ë‹\Ü\Ð/hIñ\â\à\ã\Ö˜§-\Ü\ÉK\ÅPÁ\×]`=¨>v{>‡¸\å\ã‰3.j¹\\\à\â¼Pµ±Á\nV\î#\Ö\nQ\"û\à™™O\ê’\Ôi\Þó;­ÃžP÷\Ü\ã\ËÉ¯¨\â®\×ó¸\ê\ï»\ÒtŠ‰S©6FmÈ·<I½°\Ô`kš_¿K¼Aø\r\åœ&3^’~ƒL»\çš$…I&UºŒ\Å\r\â{‰„6c^Oç°EU-:\Ç|b\à>\å\â¼Po®·`\Ë\Üa[ÞŽ\\Sˆ­K°	\ïSŸ¤h?Õ§TST™/\0]ý\ä£ùA\à\ìF6LP­\Ú\Þ1±\ãa–A\Ë#´>-°\îú[\Å!¤3®\îŠ9©\ÎúpWS?ú;D\Ö)I\ç4#\×9|ù5=\Çÿ\Ô¸h%\ÕDˆ…-Á\î8\0ú“ŒgÊ´ Rn\Ò_\Ø.—aX\Æù÷—\áŠýŒÃ»‰b®C\n¯©\r.Š‰qš›\àù´<_Ã¾f¿Á$ò”\0\Â\"t!õX\Ã-Ì†bhz\å§†5·™a1vy]\í¼|\ê\á4|\Z\Ý\å\ÍJÌ¤\\§\ÅKº¾ª•Y’”$¦§Ï\Z[\æ8…\æ—}1˜q-\Î\çó›¬¬…¹>3\0w¯\È¦Yù\Ô#\ßã—•˜«r\Ò1BÛ¢&\Ò8\Ò|/!ú\à\×\"¨\Þ¶mÌ¼gÓ…\0k@bpQó\æB²ù\Ô0*­xS\çXs÷}¶n~ù¨\Åw[“\ÐZ¢—\Þz\ØCmnŠ­\0\Íp|c	´‚œ‹1Æ¨ª–ˆ\Ü>°S¼´¢\0\0 \0IDAT©»\Z©\ÙA/\à-xt\ï\Ö­?Ïž¨LHš¶\Ò\á/T+QB%£L2.\ì&\äUBB¹§Ûµ¡ª\å\Ù-—„®W\ÑÍ›\å\äSÖ¯\Ð$\Ü8ýuy÷&º‹?\Ïö\Æm?õYó+\Þ&\Ò;-\\\ÄPwF’\Í/Gc‘n\Ê[F%\\\Ð\ç(×’¸æ«“.”ý=¼\â\ïì­½cô\'¦3yžXw»\á\Ø\Z>\"ðAq\ëg\r²G\ÐBpý\×‚K\ç$ûdwF\ÆD€o\Åc,i}q€o\r¸cJ37»¬.8\åœõ\Ú<\ë\r\Z·Š…P¶Is\ØüJ9tù\Ô%TR:\Zþ€Œeµ¥c\ßs\Ù	ªTV0\'Zw®úó¦Û”ˆ÷3\ÜL\rK¸Ÿµ@Œ\ÔúQ\Û\"‡8.·÷\r&\ÎŽÇªH˜Ë§e\nWv·8p“\Þ\r)ð\é\ìú#G \Í)¤?Š\\®s\î\Ë+Ieˆ\Ü\Ì}‹™2h`y ’r+k \äqK\×Wµ\è•\Å*c…ÀMÊ…\"´‘úLŸg­\r\ÞÍ\Ë\Ú\Ô&)\\\ìya¦\å½Ä³™gZ\Ôú\"‘-^P&8V5\Ì\ì>¸†½a\å\\Qp\â–üV\ï\æ*1gý\ë{Ð‚\n.ô\0\ra-E~\Õ=SŠeT{A\Òy†/(HˆÙ°+÷‘[\Z\\\Ã zMz>Wó|ª’õ\\Ù†@7\Üó\ì§>\Z[\Çÿ\n—„”¥ƒ­l©¢\ë4jC4OB÷@w´o(pUbrr\àúR^\ìw@û¨{)©\Ô7¥\â;·×·\Ý\èA‰ôb¸÷¥Mm\êá Š–¼j1dOoi²=/t\ÉÀ5\Ô5(ý¬zÏ¼Rj€\Æ\ï;u+˜¶}:—ü\×5¼\ÜnjQ©šÀ\Å\á€vl‘IA5Ä“Û˜„sx€‰\Ý+‹Á\áX9n\Å|`»+Fn\ã6[	“\'U§\Ö:\â}C™Y¸R3\ï(	©§y9œùñ{\ç=2\ï!H™3`\Ð\Æû.;M\Ä-÷¼´¦–Õ¡\Ë\æ2¸ù£œp½\Þnð\Óu^\ç¹×—b:r‘wªÌ»3½T»\Æ\Z§ØŠ,%\È\ÌA”1\0k\å%7„-·c\Ì#tg*p]Zˆ\Û]ª]\ßZ\îrÃ‘{·rø.\\\à\ïIw{1\îûýoõ²\æW,À\à‰V\â$q–`\×\Ð\n\î\'\Ä\ZÜ¹\0nl‹\éÎ•Etox9~}ýx”®\Ó\'š\å\àM}Z´I[Fc;\îM/6b¡±˜ŒÎ©\Z¬P{\åE\íU \æÀšš}¤°=¸Vav;8ý¾z\Ë@(Àkñu+…\Ø\×lŽ°\Ýr\Û+Ÿ¢|4Þ‘n÷Á\×€9#Q\ÜJ\Äù`.Û–¥¤x.†&a\ËX\Øvð±7b\Þ2pU\Þ-²¨w<n´[\È\0ð\í\Â*l·ˆQ\ï\ê3bˆ6Lt£w‚¶?B\âøk#‰°“dk€$h\çQ‹ú25½“\"´Êˆ&)hñ(¢…\î\ÝwÜ™Œ\ÍM¾\Æ\ÝV\"\Ê\ê\ÏöV–%Ž¶O>hp?Æ†Y’®RdÁ;lE9!\à\ÍE¾= ô\ÊÁ2˜F\Z\\z¸\îWÿü\Â\Ëñ[\r\'\Ï\îSûxÑ\ÒÆ¢8°m³\è\í¥—º\á\ÆöLl,²³¦b±~¸\Ç÷Aû1rÁ\n×‡ŒFºå¢³Ï¯ß˜¶©<vmøZYjŸø{\ç—\×.˜£®Œ\Évû\Ø\ÈÀ!rq\Ñ%\èú‹S\È^&,¤þ³oˆ5…šrY”\Ù\Ëó¶i›^¼^\ëkµ²¶lRv\ê‡\î§_LhÀ\Å\æij.C`&R\Ú\0O^\ÄÌ±0a`Ed\ça\'¡-.ž¡Ñ’¾·Ÿ}=}\ìt\Î­û\îL%Ž\á2fÀUý¬0yWzU™”É°‘Ä•Nµœœ0°³˜\Å\ÈÐŠr£‘\ì•S$ò±Ú)õ\ZË´M]0t”\à\\™‡­y;.þKð=\0n˜ˆFItûé„¡x‚ñ9q €Ð–\ãg\é˜qy¨l\Ñz5¸\ÖI¬Hw²!h)F¢\Õ7ùx\Øwn¹\Ç\Ù\×d\"›]ñp\Êe\Ð^\Ï¯gcú;ñ&¥X\\°\âh\'9\Ï>Š´…¥³›7À½š¹[z.®–®û£9®¾@°7\Z“qh˜»L€»­ ûhxs\Ñ\î\ÒÀªŒ»¾7Œ1^ƒmƒ4ª9FÒ·¾\îzeJ¼YM5˜š–W¼\ïˆ\à|	]\ê~ <a#\îbœ*iýA\Æ2X\Î5\æ\Ó03v6’Ì²\Â	›É¨QÇŸ\Û\à^>?sáƒ‰^Âµ\"F­3ô\ÙÐ˜\Ñ)ü\Ý\Õ\Ì\Ì÷q.\Äu\Ì|\Î®s£\ê/\ÐYˆñZlqV\èŠjÔ»¯\ß=\Ë!9‡¶3Pøì®»»\0\Ú]\ß\r\'N¸c/\Ã	M1§ƒ‡VŸg\ZVó]sdO±\ÅU.• µ\Z5Ù©\\µ±:nŽYJTG“\ÔñOÃ´™µ\ÎN™I,Î³¨\é\ëð	ÀŽ}8\Â\Ç$Ï“\ÇdÐ¹¬þ[­úù-lqVØŠ\0?·6Vÿ\0\î\ã‰F\Í\ÖúGD2G@=B½/‰9\æSô~\Þfø¸~ŽŠn·­\å\ïô»÷\Ë/V¯\îø{®) T£¼=Ýƒ´\Ü_ª]–3{k\ê…\æø]\ä	‘m·`Û…»-`Š4g\ÏÇ¿y\ÌZòžñû\Ø\ÎµB\È·Ö¯aW\×rfws\ä\íÉ±\ëûIHÜ\r	¥‘Z¶ú3\æf\Øÿ\Øn;~J\Æ\ßÀ\Öpö\ã\r¢\Ä+\Ïÿžƒ¥Öª\é\ìH3¡«Dyˆ$\ë‹A6x\ã\ÄQŽ±Vj†ñ/ \ÞM\ÄnmÛ‰JZ¸C{±\ÍX\0\Ü\07,\êZ.|CÜ‘¶Kö\Ò\æ2›-’ME–Q” q\Ù~9ÿM\ï\êõ²ä¶“Õ”»ü\ÙktÕ‹º®\Öþ™M\àm\ÊrU\éT\Ù8]Rl€\'Ä¤„•ˆ£–\ÞW˜?º”ñZWUò®MÀ^#\Å\è\ßgqvkþ\"p5¸c=¸f%­I\nŸ_W†7!tM…\É\ÃiFò¾2\Þ\'\Ã\Ã\\A\ÈLO\Âò‡t»S÷:vô8¿z\rj\ÈFYVO\Ã-e\Ü\nC€[97X³X#¬+æ©\Æ\Zó\Ûw”ýa¤b7Ÿ\×ÀÞ·È¡…r\Û-4o\æ-}6À\à\nd\äN\nv‡\â\\\ZžU\î½jað\Ö,Ú–\å\n[ºú\ßrû3“\é\Z7F	ö‹\íD0‹üZ‡°¸\í„\çm>\"…ùþ¶\r\Þ0Ul_Ý«sƒ5‹v©0¹h\í*)¹:v#¼ð\0“N)’8€–\çb	\'	4dŒðÍƒ\à\Æa—³\ßklg¼\n¸xK}\èq\Âg-¸\ë·\ÎõÆšÁ››„	:÷¸±´ª=\í\Ô)D_œz\á\\ƒj]™\àwB\Îmix]Ï±–+\æ\ïfK­£\Ðf—òøŠÎ[»™:Q“ˆtjs\é:û×­g®\ÅV_¶sù–\á\ë\\]jÁ\rõžBöLL´½4(leÊ¼g¥y.\á6SC÷\âÿ\0[Ó±•!$¶h/\Zhc{ñ!\ß^wõ†M__µ\Úw¦\Í\Â@ó²‡O~\ÚsyH=·¶\Ìû)ÁNKºnÀ±thC<Ú¬øl­_d¯G\é\ÖÙ±^7\ÕZSF&X¹„@ó@u“\Å-%\ÖÿdSˆ«RB\ã,·¡gB©`Á¯ªYŽ\Æ\rK\Ýv°‰a4à²—\î­\Î,kÐ¸¨-&ƒ„\ÜÁþ\0\Ùù­tk+ejƒnVûi”\ß^ðY\Í[\0y7uÖ¦kjºÑ³ù7\Í<m~1·\0aNbžhï„­\å•\ZD­õ‡‚\è\Ô\àT<wÀ½mØ¤\í´V›v-¶\æmf0%\Ðõm–*UŽÿ[\î½]O~\ÖÀ\Ê(òcjÁ\r\ç\Ù]Ok(:»\ßE‹\ïÿì‹r\ê6†ƒ1L‹/µ=²qm\Þÿ-kiw¥•,\ÉB¥=™3IJ“\å\×Þ´{p\Í\Ö\Ó@\ã9óyû;~\çV®\î%‡…“˜d»øWI}+\\xQsòv\Év\Ñm`Lm´‡™\Ôn{†\Ýc¶=$öj\êl\Â*D\æ.A»m\å]pùÖ®\ë§ö\ì\Éz­kc}†´vµ\Ñ\ÖñO×¾\ïZVf\Ö:ûD©\ê[\'\Î©[4÷\ÆqM\Ú7QeÆœŽ4R\Þ\ÃB¬»²\î9V\ë¦ð\ËW\\<.?n\è-˜h\'\Ø\Æ!#5f¸ˆ÷/÷\n\ÎÁ3ûó^´K	°[\Ø\æžÍ´ j\Í[™z\\™)\Ïn€\Û[cH®pÁÀb+Þƒw\ÕÍ‡\Ø]§\Ú\rh!‡;Ÿ® „AŒ«¶{ÇšBTQ}½\è&\Öÿ?¿´D\×c½n7]|n\Úó\Øz®¨\Ãô\Ë\Ç\áù\êIXÍ‡3>§\íÁ!Ÿ¶\é\Z¼\îÔ´•÷žŸ‚6\È„w„\Ý7\ÍV«n\ï²mšD\Óeþ(ƒ¶\Þ\Ãüv\îX-±\r¬S¶M÷N¸zR³Zh4‘\êÚƒº\Ø.\ébmð\Î\Ü\Ú[ð\Öß‰V³õ–\é\Þ\rw¹/\×5[M=\ÜvAßº\ÖC+­l³³¬¾9[\Åö”üm53\Þ—\íõk–0m¶\ä\Ëk«â‹Šj\Ëe`|ð½\ê\íVû`\"¸À^™nºnø;p3sobo\ZV{EÙk¡ý\Ý\Ú\æ‹x\ë\Ãú‹c73¿ƒ\ì2[œóŽwolÄ“[˜Ož+\ë\r)‚Ldˆ|¶W\ÛnNùG\Ô[t\Z\ïz²7hm}Zh\\Š±¼%\ì!¸00öZ~X;×›¾\çIM\ï\æ\é^$¼Ztmó\Ý\Ôb\ï\'\Û<\',\Æ¦\è·€«†¨ö—^MP\ë\Å\Íp\"Jj\Î=‹Ó»\×ú“Û«óa3¾‘Å‰\n±Ál\Ü\Õ\Ý.\à5w\Öi:‘P»pM\î-ól\Ãm$]X<$»j\'‘£\ÑnFø~°:7(Hº {\Â…+3?ƒ\Ès–i\Óô#\í¼?]\n\Ö\ÈZI\êU€\ëo«]°\ë2\ÛDdºµ\æa¸\ê3\é\Ð\n¼¦\ÎJ-\Ôš&\'§+\\UtlE\ÂÆ»»Ã†\ëG¹\ê\ã\ÒY6\Ý\r\à\â\'\ÇqPR d*÷6f\Ñ0Yvp\å–ðü\\\çˆ\ë\Å3l®\æ(»N¿\Ñ2\Üvk¸v\ãn:ª‡Óš¶]\\Ô§\Ú\Èjn¶A\Æ;õg˜­V%üöÝ–”ÛŒ\× OQOw\Ø\Z®C¿J¡p—h\á\Í\\l‡Áµ[ƒw÷\Ý”„4%-©.#¾\î‘Ã•ÓšŽA\ÛM´ð¢40,&ø0\Ê\ÓF\ì*}v±†\î)\×\îÂ·\ÃÅ¾§ \\\È@`eMŸk&f\ášMv\Ç>°6Æ‹\Å\ÔI›I²…\á\Ù,Fûv¸XŠö”õj}Â—6^ÿEA,B¥\ë\Ýn3µÀ“Œ¢²\ä\ïeÙ…:eú,¸ª©\ì\ßh£)\ì\ê@w\çp°\Óca@³µ¬vc\ÃÅ©!¦\ÊK­+\Ýo†++™\nn³\Ð\Å{2^\Ãu÷\É\Óc>Y\ØY	C½	bT[+™ ­LZ÷ZË½\ÑTÝ¯j¸\ÇÅ‚EBÆ›ƒ\ï1\\\"\ì3Û­\Ð\Â\Ïr½Øƒ\n8?úYx0Y~3\Üxsƒ\ÍN8|Epi8\ÔAW×±]m½\"\Ìb20]\éXö}qÅžW\à¶t\ã‡.´4_\æÀ4\×\Ï\Ñ\Z\Ã}\Ôri\0L~q\ã\Ý$+b”ý\ëg_gƒ¾.ºbp{Ós¥™SŸ\âÚ†\ë“\ÜúQa Eð¦nÁtq(1ž ÿ£\î\ã^£ôIp©eo\á\æ5o	¨\rW…7d»­{˜=¤»\Zm¬Â‹ó\È!Áªn½^\Ô\0VXb2Ÿw@¸Í¿ÍŠ.=puúK¦\çüEN¶]\íœj\Ürµ\Ú\ìªð^ržö\Ëf“WÍŒ«§À…™\Í\"[\ÜØš¿\á+\ß\áÌ˜\'J#Í½\Ëv5\Ú\ë%R„¹®\r\Ìy\ÞŸW/jT\à®g-¼cxx\"x¢¡\Ý\Þg¹µžcv\Ö\ÉÀt[œž\ãŽ^Ý ï†˜BhÍª\ÈT-zÂ«\'\Ó\Õsóõ\ÆZq\ë›Í¶Þ­C‹¾®0¿ð8ŽƒzL\Ú;Œ7±z\î\â\Ý\Ó^ªûÏ¨tÜšq•‡\ÃÁ›@\Ø¤­½<R›)Žy²\Äó\á\ßÏªŠÏ„;.t\ìÙ­»”X§[1—\ÜÌ¨cxwV\n\Çu\Ån\\£r˜avY•oï£±1\Üc¤ˆfµœC‹	U-z\Óef(\Ùò°s²w¹¹\ÙÜŒ»¬I\Øb…÷%\à\Æ=n\Óû¥™w\ì˜qx¹+¿»Y(±\ãC½¤†\ìU\ÈW2_QÉ\Ä\×kÀ^eµ\í\Ö\Ù:®ñN\ä¿,û=/w\æ,¬tu-²_R%µòg8­¬ð¾\\\Õ\â0]Ko\å\Þ\ç\r\ÞS\ËG\ß\ï\è€óY.O¸\Z\ß\0üƒžb\nÛ²\è\êòG\á>ø\ßGoa\ë¶Vu–\r¾³¯?ùù¢ü¡Dô\0¬—,a[{¢\ÝEc\ËJ„¾\â1\Ý\Þ\î\Ý\Ôø‘¹cÁš|“K›\ÏG¼¢\n{ª\âj\Ñ\ËÛ‹\åy­]™³}¸f¼›7n\ÂpÀµñ\Ê[öWw´PðbU¡\ÝN9cH¯·\Ù[\àš†°€\ë5Ýž{\ÈA\Â2¿~\Ø\Û\Ê`\Ïø;\Ì&¬Q\â\Ð\r\èù^\0›ø\ßðý/‚‹3Œ\íkk\\\Ô@‚]\âP[Yo/%\í\Ûü\Îa¯“xÁjlm³D7¡òùÀ…\Ökø¶\î\æ\Ïõ6\Üx\Â\Üf3¥*!×¾®Ÿ\á(w¦˜Ž›l–\è&\â•\àŽ\Öhs\ÕbF”\à6\\>–(v/\È\ë-\rÄ›ø\×À\×\\f´§ÿU\Û/\å\r\ÔQ%øU™HùüE\à\Ò\àx\ÚGguó³\Ý\ã±û\Ús\Ã\Õ>Û´{I™\ê(\à(\ÇS¶\ê¤R\ØÔ²¼U½	¯7Å«?²‚“4pŽŸõöˆ¯\áúVo\'³\ÍÆ·¸‰yóô¿D\Ðc`‰\åÌ»’<ñ»\Ù,ó»\Ì\Ê.œn‚ûñ;\Ð^\Æ[À-\íVYG”\Ì\×üD\×Uøg=\\¥¥+^ÑšÆ§ó¯\éŠÑ©60\Ëm½ƒ4B4[p\âI\Öôk\rW©\Â\Ç:¸r±^\â\è_>B\ã5Yi‡ag\Öýº\àÉ¡\Ü¼ð¶\Ê O\Í:Y€›uª¢\Úxñš\îñ×»æ«­¿(\Ô\Ï\n„‚ò“£\Ç\áŽ\äÀ~\á`w\ãÅ‹—\ÓÜ€3\æf™Ø—&a\Ñ|,\èƒ25%7«>\Ú\Å-pWt\â\Ð\Ò-\à~3Mû«0fþÔ„\r³ý~/œ{BýBv\Ì<Y<ø2qyŠ\ì·\Õ\Z\Úm\É_¯\éú\Ø\î§p~Ó£±ƒ²\"B“\âo<q19çœžœ\Úu\Ë\Ò/ƒ›\æsÓ±-$Ü½’Ý¾	\Z³SJÐ†ò—\rR]¥«Šj¦\ìU«\Øñ\ÂõŒ&b4m¹\ß]\ë[û\Øó½ý\ÂÉ§û‘\ÆVð‹\Í\ê!%\Üt>šˆ¿½\å/\Ø\í\é‘9t#Š«\ÌÀˆÓ€Nû¡\á\Üc\Î`½÷\ï„K£‰\Ì\êQ7hÕ¯w>k¸efjþw<¸n©zZ\ZU’¬…+®q,l\Ïojµ{5¸l˜Uiƒ\nñ\Ä\ÖÀ\Ýw6Ý\Ð%	è¢œ÷k\áÂ™Ê›Í­*lˆ!=þZ¸A#\Ó]y\'\è+gn)l—Á\ÇV‰‚\ì\é\ZT7-$ü¡À½/ù}\Ý`¯7U\Û\Åi´M\ÉÁrPjÃ­J»“¤Ÿ\ç ÍŠ\ÚZþNz±»gü¾?\0W.h¬V‚dÁ\'šÞ°.\\%»&å¸ô-r «\'\Âô\ï—(\ä‡¹`Ë¶ü­%Ü’\Ã-)‡ã‹“zý…\Z“a\ÖË§\r \Ï\éŸ\r7\Å\0”Mw\É û{\ì¸\Ñ/+ñ°m¹žX\\‚¤¢U´§\Çñ‡+)dllNKS\Õ\Ü\Êh\Òtnvj\ìÌŒiWD\èe—þ/“\éQ;_8ÿ\'\ÂMaj™\ZøÄ³¿\ÇÊ†[*\ÛÎ„cñ\ïä±Ÿ˜¦¡\Éqs\0Xò½ÀVw\ßüŸ7\æô\Ë	n\çXnYv8`Kw\è\á‘4\í\Þ6GQ-^&#	rwv3\Ü\ç\æs\ÉcŸÅ°Ÿ>Ž)\ë\"¹Xp‹\nm·Ê¨€€%vaÇ©G¼3ŽXO&¨\å\éñ‰¿\ï\Ó\á\î\Ï\î£+\Ù%™\ÑòÅŠŠl·¢E­\Úð©;ydôZu\î3²\â$rkZ\Îz(þP¸\é\Ùÿ(Föu\Ër\Ñt\Ïg¶H€\n÷\éPùŸ*v4¬Kjƒ\Óõ\ÌC\å•\àNˆùC–+?/\Ø|R„±>×¨‹4\é\Ø?M\È\ìwté«·Rp»\ãØš‹ŒÚ®«Ô£\ë4Ü§\"¯\×X@°¬˜õJ6…¢Ë…\É|ò\Ôbh»ª,¬\ç«þ‡\ë\0&¾\å<D#\Í¸ðF/ôaXÌž«{[¸Nf†=JögQ=\Ü\é™\Ñl»\Â÷D:\Ð\Þn¹ãµ¢%»\07e\îš÷\r Ÿ\å\áVº{‡€åŽœm\á\n˜\ç†E/Wefª\02Þ€\åŽÆ™«ö¡\×\Ôù=\áª\ÌLd\'Ui<	n¹\Ã2Û²§\í=\áª\äA¤kÁ•†[\Ü*\"ÚŠ­zõ\Þ\îp\Ãt÷ü°*0B«ÀEC,l÷|cñ¦p\Õ\ÛZ\ZX±\én\åœhÀ£l\'Á¸\ã‹À}z\ß¸\Ùº…\É\èV¢UÇˆl«Š;\ÄÏ¦ù\ãM!\êB„ng–<þ\í†`B‚‹Iˆw…[h¸q—¡œ\Ã=/f$¹\ï\ndS	CS¥M×Ž\"b¢\0¯6\Þ.×…°\íj\Õ-\\¸E\Ôn«™*¼\ÜÁ˜n\Ðg\ÐE`\r·ˆ.¾XJöo7%¡Œ\Ð\Õ\'—c¹EÈ¿UvÊœ¾/\Ü´5^Z×•vu]9º\ã*œ-)nw|g¸é™¢´*&\rNv¡\nza$·¥…sú\ÎpQu;b…WÀ\Õf‹Du|k¸)T\ÐpðZ\îBT[-¸\çô\Í\áb¾»2\ÊPUe±\0·ðø\nEi¬¶„Jòp|w\Ëa@\Ûõó-÷ž\ÔM\ç#[\â¿T\çÓ·‡‹\åÛ®4€ð/e]|Ô¦«\\\ØB~zú23Y|‚3\n\îÿph»g\èú\àx\él*¸\Ö0\\¨P‚zp·Á`š\ß\Ý\å½)µh¼6_–/g\'šó\Z”:`©½úiš?›,‡Rõ}\Ï\×3ë™~»J\Z0],i°Êµ-±Éœeÿ•wv\Ëm\ã0\Þ¥u€á…‹)\ïÿ–k 	ðG–\Ý&•,\ÙÍ¤\ëMj::Aº\Ü\0\ÖÍ±\Ø\ìŸ\åN¯¸-,lù\Ê3]3¢±/c<™\ìL\ëtM¸²À\Î{Ê«9 Wzò\Ë\Ô\Ú#y=¸~URÀ\Ê^\Ä\ßñ©”WóUp!Žh\Ý\ã\æeÍ¥¥‚\ëƒ@Öƒ½‡‡ó\ß\Èsƒoµ\íf­ø\r-\ëTµ\ÜúP¸\Õ£u\Â\ÒE¾ñ\Û{\0\\\î¶U“\Ý-¸$l“\ã<\0\Ó2NW\Ø+6\è?öƒ»\Ó=|q” \Þbu\Ð‡:\å\á™M\×ÿ>2?\ä\ÏÆ— ~|ÅµW3ý1pƒ\ÙžÅƒ?•r#\ã{\Æ}÷É­›ö3˜¿(Ÿõc\ÉÁolnœ¦O†;M^¶\íC®\"\Û\Ç#€\îI÷\Î\È,ô¢i¼]Äœ9~ó\ÏÀA\ßn0MŸwšˆeûÀù\ËQzˆt³Š\ï\Ö\'ø¯\Ú-ðBƒ¶>[Á\Êô7œJšC}Se\'Ÿ§\\a\ë=Á\ã\r\Ú-\\7|Kv€c¼TúÄ¥m‘œ÷\à*ÿø)p=\Û`	‡oð\Ý;1Kº+\Çe½Fº¨G´hºj{>A{—­O\Ø~QÍ¢7\ÜsŒ{\ïA\"‰\Z”/HÀ\àò	!¹¥£AØ­\ã‡ÁÝ²f\ïdÐ²ùöXD¾\Æ$3\è{\å< ‹¯bi\Êø1»§\Ée\ÝþKv°s&“/ \ëA¼\é&´„\Û\ë\Æd‚\Çiú„dù´\Ü\â¥\Z”û\Ë\ÛB‡+\Ù*=@}Á\ëx!û‚\\\í›Kò­ß†\ëÏŽo\ßwZCœðü€•\Û\Û^öUù¯r‘t\Ø{€\â\ëÖ³\Ã\ró² \Û/Ž\Ã\ì\å™þºuQ£e(z²×±8ÏœÇ“\Ã]B*<\âUÃ¶^\îzvQÛª©/¸§§\å\Ù\é\n\å\Ûg¶Ÿ®¹\Í_* \àû\Ñ&µ9“¼±µ>\ï\Êw9÷€Æ‰\Æ/CvH\0öEqû¾8\0d¶4¼}D¼x\î¥õ)\íG•\Æ\è”`7—µ›\"±?`›ñþÌ‚Û·\í[ˆû>\\Þ‹H¯\ëòž\\ølSá¼žY¹+•õ\çôšj\Ðxý7Ø¦ò\íá¼ž»€\î\åQ©·.\\\ÎB¨»o³Àø¤\ÑB®\"…ð`P\î\Ï\Én%À\è\Â\éž/\ÎQd*h‡¢¹\Ê\ÎWeh\Þ›6\ãðnø-A\Ünz6¸RY\î?ˆ?\ä£\Ð;h+X\à¨Z$.Œ½¾ò%\0–ž\Ëù\à:¶\Û(’ðAž\Êª™TW…jwH\Ø,e[’\Õ\0ù%\ë·\î ù†|.h\ÝúÏ!šb\ÑlrMnø,›¨s›7h\Â\Øúõ‰,ðß²û\Éò°%Yðcs\Ã\0{‚P\Âý\æA¾r*Q£1ƒx\É3R&¸£a\ëGù£EýBK´\Éðµˆ‚L\Å\n–}±ò™hKU\r\ÅÁá†˜\Üü™úX\ÛW\æ	\no#ƒCA‹5J©¬þ96\\Þ¡\ì\ß9”Gò<A\íÝ½3ÝšmµUœ\ØÉ¿…!¤\Ó\î¾7ù—\á®\Ò\\Kºƒ%œ£J·ø\æl6\Í\Ò@:D¨¤\ë\\\Ñ@\à\Ðp\ÃÁkü\Å\àt|Vò…ÍŠÿ©IO7]Q¼\Ék!²®7<	\Ü,\\&[{C¶…R¾\ï³Myu\ÔÀ%ŠÎ±h¸¢u<\Ü0\ËuˆiÉ«!_=¶©À—þ€mjé„ƒ\Z¸2\Ýz(“7VI÷ÀpWYxŸ}’o­ß„7\Ï,Ü»Kc\Æ\\·Ý–j\Ã\ÚK÷p£p1mWNú­\ÉZ\ë}#Nh‰uy´\éŠjùÁ½E–\ã\Ã\å\ÆÃ±ù„¢[\Ç\0Eä»‘\ße \ÎK…Le\'jC´ü`\é\Ò	\à»BD»‰\×\Ä\ì˜O\éA5Ÿ#g\ÃY4t“\Õ\nYôÁ\ê!\í¨p\á\Þ\ÐUoÀ\Õ4\\Ø¥X5³\rB\é¯<PÖž »R\Ù\Ö\Ã\Ã]\n¸\àfl\Æt]\Ï`;A©R´1\0CW†²NÞ¹\0\0\ìIDAT‘.Z\ÕF¼\Ö»\Ëyc2bo9¶¥IÓ‹‘h§P\ÚV¼%\Æ\à\âPª¹›ª6Ü‡M–K{Ql C³\Ò|[Â…½úMI™F¼\Å:-¤«U«}\á\Øp\×\è\n®.¢™SóŠw¦ \ì@ÀU(+2\å5ý&\Ú\0\×\åõž£\Âq‡_T\×b\ËÜ¾4#Ž`é–† „\Ê{\ÔV\Ðo›:\áÁ\áº\Ô¨’\ïf\Ü;\Ð;ó\Þ\Âl+Oˆ\×I\ê\ZMQÇ˜…›;¸\ÐÁ\áFËl›xY¬„UDPú,\Ø¡p„‰‚H7gh:Ž¨\í pÇ¸Þ’\ïøR‚\ÅV\Öa W“\nP­5¶\Ír@ÀCMUnZ•G´ƒ\Â]b“;t\no\r°\0L{6\ÜBƒ\ìP\Ç¨\'\n9”EšÍ‡\ä=r¥Ö±áª†\ÎF¼®\ç‘†½/\âŽ!M\å¿ké¢‘mòVÝš3žsS·\Zn\ÏLƒŸ†ñ\æaEþ\ÏöpO\"Û”U«F1\ã¨n„@\í\Þ8g€KRó\àZM\Â\"gW4“ŒO\ÍÀd½!NÁ¬lùŸ\r\Ò%jm:#ðw×¥&V\íNl¦˜\\™\\\è&`¨w\ÙbC¶1\Ð\Ü¹¬«i‹sP¸j³¬‹óˆ4ªY`æª‚j÷B§*\Ûk \ÇM5+\ë\naY\Û\ÕG†kj+\Ív\Ê}÷¢\Úó†*ü²\Âu)^€\Òñ”uhãº¼¼aY6Š\ã\Æ(f\ÝÐŒl\ÑN\Z°bÛ¸ñÉÀý‹&‚xÙµ+\Ü\áo\ìf µôyd[\n\Ò\È0ö-þ€–\0#\ßó\Òžûã‚¿øª/\Íqj¤ æ»¥\Üvº+9 ±‚\çcz\Ülfc~š¡i\Ê\Ê¡Bù\æ\Û\Ê|L\ë«}\Õ)\Ý*0iE\è¥hzf«K×ƒ\Ë\r\Ì\Úë½½4˜\ÙXm¶E˜F´kÁ\Í\rÌ»\ÙE¨`h£„\Ú2Y\É%Éˆv5¸B\×÷(†Æ’ù\Ð2;”µ\Ì6±\Å|‰õrp“v9±¬\"4Tk\Í6~ÁŸ(<;$\ÜT\âNAj Üš\ë\â†j[)\"Tw¡»\Ü\\ãž»	\"B\Î(t\Öu¡¥Z\Ôm\Íc\îMºh¸K\Âõ#\Ó\r\â3h®›[\é‚^\Ë\Õ`%Ö	\rº*Ü‡78\Ó Þª\×\ã*‡­²šjgN÷:¸*\ÜI*²5`\Ä^V¸w¤\ìf¹\ÜÀÍ¯wR\Ý[”c¾„2\ÒúF\'.{CÙ¦{ø\'\í\×\'Ö¨µj@zq±{5zŸg\Åþ‹Oô\ßh¯¾°&\Ýwt\ãn’ÿGŸ\è€p\å\ÅqÁw’\ïªq\î\Øû\Õ×†›^õ©÷=Mˆ‹\å±ñŸ\è\àp\ÕË3/Ãµ\ì8,\äŽ?½ó	pOú\êÿû\Òm6PL\Ã\0\0\0\0IEND®B`‚','1','1');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_colors`
--

DROP TABLE IF EXISTS `product_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_colors` (
  `product_id` varchar(255) NOT NULL,
  `colors_id` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`colors_id`),
  KEY `fk_procol_on_color` (`colors_id`),
  CONSTRAINT `fk_procol_on_color` FOREIGN KEY (`colors_id`) REFERENCES `color` (`id`),
  CONSTRAINT `fk_procol_on_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_colors`
--

LOCK TABLES `product_colors` WRITE;
/*!40000 ALTER TABLE `product_colors` DISABLE KEYS */;
INSERT INTO `product_colors` VALUES ('1','1'),('10','1'),('2','1'),('3','1'),('4','1'),('5','1'),('6','1'),('7','1'),('8','1'),('9','1'),('9b115ef4-ac24-4bec-821d-1b87e672ad96','1'),('1','2'),('2','2'),('3','2'),('4','2'),('5','2');
/*!40000 ALTER TABLE `product_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sizes` (
  `product_id` varchar(255) NOT NULL,
  `sizes_id` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`sizes_id`),
  KEY `fk_prosiz_on_size` (`sizes_id`),
  CONSTRAINT `fk_prosiz_on_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_prosiz_on_size` FOREIGN KEY (`sizes_id`) REFERENCES `size` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sizes`
--

LOCK TABLES `product_sizes` WRITE;
/*!40000 ALTER TABLE `product_sizes` DISABLE KEYS */;
INSERT INTO `product_sizes` VALUES ('1','1'),('10','1'),('2','1'),('3','1'),('4','1'),('5','1'),('6','1'),('7','1'),('8','1'),('9','1'),('9b115ef4-ac24-4bec-821d-1b87e672ad96','1'),('1','2'),('2','2'),('3','2'),('4','2'),('5','2');
/*!40000 ALTER TABLE `product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` varchar(255) NOT NULL,
  `rating` double DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_RATING_ON_CUSTOMER` (`customer_id`),
  KEY `FK_RATING_ON_PRODUCT` (`product_id`),
  CONSTRAINT `FK_RATING_ON_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_RATING_ON_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('ADMIN','ADMIN'),('USER','USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES ('1','L'),('2','M');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `style` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` VALUES ('1','Modern'),('2','Streetwear'),('3','Colorful'),('4','Patchwork'),('5','Bohemian'),('6','Vintage');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-02 14:25:15
