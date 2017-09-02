-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: symfony.dev    Database: rex_software_test
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'movie_name_1','movie_description_1',NULL,10.00);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_access_tokens`
--

DROP TABLE IF EXISTS `oauth2_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_access_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D247A21B5F37A13B` (`token`),
  KEY `IDX_D247A21B19EB6921` (`client_id`),
  KEY `IDX_D247A21BA76ED395` (`user_id`),
  CONSTRAINT `FK_D247A21B19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`),
  CONSTRAINT `FK_D247A21BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_access_tokens`
--

LOCK TABLES `oauth2_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth2_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth2_access_tokens` VALUES (1,1,1,'ZDkzMDcyYmNjMGE0YTgwMDMwMmU5ZmUzYmIwMjQ2ZDMyYTA2YjFmNTZlOWYxYjQyNzM5M2ZmZjE4Y2NkN2MwYQ',1503842572,NULL),(2,1,1,'MDg1ZGVhZGFjZTk1NzgwN2I1ZDc3ODA0NGE0YTlhYmQxZmU0NjEwZDQ5MzUwYjc2MGUzNGQwZDQ2MjUzNGExNg',1503842617,NULL),(3,1,1,'YjU4YmRjN2U0MTc1N2MyOTdhYWY2ODM3M2VkMWI5ZmFiNjQ0YTE1ODgyZTUyODI0YmU2NzU0Y2RiN2QyMDg1MA',1503843123,NULL),(4,1,1,'NTczMzE2Y2U1MmE3ZGRlNTY2YzdiYjhlOWNiZjllODM2NjRhYzVkNDczZDA2NmRlM2FlNTMyMGZmMGU2OGRhMg',1503843282,NULL),(5,1,1,'MmI3MmZjOWUxMDVmYjRhYzU3MTlmNTdjNjk3Y2I2YmNkYWQxY2EyYTQwZThlNmMxZmY5NTRiYzUxZDU0MTM1Mw',1503843336,NULL),(6,1,1,'M2JkZTFjYTYzZDcwNzhhMzkzMGQ3MjBkYWYxMGNiNzlhY2M3OWY0MmQ3NzVmZjY4YWYwNDZlNGNjMWEzYWUwMw',1503843699,NULL),(7,1,1,'YTRmNjAzY2ZkNjc0N2EyYjE0ZjIzYzU0MjZlMmZmODVhZTNiOGZkMDM4YmNhM2JkZDA2NGFiNWU3MmUyNGQzZA',1503845928,NULL),(8,1,1,'YjVmNTI1OTEyZmQzNzkxODg2MGM5MDhkOWIxODQ4Njc1MTdkMjVmZWY3MmFiYjljNjNjOGY0YzdkNjRmMzc2OA',1504337520,NULL);
/*!40000 ALTER TABLE `oauth2_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_auth_codes`
--

DROP TABLE IF EXISTS `oauth2_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_auth_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A018A10D5F37A13B` (`token`),
  KEY `IDX_A018A10D19EB6921` (`client_id`),
  KEY `IDX_A018A10DA76ED395` (`user_id`),
  CONSTRAINT `FK_A018A10D19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`),
  CONSTRAINT `FK_A018A10DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_auth_codes`
--

LOCK TABLES `oauth2_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth2_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_clients`
--

DROP TABLE IF EXISTS `oauth2_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `random_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `allowed_grant_types` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_clients`
--

LOCK TABLES `oauth2_clients` WRITE;
/*!40000 ALTER TABLE `oauth2_clients` DISABLE KEYS */;
INSERT INTO `oauth2_clients` VALUES (1,'3bcbxd9e24g0gk4swg0kwgcwg4o8k8g4g888kwc44gcc0gwwk4','a:0:{}','4ok2x70rlfokc8g0wws8c8kwcokw80k44sg48goc0ok4w0so0k','a:1:{i:0;s:8:\"password\";}');
/*!40000 ALTER TABLE `oauth2_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth2_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_refresh_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D394478C5F37A13B` (`token`),
  KEY `IDX_D394478C19EB6921` (`client_id`),
  KEY `IDX_D394478CA76ED395` (`user_id`),
  CONSTRAINT `FK_D394478C19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`),
  CONSTRAINT `FK_D394478CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_refresh_tokens`
--

LOCK TABLES `oauth2_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth2_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth2_refresh_tokens` VALUES (1,1,1,'Y2Q4YzNlZGUzMmEzMjYyYWFhNjBiZWJkZTkxMTAyYWZmNjgwMjI5NzIwMjNlZDhjNmMwZjFiODhlNTk1Y2Y5YQ',1505048572,NULL),(2,1,1,'ZTUyODUwYzM4NDIwZjFjODczMTNhY2Q1NjdmNTI0MTk2MjQ0OGRkOTg2YmIyMTlhOTFlYTNiMzIzOTQ1NTYyMg',1505048617,NULL),(3,1,1,'NTE5MzhjMmUzNmE2MjNjNTE4NjVmNzUwMjZiMGFkODdkMGI0NDY1Yzk0NGM4ZjFjMmE4NWM3ZTYyOGNhOTVlMA',1505049123,NULL),(4,1,1,'NDkwYzMwMTNkMjhiYjVjMDgxMGRmOTg2NmM4OGM5YTBiOWY3YjJmMDE2ZjAxZDI5ZGU4OThiNmE5YjNmOTQyNQ',1505049282,NULL),(5,1,1,'NGQ0YzQ0MDIxNjM2MDFmODExNDIzZDQ4MGRhNzg4NGU3ZTExMDNjMjg1NzFiYjhhODhlZDA3N2RkYjc5ZDZkNQ',1505049336,NULL),(6,1,1,'YjkyZTE5MTk4MzE2MWUzMjkxODk0ODY1ZDc1OWVlM2IzYmIwZmIyODlhODZhMDAxMWNjODJjYzljY2I5M2M1Mg',1505049699,NULL),(7,1,1,'MDU2YjhhZWYxMGQwNjBhZjEyMjE4ZmM2MTQ2MGZhYmZkMjdlODgyYzI0NWU2NDQ0NWRlN2RmY2VjODMyYzYxNA',1505051928,NULL),(8,1,1,'NTI3YmI3MmRkMTU0ZmU1MWE2OTIxZjk4NWNjYWU5MTNmMTg1NjZkYzkzYmY4YjFiYmJlOGZmMDk0YzUxOTE1OA',1505543520,NULL);
/*!40000 ALTER TABLE `oauth2_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','joeycumines@gmail.com','joeycumines@gmail.com',1,'QRkfZ9gRTKtvT1PqtGAHDKONuITkJOAc2DtYDCUuKoc','YxHIwAbKlCn/O/v00uVX1EhfUDkGMwMBplkM7vAkd2EwX7p5yE/X+q9WsW+VEY1i7lziJ29H4FRJX6yxC4wUQA==',NULL,NULL,NULL,'a:0:{}');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-02 19:39:33
