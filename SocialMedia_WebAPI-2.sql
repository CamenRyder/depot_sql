-- Adminer 4.8.1 MySQL 8.3.0 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `Dish`;
CREATE TABLE `Dish` (
  `dish_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int DEFAULT NULL,
  `name` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `url_image` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`dish_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `Dish_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `Follower`;
CREATE TABLE `Follower` (
  `follow_id` int NOT NULL AUTO_INCREMENT,
  `user_follow_er_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`follow_id`),
  KEY `user_id` (`user_id`),
  KEY `user_follow_er_id` (`user_follow_er_id`),
  CONSTRAINT `Follower_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Follower_ibfk_5` FOREIGN KEY (`user_follow_er_id`) REFERENCES `User` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `Follower` (`follow_id`, `user_follow_er_id`, `user_id`) VALUES
(1,	1,	2);

DROP TABLE IF EXISTS `Invoice`;
CREATE TABLE `Invoice` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `create_date` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Invoice_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `InvoiceDetail`;
CREATE TABLE `InvoiceDetail` (
  `invoice_detail_id` int NOT NULL AUTO_INCREMENT,
  `dish_id` int DEFAULT NULL,
  `invoice_id` int DEFAULT NULL,
  `buy_price` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`invoice_detail_id`),
  KEY `dish_id` (`dish_id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `InvoiceDetail_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `Dish` (`dish_id`),
  CONSTRAINT `InvoiceDetail_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `Invoice` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `Issues`;
CREATE TABLE `Issues` (
  `issue_id` int NOT NULL AUTO_INCREMENT,
  `issue_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `Notification`;
CREATE TABLE `Notification` (
  `noti_id` int NOT NULL AUTO_INCREMENT,
  `date` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_seen` int DEFAULT '0',
  `user_id` int NOT NULL,
  PRIMARY KEY (`noti_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `Post`;
CREATE TABLE `Post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `post_type_id` int DEFAULT NULL,
  `post_top_id` int DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `rating` double DEFAULT NULL,
  `date_create_post` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `diner_address` varchar(280) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `diner_name` varchar(280) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `post_type_id` (`post_type_id`),
  CONSTRAINT `Post_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `Post_ibfk_7` FOREIGN KEY (`post_type_id`) REFERENCES `PostType` (`post_type_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `Post` (`post_id`, `user_id`, `post_type_id`, `post_top_id`, `description`, `rating`, `date_create_post`, `diner_address`, `diner_name`) VALUES
(2,	2,	1,	NULL,	'Hôm nay trời đẹp nhỉ ?',	2.3,	'6-5-2024',	NULL,	NULL),
(3,	3,	2,	2,	'Tp Ho Chi Minh À?',	NULL,	'6-5-2024',	NULL,	NULL),
(4,	2,	2,	2,	'chuẩn luôn bạn ơi',	NULL,	'6-5-2024',	NULL,	NULL),
(5,	NULL,	1,	NULL,	'var nhau phát ko bạn ?',	NULL,	'6-5-2024',	NULL,	NULL),
(6,	NULL,	1,	NULL,	'<3 bạn thích lập trình ? ',	NULL,	'6-5-2024',	NULL,	NULL);

DROP TABLE IF EXISTS `PostImage`;
CREATE TABLE `PostImage` (
  `post_image_id` int NOT NULL AUTO_INCREMENT,
  `url_image` text COLLATE utf8mb4_general_ci,
  `post_id` int DEFAULT NULL,
  `post_image_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`post_image_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `PostImage_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `PostImage` (`post_image_id`, `url_image`, `post_id`, `post_image_state`) VALUES
(1,	'https://cdn.sgtiepthi.vn/wp-content/uploads/2021/07/z.jpg',	2,	NULL);

DROP TABLE IF EXISTS `PostType`;
CREATE TABLE `PostType` (
  `post_type_id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`post_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `PostType` (`post_type_id`, `Name`) VALUES
(1,	'Post'),
(2,	'Comment');

DROP TABLE IF EXISTS `Rating`;
CREATE TABLE `Rating` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `rate` int DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `Rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  CONSTRAINT `Rating_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `ReactPost`;
CREATE TABLE `ReactPost` (
  `react_post_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `like_state` int NOT NULL,
  PRIMARY KEY (`react_post_id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ReactPost_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`) ON DELETE SET NULL,
  CONSTRAINT `ReactPost_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `ReactPost` (`react_post_id`, `post_id`, `user_id`, `like_state`) VALUES
(1,	2,	2,	1),
(2,	2,	3,	1),
(3,	2,	NULL,	1),
(4,	2,	NULL,	2);

DROP TABLE IF EXISTS `Report`;
CREATE TABLE `Report` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `issue_id` int DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  KEY `issue_id` (`issue_id`),
  CONSTRAINT `Report_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  CONSTRAINT `Report_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `Post` (`post_id`),
  CONSTRAINT `Report_ibfk_3` FOREIGN KEY (`issue_id`) REFERENCES `Issues` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `Role` (`role_id`, `name`) VALUES
(1,	'User'),
(2,	'Admin'),
(3,	'Restaurant');

DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(400) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hash_password` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fullname` varchar(400) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` int DEFAULT '0',
  `country` varchar(400) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `language` varchar(400) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url_avatar` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'https://avatar.iran.liara.run/public/boy?username=Ash',
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `Role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `User` (`user_id`, `email`, `hash_password`, `fullname`, `gender`, `country`, `language`, `url_avatar`, `role_id`) VALUES
(1,	'user_01@gmail.com',	'abc@123',	'user01',	0,	'Việt Nam',	'Việt Nam',	'https://avatar.iran.liara.run/public/boy?username=Ash',	1),
(2,	'user_02@gmail.com',	'user_02',	'Adam',	0,	'Việt Nam',	'Việt Nam',	'https://avatar.iran.liara.run/public/boy?username=Ash',	1),
(3,	'user_03@gmail.com',	'user_03',	'User_03',	1,	'Việt Nam',	'Việt Nam',	'https://avatar.iran.liara.run/public/boy?username=Ash',	1);

-- 2024-05-10 09:36:42
