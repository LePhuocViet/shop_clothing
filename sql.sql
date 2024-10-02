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
INSERT INTO `customer` VALUES ('1','username1','06 Bạch Đằng, Đà Nẵng','08394875947','username1@gmail.com','2'),('2','username2','36 Thạch Hũ, Đà Nẵng','03948495867','username2@gmail.com','3');
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
INSERT INTO `orders` VALUES ('ab2ff68d-5182-4d1b-ba4e-9e725d7bc00b',43,1231.7999999999997,'06 Bạch Đằng, Đà Nẵng','cash','2024-10-02 13:55:30','2024-10-05 13:55:30','1');
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
INSERT INTO `product` VALUES ('1','Clothing1',19.2,'Clothing description',NULL,'1','1'),('10','Clothing10',54,'Clothing description',NULL,'1','1'),('2','Clothing2',45.8,'Clothing description',NULL,'1','2'),('3','Clothing3',23.6,'Clothing description',NULL,'1','1'),('4','Clothing4',23.7,'Clothing description',NULL,'1','3'),('5','Clothing5',12.6,'Clothing description',NULL,'1','5'),('6','Clothing6',87.8,'Clothing description',NULL,'1','4'),('7','Clothing7',45,'Clothing description',NULL,'1','1'),('8','Clothing8',76,'Clothing description',NULL,'1','2'),('9','Clothing9',78.7,'Clothing description',NULL,'1','3'),('9b115ef4-ac24-4bec-821d-1b87e672ad96','clothingtest',30,'clothingtest',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\\\0\0�\0\0\0��ډ\0\0\0`PLTE��w�U)�\�Kم,��X\�w%\0\�\�\����\�A��G\�4\�=SXC	J4m�QX�J�\�bJ�@�d\'����\�s[�|5-o%��?�\�b������\�̽.\�b\�\0\0 \0IDATx\�\�\�\�:F#���\�ȑ���8	\���׮�ͦ{�AxF�\Z�C\�s�\�\�\�\��\�O�v�\�\�\�\���\�lײ|\���ў\�rpK._��x�\�>\�-�\���[G{�\0-\Z.|!\�\�\�]\�\0�:2\�F6�\�\�O�R`+\�N�\�Fd=\���(喥\�D�\��\���\�G�NG\�\�_�\��\�}�\�l�l���/\�]�\�|?�/;\�\�~\�>z\�\n\�\"[{Ӕ\��\�}��9��{�����9�_��\�9[\n;\�U���-\��N�Q7\�\'�\"\�\�]\�\�\�\�*+\n)[�z�]��a�\�m?\n�GQ�\�f\�Y�\"Е����%7F��\�ϝ�@�6�\�n\�Q��yO��4��\�\r�\�$�­.=��;zQ0\�X�᧱\�Ծpk\�\�a7--\"\�\0\�\�z�\��/\\��~7������\�ǏLga9/\�=>n\���f\�p\�/鼃m�,��絅��O3\�?nO%�1$\Z\�\���G��K�#�(r�y\�\�o��\\��;���=S\�F+��q�ᆠaWx\"\�ӆ��6�B�\�p�pk�r^ÝC6B�\�Ea{Z��3G��isG�%�H�\�b\�&3����x\�؜���\�i\�SBe\�<�Ҷ�f��D���\�\�Ţ3�vT���\�$\�]�\n\�-�\�t\�3bAޠ\�b�\�\�ߒD\�\���\�\�G�%��(�&\��\�\�UA�Ba�\�l���:/�a\�\��\��۲(f��M\'\�\�$wy\\\��v\n\�F�N��\n�\�\���ne柒,竂�\�Ƌg��Ω�E{\�ֹcK���IA�\�Fs��\��.J�\n�oI*gf\�\�\�ZsT.J�d�	�,�P�7�\�\��\�\0���\�:=`#O%�V�\�.��\�\�#ː��\�\�[b\�\�\�*o��{��n\�K�4�U�3µl�\�G��*I��~\�`�\��)\�;���X�@B\�\�\�d.�e40�\�މ��W���	��»Iе�[״�ׅ�m�\�H��ʦ7\�ς\�4=KC�\�k���z�\�\Z��tl\�[(B�M$\�Ň����=ߧd�@��|\�1\�\��hr\�!�`ЩOb�.\�?Ls�*\�`��sf60n�ޝ.]\�\�\"[@;\�>5즄��\�c\��\�Zje5w\��\\\�Kfl��i\�\�\�t|\\/�[Ǭ�\�W�\��zK�\�i���\�߀[�ܺ\���P۫8bj����(\���\�������?\�\�\�\�1<��� �G)Z\�\�\�v\�\Zc��\��`\�\�wQ�l\�J7\�v+B�r�߰�?7d$N��lSޯ\�b<]HX-�\�w��}\�\�Ռ0H�y\�=N�1\�x\���\�r[K�xaK8\�\'Ї�\r\�\�I\�qZ74A.�8\\�p�\�}k�>\�ϕ\Z\�\�cz\�\�M\0�f\Z�\�)\\q�\'h�X\n��\�Ewyk�>s\�\'�\��ű��\���\�\�\"4���y/@t\�w��\�rX\�\� KXy�o\�,L�	�v�²%�p\��Iݷ���]R\�W�؈\�\�\�IU\�\�ͪ�\Z\�w�c�\�p�)�m�w0�`�g�ؚϵ�H#\\\�W;Z\�\�,�\�\�!�,\�*Jق!^�ͭJj\�h��p���py\�h�!ܒ�\���\Z�IAL\�2�&�\�Z\�R\r�\�\�w��\�\�af�h(u\�\�\���m�Y1�N�\�3\�\�)(1\�ʄL\�h1\�\�?\0�X����\�e�\��d�*Xz�K��xEL�WÕ�M~\nw���,,T4�\n�\�\��\�b?,�lSqZ6$��l]���\�\�zA��\�\�&\�\�k\�*L�<��%�<!\�[\�q\�-\�\�e��\�H�p�\�4\�=P\�\�ZH�\n�\�.����`\�Q�\rj��[���P2��Ywqh\�8\�Y��\�e\r\�(Ӫ\�\�u}\�\�MJ\n\�9��\�\�\\�j.u��\�\�!�\�~�\�]�\�ww��\�ZO��m]��u?�pgL<��\�H^�\�\�?9Y�íA֥\�ó�ϡ.[3cl�Rs�F�E��\�NS\�\�-^��u�.^c_\�\�\�t떿\0�h\�V�a?#.D7<��	گؚ��^\0\��&\�\�\�n���ҭŻ�\r\�-�^rk�=�\��S:i4��\�,\��\�O���\�T\'wB��O\�pNV�\�m�\\��i7$��\�i�{�qڿ\n����O�\�x\�#a���j\�u?�0\��\�\�\�SPlf!�\n�\�r1>�\�.\0\�B=\\K�U��z���!��i\�iuج=.Fhbj�\�\�]���eU���\�\���1\�\�\Z�9\�\�s�\��^\�Z\�b�q\�\�ʽ+<\�I�*x;\��\�L�2\�m�\Z�\"�!�]3+�D_�N�\�0F.I�*p\�lxӂ�\��_w\�/�����	ͱbOr\�55]��RU(\��\�T<rϭ*\�&ȋ\���&\�`�\�a��X􁎒\0��\�hS��\�W\�{lߵ ڭ�\�u^�k����Y��A��\��nX���?�\�\�q�ok\�m\�\�hz%9��?�zn��rڢ�\� M(\�Df\�5\�~\�h\�\�E�*h\�=�\�1\�ݺ�^v�T@\��k[w	:Q\�\�\�s�s|v�c:F\�<y��}�d��\���\�\�x7���\Z\r\��5\�sn�\��O\�\"\�\�{\�jϮ-�왬ʔ`0�j�BE˃\�/&w�6�<d?��\r���\�ۛ�ڙ\�\�\��\�ra�w\���B\�Yp�Rk?\�KT����C>\�\�T���Vhj��\�5\\©�p+�?4\\���;�@�}\�2ۤ4\�H�\�ڗ\rf\�(ro�\�v.��\�,k\\w\�2[7/��\�\�--C|����\�C`�	\�t8�q�h�\r�\�\�o���\�YfM>~򁷎5��\�\��\�\��\�e����$�VrǿZZ�iwZ٬V���8��V\�\�9\�\�\�j|�\�\r{�6U�2�[�\n.��7\�\��x)D\�I%�6�����hI��>���^	���\\\�\�[,\�\r��w=R�ҽ�;��堿\�Δ��,\�t!�=?\Z�\�\�O��\�#\�3\�F�m\0\�\�5�\�_\�o7�\�\�\�\�6Ӫ�PP�߇/\�\'GJ\�\�\�\�[%�%!M\'�ѝ�\�&N�\�\�\�pۚ�Q�w�xq�R]1�\�_iĳfe< �3�0V6)\�\�\�s�\�\�h�\�F׷]r\���ls�;\�!\�)���8W\�x�\��a\�\�\��6�&�u�a8�Z\�\�ݶ%\�\'\0��^\�\�w\r�>��P�\"d\��\�\n�\���D;\�pM��&���9�\�!�ݢ&�\���b{���\r\�{�)\�\�:\�.L��>ŝ]ML�Y.\�5�]\�\n\�O�\nd̝�z�\�\�q{\�-\�\�O\�6\�n��\� �U,t�C>�\��\�]R�\�G�\�\�C\�l�\\\�x\�zW��B\�\�m\�#����۴��d�>��\�\�\�-���霮8\�\�F7�ȋ\�\�$��#�˖����\Z�&��X�YEY7�]\�\�+M\�\�+\�Ѧ뒓\�\�}���\�|0�\�\�ٯ�\�\"�����X���(\�|I\�\��d�k������Ĕ^�k�\� \�f;��a�qE�	ٔ\�)_��\�\�ë\�\�+;\�:�\�ũ\rU�Zd�\�W��\�p\��r?h�\�\�\�fqa�\�$�\�5\r�2��Ɯ��#{�Fk�_,[�\�u\�^ds�\�j���Kń\��Dq$��e��\rl�\�+�-&6<�R��{hm\�`c�RX���L��\���o!\r\�ަ\�@Y�]����5\��\r5\�ʀ�s��|,\�)	<7ۈ��c\�o%Y�t�[���\�\r����z�\�S\n<�\�\�\�.�\�\\�\�\�6����y�k�^�œR�]A(\�\r,\�K.N.@֫-�fk�% W\�\�dن�I\��-\�e�\�\�\�-�db[~Ķ\�ҽ%l\�\�\�\����\�ڵ(��\�@0\�خP\�CK���\�ؒeɏ\�\�l��jnΥi\�R[�oo�	HT5-a]b�J�\�����M)kI\�j	`K��/�l��\�\�0�ܓ\0��(\�z2lCv��`�9�3\�jV����\�\rOh���PW#�Z[��w�\r\r\�M��܏\�b��\Z\�61��n|�\�1 \r��\�.�\�]�A\�2\�\nl9c%o�\�\�\�\�]hx��Z\�\�\�夞kӈz4��Z��6��H\�\Z�<J iM+٭j�z॒\0gu\r^\�����\'���ԏ-\�an�\�un\�ș��+\���\�9V2]\�}m2�pÈ�)���u������VЍ\�vm�w���O���\��)\rlJ<�[n\�0�x\�8�?��Z�\�C8����\�D\�\�F\�\�\�*\n\�pV�\�\�p��af\��\�ϖ\n\�Hށ\�Eloc�\�\�\�Xl�\�eئ�\�^FZ���\�FY�.b\�\�\�q\�\Z-�2��{swt.��\�\�\�J\�K~�u\��.�Ef~�\\����\npd��~as㐣anV��c6B����h܌?��!/\Z\Z�\��`.Kb]\�,��\�o�N\�\�J2h#�\�_n�$�(�\���\�S7?�\�qȧ���\�@h�&\�;g�ȳj�A�����R�\0ɘtt�/\��\�\�\�\�\�e4��TBAr{\�w�2�\�Fp�l<\�Fl\��)��a\�\�\"%�\�u��i\�3ܧ]\�Ih�sZh\��z������\�\�\�Ug���Tl�.�\�.�\�x�b��\�m����\"5X\01\�ئI^	\�R&\�/S]\�\�\�>\\W�\�-��Ҁ\�F\�\�s\�-r���\�ؠ�\��\�����RI`�\\ \�M�\�r��w\Z8��\�bX�\����\�\��V�֣���T\���QX϶\��\�Q\�,ܚ�!�e�p�]~�(\0Ǹ�\�d҂��,L�\�*�\�R]\�\�\�~T\�wP����_�\�\��\"!\�$n)�=\����y.�2��sҵ\r\�q��f��\�\�D\�yi������@\�\��b�\�FqP�F@w�.p�B�c\'��G;?��(d�l\�y(���\�)\�+�vM嗒�\�Kk��%���\�kY\�\�v�q҄=DxMD���8�/�r�G�\�͵\�%�7�m�\��\�ƹ*a,V���k�0�\�_\�P��\�0i	�F]\0\�l��\�\�\�3ښ-��Vlc��(�>\�eNqϖ̘� ���2�`�FLˌ��\�j�l↷,T\0��-��׀\�.a�\��RE�+(�*��tU9>5B�[��\�\"��^�\'�\�ˢ:�ɠ��Aੋ+]D\�\�o�\�֖\�iq93\�\�w\r\�y�C-z�T\�\���\�\�<n�.5lsq!��D�ំb�\�g!^Ph,f\�\�_1\0���\�\�W<\�І%\�]s\�\�ϓj\�y�?�\�Tw���$lU%L�;w�$.Y4!BU}�Q\�\� uiu�\���?4\�\r\�G\�\�/\���_u�(\���O\�d-�ĥZ+P�iA\Z�ډ�����%UH%\\x_E?�5�5\�\���>\�ĝ~[���l��\��\'\�V�\�\�\�3��\�\�D]�*DȰe�\"2��ׁ}�.�9����	}�ٻ\����@\�ׯg9�\�����\�J}��\�I0\��(�s1 �KU���e �y\�c�\�\�\�.��ކ(�3\������y=ß\�`\�_�x���Ţ0�1sok��\�/{܈�#�Fź�,\�0-s\�\�Er�\�uM\�֐<�p7_\�\�>�Pc��=����|.\n\n\�j\�]��\�IE\�*4lY���)\��X��\��o�\��5\�]0xY\�\�\����l\�|��2̢kv\�-f�1\�@e2Hޣ�\no\�B��2I`\���f;�x���\�\�p�F\�%tMEv\�&����O\�>�g�\�C\nN\�\�l�g\��\�S��__����\�a\�$�\�M\�\�\�R\��:	5\�.XԤ\�\�s땆ґ\�\�ocX:Н��\�埅G$�37�<JSU]\�Ʊ��\�(�<���\n\�uQr�\�HZ	--j��3֖�\�e��\�3n�\�d�u\�̭᛺��@\�\�\n\nq��\�Z�������\0mԀ\��,\�nQ��\�\�\�r�F��e�\�s��g�n}��3�K0��q���\�\�\�<� �sA��~\�u@��+�ݲg�\�{��o\���\�t���\��A[\�\�\�S\nL�g���\�	C�V!�N˭r�\�	[՜a��!ƴ�t��\��<\�)���\�\�W߯\�c�ٸ\�q/)\�]�X�%^\�6�*S���M*�張�\\\�\�\�%\�7�U\�\���?\�P�r\�K\�ḡ\�o犅\�)��%\�j�W�5!\no(\�z^�A�\nl�ޮ�\�*\�l�\�6����\'�\�\�cږ\�e���>��C\�\�0�\�,��²�\ntP٭:JQ�G���T\�E��\�\��	*�8h�\�,i(hk\��\��lK\�2d�\�B\�=�\�mI�b��3uOn\0���|�����>ź&\"�\�*Eɢu��\�\�(���΢�7\�+�v\��}ؖ$\�\�\0Ck��R�\�S9 ��\��s�Y�\���3J\n�\�<}x�\�Vonznߞ�P(�6+GҬ������<�o�ے{H�\����\�\�\��TvĒ?ci\�:\�b\��E	~\r��T�G\�r�\rV��\'\�\�\�L8J2y�\�-��}\�*����\�NA�+\�尵�\��۪rh/4�\�z\�g0\�|�ab\�ꢪ��ŧ�+\�:�*\�Y�e	�\�,�\�a\�=;�\�M_�0��VAr�94t\���\�j�C��ՌֲZ�#\�`�\�i�i{�Y^Ւ$�K�6\�\Z\�١M\�\��u�\�R�R\�\���^�ӂZ�Weu�ޑ���Em3w\Z�$�g�+\�\�`�\�锌I�J\\M^z�\�Ft��\��*\�K�Jy�t\�%l��l\�\�\�ф�\��3_\�F\�\\FS\�W���\nߚ6�\�.\"\���b�.\�b+\�n�.p�V���)\��}�(	E{5��\���\�\�����A|\�C8V�\�:Y����$G\�7\�w\��×幤�e.f\�>Mگ1z\�\�A\�m�-\"=�pLEhî��RK[-�Es\��\�;\r\�Z\�avZ\�d�[�I\���\���t+a�\�4\���\r\�\n<�+8v�9\�J���P�m\�g3\�\�N\�mN\�O��l�\�=��\nfXn\�Ԫ��utXױ\�b\��5L��\�\�\n�i�6$]{��{��痢5L\�b4�\�t;�\�i�����\��7|\�\�,o�ּ�<o\�S\�@w��K�l�֦�\��&&�:u�a\�2P�\�\'��4�\�\��\�D��\�$\�ɀ�2�a�\�F�\�\�N\Z�{XW\�]΍E�\�\r\\pCe]\�]�\�!m\���T\�\'��ϭiq��`\�	��\�K�d\�\�\�\�������E\�3\���\�v(6B��y\�E�\"\�\�I\�x�޵�.b\�\�u���\�c��.۟�\�~���=\� ��D���b�T\\1N	Z��r�%�������[�6\�~�\ruZȨ*���6\�\�J|�\�\\�c\�\�O��\�\�Z�\�\�vav\�\�u\�\�Í\�\�\�UJuE\�mߴE�~�ҟ�,&3Y�f�Ԓ@4��i�W��\�c\�\�iZG\�̣Y�a�r҄�8ߪ�#�%g>\�-\r���Q\�\�%\�wl�ϛ�\�&cQ\'\"�$�ǻ���BgM\��~�i�t�+\�\�c�\�\�\�;�$�\n\�D\�4\�o�\'u�7#\�\�e\�\"@?��F[�;U\�z[E�j�[P�k7ü#Q�r�����}紹�\�ec���@\�|��������V\'d!B��%m�\�v\�Ҫ�\�k�M\�\0\�I:]\�\�	.\��1>��\'?^a[��g_$�\�0�u\�mv<k݌\�*McE\�2�\����m��M�=rI@\�\��\�\�\�72���S\�\�\�¶ޝ���±�3	\�T\�!�����\Z�B�/�V[*��\��\�w�\�\�F�\n-�\r\�^a\�̝���\��+Dqj\�ֆ�\0ϲ�9�\�ڶx�%��Pw�冢a\03d-�!\��(?.&�\rh\����U[��m׶�\\NvAcj8	���\�%[3ɒ�}\�m���,K\�-\�`\�\�Va\�\r��\�\�g�C.I� kil�hI��\�\�j�<rQ\�:p\�\�5��\�İ-��E-��YŬ>\����\�*k�BV���k_Im\�;V�}\�\�/Y�N�s���LEآq�|\�\�7}�S-ּ�\n\�ڜ�lZ��_����(�\�i\�\'\�^m\�\�բt+�\ng\"N�\�掀N8�)\�K���ø\�>\�\��Zt�yt�&/^^��\�\�,~|��tf�\�\�\�\�C�!Ǜڔ�\�Y�\�1\\�\0\�ӧ_\�T.3�\�\�\�\�Tw:\0\\��6F�-uۮ���p�Un��\��\�\�/hI�\�\�\�\���-\�\�K\�P�\�]`=�>v{>��\�\�3.�j�\\\�\�P���\nV\�#\�\nQ\"�\���O\�\�i\��;�ÞP�\�\�\�ɯ��\�\��\�\��\�t��S�6Fmȷ<I��\�`k�_�K�A�\r\�&3^�~�L�\�$�I&U��\�\r\�{��6c^O灍�EU-:\�|b\�>\�\�Po��`\�\�a[ގ\\S��K�	\�S��h?էTST�/\0]�\���A\�\�F6LP�\�\�1�\�a�A\�#�>-�\��[\�!�3�\�9�\��pWS?�;D\�)I\�4#\�9|�5=\��\��h%\�D��-�\�8\0���gʴ Rn\�_\�.�aX\����\���û�b�C\n��\r.��q��\���<_þf��$�\0\�\"t!�X\�-̆bhz\��5��a1vy]\�|\�\�4|\Z\�\�\�J̤\\�\�K����Y��$��ύ\Z[\�8�\�}1�q-\�\�󛬬��>3\0w�\���Y�\�#\�㗕��r�\�1Bۢ&\�8\�|/!�\�\�\"�\��m̼gӅ\0k@bpQ�\�B��\�0*�xS\�Xs�}�n~��\�w[�\�Z��\�z\�Cmn��\0\�p|c	����1ƨ���\�>�S���\0\0 \0IDAT���\Z�\�A/\�-xt\�\��?Ϟ�LH���\�\�/T+QB%�L2.\�&\�UBB��۵��\�\�-���W\�͛\�\�S֯\�$\�8�uy�&��?\��\�m?�Y�+\�&\�;-\\\�PwF�\�/Gc�n\�[F%\\\�\�(ג�恫�.��=�\�\�쭽c�\'�3y�Xw�\�\�\Z>\"�Aq\�g\r�G\�Bp�\��K\�$�dwF\�D�o\�c,i}q�o\r�cJ37���.8\���\�<\�\r\Z���P�Is\��J9t�\�%TR:\Z���e��c\�s\�	�TV0\'Zw����۔��3\�L\rK���@�\���Q\�\"�8.���\r&\��ǪH�˧e\nWv�8p�\�\r)�\�\��#G \�)�?�\\�s\�\�+Ie�\�\�}���2h`y �r+k \�qK\�W�\�\�*c��Mʅ\"���L��g�\r\�́\�\�\�&)\\�\�ya�\�ĳ�gZ\��\"�-^P&8V5\�\�>���a\�\\Qp\��V\�\�*1g�\�{Ђ\n.�\0\ra-E~\�=S�eT{A\�y�/(H�ٰ+��[\Z\\\� zMz>W�|���\\ن@7\��\�>\Z[\��\n������l��\�4jC��4OB�@w�o(pUbrr\��R^\�w@���{)�\�7�\�;�׷\�\�A��b���Mm\�᠊���j1�dOoi�=/t\��5\�5(��zϼRj�\�\�;u+��}:��\�5�\�njQ���\�\�vl�IA5ēۘ�sx��\�+���\�X9n\�|`�+Fn\�6[	��\'U�\�:\�}C�Y�R3\�(	��y9���{\�=2\�!H�3`\�\��.;M\�-�����ա\�\�2����p�\�n�\�u^\�חb:r�w�̻3�T�\�\Z�؊,%\�\�A�1\0k\�%7�-�c\�#tg*p]Z�\�]�]\�Z\�rÑ{�r�.\\\�\�Iw{1\����o��\�W,�\��V\�$q�`\�\�\n\�\'\�\Zܹ\0nl�\�΍�Etox9~}�x��\�\'�\�\�M}Z�I[Fc;\�M/6b����Ω\Z�P{\�E\�U� \����}���=�Vav;8��z\�@(�k�u+��\�\�l��\�r\�+��|4ޑn��\��9#Q\�J\��`.ۖ��x.�&a\�X\�v�7b\�2pU\�-��w<n�[\�\0�\�\�*l��Q\�\�3b�6Lt�w��?B\���k#���dk�$h\�Q��25��\"�ʈ&)h�(��\�\�wܙ�\�M�\�\�V\"\�\�\��V�%��O>hp?ƆY��Rd�;lE9!\�\�E�=��\��2�F\Z\\z�\�W��\�\��[\r\'\�\�S�xѝ\�Ƣ8�m��\�\��\�\��Ll,���b�~�\��A�1r�\nׇ�F�墳ϯߘ��<vm�ZYj��{\�\�.������\�v�\�\��!rq\�%\���S\�^&�,����o�5��rY�\�\��i��^�^\�k�����lRv\�\�_Lh�\�\�ij.C`&R\�\0O^\�̱0a`Ed\�a\'�-.��ђ����}=}\�t\���\�L%�\�2f�U��0yWzU��ɰ�ĕN���0���\�\�Њr��\�S$�ڝ)�\Z˴M]0t�\�\\���y;.��K�=\0n��FIt�鄡x��9q �Ж\��g\�qy�l\�z5�\�I�Hw�!h)F�\�7�x\�wn�\�\�\�d\"�]�p\�e\�^\��gc�;�&�X\\�\�h\'9\�>������7����[z.������9��@�7\Z�qh��L�����hxs\�\�\������7�1^�m�4�9Fҷ�\�zeJ�YM5���W�\�\�|	]\�~ <a#\�b�*i�A\�2X�\�5\�\�03v6�̲\�	�ɨQǟ\�\�^>?s჉^µ\"F�3�\�Џ�\�)�\�\�\�\��q.\�u\�|\��s�\�/\�Y��ZlqV\�jԻ�\�=\�!�9��3P�쮻�\0\�]\�\r\'N�c/\�	M1���V�g\ZV�]sdO�\�U.� �\Z5٩\\��:n�YJTG�\��Oô��\�N�I,γ�\�\��	��}8\�\�$ϓ\�dй��[���-lqV؊\0?�6V�\0\�\�F\�\��GD2G@=B�/�9\�S�~\�f��~��n��\��\����\�/V�\��{�) T��=݃�\�_�]�3{k\�\��]\�	�m��`ۅ�-`��4g\�ǿy\�Z���\�\��B\��ց�aW\�rfws\�\�ɱ\��IHܝ\r	���Z��3\�f\��\�n;~J\�\��\�p�\�\r�\�+\�����֪\�\�H3���Dy�$\�A6x\�\�Q��Vj��/ \�M\�nmۉJZ�C{�\�X\0\�\07,\�Z.|Cܑ�K�\�\�2�-�ME�Q� q\�~9�M\�\���䍶�Ք��\�ktՋ��\���M\�m\�rU�\�T\�8]Rl�\'Ĥ�����\�W�?���ZWU��M�^�#\�\�\�gqvk�\"p5�c=�f%�I\n�_W�7!tM�\�\�iF�2\�\'\�\�\\A\�LO\��t�S�:v�8�z\rj\�FYVO\�-e\�\nC�[97X�X#�+捩\�\Z�\�w��a�b7�\��޷ȡ�r\�-4o\�-}6�\�\nd\�N\nv�\�\\\Z�U\�ja�\�,ږ\�\n[��\�r�3�\�\Z7F	��\�D0��Z����\�\�m>\"�����\r\�0Ul_ݫs�5�v�0�h\�*)�:v#��\0�N)�8��\�b	\'	4d��̓\�\�a��\�klg�\n�xK}\�q\�g-�\��\��ƚ����	:�����=\�\�)D_�z\�\\�j]�\�wB\�mix]ϱ�+\�\�fK��\�f����ΐ[��:Q��t�js\�:�׭g�\�V_��s��\�\�\\]j�\r��B�LL��4(leʼg�y.\�6SC�\��\0[ӱ�!$�h/\Zhc{�!\�^w��M__�\�w�\�\�@�O~\�syH=��\��)�NK�n��thC<ڬ�l�_d�G\�\�ٱ^7\�ZSF&X��@�@u�\�-%\��dS��RB\�,���g�B�`���Y�\�\rK\�v��a4ಗ\�\�,kи�-&��\���\0\���tk+ej�nV�i��\�^�Y\�[\0y7u֦kj�ѳ�7\�<m~1�\0aN�b�h\�\ZD����\��\�\�T<w��mؤ\�V�v-�\�mf0%\��m�*U��[\�]O~\��\�(��cj�\r\�\�]Ok(:�\�E�\��읋r\�6��1L�/�=�qm\��-kiw��,\�B�=�3IJ��\�\�޴{p\�\�\�@\�9�y�;~\�V�\�%����d��WI}+\\xQs�v\�v\�m`Lm���\�n{�\�c�=$�j\�l\�*D\�.A�m\�]p�֮\��\�\�z�kc}��v�\�\��O׾\�Z�Vf\�:�D��\�[\'\��[4�\�qM\�7QeƜ�4R\�\�B����\�9V\��\�W\\<.?n\�-��h\'\�\�!#5f���/�\n\��3��^�K	�[\�\�ʹ j\�[�z\\�)\�n�\�[cH�p��b+�ރw\�͇\�]�\�\rh!�;����A���{ǚBTQ}�\�&\��?��D\�c�n7]|n\���\�z��\��\�\�\��\�IX͇3>�\��!��\�\Z�\�Դ�����6\���w�\�7\�V�n\�m�D\�e�(��\�\��v\�X-�\r�S�M�N�zR�Zh4�\�ڃ�\�.\�bm�\�\�\�[�\�߉V���\�\�\rw�/\�5[M�=\�vAߺ\�C+�l����9[\����m53\��\��k�0m�\�\�k�⋊j\�e`|�\�\�V�`\"��^�n�n�;p3sobo\ZV{Eٍk��\�\�\�x\�\���c73��\�2[���wolē[�O�+\�\r)�Ld�|�W\�nN�G\�[t\Z\�z�7hm}Zh\\����%\�!�00�Z~X;כ�\�IM\�\�\�^$�Ztm�\�\�b\�\'\�<\',\��\���������^MP\�\�\�p\"Jj\�=�ӻ\���۫�a3��ŉ\n��l\�\�\�.\�5w\�i:�P�pM\�-�l\�m$]X<$�j\'��\�nF�~�:7�(H��{\��+3?�\�s�i\��#\�?]\n\�\�ZI\�U�\�o�]�\�2\�Dd��\�a�\�3\�\�\n��\�J-\��&\'�+\\UtlE\�ƻ�Æ\�G�\�\�\�Y6\�\r\�\�\'\�qPR�d*�6f\�0Yvp\���\\\�\�\�3l�\�(�N�\�2\�vk�v\�n:��Ӛ�]\\ԧ\�\�jn�A\�;�g��V%��ݖ�ی\� OQOw\�\Z�C�J�p�h\�\�\\l���[�w�\���4%-�.#�\�ÕӚ�A\�M��40,&�0\�\�F\�*}v��\�)\�\�·\�ž� \\\�@`eM�k&f\�Mv\�>�6Ƌ\�\�I�I��\�\�,F�v�X����j}6^�EA,B�\�\�n3������\�\�eم:e�,���\�\�h�)\�\�@w\�p�\�ca@���vc\�ũ!�\�K�+\�o�++�\nn�\�\�{2^\�u�\�\�c>Y\�Y�	C�	bT[+���LZ�Z˽\�Tݯj�\�łEBƛ�\�1\\\"\�3ۭ\�\�\�r�؁�\n8?�Yx0Y~3\�xs�\�N8|Epi8\�AWױ]m��\"\�b20]\�X�}qŞW\���t\�.�4_\��4\�\�\�\Z\�}\�ri\0L~q\�\�$�+b��\�g_g��.�bp{Ӑs��S�\�چ\�\��Qa E�n�tq(1� ��\�\�^��Ip�eo\�\�5o	�\rW�7d��{�=��\Zm��\�!��n�^\�\0VXb2�w@�Ϳ͊.=pu�K�\��EN�]\�j\�r�\�\���^r��\�f�W͌�����\�\"[\�ؚ�\�+\�\�̘\'J#ͽ\�v5\�\�%R���\r\�y\��W/j�T\��g-�cx�x\"x��\�\�g���cv�\�\��t[��\�^ݠB�hͪ\�T-z«\'\�\�s��\�Zq\�ͶޭC���0��8��zL\�;�7�z\�\�\�\�^��Ϩtܚq��\���@\����<R�)�y�\��\�\�Ϫ�τ;.t\�٭��X�[1�\�̨cxwV\n\�u\�n\\�r�avY�o1\�c��f��C�	U-z\�ef(\��s��w��\�܌��I\�b��%\�\�=n\����w\�qx�+��Y(�\�C���\�U\�W2_QɁ\�\�k��^e�\�\�\�:��N\�,�=/w\�,�tu-�_R%��g8���\\\�\�0]Ko\�\�\�\r\�S\�G\�\�\��Y.O��\Z\�\0���b\n۲\�\��G\�>�\�Goa\�Vu�\r���?�����D�\0��,a[{�\�Ec\�J���\�1\�\�\�\�\����c��|�K�\�G��\n{�\�j�\�\�ۋ\�y�]��}�f��7n\�p���\�[�Ww�P�bU�\�N9cH��\�[\�����\�5ݞ{\�A\�2�~\�\�\�`\��;\�&�Q\�\�\r\��^\0��\���/��3�\�kk\\\�@�]\�P[Yo/%\�\��\�a��x�jlm�D7�����\�k��\�\�\��6\�x\�\�f3�*!׾��\�(w����l�\�&\�\��\�hs\�bF�\�6\\>�(v/\�\�-\rě�\��\�\\f���U\�/\�\r\�Q%�U�H��E\�\�\�x\�Ggu�\�\��\�s\�\�>۴{�I�\�(\�(\�S�\�R\�Բ�U�	�7ū?���4p������\��Vo\'�\�Ʒ��y���D\�c`�\�̻�<�\�,�\�\�.�n���;\�^\�[�-\�VYG�\�\��D\�U�g=\\��+^њƧ�\�ѩ60\�m��4B4[p\�I\��k\rW�\�\�:�r�^\�\�_>B\�5Yi�ag\���\�ɡ\���\� O\�:Y��u��\�x�\��ׁ�櫭�(\�\�\n��򓍣\�\�\��~\�`w\�ŋ�\�܀3\�f�ؗ&a\�|,\�25%7�>\�\�-pWt\�\�\�-\�~3M��0f�Ԅ\r��~/�{B�Bv\�<Y<�2qy�\�\�\Z\�m\�_�\��\�\��p~ӣ���\"B�\�o<q19獜��\�u\�\�/��\�sӝ�-$ܽ�ݾ	\Z�SJІ��\r�R]���j�\�U�\��\���&b4�m�\�]\�[�\���\�ɧ��\�V��\�\��!%\�t>����\�/\�\�\�9t#��\���ӀN��\�\�c\�`��\�K��\�\�Q�7hկw>k�efj�w<�n�zZ\ZU���+�q,l\�oj�{5�l�Ui�\n�\�\��\�w6ݏ\�%	袜�k\��ʛͭ*l�!=�Z��A#\�]y\'\�+gn)l��\�V��\�\�\ZT7-$����/�}\�`�7U\�\�i�M\��rPjíJ����\� ͊\�Z�Nz��g��?\0W.h�V�d�\'�ް.\\%�&�卸�-r��\'\��\��(\���`˶��%ܒ\�-)�か��z��\Z�a\�˧\r�\�\�\r7\�\0�Mw\� �{\��\�/+�m��X\\���U��\���+)dllNKS\�\�\�h\�t�nvj\�̌iWD\�e��/�\�Q;_8�\'\�Maj�\Z�ĳ�\�ʆ[*\�΄c�\�䱟���\�qs\0X��Vw\���7\��\�	n\�XnYv8`Kw\�\�4\�\�6GQ-^&#	rwv3\�\�\�s\�c�Ű�>�)\�\"�Xp�\nm�ʨ��%vaǩG�3�XO&�\�\��\�\�\�\�\�\�+\�%�\��Ŋ�l��E�\��;yd�Zu\�3�\�$rkZ\�z(�P�\�\��(F�u\�r\�t\�g�H�\n�\�P��*v4�Kj�\��\�C\�\�N��C�+?/\�|R��>ר�4\��\�?�M\�\�wt遫�Rp�\�ؚ��ڮ�ԣ\�4ܧ�\"�\�X@����J6��˅\�|�\�bh��,�\���\�\0&�\�<D#\���F/�aX̞�{[�Nf�=J�gQ=\�\�\�l�\��D�:\�\�n��㵢%�\07e\��\r��\�\�V�{��厜m\�\n�\�E/Wef�\02ހ\�ƙ���\�\��=\�\�Ld\'Ui<	n�\�2۲�\�=\�\�A�k���[\�*\"ڊ�z�\�\�p\�t���*0B��EC,l�|c�p\�\�Z\ZX��\�n\�h��l\'��\��}z\��\���\�\�V�Uǈl��;\�Ϧ�\�M!\�B�ng�<�\�`B��I�w�[h�q���\�=/f$�\�\ndS	C�S�M׎\"b�\0�6\�.ׅ�\�j\�-\\�E\�n��*�\���n\�g\�E`\r��.�XJ�o7%��\�\�\'�c�EȿUvʜ�/\��5^Zוvu]9��\�*�-)nw|g�院�*&\rNv�\nza$���s�\�pQu;b�W�\�f�Du|k�)T\�p�Z\�BT[-�\��\�\�b��2\�PUe�\0���\nEi���J�p|w\�a@\���-��\�M\�#[\�T\�ӷ��\�ۮ4��/e]|Ԧ�\\\�B~z�23Y|�3\n\��p�h�g\��\�x\�l*�\�0\\�P�zp��`�\�\�\��)�h�6_�/g\'��\Z�:`���i�?�,�R�}�\�\�3뙁~�J�\Z0],i�ʵ-��ɜe��wv\�m\�0\���u�ᅋ)\���k 	�G�\�&�,\�ͤ\�Mj::A�\�\0\�ͱ\�\�\�N��-,l�\�3]3��/c<�\�L\�tM���\�{ʫ9�Wz�\�\�\�#y=�~UR�\�^\�\��W�Up!�h\�\�\�eͥ��\��@փ����\�\�s�o�\�f��\r-\�T�\��P�\��u\�\�E��\�{\0\\\�U�\�-�$l�\�<\0\�2NW\�+6�\�?����\�=|q��\�bu\��:\�\�M\��>2?\�\�Ɨ ~|ŵW3�1p�\��Ń?�r#\�{\�}�ɭ��3���(��c\��oln��O�;M^�\�C�\"\�\�#�\�I�\�\�,��i�]Ĝ9~�\��A\�n0M�w��e���\�Qz�t��\�\�\'��\�-�B��>[�\��7�J�C}Se\'��\\a\�=�\�\r\�-\\7|Kv�c�T�ĥm���\�*��)p=\�`	��o�\�;1K�+\�e�F��G�h�j{>A{��O�\�~Q͢7\�s�{\�A\"�\Z�/H�\��	!���Aح\��ݲf\�dв��XD�\�$3\�{\�<���bi\��1��\�e\��Kv��s&�/ \�A�\�&��\�\�\�d�\�i��d��\�\�\Z��\�\�B�+\�*=@}�\�x!��\\\�K�߆\�ώo\�wZC�����\�\�^�U��r��t\�{�\�\�ֳ\�\r� \�/�\�\�\���uQ�e(z�ױ8ϜǓ\�]B*<\�Uö^\�zvQ۪�/���\�\�\�\n\�\�g����\�_*�\���\�&�9����>\�\�w9��Ɖ\�/CvH\0�Eq��8\0d�4�}D�x\��)\�G�\�\�`7���\"�?`���̂۷\�[��>\\ދH�\��\\�lS἞Y�+��\���j�\�x�7ئ�\�἞��\�\�Q��.\\\�B���o����\�B�\"��`P\�\�\�n%�\�\�\�/\�Qd*h���\�\�Weh\��6\��n�-A\�nz6�RY\�?�?\�\�;h+X\�Z$.�����%\0��\��\�:�\�(��A�\���TW�jwH\�,e[�\�\0�%\�\� ��|.h\��ρ!�b\�lrMn�,��s�7h\�\����,�߲�\��%Y�cs\�\0{�P\��\�A�r*Q�1�x\�3R&��a\�G��E�BK�\�𵈂L\�\n�}��h�KU\r\��ᆘ\����X\�W\�	\no#��CA�5J���96\\ޡ\�\�9�G�<A\�ݽ3ݚm�U�\�ɿ�!�\�\�7��\�\�\\K��%��J��\�l6\�\�@:D��\�\\\�@\�\�p\��k�\�\�t|V�͊��IO7]Q�\�k!��7<	\�,\\&[{C��R�\�Myu\��%�αh��u<\�0\�u�iɫ!_=������mj鄃\Z�2\�z(�7VI��pWYx�}�o�߄7\�,ܻKc\�\\�ݖj\�\�K�p�p1mWN��\�Z\�}#Nh�uy�\�j���E�\�\�\�\�ñ���[\�\0E仑\�e \�K�Le\'jC��`\�\�	\��BD��\�\�\�O\�A5�#g\�Y4t�\�\nY��\�!\�p\�\�\�Uo�\�4\\إX5�\rB\�<P֞ �R\�\�\�\�]\n�\�fl\�t]\�`;A�R�1\0CW��N޹\0\0\�IDAT�.Z\�F�\��\�yc2bo9��IӋ�h�P\�V�%\�\�\�P����6܇M�K{Ql�C�\�|[��MI�F�\�:-��U�}\�\�p\�\�\n�.��S�w��\�@�U(+2\�5�&\�\0\�\����\�q�_T\�b\�ܾ4#�`閆��\�{\�V\�o��:\��\�\���\�f\�;\�;�\�\�l+O�\�I\�\ZMQǘ��;�\��\�Fˍl�xY��UDP�,\��p���H7�gh:��\�pǸޒ\��R�\�V\�a�W�\nP�5�\�r@�CMUnZ�G��\�]b�;t\no\r�\0L{6\�B�\�P\��\'\n9�E�͇\�=r�ֱ᪆\�F��\����/\�!M\�k频m�Vݚ3�sS�\Zn\�L����\�aE�\��pO\"۔U�F1\��n�@\�\�8g�KR�\�ZM\�\"gW4��O\��d�!N��l��\r\�%jm:#�wץ&V\�Nl��\\�\\\�&`�w\�bC�1\�\����i�sP�j����4�Y�`檂j�B�*\�k�\�M5+\�\naY\�\�G�kj�+\�v\�}��\��*��\�u)^�\��uh㺼�aY6�\�\�(f\�Ќl\�N\Z�b۸�ɏ���&�xٵ+\�\�o\�f���yd[\n\�\�0�-���\0#\��\���タ��/\�qj��滥\�v�+9���\�cz\�lfc~��i\�\��B�\�\�\�|L\�}\�)\�*0iE\�hzf��K׃\�\r\�\�뽽4�\�Xm�E�F�k�\�\r̻\�E�`h��\�2Y\�%Ɉv5�B\��(�ƒ�\�2;��\�6�\�|��rp�v9���\"4Tk\�6~��(<;$\�T\�NAj�ܚ\�\�j[)\"Tw��\�\\㞻	\"B\�(t\�u��Z\�m\�c\�M�h�K\��#�\�\r\�3h��[\�^\�\�`%֍	\r�*܇78\� ސ�\�\�*����jgN�:�*\�I*�5`\�^V�w�\�f�\��ͯwR\�[�c���2\��F\'.{C٦{�\'\��\�\'֨�j@zq�{5z�g\���O�\�h����&\�wt\�n��G�\�p\�\�q�w�\�q\�\��\�׆�^���=M��\���\�\�p\�ˁ3/õ\�8,\�?���	pO�\���\�m6PL\�\0\0\0\0IEND�B`�','1','1');
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
