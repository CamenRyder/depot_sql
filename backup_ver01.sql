-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: SocialMedia_WebAPI
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `Dish`
--

DROP TABLE IF EXISTS `Dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dish` (
  `dish_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `url_image` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`dish_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `Dish_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dish`
--

LOCK TABLES `Dish` WRITE;
/*!40000 ALTER TABLE `Dish` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Follower`
--

DROP TABLE IF EXISTS `Follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Follower` (
  `follow_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_follow_er_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`follow_id`),
  KEY `user_id` (`user_id`),
  KEY `user_follow_er_id` (`user_follow_er_id`),
  CONSTRAINT `Follower_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  CONSTRAINT `Follower_ibfk_5` FOREIGN KEY (`user_follow_er_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Follower`
--

LOCK TABLES `Follower` WRITE;
/*!40000 ALTER TABLE `Follower` DISABLE KEYS */;
INSERT INTO `Follower` VALUES (1,1,2);
/*!40000 ALTER TABLE `Follower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `create_date` varchar(200) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Invoice_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvoiceDetail`
--

DROP TABLE IF EXISTS `InvoiceDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InvoiceDetail` (
  `invoice_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `buy_price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`invoice_detail_id`),
  KEY `dish_id` (`dish_id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `InvoiceDetail_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `Dish` (`dish_id`),
  CONSTRAINT `InvoiceDetail_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `Invoice` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoiceDetail`
--

LOCK TABLES `InvoiceDetail` WRITE;
/*!40000 ALTER TABLE `InvoiceDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `InvoiceDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Issues`
--

DROP TABLE IF EXISTS `Issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Issues` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Issues`
--

LOCK TABLES `Issues` WRITE;
/*!40000 ALTER TABLE `Issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `Issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notification`
--

DROP TABLE IF EXISTS `Notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notification` (
  `noti_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(200) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `is_seen` int(11) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`noti_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notification`
--

LOCK TABLES `Notification` WRITE;
/*!40000 ALTER TABLE `Notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `Notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Post`
--

DROP TABLE IF EXISTS `Post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `post_type_id` int(11) DEFAULT NULL,
  `post_top_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `date_create_post` varchar(100) DEFAULT NULL,
  `diner_address` varchar(280) DEFAULT NULL,
  `diner_name` varchar(280) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `post_type_id` (`post_type_id`),
  CONSTRAINT `Post_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `Post_ibfk_7` FOREIGN KEY (`post_type_id`) REFERENCES `PostType` (`post_type_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Post`
--

LOCK TABLES `Post` WRITE;
/*!40000 ALTER TABLE `Post` DISABLE KEYS */;
INSERT INTO `Post` VALUES (2,2,1,NULL,'Hôm nay trời đẹp nhỉ ?',2.3,'6-5-2024',NULL,NULL),(3,3,2,2,'Tp Ho Chi Minh À?',NULL,'6-5-2024',NULL,NULL),(4,2,2,2,'chuẩn luôn bạn ơi',NULL,'6-5-2024',NULL,NULL),(5,4,1,NULL,'var nhau phát ko bạn ?',NULL,'6-5-2024',NULL,NULL),(6,5,1,NULL,'<3 bạn thích lập trình ? ',NULL,'6-5-2024',NULL,NULL);
/*!40000 ALTER TABLE `Post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PostImage`
--

DROP TABLE IF EXISTS `PostImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PostImage` (
  `post_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `url_image` text DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `post_image_state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`post_image_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `PostImage_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PostImage`
--

LOCK TABLES `PostImage` WRITE;
/*!40000 ALTER TABLE `PostImage` DISABLE KEYS */;
INSERT INTO `PostImage` VALUES (1,'https://cdn.sgtiepthi.vn/wp-content/uploads/2021/07/z.jpg',2,NULL);
/*!40000 ALTER TABLE `PostImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PostType`
--

DROP TABLE IF EXISTS `PostType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PostType` (
  `post_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  PRIMARY KEY (`post_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PostType`
--

LOCK TABLES `PostType` WRITE;
/*!40000 ALTER TABLE `PostType` DISABLE KEYS */;
INSERT INTO `PostType` VALUES (1,'Post'),(2,'Comment');
/*!40000 ALTER TABLE `PostType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rating`
--

DROP TABLE IF EXISTS `Rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rating` (
  `rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `Rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  CONSTRAINT `Rating_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rating`
--

LOCK TABLES `Rating` WRITE;
/*!40000 ALTER TABLE `Rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReactPost`
--

DROP TABLE IF EXISTS `ReactPost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReactPost` (
  `react_post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `like_state` int(11) NOT NULL,
  PRIMARY KEY (`react_post_id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ReactPost_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`) ON DELETE SET NULL,
  CONSTRAINT `ReactPost_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReactPost`
--

LOCK TABLES `ReactPost` WRITE;
/*!40000 ALTER TABLE `ReactPost` DISABLE KEYS */;
INSERT INTO `ReactPost` VALUES (1,2,2,1),(2,2,3,1),(3,2,5,1),(4,2,4,2);
/*!40000 ALTER TABLE `ReactPost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Report`
--

DROP TABLE IF EXISTS `Report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `issue_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  KEY `issue_id` (`issue_id`),
  CONSTRAINT `Report_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  CONSTRAINT `Report_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`),
  CONSTRAINT `Report_ibfk_3` FOREIGN KEY (`issue_id`) REFERENCES `Issues` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Report`
--

LOCK TABLES `Report` WRITE;
/*!40000 ALTER TABLE `Report` DISABLE KEYS */;
/*!40000 ALTER TABLE `Report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'User'),(2,'Admin'),(3,'Restaurant');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(400) DEFAULT NULL,
  `hash_password` varchar(400) DEFAULT NULL,
  `fullname` varchar(400) DEFAULT NULL,
  `gender` int(11) DEFAULT 0,
  `country` varchar(400) DEFAULT NULL,
  `language` varchar(400) DEFAULT NULL,
  `url_avatar` varchar(400) DEFAULT 'https://avatar.iran.liara.run/public/boy?username=Ash',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'user_01@gmail.com','abc@123','user01',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1),(2,'user_02@gmail.com','user_02','Adam',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1),(3,'user_03@gmail.com','user_03','User_03',1,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1),(4,'user_04@gmail.com','user_04','User_04',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1),(5,'user_05@gmail.com','abc@123','user_05',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1),(6,'user_03@gmail.com','user_03','User_03',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',3);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-07  9:10:23
