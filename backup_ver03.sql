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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Post`
--

LOCK TABLES `Post` WRITE;
/*!40000 ALTER TABLE `Post` DISABLE KEYS */;
INSERT INTO `Post` VALUES (30,15,1,NULL,'tesstt post create 001',NULL,'1715525199833',NULL,NULL),(31,15,1,NULL,'Test post create ver 002 :>',NULL,'1715525250969',NULL,NULL),(32,16,1,NULL,'Siu xay daaa chứ ai :D',NULL,'1715525321737',NULL,NULL),(33,16,1,NULL,'let him cook :>',NULL,'1715525344107',NULL,NULL),(34,17,1,NULL,'Dep trai co gi sai',NULL,'1715532450407',NULL,NULL),(35,23,1,NULL,'Ngành IT Việt Nam hiện nay ở đầu của sự phát triển. Có thể nói IT là vua của các nghề. Vừa có tiền, có quyền. Vừa kiếm được nhiều $ lại được xã hội trọng vọng.',NULL,'1715595386638',NULL,NULL),(36,25,1,NULL,'Thằng em mình học bách khoa cơ khí, bỏ ngang sang IT, sinh năm 96. Tự mày mò học code rồi đi làm remote cho công ty Mỹ 2 năm nay. Mỗi tối online 3-4 giờ là xong việc. Lương tháng 3k6. Nhưng thu nhập chính vẫn là từ nhận các project bên ngoài làm thêm. Tuần làm 2,3 cái nhẹ nhàng 9,10k tiền tươi thóc thật không phải đóng thuế. Làm gần được 3 năm mà nhà xe nó đã mua đủ cả. Nghĩ mà thèm.',NULL,'1715595409834',NULL,NULL),(37,25,1,NULL,'Trong trường hợp nhóm này bị điều tra bởi các cơ quan trực thuộc bộ công an (hoặc các tổ chức chính trị tương tự phục vụ cho nhà nước CHXHCNVN), tôi khẳng định mình không liên quan tới nhóm hoặc những cá nhân khác trong nhóm này. Tôi không rõ tại sao mình lại có mặt ở đây vào thời điểm này, có lẽ tài khoản của tôi đã được thêm bởi một bên thứ ba. Tôi cũng xin khẳng định rằng mình không hề giúp sức cho những hành động chống phá Đảng và nhà nước của các thành viên trong nhóm này',NULL,'1715595436816',NULL,NULL),(38,25,1,NULL,'Anh Liêm được dịp farm gà Liêm con sung sướng hát ca nguyên ngày Mừng thầm râu nhí sẽ cay Ngờ đâu sự thật thương thay lũ khùng Quốc đảo thì quẩy thật sung Cù lao hattrick anh hùng nỗi chi  Đến khi gặp đội hơi lì Anh Liêm mất dạng liền phi về nhà Lấy ngay điện thoại chị ra Soạn ngay văn mẫu lỗi là tại Si',NULL,'1715595467165',NULL,NULL),(39,28,1,NULL,'Không vui chút nào, tôi đã không cười. Trò đùa của bạn thật tệ, tôi sẽ thích trò đùa này nếu nó được xoá khỏi đầu tôi và bạn vui lòng từ bỏ nói lại cho tôi trò đùa đấy.',NULL,'1715595514112',NULL,NULL),(40,24,1,NULL,'Bạn thực sự là một quái vật nhà quê, kẻ hủy diệt lòng tự trọng, tổng tư lệnh xấu hổ, chiến thần hề, country god, chúa tể đội quần, tù trưởng hài hước, đại đội trưởng trung đoàn nông thôn, thần thoại nhục nhã, huyền thoại quê mùa, thần đồng quê kệch, lãnh chúa của các thế hệ đội giỏ Việt, người viết lên kịch bản phim người nhà quê, trùm chui xuống lỗ, tướng quân gáy lớn, thầy dạy phản biện, ông tổ ngành cãi, trùm trường luật, thiên tài tranh biện, người đột biến hệ nhột.',NULL,'1715595662651',NULL,NULL),(41,24,1,NULL,'Tại hạ lại nghe nói có một loại bao da, sâu tầm tấc bảy, mềm mượt vô cùng, xung quanh phát khí chí âm chí hàn, tuy vô cương vô lực nhưng lại hấp thụ dương khí, tỏa ra một mãnh lực vô hình khiến thần binh trong thiên hạ vạn dặm quy tông. Vật này tuy không cương nhu phối hợp giết người ngoài quan ải trong chớp mắt như Thần Thương của ta nhưng lại khiến cho kẻ địch mất dần sinh lực rồi hạ binh chịu hàng, lại nghe kỳ truyện rằng vì bảo vật này mà anh hùng trong thiên hạ tranh giành chém giết, kẻ giành được thì tâm thần điên loạn bỏ mặc anh em. Quả thật là vạn phần nguy hiểm hơn thần binh của ta nhiều.',NULL,'1715595680545',NULL,NULL),(42,25,1,NULL,'Tôi có một ước mơ, đó là meme sẽ được thế giới công nhận là nghệ thuật. Khi ấy những meme bất diệt sẽ được trường tồn, được đóng khung tại bảo tàng, được chứng nhận là di sản văn hóa. Những meme như thế này sẽ sống mãi trong lòng ae, sẽ được truyền từ đời này tới đời khác. Ôi thế giới như thế thật tuyệt làm sao, bạn cũng thích vậy chứ?',NULL,'1715595748992',NULL,NULL),(43,26,1,NULL,'Là tôi, tôi đã hỏi. Thật là một cực hình khi phải nặng gánh trách nhiệm của một kẻ tội đồ đã đưa ra câu hỏi và giấu mình vào ngôi thứ ba. Trách nhiệm nặng như quả đất, đặt vào đôi bờ vai nhỏ bé của tôi. Nó như đè nát thân tâm tôi, nó rằng xé con người tôi bởi sức nặng khủng khiếp của Kẻ Đã Hỏi. Thật là một cực hình, quả là địa ngục trần gian, đúng là tra tấn man rợn. Nhưng cuối cùng, tôi cũng được giải phóng khỏi chuỗi ngày đau khổ đó. Đúng, là tôi, tôi đã hỏi, có vấn đề gì không?',NULL,'1715595799548',NULL,NULL),(44,22,1,NULL,'VĂN MẪU CỦA VIỆT NAM KHI BỊ HỎI VỀ XUNG ĐỘT QUỐC TẾ Việt Nam quan ngại sâu sắc về các hoạt động <.......> của <quốc gia / khu vực>. Chúng tôi mong muốn các bên có động thái giải quyết vấn đề 1 cách hòa bình, trên các tôn trọng lẫn nhau cũng như tuân thủ luật pháp và công ước quốc tế',NULL,'1715595843326',NULL,NULL),(45,28,1,NULL,'Chào em, chị là luật sư của army và đã thu thập đủ bằng chứng em xúc phạm army của công ty bên chị. Em vui lòng xóa bài này sau 30 phút. Nếu sau 30 phút mà em vẫn chưa xóa bài thì bên chị sẽ dùng tới pháp luật và em sẽ bị lôi đầu ra Côn Đảo !',NULL,'1715595904383',NULL,NULL),(46,23,1,NULL,'Cuối cùng mới có một bộ anime mà nhân vật chính đúng chuẩn hình mẫu lý tưởng của tao. Một kẻ lạnh lùng và ít nói. Đám bạn không hiểu tại sao tao trở nên im lặng và luôn được 5 điểm bài kiểm tra. Chúng nó không biết năng lực thực sự của tao và không hề biết tao xuất chúng tới mức nào. Tao chẳng coi chúng là gì ngoài công cụ. Tao ước mình có thể vào trong thế giới anime và bộc lộ con người thực sự của mình. Tao tin chắc rằng tao chính là hoá thân ngoài đời thực của Ayanokouji.',NULL,'1715595929670',NULL,NULL),(47,23,1,NULL,'Trời buồn trời đổ cơn mưa Anh ngồi anh viết thư tình cho em Đầu câu hai chữ \"chung tình\" Cuối câu bốn chữ \"chúng mình chia tay\"',NULL,'1715596007518',NULL,NULL),(49,24,1,NULL,'Này ông, tôi không biết mọi người thấy meme này như thế nào, nhưng đối với tôi, nó tuyệt lắm, cơ mà có vẻ như nó không đáp ứng được tiêu chí là một món ăn tinh thần cho anh em trong group và cả tôi, tôi chắc chắn rằng ông có thể tạo ra những meme còn tuyệt hơn như thế này nhiều, tôi và cả anh em trong group cảm thấy thật hạnh phúc khi có ông trong group, chúng tôi tự hào và xúc động về những cố gắng ông đã đóng góp để phát triển group của chúng ta, tôi thật may mắn vì đã gặp được ông, chào ông và thân ái.',NULL,'1715596197098',NULL,NULL),(50,26,1,NULL,'Are you here to find the accommodation of your dreams?',NULL,'1715596354124',NULL,NULL);
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
  CONSTRAINT `PostImage_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PostImage`
--

LOCK TABLES `PostImage` WRITE;
/*!40000 ALTER TABLE `PostImage` DISABLE KEYS */;
INSERT INTO `PostImage` VALUES (24,'http://camenryder.xyz/public/img/1715525199648_Dragon-Ball-game4v-1648740274-76.jpg',30,NULL),(25,'http://camenryder.xyz/public/img/1715525250722_ea85b7af823d7c98be67119ddf05d656.jpg',31,NULL),(26,'http://camenryder.xyz/public/img/1715525321610_ea85b7af823d7c98be67119ddf05d656.jpg',32,NULL),(27,'http://camenryder.xyz/public/img/1715532450401_FB_IMG_1715168497565.jpg',34,NULL),(28,'http://camenryder.xyz/public/img/1715595386545_1085381.jpg',35,NULL),(29,'http://camenryder.xyz/public/img/1715595409778_1085381.jpg',36,NULL),(30,'http://camenryder.xyz/public/img/1715595436765_1085381.jpg',37,NULL),(31,'http://camenryder.xyz/public/img/1715595467109_1085381.jpg',38,NULL),(32,'http://camenryder.xyz/public/img/1715595513922_1085381.jpg',39,NULL),(33,'http://camenryder.xyz/public/img/1715595662493_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',40,NULL),(34,'http://camenryder.xyz/public/img/1715595680464_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',41,NULL),(35,'http://camenryder.xyz/public/img/1715595748985_Screenshot 2024-01-23 201005.png',42,NULL),(36,'http://camenryder.xyz/public/img/1715595799483_Screenshot 2024-02-28 124515.png',43,NULL),(37,'http://camenryder.xyz/public/img/1715595843324_Screenshot 2024-05-04 204240.png',44,NULL),(38,'http://camenryder.xyz/public/img/1715595904360_Screenshot 2024-01-23 185834.png',45,NULL),(39,'http://camenryder.xyz/public/img/1715595929637_Screenshot 2024-05-13 172454.png',46,NULL),(40,'http://camenryder.xyz/public/img/1715596007334_Screenshot 2024-04-20 195305.png',47,NULL),(41,'http://camenryder.xyz/public/img/1715596094124_Screenshot 2024-03-14 202939.png',NULL,NULL),(42,'http://camenryder.xyz/public/img/1715596197095_Screenshot 2024-02-23 155102.png',49,NULL),(43,'http://camenryder.xyz/public/img/1715596354121_Screenshot 2024-05-13 173147.png',50,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReactPost`
--

LOCK TABLES `ReactPost` WRITE;
/*!40000 ALTER TABLE `ReactPost` DISABLE KEYS */;
INSERT INTO `ReactPost` VALUES (1,NULL,2,1),(2,NULL,3,1),(3,NULL,5,1),(4,NULL,4,2),(5,44,15,1),(6,44,16,1),(7,46,23,1),(8,46,28,1),(9,46,22,1),(10,46,16,1);
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
  PRIMARY KEY (`report_id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  KEY `issue_id` (`issue_id`),
  CONSTRAINT `Report_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  CONSTRAINT `Report_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`),
  CONSTRAINT `Report_ibfk_3` FOREIGN KEY (`issue_id`) REFERENCES `Issues` (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Report`
--

LOCK TABLES `Report` WRITE;
/*!40000 ALTER TABLE `Report` DISABLE KEYS */;
INSERT INTO `Report` VALUES (1,29,45,1,'1715703193292'),(2,29,45,2,'1715703878837'),(3,29,45,3,'1715703905493'),(4,29,45,4,'1715703983792');
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
  `diner_address` varchar(200) DEFAULT NULL,
  `diner_image` varchar(400) DEFAULT NULL,
  `diner_name` varchar(200) DEFAULT NULL,
  `phone` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'user_01@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$NsikJqgkxozGhrChqv8H3A$A4hvoSFLIdQ+IqCoTTE12H8e/0BrzUchP2FtrADPloY','user01',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,NULL,NULL),(2,'user_02@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$NsikJqgkxozGhrChqv8H3A$A4hvoSFLIdQ+IqCoTTE12H8e/0BrzUchP2FtrADPloY','Adam',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,NULL,NULL),(3,'user_03@gmail.com','user_03','User_03',1,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,NULL,NULL),(4,'user_04@gmail.com','user_04','User_04',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,NULL,NULL),(5,'user_05@gmail.com','abc@123','user_05',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,NULL,NULL),(6,'user_03@gmail.com','user_03','User_03',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',3,NULL,NULL,NULL,NULL),(10,'user010@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$NsikJqgkxozGhrChqv8H3A$A4hvoSFLIdQ+IqCoTTE12H8e/0BrzUchP2FtrADPloY','Ryder',0,NULL,NULL,'http://camenryder.xyz/public/img/1715357202985_abc_123.jpg',NULL,NULL,NULL,NULL,NULL),(11,'user011@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$mhoGPN29CZwFKoLeDi4TxA$gjR5qH7mIe9XiAcZ5rPYh20PSh7CCA4abCEUL1oBfDg','Ryder',0,NULL,NULL,'https://avatar.iran.liara.run/public/boy?username=Ash',NULL,NULL,NULL,NULL,NULL),(12,'minh@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$ssEnyOKSN6bbkLb/xiRfRQ$740Hm0YVp8/XkvaRPLNYx2uDVdpq9yr95aG57Gb1FfM','minh',0,NULL,NULL,'https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,NULL,NULL),(13,'user014@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$IzRDRPbj/Z70UmV+vA5iJA$XOAUAQufncXUNHLBNmwva3p1f5o57qaA7dfowyV509o','Ryder',0,NULL,NULL,'https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,NULL,NULL),(14,'user015@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$e1/R3jBCBwyypqtUjv/Saw$JwNa2gsxXi6F66Pr31jRfxe1DGOAm9kDKyLVcKu0FIU','Ryder',0,NULL,NULL,'http://camenryder.xyz/public/img/1715503939612_83c8e2b247ef098179c3caaf8086c490.jpg',1,NULL,NULL,NULL,NULL),(15,'user020@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$R+yHUL+7axsFRX/yKTSALw$SA48PpvkaQGv7EHfT56k6/EZg0cP99n7u1LNR0313uM','Ryder',0,NULL,NULL,'http://camenryder.xyz/public/img/1715505104648_83c8e2b247ef098179c3caaf8086c490.jpg',1,NULL,NULL,NULL,NULL),(16,'user030@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$WqF78yqcXoXvpAxxkbis4g$7IPGa/VfmGQVfBWCyO9GLkTlkQT5bWbsKEUY/07C8TU','bacthayflick',0,NULL,NULL,'http://camenryder.xyz/public/img/1715521769742_Screenshot_20240512-102842~2.png',1,NULL,NULL,NULL,NULL),(17,'leminh@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$F1ycYKEB/ypropQ4gJJ6XQ$KS/ls4dAuWcReNki/OpBpbHdWJfr/zjJ0AUp4QZBjGc','Mine',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(18,'user1@example.com','$argon2id$v=19$m=65536,t=3,p=4$i7Nhom8FxMtm2EpADCApyQ$/UAYUwJjTMYfanTZjNjGpoFWi/EA/DvLQNKAHpzLClk','John Smith',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(19,'avawhite@example.com','$argon2id$v=19$m=65536,t=3,p=4$hDqVZ7sxg5HQAeGQklOQ3A$hNoCRkRhf549mEEkd+YG/TaSM+HeMjqn2gu2UK5TkBk','Ava White',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(20,'alexanderthomas@example.com','$argon2id$v=19$m=65536,t=3,p=4$eT2AEF2XqR0GHI6LZPwkLA$UcwWEfgQSSxymbCm7XHVg5RGQ1QBJw05HQ5Ni3tba00','Alexander Thomas',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(21,'oliviaanderson@example.com','$argon2id$v=19$m=65536,t=3,p=4$tp4w6iK+q51ZbPxGPYQhog$RZGha9uNfVgny2bso3lFWTvhuKfZ7dWInJfojTzxIhU','Olivia Anderson',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(22,'jamesmartinez@example.com','$argon2id$v=19$m=65536,t=3,p=4$Ms4cfi7cItqjgsEhxjGMOA$12k6v5xFNvLOwF8CGY6oqu0Axnb0YiAD4evs3HWbCfw','James Martinez',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(23,'sophiataylor@example.com','$argon2id$v=19$m=65536,t=3,p=4$mMK3PvqE7WguScLVsXLRyg$pK4eaIClR+Qa676VUSN6wPZptpWs/MCB9gAYIYFLWM0','Sophia Taylor',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(24,'williamwilson@example.com','$argon2id$v=19$m=65536,t=3,p=4$pnen+xhvl7XqQWi7t10dwA$fL8LaIllDQ9hzcO/9pTd+BKzic7AnG4KsbXsjOHP3E8','William Wilson',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(25,'emmadavis@example.com','$argon2id$v=19$m=65536,t=3,p=4$q5OO0x9gmSnz8I3uQaMKZA$/8RnLY5YG0eLvSMf7TmB+cE89pPtaT6eZWqMjoU/Ev0','Emma Davis',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(26,'michaelbrown@example.com','$argon2id$v=19$m=65536,t=3,p=4$X8eYSKaXhu9JejgLDBbhgw$SVEoHC0zkUihOArHtAEkD4C47dqsHFbqUEjyQ0v8+lc','Michael Brown',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(27,'emilyjohnson@example.com','$argon2id$v=19$m=65536,t=3,p=4$TX/CNE0ntfj/5wpUiPHZ3Q$+bLqtIanePcu6vWQ5avqlwQbNw0GHTsaWDbnfbLd4JA','Emily Johnson',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(28,'johnsmith@example.com','$argon2id$v=19$m=65536,t=3,p=4$Z6rB5Uzg14c8ka5QFb7cag$tIp3zha7j9zNPSVhGhq3IbH1n6BM95FJeM0XPFd1z3Y','John Smith',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(29,'locvo@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$8l4rtRGIAydjts57cvyayA$lgSOCWef1ZqrsiSqo267/FfkyAUFX4MaPnNkel11ky0','Ryder',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(30,'user018@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$M+HAhtNnP9sTYGhDoYDleQ$S8HKauwtquWnCGt0VRNowNs99AVW9k+LM2l752iBJKU','Ryder',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(31,'minhday0@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$+TZS1wuXIzprfl2a430Bdw$h80bpa4SKhYUXUuiYpTSHzD+4DLQKFaNWnokVgbjRkw','minhday',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(32,'minhday@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$R2bODuGfS6quchK5bR8emQ$17KeWhStzzEpmh35IttZZ7bMIyF7FxFO7kZeGtrsDTA','minhday',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(33,'embe@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$UmQzSbRyNBltDOxBPRXeSA$MIHX6inTvINvJYJv1mz5OeWsvaiJrwCejyYGGiYuZII','embeday',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(34,'a@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$ipv5Bp9MYiV5BTx7bpN0Nw$QxYdEf5dckTXPa9F0yxHJUXfx+u9ViFolVqD2Wfv2kU','Nguyen Van A',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL),(35,'b@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$9K9CPJ1Jdyo7QPKUFIqsqg$l82PWlAM+wAa9LKcn4qhLifbo+QEAlho8kBEFxMpSRA','Anh B',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2024-05-16 11:00:15
