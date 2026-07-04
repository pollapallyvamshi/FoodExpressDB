-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: foodexpressdb
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('Super Admin','Restaurant Admin','Support') DEFAULT 'Support',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `coupon_id` int NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(30) NOT NULL,
  `discount_percent` decimal(5,2) DEFAULT NULL,
  `minimum_order` decimal(10,2) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `coupon_code` (`coupon_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'WELCOME50',50.00,500.00,'2027-12-31',1),(2,'SAVE20',20.00,300.00,'2027-06-30',1),(3,'FOOD10',10.00,200.00,'2027-03-31',1);
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_addresses`
--

DROP TABLE IF EXISTS `customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_addresses` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `house_no` varchar(20) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `address_type` enum('Home','Work','Other') DEFAULT 'Home',
  PRIMARY KEY (`address_id`),
  KEY `fk_customer_address` (`customer_id`),
  CONSTRAINT `fk_customer_address` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_addresses`
--

LOCK TABLES `customer_addresses` WRITE;
/*!40000 ALTER TABLE `customer_addresses` DISABLE KEYS */;
INSERT INTO `customer_addresses` VALUES (1,1,'10-12','MG Road','Hyderabad','Telangana','500001','Home'),(2,2,'22-10','Brigade Road','Bengaluru','Karnataka','560001','Home'),(3,3,'18-2','Anna Salai','Chennai','Tamil Nadu','600001','Home'),(4,4,'5-1','Beach Road','Visakhapatnam','Andhra Pradesh','530001','Home'),(5,5,'12-8','MG Road','Vijayawada','Andhra Pradesh','520001','Home'),(6,6,'9-4','Main Road','Hyderabad','Telangana','500032','Home'),(7,7,'15-2','Ring Road','Bengaluru','Karnataka','560100','Work'),(8,8,'2-15','Airport Road','Chennai','Tamil Nadu','600027','Home'),(9,9,'7-7','Market Road','Hyderabad','Telangana','500072','Home'),(10,10,'4-12','Station Road','Vijayawada','Andhra Pradesh','520010','Work');
/*!40000 ALTER TABLE `customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_audit`
--

DROP TABLE IF EXISTS `customer_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_audit` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `old_email` varchar(100) DEFAULT NULL,
  `new_email` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_audit`
--

LOCK TABLES `customer_audit` WRITE;
/*!40000 ALTER TABLE `customer_audit` DISABLE KEYS */;
INSERT INTO `customer_audit` VALUES (1,1,'vamshi@gmail.com','vamshi.new@gmail.com','2026-07-03 14:18:20');
/*!40000 ALTER TABLE `customer_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `idx_customer_email` (`email`),
  KEY `idx_customer_phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Vamshi','Pollapally','vamshi.new@gmail.com','9000000001','hash123','2026-07-02 13:31:42','2026-07-03 14:18:20'),(2,'Rahul','Kumar','rahul@gmail.com','9000000002','hash123','2026-07-02 13:31:42','2026-07-02 13:31:42'),(3,'Sneha','Reddy','sneha@gmail.com','9000000003','hash123','2026-07-02 13:31:42','2026-07-02 13:31:42'),(4,'Priya','Sharma','priya@gmail.com','9000000004','hash123','2026-07-02 13:31:42','2026-07-02 13:31:42'),(5,'Kiran','Rao','kiran@gmail.com','9000000005','hash123','2026-07-02 13:31:42','2026-07-02 13:31:42'),(6,'Ajay','Kumar','ajay@gmail.com','9000000006','hash123','2026-07-02 13:31:42','2026-07-02 13:31:42'),(7,'Deepika','Singh','deepika@gmail.com','9000000007','hash123','2026-07-02 13:31:42','2026-07-02 13:31:42'),(8,'Arjun','Patel','arjun@gmail.com','9000000008','hash123','2026-07-02 13:31:42','2026-07-02 13:31:42'),(9,'Divya','Rao','divya@gmail.com','9000000009','hash123','2026-07-02 13:31:42','2026-07-02 13:31:42'),(10,'Rakesh','Gupta','rakesh@gmail.com','9000000010','hash123','2026-07-02 13:31:42','2026-07-02 13:31:42');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveries` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `partner_id` int NOT NULL,
  `assigned_time` timestamp NULL DEFAULT NULL,
  `delivered_time` timestamp NULL DEFAULT NULL,
  `delivery_status` enum('Assigned','Picked Up','On The Way','Delivered') DEFAULT 'Assigned',
  PRIMARY KEY (`delivery_id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `fk_delivery_partner` (`partner_id`),
  KEY `idx_delivery_status` (`delivery_status`),
  CONSTRAINT `fk_delivery_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `fk_delivery_partner` FOREIGN KEY (`partner_id`) REFERENCES `delivery_partners` (`partner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES (1,1,1,'2026-07-02 13:36:31','2026-07-02 13:36:31','Delivered'),(2,2,2,'2026-07-02 13:36:31','2026-07-02 13:36:31','Delivered'),(3,3,3,'2026-07-02 13:36:31',NULL,'On The Way'),(4,4,4,'2026-07-02 13:36:31',NULL,'Picked Up'),(5,5,5,'2026-07-02 13:36:31',NULL,'Assigned'),(6,6,1,'2026-07-02 13:36:31','2026-07-02 13:36:31','Delivered'),(7,7,2,'2026-07-02 13:36:31',NULL,'On The Way'),(8,8,3,'2026-07-02 13:36:31','2026-07-02 13:36:31','Delivered'),(9,9,4,'2026-07-02 13:36:31',NULL,'Picked Up'),(10,10,5,'2026-07-02 13:36:31',NULL,'Assigned');
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_partners`
--

DROP TABLE IF EXISTS `delivery_partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_partners` (
  `partner_id` int NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `vehicle_number` varchar(20) DEFAULT NULL,
  `vehicle_type` enum('Bike','Scooter','Bicycle') DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`partner_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `vehicle_number` (`vehicle_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_partners`
--

LOCK TABLES `delivery_partners` WRITE;
/*!40000 ALTER TABLE `delivery_partners` DISABLE KEYS */;
INSERT INTO `delivery_partners` VALUES (1,'Arjun Kumar','9011111111','TS09AB1234','Bike',1),(2,'Rahul Singh','9011111112','KA05CD5678','Scooter',1),(3,'Mahesh Rao','9011111113','AP16EF9876','Bike',1),(4,'Suresh Patel','9011111114','TS10GH1122','Scooter',1),(5,'Kiran Reddy','9011111115','KA09JK3344','Bike',1);
/*!40000 ALTER TABLE `delivery_partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_categories`
--

DROP TABLE IF EXISTS `food_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_categories` (
  `food_category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`food_category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_categories`
--

LOCK TABLES `food_categories` WRITE;
/*!40000 ALTER TABLE `food_categories` DISABLE KEYS */;
INSERT INTO `food_categories` VALUES (8,'Beverage'),(4,'Biryani'),(6,'Burger'),(7,'Dessert'),(10,'Ice Cream'),(2,'Main Course'),(5,'Pizza'),(3,'Rice'),(9,'Snacks'),(1,'Starters');
/*!40000 ALTER TABLE `food_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_items`
--

DROP TABLE IF EXISTS `food_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_items` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_id` int NOT NULL,
  `food_category_id` int NOT NULL,
  `food_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `is_available` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`food_id`),
  KEY `fk_food_restaurant` (`restaurant_id`),
  KEY `fk_food_category` (`food_category_id`),
  KEY `idx_food_name` (`food_name`),
  CONSTRAINT `fk_food_category` FOREIGN KEY (`food_category_id`) REFERENCES `food_categories` (`food_category_id`),
  CONSTRAINT `fk_food_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_items`
--

LOCK TABLES `food_items` WRITE;
/*!40000 ALTER TABLE `food_items` DISABLE KEYS */;
INSERT INTO `food_items` VALUES (1,1,4,'Chicken Dum Biryani','Hyderabadi style chicken biryani',319.00,1,'2026-07-02 13:33:33'),(2,1,4,'Mutton Biryani','Spicy mutton biryani',399.00,1,'2026-07-02 13:33:33'),(3,1,2,'Chicken Curry','Rich chicken curry',249.00,1,'2026-07-02 13:33:33'),(4,2,5,'Margherita Pizza','Classic cheese pizza',249.00,1,'2026-07-02 13:33:33'),(5,2,5,'Farmhouse Pizza','Loaded vegetable pizza',399.00,1,'2026-07-02 13:33:33'),(6,2,8,'Pepsi','Soft drink',49.00,1,'2026-07-02 13:33:33'),(7,3,6,'Chicken Burger','Crispy chicken burger',199.00,1,'2026-07-02 13:33:33'),(8,3,6,'Veg Burger','Vegetable burger',149.00,1,'2026-07-02 13:33:33'),(9,3,9,'French Fries','Salted fries',99.00,1,'2026-07-02 13:33:33'),(10,4,5,'Veg Pizza','Fresh vegetable pizza',299.00,1,'2026-07-02 13:33:33'),(11,4,5,'Paneer Pizza','Paneer topping pizza',349.00,1,'2026-07-02 13:33:33'),(12,4,8,'Coke','Cold drink',49.00,1,'2026-07-02 13:33:33'),(13,5,2,'Paneer Butter Masala','Creamy paneer curry',279.00,1,'2026-07-02 13:33:33'),(14,5,2,'Butter Chicken','Classic butter chicken',329.00,1,'2026-07-02 13:33:33'),(15,5,1,'Chicken Tikka','Grilled chicken starter',249.00,1,'2026-07-02 13:33:33'),(16,6,2,'Masala Dosa','Traditional dosa',129.00,1,'2026-07-02 13:33:33'),(17,6,2,'Idli Sambar','Soft idli with sambar',99.00,1,'2026-07-02 13:33:33'),(18,6,8,'Filter Coffee','South Indian coffee',59.00,1,'2026-07-02 13:33:33'),(19,7,2,'Veg Noodles','Hakka noodles',199.00,1,'2026-07-02 13:33:33'),(20,7,2,'Chicken Noodles','Chicken noodles',249.00,1,'2026-07-02 13:33:33'),(21,7,1,'Spring Rolls','Veg spring rolls',149.00,1,'2026-07-02 13:33:33'),(22,8,8,'Cold Coffee','Chilled coffee',149.00,1,'2026-07-02 13:33:33'),(23,8,7,'Chocolate Cake','Chocolate pastry',199.00,1,'2026-07-02 13:33:33'),(24,8,8,'Cappuccino','Hot coffee',129.00,1,'2026-07-02 13:33:33'),(25,9,7,'Black Forest Cake','Fresh cake',399.00,1,'2026-07-02 13:33:33'),(26,9,7,'Veg Puff','Bakery puff',49.00,1,'2026-07-02 13:33:33'),(27,9,8,'Mango Juice','Fresh juice',89.00,1,'2026-07-02 13:33:33'),(28,10,10,'Vanilla Ice Cream','Vanilla scoop',99.00,1,'2026-07-02 13:33:33'),(29,10,10,'Chocolate Ice Cream','Chocolate scoop',119.00,1,'2026-07-02 13:33:33'),(30,10,7,'Brownie','Chocolate brownie',149.00,1,'2026-07-02 13:33:33');
/*!40000 ALTER TABLE `food_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_price_history`
--

DROP TABLE IF EXISTS `food_price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_price_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `food_id` int DEFAULT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `new_price` decimal(10,2) DEFAULT NULL,
  `changed_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_price_history`
--

LOCK TABLES `food_price_history` WRITE;
/*!40000 ALTER TABLE `food_price_history` DISABLE KEYS */;
INSERT INTO `food_price_history` VALUES (1,1,299.00,319.00,'2026-07-03 14:19:15');
/*!40000 ALTER TABLE `food_price_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_coupon`
--

DROP TABLE IF EXISTS `order_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_coupon` (
  `order_coupon_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `coupon_id` int NOT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_coupon_id`),
  KEY `fk_oc_order` (`order_id`),
  KEY `fk_oc_coupon` (`coupon_id`),
  CONSTRAINT `fk_oc_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`coupon_id`),
  CONSTRAINT `fk_oc_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_coupon`
--

LOCK TABLES `order_coupon` WRITE;
/*!40000 ALTER TABLE `order_coupon` DISABLE KEYS */;
INSERT INTO `order_coupon` VALUES (1,1,1,299.00),(2,2,2,89.60),(3,5,3,57.80);
/*!40000 ALTER TABLE `order_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `food_id` int NOT NULL,
  `quantity` int NOT NULL,
  `item_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `fk_orderitem_order` (`order_id`),
  KEY `fk_orderitem_food` (`food_id`),
  CONSTRAINT `fk_orderitem_food` FOREIGN KEY (`food_id`) REFERENCES `food_items` (`food_id`),
  CONSTRAINT `fk_orderitem_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_chk_1` CHECK ((`quantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,299.00),(2,1,2,1,399.00),(3,2,4,1,249.00),(4,2,5,1,399.00),(5,3,7,1,199.00),(6,3,9,1,99.00),(7,4,10,1,299.00),(8,4,11,1,349.00),(9,5,13,1,279.00),(10,5,14,1,329.00),(11,6,16,1,129.00),(12,6,17,1,99.00),(13,7,19,1,199.00),(14,7,20,1,249.00),(15,8,22,1,149.00),(16,8,23,1,199.00),(17,9,25,1,399.00),(18,9,26,1,49.00),(19,10,28,1,99.00),(20,10,29,1,119.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` enum('Pending','Confirmed','Preparing','Out For Delivery','Delivered','Cancelled') DEFAULT 'Pending',
  `total_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_customer` (`customer_id`),
  KEY `fk_order_restaurant` (`restaurant_id`),
  KEY `idx_order_date` (`order_date`),
  KEY `idx_order_status` (`order_status`),
  CONSTRAINT `fk_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `fk_order_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,'2026-07-02 13:34:32','Delivered',598.00),(2,2,2,'2026-07-02 13:34:32','Delivered',448.00),(3,3,3,'2026-07-02 13:34:32','Preparing',298.00),(4,4,4,'2026-07-02 13:34:32','Confirmed',348.00),(5,5,5,'2026-07-02 13:34:32','Pending',578.00),(6,6,6,'2026-07-02 13:34:32','Delivered',188.00),(7,7,7,'2026-07-02 13:34:32','Out For Delivery',398.00),(8,8,8,'2026-07-02 13:34:32','Delivered',348.00),(9,9,9,'2026-07-02 13:34:32','Preparing',488.00),(10,10,10,'2026-07-02 13:34:32','Confirmed',218.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_method` enum('UPI','Credit Card','Debit Card','Cash On Delivery') NOT NULL,
  `payment_status` enum('Pending','Success','Failed') DEFAULT 'Pending',
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `order_id` (`order_id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `idx_payment_status` (`payment_status`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'UPI','Success','TXN100001','2026-07-02 13:36:05'),(2,2,'Credit Card','Success','TXN100002','2026-07-02 13:36:05'),(3,3,'Cash On Delivery','Pending','TXN100003','2026-07-02 13:36:05'),(4,4,'Debit Card','Success','TXN100004','2026-07-02 13:36:05'),(5,5,'UPI','Pending','TXN100005','2026-07-02 13:36:05'),(6,6,'UPI','Success','TXN100006','2026-07-02 13:36:05'),(7,7,'Credit Card','Success','TXN100007','2026-07-02 13:36:05'),(8,8,'Cash On Delivery','Success','TXN100008','2026-07-02 13:36:05'),(9,9,'Debit Card','Pending','TXN100009','2026-07-02 13:36:05'),(10,10,'UPI','Success','TXN100010','2026-07-02 13:36:05');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_categories`
--

DROP TABLE IF EXISTS `restaurant_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_categories`
--

LOCK TABLES `restaurant_categories` WRITE;
/*!40000 ALTER TABLE `restaurant_categories` DISABLE KEYS */;
INSERT INTO `restaurant_categories` VALUES (8,'Bakery'),(6,'Biryani'),(7,'Cafe'),(3,'Chinese'),(9,'Desserts'),(4,'Fast Food'),(10,'Multi Cuisine'),(2,'North Indian'),(5,'Pizza'),(1,'South Indian');
/*!40000 ALTER TABLE `restaurant_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `restaurant_name` varchar(100) NOT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT '0.0',
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`restaurant_id`),
  KEY `fk_restaurant_category` (`category_id`),
  KEY `idx_restaurant_name` (`restaurant_name`),
  CONSTRAINT `fk_restaurant_category` FOREIGN KEY (`category_id`) REFERENCES `restaurant_categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,6,'Paradise Biryani','vamshi krishna','9876543210','paradise@gmail.com','Hyderabad',4.6,1),(2,5,'Dominos Pizza','Shiva','9876543211','dominos@gmail.com','Bengaluru',4.5,1),(3,4,'KFC','sai','9876543212','kfc@gmail.com','Chennai',4.4,1),(4,5,'Pizza Hut','Rahul ','9876543213','pizzahut@gmail.com','Hyderabad',4.3,1),(5,10,'Barbeque Nation','Ajay ','9876543214','bbq@gmail.com','Vijayawada',4.7,1),(6,1,'A2B','Mohan Rao','9876543215','a2b@gmail.com','Bengaluru',4.2,1),(7,3,'Mainland China','chethan Kumar','9876543216','china@gmail.com','Hyderabad',4.4,1),(8,7,'Cafe Coffee Day','Sanjay Kumar','9876543217','ccd@gmail.com','Chennai',4.1,1),(9,8,'Karachi Bakery','ravi','9876543218','karachi@gmail.com','Hyderabad',4.8,1),(10,9,'Cream Stone','Vinay Kumar','9876543219','creamstone@gmail.com','Visakhapatnam',4.6,1);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `rating` int DEFAULT NULL,
  `review_text` varchar(500) DEFAULT NULL,
  `review_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `fk_review_order` (`order_id`),
  KEY `fk_review_customer` (`customer_id`),
  KEY `fk_review_restaurant` (`restaurant_id`),
  CONSTRAINT `fk_review_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `fk_review_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `fk_review_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`),
  CONSTRAINT `reviews_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,1,1,5,'Excellent biryani and fast delivery','2026-07-02 13:36:42'),(2,2,2,2,4,'Pizza was fresh and tasty','2026-07-02 13:36:42'),(3,6,6,6,5,'Loved the dosa','2026-07-02 13:36:42'),(4,8,8,8,4,'Coffee was good','2026-07-02 13:36:42'),(5,10,10,10,5,'Ice cream was delicious','2026-07-02 13:36:42');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_customer_order_history`
--

DROP TABLE IF EXISTS `vw_customer_order_history`;
/*!50001 DROP VIEW IF EXISTS `vw_customer_order_history`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_customer_order_history` AS SELECT 
 1 AS `order_id`,
 1 AS `customer_name`,
 1 AS `restaurant_name`,
 1 AS `total_amount`,
 1 AS `order_status`,
 1 AS `order_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_customer_order_history`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer_order_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer_order_history` AS select `o`.`order_id` AS `order_id`,concat(`c`.`first_name`,' ',`c`.`last_name`) AS `customer_name`,`r`.`restaurant_name` AS `restaurant_name`,`o`.`total_amount` AS `total_amount`,`o`.`order_status` AS `order_status`,`o`.`order_date` AS `order_date` from ((`orders` `o` join `customers` `c` on((`o`.`customer_id` = `c`.`customer_id`))) join `restaurants` `r` on((`o`.`restaurant_id` = `r`.`restaurant_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-04  8:30:15
