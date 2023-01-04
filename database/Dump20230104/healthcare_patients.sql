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
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(256) DEFAULT NULL,
  `patient_email` varchar(256) DEFAULT NULL,
  `patient_address` varchar(512) DEFAULT NULL,
  `patient_phone_number` varchar(20) DEFAULT NULL,
  `patient_password` varchar(512) DEFAULT NULL,
  `patient_photo` varchar(512) DEFAULT NULL,
  `psychiatrist_id` int DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `psychiatrist_id` (`psychiatrist_id`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`psychiatrist_id`) REFERENCES `psychiatrists` (`psychiatrist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Raju','raju@gmail.com','GNB road, New Delhi, India','19189675489','420Suman','http://localhost:8000/static/19189675489p1.png',20),(2,'Rahim','rahim@gmail.com','GS road, Silchar, India','19189675478','420Suman','http://localhost:8000/static/19189675478p2.jpg',20),(3,'Arpan','arpan@gmail.com','Tarapur, Silchar, India','19189675478','420Suman','http://localhost:8000/static/19189675478p3.jpg',20),(4,'Supan','supan@gmail.com','Baghjan, Tinsukia, India','19189675490','420Suman','http://localhost:8000/static/19189675490p5.png',1),(5,'Ram Prakash','prakash@gmail.com','Baghjan, Tinsukia, India','19189675490','420Suman','http://localhost:8000/static/19189675490p5.png',1),(6,'Suresh Singh','suresh@gmail.com','Patna, Bihar, India','19189675490','420Suman','http://localhost:8000/static/19189675490p5.png',1),(7,'Rahul Singh','rahul@gmail.com','Kolkata, West Bangal, India','19189675490','420Suman','http://localhost:8000/static/19189675490p6.png',6),(8,'Md Arshad Ahmed','arshad@gmail.com','Kolkata, West Bangal, India','19189675490','420Suman','http://localhost:8000/static/19189675490p6.png',6),(9,'Puja Karmakar','pujak@gmail.com','Kolkata, West Bangal, India','19189675431','420Suman','http://localhost:8000/static/19189675431p6.png',6),(10,'Abishek Barman','abishek@gmail.com','Kolkata, West Bangal, India','19189675434','420Suman','http://localhost:8000/static/19189675434p6.png',11),(11,'Noboneel Debnath','noboneel@gmail.com','Kolkata, West Bangal, India','19189675434','420Suman','http://localhost:8000/static/19189675434p6.png',11),(12,'Katyani Kumari','kkumari@gmail.com','Kolkata, West Bangal, India','19189675434','420Suman','http://localhost:8000/static/19189675434p6.png',11),(13,'Riya Bansal','riya@gmail.com','Kolkata, West Bangal, India','19189675434','420Suman','http://localhost:8000/static/19189675434p6.png',11),(14,'Ritika Kisan','ritika@gmail.com','Kolkata, West Bangal, India','19189675434','420Suman','http://localhost:8000/static/19189675434p6.png',11),(15,'Ritika Kisan','ritika@gmail.com','Kolkata, West Bangal, India','19189675434','420Suman','http://localhost:8000/static/19189675434p6.png',7),(16,'Jaiprakash Gupta','jaigupta@gmail.com','Chapra, Bihar, India','19189675434','420Suman','http://localhost:8000/static/19189675434p6.png',7),(17,'Radheshyam Agarwal','ragarwal@gmail.com','Dhola, Tinsukia, India','19189675434','420Suman','http://localhost:8000/static/19189675434p6.png',7),(18,'Narandra Modi','nmodi@gmail.com','Gandhinagar, India','19189675434','420Suman','http://localhost:8000/static/19189675434p6.png',7),(19,'Rahul Gandhi','rgandhi@gmail.com','New Delhi 1, Delhi, India','19189675434','420Suman','http://localhost:8000/static/19189675434p6.png',7),(20,'Amit Sah','amitbhai@gmail.com','New Delhi 1, Delhi, India','19189675434','420Suman','http://localhost:8000/static/19189675434p3.jpg',7),(21,'Shyam Shingh','shyam@gmail.com','New Delhi 1, Delhi, India','19189675434','420Suman','http://localhost:8000/static/19189675434p3.jpg',19);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
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
