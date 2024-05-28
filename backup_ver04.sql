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
-- Table structure for table `AccountState`
--

DROP TABLE IF EXISTS `AccountState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccountState` (
  `account_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_state_name` varchar(400) NOT NULL,
  PRIMARY KEY (`account_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountState`
--

LOCK TABLES `AccountState` WRITE;
/*!40000 ALTER TABLE `AccountState` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BrowsingAccount`
--

LOCK TABLES `BrowsingAccount` WRITE;
/*!40000 ALTER TABLE `BrowsingAccount` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Follower`
--

LOCK TABLES `Follower` WRITE;
/*!40000 ALTER TABLE `Follower` DISABLE KEYS */;
INSERT INTO `Follower` VALUES (3,2,32),(4,6,32),(5,1,32),(6,3,32),(7,10,32),(8,11,32),(9,12,32),(10,15,32),(11,13,32),(12,14,32),(13,16,32),(14,17,32),(15,4,32),(16,5,32),(17,18,32),(18,19,32),(19,20,32),(20,22,32),(21,21,32),(22,24,32),(23,23,32),(24,25,32),(25,27,32),(26,26,32),(27,28,32),(28,30,32),(29,29,32),(30,31,32),(32,37,32),(33,33,32),(34,10,12),(35,34,32),(36,35,32),(38,38,32),(40,36,31),(41,36,37),(44,36,17),(45,36,32),(49,39,36);
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
  PRIMARY KEY (`noti_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notification`
--

LOCK TABLES `Notification` WRITE;
/*!40000 ALTER TABLE `Notification` DISABLE KEYS */;
INSERT INTO `Notification` VALUES (1,'1716872192019','Ava White đã bình luận vào bài viết của bạn.',0,10,'1 Bình luận mới'),(2,'1716903975183','Chào mừng user FunnyGuy đến với social food',0,39,'Đăng kí thành công'),(3,'1716903991147','FunnyGuy đã theo dõi bạn.',0,36,'1 người theo dõi mới');
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
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Post`
--

LOCK TABLES `Post` WRITE;
/*!40000 ALTER TABLE `Post` DISABLE KEYS */;
INSERT INTO `Post` VALUES (30,15,1,NULL,'tesstt post create 001',NULL,'1715525199833',NULL,NULL),(31,15,1,NULL,'Test post create ver 002 :>',NULL,'1715525250969',NULL,NULL),(32,16,1,NULL,'Siu xay daaa chứ ai :D',NULL,'1715525321737',NULL,NULL),(33,16,1,NULL,'let him cook :>',NULL,'1715525344107',NULL,NULL),(34,17,1,NULL,'Dep trai co gi sai',NULL,'1715532450407',NULL,NULL),(35,23,1,NULL,'Ngành IT Việt Nam hiện nay ở đầu của sự phát triển. Có thể nói IT là vua của các nghề. Vừa có tiền, có quyền. Vừa kiếm được nhiều $ lại được xã hội trọng vọng.',NULL,'1715595386638',NULL,NULL),(36,25,1,NULL,'Thằng em mình học bách khoa cơ khí, bỏ ngang sang IT, sinh năm 96. Tự mày mò học code rồi đi làm remote cho công ty Mỹ 2 năm nay. Mỗi tối online 3-4 giờ là xong việc. Lương tháng 3k6. Nhưng thu nhập chính vẫn là từ nhận các project bên ngoài làm thêm. Tuần làm 2,3 cái nhẹ nhàng 9,10k tiền tươi thóc thật không phải đóng thuế. Làm gần được 3 năm mà nhà xe nó đã mua đủ cả. Nghĩ mà thèm.',NULL,'1715595409834',NULL,NULL),(37,25,1,NULL,'Trong trường hợp nhóm này bị điều tra bởi các cơ quan trực thuộc bộ công an (hoặc các tổ chức chính trị tương tự phục vụ cho nhà nước CHXHCNVN), tôi khẳng định mình không liên quan tới nhóm hoặc những cá nhân khác trong nhóm này. Tôi không rõ tại sao mình lại có mặt ở đây vào thời điểm này, có lẽ tài khoản của tôi đã được thêm bởi một bên thứ ba. Tôi cũng xin khẳng định rằng mình không hề giúp sức cho những hành động chống phá Đảng và nhà nước của các thành viên trong nhóm này',NULL,'1715595436816',NULL,NULL),(38,25,1,NULL,'Anh Liêm được dịp farm gà Liêm con sung sướng hát ca nguyên ngày Mừng thầm râu nhí sẽ cay Ngờ đâu sự thật thương thay lũ khùng Quốc đảo thì quẩy thật sung Cù lao hattrick anh hùng nỗi chi  Đến khi gặp đội hơi lì Anh Liêm mất dạng liền phi về nhà Lấy ngay điện thoại chị ra Soạn ngay văn mẫu lỗi là tại Si',NULL,'1715595467165',NULL,NULL),(39,28,1,NULL,'Không vui chút nào, tôi đã không cười. Trò đùa của bạn thật tệ, tôi sẽ thích trò đùa này nếu nó được xoá khỏi đầu tôi và bạn vui lòng từ bỏ nói lại cho tôi trò đùa đấy.',NULL,'1715595514112',NULL,NULL),(40,24,1,NULL,'Bạn thực sự là một quái vật nhà quê, kẻ hủy diệt lòng tự trọng, tổng tư lệnh xấu hổ, chiến thần hề, country god, chúa tể đội quần, tù trưởng hài hước, đại đội trưởng trung đoàn nông thôn, thần thoại nhục nhã, huyền thoại quê mùa, thần đồng quê kệch, lãnh chúa của các thế hệ đội giỏ Việt, người viết lên kịch bản phim người nhà quê, trùm chui xuống lỗ, tướng quân gáy lớn, thầy dạy phản biện, ông tổ ngành cãi, trùm trường luật, thiên tài tranh biện, người đột biến hệ nhột.',NULL,'1715595662651',NULL,NULL),(41,24,1,NULL,'Tại hạ lại nghe nói có một loại bao da, sâu tầm tấc bảy, mềm mượt vô cùng, xung quanh phát khí chí âm chí hàn, tuy vô cương vô lực nhưng lại hấp thụ dương khí, tỏa ra một mãnh lực vô hình khiến thần binh trong thiên hạ vạn dặm quy tông. Vật này tuy không cương nhu phối hợp giết người ngoài quan ải trong chớp mắt như Thần Thương của ta nhưng lại khiến cho kẻ địch mất dần sinh lực rồi hạ binh chịu hàng, lại nghe kỳ truyện rằng vì bảo vật này mà anh hùng trong thiên hạ tranh giành chém giết, kẻ giành được thì tâm thần điên loạn bỏ mặc anh em. Quả thật là vạn phần nguy hiểm hơn thần binh của ta nhiều.',NULL,'1715595680545',NULL,NULL),(42,25,1,NULL,'Tôi có một ước mơ, đó là meme sẽ được thế giới công nhận là nghệ thuật. Khi ấy những meme bất diệt sẽ được trường tồn, được đóng khung tại bảo tàng, được chứng nhận là di sản văn hóa. Những meme như thế này sẽ sống mãi trong lòng ae, sẽ được truyền từ đời này tới đời khác. Ôi thế giới như thế thật tuyệt làm sao, bạn cũng thích vậy chứ?',NULL,'1715595748992',NULL,NULL),(43,26,1,NULL,'Là tôi, tôi đã hỏi. Thật là một cực hình khi phải nặng gánh trách nhiệm của một kẻ tội đồ đã đưa ra câu hỏi và giấu mình vào ngôi thứ ba. Trách nhiệm nặng như quả đất, đặt vào đôi bờ vai nhỏ bé của tôi. Nó như đè nát thân tâm tôi, nó rằng xé con người tôi bởi sức nặng khủng khiếp của Kẻ Đã Hỏi. Thật là một cực hình, quả là địa ngục trần gian, đúng là tra tấn man rợn. Nhưng cuối cùng, tôi cũng được giải phóng khỏi chuỗi ngày đau khổ đó. Đúng, là tôi, tôi đã hỏi, có vấn đề gì không?',NULL,'1715595799548',NULL,NULL),(44,22,1,NULL,'VĂN MẪU CỦA VIỆT NAM KHI BỊ HỎI VỀ XUNG ĐỘT QUỐC TẾ Việt Nam quan ngại sâu sắc về các hoạt động <.......> của <quốc gia / khu vực>. Chúng tôi mong muốn các bên có động thái giải quyết vấn đề 1 cách hòa bình, trên các tôn trọng lẫn nhau cũng như tuân thủ luật pháp và công ước quốc tế',NULL,'1715595843326',NULL,NULL),(45,28,1,NULL,'Chào em, chị là luật sư của army và đã thu thập đủ bằng chứng em xúc phạm army của công ty bên chị. Em vui lòng xóa bài này sau 30 phút. Nếu sau 30 phút mà em vẫn chưa xóa bài thì bên chị sẽ dùng tới pháp luật và em sẽ bị lôi đầu ra Côn Đảo !',NULL,'1715595904383',NULL,NULL),(46,23,1,NULL,'Cuối cùng mới có một bộ anime mà nhân vật chính đúng chuẩn hình mẫu lý tưởng của tao. Một kẻ lạnh lùng và ít nói. Đám bạn không hiểu tại sao tao trở nên im lặng và luôn được 5 điểm bài kiểm tra. Chúng nó không biết năng lực thực sự của tao và không hề biết tao xuất chúng tới mức nào. Tao chẳng coi chúng là gì ngoài công cụ. Tao ước mình có thể vào trong thế giới anime và bộc lộ con người thực sự của mình. Tao tin chắc rằng tao chính là hoá thân ngoài đời thực của Ayanokouji.',NULL,'1715595929670',NULL,NULL),(47,23,1,NULL,'Trời buồn trời đổ cơn mưa Anh ngồi anh viết thư tình cho em Đầu câu hai chữ \"chung tình\" Cuối câu bốn chữ \"chúng mình chia tay\"',NULL,'1715596007518',NULL,NULL),(49,24,1,NULL,'Này ông, tôi không biết mọi người thấy meme này như thế nào, nhưng đối với tôi, nó tuyệt lắm, cơ mà có vẻ như nó không đáp ứng được tiêu chí là một món ăn tinh thần cho anh em trong group và cả tôi, tôi chắc chắn rằng ông có thể tạo ra những meme còn tuyệt hơn như thế này nhiều, tôi và cả anh em trong group cảm thấy thật hạnh phúc khi có ông trong group, chúng tôi tự hào và xúc động về những cố gắng ông đã đóng góp để phát triển group của chúng ta, tôi thật may mắn vì đã gặp được ông, chào ông và thân ái.',NULL,'1715596197098',NULL,NULL),(50,26,1,NULL,'Are you here to find the accommodation of your dreams?',NULL,'1715596354124',NULL,NULL),(51,10,2,46,'Guest who love u',NULL,'1715856331297',NULL,NULL),(52,10,2,47,'Bịch nước mía to trà  bá',NULL,'1715856367739',NULL,NULL),(53,23,1,NULL,'Hello',NULL,'1715964584359',NULL,NULL),(54,28,1,NULL,'Iauwa',NULL,'1715967139391',NULL,NULL),(56,25,1,NULL,'helllooooo ',NULL,'1715994575243',NULL,NULL),(57,26,1,NULL,'hello world:)))',NULL,'1715995298123',NULL,NULL),(58,25,1,NULL,'Nola',NULL,'1715995482371',NULL,NULL),(59,25,1,NULL,'Em từ client mới lên',NULL,'1715995540689',NULL,NULL),(60,10,2,26,'Hello wworld',NULL,'1715995587617',NULL,NULL),(61,25,1,NULL,'Em từ client mới lên',NULL,'1715995675448',NULL,NULL),(62,25,1,NULL,'Em từ client mới lên',NULL,'1715995684263',NULL,NULL),(63,25,1,NULL,'ádwad',NULL,'1716000834388',NULL,NULL),(64,25,1,NULL,'Chào em',NULL,'1716001322422',NULL,NULL),(65,10,1,NULL,'Hellowww',NULL,'1716002045576',NULL,NULL),(66,10,1,NULL,'Hellowww',NULL,'1716002046481',NULL,NULL),(67,10,1,NULL,'Hellowww',NULL,'1716002046699',NULL,NULL),(68,10,1,NULL,'Hellowww',NULL,'1716002047122',NULL,NULL),(69,10,1,NULL,'Hellowww',NULL,'1716002047351',NULL,NULL),(70,10,1,NULL,'Hellowww',NULL,'1716002083931',NULL,NULL),(71,10,1,NULL,'Doma here',NULL,'1716002624763',NULL,NULL),(73,25,1,NULL,'sdwsssda',NULL,'1716005261712',NULL,NULL),(74,25,1,NULL,'hala madrid ',NULL,'1716005305612',NULL,NULL),(76,24,1,NULL,'Vũ khí lỗi thời của Ukraina đang khiến Nga bó tay?',NULL,'1716005666780',NULL,NULL),(77,34,1,NULL,'Tặng học sinh nghèo hiếu học Nguyễn Văn A',NULL,'1716007190389',NULL,NULL),(78,34,1,NULL,'Bài viết từ anh a',NULL,'1716023906534',NULL,NULL),(79,34,1,NULL,'Bài của anh a',NULL,'1716023929981',NULL,NULL),(82,34,1,NULL,'test voi state',NULL,'1716035911855',NULL,NULL),(89,25,1,NULL,'123',NULL,'1716054013645',NULL,NULL),(91,24,1,NULL,'123213',NULL,'1716060249066',NULL,NULL),(93,10,1,NULL,'Minh Hieeus',NULL,'1716081698975',NULL,NULL),(95,25,1,NULL,'minh day ne',NULL,'1716082228400',NULL,NULL),(97,25,1,NULL,'lol',NULL,'1716083043174',NULL,NULL),(98,25,1,NULL,'nonstop',NULL,'1716083333891',NULL,NULL),(99,25,1,NULL,'UwU',NULL,'1716084332128',NULL,NULL),(100,25,1,NULL,'123',NULL,'1716084392100',NULL,NULL),(108,25,1,NULL,'alo',NULL,'1716085505651',NULL,NULL),(109,10,1,NULL,'yoman',NULL,'1716104574612',NULL,NULL),(110,10,1,NULL,'yo',NULL,'1716104655333',NULL,NULL),(111,10,1,NULL,'Minh Hieeus',NULL,'1716104813583',NULL,NULL),(119,25,1,NULL,'haha',NULL,'1716105514585',NULL,NULL),(120,10,1,NULL,'Sản phầm là thuốc',NULL,'1716105773980',NULL,NULL),(122,24,1,NULL,'Check cam ?',NULL,'1716108997167',NULL,NULL),(123,24,1,NULL,'Sản phẩm này là thuốc',NULL,'1716109012047',NULL,NULL),(124,26,1,NULL,'tại sao p đọc hướng dẫn sử dụng dầu gội ?',NULL,'1716109280104',NULL,NULL),(125,26,1,NULL,'tại sao p đọc hướng dẫn sử dụng dầu gội ?',NULL,'1716109288553',NULL,NULL),(134,25,1,NULL,'Emma Emma',NULL,'1716117172907',NULL,NULL),(135,25,1,NULL,'Giờ có emma',NULL,'1716117687903',NULL,NULL),(136,10,2,26,'php',NULL,'1716126501278',NULL,NULL),(137,10,2,135,'vãi Emma bị gì hả?',NULL,'1716133998764',NULL,NULL),(138,26,2,135,'Emma có nổi bằng xuân ca ko ?',NULL,'1716134026402',NULL,NULL),(139,21,2,135,'Thử hỏi thế gian ai đệp bằng emma?',NULL,'1716134234757',NULL,NULL),(140,34,1,NULL,'Dang bai',NULL,'1716180633375',NULL,NULL),(141,22,2,135,'1 2 con ong. đb long nhong',NULL,'1716185203688',NULL,NULL),(142,34,1,NULL,'Minh dang bai',NULL,'1716186240533',NULL,NULL),(143,34,1,NULL,'Sửa text area',NULL,'1716186627925',NULL,NULL),(145,22,2,135,'cooking with milk',NULL,'1716190363181',NULL,NULL),(146,25,2,135,'abc123 ',NULL,'1716191113739',NULL,NULL),(147,25,2,135,'abc123 ',NULL,'1716191194401',NULL,NULL),(148,25,2,135,'abc123 ',NULL,'1716191251788',NULL,NULL),(149,25,2,135,'abc123 ',NULL,'1716191289669',NULL,NULL),(153,25,2,144,'test comment ? ',NULL,'1716194289108',NULL,NULL),(154,25,2,144,'allo',NULL,'1716194367448',NULL,NULL),(155,25,2,144,'rồi có gì ko ? ',NULL,'1716194383086',NULL,NULL),(156,25,2,144,'rồi có gì ko ? ',NULL,'1716194463425',NULL,NULL),(157,25,2,144,'vờ lừo thật. ko tự reload lại đc nè :)',NULL,'1716194497826',NULL,NULL),(158,25,1,NULL,'Thêm des nè',NULL,'1716194599961',NULL,NULL),(159,25,2,144,'aloalo',NULL,'1716196036739',NULL,NULL),(162,25,2,144,'upload thafnk cong ?',NULL,'1716196300196',NULL,NULL),(164,25,2,144,'hiihii',NULL,'1716196425602',NULL,NULL),(165,13,2,158,'honkai star rail hả bạn ? ',NULL,'1716196642616',NULL,NULL),(166,10,2,143,'test pingg',NULL,'1716200776887',NULL,NULL),(167,13,2,143,'ping 30ms\r\n',NULL,'1716200815072',NULL,NULL),(168,25,2,143,'ping 299ms :))',NULL,'1716201176177',NULL,NULL),(169,25,2,142,'Emma đã xem',NULL,'1716201191331',NULL,NULL),(170,10,2,142,'số 2 đã xem\r\n',NULL,'1716201228821',NULL,NULL),(171,19,2,142,'số 3 đã nhìn thấy mời số 4\r\n',NULL,'1716201408244',NULL,NULL),(172,21,2,142,'số 4 đag bận đi tìm khoa báu bà TML ',NULL,'1716201679882',NULL,NULL),(173,10,2,143,'hello world ?',NULL,'1716206082890',NULL,NULL),(177,10,2,135,'Hôm nay ryder cúp học tiếng anh quá đãaa\r\n',NULL,'1716251311976',NULL,NULL),(178,21,2,158,'Cúp học luôn\r\n',NULL,'1716251363568',NULL,NULL),(180,21,2,143,'aloo',NULL,'1716269001602',NULL,NULL),(181,25,2,158,'Cao Trường vũ xin chào các bạn',NULL,'1716285899696',NULL,NULL),(183,10,1,NULL,'abc123',NULL,'1716297954615',NULL,NULL),(184,25,1,NULL,'Đăng bài',NULL,'1716305588641',NULL,NULL),(185,25,2,184,'hello',NULL,'1716306039109',NULL,NULL),(186,21,1,NULL,'Bài viết đầu của Anderson',NULL,'1716309935720',NULL,NULL),(187,24,1,NULL,'Wilson đăng bài',NULL,'1716310310075',NULL,NULL),(188,24,1,NULL,'alo alo',NULL,'1716312255810',NULL,NULL),(189,10,2,188,'alo ah Tiến luật ơiiii',NULL,'1716312393772',NULL,NULL),(191,25,2,186,'alo',NULL,'1716312860300',NULL,NULL),(192,33,2,187,'Halo',NULL,'1716312911114',NULL,NULL),(193,10,2,188,'vãi ahh Tiến',NULL,'1716312912453',NULL,NULL),(195,10,2,184,'haa\r\n',NULL,'1716312923928',NULL,NULL),(196,10,2,184,'vipp z ',NULL,'1716312930228',NULL,NULL),(197,10,2,184,'hello bạn ?',NULL,'1716312946186',NULL,NULL),(199,25,1,NULL,'@@@',NULL,'1716313052519',NULL,NULL),(200,36,1,NULL,'verry good ',NULL,'1716314062753',NULL,NULL),(201,36,1,NULL,'xin chao',NULL,'1716314110033',NULL,NULL),(202,25,2,201,'Hello ngày moiws',NULL,'1716314143181',NULL,NULL),(203,36,1,NULL,'ngon x3',NULL,'1716315192423',NULL,NULL),(204,13,1,NULL,'post này bị hack like',NULL,'1716337281468',NULL,NULL),(205,10,2,204,'hôm qua êm đệpp loắmmm\r\n',NULL,'1716352325790',NULL,NULL),(206,25,2,204,'vãiiii òooooo :> ',NULL,'1716352395090',NULL,NULL),(208,25,2,201,'ghjgh',NULL,'1716352658491',NULL,NULL),(209,21,1,NULL,'vãi ò cụt trưởng đá quả nhạc xe đò Miền tây cực chill',NULL,'1716360825008',NULL,NULL),(210,13,2,209,'vãi ò pro vjpp nhạc xe đò miền Tây :>',NULL,'1716360950654',NULL,NULL),(211,21,2,209,'Phòng 50 người nghe nhạc xe đò kiểu',NULL,'1716361295858',NULL,NULL),(212,25,2,201,'hello\r\n',NULL,'1716369329819',NULL,NULL),(213,13,1,NULL,'Khi đờn ông mang bầu 😊',NULL,'1716381577076',NULL,NULL),(215,25,1,NULL,'Cúp trong lòng người hâm mộ',NULL,'1716393135784',NULL,NULL),(216,24,1,NULL,'Viết tâm tư',NULL,'1716393430960',NULL,NULL),(217,21,1,NULL,'Cúp trong lòng người hâm mộ là chiếc cúp quý giá nhất :))',NULL,'1716393783978',NULL,NULL),(218,21,2,186,'alo ?',NULL,'1716394010051',NULL,NULL),(220,19,2,215,'gheeeeeeeeee bạn là nhứut 😊',NULL,'1716431655161',NULL,NULL),(221,19,2,213,'chứ đàn đúm ko được hả ? 😏',NULL,'1716431712645',NULL,NULL),(222,19,2,216,'ảnh có bản quyền kìa Davis. vnExpress kiện SocialFood đó\r\n',NULL,'1716431751318',NULL,NULL),(224,25,2,217,'hiii',NULL,'1716450473093',NULL,NULL),(225,25,1,NULL,'Đăng test solution',NULL,'1716453234027',NULL,NULL),(226,25,1,NULL,'Chắc gì đã đăng bài được ? ',NULL,'1716453266259',NULL,NULL),(229,25,2,225,'xin chào thầy và các bạn\r\n',NULL,'1716474114144',NULL,NULL),(230,25,2,226,'test edit comment',NULL,'1716474158688',NULL,NULL),(233,21,1,NULL,'Hello ',NULL,'1716478529737',NULL,NULL),(234,21,1,NULL,'🥲 Hello tuấn cùi',NULL,'1716478578633',NULL,NULL),(235,21,2,234,'😁 ah barrrr ',NULL,'1716478598659',NULL,NULL),(236,21,2,233,'vãi shjttt how ?? 😷',NULL,'1716478762011',NULL,NULL),(237,34,2,233,'How ?\r\n',NULL,'1716478771914',NULL,NULL),(238,32,1,NULL,'',NULL,'1716553175913',NULL,NULL),(239,37,2,238,'quá đã\r\n',NULL,'1716555304435',NULL,NULL),(240,37,1,NULL,'test gửi link\r\nhttps://apps.apple.com/.../myfamilytree.../id6502604080',NULL,'1716555443355',NULL,NULL),(241,37,2,240,'issues 01',NULL,'1716555483476',NULL,NULL),(242,25,2,238,'hello world',NULL,'1716648306693',NULL,NULL),(243,34,1,NULL,'Cất cúp vào trong',NULL,'1716711586608',NULL,NULL),(244,34,2,238,'Gì mà đã',NULL,'1716737058897',NULL,NULL),(245,25,1,NULL,'Quên đem giấy ký báo cáo tiến độ đồ án. mai lên ký bù\r\nQuá đã😊',NULL,'1716868924055',NULL,NULL),(246,25,2,199,'thử tính năng features ? ',NULL,'1716870314991',NULL,NULL),(247,25,2,199,'tính năng thông báo ? ',NULL,'1716870363596',NULL,NULL),(248,25,2,199,'aduu',NULL,'1716870409858',NULL,NULL),(249,25,2,199,'tesst',NULL,'1716870511840',NULL,NULL),(250,10,1,NULL,'Aduu test comment?',NULL,'1716870570769',NULL,NULL),(251,25,2,199,'tests. ? ',NULL,'1716870668696',NULL,NULL),(252,25,2,204,'test notification ? ',NULL,'1716870701181',NULL,NULL),(253,25,2,250,'test  notification ? ',NULL,'1716871110461',NULL,NULL),(254,25,2,250,'123',NULL,'1716871191777',NULL,NULL),(255,21,2,250,'tesst',NULL,'1716871280014',NULL,NULL),(256,21,2,250,'test notification ?  ',NULL,'1716871343854',NULL,NULL),(257,21,2,250,'new tesst casse ?',NULL,'1716871384911',NULL,NULL),(258,19,2,250,'oát band ?',NULL,'1716871444261',NULL,NULL),(259,19,2,250,'tessttt ?',NULL,'1716871488240',NULL,NULL),(260,19,2,250,'123',NULL,'1716871497890',NULL,NULL),(261,19,2,250,'test token ? ',NULL,'1716871568016',NULL,NULL),(262,19,2,250,'aduu MU ra khoi hang ? ',NULL,'1716871620608',NULL,NULL),(263,19,2,250,'Mu song lai roi',NULL,'1716871659468',NULL,NULL),(264,19,2,250,'notification now ? ',NULL,'1716871714627',NULL,NULL),(265,19,2,250,'Hello tuấn cuồi ? ',NULL,'1716872192012',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PostImage`
--

LOCK TABLES `PostImage` WRITE;
/*!40000 ALTER TABLE `PostImage` DISABLE KEYS */;
INSERT INTO `PostImage` VALUES (24,'http://camenryder.xyz/public/img/1715525199648_Dragon-Ball-game4v-1648740274-76.jpg',30,NULL),(25,'http://camenryder.xyz/public/img/1715525250722_ea85b7af823d7c98be67119ddf05d656.jpg',31,NULL),(26,'http://camenryder.xyz/public/img/1715525321610_ea85b7af823d7c98be67119ddf05d656.jpg',32,NULL),(27,'http://camenryder.xyz/public/img/1715532450401_FB_IMG_1715168497565.jpg',34,NULL),(28,'http://camenryder.xyz/public/img/1715595386545_1085381.jpg',35,NULL),(29,'http://camenryder.xyz/public/img/1715595409778_1085381.jpg',36,NULL),(30,'http://camenryder.xyz/public/img/1715595436765_1085381.jpg',37,NULL),(31,'http://camenryder.xyz/public/img/1715595467109_1085381.jpg',38,NULL),(32,'http://camenryder.xyz/public/img/1715595513922_1085381.jpg',39,NULL),(33,'http://camenryder.xyz/public/img/1715595662493_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',40,NULL),(34,'http://camenryder.xyz/public/img/1715595680464_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',41,NULL),(35,'http://camenryder.xyz/public/img/1715595748985_Screenshot 2024-01-23 201005.png',42,NULL),(36,'http://camenryder.xyz/public/img/1715595799483_Screenshot 2024-02-28 124515.png',43,NULL),(37,'http://camenryder.xyz/public/img/1715595843324_Screenshot 2024-05-04 204240.png',44,NULL),(38,'http://camenryder.xyz/public/img/1715595904360_Screenshot 2024-01-23 185834.png',45,NULL),(39,'http://camenryder.xyz/public/img/1715595929637_Screenshot 2024-05-13 172454.png',46,NULL),(40,'http://camenryder.xyz/public/img/1715596007334_Screenshot 2024-04-20 195305.png',47,NULL),(41,'http://camenryder.xyz/public/img/1715596094124_Screenshot 2024-03-14 202939.png',NULL,NULL),(42,'http://camenryder.xyz/public/img/1715596197095_Screenshot 2024-02-23 155102.png',49,NULL),(43,'http://camenryder.xyz/public/img/1715596354121_Screenshot 2024-05-13 173147.png',50,NULL),(47,'http://camenryder.xyz/public/img/1715856804701_images.jpeg',52,NULL),(48,'http://camenryder.xyz/public/img/1715856833875_images.jpeg',51,NULL),(49,'http://camenryder.xyz/public/img/1715964584339_b8d935b636429e1cc753.jpg',53,NULL),(50,'http://camenryder.xyz/public/img/1715967139351_bdba984fc3bb6be532aa.jpg',54,NULL),(51,'http://camenryder.xyz/public/img/1715994575234_55ff0113fda1ebef91463c22bffd4ba4.jpg',56,NULL),(52,'http://camenryder.xyz/public/img/1716002044153_anh-3d-songoku_044039312.jpg',65,NULL),(53,'http://camenryder.xyz/public/img/1716002045440_anh-3d-songoku_044039312.jpg',66,NULL),(54,'http://camenryder.xyz/public/img/1716002046068_anh-3d-songoku_044039312.jpg',67,NULL),(55,'http://camenryder.xyz/public/img/1716002045841_anh-3d-songoku_044039312.jpg',68,NULL),(56,'http://camenryder.xyz/public/img/1716002045870_anh-3d-songoku_044039312.jpg',69,NULL),(57,'http://camenryder.xyz/public/img/1716002083905_images.jpeg',70,NULL),(58,'http://camenryder.xyz/public/img/1716002624740_b8d935b636429e1cc753.jpg',71,NULL),(59,'http://camenryder.xyz/public/img/1716005261120_Screenshot 2024-02-29 132311.png',73,NULL),(60,'http://camenryder.xyz/public/img/1716005305108_Screenshot 2024-03-02 194834.png',74,NULL),(61,'http://camenryder.xyz/public/img/1716005583597_BB1myWKI.jpg',NULL,NULL),(62,'http://camenryder.xyz/public/img/1716005666758_BB1mBaol.jpg',76,NULL),(63,'http://camenryder.xyz/public/img/1716007190302_Screenshot 2024-02-21 161204.png',77,NULL),(64,'http://camenryder.xyz/public/img/1716023906527_Screenshot 2024-02-22 124856.png',78,NULL),(65,'http://camenryder.xyz/public/img/1716023929935_Screenshot 2024-02-21 123321.png',79,NULL),(66,'http://camenryder.xyz/public/img/1716034436658_statepng.png',NULL,NULL),(67,'http://camenryder.xyz/public/img/1716054013563_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',89,NULL),(68,'http://camenryder.xyz/public/img/1716060091921_Screenshot 2024-03-24 202214.png',NULL,NULL),(69,'http://camenryder.xyz/public/img/1716060249055_Screenshot 2024-01-23 185834.png',91,NULL),(70,'http://camenryder.xyz/public/img/1716081698951_55ff0113fda1ebef91463c22bffd4ba4.jpg',93,NULL),(71,'http://camenryder.xyz/public/img/1716081698968_avatar_default.png',93,NULL),(72,'http://camenryder.xyz/public/img/1716081698953_anh-3d-songoku_044039312.jpg',93,NULL),(73,'http://camenryder.xyz/public/img/1716082228372_Screenshot 2024-01-23 185834.png',95,NULL),(74,'http://camenryder.xyz/public/img/1716083043147_Screenshot 2024-01-23 185834.png',97,NULL),(75,'http://camenryder.xyz/public/img/1716083333879_Screenshot 2024-02-18 124206.png',98,NULL),(76,'http://camenryder.xyz/public/img/1716084332108_Screenshot 2024-01-23 185834.png',99,NULL),(77,'http://camenryder.xyz/public/img/1716084392088_Screenshot 2024-01-23 185834.png',100,NULL),(78,'http://camenryder.xyz/public/img/1716084792752_Screenshot 2024-01-23 185834.png',NULL,NULL),(79,'http://camenryder.xyz/public/img/1716084837282_1085381.jpg',NULL,NULL),(80,'http://camenryder.xyz/public/img/1716084837282_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',NULL,NULL),(81,'http://camenryder.xyz/public/img/1716085063396_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',NULL,NULL),(82,'http://camenryder.xyz/public/img/1716085388034_Screenshot 2024-01-23 185834.png',NULL,NULL),(83,'http://camenryder.xyz/public/img/1716085425922_Screenshot 2024-01-23 185834.png',NULL,NULL),(84,'http://camenryder.xyz/public/img/1716085505629_Screenshot 2024-01-23 185834.png',108,NULL),(85,'http://camenryder.xyz/public/img/1716104655241_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',110,NULL),(86,'http://camenryder.xyz/public/img/1716104813555_anh-3d-songoku_044039312.jpg',111,NULL),(87,'http://camenryder.xyz/public/img/1716104813579_avatar_default.png',111,NULL),(88,'http://camenryder.xyz/public/img/1716104813550_55ff0113fda1ebef91463c22bffd4ba4.jpg',111,NULL),(94,'http://camenryder.xyz/public/img/1716105773948_55ff0113fda1ebef91463c22bffd4ba4.jpg',120,NULL),(95,'http://camenryder.xyz/public/img/1716105773954_anh-3d-songoku_044039312.jpg',120,NULL),(96,'http://camenryder.xyz/public/img/1716105773977_avatar_default.png',120,NULL),(99,'http://camenryder.xyz/public/img/1716108997143_55ff0113fda1ebef91463c22bffd4ba4.jpg',122,NULL),(100,'http://camenryder.xyz/public/img/1716108997146_anh-3d-songoku_044039312.jpg',122,NULL),(101,'http://camenryder.xyz/public/img/1716108997161_avatar_default.png',122,NULL),(106,'http://camenryder.xyz/public/img/1716109187849_anh-3d-songoku_044039312.jpg',NULL,NULL),(107,'http://camenryder.xyz/public/img/1716109187871_avatar_default.png',NULL,NULL),(108,'http://camenryder.xyz/public/img/1716109279925_astronaut-nasa-flower-garden-butterflies-surreal-moon-3840x2160-3197.jpg',124,NULL),(109,'http://camenryder.xyz/public/img/1716109279999_space-suit-dream-3840x2160-9642.jpg',124,NULL),(110,'http://camenryder.xyz/public/img/1716109288470_astronaut-nasa-flower-garden-butterflies-surreal-moon-3840x2160-3197.jpg',125,NULL),(115,'http://camenryder.xyz/public/img/1716109483649_icon_check_map.png',NULL,NULL),(116,'http://camenryder.xyz/public/img/1716109483736_images.jpeg',NULL,NULL),(117,'http://camenryder.xyz/public/img/1716109483741_logo_web_app.png',NULL,NULL),(119,'http://camenryder.xyz/public/img/1716116748927__123433724_zelensky_tvaddress.png',NULL,NULL),(120,'http://camenryder.xyz/public/img/1716116765760__123433724_zelensky_tvaddress.png',NULL,NULL),(121,'http://camenryder.xyz/public/img/1716116794593__123433724_zelensky_tvaddress.png',NULL,NULL),(122,'http://camenryder.xyz/public/img/1716116802558_55ff0113fda1ebef91463c22bffd4ba4.jpg',NULL,NULL),(123,'http://camenryder.xyz/public/img/1716116802559_anh-3d-songoku_044039312.jpg',NULL,NULL),(124,'http://camenryder.xyz/public/img/1716116802524__123433724_zelensky_tvaddress.png',NULL,NULL),(129,'http://camenryder.xyz/public/img/1716126501028_quanlythuexe_test.zip',136,NULL),(130,'http://camenryder.xyz/public/img/1716130685702_1085381.jpg',134,NULL),(131,'http://camenryder.xyz/public/img/1716130685590_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',134,NULL),(143,'http://camenryder.xyz/public/img/1716132744012_BB1mBaol.jpg',135,NULL),(144,'http://camenryder.xyz/public/img/1716180633345_putin.jpg',140,NULL),(145,'http://camenryder.xyz/public/img/1716185203643_ea85b7af823d7c98be67119ddf05d656.jpg',141,NULL),(146,'http://camenryder.xyz/public/img/1716186627857_57ed92aec85a6004394b.jpg',143,NULL),(147,'http://camenryder.xyz/public/img/1716187061792_vi-vn-lenovo-ideapad-3-15itl6-i5-82h801p9vn-thumbvideo.jpg',NULL,NULL),(148,'http://camenryder.xyz/public/img/1716190363152_Dragon-Ball-game4v-1648740274-76.jpg',145,NULL),(149,'http://camenryder.xyz/public/img/1716194463356_create logo ava 534024ac-b175-4c7c-865a-8c8c0834dd5e.png',156,NULL),(152,'http://camenryder.xyz/public/img/1716201679859_anh-3d-songoku_044039312.jpg',172,NULL),(153,'http://camenryder.xyz/public/img/1716212765494_55ff0113fda1ebef91463c22bffd4ba4.jpg',NULL,NULL),(154,'http://camenryder.xyz/public/img/1716213312925_Dragon-Ball-game4v-1648740274-76.jpg',NULL,NULL),(155,'http://camenryder.xyz/public/img/1716297209828_Screenshot 2024-02-23 155102.png',NULL,NULL),(156,'http://camenryder.xyz/public/img/1716297954584__123433724_zelensky_tvaddress.png',183,NULL),(157,'http://camenryder.xyz/public/img/1716305587971_Screenshot 2024-01-23 201005.png',184,NULL),(158,'http://camenryder.xyz/public/img/1716305587972_Screenshot 2024-02-06 124329.png',184,NULL),(159,'http://camenryder.xyz/public/img/1716312712935_Screenshot 2024-02-20 095718.png',158,NULL),(160,'http://camenryder.xyz/public/img/1716313052460_Screenshot 2024-03-14 202939.png',199,NULL),(161,'http://camenryder.xyz/public/img/1716315192421_Screenshot 2024-04-15 062318.png',203,NULL),(162,'http://camenryder.xyz/public/img/1716337281460_Dinh-nghia-ve-Like.png',204,NULL),(163,'http://camenryder.xyz/public/img/1716352438387_images.jpeg',NULL,NULL),(164,'http://camenryder.xyz/public/img/1716360824978_maxresdefault.jpg',209,NULL),(165,'http://camenryder.xyz/public/img/1716361295848_abc_123.jpeg',211,NULL),(166,'http://camenryder.xyz/public/img/1716381577073_images.png',213,NULL),(167,'http://camenryder.xyz/public/img/1716389410085_arsenal2.jpg',NULL,NULL),(168,'http://camenryder.xyz/public/img/1716393135741_arsenal2.jpg',215,NULL),(169,'http://camenryder.xyz/public/img/1716393430940_BB1myWKI.jpg',216,NULL),(170,'http://camenryder.xyz/public/img/1716393783936_arsenal2.jpg',217,NULL),(171,'http://camenryder.xyz/public/img/1716394214305_winter.jpg',NULL,NULL),(172,'http://camenryder.xyz/public/img/1716431797128_skynews-manchester-city_6560183.jpg',NULL,NULL),(173,'http://camenryder.xyz/public/img/1716453234019_abc_123.jpeg',225,NULL),(174,'http://camenryder.xyz/public/img/1716453266255_55ff0113fda1ebef91463c22bffd4ba4.jpg',226,NULL),(175,'http://camenryder.xyz/public/img/1716478529716_anh-3d-songoku_044039312.jpg',233,NULL),(177,'http://camenryder.xyz/public/img/1716635970417_40839-Studio_Ghibli-Howls_Moving_Castle.jpg',238,NULL),(178,'http://camenryder.xyz/public/img/1716711586541_skynews-manchester-city_6560183.jpg',243,NULL),(179,'http://camenryder.xyz/public/img/1716868923512_Dragon-Ball-game4v-1648740274-76.jpg',245,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReactPost`
--

LOCK TABLES `ReactPost` WRITE;
/*!40000 ALTER TABLE `ReactPost` DISABLE KEYS */;
INSERT INTO `ReactPost` VALUES (5,44,15,1),(6,44,16,1),(7,46,23,1),(8,46,28,1),(9,46,22,1),(10,46,16,1),(11,46,10,2),(12,120,10,1),(13,120,11,1),(14,120,21,1),(15,125,21,1),(16,125,23,1),(17,125,13,1),(18,125,12,1),(19,135,10,2),(20,135,26,1),(25,140,25,1),(26,158,10,1),(27,158,19,1),(47,143,19,1),(48,142,19,1),(49,140,19,1),(50,135,19,1),(51,125,19,1),(53,NULL,21,1),(55,134,19,1),(57,142,10,1),(58,143,10,1),(59,158,36,1),(61,140,10,1),(62,143,25,1),(63,134,25,1),(64,134,13,1),(66,NULL,25,1),(67,NULL,10,1),(72,142,21,1),(73,143,21,1),(75,NULL,25,1),(77,142,33,1),(78,183,10,1),(79,186,24,1),(80,188,24,1),(82,187,33,1),(83,187,25,1),(126,204,10,1),(128,NULL,25,1),(129,204,25,1),(130,200,25,1),(131,188,25,1),(132,135,25,1),(133,209,19,1),(134,209,13,1),(135,204,21,1),(136,209,25,1),(137,186,21,1),(138,215,25,1),(139,217,25,1),(140,215,19,1),(141,213,19,1),(142,NULL,34,1),(143,226,25,1),(144,225,25,1),(145,216,25,1),(146,233,21,1),(147,226,21,1),(148,225,21,1),(150,233,25,1),(151,238,37,1),(153,240,37,1),(154,238,25,1),(155,234,21,1),(156,243,34,1),(157,245,25,1),(158,250,25,1),(159,250,19,1);
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
  CONSTRAINT `Report_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Report_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Report_ibfk_3` FOREIGN KEY (`issue_id`) REFERENCES `Issues` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `phone` varchar(400) DEFAULT NULL,
  `mode_level_id` int(11) DEFAULT NULL,
  `url_background_profile` varchar(400) DEFAULT 'http://camenryder.xyz/public/img/background_profile_default.jpg',
  `date_create_account` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  KEY `mode_level_id` (`mode_level_id`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `User_ibfk_2` FOREIGN KEY (`mode_level_id`) REFERENCES `Moderator_level` (`mode_level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'user_01@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$NsikJqgkxozGhrChqv8H3A$A4hvoSFLIdQ+IqCoTTE12H8e/0BrzUchP2FtrADPloY','user01',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(2,'user_02@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$NsikJqgkxozGhrChqv8H3A$A4hvoSFLIdQ+IqCoTTE12H8e/0BrzUchP2FtrADPloY','Adam',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(3,'user_03@gmail.com','user_03','User_03',1,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(4,'user_04@gmail.com','user_04','User_04',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(5,'user_05@gmail.com','abc@123','user_05',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(6,'user_03@gmail.com','user_03','User_03',0,'Việt Nam','Việt Nam','https://avatar.iran.liara.run/public/boy?username=Ash',3,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(10,'user010@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$NsikJqgkxozGhrChqv8H3A$A4hvoSFLIdQ+IqCoTTE12H8e/0BrzUchP2FtrADPloY','Hiếu',1,'Vietnam','','http://camenryder.xyz/public/img/1716739768102_BB1myWKI.jpg',NULL,NULL,NULL,'http://camenryder.xyz/public/img/1716739823982_BB1mBaol.jpg',NULL),(11,'user011@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$mhoGPN29CZwFKoLeDi4TxA$gjR5qH7mIe9XiAcZ5rPYh20PSh7CCA4abCEUL1oBfDg','Ryder',0,NULL,NULL,'https://avatar.iran.liara.run/public/boy?username=Ash',NULL,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(12,'minh@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$ssEnyOKSN6bbkLb/xiRfRQ$740Hm0YVp8/XkvaRPLNYx2uDVdpq9yr95aG57Gb1FfM','Minh',1,'','','https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(13,'user014@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$IzRDRPbj/Z70UmV+vA5iJA$XOAUAQufncXUNHLBNmwva3p1f5o57qaA7dfowyV509o','Ryder',0,NULL,NULL,'https://avatar.iran.liara.run/public/boy?username=Ash',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(14,'user015@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$e1/R3jBCBwyypqtUjv/Saw$JwNa2gsxXi6F66Pr31jRfxe1DGOAm9kDKyLVcKu0FIU','Ryder',0,NULL,NULL,'http://camenryder.xyz/public/img/1715503939612_83c8e2b247ef098179c3caaf8086c490.jpg',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(15,'user020@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$R+yHUL+7axsFRX/yKTSALw$SA48PpvkaQGv7EHfT56k6/EZg0cP99n7u1LNR0313uM','Ryder',0,NULL,NULL,'http://camenryder.xyz/public/img/1715505104648_83c8e2b247ef098179c3caaf8086c490.jpg',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(16,'user030@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$WqF78yqcXoXvpAxxkbis4g$7IPGa/VfmGQVfBWCyO9GLkTlkQT5bWbsKEUY/07C8TU','bacthayflick',0,NULL,NULL,'http://camenryder.xyz/public/img/1715521769742_Screenshot_20240512-102842~2.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(17,'leminh@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$F1ycYKEB/ypropQ4gJJ6XQ$KS/ls4dAuWcReNki/OpBpbHdWJfr/zjJ0AUp4QZBjGc','Mine',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(18,'user1@example.com','$argon2id$v=19$m=65536,t=3,p=4$i7Nhom8FxMtm2EpADCApyQ$/UAYUwJjTMYfanTZjNjGpoFWi/EA/DvLQNKAHpzLClk','John Smith',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(19,'avawhite@example.com','$argon2id$v=19$m=65536,t=3,p=4$hDqVZ7sxg5HQAeGQklOQ3A$hNoCRkRhf549mEEkd+YG/TaSM+HeMjqn2gu2UK5TkBk','Ava White',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(20,'alexanderthomas@example.com','$argon2id$v=19$m=65536,t=3,p=4$eT2AEF2XqR0GHI6LZPwkLA$UcwWEfgQSSxymbCm7XHVg5RGQ1QBJw05HQ5Ni3tba00','Alexander Thomas',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(21,'oliviaanderson@example.com','$argon2id$v=19$m=65536,t=3,p=4$tp4w6iK+q51ZbPxGPYQhog$RZGha9uNfVgny2bso3lFWTvhuKfZ7dWInJfojTzxIhU','Olivia Anderson',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(22,'jamesmartinez@example.com','$argon2id$v=19$m=65536,t=3,p=4$Ms4cfi7cItqjgsEhxjGMOA$12k6v5xFNvLOwF8CGY6oqu0Axnb0YiAD4evs3HWbCfw','James Martinez',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(23,'sophiataylor@example.com','$argon2id$v=19$m=65536,t=3,p=4$mMK3PvqE7WguScLVsXLRyg$pK4eaIClR+Qa676VUSN6wPZptpWs/MCB9gAYIYFLWM0','Sophia Taylor',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(24,'williamwilson@example.com','$argon2id$v=19$m=65536,t=3,p=4$pnen+xhvl7XqQWi7t10dwA$fL8LaIllDQ9hzcO/9pTd+BKzic7AnG4KsbXsjOHP3E8','William Wilson',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(25,'emmadavis@example.com','$argon2id$v=19$m=65536,t=3,p=4$q5OO0x9gmSnz8I3uQaMKZA$/8RnLY5YG0eLvSMf7TmB+cE89pPtaT6eZWqMjoU/Ev0','Emma Davis',0,NULL,NULL,'http://camenryder.xyz/public/img/1716359944053_55ff0113fda1ebef91463c22bffd4ba4.jpg',1,NULL,NULL,'http://camenryder.xyz/public/img/1716359769786_Dragon-Ball-game4v-1648740274-76.jpg',NULL),(26,'michaelbrown@example.com','$argon2id$v=19$m=65536,t=3,p=4$X8eYSKaXhu9JejgLDBbhgw$SVEoHC0zkUihOArHtAEkD4C47dqsHFbqUEjyQ0v8+lc','Michael Brown',0,NULL,NULL,'http://camenryder.xyz/public/img/1715999904247_Dragon-Ball-game4v-1648740274-76.jpg',1,NULL,NULL,'http://camenryder.xyz/public/img/1716000004797_Dragon-Ball-game4v-1648740274-76.jpg',NULL),(27,'emilyjohnson@example.com','$argon2id$v=19$m=65536,t=3,p=4$TX/CNE0ntfj/5wpUiPHZ3Q$+bLqtIanePcu6vWQ5avqlwQbNw0GHTsaWDbnfbLd4JA','Emily Johnson',0,NULL,NULL,'http://camenryder.xyz/public/img/1716360519898_55ff0113fda1ebef91463c22bffd4ba4.jpg',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(28,'johnsmith@example.com','$argon2id$v=19$m=65536,t=3,p=4$Z6rB5Uzg14c8ka5QFb7cag$tIp3zha7j9zNPSVhGhq3IbH1n6BM95FJeM0XPFd1z3Y','John Smith',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(29,'locvo@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$8l4rtRGIAydjts57cvyayA$lgSOCWef1ZqrsiSqo267/FfkyAUFX4MaPnNkel11ky0','Ryder',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(30,'user018@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$M+HAhtNnP9sTYGhDoYDleQ$S8HKauwtquWnCGt0VRNowNs99AVW9k+LM2l752iBJKU','Ryder',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(31,'minhday0@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$+TZS1wuXIzprfl2a430Bdw$h80bpa4SKhYUXUuiYpTSHzD+4DLQKFaNWnokVgbjRkw','minhday',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(32,'minhday@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$R2bODuGfS6quchK5bR8emQ$17KeWhStzzEpmh35IttZZ7bMIyF7FxFO7kZeGtrsDTA','minhday',1,'Vietnam','Vie','http://camenryder.xyz/public/img/1716694719662_arsenal2.jpg',1,NULL,NULL,'http://camenryder.xyz/public/img/1716694718562_winter.jpg',NULL),(33,'embe@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$UmQzSbRyNBltDOxBPRXeSA$MIHX6inTvINvJYJv1mz5OeWsvaiJrwCejyYGGiYuZII','embeday',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(34,'a@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$ipv5Bp9MYiV5BTx7bpN0Nw$QxYdEf5dckTXPa9F0yxHJUXfx+u9ViFolVqD2Wfv2kU','Nguyễn Văn A',1,'Vietnam','','http://camenryder.xyz/public/img/1716711924356_mancity.jpg',1,NULL,NULL,'http://camenryder.xyz/public/img/1716711915665_skynews-manchester-city_6560183.jpg',NULL),(35,'b@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$9K9CPJ1Jdyo7QPKUFIqsqg$l82PWlAM+wAa9LKcn4qhLifbo+QEAlho8kBEFxMpSRA','Anh B',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(36,'khanh@123.com','$argon2id$v=19$m=65536,t=3,p=4$dive3WI2CW+3FyRN9q+97w$Ny5Io772EliiW1kLo4+6Gib9nRQ4IKH2tmL2+cVntXg','khanhT',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg',NULL),(37,'user101@gmai.com','$argon2id$v=19$m=65536,t=3,p=4$xhevLPVp8sUkfri46472EA$sq53sZU1cG9EZruxo27503TsGj8wMwVNWlT7n9jNVos','Minh Hiếu',0,'Việt Nam','Tiếng hơi ngọng nhma miền Nam ','http://camenryder.xyz/public/img/1716554944778_vuhuthuoc.jpg',1,NULL,NULL,'http://camenryder.xyz/public/img/1716554500745_1706_hinh-nen-phi-hanh-gia61.jpg',NULL),(38,'user017@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$zxK4XF/Atc+cusohBCIprA$v1ZMNv/KjjOj4YwFF5V7kCHN5dyCBPyWiQ4Kqr9kpfE','MihHius',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','5/25/2024, 23:53:29'),(39,'aha@123.com','$argon2id$v=19$m=65536,t=3,p=4$0OuFjPAmZo0+e+Qo3mCd8Q$4hzcN/uhnfSwUEWns/a2pS96Lbi6OGZwItDwopi08Pg','FunnyGuy',0,NULL,NULL,'http://camenryder.xyz/public/img/avatar_default.png',1,NULL,NULL,'http://camenryder.xyz/public/img/background_profile_default.jpg','5/28/2024, 20:46:15');
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

-- Dump completed on 2024-05-28 22:33:18
