-- MySQL dump 10.16  Distrib 10.2.10-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cmsc_127_project
-- ------------------------------------------------------
-- Server version	10.2.10-MariaDB-10.2.10+maria~xenial-log

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
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `branchId` int(2) NOT NULL,
  `location` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`branchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (10,'SU Building'),(20,'Elbi Square'),(30,'Agapita St.'),(40,'Junction');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customerId` int(4) NOT NULL AUTO_INCREMENT,
  `lName` varchar(16) DEFAULT NULL,
  `fName` varchar(32) DEFAULT NULL,
  `mName` varchar(16) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `contactNum` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Baticos','Andric Quinn','Sargento','1999-04-01','09291720966');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productId` int(4) NOT NULL,
  `productName` varchar(32) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (9000,'Big Byte Hotdog',25),(9001,'Spicy Byte Hotdog',27),(9002,'Super Byte Hotdog',30);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promo`
--

DROP TABLE IF EXISTS `promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promo` (
  `promoId` int(3) NOT NULL,
  `promoStart` date DEFAULT NULL,
  `promoEnd` date DEFAULT NULL,
  `branchId` int(2) DEFAULT NULL,
  PRIMARY KEY (`promoId`),
  KEY `promo_branchid_fk` (`branchId`),
  CONSTRAINT `promo_branchid_fk` FOREIGN KEY (`branchId`) REFERENCES `branch` (`branchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo`
--

LOCK TABLES `promo` WRITE;
/*!40000 ALTER TABLE `promo` DISABLE KEYS */;
/*!40000 ALTER TABLE `promo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promo_product`
--

DROP TABLE IF EXISTS `promo_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promo_product` (
  `promoId` int(3) DEFAULT NULL,
  `productId` int(3) DEFAULT NULL,
  KEY `promoproduct_promoid_fk` (`promoId`),
  KEY `promoproduct_productid_fk` (`productId`),
  CONSTRAINT `promoproduct_productid_fk` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  CONSTRAINT `promoproduct_promoid_fk` FOREIGN KEY (`promoId`) REFERENCES `promo` (`promoId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo_product`
--

LOCK TABLES `promo_product` WRITE;
/*!40000 ALTER TABLE `promo_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `promo_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewardcard`
--

DROP TABLE IF EXISTS `rewardcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rewardcard` (
  `cardId` int(12) NOT NULL AUTO_INCREMENT,
  `totalPoints` int(3) NOT NULL,
  `totalStars` int(3) NOT NULL,
  `customerId` int(4) DEFAULT NULL,
  PRIMARY KEY (`cardId`),
  KEY `rewardcard_customerId_fk` (`customerId`),
  CONSTRAINT `rewardcard_customerId_fk` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewardcard`
--

LOCK TABLES `rewardcard` WRITE;
/*!40000 ALTER TABLE `rewardcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `rewardcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewardcard_points`
--

DROP TABLE IF EXISTS `rewardcard_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rewardcard_points` (
  `validPoints` int(3) DEFAULT NULL,
  `dateReceived` date DEFAULT NULL,
  `usedPoints` int(3) DEFAULT NULL,
  `dateUsed` date DEFAULT NULL,
  `cardId` int(12) DEFAULT NULL,
  UNIQUE KEY `rewardcard_cardId_uk` (`cardId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewardcard_points`
--

LOCK TABLES `rewardcard_points` WRITE;
/*!40000 ALTER TABLE `rewardcard_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `rewardcard_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewardcard_stars`
--

DROP TABLE IF EXISTS `rewardcard_stars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rewardcard_stars` (
  `validStars` int(3) DEFAULT NULL,
  `dateReceived` date DEFAULT NULL,
  `expirationDate` date DEFAULT NULL,
  `usedStars` int(3) DEFAULT NULL,
  `dateUsed` date DEFAULT NULL,
  `cardId` int(12) DEFAULT NULL,
  UNIQUE KEY `rewardcard_cardId_uk` (`cardId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewardcard_stars`
--

LOCK TABLES `rewardcard_stars` WRITE;
/*!40000 ALTER TABLE `rewardcard_stars` DISABLE KEYS */;
/*!40000 ALTER TABLE `rewardcard_stars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stocks` (
  `stocksId` int(3) NOT NULL,
  `stocksAvailable` int(3) DEFAULT NULL,
  `stocksSold` int(3) DEFAULT NULL,
  `productId` int(3) DEFAULT NULL,
  `branchId` int(2) DEFAULT NULL,
  PRIMARY KEY (`stocksId`),
  KEY `stocks_productid_fk` (`productId`),
  KEY `stocks_branchid_fk` (`branchId`),
  CONSTRAINT `stocks_branchid_fk` FOREIGN KEY (`branchId`) REFERENCES `branch` (`branchId`),
  CONSTRAINT `stocks_productid_fk` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `transactionId` int(4) NOT NULL AUTO_INCREMENT,
  `transac_date` datetime DEFAULT NULL,
  `total_price` int(6) DEFAULT NULL,
  `type` varchar(3) DEFAULT NULL,
  `peso_spent` int(6) DEFAULT NULL,
  `points_spent` int(3) DEFAULT NULL,
  `stars_spent` float DEFAULT NULL,
  `orderId` int(5) DEFAULT NULL,
  PRIMARY KEY (`transactionId`),
  KEY `transaction_orderid_fk` (`orderId`),
  CONSTRAINT `transaction_orderid_fk` FOREIGN KEY (`orderId`) REFERENCES `transaction_order` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_order`
--

DROP TABLE IF EXISTS `transaction_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_order` (
  `orderId` int(5) NOT NULL AUTO_INCREMENT,
  `quantity` int(2) DEFAULT NULL,
  `price` int(5) DEFAULT NULL,
  `productId` int(3) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `transactionorder_productid_fk` (`productId`),
  CONSTRAINT `transactionorder_productid_fk` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_order`
--

LOCK TABLES `transaction_order` WRITE;
/*!40000 ALTER TABLE `transaction_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_type`
--

DROP TABLE IF EXISTS `transaction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_type` (
  `code` varchar(3) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_type`
--

LOCK TABLES `transaction_type` WRITE;
/*!40000 ALTER TABLE `transaction_type` DISABLE KEYS */;
INSERT INTO `transaction_type` VALUES ('PHP','Philippine Peso'),('PTS','Points'),('PSR','Promo Stars');
/*!40000 ALTER TABLE `transaction_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-21 23:17:10
