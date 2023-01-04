-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: healthcare
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
-- Table structure for table `psychiatrists`
--

DROP TABLE IF EXISTS `psychiatrists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `psychiatrists` (
  `psychiatrist_id` int NOT NULL AUTO_INCREMENT,
  `psychiatrist_name` varchar(255) DEFAULT NULL,
  `psychiatrist_email` varchar(255) NOT NULL,
  `password` varchar(512) DEFAULT NULL,
  `hospital_id` int DEFAULT NULL,
  PRIMARY KEY (`psychiatrist_id`),
  UNIQUE KEY `psychiatrist_email` (`psychiatrist_email`),
  KEY `hospital_id` (`hospital_id`),
  CONSTRAINT `psychiatrists_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psychiatrists`
--

LOCK TABLES `psychiatrists` WRITE;
/*!40000 ALTER TABLE `psychiatrists` DISABLE KEYS */;
INSERT INTO `psychiatrists` VALUES (1,'Dr. R.K Singh','rksingh@apollo.com','$2b$10$qhqdWaK0XhJyvnkZhqIkfuJJ1Ny8EVkAlLnJwVgoOqPOBBC49KlcO',1),(2,'Dr. Rohit Thakur','rohitt@apollo.com','$2b$10$4i6CZKdFYy7CPjc2GX9aFuLC0hLWKJSIMnb/0TrPCLIAJJLmxfuaq',1),(3,'Dr. Nazibul Khan','nazibul01@apollo.com','$2b$10$uWwF0EWgyj0ed2GJElnMse/58nTmmfdwSyNiX3F5H6SfAuKIC2UJK',1),(4,'Dr. John Brawn','johnb@apollo.com','$2b$10$01yr0prmPFRByOi9YTLe7.v6/9z332xjn5TSeXe/jz8yUjbRbCfYa',1),(5,'Dr. Amit Sen','amitsen@apollo.com','$2b$10$2ttui3gmpGXEs7b8zW4DP.X3WHOxZ2mP0bPUTQtvu8S5EJH1BHZPi',1),(6,'Dr. Arpita Gupto','arpita@jnmch.in','$2b$10$UHn8Hcw16wzMsnyn86KwS.0iS.dYHJwXXswVZyrL8w8QLBv32MG3u',2),(7,'Dr. Nahida Aktar','nahida@jnmch.in','$2b$10$tvGPmzCq6s/uJPB6Vat85.ns7KynYmp0aaQggIARqBjbuNCmNLynG',2),(8,'Dr. Rakesh Das','rakesh@jnmch.in','$2b$10$zeOV39puTEQUSROxrFo4kuITW.v7l0au.QBrB2grVY4R3zrH1NDPi',2),(9,'Dr. Pallavi Hazarika','pallavi@jnmch.in','$2b$10$14KH9uYIw1PzA4eome4.w.5ET1q6mBgKdwlO/MPFZL6nv0eBqwx/K',2),(10,'Dr. Manish Paul','manish@jnmch.in','$2b$10$AimyWGew6xn45Gma28KNOuub0jAmx7L4LzV8cBBKLb7SgNo26QBWG',2),(11,'Dr. Bikash Sahu','bikash@igims.in','$2b$10$9GPF2snFeZjFUJYAD9igUOXAzUL8z3tw2crYVpj4LqpFwEdbAuo.q',3),(12,'Dr. Subhajeet Dey','subhajeet@igims.in','$2b$10$jEUumlfMNJLSu71GI8IOZOWnZoR6HHpzh6fik5fwyrfGy6qjINrjW',3),(13,'Dr. Neha Deb','neha@igims.in','$2b$10$Gw0imoZYhzqZnM7YUIiH6uXIaKE2/Les7T04ieqqQAeMeIqcTR.bC',3),(14,'Dr. Ritika Saha','ritika@igims.in','$2b$10$qjgDwoq7Zzmy2s6HnHVb8Ov7jyCmwwdriaeuDmPzzzlwd98uVoFS6',3),(15,'Dr. Trishanku Sharma','trishanku@igims.in','$2b$10$XY01Ub9GK.uwZWiv3UmBYOJlvt9V1XuQd6MkcmJYHwx5e3Z0yzJ2e',3),(16,'Dr. Swati Reddy','swati@aiims.in','$2b$10$Xkd9lz4D6pMM9iBDqKblm.05sDGYX2LVCcygHO5do0Xqcal2HdscW',4),(17,'Dr. Suraj Mondal','suraj@aiims.in','$2b$10$NXT10RAXpb67Pam2pHwvyujJHzfagYRmfkb104SClSovD/hBSxk0.',4),(18,'Dr. Ankit Kumar Gupta','ankit@aiims.in','$2b$10$F05aIuTBnVHzz5doHEnEUuBFhb5z/BEMMJG2M72mv5wDYbrBphwgG',4),(19,'Dr. Diksheet Agarwal','diksheet@aiims.in','$2b$10$uxVjyGmQFvD95yBX1Wd3sOyEbtKStYAE7gXUE99ECY1YW09wDY.d6',4),(20,'Dr. Rahul Jain','rahuljain@aiims.in','$2b$10$7/jjz1i1yo5rVB3ee6VEUe5T4V3BjPxL/JJvzRCO2II5buMOsRWn.',4);
/*!40000 ALTER TABLE `psychiatrists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-04 13:04:34
