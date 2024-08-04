/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: SocialMedia_WebAPI
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `AccountState`
--

DROP TABLE IF EXISTS `AccountState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccountState` (
  `account_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_state_name` varchar(400) NOT NULL,
  PRIMARY KEY (`account_state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountState`
--

LOCK TABLES `AccountState` WRITE;
/*!40000 ALTER TABLE `AccountState` DISABLE KEYS */;
INSERT INTO `AccountState` VALUES (1,'pending'),(2,'accepted'),(3,'reject');
/*!40000 ALTER TABLE `AccountState` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BrowsingAccount`
--

DROP TABLE IF EXISTS `BrowsingAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BrowsingAccount` (
  `browsing_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `create_at` varchar(400) DEFAULT NULL,
  `moderator_accepted` int(11) DEFAULT NULL,
  `account_state_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`browsing_account_id`),
  KEY `user_id` (`user_id`),
  KEY `account_state_id` (`account_state_id`),
  CONSTRAINT `BrowsingAccount_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `BrowsingAccount_ibfk_3` FOREIGN KEY (`account_state_id`) REFERENCES `AccountState` (`account_state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BrowsingAccount`
--

LOCK TABLES `BrowsingAccount` WRITE;
/*!40000 ALTER TABLE `BrowsingAccount` DISABLE KEYS */;
INSERT INTO `BrowsingAccount` VALUES (3,10,'1717518426669',NULL,NULL),(5,11,'1717519494647',NULL,2),(6,26,'1717520644074',NULL,2),(7,28,'1717520667385',NULL,2),(9,32,'1717719427814',NULL,2),(10,35,'1717906762000',NULL,2),(11,18,'1717906927743',NULL,2),(12,20,'1717907010140',NULL,2),(13,23,'1717907017775',NULL,2),(15,16,'1717908419441',NULL,3),(16,31,'1717908423223',NULL,3),(17,36,'1718284736786',NULL,2),(18,40,'1718285486060',NULL,2),(19,12,'1718641702130',NULL,2),(20,44,'1718643945636',NULL,2),(21,34,'1718703848992',NULL,3),(22,60,'1718705824984',NULL,2),(23,25,'1718705870894',NULL,2),(24,59,'1718714805126',NULL,2);
/*!40000 ALTER TABLE `BrowsingAccount` ENABLE KEYS */;
UNLOCK TABLES;

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
  `user_id` int(11) DEFAULT NULL,
  `following_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`follow_id`),
  KEY `user_id` (`user_id`),
  KEY `user_follow_er_id` (`following_user_id`),
  CONSTRAINT `Follower_ibfk_1` FOREIGN KEY (`following_user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Follower_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Follower`
--

LOCK TABLES `Follower` WRITE;
/*!40000 ALTER TABLE `Follower` DISABLE KEYS */;
INSERT INTO `Follower` VALUES (3,2,32),(4,6,32),(5,1,32),(6,3,32),(8,11,32),(9,12,32),(10,15,32),(11,13,32),(12,14,32),(13,16,32),(14,17,32),(15,4,32),(16,5,32),(17,18,32),(18,19,32),(19,20,32),(20,22,32),(21,21,32),(22,24,32),(23,23,32),(24,25,32),(25,27,32),(26,26,32),(27,28,32),(28,30,32),(29,29,32),(30,31,32),(32,37,32),(33,33,32),(34,10,12),(35,34,32),(36,35,32),(38,38,32),(63,36,17),(73,10,32),(74,19,36),(75,12,36),(76,40,36),(77,34,10),(78,10,43),(81,60,36),(82,25,60),(83,59,37),(84,59,36);
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
  CONSTRAINT `Invoice_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
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
  CONSTRAINT `InvoiceDetail_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `Dish` (`dish_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `InvoiceDetail_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `Invoice` (`invoice_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Issues`
--

LOCK TABLES `Issues` WRITE;
/*!40000 ALTER TABLE `Issues` DISABLE KEYS */;
INSERT INTO `Issues` VALUES (1,'spam','Lừa đảo người dùng'),(2,'Tin Giả','tin không đúng sự thật'),(3,'Ngôn từ gây thù ghét','Kiểu như phốt quán này quán này phốt quán kia'),(4,'Ảnh khỏa thân , nội dung tấn công tình dục',NULL),(5,'Quấy rối',NULL);
/*!40000 ALTER TABLE `Issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Moderator_level`
--

DROP TABLE IF EXISTS `Moderator_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Moderator_level` (
  `mode_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_mod_level` varchar(400) NOT NULL,
  `description_level` varchar(400) NOT NULL,
  PRIMARY KEY (`mode_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Moderator_level`
--

LOCK TABLES `Moderator_level` WRITE;
/*!40000 ALTER TABLE `Moderator_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `Moderator_level` ENABLE KEYS */;
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
  `title` varchar(200) DEFAULT NULL,
  `Noti_type_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_action_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`noti_id`),
  KEY `user_id` (`user_id`),
  KEY `Noti_type_id` (`Noti_type_id`),
  KEY `post_id` (`post_id`),
  KEY `user_action_id` (`user_action_id`),
  CONSTRAINT `Notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Notification_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Notification_ibfk_3` FOREIGN KEY (`user_action_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Notification_ibfk_4` FOREIGN KEY (`Noti_type_id`) REFERENCES `Notification_type` (`noti_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notification`
--

LOCK TABLES `Notification` WRITE;
/*!40000 ALTER TABLE `Notification` DISABLE KEYS */;
INSERT INTO `Notification` VALUES (44,'1716992192628','Ava White đã thả 1 cảm xúc vào bài viết của bạn \"Đăng test solution\".',1,25,'1 cảm xúc mới tại post',2,225,19),(45,'1716992202842','Ava White đã thả 1 cảm xúc vào bài viết của bạn \"Cúp trong lòng người hâm mộ\".',1,25,'1 cảm xúc mới tại post',2,215,19),(46,'1716992209632','Ava White đã thả 1 cảm xúc vào bài viết của bạn \"@@@\".',1,25,'1 cảm xúc mới tại post',2,199,19),(47,'1716992213552','Ava White đã thả 1 cảm xúc vào bài viết của bạn \"alo alo\".',0,24,'1 cảm xúc mới tại post',2,188,19),(48,'1717004073910','Hiếu đã thả 1 cảm xúc vào bài viết của bạn \"Viết tâm tư\".',0,24,'1 cảm xúc mới tại post',2,216,10),(49,'1717027295350','Emma Davis đã thả 1 cảm xúc vào bài viết của bạn \"Cất cúp vào trong\".',0,34,'1 cảm xúc mới tại post',2,243,25),(50,'1717030266689','Emma Davis đã thả 1 cảm xúc vào bài viết của bạn \"I\'m still here, loving you silently.\".',1,25,'1 cảm xúc mới tại post',2,266,25),(52,'1717033712073','Hiếu đã theo dõi bạn.',0,32,'bạn có 1 người theo dõi mới',4,NULL,10),(53,'1717171239041','England đã thả 1 cảm xúc vào bài viết của bạn \"xin chao\".',1,36,'1 cảm xúc mới tại post',2,201,40),(54,'1717175809898','khanhT đã thả 1 cảm xúc vào bài viết của bạn \"ABC\".',1,25,'1 cảm xúc mới tại post',2,269,36),(55,'1717175811125','khanhT đã thả 1 cảm xúc vào bài viết của bạn \"hello worrld\".',1,25,'1 cảm xúc mới tại post',2,268,36),(56,'1717175813949','khanhT đã thả 1 cảm xúc vào bài viết của bạn \"I\'m still here, loving you silently.\".',1,25,'1 cảm xúc mới tại post',2,266,36),(57,'1717220520397','England đã thả 1 cảm xúc vào bài viết của bạn \"ngon x3\".',1,36,'1 cảm xúc mới tại post',2,203,40),(59,'1717246374803','England đã thả 1 cảm xúc vào bài viết của bạn \"test1\".',1,36,'1 cảm xúc mới tại post',2,271,40),(60,'1717247119980','Ava White đã thả 1 cảm xúc vào bài viết của bạn \"ABC\".',1,25,'1 cảm xúc mới tại post',2,270,19),(62,'1717247310629','Minh đã thả 1 cảm xúc vào bài viết của bạn \"test1\".',1,36,'1 cảm xúc mới tại post',2,271,12),(63,'1717247322004','Minh đã thả 1 cảm xúc vào bài viết của bạn \"ngon x3\".',1,36,'1 cảm xúc mới tại post',2,203,12),(64,'1717247322938','Minh đã thả 1 cảm xúc vào bài viết của bạn \"xin chao\".',1,36,'1 cảm xúc mới tại post',2,201,12),(65,'1717247419687','Ava White đã theo dõi bạn.',1,36,'bạn có 1 người theo dõi mới',4,NULL,19),(67,'1717247452503','Ava White đã thả 1 cảm xúc vào bài viết của bạn \"test1\".',1,36,'1 cảm xúc mới tại post',2,271,19),(68,'1717247454426','Ava White đã thả 1 cảm xúc vào bài viết của bạn \"ngon x3\".',1,36,'1 cảm xúc mới tại post',2,203,19),(69,'1717247455360','Ava White đã thả 1 cảm xúc vào bài viết của bạn \"xin chao\".',1,36,'1 cảm xúc mới tại post',2,201,19),(70,'1717250509823','Minh đã thả 1 cảm xúc vào bài viết của bạn \"verry good \".',1,36,'1 cảm xúc mới tại post',2,200,12),(71,'1717250779527','England đã thả 1 cảm xúc vào bài viết của bạn \"verry good \".',1,36,'1 cảm xúc mới tại post',2,200,40),(72,'1717251002911','Minh đã theo dõi bạn.',1,36,'bạn có 1 người theo dõi mới',4,NULL,12),(73,'1717251083784','England đã theo dõi bạn.',1,36,'bạn có 1 người theo dõi mới',4,NULL,40),(74,'1717252134091','Hiếu đã thả 1 cảm xúc vào bài viết của bạn \"ABC\".',1,25,'1 cảm xúc mới tại post',2,269,10),(75,'1717252134904','Hiếu đã thả 1 cảm xúc vào bài viết của bạn \"hello worrld\".',1,25,'1 cảm xúc mới tại post',2,268,10),(76,'1717252173140','Nguyễn Văn A đã thả 1 cảm xúc vào bài viết của bạn \"Minh Hieeus\".',1,10,'1 cảm xúc mới tại post',2,111,34),(81,'1717252240573','Nguyễn Văn A đã thả 1 cảm xúc vào bài viết của bạn \"yoman\".',1,10,'1 cảm xúc mới tại post',2,109,34),(82,'1717252246114','Nguyễn Văn A đã thả 1 cảm xúc vào bài viết của bạn \"Hellowww\".',1,10,'1 cảm xúc mới tại post',2,70,34),(83,'1717252247082','Nguyễn Văn A đã thả 1 cảm xúc vào bài viết của bạn \"Doma here\".',1,10,'1 cảm xúc mới tại post',2,71,34),(84,'1717252249149','Nguyễn Văn A đã thả 1 cảm xúc vào bài viết của bạn \"yo\".',1,10,'1 cảm xúc mới tại post',2,110,34),(85,'1717252251016','Nguyễn Văn A đã thả 1 cảm xúc vào bài viết của bạn \"Hellowww\".',1,10,'1 cảm xúc mới tại post',2,69,34),(86,'1717252252861','Nguyễn Văn A đã thả 1 cảm xúc vào bài viết của bạn \"Hellowww\".',1,10,'1 cảm xúc mới tại post',2,68,34),(87,'1717252254064','Nguyễn Văn A đã thả 1 cảm xúc vào bài viết của bạn \"Hellowww\".',1,10,'1 cảm xúc mới tại post',2,67,34),(88,'1717252373326','Nguyễn Văn A đã theo dõi bạn.',1,10,'bạn có 1 người theo dõi mới',4,NULL,34),(91,'1717255953101','Ava White đã thả 1 cảm xúc vào bài viết của bạn \"kkkk\".',1,25,'1 cảm xúc mới tại post',2,295,19),(101,'1717344165303','Chào mừng user Chàng trai liêm khiết đến với social food',0,42,'Đăng kí thành công',NULL,NULL,NULL),(103,'1717344590971','Chàng trai liêm khiết đã thả 1 cảm xúc vào bài viết của bạn \"bún riu ko ?\".',0,42,'1 cảm xúc mới tại post',2,311,42),(104,'1717344644611','Chàng trai liêm khiết đã thả 1 cảm xúc vào bài viết của bạn \"À được gòi\".',0,42,'1 cảm xúc mới tại post',2,312,42),(105,'1717474883670','Olivia Anderson đã thả 1 cảm xúc vào bài viết của bạn \"Try this recipe\".',1,12,'1 cảm xúc mới tại post',2,313,21),(106,'1717474885145','Olivia Anderson đã thả 1 cảm xúc vào bài viết của bạn \"À được gòi\".',0,42,'1 cảm xúc mới tại post',2,312,21),(107,'1717476795879','Chào mừng user HUY THÁI đến với social food',0,43,'Đăng kí thành công',NULL,NULL,NULL),(108,'1717508414934','Hiếu đã thả 1 cảm xúc vào bài viết của bạn \"Hello guys\".',0,43,'1 cảm xúc mới tại post',2,315,10),(109,'1717508517363','Hiếu đã theo dõi bạn.',0,43,'bạn có 1 người theo dõi mới',4,NULL,10),(110,'1717900173330','Nguyễn Văn A đã thả 1 cảm xúc vào bài viết của bạn \"Hello guys\".',0,43,'1 cảm xúc mới tại post',2,315,34),(111,'1717906593762','Chúc mừng tài khoản minhday đã được nâng cấp thành chủ quán.',0,32,'Thông báo hệ thống',5,NULL,NULL),(112,'1717906593771','Chúc mừng tài khoản John Smith đã được nâng cấp thành chủ quán.',0,28,'Thông báo hệ thống',5,NULL,NULL),(113,'1717906593774','Chúc mừng tài khoản Michael Brown đã được nâng cấp thành chủ quán.',0,26,'Thông báo hệ thống',5,NULL,NULL),(114,'1717906593779','Chúc mừng tài khoản minhday đã được nâng cấp thành chủ quán.',0,32,'Thông báo hệ thống',5,NULL,NULL),(115,'1717906593784','Chúc mừng tài khoản Ryder đã được nâng cấp thành chủ quán.',0,11,'Thông báo hệ thống',5,NULL,NULL),(116,'1717906593784','Chúc mừng tài khoản John Smith đã được nâng cấp thành chủ quán.',0,28,'Thông báo hệ thống',5,NULL,NULL),(117,'1717906593787','Chúc mừng tài khoản Michael Brown đã được nâng cấp thành chủ quán.',0,26,'Thông báo hệ thống',5,NULL,NULL),(118,'1717906593792','Chúc mừng tài khoản Ryder đã được nâng cấp thành chủ quán.',0,11,'Thông báo hệ thống',5,NULL,NULL),(119,'1717906980899','Chúc mừng tài khoản Anh B đã được nâng cấp thành chủ quán.',0,35,'Thông báo hệ thống',5,NULL,NULL),(120,'1717908062253','Chúc mừng tài khoản John Smith đã được nâng cấp thành chủ quán.',0,18,'Thông báo hệ thống',5,NULL,NULL),(121,'1717908069876','Chúc mừng tài khoản Sophia Taylor đã được nâng cấp thành chủ quán.',0,23,'Thông báo hệ thống',5,NULL,NULL),(122,'1717908437258','Chúc mừng tài khoản minhday đã bị hệ thống từ chối nâng cấp.',0,31,'Thông báo hệ thống',5,NULL,NULL),(123,'1718028485898','Chúc mừng tài khoản Ryder đã bị hệ thống từ chối nâng cấp.',0,29,'Thông báo hệ thống',5,NULL,NULL),(124,'1718028547815','Chúc mừng tài khoản bacthayflick đã bị hệ thống từ chối nâng cấp.',0,16,'Thông báo hệ thống',5,NULL,NULL),(125,'1718172164608','Người được chọn đã thả 1 cảm xúc vào bài viết của bạn \"tại sao p đọc hướng dẫn sử dụng dầu gội ?\".',0,26,'1 cảm xúc mới tại post',2,125,25),(126,'1718203695798','Người được chọn đã thả 1 cảm xúc vào bài viết của bạn \"Sửa bài là sao\".',0,25,'1 cảm xúc mới tại post',2,295,25),(127,'1718203706116','Người được chọn đã thả 1 cảm xúc vào bài viết của bạn \"Hello guys\".',0,43,'1 cảm xúc mới tại post',2,315,25),(128,'1718526035682','Olivia Anderson đã thả 1 cảm xúc vào bài viết của bạn \"Hello guys\".',0,43,'1 cảm xúc mới tại post',2,315,21),(129,'1718605868448','Chúc mừng tài khoản England đã bị hệ thống từ chối nâng cấp.',1,40,'Thông báo hệ thống',5,NULL,NULL),(130,'1718605927759','Chúc mừng tài khoản khanhT đã bị hệ thống từ chối nâng cấp.',0,36,'Thông báo hệ thống',5,NULL,NULL),(131,'1718605956274','Chúc mừng tài khoản Alexander Thomas đã được nâng cấp thành chủ quán.',0,20,'Thông báo hệ thống',5,NULL,NULL),(132,'1718635838411','Chúc mừng tài khoản England đã được nâng cấp thành chủ quán.',1,40,'Thông báo hệ thống',5,NULL,NULL),(133,'1718641095393','Chúc mừng tài khoản khanhT đã được nâng cấp thành chủ quán.',0,36,'Thông báo hệ thống',5,NULL,NULL),(134,'1718641710657','Chúc mừng tài khoản Minh đã được nâng cấp thành chủ quán.',0,12,'Thông báo hệ thống',5,NULL,NULL),(135,'1718643920733','Chào mừng user Joker đến với social food',1,44,'Đăng kí thành công',NULL,NULL,NULL),(136,'1718643964472','Tài khoản Joker đã bị hệ thống từ chối nâng cấp.',1,44,'Thông báo hệ thống',5,NULL,NULL),(137,'1718644003027','Chúc mừng tài khoản Joker đã được nâng cấp thành chủ quán.',1,44,'Thông báo hệ thống',5,NULL,NULL),(138,'1718689109117','minhday đã thả 1 cảm xúc vào bài viết của bạn \"Champion\".',0,12,'1 cảm xúc mới tại post',2,320,32),(139,'1718689949496','Chào mừng user Dien đến với social food',0,45,'Đăng kí thành công',NULL,NULL,NULL),(140,'1718690345861','Chào mừng user 223 đến với social food',1,46,'Đăng kí thành công',NULL,NULL,NULL),(141,'1718690393640','223 đã theo dõi bạn.',0,14,'bạn có 1 người theo dõi mới',4,NULL,46),(142,'1718690457088','223 đã thả 1 cảm xúc vào bài viết của bạn \"Champion\".',0,12,'1 cảm xúc mới tại post',2,320,46),(143,'1718690636346','Chào mừng user Nguyễn Anh Nhật đến với social food',0,47,'Đăng kí thành công',NULL,NULL,NULL),(145,'1718690665954','Nguyễn Anh Nhật đã thả 1 cảm xúc vào bài viết của bạn \"Champion\".',0,12,'1 cảm xúc mới tại post',2,320,47),(146,'1718690777337','Nguyễn Anh Nhật đã thả 1 cảm xúc vào bài viết của bạn \"Shóp điện thoại tăng mã (hóa) giảm giá nhenn\".',0,47,'1 cảm xúc mới tại post',2,322,47),(147,'1718692720937','Chào mừng user hha đến với social food',0,48,'Đăng kí thành công',NULL,NULL,NULL),(148,'1718693219227','Chào mừng user Minh Hieu đến với social food',0,49,'Đăng kí thành công',NULL,NULL,NULL),(149,'1718693628933','Chào mừng user Minh Hieu đến với social food',0,50,'Đăng kí thành công',NULL,NULL,NULL),(150,'1718693670731','Chào mừng user Minh Hieu đến với social food',0,51,'Đăng kí thành công',NULL,NULL,NULL),(151,'1718693734657','Chào mừng user Minh Hieu đến với social food',0,52,'Đăng kí thành công',NULL,NULL,NULL),(152,'1718694333985','Chào mừng user LeMinh0706 đến với social food',0,53,'Đăng kí thành công',NULL,NULL,NULL),(153,'1718694609903','Chào mừng user LeMinh0706 đến với social food',0,54,'Đăng kí thành công',NULL,NULL,NULL),(154,'1718694623164','Chào mừng user LeMinh0706 đến với social food',0,55,'Đăng kí thành công',NULL,NULL,NULL),(155,'1718694901746','Chào mừng user embeday đến với social food',0,56,'Đăng kí thành công',NULL,NULL,NULL),(156,'1718694921204','Chào mừng user embeday đến với social food',0,57,'Đăng kí thành công',NULL,NULL,NULL),(157,'1718695543130','Chào mừng user mimi đến với social food',0,58,'Đăng kí thành công',NULL,NULL,NULL),(158,'1718705255885','Chào mừng user Minh Hieu đến với social food',1,59,'Đăng kí thành công',NULL,NULL,NULL),(159,'1718705276946','Minh Hieu đã thả 1 cảm xúc vào bài viết của bạn \"Shóp điện thoại tăng mã (hóa) giảm giá nhenn\".',0,47,'1 cảm xúc mới tại post',2,322,59),(160,'1718705591707','Chào mừng user 99 boa hoa hong đến với social food',1,60,'Đăng kí thành công',NULL,NULL,NULL),(161,'1718705634000','99 boa hoa hong đã thả 1 cảm xúc vào bài viết của bạn \"xin chào cuối tuần\".',1,60,'1 cảm xúc mới tại post',2,329,60),(162,'1718705656895','99 boa hoa hong đã thả 1 cảm xúc vào bài viết của bạn \"Viết tâm tư\".',0,24,'1 cảm xúc mới tại post',2,216,60),(163,'1718705658748','99 boa hoa hong đã thả 1 cảm xúc vào bài viết của bạn \"Cúp trong lòng người hâm mộ\".',0,25,'1 cảm xúc mới tại post',2,215,60),(165,'1718705705061','99 boa hoa hong đã thả 1 cảm xúc vào bài viết của bạn \"test1\".',0,36,'1 cảm xúc mới tại post',2,271,60),(166,'1718705728637','99 boa hoa hong đã theo dõi bạn.',0,36,'bạn có 1 người theo dõi mới',4,NULL,60),(167,'1718705856976','Người được chọn đã thả 1 cảm xúc vào bài viết của bạn \"xin chào cuối tuần\".',0,60,'1 cảm xúc mới tại post',2,329,25),(168,'1718705859382','Người được chọn đã theo dõi bạn.',0,60,'bạn có 1 người theo dõi mới',4,NULL,25),(169,'1718705889929','Tài khoản I love ManCity đã bị hệ thống từ chối nâng cấp.',0,34,'Thông báo hệ thống',5,NULL,NULL),(170,'1718705892643','Chúc mừng tài khoản Người được chọn đã được nâng cấp thành chủ quán.',0,25,'Thông báo hệ thống',5,NULL,NULL),(171,'1718705908147','Chúc mừng tài khoản Hiếu đã được nâng cấp thành chủ quán.',0,60,'Thông báo hệ thống',5,NULL,NULL),(172,'1718712176426','admin đã thả 1 cảm xúc vào bài viết của bạn \"Sửa bài là sao\".',0,25,'1 cảm xúc mới tại post',2,295,41),(173,'1718713505240','Minh Hieu đã theo dõi bạn.',0,37,'bạn có 1 người theo dõi mới',4,NULL,59),(174,'1718714703221','Minh Hieu đã theo dõi bạn.',0,36,'bạn có 1 người theo dõi mới',4,NULL,59),(175,'1718714761033','Minh Hieu đã thả 1 cảm xúc vào bài viết của bạn \"fghjkl\".',0,59,'1 cảm xúc mới tại post',2,328,59),(176,'1718714779962','admin đã thả 1 cảm xúc vào bài viết của bạn \"fghjkl\".',0,59,'1 cảm xúc mới tại post',2,328,41),(177,'1718714816150','Chúc mừng tài khoản Minh Hieu đã được nâng cấp thành chủ quán.',0,59,'Thông báo hệ thống',5,NULL,NULL);
/*!40000 ALTER TABLE `Notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notification_type`
--

DROP TABLE IF EXISTS `Notification_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notification_type` (
  `noti_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `noti_type_name` varchar(200) NOT NULL,
  PRIMARY KEY (`noti_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notification_type`
--

LOCK TABLES `Notification_type` WRITE;
/*!40000 ALTER TABLE `Notification_type` DISABLE KEYS */;
INSERT INTO `Notification_type` VALUES (1,'Post notification'),(2,'React notification'),(3,'Comment notification'),(4,'Follow notification '),(5,'Upgrade notification'),(6,'Report notification');
/*!40000 ALTER TABLE `Notification_type` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Post`
--

LOCK TABLES `Post` WRITE;
/*!40000 ALTER TABLE `Post` DISABLE KEYS */;
INSERT INTO `Post` VALUES (30,15,1,NULL,'tesstt post create 001',NULL,'1715525199833',NULL,NULL),(31,15,1,NULL,'Test post create ver 002 :>',NULL,'1715525250969',NULL,NULL),(32,16,1,NULL,'Siu xay daaa chứ ai :D',NULL,'1715525321737',NULL,NULL),(33,16,1,NULL,'let him cook :>',NULL,'1715525344107',NULL,NULL),(34,17,1,NULL,'Dep trai co gi sai',NULL,'1715532450407',NULL,NULL),(35,23,1,NULL,'Ngành IT Việt Nam hiện nay ở đầu của sự phát triển. Có thể nói IT là vua của các nghề. Vừa có tiền, có quyền. Vừa kiếm được nhiều $ lại được xã hội trọng vọng.',NULL,'1715595386638',NULL,NULL),(36,25,1,NULL,'Thằng em mình học bách khoa cơ khí, bỏ ngang sang IT, sinh năm 96. Tự mày mò học code rồi đi làm remote cho công ty Mỹ 2 năm nay. Mỗi tối online 3-4 giờ là xong việc. Lương tháng 3k6. Nhưng thu nhập chính vẫn là từ nhận các project bên ngoài làm thêm. Tuần làm 2,3 cái nhẹ nhàng 9,10k tiền tươi thóc thật không phải đóng thuế. Làm gần được 3 năm mà nhà xe nó đã mua đủ cả. Nghĩ mà thèm.',NULL,'1715595409834',NULL,NULL),(37,25,1,NULL,'Trong trường hợp nhóm này bị điều tra bởi các cơ quan trực thuộc bộ công an (hoặc các tổ chức chính trị tương tự phục vụ cho nhà nước CHXHCNVN), tôi khẳng định mình không liên quan tới nhóm hoặc những cá nhân khác trong nhóm này. Tôi không rõ tại sao mình lại có mặt ở đây vào thời điểm này, có lẽ tài khoản của tôi đã được thêm bởi một bên thứ ba. Tôi cũng xin khẳng định rằng mình không hề giúp sức cho những hành động chống phá Đảng và nhà nước của các thành viên trong nhóm này',NULL,'1715595436816',NULL,NULL),(38,25,1,NULL,'Anh Liêm được dịp farm gà Liêm con sung sướng hát ca nguyên ngày Mừng thầm râu nhí sẽ cay Ngờ đâu sự thật thương thay lũ khùng Quốc đảo thì quẩy thật sung Cù lao hattrick anh hùng nỗi chi  Đến khi gặp đội hơi lì Anh Liêm mất dạng liền phi về nhà Lấy ngay điện thoại chị ra Soạn ngay văn mẫu lỗi là tại Si',NULL,'1715595467165',NULL,NULL),(39,28,1,NULL,'Không vui chút nào, tôi đã không cười. Trò đùa của bạn thật tệ, tôi sẽ thích trò đùa này nếu nó được xoá khỏi đầu tôi và bạn vui lòng từ bỏ nói lại cho tôi trò đùa đấy.',NULL,'1715595514112',NULL,NULL),(40,24,1,NULL,'Bạn thực sự là một quái vật nhà quê, kẻ hủy diệt lòng tự trọng, tổng tư lệnh xấu hổ, chiến thần hề, country god, chúa tể đội quần, tù trưởng hài hước, đại đội trưởng trung đoàn nông thôn, thần thoại nhục nhã, huyền thoại quê mùa, thần đồng quê kệch, lãnh chúa của các thế hệ đội giỏ Việt, người viết lên kịch bản phim người nhà quê, trùm chui xuống lỗ, tướng quân gáy lớn, thầy dạy phản biện, ông tổ ngành cãi, trùm trường luật, thiên tài tranh biện, người đột biến hệ nhột.',NULL,'1715595662651',NULL,NULL),(41,24,1,NULL,'Tại hạ lại nghe nói có một loại bao da, sâu tầm tấc bảy, mềm mượt vô cùng, xung quanh phát khí chí âm chí hàn, tuy vô cương vô lực nhưng lại hấp thụ dương khí, tỏa ra một mãnh lực vô hình khiến thần binh trong thiên hạ vạn dặm quy tông. Vật này tuy không cương nhu phối hợp giết người ngoài quan ải trong chớp mắt như Thần Thương của ta nhưng lại khiến cho kẻ địch mất dần sinh lực rồi hạ binh chịu hàng, lại nghe kỳ truyện rằng vì bảo vật này mà anh hùng trong thiên hạ tranh giành chém giết, kẻ giành được thì tâm thần điên loạn bỏ mặc anh em. Quả thật là vạn phần nguy hiểm hơn thần binh của ta nhiều.',NULL,'1715595680545',NULL,NULL),(42,25,1,NULL,'Tôi có một ước mơ, đó là meme sẽ được thế giới công nhận là nghệ thuật. Khi ấy những meme bất diệt sẽ được trường tồn, được đóng khung tại bảo tàng, được chứng nhận là di sản văn hóa. Những meme như thế này sẽ sống mãi trong lòng ae, sẽ được truyền từ đời này tới đời khác. Ôi thế giới như thế thật tuyệt làm sao, bạn cũng thích vậy chứ?',NULL,'1715595748992',NULL,NULL),(43,26,1,NULL,'Là tôi, tôi đã hỏi. Thật là một cực hình khi phải nặng gánh trách nhiệm của một kẻ tội đồ đã đưa ra câu hỏi và giấu mình vào ngôi thứ ba. Trách nhiệm nặng như quả đất, đặt vào đôi bờ vai nhỏ bé của tôi. Nó như đè nát thân tâm tôi, nó rằng xé con người tôi bởi sức nặng khủng khiếp của Kẻ Đã Hỏi. Thật là một cực hình, quả là địa ngục trần gian, đúng là tra tấn man rợn. Nhưng cuối cùng, tôi cũng được giải phóng khỏi chuỗi ngày đau khổ đó. Đúng, là tôi, tôi đã hỏi, có vấn đề gì không?',NULL,'1715595799548',NULL,NULL),(44,22,1,NULL,'VĂN MẪU CỦA VIỆT NAM KHI BỊ HỎI VỀ XUNG ĐỘT QUỐC TẾ Việt Nam quan ngại sâu sắc về các hoạt động <.......> của <quốc gia / khu vực>. Chúng tôi mong muốn các bên có động thái giải quyết vấn đề 1 cách hòa bình, trên các tôn trọng lẫn nhau cũng như tuân thủ luật pháp và công ước quốc tế',NULL,'1715595843326',NULL,NULL),(45,28,1,NULL,'Chào em, chị là luật sư của army và đã thu thập đủ bằng chứng em xúc phạm army của công ty bên chị. Em vui lòng xóa bài này sau 30 phút. Nếu sau 30 phút mà em vẫn chưa xóa bài thì bên chị sẽ dùng tới pháp luật và em sẽ bị lôi đầu ra Côn Đảo !',NULL,'1715595904383',NULL,NULL),(46,23,1,NULL,'Cuối cùng mới có một bộ anime mà nhân vật chính đúng chuẩn hình mẫu lý tưởng của tao. Một kẻ lạnh lùng và ít nói. Đám bạn không hiểu tại sao tao trở nên im lặng và luôn được 5 điểm bài kiểm tra. Chúng nó không biết năng lực thực sự của tao và không hề biết tao xuất chúng tới mức nào. Tao chẳng coi chúng là gì ngoài công cụ. Tao ước mình có thể vào trong thế giới anime và bộc lộ con người thực sự của mình. Tao tin chắc rằng tao chính là hoá thân ngoài đời thực của Ayanokouji.',NULL,'1715595929670',NULL,NULL),(47,23,1,NULL,'Trời buồn trời đổ cơn mưa Anh ngồi anh viết thư tình cho em Đầu câu hai chữ \"chung tình\" Cuối câu bốn chữ \"chúng mình chia tay\"',NULL,'1715596007518',NULL,NULL),(49,24,1,NULL,'Này ông, tôi không biết mọi người thấy meme này như thế nào, nhưng đối với tôi, nó tuyệt lắm, cơ mà có vẻ như nó không đáp ứng được tiêu chí là một món ăn tinh thần cho anh em trong group và cả tôi, tôi chắc chắn rằng ông có thể tạo ra những meme còn tuyệt hơn như thế này nhiều, tôi và cả anh em trong group cảm thấy thật hạnh phúc khi có ông trong group, chúng tôi tự hào và xúc động về những cố gắng ông đã đóng góp để phát triển group của chúng ta, tôi thật may mắn vì đã gặp được ông, chào ông và thân ái.',NULL,'1715596197098',NULL,NULL),(50,26,1,NULL,'Are you here to find the accommodation of your dreams?',NULL,'1715596354124',NULL,NULL),(51,10,2,46,'Guest who love u',NULL,'1715856331297',NULL,NULL),(52,10,2,47,'Bịch nước mía to trà  bá',NULL,'1715856367739',NULL,NULL),(53,23,1,NULL,'Hello',NULL,'1715964584359',NULL,NULL),(54,28,1,NULL,'Iauwa',NULL,'1715967139391',NULL,NULL),(56,25,1,NULL,'helllooooo ',NULL,'1715994575243',NULL,NULL),(57,26,1,NULL,'hello world:)))',NULL,'1715995298123',NULL,NULL),(58,25,1,NULL,'Nola',NULL,'1715995482371',NULL,NULL),(59,25,1,NULL,'Em từ client mới lên',NULL,'1715995540689',NULL,NULL),(60,10,2,26,'Hello wworld',NULL,'1715995587617',NULL,NULL),(61,25,1,NULL,'Em từ client mới lên',NULL,'1715995675448',NULL,NULL),(62,25,1,NULL,'Em từ client mới lên',NULL,'1715995684263',NULL,NULL),(63,25,1,NULL,'ádwad',NULL,'1716000834388',NULL,NULL),(64,25,1,NULL,'Chào em',NULL,'1716001322422',NULL,NULL),(67,10,1,NULL,'Hellowww',NULL,'1716002046699',NULL,NULL),(68,10,1,NULL,'Hellowww',NULL,'1716002047122',NULL,NULL),(69,10,1,NULL,'Hellowww',NULL,'1716002047351',NULL,NULL),(70,10,1,NULL,'Hellowww',NULL,'1716002083931',NULL,NULL),(71,10,1,NULL,'Doma here',NULL,'1716002624763',NULL,NULL),(73,25,1,NULL,'sdwsssda',NULL,'1716005261712',NULL,NULL),(74,25,1,NULL,'hala madrid ',NULL,'1716005305612',NULL,NULL),(76,24,1,NULL,'Vũ khí lỗi thời của Ukraina đang khiến Nga bó tay?',NULL,'1716005666780',NULL,NULL),(77,34,1,NULL,'Tặng học sinh nghèo hiếu học Nguyễn Văn A',NULL,'1716007190389',NULL,NULL),(78,34,1,NULL,'Bài viết từ anh a',NULL,'1716023906534',NULL,NULL),(82,34,1,NULL,'test voi state',NULL,'1716035911855',NULL,NULL),(89,25,1,NULL,'123',NULL,'1716054013645',NULL,NULL),(91,24,1,NULL,'123213',NULL,'1716060249066',NULL,NULL),(95,25,1,NULL,'minh day ne',NULL,'1716082228400',NULL,NULL),(97,25,1,NULL,'lol',NULL,'1716083043174',NULL,NULL),(98,25,1,NULL,'nonstop',NULL,'1716083333891',NULL,NULL),(99,25,1,NULL,'UwU',NULL,'1716084332128',NULL,NULL),(100,25,1,NULL,'123',NULL,'1716084392100',NULL,NULL),(108,25,1,NULL,'alo',NULL,'1716085505651',NULL,NULL),(109,10,1,NULL,'yoman',NULL,'1716104574612',NULL,NULL),(110,10,1,NULL,'yo',NULL,'1716104655333',NULL,NULL),(111,10,1,NULL,'Minh Hieeus',NULL,'1716104813583',NULL,NULL),(119,25,1,NULL,'haha',NULL,'1716105514585',NULL,NULL),(122,24,1,NULL,'Check cam ?',NULL,'1716108997167',NULL,NULL),(123,24,1,NULL,'Sản phẩm này là thuốc',NULL,'1716109012047',NULL,NULL),(124,26,1,NULL,'tại sao p đọc hướng dẫn sử dụng dầu gội ?',NULL,'1716109280104',NULL,NULL),(125,26,1,NULL,'tại sao p đọc hướng dẫn sử dụng dầu gội ?',NULL,'1716109288553',NULL,NULL),(134,25,1,NULL,'Emma Emma',NULL,'1716117172907',NULL,NULL),(135,25,1,NULL,'Giờ có emma',NULL,'1716117687903',NULL,NULL),(136,10,2,26,'php',NULL,'1716126501278',NULL,NULL),(137,10,2,135,'vãi Emma bị gì hả?',NULL,'1716133998764',NULL,NULL),(138,26,2,135,'Emma có nổi bằng xuân ca ko ?',NULL,'1716134026402',NULL,NULL),(139,21,2,135,'Thử hỏi thế gian ai đệp bằng emma?',NULL,'1716134234757',NULL,NULL),(140,34,1,NULL,'Dang bai',NULL,'1716180633375',NULL,NULL),(141,22,2,135,'1 2 con ong. đb long nhong',NULL,'1716185203688',NULL,NULL),(145,22,2,135,'cooking with milk',NULL,'1716190363181',NULL,NULL),(146,25,2,135,'abc123 ',NULL,'1716191113739',NULL,NULL),(147,25,2,135,'abc123 ',NULL,'1716191194401',NULL,NULL),(148,25,2,135,'abc123 ',NULL,'1716191251788',NULL,NULL),(149,25,2,135,'abc123 ',NULL,'1716191289669',NULL,NULL),(153,25,2,144,'test comment ? ',NULL,'1716194289108',NULL,NULL),(154,25,2,144,'allo',NULL,'1716194367448',NULL,NULL),(155,25,2,144,'rồi có gì ko ? ',NULL,'1716194383086',NULL,NULL),(156,25,2,144,'rồi có gì ko ? ',NULL,'1716194463425',NULL,NULL),(157,25,2,144,'vờ lừo thật. ko tự reload lại đc nè :)',NULL,'1716194497826',NULL,NULL),(158,25,1,NULL,'Thêm des nè',NULL,'1716194599961',NULL,NULL),(159,25,2,144,'aloalo',NULL,'1716196036739',NULL,NULL),(162,25,2,144,'upload thafnk cong ?',NULL,'1716196300196',NULL,NULL),(164,25,2,144,'hiihii',NULL,'1716196425602',NULL,NULL),(165,13,2,158,'honkai star rail hả bạn ? ',NULL,'1716196642616',NULL,NULL),(166,10,2,143,'test pingg',NULL,'1716200776887',NULL,NULL),(167,13,2,143,'ping 30ms\r\n',NULL,'1716200815072',NULL,NULL),(168,25,2,143,'ping 299ms :))',NULL,'1716201176177',NULL,NULL),(170,10,2,142,'số 2 đã xem\r\n',NULL,'1716201228821',NULL,NULL),(171,19,2,142,'số 3 đã nhìn thấy mời số 4\r\n',NULL,'1716201408244',NULL,NULL),(172,21,2,142,'số 4 đag bận đi tìm khoa báu bà TML ',NULL,'1716201679882',NULL,NULL),(173,10,2,143,'hello world ?',NULL,'1716206082890',NULL,NULL),(177,10,2,135,'Hôm nay ryder cúp học tiếng anh quá đãaa\r\n',NULL,'1716251311976',NULL,NULL),(178,21,2,158,'Cúp học luôn\r\n',NULL,'1716251363568',NULL,NULL),(180,21,2,143,'aloo',NULL,'1716269001602',NULL,NULL),(181,25,2,158,'Cao Trường vũ xin chào các bạn',NULL,'1716285899696',NULL,NULL),(184,25,1,NULL,'Đăng bài',NULL,'1716305588641',NULL,NULL),(185,25,2,184,'hello',NULL,'1716306039109',NULL,NULL),(186,21,1,NULL,'Bài viết đầu của Anderson',NULL,'1716309935720',NULL,NULL),(187,24,1,NULL,'Wilson đăng bài',NULL,'1716310310075',NULL,NULL),(188,24,1,NULL,'alo alo',NULL,'1716312255810',NULL,NULL),(189,10,2,188,'alo ah Tiến luật ơiiii',NULL,'1716312393772',NULL,NULL),(191,25,2,186,'alo',NULL,'1716312860300',NULL,NULL),(192,33,2,187,'Halo',NULL,'1716312911114',NULL,NULL),(193,10,2,188,'vãi ahh Tiến',NULL,'1716312912453',NULL,NULL),(195,10,2,184,'haa\r\n',NULL,'1716312923928',NULL,NULL),(196,10,2,184,'vipp z ',NULL,'1716312930228',NULL,NULL),(197,10,2,184,'hello bạn ?',NULL,'1716312946186',NULL,NULL),(199,25,1,NULL,'@@@',NULL,'1716313052519',NULL,NULL),(200,36,1,NULL,'verry good ',NULL,'1716314062753',NULL,NULL),(201,36,1,NULL,'xin chao',NULL,'1716314110033',NULL,NULL),(202,25,2,201,'Hello ngày moiws',NULL,'1716314143181',NULL,NULL),(203,36,1,NULL,'ngon x3',NULL,'1716315192423',NULL,NULL),(204,13,1,NULL,'post này bị hack like',NULL,'1716337281468',NULL,NULL),(205,10,2,204,'hôm qua êm đệpp loắmmm\r\n',NULL,'1716352325790',NULL,NULL),(206,25,2,204,'vãiiii òooooo :> ',NULL,'1716352395090',NULL,NULL),(208,25,2,201,'ghjgh',NULL,'1716352658491',NULL,NULL),(209,21,1,NULL,'vãi ò cụt trưởng đá quả nhạc xe đò Miền tây cực chill',NULL,'1716360825008',NULL,NULL),(210,13,2,209,'vãi ò pro vjpp nhạc xe đò miền Tây :>',NULL,'1716360950654',NULL,NULL),(211,21,2,209,'Phòng 50 người nghe nhạc xe đò kiểu',NULL,'1716361295858',NULL,NULL),(212,25,2,201,'hello\r\n',NULL,'1716369329819',NULL,NULL),(213,13,1,NULL,'Khi đờn ông mang bầu 😊',NULL,'1716381577076',NULL,NULL),(215,25,1,NULL,'Cúp trong lòng người hâm mộ',NULL,'1716393135784',NULL,NULL),(216,24,1,NULL,'Viết tâm tư',NULL,'1716393430960',NULL,NULL),(217,21,1,NULL,'Cúp trong lòng người hâm mộ là chiếc cúp quý giá nhất :))',NULL,'1716393783978',NULL,NULL),(218,21,2,186,'alo ?',NULL,'1716394010051',NULL,NULL),(220,19,2,215,'gheeeeeeeeee bạn là nhứut 😊',NULL,'1716431655161',NULL,NULL),(221,19,2,213,'chứ đàn đúm ko được hả ? 😏',NULL,'1716431712645',NULL,NULL),(222,19,2,216,'ảnh có bản quyền kìa Davis. vnExpress kiện SocialFood đó\r\n',NULL,'1716431751318',NULL,NULL),(224,25,2,217,'hiii',NULL,'1716450473093',NULL,NULL),(225,25,1,NULL,'Đăng test solution',NULL,'1716453234027',NULL,NULL),(226,25,1,NULL,'Chắc gì đã đăng bài được ? ',NULL,'1716453266259',NULL,NULL),(229,25,2,225,'xin chào thầy và các bạn\r\n',NULL,'1716474114144',NULL,NULL),(230,25,2,226,'test edit comment',NULL,'1716474158688',NULL,NULL),(233,21,1,NULL,'Hello ',NULL,'1716478529737',NULL,NULL),(235,21,2,234,'😁 ah barrrr ',NULL,'1716478598659',NULL,NULL),(236,21,2,233,'vãi shjttt how ?? 😷',NULL,'1716478762011',NULL,NULL),(237,34,2,233,'How ?\r\n',NULL,'1716478771914',NULL,NULL),(238,32,1,NULL,'',NULL,'1716553175913',NULL,NULL),(239,37,2,238,'quá đã\r\n',NULL,'1716555304435',NULL,NULL),(240,37,1,NULL,'test gửi link\r\nhttps://apps.apple.com/.../myfamilytree.../id6502604080',NULL,'1716555443355',NULL,NULL),(241,37,2,240,'issues 01',NULL,'1716555483476',NULL,NULL),(242,25,2,238,'hello world',NULL,'1716648306693',NULL,NULL),(243,34,1,NULL,'Cất cúp vào trong',NULL,'1716711586608',NULL,NULL),(244,34,2,238,'Gì mà đã',NULL,'1716737058897',NULL,NULL),(246,25,2,199,'thử tính năng features ? ',NULL,'1716870314991',NULL,NULL),(247,25,2,199,'tính năng thông báo ? ',NULL,'1716870363596',NULL,NULL),(248,25,2,199,'aduu',NULL,'1716870409858',NULL,NULL),(249,25,2,199,'tesst',NULL,'1716870511840',NULL,NULL),(251,25,2,199,'tests. ? ',NULL,'1716870668696',NULL,NULL),(252,25,2,204,'test notification ? ',NULL,'1716870701181',NULL,NULL),(253,25,2,250,'test  notification ? ',NULL,'1716871110461',NULL,NULL),(254,25,2,250,'123',NULL,'1716871191777',NULL,NULL),(255,21,2,250,'tesst',NULL,'1716871280014',NULL,NULL),(256,21,2,250,'test notification ?  ',NULL,'1716871343854',NULL,NULL),(257,21,2,250,'new tesst casse ?',NULL,'1716871384911',NULL,NULL),(258,19,2,250,'oát band ?',NULL,'1716871444261',NULL,NULL),(259,19,2,250,'tessttt ?',NULL,'1716871488240',NULL,NULL),(260,19,2,250,'123',NULL,'1716871497890',NULL,NULL),(261,19,2,250,'test token ? ',NULL,'1716871568016',NULL,NULL),(262,19,2,250,'aduu MU ra khoi hang ? ',NULL,'1716871620608',NULL,NULL),(263,19,2,250,'Mu song lai roi',NULL,'1716871659468',NULL,NULL),(264,19,2,250,'notification now ? ',NULL,'1716871714627',NULL,NULL),(265,19,2,250,'Hello tuấn cuồi ? ',NULL,'1716872192012',NULL,NULL),(266,25,1,NULL,'I\'m still here, loving you silently.',NULL,'1717027610073',NULL,NULL),(267,25,2,243,'hello',NULL,'1717033021153',NULL,NULL),(268,25,1,NULL,'hello worrld',NULL,'1717033040310',NULL,NULL),(269,25,1,NULL,'ABC',NULL,'1717033065894',NULL,NULL),(270,25,1,NULL,'ABC',NULL,'1717033067945',NULL,NULL),(271,36,1,NULL,'test1',NULL,'1717246333547',NULL,NULL),(273,12,2,200,'ok',NULL,'1717247329336',NULL,NULL),(274,19,2,271,'eh',NULL,'1717250330184',NULL,NULL),(275,40,2,201,'Nice one',NULL,'1717250793097',NULL,NULL),(276,34,2,111,'Haha',NULL,'1717252321891',NULL,NULL),(277,10,2,111,'xin chào',NULL,'1717252544976',NULL,NULL),(278,34,2,111,'Hello nha',NULL,'1717252548169',NULL,NULL),(279,25,1,NULL,'test3',NULL,'1717253051954',NULL,NULL),(280,25,1,NULL,'hello',NULL,'1717253131402',NULL,NULL),(281,25,1,NULL,'hello wworld',NULL,'1717253646977',NULL,NULL),(282,25,1,NULL,'aloo',NULL,'1717253656434',NULL,NULL),(283,25,1,NULL,'aloo',NULL,'1717253673799',NULL,NULL),(284,25,1,NULL,'hello',NULL,'1717253859653',NULL,NULL),(285,25,1,NULL,'hello',NULL,'1717253876141',NULL,NULL),(286,25,1,NULL,'alo',NULL,'1717254740463',NULL,NULL),(287,25,1,NULL,'alo',NULL,'1717254746037',NULL,NULL),(288,25,1,NULL,'hello tuan cuoi',NULL,'1717254754732',NULL,NULL),(289,25,1,NULL,'alo',NULL,'1717254770611',NULL,NULL),(290,25,1,NULL,'tesst hot load',NULL,'1717254778800',NULL,NULL),(291,25,1,NULL,'abc123',NULL,'1717255194022',NULL,NULL),(295,25,1,NULL,'Sửa bài là sao',NULL,'1717255493533',NULL,NULL),(304,34,2,303,'haha',NULL,'1717343333155',NULL,NULL),(306,25,2,305,'hello',NULL,'1717343397923',NULL,NULL),(310,42,2,308,'aduu\r\n',NULL,'1717344547612',NULL,NULL),(311,42,1,NULL,'bún riu ko ?',NULL,'1717344585657',NULL,NULL),(312,42,1,NULL,'À được gòi',NULL,'1717344610239',NULL,NULL),(313,12,1,NULL,'Try this recipe',NULL,'1717347129309',NULL,NULL),(315,43,1,NULL,'Hello guys',NULL,'1717477414836',NULL,NULL),(316,34,2,315,'Hello',NULL,'1717900167942',NULL,NULL),(317,34,1,NULL,'',NULL,'1718622468270',NULL,NULL),(318,34,1,NULL,'',NULL,'1718622521850',NULL,NULL),(319,32,1,NULL,'Image ',NULL,'1718679139483',NULL,NULL),(320,12,1,NULL,'Champion',NULL,'1718689088473',NULL,NULL),(322,47,1,NULL,'Shóp điện thoại tăng mã (hóa) giảm giá nhenn',NULL,'1718690698285',NULL,NULL),(323,32,2,320,'noi buon phu thao',NULL,'1718703452731',NULL,NULL),(325,59,2,322,'xin chào ',NULL,'1718705307468',NULL,NULL),(328,59,1,NULL,'fghjkl',NULL,'1718705426282',NULL,NULL),(329,60,1,NULL,'xin chào buổi chiều',NULL,'1718705629966',NULL,NULL),(331,60,2,271,'comment',NULL,'1718705713851',NULL,NULL),(332,25,2,329,'hello',NULL,'1718706549760',NULL,NULL);
/*!40000 ALTER TABLE `Post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PostBrowsingState`
--

DROP TABLE IF EXISTS `PostBrowsingState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PostBrowsingState` (
  `post_browsing_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_browsing_state_name` varchar(200) NOT NULL,
  PRIMARY KEY (`post_browsing_state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PostBrowsingState`
--

LOCK TABLES `PostBrowsingState` WRITE;
/*!40000 ALTER TABLE `PostBrowsingState` DISABLE KEYS */;
INSERT INTO `PostBrowsingState` VALUES (1,'pending'),(2,'reject'),(3,'accept');
/*!40000 ALTER TABLE `PostBrowsingState` ENABLE KEYS */;
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
  CONSTRAINT `PostImage_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PostImage`
--

LOCK TABLES `PostImage` WRITE;
/*!40000 ALTER TABLE `PostImage` DISABLE KEYS */;
INSERT INTO `PostImage` VALUES (24,'http://camenryder.xyz/public/img/1715525199648_Dragon-Ball-game4v-1648740274-76.jpg',30,NULL),(25,'http://camenryder.xyz/public/img/1715525250722_ea85b7af823d7c98be67119ddf05d656.jpg',31,NULL),(26,'http://camenryder.xyz/public/img/1715525321610_ea85b7af823d7c98be67119ddf05d656.jpg',32,NULL),(27,'http://camenryder.xyz/public/img/1715532450401_FB_IMG_1715168497565.jpg',34,NULL),(28,'http://camenryder.xyz/public/img/1715595386545_1085381.jpg',35,NULL),(29,'http://camenryder.xyz/public/img/1715595409778_1085381.jpg',36,NULL),(30,'http://camenryder.xyz/public/img/1715595436765_1085381.jpg',37,NULL),(31,'http://camenryder.xyz/public/img/1715595467109_1085381.jpg',38,NULL),(32,'http://camenryder.xyz/public/img/1715595513922_1085381.jpg',39,NULL),(33,'http://camenryder.xyz/public/img/1715595662493_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',40,NULL),(34,'http://camenryder.xyz/public/img/1715595680464_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',41,NULL),(35,'http://camenryder.xyz/public/img/1715595748985_Screenshot 2024-01-23 201005.png',42,NULL),(36,'http://camenryder.xyz/public/img/1715595799483_Screenshot 2024-02-28 124515.png',43,NULL),(37,'http://camenryder.xyz/public/img/1715595843324_Screenshot 2024-05-04 204240.png',44,NULL),(38,'http://camenryder.xyz/public/img/1715595904360_Screenshot 2024-01-23 185834.png',45,NULL),(39,'http://camenryder.xyz/public/img/1715595929637_Screenshot 2024-05-13 172454.png',46,NULL),(40,'http://camenryder.xyz/public/img/1715596007334_Screenshot 2024-04-20 195305.png',47,NULL),(41,'http://camenryder.xyz/public/img/1715596094124_Screenshot 2024-03-14 202939.png',NULL,NULL),(42,'http://camenryder.xyz/public/img/1715596197095_Screenshot 2024-02-23 155102.png',49,NULL),(43,'http://camenryder.xyz/public/img/1715596354121_Screenshot 2024-05-13 173147.png',50,NULL),(47,'http://camenryder.xyz/public/img/1715856804701_images.jpeg',52,NULL),(48,'http://camenryder.xyz/public/img/1715856833875_images.jpeg',51,NULL),(49,'http://camenryder.xyz/public/img/1715964584339_b8d935b636429e1cc753.jpg',53,NULL),(50,'http://camenryder.xyz/public/img/1715967139351_bdba984fc3bb6be532aa.jpg',54,NULL),(51,'http://camenryder.xyz/public/img/1715994575234_55ff0113fda1ebef91463c22bffd4ba4.jpg',56,NULL),(52,'http://camenryder.xyz/public/img/1716002044153_anh-3d-songoku_044039312.jpg',NULL,NULL),(53,'http://camenryder.xyz/public/img/1716002045440_anh-3d-songoku_044039312.jpg',NULL,NULL),(54,'http://camenryder.xyz/public/img/1716002046068_anh-3d-songoku_044039312.jpg',67,NULL),(55,'http://camenryder.xyz/public/img/1716002045841_anh-3d-songoku_044039312.jpg',68,NULL),(56,'http://camenryder.xyz/public/img/1716002045870_anh-3d-songoku_044039312.jpg',69,NULL),(57,'http://camenryder.xyz/public/img/1716002083905_images.jpeg',70,NULL),(58,'http://camenryder.xyz/public/img/1716002624740_b8d935b636429e1cc753.jpg',71,NULL),(59,'http://camenryder.xyz/public/img/1716005261120_Screenshot 2024-02-29 132311.png',73,NULL),(60,'http://camenryder.xyz/public/img/1716005305108_Screenshot 2024-03-02 194834.png',74,NULL),(61,'http://camenryder.xyz/public/img/1716005583597_BB1myWKI.jpg',NULL,NULL),(62,'http://camenryder.xyz/public/img/1716005666758_BB1mBaol.jpg',76,NULL),(63,'http://camenryder.xyz/public/img/1716007190302_Screenshot 2024-02-21 161204.png',77,NULL),(64,'http://camenryder.xyz/public/img/1716023906527_Screenshot 2024-02-22 124856.png',78,NULL),(65,'http://camenryder.xyz/public/img/1716023929935_Screenshot 2024-02-21 123321.png',NULL,NULL),(66,'http://camenryder.xyz/public/img/1716034436658_statepng.png',NULL,NULL),(67,'http://camenryder.xyz/public/img/1716054013563_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',89,NULL),(68,'http://camenryder.xyz/public/img/1716060091921_Screenshot 2024-03-24 202214.png',NULL,NULL),(69,'http://camenryder.xyz/public/img/1716060249055_Screenshot 2024-01-23 185834.png',91,NULL),(70,'http://camenryder.xyz/public/img/1716081698951_55ff0113fda1ebef91463c22bffd4ba4.jpg',NULL,NULL),(71,'http://camenryder.xyz/public/img/1716081698968_avatar_default.png',NULL,NULL),(72,'http://camenryder.xyz/public/img/1716081698953_anh-3d-songoku_044039312.jpg',NULL,NULL),(73,'http://camenryder.xyz/public/img/1716082228372_Screenshot 2024-01-23 185834.png',95,NULL),(74,'http://camenryder.xyz/public/img/1716083043147_Screenshot 2024-01-23 185834.png',97,NULL),(75,'http://camenryder.xyz/public/img/1716083333879_Screenshot 2024-02-18 124206.png',98,NULL),(76,'http://camenryder.xyz/public/img/1716084332108_Screenshot 2024-01-23 185834.png',99,NULL),(77,'http://camenryder.xyz/public/img/1716084392088_Screenshot 2024-01-23 185834.png',100,NULL),(78,'http://camenryder.xyz/public/img/1716084792752_Screenshot 2024-01-23 185834.png',NULL,NULL),(79,'http://camenryder.xyz/public/img/1716084837282_1085381.jpg',NULL,NULL),(80,'http://camenryder.xyz/public/img/1716084837282_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',NULL,NULL),(81,'http://camenryder.xyz/public/img/1716085063396_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',NULL,NULL),(82,'http://camenryder.xyz/public/img/1716085388034_Screenshot 2024-01-23 185834.png',NULL,NULL),(83,'http://camenryder.xyz/public/img/1716085425922_Screenshot 2024-01-23 185834.png',NULL,NULL),(84,'http://camenryder.xyz/public/img/1716085505629_Screenshot 2024-01-23 185834.png',108,NULL),(85,'http://camenryder.xyz/public/img/1716104655241_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',110,NULL),(86,'http://camenryder.xyz/public/img/1716104813555_anh-3d-songoku_044039312.jpg',111,NULL),(87,'http://camenryder.xyz/public/img/1716104813579_avatar_default.png',111,NULL),(88,'http://camenryder.xyz/public/img/1716104813550_55ff0113fda1ebef91463c22bffd4ba4.jpg',111,NULL),(94,'http://camenryder.xyz/public/img/1716105773948_55ff0113fda1ebef91463c22bffd4ba4.jpg',NULL,NULL),(95,'http://camenryder.xyz/public/img/1716105773954_anh-3d-songoku_044039312.jpg',NULL,NULL),(96,'http://camenryder.xyz/public/img/1716105773977_avatar_default.png',NULL,NULL),(99,'http://camenryder.xyz/public/img/1716108997143_55ff0113fda1ebef91463c22bffd4ba4.jpg',122,NULL),(100,'http://camenryder.xyz/public/img/1716108997146_anh-3d-songoku_044039312.jpg',122,NULL),(101,'http://camenryder.xyz/public/img/1716108997161_avatar_default.png',122,NULL),(106,'http://camenryder.xyz/public/img/1716109187849_anh-3d-songoku_044039312.jpg',NULL,NULL),(107,'http://camenryder.xyz/public/img/1716109187871_avatar_default.png',NULL,NULL),(108,'http://camenryder.xyz/public/img/1716109279925_astronaut-nasa-flower-garden-butterflies-surreal-moon-3840x2160-3197.jpg',124,NULL),(109,'http://camenryder.xyz/public/img/1716109279999_space-suit-dream-3840x2160-9642.jpg',124,NULL),(110,'http://camenryder.xyz/public/img/1716109288470_astronaut-nasa-flower-garden-butterflies-surreal-moon-3840x2160-3197.jpg',125,NULL),(115,'http://camenryder.xyz/public/img/1716109483649_icon_check_map.png',NULL,NULL),(116,'http://camenryder.xyz/public/img/1716109483736_images.jpeg',NULL,NULL),(117,'http://camenryder.xyz/public/img/1716109483741_logo_web_app.png',NULL,NULL),(119,'http://camenryder.xyz/public/img/1716116748927__123433724_zelensky_tvaddress.png',NULL,NULL),(120,'http://camenryder.xyz/public/img/1716116765760__123433724_zelensky_tvaddress.png',NULL,NULL),(121,'http://camenryder.xyz/public/img/1716116794593__123433724_zelensky_tvaddress.png',NULL,NULL),(122,'http://camenryder.xyz/public/img/1716116802558_55ff0113fda1ebef91463c22bffd4ba4.jpg',NULL,NULL),(123,'http://camenryder.xyz/public/img/1716116802559_anh-3d-songoku_044039312.jpg',NULL,NULL),(124,'http://camenryder.xyz/public/img/1716116802524__123433724_zelensky_tvaddress.png',NULL,NULL),(129,'http://camenryder.xyz/public/img/1716126501028_quanlythuexe_test.zip',136,NULL),(130,'http://camenryder.xyz/public/img/1716130685702_1085381.jpg',134,NULL),(131,'http://camenryder.xyz/public/img/1716130685590_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',134,NULL),(143,'http://camenryder.xyz/public/img/1716132744012_BB1mBaol.jpg',135,NULL),(144,'http://camenryder.xyz/public/img/1716180633345_putin.jpg',140,NULL),(145,'http://camenryder.xyz/public/img/1716185203643_ea85b7af823d7c98be67119ddf05d656.jpg',141,NULL),(146,'http://camenryder.xyz/public/img/1716186627857_57ed92aec85a6004394b.jpg',NULL,NULL),(147,'http://camenryder.xyz/public/img/1716187061792_vi-vn-lenovo-ideapad-3-15itl6-i5-82h801p9vn-thumbvideo.jpg',NULL,NULL),(148,'http://camenryder.xyz/public/img/1716190363152_Dragon-Ball-game4v-1648740274-76.jpg',145,NULL),(149,'http://camenryder.xyz/public/img/1716194463356_create logo ava 534024ac-b175-4c7c-865a-8c8c0834dd5e.png',156,NULL),(152,'http://camenryder.xyz/public/img/1716201679859_anh-3d-songoku_044039312.jpg',172,NULL),(153,'http://camenryder.xyz/public/img/1716212765494_55ff0113fda1ebef91463c22bffd4ba4.jpg',NULL,NULL),(154,'http://camenryder.xyz/public/img/1716213312925_Dragon-Ball-game4v-1648740274-76.jpg',NULL,NULL),(155,'http://camenryder.xyz/public/img/1716297209828_Screenshot 2024-02-23 155102.png',NULL,NULL),(156,'http://camenryder.xyz/public/img/1716297954584__123433724_zelensky_tvaddress.png',NULL,NULL),(157,'http://camenryder.xyz/public/img/1716305587971_Screenshot 2024-01-23 201005.png',184,NULL),(158,'http://camenryder.xyz/public/img/1716305587972_Screenshot 2024-02-06 124329.png',184,NULL),(159,'http://camenryder.xyz/public/img/1716312712935_Screenshot 2024-02-20 095718.png',158,NULL),(160,'http://camenryder.xyz/public/img/1716313052460_Screenshot 2024-03-14 202939.png',199,NULL),(161,'http://camenryder.xyz/public/img/1716315192421_Screenshot 2024-04-15 062318.png',203,NULL),(162,'http://camenryder.xyz/public/img/1716337281460_Dinh-nghia-ve-Like.png',204,NULL),(163,'http://camenryder.xyz/public/img/1716352438387_images.jpeg',NULL,NULL),(164,'http://camenryder.xyz/public/img/1716360824978_maxresdefault.jpg',209,NULL),(165,'http://camenryder.xyz/public/img/1716361295848_abc_123.jpeg',211,NULL),(166,'http://camenryder.xyz/public/img/1716381577073_images.png',213,NULL),(167,'http://camenryder.xyz/public/img/1716389410085_arsenal2.jpg',NULL,NULL),(168,'http://camenryder.xyz/public/img/1716393135741_arsenal2.jpg',215,NULL),(169,'http://camenryder.xyz/public/img/1716393430940_BB1myWKI.jpg',216,NULL),(170,'http://camenryder.xyz/public/img/1716393783936_arsenal2.jpg',217,NULL),(171,'http://camenryder.xyz/public/img/1716394214305_winter.jpg',NULL,NULL),(172,'http://camenryder.xyz/public/img/1716431797128_skynews-manchester-city_6560183.jpg',NULL,NULL),(173,'http://camenryder.xyz/public/img/1716453234019_abc_123.jpeg',225,NULL),(174,'http://camenryder.xyz/public/img/1716453266255_55ff0113fda1ebef91463c22bffd4ba4.jpg',226,NULL),(175,'http://camenryder.xyz/public/img/1716478529716_anh-3d-songoku_044039312.jpg',233,NULL),(177,'http://camenryder.xyz/public/img/1716635970417_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',238,NULL),(178,'http://camenryder.xyz/public/img/1716711586541_skynews-manchester-city_6560183.jpg',243,NULL),(179,'http://camenryder.xyz/public/img/1716868923512_Dragon-Ball-game4v-1648740274-76.jpg',NULL,NULL),(180,'http://camenryder.xyz/public/img/1717027610069_445170514_1025332788957432_8973844706684219377_n.jpg',266,NULL),(181,'http://camenryder.xyz/public/img/1717033065864_abc_123.jpeg',269,NULL),(182,'http://camenryder.xyz/public/img/1717033064712_1706_hinh-nen-phi-hanh-gia61.jpg',269,NULL),(183,'http://camenryder.xyz/public/img/1717033066353_1706_hinh-nen-phi-hanh-gia61.jpg',270,NULL),(184,'http://camenryder.xyz/public/img/1717033067903_abc_123.jpeg',270,NULL),(185,'http://camenryder.xyz/public/img/1717255274140_83c8e2b247ef098179c3caaf8086c490.jpg',NULL,NULL),(186,'http://camenryder.xyz/public/img/1717255484234_83c8e2b247ef098179c3caaf8086c490.jpg',NULL,NULL),(187,'http://camenryder.xyz/public/img/1717329700012_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',NULL,NULL),(188,'http://camenryder.xyz/public/img/1717330580546_23.png',NULL,NULL),(189,'http://camenryder.xyz/public/img/1717330653218_mancity.jpg',NULL,NULL),(190,'http://camenryder.xyz/public/img/1717343469788_astronaut-nasa-flower-garden-butterflies-surreal-moon-3840x2160-3197.jpg',295,NULL),(191,'http://camenryder.xyz/public/img/1717347129147_englandbreakfast.jpg',313,NULL),(192,'http://camenryder.xyz/public/img/1717477414781_FB_IMG_1716867001820.jpg',315,NULL),(193,'http://camenryder.xyz/public/img/1718622468233_Screenshot 2024-05-13 172454.png',317,NULL),(194,'http://camenryder.xyz/public/img/1718622521849_Screenshot 2024-05-04 204240.png',318,NULL),(195,'http://camenryder.xyz/public/img/1718679139257_Two-Soyjacks-Transparent-meme-5.jpg',319,NULL),(196,'http://camenryder.xyz/public/img/1718689087819_skynews-manchester-city_6560183.jpg',320,NULL),(197,'http://camenryder.xyz/public/img/1718690540553_NguyenAnhNhat.jpg',NULL,NULL),(198,'http://camenryder.xyz/public/img/1718690698068_1.png',322,NULL),(199,'http://camenryder.xyz/public/img/1718705425858_1087424.jpg',328,NULL),(201,'http://camenryder.xyz/public/img/1718706003721_tumblr_ol6o615mfP1qa9gmgo5_1280-2.jpg',329,NULL),(202,'http://camenryder.xyz/public/img/1718714634751_ava-khu-am-thuc-thai-lan-1.jpg',NULL,NULL);
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
INSERT INTO `PostType` VALUES (1,'Post User'),(2,'Comment'),(3,'Post Restaurant');
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
  CONSTRAINT `Rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Rating_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  CONSTRAINT `ReactPost_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `ReactPost_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReactPost`
--

LOCK TABLES `ReactPost` WRITE;
/*!40000 ALTER TABLE `ReactPost` DISABLE KEYS */;
INSERT INTO `ReactPost` VALUES (5,44,15,1),(6,44,16,1),(7,46,23,1),(8,46,28,1),(9,46,22,1),(10,46,16,1),(11,46,10,2),(12,NULL,10,1),(13,NULL,11,1),(14,NULL,21,1),(15,125,21,1),(16,125,23,1),(17,125,13,1),(18,125,12,1),(19,135,10,2),(20,135,26,1),(25,140,25,1),(26,158,10,1),(27,158,19,1),(47,NULL,19,1),(48,NULL,19,1),(49,140,19,1),(50,135,19,1),(51,125,19,1),(53,NULL,21,1),(55,134,19,1),(57,NULL,10,1),(58,NULL,10,1),(59,158,36,1),(61,140,10,1),(62,NULL,25,1),(63,134,25,1),(64,134,13,1),(66,NULL,25,1),(67,NULL,10,1),(72,NULL,21,1),(73,NULL,21,1),(75,NULL,25,1),(77,NULL,33,1),(78,NULL,10,1),(79,186,24,1),(80,188,24,1),(82,187,33,1),(83,187,25,1),(126,204,10,1),(128,NULL,25,1),(129,204,25,1),(130,200,25,1),(131,188,25,1),(132,135,25,1),(133,209,19,1),(134,209,13,1),(135,204,21,1),(136,209,25,1),(137,186,21,1),(138,215,25,1),(139,217,25,1),(141,213,19,1),(142,NULL,34,1),(143,226,25,1),(144,225,25,1),(145,216,25,1),(146,233,21,1),(147,226,21,1),(148,225,21,1),(150,233,25,1),(151,238,37,1),(153,240,37,1),(154,238,25,1),(155,NULL,21,1),(156,243,34,1),(157,NULL,25,1),(158,NULL,25,1),(160,NULL,10,1),(165,NULL,10,1),(166,NULL,19,1),(174,NULL,19,1),(175,226,19,1),(177,225,19,1),(178,215,19,1),(179,199,19,1),(180,188,19,1),(181,216,10,1),(183,266,25,1),(184,201,40,1),(185,269,36,1),(186,268,36,1),(187,266,36,1),(188,203,40,1),(189,NULL,40,1),(190,271,40,1),(191,270,19,1),(192,NULL,12,1),(193,271,12,1),(194,203,12,1),(195,201,12,1),(196,NULL,19,1),(197,271,19,1),(198,203,19,1),(199,201,19,1),(200,200,12,1),(201,200,40,1),(202,269,10,1),(203,268,10,1),(204,111,34,1),(209,109,34,1),(211,71,34,1),(212,110,34,1),(216,NULL,25,1),(217,NULL,19,1),(218,295,19,1),(219,NULL,19,1),(222,NULL,25,1),(223,NULL,25,1),(224,NULL,34,1),(225,NULL,25,1),(227,NULL,25,1),(228,NULL,42,1),(229,311,42,1),(230,312,42,1),(231,313,21,1),(232,312,21,1),(233,315,10,1),(234,315,34,1),(235,125,25,1),(236,295,25,1),(237,315,25,1),(238,315,21,1),(239,320,32,1),(240,320,46,1),(242,320,47,1),(243,322,47,1),(244,322,59,1),(245,329,60,1),(246,216,60,1),(247,215,60,1),(248,271,60,1),(249,329,25,1),(250,295,41,1),(251,328,59,1),(252,328,41,1);
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
  `dateReported` varchar(200) NOT NULL,
  `post_browsing_state_id` int(11) DEFAULT 1,
  PRIMARY KEY (`report_id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  KEY `issue_id` (`issue_id`),
  KEY `post_browsing_state_id` (`post_browsing_state_id`),
  CONSTRAINT `Report_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Report_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Report_ibfk_3` FOREIGN KEY (`issue_id`) REFERENCES `Issues` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Report_ibfk_4` FOREIGN KEY (`post_browsing_state_id`) REFERENCES `PostBrowsingState` (`post_browsing_state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Report`
--

LOCK TABLES `Report` WRITE;
/*!40000 ALTER TABLE `Report` DISABLE KEYS */;
INSERT INTO `Report` VALUES (95,19,53,2,'1717521501148',1),(96,19,53,4,'1717521501148',1),(97,19,53,1,'1717521501148',1),(98,26,59,2,'1717521551824',1),(99,26,59,1,'1717521551824',1),(100,26,59,4,'1717521551824',1),(101,21,67,2,'1717521565916',1),(102,21,67,1,'1717521565916',1),(103,21,67,4,'1717521565916',1),(118,36,312,3,'1718200460647',1),(119,36,312,2,'1718200460647',1),(120,36,312,1,'1718200460647',1),(121,36,312,4,'1718200460647',1),(122,36,313,2,'1718200714163',1),(123,36,313,3,'1718200714163',1),(124,36,313,1,'1718200714163',1),(125,36,315,2,'1718200792023',1),(126,36,315,4,'1718200792023',1),(127,36,315,1,'1718200792023',1),(128,36,315,3,'1718200792023',1),(133,36,311,1,'1718202896928',1),(134,36,311,2,'1718202896928',1),(135,36,311,3,'1718202896928',1),(136,40,317,2,'1718640451166',1),(137,40,317,4,'1718640451166',1),(138,59,320,1,'1718705331151',1),(139,59,320,3,'1718705331151',1),(142,60,320,2,'1718706063087',1),(143,60,320,1,'1718706063087',1),(144,60,320,3,'1718706063087',1),(145,59,329,1,'1718714652399',1),(146,59,329,2,'1718714652399',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'User'),(2,'Admin'),(3,'Restaurant'),(4,'Moderator');
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
  `email` varchar(400) NOT NULL,
  `hash_password` varchar(400) DEFAULT NULL,
  `fullname` varchar(400) DEFAULT NULL,
  `gender` int(11) DEFAULT 0,
  `country` varchar(400) DEFAULT NULL,
  `language` varchar(400) DEFAULT NULL,
  `url_avatar` varchar(400) DEFAULT 'http://camenryder.xyz/public/img/avatar_default.png',
  `role_id` int(11) DEFAULT NULL,
  `phone` varchar(400) DEFAULT NULL,
  `mode_level_id` int(11) DEFAULT NULL,
  `url_background_profile` varchar(400) DEFAULT 'http://camenryder.xyz/public/img/background_profile_default.jpg',
  `date_create_account` varchar(400) DEFAULT NULL,
  `is_pending` int(11) DEFAULT 0,
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  KEY `mode_level_id` (`mode_level_id`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `User_ibfk_2` FOREIGN KEY (`mode_level_id`) REFERENCES `Moderator_level` (`mode_level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'user_01@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$NsikJqgkxozGhrChqv8H3A$A4hvoSFLIdQ+IqCoTTE12H8e/0BrzUchP2FtrADPloY','user01',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(2,'user_02@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$NsikJqgkxozGhrChqv8H3A$A4hvoSFLIdQ+IqCoTTE12H8e/0BrzUchP2FtrADPloY','Adam',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(3,'user_03@gmail.com','user_03','User_03',1,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(4,'user_04@gmail.com','user_04','User_04',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(5,'user_05@gmail.com','abc@123','user_05',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(6,'user_03@gmail.com','user_03','User_03',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',3,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(10,'user010@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$NsikJqgkxozGhrChqv8H3A$A4hvoSFLIdQ+IqCoTTE12H8e/0BrzUchP2FtrADPloY','Hiếu',1,'Vietnam','','http://camenryder.xyz/public/img/1716739768102_BB1myWKI.jpg',1,NULL,NULL,'http://camenryder.xyz/public/img/1716739823982_BB1mBaol.jpg',NULL,0),(11,'user011@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$mhoGPN29CZwFKoLeDi4TxA$gjR5qH7mIe9XiAcZ5rPYh20PSh7CCA4abCEUL1oBfDg','Ryder',0,NULL,NULL,'https://avatar.iran.liara.run/public/boy?username=Ash',3,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(12,'minh@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$ssEnyOKSN6bbkLb/xiRfRQ$740Hm0YVp8/XkvaRPLNYx2uDVdpq9yr95aG57Gb1FfM','Minh',1,'','','https://avatar.iran.liara.run/public/boy?username=Ash',3,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(13,'user014@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$IzRDRPbj/Z70UmV+vA5iJA$XOAUAQufncXUNHLBNmwva3p1f5o57qaA7dfowyV509o','Ryder',0,NULL,NULL,'https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(14,'user015@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$e1/R3jBCBwyypqtUjv/Saw$JwNa2gsxXi6F66Pr31jRfxe1DGOAm9kDKyLVcKu0FIU','Ryder',0,NULL,NULL,'http://camenryder.xyz/public/img/1715503939612_83c8e2b247ef098179c3caaf8086c490.jpg',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(15,'user020@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$R+yHUL+7axsFRX/yKTSALw$SA48PpvkaQGv7EHfT56k6/EZg0cP99n7u1LNR0313uM','Ryder',0,NULL,NULL,'http://camenryder.xyz/public/img/1715505104648_83c8e2b247ef098179c3caaf8086c490.jpg',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(16,'user030@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$WqF78yqcXoXvpAxxkbis4g$7IPGa/VfmGQVfBWCyO9GLkTlkQT5bWbsKEUY/07C8TU','bacthayflick',0,NULL,NULL,'http://camenryder.xyz/public/img/1715521769742_Screenshot_20240512-102842~2.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(17,'leminh@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$F1ycYKEB/ypropQ4gJJ6XQ$KS/ls4dAuWcReNki/OpBpbHdWJfr/zjJ0AUp4QZBjGc','Mine',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(18,'user1@example.com','$argon2id$v=19$m=65536,t=3,p=4$i7Nhom8FxMtm2EpADCApyQ$/UAYUwJjTMYfanTZjNjGpoFWi/EA/DvLQNKAHpzLClk','John Smith',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',3,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(19,'avawhite@example.com','$argon2id$v=19$m=65536,t=3,p=4$hDqVZ7sxg5HQAeGQklOQ3A$hNoCRkRhf549mEEkd+YG/TaSM+HeMjqn2gu2UK5TkBk','Ava White',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(20,'alexanderthomas@example.com','$argon2id$v=19$m=65536,t=3,p=4$eT2AEF2XqR0GHI6LZPwkLA$UcwWEfgQSSxymbCm7XHVg5RGQ1QBJw05HQ5Ni3tba00','Alexander Thomas',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',3,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(21,'oliviaanderson@example.com','$argon2id$v=19$m=65536,t=3,p=4$tp4w6iK+q51ZbPxGPYQhog$RZGha9uNfVgny2bso3lFWTvhuKfZ7dWInJfojTzxIhU','Olivia Anderson',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(22,'jamesmartinez@example.com','$argon2id$v=19$m=65536,t=3,p=4$Ms4cfi7cItqjgsEhxjGMOA$12k6v5xFNvLOwF8CGY6oqu0Axnb0YiAD4evs3HWbCfw','James Martinez',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(23,'sophiataylor@example.com','$argon2id$v=19$m=65536,t=3,p=4$mMK3PvqE7WguScLVsXLRyg$pK4eaIClR+Qa676VUSN6wPZptpWs/MCB9gAYIYFLWM0','Sophia Taylor',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',3,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(24,'williamwilson@example.com','$argon2id$v=19$m=65536,t=3,p=4$pnen+xhvl7XqQWi7t10dwA$fL8LaIllDQ9hzcO/9pTd+BKzic7AnG4KsbXsjOHP3E8','William Wilson',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(25,'emmadavis@example.com','$argon2id$v=19$m=65536,t=3,p=4$q5OO0x9gmSnz8I3uQaMKZA$/8RnLY5YG0eLvSMf7TmB+cE89pPtaT6eZWqMjoU/Ev0','Người được chọn',0,'','','http://camenryder.xyz/public/img/1716359944053_55ff0113fda1ebef91463c22bffd4ba4.jpg',3,NULL,NULL,'http://camenryder.xyz/public/img/1716359769786_Dragon-Ball-game4v-1648740274-76.jpg',NULL,0),(26,'michaelbrown@example.com','$argon2id$v=19$m=65536,t=3,p=4$X8eYSKaXhu9JejgLDBbhgw$SVEoHC0zkUihOArHtAEkD4C47dqsHFbqUEjyQ0v8+lc','Michael Brown',0,NULL,NULL,'http://camenryder.xyz/public/img/1715999904247_Dragon-Ball-game4v-1648740274-76.jpg',3,NULL,NULL,'http://camenryder.xyz/public/img/1716000004797_Dragon-Ball-game4v-1648740274-76.jpg',NULL,0),(27,'emilyjohnson@example.com','$argon2id$v=19$m=65536,t=3,p=4$TX/CNE0ntfj/5wpUiPHZ3Q$+bLqtIanePcu6vWQ5avqlwQbNw0GHTsaWDbnfbLd4JA','Emily Johnson',0,NULL,NULL,'http://camenryder.xyz/public/img/1716360519898_55ff0113fda1ebef91463c22bffd4ba4.jpg',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(28,'johnsmith@example.com','$argon2id$v=19$m=65536,t=3,p=4$Z6rB5Uzg14c8ka5QFb7cag$tIp3zha7j9zNPSVhGhq3IbH1n6BM95FJeM0XPFd1z3Y','John Smith',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',3,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(29,'locvo@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$8l4rtRGIAydjts57cvyayA$lgSOCWef1ZqrsiSqo267/FfkyAUFX4MaPnNkel11ky0','Ryder',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(30,'user018@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$M+HAhtNnP9sTYGhDoYDleQ$S8HKauwtquWnCGt0VRNowNs99AVW9k+LM2l752iBJKU','Ryder',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(31,'minhday0@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$+TZS1wuXIzprfl2a430Bdw$h80bpa4SKhYUXUuiYpTSHzD+4DLQKFaNWnokVgbjRkw','minhday',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(32,'minhday@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$R2bODuGfS6quchK5bR8emQ$17KeWhStzzEpmh35IttZZ7bMIyF7FxFO7kZeGtrsDTA','minhday',1,'Vietnam','Vie','http://camenryder.xyz/public/img/1716694719662_arsenal2.jpg',3,NULL,NULL,'http://camenryder.xyz/public/img/1718534027035_arsenal2.jpg',NULL,0),(33,'embe@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$UmQzSbRyNBltDOxBPRXeSA$MIHX6inTvINvJYJv1mz5OeWsvaiJrwCejyYGGiYuZII','embeday',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(34,'a@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$ipv5Bp9MYiV5BTx7bpN0Nw$QxYdEf5dckTXPa9F0yxHJUXfx+u9ViFolVqD2Wfv2kU','I love ManCity',0,'Vietnam','Vietnamese','http://camenryder.xyz/public/img/1716711924356_mancity.jpg',1,NULL,NULL,'http://camenryder.xyz/public/img/1716711915665_skynews-manchester-city_6560183.jpg',NULL,0),(35,'b@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$9K9CPJ1Jdyo7QPKUFIqsqg$l82PWlAM+wAa9LKcn4qhLifbo+QEAlho8kBEFxMpSRA','Anh B',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',3,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(36,'khanh@123.com','$argon2id$v=19$m=65536,t=3,p=4$dive3WI2CW+3FyRN9q+97w$Ny5Io772EliiW1kLo4+6Gib9nRQ4IKH2tmL2+cVntXg','khanhT',1,'Miami','French','http://camenryder.xyz/public/img/1716947413278_Screenshot 2024-04-15 062626.png',3,NULL,NULL,'http://camenryder.xyz/public/img/1716947439335_Screenshot 2024-04-15 062419.png',NULL,0),(37,'user101@gmai.com','$argon2id$v=19$m=65536,t=3,p=4$xhevLPVp8sUkfri46472EA$sq53sZU1cG9EZruxo27503TsGj8wMwVNWlT7n9jNVos','Minh Hiếu',0,'Việt Nam','Tiếng hơi ngọng nhma miền Nam ','http://camenryder.xyz/public/img/1716554944778_vuhuthuoc.jpg',1,NULL,NULL,'http://camenryder.xyz/public/img/1716554500745_1706_hinh-nen-phi-hanh-gia61.jpg',NULL,0),(38,'user017@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$zxK4XF/Atc+cusohBCIprA$v1ZMNv/KjjOj4YwFF5V7kCHN5dyCBPyWiQ4Kqr9kpfE','MihHius',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','5/25/2024, 23:53:29',0),(39,'aha@123.com','$argon2id$v=19$m=65536,t=3,p=4$0OuFjPAmZo0+e+Qo3mCd8Q$4hzcN/uhnfSwUEWns/a2pS96Lbi6OGZwItDwopi08Pg','FunnyGuy',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','5/28/2024, 20:46:15',0),(40,'england@country.com','$argon2id$v=19$m=65536,t=3,p=4$3Zvnp0XnotSVtRhJ+6RQWg$CBPA28hrGYWYWv0JZfzsNiY7+d78RBeJvoogRceOPnk','England',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',3,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','5/28/2024, 23:17:18',0),(41,'admin@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$i7Nhom8FxMtm2EpADCApyQ$/UAYUwJjTMYfanTZjNjGpoFWi/EA/DvLQNKAHpzLClk','admin',1,'UK','England','http://camenryder.xyz/public/img/1718611546358_winter.jpg',2,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL,0),(42,'user_premium@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$Qta+7dK3MmpVzMAGAUaStQ$vdGj65X/w9PxbtCbSqlo5899m8glXpe9D/O0bcIDzXg','Chàng trai liêm khiết',0,NULL,NULL,'http://camenryder.xyz/public/img/1717344302548_To_Lam_October_2022.jpg',1,NULL,NULL,'http://camenryder.xyz/public/img/1717344373887_chu-tich-nuoc-to-lam-12-17163451956692039150341.jpg','6/2/2024, 23:02:45',0),(43,'thai1@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$2PcjmAx+JTR8fzM1V7AJzA$Rfln/KgsYzRHdrVS5Bim/D3oGxRmpmThKhMZGdCrFkg','HUY THÁI',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/4/2024, 11:53:15',0),(44,'joker@123.com','$argon2id$v=19$m=65536,t=3,p=4$rB9SPu3RjsZJO/Ct9LKFUw$nZdXNmySr/Nae/Rl2jgm8u61seqXr0R6Ok4dVwDazoY','Joker',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',3,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 24:05:20',0),(45,'huudien111@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$AKuqharX/Xm6SGEt8J1F4Q$Rt0aOFJ3fq0fQfyWYPDV5kf937boRX3EaKr16FmBLzs','Dien',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 12:52:29',0),(46,'nhatanh.nuis@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$FoSSuRVtxfEOHK9AKX6o8g$lkFa/7/XtQlNI3NEkRorFTnO0s+Svt2jmAbHdqY4Wc8','223',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 12:59:05',0),(47,'nhatanh.nuis1@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$4PHvEAjqelBVGZdY2mI/7Q$E7YKctUbLnKg9WnMDJWHtrjpOG573PnB5wGQpjjIOL8','Nguyễn Anh Nhật',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 13:03:56',0),(48,'haha@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$fh6ibB23CEjb3xU1m8N9iA$XBF33D2/UjnjSGnd2X7Idnnwy6qv2C+DXw5MKL17WIw','hha',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 13:38:40',0),(49,'user028@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$fIWPyOIl93DK0xJ/gvr7bg$3o5Od24SgSTUSszvGL0pUqZX90q0B7x4B2nYyXjK5Zc','Minh Hieu',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 13:46:59',0),(50,'user0288@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$z+dTftqEnY0RZDkWJJ3QdQ$H6dgFj77ngAvDjlXjo/YHPsPZ2JTw2n+4rGp0Wc6QnI','Minh Hieu',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 13:53:48',0),(51,'user288@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$PnHPehirOqSpcSHfOxS7lw$rkpXTfnEphyh3DhXzjRiSGpDkYGNLisOCt9r5sb0exs','Minh Hieu',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 13:54:30',0),(52,'user2898@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$nem7LPtaZM7RwnUdn+Yp1A$9M9oGUsufje1gCxSlFB16JyyZ/uB9ThFAvNKWKD5/BA','Minh Hieu',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 13:55:34',0),(53,'asa@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$bl3PDKgXRH7ZcDntQ3uMMw$EBR0b/BV0yTBbRmYTUzWQlizBKZ3YJdbY1KRZtnae1U','LeMinh0706',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 14:05:33',0),(54,'asqaa@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$XEMdUm7BaUQ0Ihab/zlJrg$WeO8p6fZXrOmbIm8PVhUxhaM9hpSakbAuhj5s8hl2Wk','LeMinh0706',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 14:10:09',0),(55,'as12qaa@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$SlgTLc9wlA+IVYdr+Fxw+g$YXvNjcK6ooQOEyjOsRd7+1B9iiXxXvkaI9rl9ZLb45s','LeMinh0706',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 14:10:23',0),(56,'jhgfds@gmail.ccom','$argon2id$v=19$m=65536,t=3,p=4$Iz27zjMN1b8ZMhwBRRkBOA$J2xndaaiRkUdXWkWidigdA92GeiNNQHKbD4fZd+j6v0','embeday',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 14:15:01',0),(57,'jhgfd2@gmail.ccom','$argon2id$v=19$m=65536,t=3,p=4$rVGDx4Xowa1kOI/hgn+Lnw$q1ci+1yb7OyAkZicjsAVGXAXFrTeyIAvOOj7os0osk0','embeday',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 14:15:21',0),(58,'mimi@123.com','$argon2id$v=19$m=65536,t=3,p=4$dZ3EfFv46RdARv3CRUOLqA$SIFDdNmjQL07JyUK6wp73bPCNfoNN7G0zqFvgKBM3Ao','mimi',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 14:25:42',0),(59,'user999@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$C/Axgp2+zBaF+4EdlzoVQg$jgGwZ+RFzDMCcz+TjEjTmpRG/CUUxZgVy0LX1fQAjq4','Minh Hieu',0,NULL,NULL,'http://camenryder.xyz/public/img/1718714743130_abc_123.jpeg',3,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','6/18/2024, 17:07:35',0),(60,'user998@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$z0xSQ10Kp8gvCLUXTGlUSQ$0MB+0JpnsMJdZVY9eFTBys9M8Wm0EKTDu/g6qwM9ofE','Hiếu',1,'Việt nam','Việt Nam','http://camenryder.xyz/public/img/1718705778718_Dragon-Ball-game4v-1648740274-76.jpg',3,NULL,NULL,'http://camenryder.xyz/public/img/1718705814579_maxresdefault.jpg','6/18/2024, 17:13:11',0);
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

-- Dump completed on 2024-08-04 21:01:27
