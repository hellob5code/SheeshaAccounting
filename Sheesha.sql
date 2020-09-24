CREATE DATABASE  IF NOT EXISTS `07032019_sheesha` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `07032019_sheesha`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: 07032019_sheesha
-- ------------------------------------------------------
-- Server version	5.7.27-log

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
-- Table structure for table `account_classes`
--

DROP TABLE IF EXISTS `account_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_classes` (
  `account_class_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_class` varchar(755) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `account_type_id` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` date DEFAULT '0000-00-00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`account_class_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_classes`
--

LOCK TABLES `account_classes` WRITE;
/*!40000 ALTER TABLE `account_classes` DISABLE KEYS */;
INSERT INTO `account_classes` VALUES (1,'Current Assets','',1,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,'','\0'),(2,'Non-Current Assets','',1,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,'','\0'),(3,'Current Liabilities','',2,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,'','\0'),(4,'Long-term Liabilities','',2,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,'','\0'),(5,'Owners Equity','',3,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,'','\0'),(6,'Operating Expense','',5,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,'','\0'),(7,'Income','',4,'0000-00-00 00:00:00','0000-00-00','0000-00-00 00:00:00',0,0,0,'','\0');
/*!40000 ALTER TABLE `account_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_integration`
--

DROP TABLE IF EXISTS `account_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_integration` (
  `integration_id` int(11) NOT NULL,
  `input_tax_account_id` bigint(20) DEFAULT '0',
  `payable_account_id` bigint(20) DEFAULT '0',
  `payable_discount_account_id` bigint(20) DEFAULT '0',
  `payment_to_supplier_id` bigint(20) DEFAULT '0',
  `output_tax_account_id` bigint(20) DEFAULT '0',
  `receivable_account_id` bigint(20) DEFAULT '0',
  `receivable_discount_account_id` bigint(20) DEFAULT '0',
  `payment_from_customer_id` bigint(20) DEFAULT '0',
  `retained_earnings_id` bigint(20) DEFAULT '0',
  `petty_cash_account_id` int(11) DEFAULT '0',
  `sales_invoice_inventory` bit(1) DEFAULT NULL,
  `depreciation_expense_debit_id` bigint(20) DEFAULT '0',
  `depreciation_expense_credit_id` bigint(20) DEFAULT '0',
  `cash_invoice_debit_id` bigint(20) DEFAULT '0',
  `cash_invoice_credit_id` bigint(20) DEFAULT '0',
  `cash_invoice_inventory` bit(1) DEFAULT NULL,
  `dispatching_invoice_inventory` bit(1) DEFAULT b'0',
  PRIMARY KEY (`integration_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_integration`
--

LOCK TABLES `account_integration` WRITE;
/*!40000 ALTER TABLE `account_integration` DISABLE KEYS */;
INSERT INTO `account_integration` VALUES (1,58,16,1,1,59,5,1,1,18,3,'',7,8,1,NULL,'','\0');
/*!40000 ALTER TABLE `account_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_titles`
--

DROP TABLE IF EXISTS `account_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_titles` (
  `account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_no` varchar(75) DEFAULT '',
  `account_title` varchar(755) DEFAULT '',
  `account_class_id` int(11) DEFAULT '0',
  `parent_account_id` int(11) DEFAULT '0',
  `grand_parent_id` int(11) DEFAULT '0',
  `description` varchar(1000) DEFAULT '',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_titles`
--

LOCK TABLES `account_titles` WRITE;
/*!40000 ALTER TABLE `account_titles` DISABLE KEYS */;
INSERT INTO `account_titles` VALUES (1,'1000','Cash on Hand',1,0,1,'','2018-04-18 11:47:31','2018-08-07 00:48:16','0000-00-00 00:00:00',1,8,0,'','\0'),(2,'1020','Cash in Bank - East West',1,0,2,'','2018-04-18 11:47:48','2018-08-07 00:50:16','0000-00-00 00:00:00',1,8,0,'','\0'),(3,'1001','Petty Cash Fund',1,0,3,'','2018-04-18 11:48:04','2018-08-07 00:48:28','0000-00-00 00:00:00',1,8,0,'','\0'),(4,'1002','Revolving Fund',1,0,4,'','2018-04-18 11:48:50','2018-08-07 00:49:25','0000-00-00 00:00:00',1,8,0,'','\0'),(5,'1200','Account Receivable',1,0,5,'','2018-04-18 11:49:20','2018-08-07 00:51:31','0000-00-00 00:00:00',1,8,0,'','\0'),(6,'1230','Account Receivable OTHERS',1,0,6,'','2018-04-18 11:49:33','2018-08-07 00:55:09','0000-00-00 00:00:00',1,8,0,'','\0'),(7,'1500','Furniture and Fixture',2,0,7,'','2018-04-18 11:50:00','2018-08-07 00:56:38','0000-00-00 00:00:00',1,8,0,'','\0'),(8,'1550','Accumulative Depreciation',2,0,8,'','2018-04-18 11:50:40','2018-08-07 04:45:25','0000-00-00 00:00:00',1,8,0,'','\0'),(9,'1501','Service Vehicles',2,0,9,'','2018-04-18 11:51:11','2018-08-07 00:57:06','0000-00-00 00:00:00',1,8,0,'','\0'),(10,'1502','Kitchen Equipment',2,0,10,'','2018-04-18 11:51:29','2018-08-07 04:45:29','0000-00-00 00:00:00',1,8,0,'','\0'),(11,'1503','Computer and Electronic Equipment',2,0,11,'','2018-04-18 11:52:23','2018-08-07 00:57:32','0000-00-00 00:00:00',1,8,0,'','\0'),(12,'1504','Appliances and Other Electronic Gadgets',2,0,12,'','2018-04-18 11:52:57','2018-08-07 00:58:37','0000-00-00 00:00:00',1,8,0,'','\0'),(13,'2000','Liability',3,0,13,'','2018-04-18 11:53:13','0000-00-00 00:00:00','2018-08-07 01:01:46',1,0,8,'',''),(14,'2300','Long Term Loan',3,0,14,'','2018-04-18 11:53:34','2018-08-07 01:02:20','0000-00-00 00:00:00',1,8,0,'','\0'),(15,'2100','Short Term Loan',3,0,15,'','2018-04-18 11:54:10','2018-08-07 01:01:09','0000-00-00 00:00:00',1,8,0,'','\0'),(16,'2000','Account Payable - Trade Supplier',3,0,16,'','2018-04-18 11:54:41','2018-08-07 01:00:53','0000-00-00 00:00:00',1,8,0,'','\0'),(17,'3000','Capital - Equity',5,0,17,'','2018-04-18 11:55:12','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(18,'3010','Retained Earnings',5,0,18,'','2018-04-18 11:55:28','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(19,'4000','Sales',7,0,19,'','2018-04-18 12:03:37','2018-06-29 05:53:51','0000-00-00 00:00:00',1,1,0,'','\0'),(20,'4010','Other Income',7,0,20,'','2018-04-18 12:04:17','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(21,'4020','Revenue',7,0,21,'','2018-04-18 12:04:33','2018-06-29 05:54:36','0000-00-00 00:00:00',1,1,0,'','\0'),(22,'4030','Imported  Products Income',7,0,22,'','2018-04-18 12:04:49','2018-06-29 05:55:08','0000-00-00 00:00:00',1,1,0,'','\0'),(23,'4040','Local Products',7,0,23,'','2018-04-18 12:05:12','2018-06-29 05:55:20','2018-08-07 01:04:34',1,1,8,'',''),(24,'5000','Expenses',6,0,24,'','2018-04-18 12:05:42','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(25,'5010','Labor',6,0,25,'','2018-04-18 12:06:20','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(26,'5020','Repair and Maintenance',6,0,26,'','2018-04-18 12:06:35','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(27,'5030','Salaries and Wages - Admin',6,0,27,'','2018-04-18 12:06:49','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(28,'5031','Salaries and Wages - Agency and Security',6,0,28,'','2018-04-18 12:07:17','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(29,'5032','Salaries and Wages - Hotel Personnel',6,0,29,'','2018-04-18 12:07:45','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(30,'5040','Office Supplies',6,0,30,'','2018-04-18 12:08:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(31,'5050','Commissions - Massage / Vehicle',6,0,31,'','2018-04-18 12:08:32','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(32,'5060','Gas and Oil',6,0,32,'','2018-04-18 12:09:02','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(33,'5070','Telephone and Communication and Internet',6,0,33,'','2018-04-18 12:09:29','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(34,'5080','Garbage Expense and Sewerage',6,0,34,'','2018-04-18 12:09:49','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(35,'5090','Water Consumption',6,0,35,'','2018-04-18 12:10:02','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(36,'5100','Miscellaneous Expense',6,0,36,'','2018-04-18 12:10:29','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(37,'5200','Construction Maintenance',6,0,37,'','2018-04-18 12:10:58','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(38,'5300','Utility Expenses and Plumbing',6,0,38,'','2018-04-18 12:11:21','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(39,'5400','Janitorial Expense',6,0,39,'','2018-04-18 12:11:40','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(40,'550','Rental and Occupancy Expense',6,0,40,'','2018-04-18 12:12:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(41,'5600','Purchases and Wet Market Purchases',6,0,41,'','2018-04-18 12:12:37','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(42,'5700','Groceries',6,0,42,'','2018-04-18 12:12:49','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(43,'5800','Hotel Supplies',6,0,43,'','2018-04-18 12:12:59','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(44,'5900','Toiletries',6,0,44,'','2018-04-18 12:13:08','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(45,'5901','Donation and Contribution',6,0,45,'','2018-06-05 01:27:06','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0'),(46,'t01','Cash Advances',1,0,46,'','2018-06-20 14:20:18','0000-00-00 00:00:00','2019-01-28 17:13:24',1,0,1,'',''),(47,'t02','Check Advances',1,0,47,'','2018-06-20 14:20:31','0000-00-00 00:00:00','2018-08-07 00:42:36',1,0,8,'',''),(48,'t03','Card Advances',1,0,48,'','2018-06-20 14:20:45','0000-00-00 00:00:00','2018-08-07 00:42:31',1,0,8,'',''),(49,'t04','Charge Advances',1,0,49,'','2018-06-20 14:20:58','0000-00-00 00:00:00','2018-08-07 00:42:28',1,0,8,'',''),(50,'tr05','Advance Bank Deposit',1,0,50,'','2018-06-20 14:21:13','0000-00-00 00:00:00','2019-01-28 17:13:27',1,0,1,'',''),(51,'t06','Advance Sales',7,0,51,'','2018-06-20 14:22:15','0000-00-00 00:00:00','2018-08-07 01:04:56',1,0,8,'',''),(52,'100','Bank - Check',1,0,52,'','2018-06-20 14:23:28','0000-00-00 00:00:00','2018-08-07 00:43:36',1,0,8,'',''),(53,'110','Bank - Card',1,0,53,'','2018-06-20 14:23:45','0000-00-00 00:00:00','2018-08-07 00:43:49',1,0,8,'',''),(54,'130','Bank  -Bank Deposit',1,0,54,'','2018-06-20 14:24:01','0000-00-00 00:00:00','2018-08-07 00:42:52',1,0,8,'',''),(55,'1300','Inventory Warehouse',1,0,55,'','2018-06-29 05:57:18','2018-08-07 01:07:17','0000-00-00 00:00:00',1,8,0,'','\0'),(56,'1021','Cash in Bank - East West Savings',1,0,56,'','2018-06-29 05:58:34','2018-08-07 00:50:44','0000-00-00 00:00:00',1,8,0,'','\0'),(57,'1022','Cash in Bank - BDO',1,0,57,'','2018-06-29 07:54:20','2018-08-07 00:50:50','0000-00-00 00:00:00',3,8,0,'','\0'),(58,'1600','Vat Input (Tax)',1,0,58,'','2018-07-13 06:21:11','2018-08-07 00:59:48','0000-00-00 00:00:00',1,8,0,'','\0'),(59,'2200','Vat Output (Tax)',3,0,59,'','2018-07-13 06:22:13','2018-08-07 01:02:35','0000-00-00 00:00:00',1,8,0,'','\0'),(60,'201','Cash in bank-BDO',1,0,60,'','2018-08-02 02:22:53','0000-00-00 00:00:00','2018-08-06 04:41:36',8,0,8,'',''),(61,'1023','Cash in Bank- BPI Personal',1,0,61,'','2018-08-06 04:43:57','2018-09-27 02:12:50','0000-00-00 00:00:00',8,8,0,'','\0'),(62,'1010','Cash-Shopee Wallet',1,0,62,'','2018-08-06 04:44:37','2018-08-07 00:50:05','0000-00-00 00:00:00',8,8,0,'','\0'),(63,'1011','Cash- Remittances',1,0,63,'','2018-08-07 00:47:58','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(64,'1010','Intercompany Receivables',1,0,64,'','2018-08-07 00:52:08','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(65,'1320','Inventory Obsolescence',1,0,65,'','2018-08-07 00:53:43','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(66,'1301','Inventory-Store',1,0,66,'','2018-08-07 01:06:44','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(67,'4011','Sales Return and Allowances',7,0,67,'','2018-08-07 02:48:25','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(68,'1505','Leasehold Improvement',2,0,68,'','2018-08-07 04:45:10','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(69,'1024','Cash in Bank- BDO Personal',1,0,69,'','2018-08-08 05:31:35','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(70,'5902','Shipping Fee',6,0,70,'','2018-08-09 01:11:26','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(71,'5903','SSS Contribution Expense',6,0,71,'','2018-08-09 03:20:56','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(72,'5904','Philhealth Contribution Expense',6,0,72,'','2018-08-09 03:21:22','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(73,'5905','HDMF Contribution Expense',6,0,73,'','2018-08-09 03:21:42','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(74,'5906','Bank Charge',6,0,74,'','2018-08-09 06:30:17','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(75,'5907','Officers Benefit- Bea Pineda',6,0,75,'','2018-08-09 06:37:12','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(76,'5908','Transportation Expense',6,0,76,'','2018-08-13 08:37:09','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(77,'5909','Toll fee/ EC Tag Load Expense',6,0,77,'','2018-08-13 08:37:33','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(78,'5910','General Supplies',6,0,78,'','2018-08-20 03:41:13','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(79,'5911','Meal Allowance',6,0,79,'','2018-08-20 03:46:33','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(80,'5912','Interest Expense',6,0,80,'','2018-08-20 08:24:48','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(81,'5913','BIR 1601E',6,0,81,'','2018-08-22 01:05:23','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(82,'5914','Retainers Fee',6,0,82,'','2018-08-22 01:05:38','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(83,'5915','Light & Water',6,0,83,'','2018-08-22 01:12:12','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(84,'5916','BIR 1702Q',6,0,84,'','2018-09-04 00:49:34','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(85,'1025','Cash in Bank Eastwest Savings',1,0,85,'','2018-09-06 07:30:01','0000-00-00 00:00:00','2018-09-20 02:58:59',8,0,8,'',''),(86,'5917','13TH MONTH PAY',6,0,86,'','2018-09-08 05:46:09','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(87,'1026','Advances OTHERS',1,0,87,'','2018-09-08 08:09:11','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(88,'5918','Load Allowance',6,0,88,'','2018-09-08 08:47:31','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(89,'1027','Cash in Bank- BPI',1,0,89,'','2018-09-27 02:13:21','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(90,'1024','Cash in Bank- EW Pure Vanity',1,0,90,'','2018-09-28 03:26:32','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(91,'4012','Interest Income',7,0,91,'','2018-10-10 03:09:27','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(92,'5919','Shortages',6,0,92,'','2018-10-11 01:06:58','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(93,'5920','BIR 2550M/Q',6,0,93,'','2018-11-27 14:49:44','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(94,'5921','Accounting Subscription Fee',6,0,94,'','2019-01-14 14:47:15','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0'),(95,'5922','Taxes & Licenses-Bussiness Permit',6,0,95,'','2019-01-18 08:19:50','0000-00-00 00:00:00','0000-00-00 00:00:00',8,0,0,'','\0');
/*!40000 ALTER TABLE `account_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_types`
--

DROP TABLE IF EXISTS `account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_types` (
  `account_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type` varchar(155) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  PRIMARY KEY (`account_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_types`
--

LOCK TABLES `account_types` WRITE;
/*!40000 ALTER TABLE `account_types` DISABLE KEYS */;
INSERT INTO `account_types` VALUES (1,'Asset',''),(2,'Liability',''),(3,'Capital',''),(4,'Income',''),(5,'Expense','');
/*!40000 ALTER TABLE `account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_year`
--

DROP TABLE IF EXISTS `account_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_year` (
  `account_year_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_year` varchar(100) DEFAULT '',
  `description` varchar(755) DEFAULT '',
  `status` varchar(100) DEFAULT NULL,
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` int(11) DEFAULT '0',
  `date_closed` datetime DEFAULT '0000-00-00 00:00:00',
  `closed_by_user` int(11) DEFAULT '0',
  PRIMARY KEY (`account_year_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_year`
--

LOCK TABLES `account_year` WRITE;
/*!40000 ALTER TABLE `account_year` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounting_period`
--

DROP TABLE IF EXISTS `accounting_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_period` (
  `accounting_period_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `period_start` date DEFAULT '0000-00-00',
  `period_end` date DEFAULT '0000-00-00',
  `closed_by_user` bigint(20) DEFAULT '0',
  `date_time_closed` datetime DEFAULT '0000-00-00 00:00:00',
  `remarks` varchar(1000) DEFAULT '',
  PRIMARY KEY (`accounting_period_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounting_period`
--

LOCK TABLES `accounting_period` WRITE;
/*!40000 ALTER TABLE `accounting_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounting_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjustment_info`
--

DROP TABLE IF EXISTS `adjustment_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjustment_info` (
  `adjustment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adjustment_code` varchar(75) DEFAULT '',
  `department_id` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `adjustment_type` varchar(20) DEFAULT 'IN',
  `total_discount` decimal(20,2) DEFAULT '0.00',
  `total_before_tax` decimal(20,2) DEFAULT '0.00',
  `total_after_tax` decimal(20,2) DEFAULT '0.00',
  `total_tax_amount` decimal(20,2) DEFAULT '0.00',
  `date_adjusted` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` datetime DEFAULT NULL,
  `posted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `pos_is_received` bit(1) DEFAULT b'0',
  `is_for_pos` bit(1) DEFAULT b'0',
  `is_journal_posted` tinyint(1) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `customer_id` bigint(20) DEFAULT '0',
  `is_returns` bit(1) DEFAULT b'0',
  `inv_no` varchar(145) DEFAULT '',
  PRIMARY KEY (`adjustment_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjustment_info`
--

LOCK TABLES `adjustment_info` WRITE;
/*!40000 ALTER TABLE `adjustment_info` DISABLE KEYS */;
INSERT INTO `adjustment_info` VALUES (1,'ADJ-20190704-1',1,'Initial Inventory for Kitchen ','IN',0.00,354172.32,394165.00,39992.68,'2019-07-03','2019-07-04 01:59:50','2019-07-04 02:00:15',NULL,1,1,0,'','\0','\0','\0',0,0,NULL,'\0',''),(2,'ADJ-20190704-2',1,'Expired Products','OUT',0.00,4214.29,4720.00,505.71,'2019-07-03','2019-07-04 02:02:34','2019-07-04 02:02:34',NULL,1,0,0,'','\0','\0','\0',0,0,NULL,'\0',''),(3,'ADJ-20190704-3',1,'Beginning Inventory','IN',0.00,530000.00,530000.00,0.00,'2019-07-04','2019-07-04 05:41:53','2019-07-04 05:41:53',NULL,1,0,0,'','\0','\0','\0',0,0,NULL,'\0','');
/*!40000 ALTER TABLE `adjustment_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjustment_items`
--

DROP TABLE IF EXISTS `adjustment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjustment_items` (
  `adjustment_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `unit_id` int(11) DEFAULT '0',
  `adjust_qty` decimal(20,2) DEFAULT '0.00',
  `adjust_price` decimal(20,4) DEFAULT '0.0000',
  `adjust_discount` decimal(20,4) DEFAULT '0.0000',
  `adjust_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `adjust_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `adjust_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `adjust_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `adjust_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`adjustment_item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjustment_items`
--

LOCK TABLES `adjustment_items` WRITE;
/*!40000 ALTER TABLE `adjustment_items` DISABLE KEYS */;
INSERT INTO `adjustment_items` VALUES (17,1,7,1,2,85.00,1300.0000,0.0000,12.0000,110500.0000,0.0000,11839.2857,98660.7143,'0000-00-00',''),(18,1,11,1,3,90.00,340.0000,0.0000,12.0000,30600.0000,0.0000,3278.5714,27321.4286,'0000-00-00',''),(19,1,10,1,5,25.00,2311.0000,0.0000,12.0000,57775.0000,0.0000,6190.1786,51584.8214,'0000-00-00',''),(20,1,3,1,4,65.00,95.0000,0.0000,12.0000,6175.0000,0.0000,661.6071,5513.3929,'0000-00-00',''),(21,1,8,1,3,35.00,350.0000,0.0000,12.0000,12250.0000,0.0000,1312.5000,10937.5000,'0000-00-00',''),(22,1,16,1,3,15.00,1100.0000,0.0000,12.0000,16500.0000,0.0000,1767.8571,14732.1429,'0000-00-00',''),(23,1,9,1,2,65.00,1176.0000,0.0000,12.0000,76440.0000,0.0000,8190.0000,68250.0000,'0000-00-00',''),(24,1,15,1,4,75.00,69.0000,0.0000,12.0000,5175.0000,0.0000,554.4643,4620.5357,'0000-00-00',''),(25,1,2,1,3,55.00,380.0000,0.0000,0.0000,20900.0000,0.0000,0.0000,20900.0000,'0000-00-00',''),(26,1,14,1,4,18.00,395.0000,0.0000,12.0000,7110.0000,0.0000,761.7857,6348.2143,'0000-00-00',''),(27,1,1,1,2,6.00,340.0000,0.0000,12.0000,2040.0000,0.0000,218.5714,1821.4286,'0000-00-00',''),(28,1,13,1,4,60.00,180.0000,0.0000,12.0000,10800.0000,0.0000,1157.1429,9642.8571,'0000-00-00',''),(29,1,12,1,4,50.00,470.0000,0.0000,12.0000,23500.0000,0.0000,2517.8571,20982.1429,'0000-00-00',''),(30,1,6,1,5,10.00,420.0000,0.0000,12.0000,4200.0000,0.0000,450.0000,3750.0000,'0000-00-00',''),(31,1,5,1,5,9.00,400.0000,0.0000,12.0000,3600.0000,0.0000,385.7143,3214.2857,'0000-00-00',''),(32,1,4,1,2,15.00,440.0000,0.0000,12.0000,6600.0000,0.0000,707.1429,5892.8571,'0000-00-00',''),(33,2,5,1,5,2.00,400.0000,0.0000,12.0000,800.0000,0.0000,85.7143,714.2857,'0000-00-00',''),(34,2,4,1,2,3.00,440.0000,0.0000,12.0000,1320.0000,0.0000,141.4286,1178.5714,'0000-00-00',''),(35,2,7,1,2,2.00,1300.0000,0.0000,12.0000,2600.0000,0.0000,278.5714,2321.4286,'0000-00-00',''),(36,3,22,1,6,50.00,1000.0000,0.0000,0.0000,50000.0000,0.0000,0.0000,50000.0000,'0000-00-00',''),(37,3,21,1,5,60.00,1000.0000,0.0000,0.0000,60000.0000,0.0000,0.0000,60000.0000,'0000-00-00',''),(38,3,19,1,5,100.00,1000.0000,0.0000,0.0000,100000.0000,0.0000,0.0000,100000.0000,'0000-00-00',''),(39,3,18,1,6,200.00,100.0000,0.0000,0.0000,20000.0000,0.0000,0.0000,20000.0000,'0000-00-00',''),(40,3,17,1,5,300.00,1000.0000,0.0000,0.0000,300000.0000,0.0000,0.0000,300000.0000,'0000-00-00','');
/*!40000 ALTER TABLE `adjustment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_status`
--

DROP TABLE IF EXISTS `approval_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval_status` (
  `approval_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval_status` varchar(100) DEFAULT '',
  `approval_description` varchar(555) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`approval_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_status`
--

LOCK TABLES `approval_status` WRITE;
/*!40000 ALTER TABLE `approval_status` DISABLE KEYS */;
INSERT INTO `approval_status` VALUES (1,'Approved','','','\0'),(2,'Pending','','','\0');
/*!40000 ALTER TABLE `approval_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_property_status`
--

DROP TABLE IF EXISTS `asset_property_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_property_status` (
  `asset_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_property_status` varchar(50) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT '1',
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`asset_status_id`) USING BTREE,
  UNIQUE KEY `asset_property_id` (`asset_status_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_property_status`
--

LOCK TABLES `asset_property_status` WRITE;
/*!40000 ALTER TABLE `asset_property_status` DISABLE KEYS */;
INSERT INTO `asset_property_status` VALUES (1,'Active',1,0),(2,'Inactive',1,0),(3,'Obsolete',1,0),(4,'Lost',1,0),(5,'Damage',1,0);
/*!40000 ALTER TABLE `asset_property_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_code` varchar(20) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `account_type` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_reconciliation`
--

DROP TABLE IF EXISTS `bank_reconciliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_reconciliation` (
  `bank_recon_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) DEFAULT '0',
  `date_reconciled` date DEFAULT '0000-00-00',
  `reconciled_by` int(11) DEFAULT '0',
  `account_id` int(11) DEFAULT '0',
  `account_balance` decimal(10,0) DEFAULT '0',
  `bank_service_charge` decimal(10,0) DEFAULT '0',
  `nsf_check` decimal(10,0) DEFAULT '0',
  `check_printing_charge` decimal(10,0) DEFAULT '0',
  `interest_earned` decimal(10,0) DEFAULT '0',
  `notes_receivable` decimal(10,0) DEFAULT '0',
  `actual_balance` decimal(10,0) DEFAULT '0',
  `outstanding_checks` decimal(10,0) DEFAULT '0',
  `deposit_in_transit` decimal(10,0) DEFAULT '0',
  `journal_adjusted_collection` decimal(10,0) DEFAULT '0',
  `bank_adjusted_collection` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`bank_recon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_reconciliation`
--

LOCK TABLES `bank_reconciliation` WRITE;
/*!40000 ALTER TABLE `bank_reconciliation` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_reconciliation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_reconciliation_details`
--

DROP TABLE IF EXISTS `bank_reconciliation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_reconciliation_details` (
  `bank_recon_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_recon_id` int(11) DEFAULT '0',
  `journal_id` int(11) DEFAULT '0',
  `check_status` int(11) DEFAULT '0' COMMENT '0 = no selected\n1 = outstanding\n2 = good check',
  PRIMARY KEY (`bank_recon_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_reconciliation_details`
--

LOCK TABLES `bank_reconciliation_details` WRITE;
/*!40000 ALTER TABLE `bank_reconciliation_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_reconciliation_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_info`
--

DROP TABLE IF EXISTS `batch_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_info` (
  `batch_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(75) DEFAULT '',
  `date_replenished` datetime DEFAULT '0000-00-00 00:00:00',
  `replenished_by` int(11) DEFAULT '0',
  PRIMARY KEY (`batch_id`) USING BTREE,
  UNIQUE KEY `batch_id` (`batch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_info`
--

LOCK TABLES `batch_info` WRITE;
/*!40000 ALTER TABLE `batch_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`brand_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'N/A','\0',''),(69,'Afzal','\0',''),(70,'Azure','\0',''),(71,'Alfakher','\0','');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards` (
  `card_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `card_code` varchar(100) NOT NULL,
  `card_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`card_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_invoice`
--

DROP TABLE IF EXISTS `cash_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_invoice` (
  `cash_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cash_inv_no` varchar(75) DEFAULT '',
  `sales_order_id` bigint(20) DEFAULT '0',
  `sales_order_no` varchar(75) DEFAULT '',
  `order_status_id` int(11) DEFAULT '1' COMMENT '1 is open 2 is closed 3 is partially, used in delivery_receipt',
  `department_id` int(11) DEFAULT '0',
  `issue_to_department` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `terms` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `date_due` date DEFAULT '0000-00-00',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `ref_product_type_id` int(11) DEFAULT '0',
  `inv_type` int(11) DEFAULT '1',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT '',
  `contact_person` varchar(175) DEFAULT NULL,
  `email_address` varchar(75) DEFAULT NULL,
  `contact_no` varchar(75) DEFAULT NULL,
  `customer_type_id` bigint(20) DEFAULT '0',
  `order_source_id` bigint(20) DEFAULT '0',
  `for_dispatching` bit(1) DEFAULT b'0',
  PRIMARY KEY (`cash_invoice_id`) USING BTREE,
  UNIQUE KEY `cash_inv_no` (`cash_inv_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_invoice`
--

LOCK TABLES `cash_invoice` WRITE;
/*!40000 ALTER TABLE `cash_invoice` DISABLE KEYS */;
INSERT INTO `cash_invoice` VALUES (1,'CI-INV-20190704-1',0,'',1,1,NULL,1,0,0,'',0.0000,0.0000,0.0000,990.0000,883.9200,106.0800,990.0000,'2019-07-04','2019-07-04','2019-07-04 02:49:18','0000-00-00 00:00:00','2019-07-04 02:49:18',1,0,0,'\0','','\0','\0',0,1,1,'N/A','N/A',NULL,NULL,0,1,'\0'),(2,'CI-INV-20190704-2',0,'',1,1,NULL,3,0,0,'',0.0000,0.0000,0.0000,4297.0000,3836.6000,460.4000,4297.0000,'2019-07-04','2019-07-04','2019-07-04 02:49:52','0000-00-00 00:00:00','2019-07-04 02:49:53',1,0,0,'\0','','\0','\0',0,1,1,'Francis Neil Manaloto','Francis Neil Manaloto',NULL,NULL,0,1,'\0'),(3,'CI-INV-20190704-3',0,'',2,1,NULL,5,0,0,'For Delivery - COD',0.0000,0.0000,0.0000,8600.0000,8600.0000,0.0000,8600.0000,'2019-07-04','2019-07-04','2019-07-04 05:49:10','0000-00-00 00:00:00','2019-07-04 05:51:49',1,0,0,'\0','','\0','\0',0,1,1,'Angeles City','N/A',NULL,NULL,0,1,''),(4,'CI-INV-20190903-4',0,'',1,1,NULL,4,0,0,'',250.0000,10.0000,465.0000,4185.0000,4375.0000,525.0000,4650.0000,'2019-09-03','2019-09-03','2019-09-03 15:15:17','0000-00-00 00:00:00','2019-09-03 07:15:17',7,0,0,'\0','','\0','\0',0,1,1,'Clark Freeport','Benedict Sanchez',NULL,NULL,0,1,'\0');
/*!40000 ALTER TABLE `cash_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_invoice_items`
--

DROP TABLE IF EXISTS `cash_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_invoice_items` (
  `cash_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cash_invoice_id` bigint(20) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `inv_price` decimal(20,4) DEFAULT '0.0000',
  `orig_so_price` decimal(20,4) DEFAULT '0.0000',
  `inv_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `cost_upon_invoice` decimal(20,4) DEFAULT '0.0000',
  `inv_qty` decimal(20,2) DEFAULT '0.00',
  `inv_gross` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  `inv_notes` varchar(100) DEFAULT NULL,
  `dr_invoice_id` int(11) DEFAULT NULL,
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`cash_item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_invoice_items`
--

LOCK TABLES `cash_invoice_items` WRITE;
/*!40000 ALTER TABLE `cash_invoice_items` DISABLE KEYS */;
INSERT INTO `cash_invoice_items` VALUES (1,1,12,4,1,470.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,470.0000,470.0000,50.3600,419.6400,470.0000,NULL,NULL,'0000-00-00',''),(2,1,13,4,1,180.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,180.0000,180.0000,19.2900,160.7100,180.0000,NULL,NULL,'0000-00-00',''),(3,1,11,3,1,340.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,340.0000,340.0000,36.4300,303.5700,340.0000,NULL,NULL,'0000-00-00',''),(4,2,12,4,1,470.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,470.0000,470.0000,50.3600,419.6400,470.0000,NULL,NULL,'0000-00-00',''),(5,2,1,2,1,340.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,340.0000,340.0000,36.4300,303.5700,340.0000,NULL,NULL,'0000-00-00',''),(6,2,10,5,1,2311.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,2311.0000,2311.0000,247.6100,2063.3900,2311.0000,NULL,NULL,'0000-00-00',''),(7,2,9,2,1,1176.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,1176.0000,1176.0000,126.0000,1050.0000,1176.0000,NULL,NULL,'0000-00-00',''),(8,3,17,5,1,1300.0000,0.0000,0.0000,0.0000,0.0000,0.0000,2.00,2600.0000,2600.0000,0.0000,2600.0000,2600.0000,NULL,NULL,'0000-00-00',''),(9,3,19,5,1,1200.0000,0.0000,0.0000,0.0000,0.0000,0.0000,5.00,6000.0000,6000.0000,0.0000,6000.0000,6000.0000,NULL,NULL,'0000-00-00',''),(10,4,17,5,1,1300.0000,0.0000,10.0000,130.0000,12.0000,0.0000,1.00,1300.0000,1170.0000,139.2857,1160.7143,1053.0000,NULL,NULL,'0000-00-00',''),(11,4,19,5,1,1200.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,1200.0000,1200.0000,128.5700,1071.4300,1080.0000,NULL,NULL,'0000-00-00',''),(12,4,22,6,1,1200.0000,0.0000,10.0000,120.0000,12.0000,0.0000,1.00,1200.0000,1080.0000,128.5714,1071.4286,972.0000,NULL,NULL,'0000-00-00',''),(13,4,21,5,1,1200.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,1200.0000,1200.0000,128.5700,1071.4300,1080.0000,NULL,NULL,'0000-00-00','');
/*!40000 ALTER TABLE `cash_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_code` bigint(20) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_desc` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,'N/A','N/A',NULL,'0000-00-00 00:00:00','\0',''),(2,NULL,'Double Apple','Double Apple',NULL,'0000-00-00 00:00:00','\0',''),(3,NULL,'Mint','Mint',NULL,'0000-00-00 00:00:00','\0',''),(4,NULL,'Bermuba','Bermuba',NULL,'0000-00-00 00:00:00','\0',''),(5,NULL,'Shisha Tobacco','Shisha Tobacco',NULL,'0000-00-00 00:00:00','\0','');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `chat_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chat_code` varchar(150) DEFAULT '0',
  `message` varchar(160) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`chat_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_layout`
--

DROP TABLE IF EXISTS `check_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_layout` (
  `check_layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `check_layout` varchar(755) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `particular_pos_left` decimal(20,0) DEFAULT '0',
  `particular_pos_top` decimal(20,0) DEFAULT '0',
  `particular_font_family` varchar(555) DEFAULT 'Tahoma',
  `particular_font_size` varchar(20) DEFAULT '12pt',
  `particular_is_italic` varchar(55) DEFAULT 'normal',
  `particular_is_bold` varchar(55) DEFAULT 'bold',
  `words_pos_left` decimal(20,4) DEFAULT '0.0000',
  `words_pos_top` decimal(20,4) DEFAULT '0.0000',
  `words_font_family` varchar(555) DEFAULT 'Tahoma',
  `words_font_size` varchar(20) DEFAULT '12pt',
  `words_is_italic` varchar(55) DEFAULT 'normal',
  `words_is_bold` varchar(55) DEFAULT 'bold',
  `amount_pos_left` decimal(20,4) DEFAULT '0.0000',
  `amount_pos_top` decimal(20,4) DEFAULT '0.0000',
  `amount_font_family` varchar(555) DEFAULT '',
  `amount_font_size` varchar(20) DEFAULT '12pt',
  `amount_is_italic` varchar(55) DEFAULT 'normal',
  `amount_is_bold` varchar(20) DEFAULT 'bold',
  `date_pos_left` decimal(20,4) DEFAULT '0.0000',
  `date_pos_top` decimal(20,4) DEFAULT '0.0000',
  `date_font_family` varchar(555) DEFAULT '',
  `date_font_size` varchar(20) DEFAULT '12pt',
  `date_is_italic` varchar(55) DEFAULT 'normal',
  `date_is_bold` varchar(55) DEFAULT 'bold',
  `is_portrait` bit(1) DEFAULT b'1',
  `posted_by_user` bigint(20) DEFAULT '0',
  `date_posted` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` bigint(20) DEFAULT '0',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_by_user` bigint(20) DEFAULT '0',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`check_layout_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_layout`
--

LOCK TABLES `check_layout` WRITE;
/*!40000 ALTER TABLE `check_layout` DISABLE KEYS */;
INSERT INTO `check_layout` VALUES (1,'Security Bank','',129,82,'Tahoma','16px','normal','bold',97.7500,107.7190,'Tahoma','16px','normal','bold',642.6250,71.6250,'Segoe UI, Source Sans Pro, Calibri, Candara, Arial, sans-serif','16px','normal','bold',642.6880,37.6250,'Segoe UI, Source Sans Pro, Calibri, Candara, Arial, sans-serif','16px','normal','bold','',4,'2017-09-13 11:47:30',0,'2018-08-22 02:35:46',0,'0000-00-00 00:00:00','','\0');
/*!40000 ALTER TABLE `check_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_info`
--

DROP TABLE IF EXISTS `company_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_info` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(555) DEFAULT '',
  `company_address` varchar(755) DEFAULT '',
  `email_address` varchar(155) DEFAULT '',
  `mobile_no` varchar(125) DEFAULT '',
  `landline` varchar(125) DEFAULT '',
  `tin_no` varchar(55) DEFAULT NULL,
  `tax_type_id` int(11) DEFAULT '0',
  `registered_to` varchar(555) DEFAULT '',
  `logo_path` varchar(555) DEFAULT '',
  `rdo_no` varchar(55) DEFAULT NULL,
  `nature_of_business` varchar(155) DEFAULT NULL,
  `business_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_info`
--

LOCK TABLES `company_info` WRITE;
/*!40000 ALTER TABLE `company_info` DISABLE KEYS */;
INSERT INTO `company_info` VALUES (1,'Sheesha Avenue Phils, Inc.','Narciso Ave | A.L.E Bldg, Unit G, Next to 7-11, In between Tiger Hotel and Prime Asia Hotel, Angeles City, Luzon 2009, Philippines +63 998 222 8234',' jranjit@sheeshaavenue.com','+63-9399330809','+63-45-4366133','',1,'','assets/img/company/5d22bb4c4a31b.jpg','','',1);
/*!40000 ALTER TABLE `company_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_photos`
--

DROP TABLE IF EXISTS `customer_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_photos` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT '0',
  `photo_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_photos`
--

LOCK TABLES `customer_photos` WRITE;
/*!40000 ALTER TABLE `customer_photos` DISABLE KEYS */;
INSERT INTO `customer_photos` VALUES (1,1,'assets/img/anonymous-icon.png'),(2,2,'assets/img/anonymous-icon.png'),(3,3,'assets/img/anonymous-icon.png'),(4,4,'assets/img/anonymous-icon.png'),(5,5,'assets/img/anonymous-icon.png');
/*!40000 ALTER TABLE `customer_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_type`
--

DROP TABLE IF EXISTS `customer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_type` (
  `customer_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_type_name` varchar(145) DEFAULT NULL,
  `customer_type_description` varchar(145) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`customer_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_type`
--

LOCK TABLES `customer_type` WRITE;
/*!40000 ALTER TABLE `customer_type` DISABLE KEYS */;
INSERT INTO `customer_type` VALUES (1,'Wholesaler','Wholesaler','','\0'),(2,'Dealer','Dealer','','\0'),(3,'Distributor','Distributor','','\0'),(4,'Reseller','Reseller','','\0');
/*!40000 ALTER TABLE `customer_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pos_customer_id` bigint(20) DEFAULT '0',
  `hotel_customer_id` bigint(20) DEFAULT '0',
  `customer_code` varchar(255) DEFAULT '',
  `customer_name` varchar(255) DEFAULT '',
  `contact_name` varchar(255) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `email_address` varchar(255) DEFAULT '',
  `contact_no` varchar(100) DEFAULT '',
  `term` varchar(100) DEFAULT '',
  `customer_type_id` bigint(20) DEFAULT '0',
  `department_id` bigint(20) DEFAULT '0',
  `link_department_id` int(11) DEFAULT '0',
  `refcustomertype_id` bigint(20) DEFAULT '0',
  `tin_no` varchar(100) DEFAULT '',
  `photo_path` varchar(500) DEFAULT '',
  `total_receivable_amount` decimal(19,2) DEFAULT '0.00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `credit_limit` decimal(20,4) DEFAULT '0.0000',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,0,0,'','Various Customers','N/A','N/A','','',NULL,0,NULL,0,NULL,'','assets/img/anonymous-icon.png',0.00,'2019-07-03 05:45:19','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL,0,0,'\0','\0',''),(2,0,0,'','Erick Pecson','Erick Pecson','Angeles City','',NULL,NULL,0,NULL,0,NULL,'','assets/img/anonymous-icon.png',2340.00,'2019-07-04 01:27:43','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL,0,0,'\0','\0',''),(3,0,0,'','Francis Neil Manaloto','Francis Neil Manaloto','Francis Neil Manaloto','',NULL,NULL,0,NULL,0,NULL,'','assets/img/anonymous-icon.png',0.00,'2019-07-04 01:28:32','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL,0,0,'\0','\0',''),(4,0,0,'','Sutherland Corporation','Benedict Sanchez','Clark Freeport','',NULL,NULL,0,NULL,0,NULL,'','assets/img/anonymous-icon.png',-15000.00,'2019-07-04 02:04:42','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL,0,0,'\0','\0',''),(5,0,0,'','Food Gossip','N/A','Angeles City','',NULL,NULL,0,NULL,0,NULL,'','assets/img/anonymous-icon.png',0.00,'2019-07-04 05:48:17','0000-00-00 00:00:00','0000-00-00 00:00:00',1,NULL,0,0,'\0','\0','');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_invoice`
--

DROP TABLE IF EXISTS `delivery_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_invoice` (
  `dr_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dr_invoice_no` varchar(75) DEFAULT '',
  `purchase_order_id` int(11) DEFAULT '0',
  `external_ref_no` varchar(75) DEFAULT '',
  `contact_person` varchar(155) DEFAULT '',
  `terms` varchar(55) DEFAULT '',
  `duration` varchar(75) DEFAULT '',
  `supplier_id` int(11) DEFAULT '0',
  `department_id` bigint(20) DEFAULT '0',
  `tax_type_id` int(11) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `remarks` varchar(555) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) NOT NULL,
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `date_due` date DEFAULT '0000-00-00',
  `date_delivered` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `batch_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dr_invoice_id`) USING BTREE,
  UNIQUE KEY `dr_invoice_no` (`dr_invoice_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_invoice`
--

LOCK TABLES `delivery_invoice` WRITE;
/*!40000 ALTER TABLE `delivery_invoice` DISABLE KEYS */;
INSERT INTO `delivery_invoice` VALUES (1,'P-INV-20190704-1',0,'','N/A','','',4,1,1,0,'',0.0000,5429.9900,606.0100,6036.0000,0.0000,0.0000,6036.0000,'','\0','\0','\0','2019-07-04','2019-07-04','2019-07-04 01:54:42','2019-07-04 01:54:42','0000-00-00 00:00:00',1,0,0,NULL),(2,'P-INV-20190704-2',0,'','N/A','','',4,1,1,0,'',0.0000,3353.5600,402.4400,3756.0000,0.0000,0.0000,3756.0000,'','\0','\0','\0','2019-07-04','2019-07-04','2019-07-04 01:54:52','2019-07-04 01:54:52','0000-00-00 00:00:00',1,0,0,NULL),(3,'P-INV-20190704-3',3,'','','','',1,1,NULL,9,'Paid by Cash',0.0000,3800.0000,0.0000,3800.0000,0.0000,0.0000,3800.0000,'','\0','\0','','2019-07-04','2019-07-04','2019-07-04 02:03:32','2019-07-04 02:04:01','0000-00-00 00:00:00',1,0,0,NULL),(4,'P-INV-20190704-4',0,'DR123','','','',5,1,1,0,'',9000.0000,90000.0000,0.0000,81000.0000,0.0000,0.0000,81000.0000,'','\0','\0','\0','2019-07-04','2019-07-04','2019-07-04 05:30:23','2019-07-04 05:30:23','0000-00-00 00:00:00',1,0,0,NULL),(5,'P-INV-20190704-5',0,'','','','',1,1,1,0,'',0.0000,111607.1400,13392.8600,125000.0000,0.0000,0.0000,125000.0000,'','\0','\0','\0','2019-07-04','2019-07-04','2019-07-04 06:07:31','2019-07-04 06:07:31','0000-00-00 00:00:00',1,0,0,NULL),(6,'P-INV-20190704-6',0,'','N/A','','',5,1,2,0,'',0.0000,9464.2900,1135.7100,10600.0000,0.0000,0.0000,10600.0000,'','\0','\0','\0','2019-07-04','2019-07-04','2019-07-04 06:18:16','2019-07-04 06:18:16','0000-00-00 00:00:00',1,0,0,NULL),(7,'P-INV-20190903-7',4,'','','','',1,1,NULL,0,'',155.0000,1120.9800,134.5200,1255.5000,10.0000,139.5000,1255.5000,'','\0','\0','\0','2019-09-03','2019-09-03','2019-09-03 15:10:38','2019-09-03 07:10:38','0000-00-00 00:00:00',7,0,0,NULL),(8,'P-INV-20190903-8',4,'','','','',1,1,NULL,0,'',55.0000,397.7700,47.7300,445.5000,10.0000,49.5000,445.5000,'','\0','\0','\0','2019-09-03','2019-09-03','2019-09-03 15:10:51','2019-09-03 07:10:51','0000-00-00 00:00:00',7,0,0,NULL);
/*!40000 ALTER TABLE `delivery_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_invoice_items`
--

DROP TABLE IF EXISTS `delivery_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_invoice_items` (
  `dr_invoice_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dr_invoice_id` bigint(20) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `unit_id` int(11) DEFAULT '0',
  `dr_qty` decimal(20,2) DEFAULT '0.00',
  `dr_discount` decimal(20,4) DEFAULT '0.0000',
  `dr_price` decimal(20,4) DEFAULT '0.0000',
  `dr_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `dr_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `dr_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `dr_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `dr_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `dr_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`dr_invoice_item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_invoice_items`
--

LOCK TABLES `delivery_invoice_items` WRITE;
/*!40000 ALTER TABLE `delivery_invoice_items` DISABLE KEYS */;
INSERT INTO `delivery_invoice_items` VALUES (1,1,13,1,4,1.00,0.0000,180.0000,0.0000,180.0000,12.0000,19.2900,160.7100,180.0000,'1970-01-01',NULL),(2,1,5,1,5,1.00,0.0000,400.0000,0.0000,400.0000,12.0000,42.8600,357.1400,400.0000,'1970-01-01',NULL),(3,1,6,1,5,1.00,0.0000,420.0000,0.0000,420.0000,12.0000,45.0000,375.0000,420.0000,'1970-01-01',NULL),(4,1,2,1,3,1.00,0.0000,380.0000,0.0000,380.0000,0.0000,0.0000,380.0000,380.0000,'1970-01-01',NULL),(5,1,15,1,4,1.00,0.0000,69.0000,0.0000,69.0000,12.0000,7.3900,61.6100,69.0000,'1970-01-01',NULL),(6,1,9,1,2,1.00,0.0000,1176.0000,0.0000,1176.0000,12.0000,126.0000,1050.0000,1176.0000,'1970-01-01',NULL),(7,1,16,1,3,1.00,0.0000,1100.0000,0.0000,1100.0000,12.0000,117.8600,982.1400,1100.0000,'1970-01-01',NULL),(8,1,10,1,5,1.00,0.0000,2311.0000,0.0000,2311.0000,12.0000,247.6100,2063.3900,2311.0000,'1970-01-01',NULL),(9,2,13,1,4,1.00,0.0000,180.0000,0.0000,180.0000,12.0000,19.2900,160.7100,180.0000,'1970-01-01',NULL),(10,2,9,1,2,1.00,0.0000,1176.0000,0.0000,1176.0000,12.0000,126.0000,1050.0000,1176.0000,'1970-01-01',NULL),(11,2,16,1,3,1.00,0.0000,1100.0000,0.0000,1100.0000,12.0000,117.8600,982.1400,1100.0000,'1970-01-01',NULL),(12,2,7,1,2,1.00,0.0000,1300.0000,0.0000,1300.0000,12.0000,139.2900,1160.7100,1300.0000,'1970-01-01',NULL),(13,3,2,1,3,10.00,0.0000,380.0000,0.0000,3800.0000,0.0000,0.0000,3800.0000,3800.0000,'1970-01-01',NULL),(14,4,17,1,5,100.00,10.0000,900.0000,9000.0000,81000.0000,0.0000,0.0000,90000.0000,81000.0000,'1970-01-01',NULL),(15,5,17,1,5,20.00,0.0000,1000.0000,0.0000,20000.0000,12.0000,2142.8600,17857.1400,20000.0000,'1970-01-01',NULL),(16,5,18,1,6,50.00,0.0000,100.0000,0.0000,5000.0000,12.0000,535.7100,4464.2900,5000.0000,'1970-01-01',NULL),(17,5,19,1,5,100.00,0.0000,1000.0000,0.0000,100000.0000,12.0000,10714.2900,89285.7100,100000.0000,'1970-01-01',NULL),(18,6,17,1,5,2.00,0.0000,1000.0000,0.0000,2000.0000,12.0000,214.2900,1785.7100,2000.0000,'1970-01-01',NULL),(19,6,19,1,5,2.00,0.0000,1000.0000,0.0000,2000.0000,12.0000,214.2900,1785.7100,2000.0000,'1970-01-01',NULL),(20,6,21,1,5,5.00,0.0000,1000.0000,0.0000,5000.0000,12.0000,535.7100,4464.2900,5000.0000,'1970-01-01',NULL),(21,6,23,1,7,1.00,0.0000,100.0000,0.0000,100.0000,12.0000,10.7100,89.2900,100.0000,'1970-01-01',NULL),(22,6,24,1,7,1.00,0.0000,500.0000,0.0000,500.0000,12.0000,53.5700,446.4300,500.0000,'1970-01-01',NULL),(23,6,25,1,5,1.00,0.0000,1000.0000,0.0000,1000.0000,12.0000,107.1400,892.8600,1000.0000,'1970-01-01',NULL),(24,7,17,1,5,1.00,10.0000,1000.0000,100.0000,900.0000,12.0000,86.7900,723.2100,810.0000,'1970-01-01',NULL),(25,7,18,1,6,0.50,10.0000,100.0000,5.0000,45.0000,12.0000,4.3400,36.1600,40.5000,'1970-01-01',NULL),(26,7,19,1,5,0.50,10.0000,1000.0000,50.0000,450.0000,12.0000,43.3900,361.6100,405.0000,'1970-01-01',NULL),(27,8,18,1,6,0.50,10.0000,100.0000,5.0000,45.0000,12.0000,4.3400,36.1600,40.5000,'1970-01-01',NULL),(28,8,19,1,5,0.50,10.0000,1000.0000,50.0000,450.0000,12.0000,43.3900,361.6100,405.0000,'1970-01-01',NULL);
/*!40000 ALTER TABLE `delivery_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `department_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `department_code` varchar(20) DEFAULT '',
  `department_name` varchar(255) DEFAULT '',
  `department_desc` varchar(255) DEFAULT '',
  `delivery_address` varchar(755) DEFAULT '',
  `default_cost` tinyint(4) DEFAULT '1' COMMENT '1=Purchase Cost 1, 2=Purchase Cost 2',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'','Admin','','',1,'2019-01-27 23:12:04','0000-00-00 00:00:00','\0',''),(2,'','Accounting','',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','\0','');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depreciation_expense`
--

DROP TABLE IF EXISTS `depreciation_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depreciation_expense` (
  `de_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `de_date` date NOT NULL,
  `de_expense_total` decimal(20,4) NOT NULL,
  `de_remarks` text NOT NULL,
  `de_ref_no` varchar(75) NOT NULL,
  `date_posted` date NOT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `is_journal_posted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`de_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depreciation_expense`
--

LOCK TABLES `depreciation_expense` WRITE;
/*!40000 ALTER TABLE `depreciation_expense` DISABLE KEYS */;
/*!40000 ALTER TABLE `depreciation_expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `discount_id` bigint(100) NOT NULL AUTO_INCREMENT,
  `discount_code` bigint(100) DEFAULT NULL,
  `discount_type` varchar(200) DEFAULT NULL,
  `discount_desc` varchar(200) DEFAULT NULL,
  `discount_percent` bigint(100) DEFAULT NULL,
  `discount_amount` bigint(100) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`discount_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatching_invoice`
--

DROP TABLE IF EXISTS `dispatching_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispatching_invoice` (
  `dispatching_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dispatching_inv_no` varchar(75) DEFAULT '',
  `sales_invoice_id` bigint(20) DEFAULT '0',
  `sales_inv_no` varchar(245) DEFAULT '',
  `cash_invoice_id` bigint(20) DEFAULT '0',
  `cash_inv_no` varchar(245) DEFAULT '',
  `order_status_id` int(11) DEFAULT '1' COMMENT '1 is open 2 is closed 3 is partially, used in delivery_receipt',
  `department_id` int(11) DEFAULT '0',
  `issue_to_department` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `terms` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `date_due` date DEFAULT '0000-00-00',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `ref_product_type_id` int(11) DEFAULT '0',
  `inv_type` int(11) DEFAULT '1',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT '',
  `contact_person` varchar(175) DEFAULT NULL,
  `customer_type_id` bigint(20) DEFAULT '0',
  `order_source_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`dispatching_invoice_id`) USING BTREE,
  UNIQUE KEY `dispatching_inv_no` (`dispatching_inv_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatching_invoice`
--

LOCK TABLES `dispatching_invoice` WRITE;
/*!40000 ALTER TABLE `dispatching_invoice` DISABLE KEYS */;
INSERT INTO `dispatching_invoice` VALUES (1,'DIS-INV-20190704-1',0,'',3,'CI-INV-20190704-3',1,1,NULL,5,0,0,'For Delivery - COD',0.0000,0.0000,0.0000,8600.0000,8600.0000,0.0000,8600.0000,'2019-07-04','2019-07-04','2019-07-04 05:51:49','0000-00-00 00:00:00','2019-07-04 05:51:49',1,0,0,'\0','','\0','\0',0,1,1,'Angeles City','N/A',0,1);
/*!40000 ALTER TABLE `dispatching_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatching_invoice_items`
--

DROP TABLE IF EXISTS `dispatching_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispatching_invoice_items` (
  `dispatching_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dispatching_invoice_id` bigint(20) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `inv_price` decimal(20,4) DEFAULT '0.0000',
  `orig_so_price` decimal(20,4) DEFAULT '0.0000',
  `inv_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `cost_upon_invoice` decimal(20,4) DEFAULT '0.0000',
  `inv_qty` decimal(20,2) DEFAULT '0.00',
  `inv_gross` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  `inv_notes` varchar(100) DEFAULT NULL,
  `dr_invoice_id` int(11) DEFAULT NULL,
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`dispatching_item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatching_invoice_items`
--

LOCK TABLES `dispatching_invoice_items` WRITE;
/*!40000 ALTER TABLE `dispatching_invoice_items` DISABLE KEYS */;
INSERT INTO `dispatching_invoice_items` VALUES (1,1,17,5,1,1300.0000,0.0000,0.0000,0.0000,0.0000,0.0000,2.00,2600.0000,2600.0000,0.0000,2600.0000,2600.0000,NULL,NULL,'0000-00-00',''),(2,1,19,5,1,1200.0000,0.0000,0.0000,0.0000,0.0000,0.0000,5.00,6000.0000,6000.0000,0.0000,6000.0000,6000.0000,NULL,NULL,'0000-00-00','');
/*!40000 ALTER TABLE `dispatching_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_settings`
--

DROP TABLE IF EXISTS `email_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_settings` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `email_from` varchar(150) NOT NULL,
  `name_from` varchar(50) NOT NULL,
  `default_message` varchar(500) NOT NULL,
  `email_to` varchar(175) DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_settings`
--

LOCK TABLES `email_settings` WRITE;
/*!40000 ALTER TABLE `email_settings` DISABLE KEYS */;
INSERT INTO `email_settings` VALUES (1,'manaloraf03@gmail.com','xxseunghyunk216','','JDEV IT BUSINESS SOLUTION','This is the Default message from the Accounting System of JDEV Office Solutions',NULL),(2,'manaloraf03@gmail.com','Parkseunghyunk216','','JDEV OFFICE SOLUTION INC','This is a system generation report sent to you from the Accounting System of JDEV Office Solution Inc.','manaloraf03@gmail.com');
/*!40000 ALTER TABLE `email_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixed_assets`
--

DROP TABLE IF EXISTS `fixed_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fixed_assets` (
  `fixed_asset_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asset_code` varchar(55) DEFAULT '',
  `asset_description` varchar(555) DEFAULT '',
  `serial_no` varchar(155) DEFAULT '',
  `location_id` int(11) DEFAULT '0',
  `department_id` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `acquisition_cost` decimal(20,4) DEFAULT '0.0000',
  `salvage_value` decimal(20,4) DEFAULT '0.0000',
  `life_years` int(11) DEFAULT '0',
  `asset_status_id` int(11) DEFAULT '0',
  `date_acquired` date DEFAULT '0000-00-00',
  `remarks` varchar(1000) DEFAULT NULL,
  `date_posted` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` int(11) DEFAULT '0',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`fixed_asset_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_assets`
--

LOCK TABLES `fixed_assets` WRITE;
/*!40000 ALTER TABLE `fixed_assets` DISABLE KEYS */;
INSERT INTO `fixed_assets` VALUES (1,'10001','Office Chair','6531216510',1,1,1,350.0000,0.0000,5,1,'2019-07-04','','2019-07-04 02:13:05',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,1),(2,'1002','Table ','234556765432',1,1,1,1250.0000,1.0000,5,1,'2019-07-04','','2019-07-04 02:13:32',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,1);
/*!40000 ALTER TABLE `fixed_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_2307`
--

DROP TABLE IF EXISTS `form_2307`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_2307` (
  `form_2307_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint(20) DEFAULT '0',
  `date` date DEFAULT '0000-00-00',
  `payee_tin` varchar(145) DEFAULT NULL,
  `payee_name` varchar(245) DEFAULT NULL,
  `payee_address` varchar(445) DEFAULT NULL,
  `payor_name` varchar(245) DEFAULT NULL,
  `payor_tin` varchar(145) DEFAULT NULL,
  `payor_address` varchar(445) DEFAULT NULL,
  `gross_amount` decimal(20,2) DEFAULT '0.00',
  `deducted_amount` decimal(20,2) DEFAULT '0.00',
  `date_created` date DEFAULT '0000-00-00',
  `created_by_user` bigint(20) DEFAULT '0',
  `date_deleted` date DEFAULT '0000-00-00',
  `deleted_by_user` bigint(20) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`form_2307_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_2307`
--

LOCK TABLES `form_2307` WRITE;
/*!40000 ALTER TABLE `form_2307` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_2307` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generics`
--

DROP TABLE IF EXISTS `generics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generics` (
  `generic_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `generic_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`generic_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generics`
--

LOCK TABLES `generics` WRITE;
/*!40000 ALTER TABLE `generics` DISABLE KEYS */;
/*!40000 ALTER TABLE `generics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giftcards`
--

DROP TABLE IF EXISTS `giftcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giftcards` (
  `giftcard_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `giftcard_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`giftcard_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giftcards`
--

LOCK TABLES `giftcards` WRITE;
/*!40000 ALTER TABLE `giftcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `giftcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `initial_setup`
--

DROP TABLE IF EXISTS `initial_setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `initial_setup` (
  `initial_setup_id` int(11) NOT NULL,
  `setup_company_info` bit(1) DEFAULT NULL,
  `setup_general_configuration` bit(1) DEFAULT NULL,
  `setup_user_account` bit(1) DEFAULT NULL,
  `setup_complete` bit(1) DEFAULT NULL,
  PRIMARY KEY (`initial_setup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `initial_setup`
--

LOCK TABLES `initial_setup` WRITE;
/*!40000 ALTER TABLE `initial_setup` DISABLE KEYS */;
INSERT INTO `initial_setup` VALUES (1,'','','','');
/*!40000 ALTER TABLE `initial_setup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_counter`
--

DROP TABLE IF EXISTS `invoice_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_counter` (
  `counter_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `counter_start` bigint(20) DEFAULT '0',
  `counter_end` bigint(20) DEFAULT '0',
  `last_invoice` bigint(20) DEFAULT '0',
  PRIMARY KEY (`counter_id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_counter`
--

LOCK TABLES `invoice_counter` WRITE;
/*!40000 ALTER TABLE `invoice_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuance_department_info`
--

DROP TABLE IF EXISTS `issuance_department_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuance_department_info` (
  `issuance_department_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trn_no` varchar(75) DEFAULT '',
  `to_department_id` bigint(20) DEFAULT '0',
  `from_department_id` bigint(20) DEFAULT '0',
  `date_issued` date DEFAULT '0000-00-00',
  `terms` varchar(50) DEFAULT NULL,
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,2) DEFAULT '0.00',
  `total_before_tax` decimal(20,2) DEFAULT '0.00',
  `total_tax_amount` decimal(20,2) DEFAULT '0.00',
  `total_after_tax` decimal(20,2) DEFAULT '0.00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` int(11) DEFAULT '0',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_journal_posted_from` bit(1) DEFAULT b'0',
  `posted_by_from` int(11) DEFAULT '0',
  `date_posted_from` datetime DEFAULT '0000-00-00 00:00:00',
  `journal_id_from` bigint(20) DEFAULT '0',
  `is_journal_posted_to` bit(1) DEFAULT b'0',
  `posted_by_to` int(11) DEFAULT '0',
  `date_posted_to` datetime DEFAULT '0000-00-00 00:00:00',
  `journal_id_to` bigint(20) DEFAULT '0',
  PRIMARY KEY (`issuance_department_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuance_department_info`
--

LOCK TABLES `issuance_department_info` WRITE;
/*!40000 ALTER TABLE `issuance_department_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuance_department_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuance_department_items`
--

DROP TABLE IF EXISTS `issuance_department_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuance_department_items` (
  `issuance_department_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issuance_department_id` int(11) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `unit_id` int(11) DEFAULT '0',
  `issue_qty` decimal(20,2) DEFAULT '0.00',
  `issue_price` decimal(20,2) DEFAULT '0.00',
  `issue_discount` decimal(20,2) DEFAULT '0.00',
  `issue_tax_rate` decimal(11,2) DEFAULT '0.00',
  `issue_line_total_price` decimal(20,2) DEFAULT '0.00',
  `issue_line_total_discount` decimal(20,2) DEFAULT '0.00',
  `issue_tax_amount` decimal(20,2) DEFAULT '0.00',
  `issue_non_tax_amount` decimal(20,2) DEFAULT '0.00',
  `dr_invoice_id` bigint(20) DEFAULT '0',
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`issuance_department_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuance_department_items`
--

LOCK TABLES `issuance_department_items` WRITE;
/*!40000 ALTER TABLE `issuance_department_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuance_department_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuance_info`
--

DROP TABLE IF EXISTS `issuance_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuance_info` (
  `issuance_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `slip_no` varchar(75) DEFAULT '',
  `issued_department_id` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `issued_to_person` varchar(155) DEFAULT '',
  `total_discount` decimal(20,2) DEFAULT '0.00',
  `total_before_tax` decimal(20,2) DEFAULT '0.00',
  `total_tax_amount` decimal(20,2) DEFAULT '0.00',
  `total_after_tax` decimal(20,2) DEFAULT '0.00',
  `date_issued` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` int(11) DEFAULT '0',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `customer_id` int(11) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `terms` varchar(50) DEFAULT NULL,
  `is_for_pos` bit(1) DEFAULT b'0',
  `is_received` bit(1) DEFAULT b'0',
  `is_journal_posted` tinyint(1) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`issuance_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuance_info`
--

LOCK TABLES `issuance_info` WRITE;
/*!40000 ALTER TABLE `issuance_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuance_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuance_items`
--

DROP TABLE IF EXISTS `issuance_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuance_items` (
  `issuance_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issuance_id` int(11) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `unit_id` int(11) DEFAULT '0',
  `issue_qty` decimal(20,2) DEFAULT '0.00',
  `issue_price` decimal(20,2) DEFAULT '0.00',
  `issue_discount` decimal(20,2) DEFAULT '0.00',
  `issue_tax_rate` decimal(11,2) DEFAULT '0.00',
  `issue_line_total_price` decimal(20,2) DEFAULT '0.00',
  `issue_line_total_discount` decimal(20,2) DEFAULT '0.00',
  `issue_tax_amount` decimal(20,2) DEFAULT '0.00',
  `issue_non_tax_amount` decimal(20,2) DEFAULT '0.00',
  `dr_invoice_id` bigint(20) DEFAULT '0',
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`issuance_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuance_items`
--

LOCK TABLES `issuance_items` WRITE;
/*!40000 ALTER TABLE `issuance_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuance_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_types`
--

DROP TABLE IF EXISTS `item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_types` (
  `item_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type_code` varchar(20) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`item_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_types`
--

LOCK TABLES `item_types` WRITE;
/*!40000 ALTER TABLE `item_types` DISABLE KEYS */;
INSERT INTO `item_types` VALUES (1,'IP','Inventory','','','\0'),(2,'NP','Non-inventory','','','\0'),(3,'CP','Services','','','\0');
/*!40000 ALTER TABLE `item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_accounts`
--

DROP TABLE IF EXISTS `journal_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_accounts` (
  `journal_account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) DEFAULT '0',
  `account_id` int(11) DEFAULT '0',
  `memo` varchar(700) DEFAULT '',
  `dr_amount` decimal(25,2) DEFAULT '0.00',
  `cr_amount` decimal(25,2) DEFAULT '0.00',
  PRIMARY KEY (`journal_account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_accounts`
--

LOCK TABLES `journal_accounts` WRITE;
/*!40000 ALTER TABLE `journal_accounts` DISABLE KEYS */;
INSERT INTO `journal_accounts` VALUES (1,1,1,'',350000.00,0.00),(2,1,2,'',356250.00,0.00),(3,1,4,'',65000.00,0.00),(4,1,17,'',0.00,771250.00),(5,2,24,'',8500.00,0.00),(6,2,1,'',0.00,8500.00),(7,3,3,'',3500.00,0.00),(8,3,1,'',0.00,3500.00),(9,4,35,'',600.00,0.00),(10,4,1,'',0.00,600.00),(11,5,28,'',55700.00,0.00),(12,5,1,'',0.00,55700.00),(13,6,5,'',0.00,0.00),(14,6,19,'',0.00,0.00),(15,7,5,'',15000.00,0.00),(16,7,19,'',0.00,15000.00),(17,8,41,'',57000.00,0.00),(18,8,1,'',0.00,57000.00),(19,9,55,'',3800.00,0.00),(20,9,1,'',0.00,3800.00),(21,10,5,'',150000.00,0.00),(22,10,19,'',0.00,150000.00),(23,11,34,'',100.00,0.00),(24,11,3,'',0.00,100.00),(27,13,77,'',120.00,0.00),(28,13,3,'',0.00,120.00),(29,14,24,'',370.00,0.00),(30,14,3,'',0.00,370.00),(31,12,76,'',70.00,0.00),(32,12,3,'',0.00,70.00),(33,15,1,'',112000.00,0.00),(34,15,19,'',0.00,112000.00),(35,16,1,'',90000.00,0.00),(36,16,19,'',0.00,90000.00),(37,17,1,'',135000.00,0.00),(38,17,19,'',0.00,135000.00),(39,18,1,'',152000.00,0.00),(40,18,19,'',0.00,152000.00),(41,19,19,'',0.00,1317.49),(42,19,59,'',0.00,112.51),(43,19,5,'',1430.00,0.00),(44,20,19,'',0.00,1374.10),(45,20,59,'',0.00,164.90),(46,20,5,'',1539.00,0.00),(47,21,5,'',15000.00,0.00),(48,21,19,'',0.00,15000.00),(49,22,5,'',3000.00,0.00),(50,22,19,'',0.00,3000.00),(51,23,1,'',30003.00,0.00),(52,23,19,'',0.00,30003.00);
/*!40000 ALTER TABLE `journal_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_entry_templates`
--

DROP TABLE IF EXISTS `journal_entry_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_entry_templates` (
  `entry_template_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_id` bigint(20) DEFAULT '0',
  `account_id` bigint(20) DEFAULT '0',
  `memo` varchar(1000) DEFAULT '',
  `dr_amount` decimal(20,4) DEFAULT '0.0000',
  `cr_amount` decimal(20,4) DEFAULT '0.0000',
  PRIMARY KEY (`entry_template_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_entry_templates`
--

LOCK TABLES `journal_entry_templates` WRITE;
/*!40000 ALTER TABLE `journal_entry_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal_entry_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_info`
--

DROP TABLE IF EXISTS `journal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_info` (
  `journal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `txn_no` varchar(55) DEFAULT '',
  `department_id` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `supplier_id` int(11) DEFAULT '0',
  `remarks` varchar(555) DEFAULT '',
  `book_type` varchar(20) DEFAULT '',
  `date_txn` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` int(11) DEFAULT '0',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by_user` int(11) DEFAULT '0',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_by_user` int(11) DEFAULT '0',
  `date_cancelled` datetime DEFAULT '0000-00-00 00:00:00',
  `cancelled_by_user` int(11) DEFAULT '0',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `payment_method_id` int(11) DEFAULT '0',
  `bank` varchar(10) DEFAULT '',
  `check_no` varchar(20) DEFAULT '',
  `check_date` date DEFAULT '0000-00-00',
  `ref_type` varchar(4) DEFAULT '',
  `ref_no` varchar(25) DEFAULT '',
  `amount` decimal(10,2) DEFAULT '0.00',
  `or_no` varchar(50) DEFAULT '',
  `check_status` tinyint(4) DEFAULT '0',
  `accounting_period_id` bigint(20) DEFAULT '0',
  `is_replenished` tinyint(1) DEFAULT '0',
  `batch_id` int(11) DEFAULT '0',
  `bank_id` int(11) DEFAULT '0',
  `is_reconciled` tinyint(4) DEFAULT '0',
  `is_sales` tinyint(4) DEFAULT '0',
  `pos_integration_id` bigint(20) DEFAULT '0',
  `hotel_integration_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`journal_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_info`
--

LOCK TABLES `journal_info` WRITE;
/*!40000 ALTER TABLE `journal_info` DISABLE KEYS */;
INSERT INTO `journal_info` VALUES (1,'TXN-20190704-1',1,0,1,'','GJE','2019-07-04','2019-07-04 01:21:24',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','','',0.00,'',0,0,0,0,0,0,0,0,0),(2,'TXN-20190704-2',1,0,2,'','CDJ','2019-07-04','2019-07-04 01:22:48',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',1,'','','1970-01-01','CV','01',8500.00,'',0,0,0,0,NULL,0,0,0,0),(3,'TXN-20190704-3',1,0,1,'Establishment of Petty Cash','CDJ','2019-07-04','2019-07-04 01:23:23',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',1,'','','1970-01-01','CV','02',3500.00,'',0,0,0,0,NULL,0,0,0,0),(4,'TXN-20190704-4',1,0,3,'For the months May and June','CDJ','2019-07-04','2019-07-04 01:24:19',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',1,'','','1970-01-01','CV','03',600.00,'',0,0,0,0,NULL,0,0,0,0),(5,'TXN-20190704-5',1,0,1,'Salaries for Security Personnel','CDJ','2019-07-04','2019-07-04 01:26:14',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',1,'','','1970-01-01','CV','04',55700.00,'',0,0,0,0,NULL,0,0,0,0),(6,'TXN-20190704-6',1,2,0,'Establishment for A/R','SJE','2019-07-04','2019-07-04 01:28:03',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','',NULL,0.00,'',0,0,0,0,0,0,1,0,0),(7,'TXN-20190704-7',1,3,0,'Establishment of A/R','SJE','2019-07-04','2019-07-04 01:29:09',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','',NULL,0.00,'',0,0,0,0,0,0,1,0,0),(8,'TXN-20190704-8',1,0,4,'Payment for Purchases  July 4, 2019 REC # 3345','PJE','2019-07-04','2019-07-04 01:30:01',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','',NULL,0.00,'',0,0,0,0,0,0,0,0,0),(9,'TXN-20190704-9',1,0,1,'Purchase of Benmore Scoth','PJE','2019-07-04','2019-07-04 02:04:01',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','','P-INV-20190704-3',0.00,'',0,0,0,0,0,0,0,0,0),(10,'TXN-20190704-10',1,4,0,'','SJE','2019-07-04','2019-07-04 02:05:01',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','',NULL,0.00,'',0,0,0,0,0,0,1,0,0),(11,'PCV-20190704-11',1,0,1,'Garbage Expense','PCV','2019-07-04','2019-07-04 02:06:40',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','','PCV-01',100.00,'',0,0,0,0,0,0,0,0,0),(12,'PCV-20190704-12',1,0,1,'Transportation Expense for Mam Jerich','PCV','2019-07-04','2019-07-04 02:07:25',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','','PCV-02',70.00,'',0,0,0,0,0,0,0,0,0),(13,'PCV-20190704-13',1,0,1,'Toll Fee going to Manila','PCV','2019-07-04','2019-07-04 02:07:52',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','','PCV03',120.00,'',0,0,0,0,0,0,0,0,0),(14,'PCV-20190704-14',1,0,1,'Office Toiletries and Alcohol','PCV','2019-07-04','2019-07-04 02:08:36',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','','PCV04',370.00,'',0,0,0,0,0,0,0,0,0),(15,'TXN-20190704-15',1,1,0,'Sales for the day July 3, 2019 ','CRJ','2019-07-03','2019-07-04 02:10:07',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',1,'',NULL,'1970-01-01','',NULL,112000.00,'',0,0,0,0,NULL,0,0,0,0),(16,'TXN-20190704-16',1,1,0,'Sales for the day July 2, 2019 ','CRJ','2019-07-02','2019-07-04 02:10:32',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',1,'',NULL,'1970-01-01','',NULL,90000.00,'',0,0,0,0,NULL,0,0,0,0),(17,'TXN-20190704-17',1,1,0,'Sales for the day July 2, 2019 ','CRJ','2019-07-02','2019-07-04 02:11:08',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',1,'',NULL,'1970-01-01','',NULL,135000.00,'',0,0,0,0,NULL,0,0,0,0),(18,'TXN-20190704-18',1,1,0,'Sales for the day July 1, 2019 ','CRJ','2019-07-01','2019-07-04 02:11:39',1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',1,'',NULL,'1970-01-01','',NULL,152000.00,'',0,0,0,0,NULL,0,0,0,0),(19,'TXN-20190903-19',1,4,0,'','SJE','2019-07-04','2019-09-03 15:02:26',7,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','','SAL-INV-20190704-2',0.00,'',0,0,0,0,0,0,1,0,0),(20,'TXN-20190903-20',1,4,0,'','SJE','2018-12-10','2019-09-03 15:02:42',7,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','','SAL-INV-20190704-1',0.00,'',0,0,0,0,0,0,1,0,0),(21,'TXN-20190903-21',1,3,0,'','SJE','2019-09-03','2019-09-03 15:03:04',7,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','',NULL,0.00,'',0,0,0,0,0,0,1,0,0),(22,'TXN-20190903-22',1,4,0,'','SJE','2019-09-03','2019-09-03 15:03:37',7,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','',NULL,0.00,'',0,0,0,0,0,0,1,0,0),(23,'TXN-20190903-23',2,4,0,'','SJE','2019-09-03','2019-09-03 15:07:29',7,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'\0','',0,'','','0000-00-00','',NULL,0.00,'',0,0,0,0,0,0,1,0,0);
/*!40000 ALTER TABLE `journal_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_templates_info`
--

DROP TABLE IF EXISTS `journal_templates_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_templates_info` (
  `template_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_code` varchar(155) DEFAULT '',
  `payee` varchar(1000) DEFAULT '',
  `template_description` varchar(1000) DEFAULT '',
  `supplier_id` bigint(20) DEFAULT '0',
  `customer_id` bigint(20) DEFAULT '0',
  `method_id` bigint(20) DEFAULT '0',
  `amount` decimal(20,4) DEFAULT '0.0000',
  `remarks` varchar(1000) DEFAULT '',
  `posted_by` int(11) DEFAULT NULL,
  `book_type` varchar(5) DEFAULT '',
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`template_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_templates_info`
--

LOCK TABLES `journal_templates_info` WRITE;
/*!40000 ALTER TABLE `journal_templates_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal_templates_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `location_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`location_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'HR Office','\0','');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `chat_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` int(11) DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`chat_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_layout`
--

DROP TABLE IF EXISTS `module_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_layout` (
  `module_layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) DEFAULT '0',
  `display_text` varchar(100) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `pos_top` decimal(10,0) DEFAULT NULL,
  `pos_bottom` decimal(10,0) DEFAULT NULL,
  `pos_left` decimal(10,0) DEFAULT NULL,
  `pos_right` decimal(10,0) DEFAULT NULL,
  `font` varchar(100) DEFAULT NULL,
  `font_color` varchar(45) DEFAULT NULL,
  `font_size` decimal(10,0) DEFAULT NULL,
  `is_bold` varchar(120) DEFAULT '0',
  `is_italic` varchar(120) DEFAULT '0',
  `height` decimal(10,0) DEFAULT NULL,
  `width` decimal(10,0) DEFAULT NULL,
  `tag` varchar(45) DEFAULT NULL,
  `parent` varchar(50) DEFAULT 'header',
  PRIMARY KEY (`module_layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_layout`
--

LOCK TABLES `module_layout` WRITE;
/*!40000 ALTER TABLE `module_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_source`
--

DROP TABLE IF EXISTS `order_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_source` (
  `order_source_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_source_name` varchar(145) DEFAULT '',
  `order_source_description` varchar(145) DEFAULT '',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`order_source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_source`
--

LOCK TABLES `order_source` WRITE;
/*!40000 ALTER TABLE `order_source` DISABLE KEYS */;
INSERT INTO `order_source` VALUES (1,'Walk In','Walk In','\0',''),(2,'Shopee','Shopee','\0',''),(3,'Lazada','Lazada','\0','');
/*!40000 ALTER TABLE `order_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status` varchar(75) DEFAULT '',
  `order_description` varchar(555) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`order_status_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'Open','','','\0'),(2,'Closed','','','\0'),(3,'Partially received','','','\0');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payable_payments`
--

DROP TABLE IF EXISTS `payable_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payable_payments` (
  `payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(75) DEFAULT '',
  `supplier_id` bigint(20) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `receipt_type` varchar(55) DEFAULT '',
  `department_id` bigint(20) DEFAULT '0',
  `payment_method_id` int(11) DEFAULT '0',
  `check_date_type` tinyint(4) DEFAULT '1' COMMENT '1 is Date, 2 is PDC',
  `check_date` date DEFAULT '0000-00-00',
  `check_no` varchar(100) DEFAULT '',
  `remarks` varchar(755) DEFAULT '',
  `total_paid_amount` decimal(20,2) DEFAULT '0.00',
  `date_paid` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_cancelled` datetime DEFAULT '0000-00-00 00:00:00',
  `cancelled_by_user` int(11) DEFAULT '0',
  `created_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_posted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`payment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payable_payments`
--

LOCK TABLES `payable_payments` WRITE;
/*!40000 ALTER TABLE `payable_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payable_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payable_payments_list`
--

DROP TABLE IF EXISTS `payable_payments_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payable_payments_list` (
  `payment_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_id` bigint(20) DEFAULT '0',
  `dr_invoice_id` bigint(20) DEFAULT '0',
  `payable_amount` decimal(20,2) DEFAULT '0.00',
  `payment_amount` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`payment_list_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payable_payments_list`
--

LOCK TABLES `payable_payments_list` WRITE;
/*!40000 ALTER TABLE `payable_payments_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `payable_payments_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_methods` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(100) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`payment_method_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,'Cash','','\0'),(2,'Check','','\0'),(3,'Card','','\0');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `po_attachments`
--

DROP TABLE IF EXISTS `po_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `po_attachments` (
  `po_attachment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) DEFAULT '0',
  `orig_file_name` varchar(255) DEFAULT '',
  `server_file_directory` varchar(800) DEFAULT '',
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by_user` int(11) DEFAULT '0',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`po_attachment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `po_attachments`
--

LOCK TABLES `po_attachments` WRITE;
/*!40000 ALTER TABLE `po_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `po_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `po_messages`
--

DROP TABLE IF EXISTS `po_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `po_messages` (
  `po_message_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint(20) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `message` text,
  `date_posted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`po_message_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `po_messages`
--

LOCK TABLES `po_messages` WRITE;
/*!40000 ALTER TABLE `po_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `po_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `print_layout`
--

DROP TABLE IF EXISTS `print_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `print_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_name` varchar(755) NOT NULL,
  `layout_description` varchar(1000) DEFAULT NULL,
  `is_portrait` bit(1) NOT NULL DEFAULT b'1',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `print_layout`
--

LOCK TABLES `print_layout` WRITE;
/*!40000 ALTER TABLE `print_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `print_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_batch_inventory`
--

DROP TABLE IF EXISTS `product_batch_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_batch_inventory` (
  `product_key` varchar(100) NOT NULL,
  `product_id` bigint(20) DEFAULT '0',
  `batch_no` varchar(55) DEFAULT '',
  `exp_date` date DEFAULT '0000-00-00',
  `batch_exp_on_hand` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`product_key`) USING BTREE,
  UNIQUE KEY `product_key` (`product_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_batch_inventory`
--

LOCK TABLES `product_batch_inventory` WRITE;
/*!40000 ALTER TABLE `product_batch_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_batch_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(255) DEFAULT '',
  `product_desc` varchar(255) DEFAULT '',
  `product_desc1` varchar(255) DEFAULT '',
  `is_bulk` tinyint(1) DEFAULT '0',
  `primary_unit` bit(1) DEFAULT b'1',
  `parent_unit_id` bigint(20) DEFAULT '0',
  `child_unit_desc` varchar(175) DEFAULT '0',
  `child_unit_id` bigint(20) DEFAULT '0',
  `size` varchar(255) DEFAULT '',
  `supplier_id` bigint(20) DEFAULT '0',
  `tax_type_id` bigint(20) DEFAULT '0',
  `refproduct_id` int(10) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `department_id` int(11) DEFAULT '2' COMMENT '1 - Hotel , 2 -  POS',
  `equivalent_points` decimal(20,2) DEFAULT '0.00',
  `product_warn` decimal(16,2) DEFAULT '0.00',
  `product_ideal` decimal(16,2) DEFAULT '0.00',
  `purchase_cost` decimal(20,4) DEFAULT '0.0000',
  `purchase_cost_2` decimal(20,4) DEFAULT '0.0000',
  `markup_percent` decimal(16,4) DEFAULT '0.0000',
  `sale_price` decimal(16,4) DEFAULT '0.0000',
  `whole_sale` decimal(16,4) DEFAULT '0.0000',
  `retailer_price` decimal(16,4) DEFAULT '0.0000',
  `special_disc` decimal(16,4) DEFAULT '0.0000',
  `discounted_price` decimal(16,4) DEFAULT '0.0000',
  `dealer_price` decimal(16,4) DEFAULT '0.0000',
  `distributor_price` decimal(16,4) DEFAULT '0.0000',
  `public_price` decimal(16,4) DEFAULT '0.0000',
  `valued_customer` decimal(16,4) DEFAULT '0.0000',
  `income_account_id` bigint(20) DEFAULT '0',
  `expense_account_id` bigint(20) DEFAULT '0',
  `on_hand` decimal(20,2) DEFAULT '0.00',
  `item_type_id` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_inventory` bit(1) DEFAULT b'1',
  `is_tax_exempt` bit(1) DEFAULT b'0',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `brand_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Baby Back Ribs','Baby Back Ribs\r\n','',0,'',2,'0',NULL,NULL,4,2,NULL,1,2,0.00,0.00,0.00,340.0000,0.0000,0.0000,340.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,6.00,1,'2019-07-04 01:45:48','2019-07-04 01:47:23','0000-00-00 00:00:00',1,1,0,'','\0','','',1),(2,'Benmore Scoth','Benmore Scoth\r\n','Benmore Scoth\r\n',0,'',3,'0',NULL,NULL,3,1,NULL,1,2,0.00,0.00,0.00,380.0000,0.0000,0.0000,380.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,65.00,1,'2019-07-04 01:46:15','2019-07-04 01:47:13','0000-00-00 00:00:00',1,1,0,'','\0','','',1),(3,'Knox Unflavor Gelatin','Knox Unflavor Gelatin\r\n','Knox Unflavor Gelatin\r\n',0,'',4,'0',NULL,NULL,1,2,NULL,1,2,0.00,0.00,0.00,95.0000,0.0000,0.0000,95.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,65.00,1,'2019-07-04 01:46:42','2019-07-04 01:47:27','0000-00-00 00:00:00',1,1,0,'','\0','','',1),(4,' New Zealand Mussels ',' New Zealand Mussels \r\n',' New Zealand Mussels \r\n',0,'',2,'0',NULL,NULL,1,2,NULL,1,2,0.00,0.00,0.00,440.0000,0.0000,0.0000,440.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,12.00,1,'2019-07-04 01:47:07','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','','',1),(5,' Scallop Meat (Large)',' Scallop Meat (Large)\r\n',' Scallop Meat (Large)\r\n',0,'',5,'0',NULL,NULL,4,2,NULL,1,2,0.00,0.00,0.00,400.0000,0.0000,0.0000,400.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,6.00,1,'2019-07-04 01:48:02','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','','',1),(6,' Shrimp Frozen ',' Shrimp Frozen \r\n',' Shrimp Frozen \r\n',0,'',5,'0',NULL,NULL,4,2,NULL,1,2,0.00,0.00,0.00,420.0000,0.0000,0.0000,420.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,10.00,1,'2019-07-04 01:48:25','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','','',1),(7,'Mini Unsalted Butter','Mini Unsalted Butter\r\n','Mini Unsalted Butter\r\n',0,'',2,'0',NULL,NULL,4,2,NULL,1,2,0.00,0.00,0.00,1300.0000,0.0000,0.0000,1300.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,84.00,1,'2019-07-04 01:49:11','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','','',1),(8,'Kirkland Red Pepper','Kirkland Red Pepper\r\n','Kirkland Red Pepper\r\n',0,'',3,'0',NULL,NULL,4,2,NULL,1,2,0.00,0.00,0.00,350.0000,0.0000,0.0000,350.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,35.00,1,'2019-07-04 01:49:37','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','','',1),(9,'Campbell tomato Juice','Campbell tomato Juice\r\n','Campbell tomato Juice\r\n',0,'',2,'0',NULL,NULL,1,2,NULL,1,2,0.00,0.00,0.00,1176.0000,0.0000,0.0000,1176.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,67.00,1,'2019-07-04 01:50:02','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','','',1),(10,'Lobster Tail','Lobster Tail','Lobster Tail',0,'',5,'0',NULL,NULL,4,2,NULL,1,2,0.00,0.00,0.00,2311.0000,0.0000,0.0000,2311.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,26.00,1,'2019-07-04 01:50:30','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','','',1),(11,'Mccormick bay leaves whole','Mccormick bay leaves whole\r\n','Mccormick bay leaves whole\r\n',0,'',3,'0',NULL,NULL,4,2,NULL,1,2,0.00,0.00,0.00,340.0000,0.0000,0.0000,340.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,90.00,1,'2019-07-04 01:50:52','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','','',1),(12,'Angus Burger Patties','Angus Burger Patties\r\n','Angus Burger Patties\r\n',0,'',4,'0',NULL,NULL,4,2,NULL,1,2,0.00,0.00,0.00,470.0000,0.0000,0.0000,470.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,48.00,1,'2019-07-04 01:51:35','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','','',1),(13,'Asparagus','Asparagus\r\n','Asparagus\r\n',0,'',4,'0',NULL,NULL,4,2,NULL,1,2,0.00,0.00,0.00,180.0000,0.0000,0.0000,180.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,60.00,1,'2019-07-04 01:52:06','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','','',1),(14,'Bacon','Bacon\r\n','Bacon\r\n',0,'',4,'0',NULL,NULL,4,2,NULL,1,2,0.00,0.00,0.00,395.0000,0.0000,0.0000,395.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,18.00,1,'2019-07-04 01:52:39','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','','',1),(15,'Cajun Seasoning','Cajun Seasoning\r\n','Cajun Seasoning\r\n',0,'',4,'0',NULL,NULL,4,2,NULL,1,2,0.00,0.00,0.00,69.0000,0.0000,0.0000,69.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,75.00,1,'2019-07-04 01:53:37','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','','',1),(16,'Canadian Club','Canadian Club\r\n','Canadian Club\r\n',0,'',3,'0',NULL,NULL,1,2,NULL,1,2,0.00,0.00,0.00,1100.0000,0.0000,0.0000,1100.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,17.00,1,'2019-07-04 01:54:12','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','','',1),(17,'10001','Afzal Shisha Tobacco Double Apple 1Kl','Afzal Shisha Tobacco Double Apple 1Kl',0,'',5,'0',NULL,NULL,1,2,NULL,5,2,0.00,10.00,100.00,1000.0000,0.0000,0.0000,1300.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,422.00,1,'2019-07-04 05:16:39','2019-07-04 06:06:11','0000-00-00 00:00:00',1,1,0,'','\0','\0','',69),(18,'10002','Afzal Shisha Tobacco Double Apple 50G','Afzal Shisha Tobacco Double Apple 50G',0,'',6,'0',NULL,NULL,1,2,NULL,5,2,0.00,10.00,1000.00,100.0000,0.0000,0.0000,100.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,250.00,1,'2019-07-04 05:26:29','2019-07-04 06:06:15','0000-00-00 00:00:00',1,1,0,'','\0','\0','',69),(19,'10003','Afzal Shisha Tobacco Mint 1Kl','Afzal Shisha Tobacco Mint 1Kl',0,'',5,'0',NULL,NULL,1,2,NULL,3,2,0.00,10.00,1000.00,1000.0000,0.0000,0.0000,1200.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,203.00,1,'2019-07-04 05:27:36','2019-07-04 06:06:19','0000-00-00 00:00:00',1,1,0,'','\0','\0','',69),(20,'10004','Azure Gold ST Bermuba Mint 250G','Azure Gold ST Bermuba Mint 250G',0,'',6,'0',NULL,NULL,1,2,NULL,4,2,0.00,10.00,100.00,200.0000,0.0000,0.0000,250.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,0.00,1,'2019-07-04 05:37:17','2019-07-04 06:06:23','0000-00-00 00:00:00',1,1,0,'','\0','\0','',70),(21,'10005','Alfakher ST Double Apple 1Kl','Alfakher ST Double Apple 1Kl',0,'',5,'0',NULL,NULL,1,2,NULL,5,2,0.00,10.00,100.00,1000.0000,0.0000,0.0000,1200.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,65.00,1,'2019-07-04 05:38:43','2019-07-04 06:06:26','0000-00-00 00:00:00',1,1,0,'','\0','\0','',71),(22,'10006','Alfacker ST Mint 1Kl','Alfacker ST Mint 1Kl',0,'',6,'0',NULL,NULL,1,2,NULL,3,2,0.00,10.00,100.00,1000.0000,0.0000,0.0000,1200.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,49.00,1,'2019-07-04 05:40:42','2019-07-04 06:06:30','0000-00-00 00:00:00',1,1,0,'','\0','\0','',71),(23,'Insurance','Insurance','',0,'',7,'0',NULL,NULL,1,2,NULL,1,2,0.00,0.00,0.00,1.0000,0.0000,0.0000,1.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,1.00,2,'2019-07-04 06:12:37','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','\0','',1),(24,'Transport','Transport','',0,'',7,'0',NULL,NULL,1,2,NULL,1,2,0.00,0.00,0.00,1.0000,0.0000,0.0000,1.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,1.00,2,'2019-07-04 06:12:58','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','\0','',1),(25,'Customs Duty','Customs Duty','Customs Duty',0,'',5,'0',NULL,NULL,1,2,NULL,1,2,0.00,0.00,0.00,1.0000,0.0000,0.0000,1.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,1.00,2,'2019-07-04 06:13:24','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','\0','',1),(26,'Excise Tax','Excise Tax','',0,'',7,'0',NULL,NULL,1,2,NULL,1,2,0.00,0.00,0.00,1.0000,0.0000,0.0000,1.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,0.00,1,'2019-07-04 06:14:05','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','','',1),(27,'Inspection Fee','Inspection Fee','',0,'',7,'0',NULL,NULL,1,2,NULL,1,2,0.00,0.00,0.00,1.0000,0.0000,0.0000,1.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,0.00,2,'2019-07-04 06:14:26','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','\0','',1),(28,'NTA Charges','NTA Charges','',0,'',7,'0',NULL,NULL,1,2,NULL,1,2,0.00,0.00,0.00,1.0000,0.0000,0.0000,1.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,0.00,2,'2019-07-04 06:14:46','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','\0','',1),(29,'Storage Charges','Storage Charges','Storage Charges',0,'',7,'0',NULL,NULL,1,2,NULL,1,2,0.00,0.00,0.00,1.0000,0.0000,0.0000,1.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,19,55,0.00,1,'2019-07-04 06:15:09','0000-00-00 00:00:00','0000-00-00 00:00:00',1,0,0,'','\0','','',1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proforma_invoice`
--

DROP TABLE IF EXISTS `proforma_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proforma_invoice` (
  `proforma_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proforma_inv_no` varchar(75) DEFAULT '',
  `sales_order_id` bigint(20) DEFAULT '0',
  `sales_order_no` varchar(75) DEFAULT '',
  `order_status_id` int(11) DEFAULT '1' COMMENT '1 is open 2 is closed 3 is partially, used in delivery_receipt',
  `department_id` int(11) DEFAULT '0',
  `issue_to_department` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `customer_name` varchar(175) NOT NULL,
  `journal_id` bigint(20) DEFAULT '0',
  `terms` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `date_due` date DEFAULT '0000-00-00',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `ref_product_type_id` int(11) DEFAULT '0',
  `inv_type` int(11) DEFAULT '1',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT '',
  `contact_person` varchar(175) DEFAULT NULL,
  PRIMARY KEY (`proforma_invoice_id`) USING BTREE,
  UNIQUE KEY `proforma_inv_no` (`proforma_inv_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proforma_invoice`
--

LOCK TABLES `proforma_invoice` WRITE;
/*!40000 ALTER TABLE `proforma_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `proforma_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proforma_invoice_items`
--

DROP TABLE IF EXISTS `proforma_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proforma_invoice_items` (
  `proforma_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proforma_invoice_id` bigint(20) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT '0',
  `inv_price` decimal(20,4) DEFAULT '0.0000',
  `orig_so_price` decimal(20,4) DEFAULT '0.0000',
  `inv_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `cost_upon_invoice` decimal(20,4) DEFAULT '0.0000',
  `inv_qty` decimal(20,0) DEFAULT '0',
  `inv_gross` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  `inv_notes` varchar(100) DEFAULT NULL,
  `dr_invoice_id` int(11) DEFAULT NULL,
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`proforma_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proforma_invoice_items`
--

LOCK TABLES `proforma_invoice_items` WRITE;
/*!40000 ALTER TABLE `proforma_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `proforma_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order` (
  `purchase_order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `po_no` varchar(75) DEFAULT '',
  `terms` varchar(55) DEFAULT '',
  `duration` varchar(55) DEFAULT '',
  `deliver_to_address` varchar(755) DEFAULT '',
  `supplier_id` int(11) DEFAULT '0',
  `department_id` bigint(20) DEFAULT '0',
  `tax_type_id` int(11) DEFAULT '0',
  `contact_person` varchar(100) DEFAULT '',
  `remarks` varchar(155) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) NOT NULL,
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `approval_id` int(11) DEFAULT '2',
  `order_status_id` int(11) DEFAULT '1',
  `is_email_sent` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_approved` datetime DEFAULT '0000-00-00 00:00:00',
  `approved_by_user` int(11) DEFAULT '0',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  PRIMARY KEY (`purchase_order_id`) USING BTREE,
  UNIQUE KEY `po_no` (`po_no`) USING BTREE,
  UNIQUE KEY `po_no_2` (`po_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
INSERT INTO `purchase_order` VALUES (1,'PO-20190704-1','',NULL,'Office',4,1,1,'','',0.0000,57689.2800,6922.7200,64612.0000,0.0000,0.0000,64612.0000,2,1,'\0','','\0','2019-07-04 01:55:37','2019-07-04 01:55:37','0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,0,0),(2,'PO-20190704-2','',NULL,'Office',4,1,1,'','',0.0000,41121.9600,3293.0400,44415.0000,0.0000,0.0000,44415.0000,2,1,'\0','','\0','2019-07-04 01:56:32','2019-07-04 01:56:32','0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,0,0),(3,'PO-20190704-3','',NULL,'office',1,1,1,'','',0.0000,102648.2100,11861.7900,114510.0000,0.0000,0.0000,114510.0000,1,3,'\0','','\0','2019-07-04 01:57:38','2019-07-04 02:03:32','0000-00-00 00:00:00','2019-07-04 01:57:45',1,1,0,0),(4,'PO-20190903-4','',NULL,'1',1,1,2,'','',210.0000,1518.7400,182.2600,1701.0000,10.0000,189.0000,1701.0000,1,2,'\0','','\0','2019-09-03 15:08:57','2019-09-03 07:10:51','0000-00-00 00:00:00','2019-09-03 15:09:00',7,7,0,0);
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_items`
--

DROP TABLE IF EXISTS `purchase_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_items` (
  `po_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int(11) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `is_parent` int(11) DEFAULT '1',
  `unit_id` int(11) DEFAULT '0',
  `po_price` decimal(20,4) DEFAULT '0.0000',
  `po_discount` decimal(20,4) DEFAULT '0.0000',
  `po_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `po_tax_rate` decimal(11,4) DEFAULT '0.0000',
  `po_qty` decimal(20,2) DEFAULT '0.00',
  `po_line_total` decimal(20,4) DEFAULT '0.0000',
  `tax_amount` decimal(20,4) DEFAULT '0.0000',
  `non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `po_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  PRIMARY KEY (`po_item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_items`
--

LOCK TABLES `purchase_order_items` WRITE;
/*!40000 ALTER TABLE `purchase_order_items` DISABLE KEYS */;
INSERT INTO `purchase_order_items` VALUES (1,1,12,1,4,470.0000,0.0000,0.0000,12.0000,15.00,7050.0000,755.3600,6294.6400,0.0000),(2,1,13,1,4,180.0000,0.0000,0.0000,12.0000,30.00,5400.0000,578.5700,4821.4300,0.0000),(3,1,4,1,2,440.0000,0.0000,0.0000,12.0000,26.00,11440.0000,1225.7100,10214.2900,0.0000),(4,1,15,1,4,69.0000,0.0000,0.0000,12.0000,15.00,1035.0000,110.8900,924.1100,0.0000),(5,1,9,1,2,1176.0000,0.0000,0.0000,12.0000,7.00,8232.0000,882.0000,7350.0000,0.0000),(6,1,16,1,3,1100.0000,0.0000,0.0000,12.0000,15.00,16500.0000,1767.8600,14732.1400,0.0000),(7,1,11,1,3,340.0000,0.0000,0.0000,12.0000,10.00,3400.0000,364.2900,3035.7100,0.0000),(8,1,10,1,5,2311.0000,0.0000,0.0000,12.0000,5.00,11555.0000,1238.0400,10316.9600,0.0000),(9,2,12,1,4,470.0000,0.0000,0.0000,12.0000,15.00,7050.0000,755.3600,6294.6400,0.0000),(10,2,13,1,4,180.0000,0.0000,0.0000,12.0000,17.00,3060.0000,327.8600,2732.1400,0.0000),(11,2,5,1,5,400.0000,0.0000,0.0000,12.0000,18.00,7200.0000,771.4300,6428.5700,0.0000),(12,2,6,1,5,420.0000,0.0000,0.0000,12.0000,18.00,7560.0000,810.0000,6750.0000,0.0000),(13,2,2,1,3,380.0000,0.0000,0.0000,0.0000,36.00,13680.0000,0.0000,13680.0000,0.0000),(14,2,15,1,4,69.0000,0.0000,0.0000,12.0000,85.00,5865.0000,628.3900,5236.6100,0.0000),(15,3,12,1,4,470.0000,0.0000,0.0000,12.0000,85.00,39950.0000,4280.3600,35669.6400,0.0000),(16,3,6,1,5,420.0000,0.0000,0.0000,12.0000,63.00,26460.0000,2835.0000,23625.0000,0.0000),(17,3,2,1,3,380.0000,0.0000,0.0000,0.0000,10.00,3800.0000,0.0000,3800.0000,0.0000),(18,3,5,1,5,400.0000,0.0000,0.0000,12.0000,95.00,38000.0000,4071.4300,33928.5700,0.0000),(19,3,13,1,4,180.0000,0.0000,0.0000,12.0000,35.00,6300.0000,675.0000,5625.0000,0.0000),(20,4,17,1,5,1000.0000,10.0000,100.0000,12.0000,1.00,900.0000,86.7900,723.2100,810.0000),(21,4,18,1,6,100.0000,10.0000,10.0000,12.0000,1.00,90.0000,8.6800,72.3200,81.0000),(22,4,19,1,5,1000.0000,10.0000,100.0000,12.0000,1.00,900.0000,86.7900,723.2100,810.0000);
/*!40000 ALTER TABLE `purchase_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasing_integration`
--

DROP TABLE IF EXISTS `purchasing_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchasing_integration` (
  `purchasing_integration_id` int(11) NOT NULL DEFAULT '0',
  `iss_supplier_id` bigint(20) DEFAULT '0',
  `iss_debit_id` bigint(20) DEFAULT '0',
  `iss_credit_id` bigint(20) DEFAULT '0',
  `adj_supplier_id` bigint(20) DEFAULT '0',
  `adj_debit_id` bigint(20) DEFAULT '0',
  `adj_credit_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`purchasing_integration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasing_integration`
--

LOCK TABLES `purchasing_integration` WRITE;
/*!40000 ALTER TABLE `purchasing_integration` DISABLE KEYS */;
INSERT INTO `purchasing_integration` VALUES (1,1,51,0,1,51,1);
/*!40000 ALTER TABLE `purchasing_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receivable_payments`
--

DROP TABLE IF EXISTS `receivable_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receivable_payments` (
  `payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(20) DEFAULT '',
  `customer_id` int(11) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `receipt_type` varchar(55) DEFAULT 'AR',
  `department_id` int(11) DEFAULT '0',
  `payment_method_id` int(11) DEFAULT '0',
  `check_date_type` tinyint(4) DEFAULT '1' COMMENT '1 is Date, 2 is PDC',
  `check_date` date DEFAULT '0000-00-00',
  `check_no` varchar(100) DEFAULT '',
  `remarks` varchar(755) DEFAULT '',
  `total_paid_amount` decimal(20,2) DEFAULT '0.00',
  `date_paid` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_cancelled` datetime DEFAULT '0000-00-00 00:00:00',
  `cancelled_by_user` int(11) DEFAULT '0',
  `created_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `is_posted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receivable_payments`
--

LOCK TABLES `receivable_payments` WRITE;
/*!40000 ALTER TABLE `receivable_payments` DISABLE KEYS */;
INSERT INTO `receivable_payments` VALUES (1,'REC01',4,0,'AR',1,1,1,'0000-00-00','','Partial Payment of Sutherland',15000.00,'2019-07-04','2019-07-04 02:05:41','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,0,0,'\0','\0','','\0'),(2,'REC02',3,0,'AR',1,1,1,'0000-00-00','','Partial Payment',1000.00,'2019-07-04','2019-07-04 02:05:54','0000-00-00 00:00:00','0000-00-00 00:00:00','2019-09-03 15:05:14',7,1,0,0,'\0','\0','\0','\0'),(3,'12',4,0,'AR',1,1,1,'0000-00-00','','',2969.00,'2019-09-03','2019-09-03 15:04:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2019-09-03 15:05:17',7,7,0,0,'\0','\0','\0','\0'),(4,'12',4,0,'AR',1,1,1,'0000-00-00','','',2969.00,'2019-09-03','2019-09-03 15:05:28','0000-00-00 00:00:00','0000-00-00 00:00:00','2019-09-03 15:05:50',7,7,0,0,'\0','\0','\0','\0'),(5,'12',4,0,'AR',1,1,1,'0000-00-00','','',2969.00,'2019-09-03','2019-09-03 15:05:55','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,7,0,0,'\0','\0','','\0');
/*!40000 ALTER TABLE `receivable_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receivable_payments_list`
--

DROP TABLE IF EXISTS `receivable_payments_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receivable_payments_list` (
  `payment_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_id` bigint(20) DEFAULT '0',
  `sales_invoice_id` bigint(20) DEFAULT '0',
  `service_invoice_id` bigint(20) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `receivable_amount` decimal(20,2) DEFAULT '0.00',
  `payment_amount` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`payment_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receivable_payments_list`
--

LOCK TABLES `receivable_payments_list` WRITE;
/*!40000 ALTER TABLE `receivable_payments_list` DISABLE KEYS */;
INSERT INTO `receivable_payments_list` VALUES (1,1,0,0,10,150000.00,15000.00),(2,2,0,0,7,15000.00,1000.00),(3,3,0,0,10,135000.00,0.00),(4,3,0,0,19,1430.00,1430.00),(5,3,0,0,20,1539.00,1539.00),(6,3,0,0,22,3000.00,0.00),(7,4,0,0,10,135000.00,0.00),(8,4,0,0,19,1430.00,1430.00),(9,4,0,0,20,1539.00,1539.00),(10,4,0,0,22,3000.00,0.00),(11,5,0,0,19,1430.00,1430.00),(12,5,0,0,20,1539.00,1539.00);
/*!40000 ALTER TABLE `receivable_payments_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refcustomertype`
--

DROP TABLE IF EXISTS `refcustomertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refcustomertype` (
  `refcustomertype_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `modified_by_user_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`refcustomertype_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refcustomertype`
--

LOCK TABLES `refcustomertype` WRITE;
/*!40000 ALTER TABLE `refcustomertype` DISABLE KEYS */;
/*!40000 ALTER TABLE `refcustomertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refdiscounttype`
--

DROP TABLE IF EXISTS `refdiscounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refdiscounttype` (
  `discount_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_type_code` varchar(65) DEFAULT '',
  `discount_type_name` varchar(254) DEFAULT '',
  `discount_type_desc` varchar(500) DEFAULT '',
  `discount_percent` decimal(19,5) DEFAULT '0.00000',
  `sort_key` int(11) DEFAULT '0',
  `created_by` int(11) DEFAULT '0',
  `created_datetime` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT '0',
  `modified_datetime` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT '0',
  `deleted_datetime` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`discount_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refdiscounttype`
--

LOCK TABLES `refdiscounttype` WRITE;
/*!40000 ALTER TABLE `refdiscounttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `refdiscounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refproduct`
--

DROP TABLE IF EXISTS `refproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refproduct` (
  `refproduct_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `modified_by_user_id` int(10) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`refproduct_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refproduct`
--

LOCK TABLES `refproduct` WRITE;
/*!40000 ALTER TABLE `refproduct` DISABLE KEYS */;
INSERT INTO `refproduct` VALUES (1,'Companion Animals','Common house pets',0,0,'2019-01-28 00:24:28','0000-00-00 00:00:00',0),(2,'Livestock Animals','Farm animals',0,0,'2019-01-28 00:24:28','0000-00-00 00:00:00',0),(3,'All Product type','',0,0,'2019-01-28 00:24:28','0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `refproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights_links`
--

DROP TABLE IF EXISTS `rights_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights_links` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_code` varchar(100) DEFAULT '',
  `link_code` varchar(20) DEFAULT NULL,
  `link_name` varchar(255) DEFAULT '',
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights_links`
--

LOCK TABLES `rights_links` WRITE;
/*!40000 ALTER TABLE `rights_links` DISABLE KEYS */;
INSERT INTO `rights_links` VALUES (1,'1','1-1','General Journal'),(2,'1','1-2','Cash Disbursement'),(3,'1','1-3','Purchase Journal'),(4,'1','1-4','Sales Journal'),(5,'1','1-5','Cash Receipt'),(6,'2','2-1','Purchase Order'),(7,'2','2-2','Purchase Invoice'),(8,'2','2-3','Record Payment'),(10,'15','15-3','Item Adjustment'),(11,'3','3-1','Sales Order'),(12,'3','3-2','Sales Invoice'),(13,'3','3-3','Record Payment'),(14,'4','4-2','Category Management'),(15,'4','4-3','Department Management'),(16,'4','4-4','Unit Management'),(17,'5','5-1','Product Management'),(18,'5','5-2','Supplier Management'),(19,'5','5-3','Customer Management'),(20,'6','6-1','Setup Tax'),(21,'6','6-2','Setup Chart of Accounts'),(22,'6','6-3','Account Integration'),(23,'6','6-4','Setup User Group'),(24,'6','6-5','Create User Account'),(25,'6','6-6','Setup Company Info'),(26,'7','7-1','Purchase Order for Approval'),(27,'9','9-1','Balance Sheet Report'),(28,'9','9-2','Income Statement'),(29,'4','4-1','Account Classification'),(30,'8','8-1','Sales Report'),(31,'15','15-4','Inventory Report'),(32,'5','5-4','Salesperson Management'),(33,'2','2-6','Item Adjustment (Out)'),(34,'8','8-3','Export Sales Summary'),(35,'9','9-3','Export Trial Balance'),(36,'6','6-7','Setup Check Layout'),(37,'9','9-4','AR Schedule'),(38,'9','9-6','Customer Subsidiary'),(39,'9','9-8','Account Subsidiary'),(40,'9','9-7','Supplier Subsidiary'),(41,'9','9-5','AP Schedule'),(42,'8','8-4','Purchase Invoice Report'),(43,'4','4-5','Locations Management'),(44,'10','10-1','Fixed Asset Management'),(45,'9','9-9','Annual Income Statement'),(46,'6','6-8','Recurring Template'),(47,'9','9-10','VAT Relief Report'),(48,'1','1-6','Petty Cash Journal'),(49,'9','9-13','Replenishment Report'),(50,'6','6-9','Backup Database'),(51,'9','9-14','Book of Accounts'),(52,'9','9-16','Comparative Income'),(53,'4','4-6','Bank Reference Management'),(54,'10','10-2','Depreciation Expense Report'),(55,'11','11-1','Bank Reconciliation'),(57,'12','12-1','Voucher Registry Report'),(58,'12','12-2','Check Registry Report'),(59,'12','12-3','Collection List Report'),(60,'12','12-4','Open Purchase Report'),(61,'12','12-5','Open Sales Report'),(62,'9','9-11','Schedule of Expense'),(63,'9','9-15','AR Reports'),(64,'9','9-12','Cost of Goods'),(65,'13','13-1','Service Invoice'),(66,'13','13-2','Service Journal'),(67,'13','13-3','Service Unit Management'),(68,'13','13-4','Service Management'),(69,'9','9-17','Aging of Receivables'),(70,'9','9-18','Aging of Payables'),(71,'9','9-19','Statement of Account'),(72,'6','6-10','Email Settings'),(73,'14','14-1','Treasury'),(74,'9','9-20','Replenishment Batch Report'),(75,'9','9-21','General Ledger'),(76,'6','6-11','Email Report'),(77,'12','12-6','Product Reorder (Pick-list)'),(78,'12','12-7','Product List Report'),(79,'2','2-8','Purchase History'),(80,'2','2-7','Purchase Monitoring'),(81,'6','6-12','Puchasing Integration'),(82,'15','15-1','Product Management (Inventory Tab)'),(83,'3','3-4','Cash Invoice'),(84,'6','6-13','Audit Trail'),(85,'15','15-5','Item Transfer to Department'),(86,'15','15-6','Stock Card / Bin Card'),(87,'3','3-5','Warehouse Dispatching'),(88,'4','4-7','Brands Management'),(89,'4','4-8','Order Source Management'),(90,'8','8-5','Sales Report by Source'),(91,'3','3-6','Sales/Cash Invoice History'),(92,'7','7-2','Inventory Report Detailed'),(93,'8','8-6','Profit Report'),(94,'3','3-7','Customer Sales History'),(95,'15','15-7','Inventory Report');
/*!40000 ALTER TABLE `rights_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoice`
--

DROP TABLE IF EXISTS `sales_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoice` (
  `sales_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sales_inv_no` varchar(75) DEFAULT '',
  `sales_order_id` bigint(20) DEFAULT '0',
  `sales_order_no` varchar(75) DEFAULT '',
  `order_status_id` int(11) DEFAULT '1' COMMENT '1 is open 2 is closed 3 is partially, used in delivery_receipt',
  `department_id` int(11) DEFAULT '0',
  `issue_to_department` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `journal_id` bigint(20) DEFAULT '0',
  `terms` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `total_after_tax` decimal(20,4) DEFAULT '0.0000',
  `date_due` date DEFAULT '0000-00-00',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_paid` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_journal_posted` bit(1) DEFAULT b'0',
  `ref_product_type_id` int(11) DEFAULT '0',
  `inv_type` int(11) DEFAULT '1',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT '',
  `contact_person` varchar(175) DEFAULT NULL,
  `customer_type_id` bigint(20) DEFAULT '0',
  `order_source_id` bigint(20) DEFAULT '0',
  `for_dispatching` bit(1) DEFAULT b'0',
  PRIMARY KEY (`sales_invoice_id`) USING BTREE,
  UNIQUE KEY `sales_inv_no` (`sales_inv_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoice`
--

LOCK TABLES `sales_invoice` WRITE;
/*!40000 ALTER TABLE `sales_invoice` DISABLE KEYS */;
INSERT INTO `sales_invoice` VALUES (1,'SAL-INV-20190704-1',0,'',1,1,NULL,4,20,0,'',0.0000,0.0000,0.0000,1539.0000,1374.1000,164.9000,1539.0000,'2019-07-04','2019-07-04','2019-07-04 02:50:24','0000-00-00 00:00:00','2019-09-03 07:02:42',1,0,0,'\0','','\0','',0,1,1,'Clark Freeport','Benedict Sanchez',0,1,'\0'),(2,'SAL-INV-20190704-2',0,'',1,1,NULL,4,19,0,'',0.0000,0.0000,0.0000,1430.0000,1317.4900,112.5100,1430.0000,'2019-07-04','2019-07-04','2019-07-04 02:51:20','0000-00-00 00:00:00','2019-09-03 07:02:26',1,0,0,'\0','','\0','',0,1,1,'Clark Freeport','Benedict Sanchez',0,1,'\0'),(3,'SAL-INV-20190903-3',0,'',1,1,NULL,2,0,0,'',260.0000,10.0000,234.0000,2106.0000,2321.4300,278.5700,2340.0000,'2019-09-03','2019-09-03','2019-09-03 15:14:36','0000-00-00 00:00:00','2019-09-03 07:14:36',7,0,0,'\0','','\0','\0',0,1,1,'Angeles City','Erick Pecson',0,1,'\0');
/*!40000 ALTER TABLE `sales_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoice_items`
--

DROP TABLE IF EXISTS `sales_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoice_items` (
  `sales_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sales_invoice_id` bigint(20) DEFAULT '0',
  `product_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '1',
  `inv_price` decimal(20,4) DEFAULT '0.0000',
  `orig_so_price` decimal(20,4) DEFAULT '0.0000',
  `inv_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `cost_upon_invoice` decimal(20,4) DEFAULT '0.0000',
  `inv_qty` decimal(20,2) DEFAULT '0.00',
  `inv_gross` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `inv_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `inv_line_total_after_global` decimal(20,4) DEFAULT '0.0000',
  `inv_notes` varchar(100) DEFAULT NULL,
  `dr_invoice_id` int(11) DEFAULT NULL,
  `exp_date` date DEFAULT '0000-00-00',
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`sales_item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoice_items`
--

LOCK TABLES `sales_invoice_items` WRITE;
/*!40000 ALTER TABLE `sales_invoice_items` DISABLE KEYS */;
INSERT INTO `sales_invoice_items` VALUES (1,1,12,4,1,470.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,470.0000,470.0000,50.3600,419.6400,470.0000,NULL,NULL,'0000-00-00',''),(2,1,13,4,1,180.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,180.0000,180.0000,19.2900,160.7100,180.0000,NULL,NULL,'0000-00-00',''),(3,1,5,5,1,400.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,400.0000,400.0000,42.8600,357.1400,400.0000,NULL,NULL,'0000-00-00',''),(4,1,6,5,1,420.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,420.0000,420.0000,45.0000,375.0000,420.0000,NULL,NULL,'0000-00-00',''),(5,1,15,4,1,69.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,69.0000,69.0000,7.3900,61.6100,69.0000,NULL,NULL,'0000-00-00',''),(6,2,12,4,1,470.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,470.0000,470.0000,50.3600,419.6400,470.0000,NULL,NULL,'0000-00-00',''),(7,2,13,4,1,180.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,180.0000,180.0000,19.2900,160.7100,180.0000,NULL,NULL,'0000-00-00',''),(8,2,5,5,1,400.0000,0.0000,0.0000,0.0000,12.0000,0.0000,1.00,400.0000,400.0000,42.8600,357.1400,400.0000,NULL,NULL,'0000-00-00',''),(9,2,2,3,1,380.0000,0.0000,0.0000,0.0000,0.0000,0.0000,1.00,380.0000,380.0000,0.0000,380.0000,380.0000,NULL,NULL,'0000-00-00',''),(10,3,18,6,1,100.0000,0.0000,10.0000,10.0000,12.0000,0.0000,1.00,100.0000,90.0000,10.7143,89.2857,81.0000,NULL,NULL,'0000-00-00',''),(11,3,22,6,1,1200.0000,0.0000,10.0000,120.0000,12.0000,0.0000,1.00,1200.0000,1080.0000,128.5714,1071.4286,972.0000,NULL,NULL,'0000-00-00',''),(12,3,17,5,1,1300.0000,0.0000,10.0000,130.0000,12.0000,0.0000,1.00,1300.0000,1170.0000,139.2857,1160.7143,1053.0000,NULL,NULL,'0000-00-00','');
/*!40000 ALTER TABLE `sales_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order`
--

DROP TABLE IF EXISTS `sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order` (
  `sales_order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `so_no` varchar(75) DEFAULT '',
  `customer_id` bigint(20) DEFAULT '0',
  `department_id` int(11) DEFAULT '0',
  `remarks` varchar(755) DEFAULT '',
  `total_discount` decimal(20,2) DEFAULT '0.00',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_before_tax` decimal(20,2) DEFAULT '0.00',
  `total_after_tax` decimal(20,2) DEFAULT '0.00',
  `total_after_discount` decimal(20,4) DEFAULT '0.0000',
  `total_tax_amount` decimal(20,2) DEFAULT '0.00',
  `order_status_id` int(11) DEFAULT '1',
  `date_order` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `salesperson_id` int(11) DEFAULT '0',
  `customer_type_id` bigint(20) DEFAULT '0',
  `order_source_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`sales_order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order`
--

LOCK TABLES `sales_order` WRITE;
/*!40000 ALTER TABLE `sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_items`
--

DROP TABLE IF EXISTS `sales_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_items` (
  `sales_order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sales_order_id` bigint(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT '0',
  `unit_id` int(11) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT '1',
  `so_qty` decimal(20,2) DEFAULT '0.00',
  `so_price` decimal(20,4) DEFAULT '0.0000',
  `so_discount` decimal(20,4) DEFAULT '0.0000',
  `so_gross` decimal(20,4) DEFAULT '0.0000',
  `so_line_total_discount` decimal(20,4) DEFAULT '0.0000',
  `so_tax_rate` decimal(20,4) DEFAULT '0.0000',
  `so_line_total_price` decimal(20,4) DEFAULT '0.0000',
  `so_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `so_non_tax_amount` decimal(20,4) DEFAULT '0.0000',
  `exp_date` date DEFAULT '0000-00-00',
  `dr_invoice_id` int(11) DEFAULT NULL,
  `batch_no` varchar(55) DEFAULT '',
  PRIMARY KEY (`sales_order_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_items`
--

LOCK TABLES `sales_order_items` WRITE;
/*!40000 ALTER TABLE `sales_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesperson`
--

DROP TABLE IF EXISTS `salesperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesperson` (
  `salesperson_id` int(11) NOT NULL AUTO_INCREMENT,
  `salesperson_code` varchar(55) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `acr_name` varchar(10) DEFAULT NULL,
  `contact_no` varchar(100) NOT NULL,
  `department_id` int(2) NOT NULL,
  `tin_no` varchar(100) NOT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  PRIMARY KEY (`salesperson_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesperson`
--

LOCK TABLES `salesperson` WRITE;
/*!40000 ALTER TABLE `salesperson` DISABLE KEYS */;
INSERT INTO `salesperson` VALUES (1,'Cashier','Cashier','','Cashier',NULL,'',1,'','','\0','2019-07-04 02:49:06','0000-00-00 00:00:00',1);
/*!40000 ALTER TABLE `salesperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sched_expense_integration`
--

DROP TABLE IF EXISTS `sched_expense_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sched_expense_integration` (
  `sched_expense_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) DEFAULT '0',
  `group_id` int(11) DEFAULT '0',
  PRIMARY KEY (`sched_expense_id`) USING BTREE,
  UNIQUE KEY `account_id` (`account_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sched_expense_integration`
--

LOCK TABLES `sched_expense_integration` WRITE;
/*!40000 ALTER TABLE `sched_expense_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `sched_expense_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_invoice`
--

DROP TABLE IF EXISTS `service_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_invoice` (
  `service_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_invoice_no` varchar(75) DEFAULT NULL,
  `department_id` int(11) DEFAULT '0',
  `customer_id` int(11) DEFAULT '0',
  `salesperson_id` int(11) DEFAULT '0',
  `address` varchar(150) DEFAULT NULL,
  `total_amount` decimal(25,2) DEFAULT '0.00',
  `total_overall_discount` decimal(20,4) DEFAULT '0.0000',
  `total_overall_discount_amount` decimal(20,4) DEFAULT '0.0000',
  `total_amount_after_discount` decimal(20,4) DEFAULT '0.0000',
  `date_invoice` date DEFAULT '0000-00-00',
  `date_due` date DEFAULT '0000-00-00',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `remarks` text,
  `is_journal_posted` bit(1) DEFAULT b'0',
  `journal_id` bigint(20) DEFAULT '0',
  `contact_person` varchar(175) DEFAULT NULL,
  PRIMARY KEY (`service_invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_invoice`
--

LOCK TABLES `service_invoice` WRITE;
/*!40000 ALTER TABLE `service_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_invoice_items`
--

DROP TABLE IF EXISTS `service_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_invoice_items` (
  `service_item_id` bigint(25) NOT NULL AUTO_INCREMENT,
  `service_invoice_id` bigint(25) DEFAULT '0',
  `service_id` int(11) DEFAULT '0',
  `service_unit` int(11) DEFAULT '0',
  `service_price` decimal(25,2) DEFAULT '0.00',
  `service_qty` int(11) DEFAULT '0',
  `service_line_total` decimal(25,2) DEFAULT '0.00',
  `service_line_total_after_global` decimal(25,4) DEFAULT '0.0000',
  PRIMARY KEY (`service_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_invoice_items`
--

LOCK TABLES `service_invoice_items` WRITE;
/*!40000 ALTER TABLE `service_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_unit`
--

DROP TABLE IF EXISTS `service_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_unit` (
  `service_unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_unit_name` varchar(255) DEFAULT NULL,
  `service_unit_desc` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`service_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_unit`
--

LOCK TABLES `service_unit` WRITE;
/*!40000 ALTER TABLE `service_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `service_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_code` varchar(255) DEFAULT NULL,
  `service_desc` varchar(255) DEFAULT NULL,
  `service_unit` varchar(255) DEFAULT NULL,
  `income_account_id` bigint(20) DEFAULT '0',
  `expense_account_id` bigint(20) DEFAULT '0',
  `service_amount` decimal(25,2) DEFAULT '0.00',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `created_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_photos`
--

DROP TABLE IF EXISTS `supplier_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_photos` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT '0',
  `photo_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_photos`
--

LOCK TABLES `supplier_photos` WRITE;
/*!40000 ALTER TABLE `supplier_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `supplier_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_code` varchar(125) DEFAULT '',
  `supplier_name` varchar(255) DEFAULT '',
  `contact_name` varchar(255) DEFAULT '',
  `contact_person` varchar(155) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `email_address` varchar(255) DEFAULT '',
  `contact_no` varchar(255) DEFAULT '',
  `tin_no` varchar(255) DEFAULT '',
  `term` varchar(255) DEFAULT '',
  `tax_type_id` int(11) DEFAULT '1',
  `photo_path` varchar(500) DEFAULT '',
  `total_payable_amount` decimal(19,2) DEFAULT '0.00',
  `posted_by_user` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00',
  `credit_limit` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  `deleted_by_user` int(11) DEFAULT '0',
  `date_deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `tax_output` int(11) DEFAULT '0',
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'N/A','N/A','N/A','','N/A','','','','',2,'assets/img/anonymous-icon.png',130501.00,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',NULL,'\0','',0,'0000-00-00 00:00:00',0),(2,'','Angeles Electric Corporation','Angeles Electric Corporation','','Angeles Electric Corporation','','','','',2,'assets/img/anonymous-icon.png',0.00,1,'2019-07-04 01:22:03','0000-00-00 00:00:00',NULL,'\0','',0,'0000-00-00 00:00:00',0),(3,'','Angeles Water District','N/A','','Angeles City','','','','',2,'assets/img/anonymous-icon.png',0.00,1,'2019-07-04 01:23:47','0000-00-00 00:00:00',NULL,'\0','',0,'0000-00-00 00:00:00',0),(4,'','Pampang Market','N/A','','Angeles City','','','','',2,'assets/img/anonymous-icon.png',9792.00,1,'2019-07-04 01:29:34','0000-00-00 00:00:00',NULL,'\0','',0,'0000-00-00 00:00:00',0),(5,'','Manila Suplier','N/A','','Manila','','','','',2,'assets/img/anonymous-icon.png',91600.00,1,'2019-07-04 05:29:31','0000-00-00 00:00:00',NULL,'\0','',0,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_types`
--

DROP TABLE IF EXISTS `tax_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_types` (
  `tax_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_type` varchar(155) DEFAULT '',
  `tax_rate` decimal(11,2) DEFAULT '0.00',
  `description` varchar(555) DEFAULT '',
  `is_default` bit(1) DEFAULT b'0',
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`tax_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_types`
--

LOCK TABLES `tax_types` WRITE;
/*!40000 ALTER TABLE `tax_types` DISABLE KEYS */;
INSERT INTO `tax_types` VALUES (1,'Non-vat',0.00,'','\0','\0'),(2,'Vatted',12.00,'','','\0');
/*!40000 ALTER TABLE `tax_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trans`
--

DROP TABLE IF EXISTS `trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trans` (
  `trans_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT '0',
  `trans_key_id` bigint(20) DEFAULT NULL,
  `trans_type_id` bigint(20) DEFAULT NULL,
  `trans_log` varchar(745) DEFAULT NULL,
  `trans_date` datetime DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trans`
--

LOCK TABLES `trans` WRITE;
/*!40000 ALTER TABLE `trans` DISABLE KEYS */;
INSERT INTO `trans` VALUES (1,1,7,43,'User Log Out :System Administrator  ','2019-07-03 05:44:30'),(2,1,6,43,'User Log in: System Administrator  ','2019-07-03 05:44:35'),(3,1,1,52,'Created a new customer: N/A','2019-07-03 05:45:19'),(4,1,7,43,'User Log Out :System Administrator  ','2019-07-03 05:45:32'),(5,1,6,43,'User Log in: System Administrator  ','2019-07-04 00:49:47'),(6,1,1,1,'Created General Journal TXN-20190704-1','2019-07-04 01:21:24'),(7,1,1,51,'Created a Supplier: Angeles Electric Corporation','2019-07-04 01:22:03'),(8,1,1,2,'Created Cash Disbursement Entry TXN-20190704-2','2019-07-04 01:22:48'),(9,1,1,2,'Created Cash Disbursement Entry TXN-20190704-3','2019-07-04 01:23:23'),(10,1,1,51,'Created a Supplier: Angeles Water District','2019-07-04 01:23:47'),(11,1,1,2,'Created Cash Disbursement Entry TXN-20190704-4','2019-07-04 01:24:19'),(12,1,1,2,'Created Cash Disbursement Entry TXN-20190704-5','2019-07-04 01:26:14'),(13,1,1,52,'Created a new customer: Erick Pecson','2019-07-04 01:27:43'),(14,1,1,4,'Created Sales Journal Entry TXN-20190704-6','2019-07-04 01:28:03'),(15,1,1,52,'Created a new customer: Francis Neil Manaloto','2019-07-04 01:28:32'),(16,1,1,4,'Created Sales Journal Entry TXN-20190704-7','2019-07-04 01:29:09'),(17,1,1,51,'Created a Supplier: Pampang Market','2019-07-04 01:29:34'),(18,1,1,3,'Created Purchase Journal Entry TXN-20190704-8','2019-07-04 01:30:01'),(19,1,1,47,'Created  Unit: Box','2019-07-04 01:44:49'),(20,1,1,50,'Created a new Product: Baby Back Ribs\r\n','2019-07-04 01:45:48'),(21,1,1,47,'Created  Unit: Bottle','2019-07-04 01:46:08'),(22,1,1,50,'Created a new Product: Benmore Scoth\r\n','2019-07-04 01:46:15'),(23,1,1,47,'Created  Unit: Pack','2019-07-04 01:46:30'),(24,1,1,50,'Created a new Product: Knox Unflavor Gelatin\r\n','2019-07-04 01:46:42'),(25,1,1,50,'Created a new Product:  New Zealand Mussels \r\n','2019-07-04 01:47:07'),(26,1,2,50,'Updated Product : Benmore Scoth\r\n ID(2)','2019-07-04 01:47:13'),(27,1,2,50,'Updated Product : Baby Back Ribs\r\n ID(1)','2019-07-04 01:47:23'),(28,1,2,50,'Updated Product : Knox Unflavor Gelatin\r\n ID(3)','2019-07-04 01:47:27'),(29,1,1,47,'Created  Unit: Kilo','2019-07-04 01:47:46'),(30,1,1,50,'Created a new Product:  Scallop Meat (Large)\r\n','2019-07-04 01:48:02'),(31,1,1,50,'Created a new Product:  Shrimp Frozen \r\n','2019-07-04 01:48:25'),(32,1,1,50,'Created a new Product: Mini Unsalted Butter\r\n','2019-07-04 01:49:11'),(33,1,1,50,'Created a new Product: Kirkland Red Pepper\r\n','2019-07-04 01:49:37'),(34,1,1,50,'Created a new Product: Campbell tomato Juice\r\n','2019-07-04 01:50:02'),(35,1,1,50,'Created a new Product: Lobster Tail','2019-07-04 01:50:30'),(36,1,1,50,'Created a new Product: Mccormick bay leaves whole\r\n','2019-07-04 01:50:52'),(37,1,1,50,'Created a new Product: Angus Burger Patties\r\n','2019-07-04 01:51:35'),(38,1,1,50,'Created a new Product: Asparagus\r\n','2019-07-04 01:52:06'),(39,1,1,50,'Created a new Product: Bacon\r\n','2019-07-04 01:52:39'),(40,1,1,50,'Created a new Product: Cajun Seasoning\r\n','2019-07-04 01:53:37'),(41,1,1,50,'Created a new Product: Canadian Club\r\n','2019-07-04 01:54:12'),(42,1,1,12,'Created Purchase Invoice No: P-INV-20190704-1','2019-07-04 01:54:42'),(43,1,1,12,'Created Purchase Invoice No: P-INV-20190704-2','2019-07-04 01:54:52'),(44,1,1,11,'Created Purchase Order No: PO-20190704-1','2019-07-04 01:55:37'),(45,1,1,11,'Created Purchase Order No: PO-20190704-2','2019-07-04 01:56:32'),(46,1,1,11,'Created Purchase Order No: PO-20190704-3','2019-07-04 01:57:38'),(47,1,1,15,'Created Adjustment No: ADJ-20190704-1','2019-07-04 01:59:50'),(48,1,2,15,'Updated Adjustment No: ADJ-20190704-1','2019-07-04 02:00:16'),(49,1,1,15,'Created Adjustment No: ADJ-20190704-2','2019-07-04 02:02:34'),(50,1,1,12,'Created Purchase Invoice No: P-INV-20190704-3','2019-07-04 02:03:32'),(51,1,8,12,'Finalized Purchase Invoice No.P-INV-20190704-3 For Purchase Journal Entry TXN-20190704-9','2019-07-04 02:04:01'),(52,1,1,3,'Created Purchase Journal Entry TXN-20190704-9','2019-07-04 02:04:01'),(53,1,1,52,'Created a new customer: Benedict Sanchez','2019-07-04 02:04:42'),(54,1,1,4,'Created Sales Journal Entry TXN-20190704-10','2019-07-04 02:05:01'),(55,1,1,18,'Posted Payment No: REC01 to Collection Entry','2019-07-04 02:05:41'),(56,1,1,18,'Posted Payment No: REC02 to Collection Entry','2019-07-04 02:05:54'),(57,1,1,5,'Posted Petty Cash Journal Entry PCV-20190704-11','2019-07-04 02:06:40'),(58,1,1,5,'Posted Petty Cash Journal Entry PCV-20190704-12','2019-07-04 02:07:25'),(59,1,1,5,'Posted Petty Cash Journal Entry PCV-20190704-13','2019-07-04 02:07:52'),(60,1,1,5,'Posted Petty Cash Journal Entry PCV-20190704-14','2019-07-04 02:08:36'),(61,1,2,5,'Updated Petty Cash Journal Entry PCV-20190704-12','2019-07-04 02:08:54'),(62,1,1,6,'Created Cash Receipt Journal Entry TXN-20190704-15','2019-07-04 02:10:07'),(63,1,1,6,'Created Cash Receipt Journal Entry TXN-20190704-16','2019-07-04 02:10:32'),(64,1,1,6,'Created Cash Receipt Journal Entry TXN-20190704-17','2019-07-04 02:11:08'),(65,1,1,6,'Created Cash Receipt Journal Entry TXN-20190704-18','2019-07-04 02:11:39'),(66,1,1,48,'Created Location: HR Office','2019-07-04 02:12:56'),(67,1,2,57,'Updated System General Configuration','2019-07-04 02:14:34'),(68,1,7,43,'User Log Out :System Administrator  ','2019-07-04 02:17:55'),(69,1,6,43,'User Log in: System Administrator  ','2019-07-04 02:18:19'),(70,1,2,60,'Modified Company Information','2019-07-04 02:20:08'),(71,1,7,43,'User Log Out :System Administrator  ','2019-07-04 02:20:10'),(72,1,6,43,'User Log in: System Administrator  ','2019-07-04 02:20:15'),(73,1,7,43,'User Log Out :System Administrator  ','2019-07-04 02:24:55'),(74,1,6,43,'User Log in: System Administrator  ','2019-07-04 02:26:07'),(75,1,2,67,'Updated Order Source: Walk In ID(1)','2019-07-04 02:29:09'),(76,1,1,53,'Created Salesperson: Cashier  Cashier','2019-07-04 02:49:06'),(77,1,1,65,'Created Cash Invoice No: CI-INV-20190704-1','2019-07-04 02:49:18'),(78,1,1,65,'Created Cash Invoice No: CI-INV-20190704-2','2019-07-04 02:49:53'),(79,1,1,17,'Created Sales Invoice No: SAL-INV-20190704-1','2019-07-04 02:50:24'),(80,1,1,17,'Created Sales Invoice No: SAL-INV-20190704-2','2019-07-04 02:51:20'),(81,1,3,43,'Deleted User: Jack (ID3)','2019-07-04 05:11:06'),(82,1,3,43,'Deleted User: jonareyes06 (ID4)','2019-07-04 05:11:08'),(83,1,3,43,'Deleted User: marissa (ID5)','2019-07-04 05:11:10'),(84,1,3,43,'Deleted User: tin (ID6)','2019-07-04 05:11:12'),(85,1,2,43,'Updated User : jdev ID(1)','2019-07-04 05:11:20'),(86,1,7,43,'User Log Out :System Administrator  ','2019-07-04 05:11:27'),(87,0,10,43,'Login Attempt using username: jdev','2019-07-04 05:11:30'),(88,1,6,43,'User Log in: System Administrator  ','2019-07-04 05:11:33'),(89,1,1,43,'Created User: admin','2019-07-04 05:11:57'),(90,1,7,43,'User Log Out :System Administrator  ','2019-07-04 05:12:06'),(91,0,10,43,'Login Attempt using username: jdev','2019-07-04 05:12:36'),(92,1,6,43,'User Log in: System Administrator  ','2019-07-04 05:12:39'),(93,7,6,43,'User Log in: System  Administrator','2019-07-04 05:13:00'),(94,1,1,45,'Created Category: Double Apple','2019-07-04 05:15:33'),(95,1,1,50,'Created a new Product: Shisha Tobacco','2019-07-04 05:16:39'),(96,1,2,50,'Updated Product : Shisha Tobacco Double Apple ID(17)','2019-07-04 05:19:06'),(97,1,2,50,'Updated Product : Shisha Tobacco Double Apple 1Kl ID(17)','2019-07-04 05:19:52'),(98,1,2,50,'Updated Product : Shisha Tobacco Double Apple 1Kl ID(17)','2019-07-04 05:25:39'),(99,1,1,47,'Created  Unit: Grams','2019-07-04 05:26:16'),(100,1,1,50,'Created a new Product: Shisha Tobacco Double Apple 50G','2019-07-04 05:26:29'),(101,1,1,45,'Created Category: Mint','2019-07-04 05:27:15'),(102,1,1,50,'Created a new Product: Shisha Tobacco Mint 1Kl','2019-07-04 05:27:36'),(103,1,2,50,'Updated Product : Shisha Tobacco Double Apple 50G ID(18)','2019-07-04 05:27:44'),(104,1,1,51,'Created a Supplier: Manila Suplier','2019-07-04 05:29:31'),(105,1,1,12,'Created Purchase Invoice No: P-INV-20190704-4','2019-07-04 05:30:23'),(106,1,2,50,'Updated Product : Afzal Shisha Tobacco Double Apple 1Kl ID(17)','2019-07-04 05:33:50'),(107,1,2,50,'Updated Product : Afzal Shisha Tobacco Double Apple 50G ID(18)','2019-07-04 05:34:01'),(108,1,2,50,'Updated Product : Afzal Shisha Tobacco Mint 1Kl ID(19)','2019-07-04 05:34:12'),(109,1,1,45,'Created Category: Bermuba','2019-07-04 05:36:00'),(110,1,1,50,'Created a new Product: Azure Gold ST Bermuba Mint 250G','2019-07-04 05:37:17'),(111,1,1,50,'Created a new Product: Alfakher ST Double Apple 1Kl','2019-07-04 05:38:43'),(112,1,1,50,'Created a new Product: Alfacker ST Mint 1Kl','2019-07-04 05:40:42'),(113,1,1,15,'Created Adjustment No: ADJ-20190704-3','2019-07-04 05:41:53'),(114,1,1,52,'Created a new customer: N/A','2019-07-04 05:48:17'),(115,1,1,65,'Created Cash Invoice No: CI-INV-20190704-3','2019-07-04 05:49:10'),(116,1,1,45,'Created Category: Shisha Tobacco','2019-07-04 05:59:01'),(117,1,2,50,'Updated Product : Afzal Shisha Tobacco Double Apple 1Kl ID(17)','2019-07-04 05:59:05'),(118,1,2,50,'Updated Product : Afzal Shisha Tobacco Double Apple 50G ID(18)','2019-07-04 05:59:13'),(119,1,2,50,'Updated Product : Alfakher ST Double Apple 1Kl ID(21)','2019-07-04 05:59:20'),(120,1,2,50,'Updated Product : Afzal Shisha Tobacco Double Apple 1Kl ID(17)','2019-07-04 06:06:11'),(121,1,2,50,'Updated Product : Afzal Shisha Tobacco Double Apple 50G ID(18)','2019-07-04 06:06:15'),(122,1,2,50,'Updated Product : Afzal Shisha Tobacco Mint 1Kl ID(19)','2019-07-04 06:06:19'),(123,1,2,50,'Updated Product : Azure Gold ST Bermuba Mint 250G ID(20)','2019-07-04 06:06:23'),(124,1,2,50,'Updated Product : Alfakher ST Double Apple 1Kl ID(21)','2019-07-04 06:06:26'),(125,1,2,50,'Updated Product : Alfacker ST Mint 1Kl ID(22)','2019-07-04 06:06:30'),(126,1,1,12,'Created Purchase Invoice No: P-INV-20190704-5','2019-07-04 06:07:31'),(127,1,2,51,'Updated a Supplier : N/A ID(1)','2019-07-04 06:08:02'),(128,1,2,51,'Updated a Supplier : Angeles Electric Corporation ID(2)','2019-07-04 06:08:05'),(129,1,2,51,'Updated a Supplier : Angeles Water District ID(3)','2019-07-04 06:08:08'),(130,1,2,51,'Updated a Supplier : Pampang Market ID(4)','2019-07-04 06:08:11'),(131,1,2,51,'Updated a Supplier : Manila Suplier ID(5)','2019-07-04 06:08:15'),(132,1,1,47,'Created  Unit: N/A','2019-07-04 06:12:31'),(133,1,1,50,'Created a new Product: Insurance','2019-07-04 06:12:37'),(134,1,1,50,'Created a new Product: Transport','2019-07-04 06:12:58'),(135,1,1,50,'Created a new Product: Customs Duty','2019-07-04 06:13:24'),(136,1,1,50,'Created a new Product: Excise Tax','2019-07-04 06:14:05'),(137,1,1,50,'Created a new Product: Inspection Fee','2019-07-04 06:14:27'),(138,1,1,50,'Created a new Product: NTA Charges','2019-07-04 06:14:46'),(139,1,1,50,'Created a new Product: Storage Charges','2019-07-04 06:15:09'),(140,1,1,12,'Created Purchase Invoice No: P-INV-20190704-6','2019-07-04 06:18:16'),(141,7,7,43,'User Log Out :System  Administrator','2019-07-04 06:33:27'),(142,0,10,43,'Login Attempt using username: admin','2019-07-08 01:23:19'),(143,7,6,43,'User Log in: System  Administrator','2019-07-08 01:23:25'),(144,0,10,43,'Login Attempt using username: admin','2019-07-08 11:40:41'),(145,7,6,43,'User Log in: System  Administrator','2019-07-08 11:40:44'),(146,7,2,60,'Modified Company Information','2019-07-08 11:41:02'),(147,7,2,60,'Modified Company Information','2019-07-08 11:42:04'),(148,7,7,43,'User Log Out :System  Administrator','2019-07-08 11:47:56'),(149,0,10,43,'Login Attempt using username: admin','2019-07-08 11:48:01'),(150,7,6,43,'User Log in: System  Administrator','2019-07-08 11:48:03'),(151,0,10,43,'Login Attempt using username: admin','2019-07-09 08:28:47'),(152,7,6,43,'User Log in: System  Administrator','2019-07-09 08:28:51'),(153,7,7,43,'User Log Out :System  Administrator','2019-07-09 16:45:25'),(154,0,10,43,'Login Attempt using username: admin','2019-07-09 16:45:34'),(155,7,6,43,'User Log in: System  Administrator','2019-07-09 16:45:37'),(156,0,10,43,'Login Attempt using username: admin','2019-07-10 10:08:48'),(157,7,6,43,'User Log in: System  Administrator','2019-07-10 10:08:51'),(158,0,10,43,'Login Attempt using username: admin','2019-09-03 09:54:28'),(159,7,6,43,'User Log in: System  Administrator','2019-09-03 09:54:29'),(160,0,10,43,'Login Attempt using username: admin','2019-09-03 15:01:37'),(161,0,10,43,'Login Attempt using username: jdev','2019-09-03 15:01:42'),(162,7,6,43,'User Log in: System  Administrator','2019-09-03 15:01:45'),(163,7,8,17,'Finalized Sales Invoice No.SAL-INV-20190704-2 For Sales Journal Entry TXN-20190903-19','2019-09-03 15:02:26'),(164,7,1,4,'Created Sales Journal Entry TXN-20190903-19','2019-09-03 15:02:26'),(165,7,8,17,'Finalized Sales Invoice No.SAL-INV-20190704-1 For Sales Journal Entry TXN-20190903-20','2019-09-03 15:02:42'),(166,7,1,4,'Created Sales Journal Entry TXN-20190903-20','2019-09-03 15:02:42'),(167,7,1,4,'Created Sales Journal Entry TXN-20190903-21','2019-09-03 15:03:04'),(168,7,1,4,'Created Sales Journal Entry TXN-20190903-22','2019-09-03 15:03:37'),(169,7,1,18,'Posted Payment No: 12 to Collection Entry','2019-09-03 15:04:00'),(170,7,4,18,'Cancelled Payment No: REC02 from Collection Entry','2019-09-03 15:05:14'),(171,7,4,18,'Cancelled Payment No: 12 from Collection Entry','2019-09-03 15:05:17'),(172,7,1,18,'Posted Payment No: 12 to Collection Entry','2019-09-03 15:05:28'),(173,7,4,18,'Cancelled Payment No: 12 from Collection Entry','2019-09-03 15:05:50'),(174,7,1,18,'Posted Payment No: 12 to Collection Entry','2019-09-03 15:05:55'),(175,7,1,46,'Created Department: Accounting','2019-09-03 15:07:13'),(176,7,1,4,'Created Sales Journal Entry TXN-20190903-23','2019-09-03 15:07:29'),(177,7,1,11,'Created Purchase Order No: PO-20190903-4','2019-09-03 15:08:57'),(178,7,1,12,'Created Purchase Invoice No: P-INV-20190903-7','2019-09-03 15:10:38'),(179,7,1,12,'Created Purchase Invoice No: P-INV-20190903-8','2019-09-03 15:10:51'),(180,7,1,17,'Created Sales Invoice No: SAL-INV-20190903-3','2019-09-03 15:14:36'),(181,7,1,65,'Created Cash Invoice No: CI-INV-20190903-4','2019-09-03 15:15:17'),(182,0,10,43,'Login Attempt using username: admin','2020-08-12 09:35:22'),(183,7,6,43,'User Log in: System  Administrator','2020-08-12 09:35:25'),(184,7,7,43,'User Log Out :System  Administrator','2020-08-12 09:49:18'),(185,0,10,43,'Login Attempt using username: admin','2020-08-12 09:49:24'),(186,7,6,43,'User Log in: System  Administrator','2020-08-12 09:49:29');
/*!40000 ALTER TABLE `trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trans_key`
--

DROP TABLE IF EXISTS `trans_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trans_key` (
  `trans_key_id` bigint(20) NOT NULL,
  `trans_key_desc` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`trans_key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trans_key`
--

LOCK TABLES `trans_key` WRITE;
/*!40000 ALTER TABLE `trans_key` DISABLE KEYS */;
INSERT INTO `trans_key` VALUES (1,'Create'),(2,'Update'),(3,'Delete'),(4,'Cancel'),(6,'Log In'),(7,'Log Out'),(8,'Finalize'),(9,'Uncancel'),(10,'Login Attempts');
/*!40000 ALTER TABLE `trans_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trans_type`
--

DROP TABLE IF EXISTS `trans_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trans_type` (
  `trans_type_id` bigint(20) NOT NULL,
  `trans_type_desc` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`trans_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trans_type`
--

LOCK TABLES `trans_type` WRITE;
/*!40000 ALTER TABLE `trans_type` DISABLE KEYS */;
INSERT INTO `trans_type` VALUES (1,'General Journal'),(2,'Cash Disbursement'),(3,'Purchase Journal'),(4,'Sales Journal'),(5,'Petty Cash Journal'),(6,'Cash Receipt Journal'),(7,'Service Invoice'),(8,'Service Journal'),(9,'Service Unit'),(10,'Services'),(11,'Purchase Order'),(12,'Purchase Invoice'),(13,'Record Payment'),(14,'Item Issuance'),(15,'Item Adjustment'),(16,'Sales Order'),(17,'Sales Invoice'),(18,'Collection Entry'),(43,'User Accounts'),(44,'Account Classification'),(45,'Category Management'),(46,'Department Management'),(47,'Unit Management'),(48,'Locations Management'),(49,'Bank Management'),(50,'Product Management'),(51,'Supplier Management'),(52,'Customer Management'),(53,'Salesperson Management'),(54,'Fixed Asset Management'),(55,'Setup Tax'),(56,'Setup Chart of Accounts'),(57,'General Configuration'),(58,'Purchasing Configuration'),(59,'User Rights'),(60,'Company Info'),(61,'Check Layout'),(62,'Recurring Template'),(63,'Email Settings'),(64,'Email Report Settings'),(65,'Cash Invoice'),(66,'Issuance to Department'),(67,'Order Source');
/*!40000 ALTER TABLE `trans_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `unit_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unit_code` bigint(20) DEFAULT NULL,
  `unit_name` varchar(255) DEFAULT NULL,
  `unit_desc` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `is_deleted` bit(1) DEFAULT b'0',
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,NULL,'Piece','Piece',NULL,'0000-00-00 00:00:00','\0',''),(2,NULL,'Box','Box',NULL,'0000-00-00 00:00:00','\0',''),(3,NULL,'Bottle','Bottle',NULL,'0000-00-00 00:00:00','\0',''),(4,NULL,'Pack','Pack',NULL,'0000-00-00 00:00:00','\0',''),(5,NULL,'Kilo','Kilo',NULL,'0000-00-00 00:00:00','\0',''),(6,NULL,'Grams','Grams',NULL,'0000-00-00 00:00:00','\0',''),(7,NULL,'N/A','N/A',NULL,'0000-00-00 00:00:00','\0','');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_accounts`
--

DROP TABLE IF EXISTS `user_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_accounts` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT '',
  `user_pword` varchar(500) DEFAULT '',
  `user_lname` varchar(100) DEFAULT '',
  `user_fname` varchar(100) DEFAULT '',
  `user_mname` varchar(100) DEFAULT '',
  `user_address` varchar(155) DEFAULT '',
  `user_email` varchar(100) DEFAULT '',
  `user_mobile` varchar(100) DEFAULT '',
  `user_telephone` varchar(100) DEFAULT '',
  `user_bdate` date DEFAULT '0000-00-00',
  `user_group_id` int(11) DEFAULT '0',
  `photo_path` varchar(555) DEFAULT '',
  `file_directory` varchar(666) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `date_deleted` int(11) DEFAULT '0',
  `modified_by_user` int(11) DEFAULT '0',
  `posted_by_user` int(11) DEFAULT '0',
  `deleted_by_user` int(11) DEFAULT '0',
  `is_online` tinyint(4) DEFAULT '0',
  `last_seen` datetime DEFAULT NULL,
  `token_id` text NOT NULL,
  `user_department` bigint(20) DEFAULT '0',
  `journal_approved_by` varchar(145) DEFAULT '',
  `journal_prepared_by` varchar(45) DEFAULT '',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_accounts`
--

LOCK TABLES `user_accounts` WRITE;
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
INSERT INTO `user_accounts` VALUES (1,'jdev','47b4fc9be4e05deb697b109001519b4b2f96455f',' ','System','Administrator','Angeles City, Pampanga','jdevtechsolution@gmail.com','0955-283-3018','','1970-01-01',1,'assets/img/anonymous-icon.png',NULL,'','\0',NULL,'2019-07-04 06:31:15',0,1,0,0,1,'2019-07-04 14:31:15','0ccb3ebc2a9058f7bb00a9272fc9f933',0,'',''),(2,'raf','356a192b7913b04c54574d18c28d46e6395428ab','Manalo','Raf','','','','','','2019-02-05',1,'assets/img/anonymous-icon.png',NULL,'','\0','2019-02-05 11:04:11','2019-02-06 01:58:37',0,1,1,0,1,'2019-02-06 09:58:37','85124ec4a6313daf096fc642045e9f21',0,'',''),(3,'Jack','69f25d688dcc80bf53c46a32c92851a71f3046ec','Felix','Jacklyn','Acibar','','','','','2019-02-05',2,'assets/img/anonymous-icon.png',NULL,'','','2019-02-05 11:08:48','2019-07-04 05:11:06',2147483647,0,2,1,1,'2019-02-05 14:22:35','b0531ca1365e2209a9d614ce54344b87',0,'',''),(4,'jonareyes06','fdb1b2070dae231879a73e7da50f3171bacce3fa','Reyes','Jona','Gopez','','','','','2019-02-05',2,'assets/img/anonymous-icon.png',NULL,'','','2019-02-05 11:09:08','2019-07-04 05:11:08',2147483647,0,1,1,1,'2019-02-05 13:57:04','38f149bee771a68237143990892fa24a',0,'',''),(5,'marissa','356a192b7913b04c54574d18c28d46e6395428ab','Bernandez','Marissa','','','','','','2019-02-05',2,'assets/img/anonymous-icon.png',NULL,'','','2019-02-05 13:26:30','2019-07-04 05:11:10',2147483647,0,1,1,0,'2019-02-05 14:01:13','441332e68ef693c25198b3c4ca0ce5f2',0,'',''),(6,'tin','356a192b7913b04c54574d18c28d46e6395428ab','Acupicup','Tin','','','','','','1970-01-01',2,'assets/img/anonymous-icon.png',NULL,'','','2019-02-05 13:27:02','2019-07-04 05:11:12',2147483647,0,1,1,0,'2019-02-05 13:53:25','14c55a8545bb015598c0c15ac367bb70',0,'',''),(7,'admin','d033e22ae348aeb5660fc2140aec35850c4da997','Administrator','System','','','','','','2019-07-04',1,'assets/img/anonymous-icon.png',NULL,'','\0','2019-07-04 05:11:57','2020-08-12 01:49:43',0,0,1,0,1,'2020-08-12 09:49:43','04013c62af0b68b7a9063720f7847bde',0,'','');
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_rights`
--

DROP TABLE IF EXISTS `user_group_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_rights` (
  `user_rights_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) DEFAULT '0',
  `link_code` varchar(20) DEFAULT '',
  PRIMARY KEY (`user_rights_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_rights`
--

LOCK TABLES `user_group_rights` WRITE;
/*!40000 ALTER TABLE `user_group_rights` DISABLE KEYS */;
INSERT INTO `user_group_rights` VALUES (1,1,'1-1'),(2,1,'1-2'),(3,1,'1-3'),(4,1,'1-4'),(5,1,'1-5'),(6,1,'2-1'),(7,1,'2-2'),(8,1,'2-3'),(10,1,'15-3'),(11,1,'3-1'),(12,1,'3-2'),(13,1,'3-3'),(14,1,'4-2'),(15,1,'4-3'),(16,1,'4-4'),(17,1,'5-1'),(18,1,'5-2'),(19,1,'5-3'),(20,1,'6-1'),(21,1,'6-2'),(22,1,'6-3'),(23,1,'6-4'),(24,1,'6-5'),(25,1,'6-6'),(26,1,'7-1'),(27,1,'9-1'),(28,1,'9-2'),(29,1,'4-1'),(30,1,'8-1'),(31,1,'15-4'),(32,1,'5-4'),(33,1,'2-6'),(34,1,'8-3'),(35,1,'9-3'),(36,1,'6-7'),(37,1,'9-4'),(38,1,'9-6'),(39,1,'9-8'),(40,1,'9-7'),(41,1,'9-5'),(42,1,'8-4'),(43,1,'4-5'),(44,1,'10-1'),(45,1,'9-9'),(46,1,'6-8'),(47,1,'9-10'),(48,1,'1-6'),(49,1,'9-13'),(50,1,'6-9'),(51,1,'9-14'),(52,1,'9-16'),(53,1,'4-6'),(54,1,'10-2'),(55,1,'11-1'),(57,1,'12-1'),(58,1,'12-2'),(59,1,'12-3'),(60,1,'12-4'),(61,1,'12-5'),(62,1,'9-11'),(63,1,'9-15'),(64,1,'9-12'),(65,1,'13-1'),(66,1,'13-2'),(67,1,'13-3'),(68,1,'13-4'),(69,1,'9-17'),(70,1,'9-18'),(71,1,'9-19'),(72,1,'6-10'),(73,1,'14-1'),(74,1,'9-20'),(75,1,'9-21'),(76,1,'6-11'),(77,1,'12-6'),(78,1,'12-7'),(79,1,'2-8'),(80,1,'2-7'),(81,1,'6-12'),(82,1,'15-1'),(83,1,'3-4'),(84,1,'6-13'),(85,1,'15-5'),(86,1,'15-6'),(87,1,'3-5'),(88,1,'4-7'),(89,1,'4-8'),(90,1,'8-5'),(91,1,'3-6'),(92,1,'7-2'),(93,1,'8-6'),(94,1,'3-7'),(95,1,'15-7'),(200,2,'2-1'),(201,2,'2-2'),(202,2,'2-7'),(203,2,'2-8'),(204,2,'3-1'),(205,2,'3-2'),(206,2,'3-4'),(207,2,'3-6'),(208,2,'3-7'),(209,2,'4-2'),(210,2,'4-3'),(211,2,'4-4'),(212,2,'4-7'),(213,2,'4-8'),(214,2,'5-1'),(215,2,'5-2'),(216,2,'5-3'),(217,2,'7-1'),(218,2,'7-2'),(219,2,'8-1'),(220,2,'8-3'),(221,2,'8-4'),(222,2,'8-5'),(223,2,'8-6'),(224,2,'12-4'),(225,2,'12-5'),(226,2,'12-6'),(227,2,'12-7'),(228,2,'15-1'),(229,2,'15-4'),(230,2,'15-5'),(231,2,'15-6');
/*!40000 ALTER TABLE `user_group_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group` varchar(135) DEFAULT '',
  `user_group_desc` varchar(500) DEFAULT '',
  `is_active` bit(1) DEFAULT b'1',
  `is_deleted` bit(1) DEFAULT b'0',
  `date_created` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,'System Administrator','Can access all features.','','\0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Sales Clerk','Sales Clerk','','\0','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database '07032019_sheesha'
--

--
-- Dumping routines for database '07032019_sheesha'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-24 13:23:26
