-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: 127.0.0.1    Database: finalproject
-- ------------------------------------------------------
-- Server version	5.6.23

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
-- Table structure for table `AhCounterReport`
--

DROP TABLE IF EXISTS `AhCounterReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AhCounterReport` (
  `AhCounterReportID` int(11) NOT NULL AUTO_INCREMENT,
  `MeetingID` int(11) NOT NULL,
  `AhCounter` int(11) NOT NULL,
  `RolePlayer` varchar(100) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Ah` int(11) DEFAULT NULL,
  `Um` int(11) DEFAULT NULL,
  `RepeatWords` varchar(500) DEFAULT NULL,
  `Like` int(11) DEFAULT NULL,
  `YouKnow` int(11) DEFAULT NULL,
  `AndButOrSo` int(11) DEFAULT NULL,
  `GoodUsage` varchar(500) DEFAULT NULL,
  `WODUsage` int(11) DEFAULT NULL,
  PRIMARY KEY (`AhCounterReportID`),
  KEY `fk_AhCounter_meetingID_idx` (`MeetingID`),
  KEY `fk_Ahcounter_Ahcounter_idx` (`AhCounter`),
  CONSTRAINT `fk_AhCounter_meetingID` FOREIGN KEY (`MeetingID`) REFERENCES `Meeting` (`MeetingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ahcounter_Ahcounter` FOREIGN KEY (`AhCounter`) REFERENCES `MemberTable` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AhCounterReport`
--

LOCK TABLES `AhCounterReport` WRITE;
/*!40000 ALTER TABLE `AhCounterReport` DISABLE KEYS */;
/*!40000 ALTER TABLE `AhCounterReport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BalanceSheet`
--

DROP TABLE IF EXISTS `BalanceSheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BalanceSheet` (
  `BalanceSheetID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `Treasurer` int(11) NOT NULL,
  `Amount` double NOT NULL,
  `ClubNo` int(11) NOT NULL,
  `Comment` varchar(100) NOT NULL,
  PRIMARY KEY (`BalanceSheetID`),
  KEY `Fk_Balance_Club_idx` (`ClubNo`),
  KEY `Fk_Blalance_Treasurer_idx` (`Treasurer`),
  KEY `Fk_Balance_CustomerID_idx` (`CustomerID`),
  CONSTRAINT `Fk_Balance_Club` FOREIGN KEY (`ClubNo`) REFERENCES `Club` (`ClubNo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_Balance_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `MemberTable` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_Blalance_Treasurer` FOREIGN KEY (`Treasurer`) REFERENCES `MemberTable` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BalanceSheet`
--

LOCK TABLES `BalanceSheet` WRITE;
/*!40000 ALTER TABLE `BalanceSheet` DISABLE KEYS */;
INSERT INTO `BalanceSheet` VALUES (1,99999,99999,-222,1111,''),(2,2844821,99999,300,1111,'new comment');
/*!40000 ALTER TABLE `BalanceSheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CheckIn`
--

DROP TABLE IF EXISTS `CheckIn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CheckIn` (
  `CheckInID` int(11) NOT NULL AUTO_INCREMENT,
  `ClubNo` int(11) NOT NULL,
  `MeetingID` int(11) NOT NULL,
  `GuestID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CheckInID`),
  KEY `Fk_CheckIn_Member_idx` (`CustomerID`),
  KEY `Fk_CheckIn_Guest_idx` (`GuestID`),
  KEY `Fk_Checkin_Meeting_idx` (`MeetingID`),
  KEY `Fk_CheckIn_Club_idx` (`ClubNo`),
  CONSTRAINT `Fk_CheckIn_Club` FOREIGN KEY (`ClubNo`) REFERENCES `Club` (`ClubNo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_CheckIn_Guest` FOREIGN KEY (`GuestID`) REFERENCES `GuestTable` (`GuestID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_CheckIn_Member` FOREIGN KEY (`CustomerID`) REFERENCES `MemberTable` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_Checkin_Meeting` FOREIGN KEY (`MeetingID`) REFERENCES `Meeting` (`MeetingID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CheckIn`
--

LOCK TABLES `CheckIn` WRITE;
/*!40000 ALTER TABLE `CheckIn` DISABLE KEYS */;
INSERT INTO `CheckIn` VALUES (1,1111,6,NULL,99999),(2,1111,6,1,NULL),(3,1111,6,NULL,NULL),(4,1111,6,2,NULL),(5,1111,6,1,NULL),(6,1111,6,NULL,3749057),(7,1111,6,1,NULL),(9,1111,6,NULL,4484137);
/*!40000 ALTER TABLE `CheckIn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Club`
--

DROP TABLE IF EXISTS `Club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Club` (
  `ClubNo` int(11) NOT NULL,
  `ClubName` varchar(200) NOT NULL,
  `Area` varchar(5) NOT NULL,
  `Division` varchar(2) NOT NULL,
  `District` int(11) NOT NULL,
  PRIMARY KEY (`ClubNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Club`
--

LOCK TABLES `Club` WRITE;
/*!40000 ALTER TABLE `Club` DISABLE KEYS */;
INSERT INTO `Club` VALUES (1111,'Club1','A1','D1',31),(1234,'Admin Club','A','D',1000);
/*!40000 ALTER TABLE `Club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EvaluatorReport`
--

DROP TABLE IF EXISTS `EvaluatorReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EvaluatorReport` (
  `EvaluatorReportID` int(11) NOT NULL AUTO_INCREMENT,
  `MeetingID` int(11) DEFAULT NULL,
  `Evaluator` int(11) DEFAULT NULL,
  `RolePlayer` varchar(100) DEFAULT NULL,
  `Role` varchar(45) DEFAULT NULL,
  `Commendations` varchar(1000) DEFAULT NULL,
  `Recommendation` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`EvaluatorReportID`),
  KEY `fk_evaluator_meetingid_idx` (`MeetingID`),
  KEY `fk_evaluator_evaluator_idx` (`Evaluator`),
  CONSTRAINT `fk_evaluator_evaluator` FOREIGN KEY (`Evaluator`) REFERENCES `MemberTable` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evaluator_meetingid` FOREIGN KEY (`MeetingID`) REFERENCES `Meeting` (`MeetingID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EvaluatorReport`
--

LOCK TABLES `EvaluatorReport` WRITE;
/*!40000 ALTER TABLE `EvaluatorReport` DISABLE KEYS */;
INSERT INTO `EvaluatorReport` VALUES (1,6,99999,'Gen D Ohta','Evaluator','Commendations','Recommendations');
/*!40000 ALTER TABLE `EvaluatorReport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExecutiveComittee`
--

DROP TABLE IF EXISTS `ExecutiveComittee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExecutiveComittee` (
  `ComitteeID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `ExCommRoleID` int(11) NOT NULL,
  PRIMARY KEY (`ComitteeID`),
  KEY `CustomerID_idx` (`CustomerID`),
  KEY `ExCommRoleID_idx` (`ExCommRoleID`),
  CONSTRAINT `ExceutiveCommID` FOREIGN KEY (`ExCommRoleID`) REFERENCES `ExecutiveComitteeRoles` (`ExCommRoleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExecutiveComittee`
--

LOCK TABLES `ExecutiveComittee` WRITE;
/*!40000 ALTER TABLE `ExecutiveComittee` DISABLE KEYS */;
INSERT INTO `ExecutiveComittee` VALUES (1,123456,1),(2,99999,2);
/*!40000 ALTER TABLE `ExecutiveComittee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExecutiveComitteeRoles`
--

DROP TABLE IF EXISTS `ExecutiveComitteeRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExecutiveComitteeRoles` (
  `ExCommRoleID` int(11) NOT NULL AUTO_INCREMENT,
  `ExecutiveComitteeRole` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ExCommRoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExecutiveComitteeRoles`
--

LOCK TABLES `ExecutiveComitteeRoles` WRITE;
/*!40000 ALTER TABLE `ExecutiveComitteeRoles` DISABLE KEYS */;
INSERT INTO `ExecutiveComitteeRoles` VALUES (1,'Admin'),(2,'President'),(3,'VicePresident-Education'),(4,'VicePresident-Membership'),(5,'VicePresident-PublicRelations'),(6,'Treasurer'),(7,'Secretary'),(8,'Sergeant At Arms');
/*!40000 ALTER TABLE `ExecutiveComitteeRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GeneralEvaluationReport`
--

DROP TABLE IF EXISTS `GeneralEvaluationReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeneralEvaluationReport` (
  `GeneralEvaluationID` int(11) NOT NULL AUTO_INCREMENT,
  `GeneralEvaluator` int(11) NOT NULL,
  `Meeting` int(11) NOT NULL,
  `President` int(11) NOT NULL,
  `ToastMaster` int(11) NOT NULL,
  `TableTopicsMaster` int(11) NOT NULL,
  `TableTopicsSpeakers` int(11) NOT NULL,
  `Evaluators` int(11) NOT NULL,
  `Comments` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`GeneralEvaluationID`),
  KEY `Fl_GE_GE_idx` (`GeneralEvaluator`),
  KEY `Fk_GE_Meeting_idx` (`Meeting`),
  CONSTRAINT `Fk_GE_GE` FOREIGN KEY (`GeneralEvaluator`) REFERENCES `MemberTable` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_GE_Meeting` FOREIGN KEY (`Meeting`) REFERENCES `Meeting` (`MeetingID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GeneralEvaluationReport`
--

LOCK TABLES `GeneralEvaluationReport` WRITE;
/*!40000 ALTER TABLE `GeneralEvaluationReport` DISABLE KEYS */;
INSERT INTO `GeneralEvaluationReport` VALUES (1,2844821,6,12,30,48,72,99,'comments');
/*!40000 ALTER TABLE `GeneralEvaluationReport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GrammarianReport`
--

DROP TABLE IF EXISTS `GrammarianReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GrammarianReport` (
  `GrammarianReportID` int(11) NOT NULL AUTO_INCREMENT,
  `MeetingID` int(11) DEFAULT NULL,
  `Grammarian` int(11) DEFAULT NULL,
  `RolePlayer` varchar(100) DEFAULT NULL,
  `Role` varchar(45) DEFAULT NULL,
  `GoodUsages` varchar(500) DEFAULT NULL,
  `NotSoGoodUsages` varchar(500) DEFAULT NULL,
  `WODUsage` int(11) DEFAULT NULL,
  PRIMARY KEY (`GrammarianReportID`),
  KEY `fk_gramm_meetingid_idx` (`MeetingID`),
  KEY `fk_gramm_grammarian_idx` (`Grammarian`),
  CONSTRAINT `fk_gramm_grammarian` FOREIGN KEY (`Grammarian`) REFERENCES `MemberTable` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_gramm_meetingid` FOREIGN KEY (`MeetingID`) REFERENCES `Meeting` (`MeetingID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GrammarianReport`
--

LOCK TABLES `GrammarianReport` WRITE;
/*!40000 ALTER TABLE `GrammarianReport` DISABLE KEYS */;
/*!40000 ALTER TABLE `GrammarianReport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GuestTable`
--

DROP TABLE IF EXISTS `GuestTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GuestTable` (
  `GuestID` int(11) NOT NULL AUTO_INCREMENT,
  `GuestName` varchar(100) NOT NULL,
  `GuestEmailID` varchar(100) NOT NULL,
  `ClubNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`GuestID`),
  KEY `FK_Guests_Club_idx` (`ClubNo`),
  CONSTRAINT `FK_Guests_Club` FOREIGN KEY (`ClubNo`) REFERENCES `Club` (`ClubNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GuestTable`
--

LOCK TABLES `GuestTable` WRITE;
/*!40000 ALTER TABLE `GuestTable` DISABLE KEYS */;
INSERT INTO `GuestTable` VALUES (1,'Sandeep','sandyhmmm@gmail.com',1111),(2,'Aravind','virgoaravind@gmail.com',1111),(3,'Mansi Deo','mansi.bdeo@gmail.com',1111);
/*!40000 ALTER TABLE `GuestTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Meeting`
--

DROP TABLE IF EXISTS `Meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Meeting` (
  `MeetingID` int(11) NOT NULL AUTO_INCREMENT,
  `MeetingName` varchar(45) NOT NULL,
  `MeetingDate` datetime NOT NULL,
  `Humorist` varchar(100) DEFAULT NULL,
  `Toastmaster` varchar(100) DEFAULT NULL,
  `GeneralEvaluator` varchar(100) DEFAULT NULL,
  `Timer` varchar(100) DEFAULT NULL,
  `AHCounter` varchar(100) DEFAULT NULL,
  `Grammarian` varchar(100) DEFAULT NULL,
  `Speaker1` varchar(100) DEFAULT NULL,
  `Evaluator1` varchar(100) DEFAULT NULL,
  `Speaker2` varchar(100) DEFAULT NULL,
  `Evaluator2` varchar(100) DEFAULT NULL,
  `Speaker3` varchar(100) DEFAULT NULL,
  `Evaluator3` varchar(100) DEFAULT NULL,
  `Speaker4` varchar(100) DEFAULT NULL,
  `Evaluator4` varchar(100) DEFAULT NULL,
  `Speaker5` varchar(100) DEFAULT NULL,
  `Evaluator5` varchar(100) DEFAULT NULL,
  `TTMaster` varchar(100) DEFAULT NULL,
  `Status` varchar(10) NOT NULL,
  `ClubNo` int(11) NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  PRIMARY KEY (`MeetingID`),
  KEY `club_idx` (`ClubNo`),
  KEY `creator_idx` (`CreatedBy`),
  CONSTRAINT `club` FOREIGN KEY (`ClubNo`) REFERENCES `Club` (`ClubNo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `creator` FOREIGN KEY (`CreatedBy`) REFERENCES `MemberTable` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meeting`
--

LOCK TABLES `Meeting` WRITE;
/*!40000 ALTER TABLE `Meeting` DISABLE KEYS */;
INSERT INTO `Meeting` VALUES (3,'Meeting1','2015-04-15 00:00:00',NULL,'','','','','','','','','','','',NULL,NULL,NULL,NULL,'','open',1111,2844821),(4,'Meeting2','2015-04-03 00:00:00',NULL,'','','','','','','','','','','','','','','','','open',1111,2844821),(5,'Meeting 3','2015-04-23 00:00:00',NULL,NULL,'','','','','','','','','','','','','','','','open',1111,2844821),(6,'Meeting2','2015-04-17 00:00:00','Not Available','Not Available','','','','','','','','','','','','','','','','checkin',1111,2844821),(7,'Meeting 3','2015-04-22 00:00:00','Not Available','Not Available','','','','','','','','','Not Available','Not Available','Not Available','Not Available','Not Available','Not Available','','open',1111,2844821),(8,'New Test Meeting','2015-04-29 00:00:00','Not Available','Sandeep Kumar RM, CC, CL','General Evaluator','','Sandeep Kumar RM, CC, CL','Sandeep Kumar RM, CC, CL','','','','President','Not Available','Not Available','Not Available','Not Available','Not Available','Not Available','','complete',1111,99999),(9,'New Meeting','2015-04-30 00:00:00','Not Available','','','','','','','','','','Not Available','Not Available','Not Available','Not Available','Not Available','Not Available','','open',1111,99999);
/*!40000 ALTER TABLE `Meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberTable`
--

DROP TABLE IF EXISTS `MemberTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MemberTable` (
  `CustomerId` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `MailStop` varchar(50) DEFAULT NULL,
  `AddrL1` varchar(200) NOT NULL,
  `AddrL2` varchar(200) DEFAULT NULL,
  `AddrL3` varchar(200) DEFAULT NULL,
  `AddrL4` varchar(200) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(15) NOT NULL DEFAULT 'password',
  `Secondaryemail` varchar(100) DEFAULT NULL,
  `Home` varchar(20) DEFAULT NULL,
  `Work` varchar(15) DEFAULT NULL,
  `Fax` varchar(15) DEFAULT NULL,
  `Mobile` varchar(15) DEFAULT NULL,
  `MembershipPeriod` varchar(45) NOT NULL,
  `MemberSince` varchar(15) NOT NULL,
  `Status` varchar(6) NOT NULL,
  `ClubNo` int(11) NOT NULL,
  PRIMARY KEY (`CustomerId`),
  KEY `ClubNo_idx` (`ClubNo`),
  CONSTRAINT `ClubNo` FOREIGN KEY (`ClubNo`) REFERENCES `Club` (`ClubNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberTable`
--

LOCK TABLES `MemberTable` WRITE;
/*!40000 ALTER TABLE `MemberTable` DISABLE KEYS */;
INSERT INTO `MemberTable` VALUES (99999,'President','','Address 1','','','','president@mail.com','12345','','','','',NULL,'Membership Period','2014-09-10','Active',1111),(123456,'Admin',NULL,'Admin Addr',NULL,NULL,NULL,'admin@admin.com','admin',NULL,'9876543210',NULL,NULL,NULL,'Mmenbership','01/02/2014','Active',1234),(2807290,'Taylor Alyssa Kalomeris','','420 Massachusetts Ave Apt 7','','','','Kalomeris.t@husky.neu.edu','password','','1(413)478-4694','','','','4/1/2015 - 9/30/2015','10/01/2012','Active',1111),(2807501,'Frances C. Phenix','','52 Quincy St # 2','','','','fcphenix@gmail.com','password','','1(617)445-7756','1(617)373-3392','','1(617)412-0167','10/1/2014 - 3/31/2015','10/01/2012','Grace',1111),(2841502,'Conrad John Cheeks, ACB, CL','','30 Pontiac St','','','','conrad.cheeks@gmail.com','password','','1(202)529-9166','','','1(202)210-0023','10/1/2014 - 3/31/2015','10/01/2012','Grace',1111),(2844821,'Sandeep Kumar RM, CC, CL','','776 Columbus Ave Apt 1','','','','sandyhmmm@gmail.com','password','','919840158289__','','','1(650)713-1229','4/1/2015 - 9/30/2015','11/01/2012','Active',1111),(2988302,'Yi Ma','','78 Gainsborough St Unit 402E','','','','ma.yi1@husky.neu.edu','password','','1(617)922-4917','','','','4/1/2015 - 9/30/2015','02/01/2013','Active',1111),(3535458,'Amanda Anne Dell\'Olio','','27 Webster St','','','','amandadellolio@gmail.com','password','','1(201)997-0738','','','1(551)580-6348','4/1/2015 - 9/30/2015','10/01/2013','Active',1111),(3535474,'Lars E. King','','696 Columbus Ave # 5517','','','','king.lar@husky.neu.edu','password','','1(952)906-1880','','','1(952)334-9096','10/1/2014 - 3/31/2015','10/01/2013','Grace',1111),(3592537,'Dongming Lu','','105 9th St. SE','','','','lv.d@husky.neu.edu','password','','1(617)513-5967','','','','4/1/2015 - 9/30/2015','10/01/2013','Active',1111),(3592539,'Nicolaus Windekilde Jannasch','','532 Herrmann Dr','','','','njannasch@mac.com','password','','1(831)920-7757','','','1(831)920-7757','10/1/2014 - 3/31/2015','10/01/2013','Grace',1111),(3749057,'Gen D Ohta','','696 Columbus Ave # 5565','','','','ohta.g@husky.neu.edu','password','','','','','','4/1/2015 - 9/30/2015','02/01/2014','Active',1111),(4145038,'Ronald Salazar','','386 marlborough st','','','','ronald.salazar.soto1@gmail.com','password','','1(001)230-9233','','','','10/1/2014 - 3/31/2015','08/01/2014','Grace',1111),(4196285,'Carter J. Rogan','','813 Parker St Apt 1','','','','carterrogan@gmail.com','password','','','','','1(857)383-9975','10/1/2014 - 3/31/2015','10/01/2014','Grace',1111),(4196288,'Chris W. Canal','Northeastern University','14 Irving St Apt 1','','','','chriscanal@chriscanal.com','password','','','','','1(832)671-5487','10/1/2014 - 3/31/2015','10/01/2014','Grace',1111),(4212479,'Akash Bhatnagar','','25 Chester St Apt 6','','','','bhatnagar.a@husky.neu.edu','password','','','','','1(857)400-1471','10/1/2014 - 3/31/2015','10/01/2014','Grace',1111),(4212565,'Niket Shah','','311 Huntington Ave Apt 4B','','','','niketshah554@gmail.com','password','','','','','1(413)801-4997','10/1/2014 - 3/31/2015','10/01/2014','Grace',1111),(4212579,'Jia Chen','Box 403','47 Symphony Rd','','','','chen.jia1@husky.neu.edu','password','','','','','','10/1/2014 - 3/31/2015','09/01/2014','Grace',1111),(4212587,'Pranav R. Nellore','','21 Forsyth St','','','','venkatpranav@gmail.com','password','','','','','1(617)331-3712','10/1/2014 - 3/31/2015','10/01/2014','Grace',1111),(4271537,'Keshav Gupta','Northeastern Univ / Mailbox #1922','10 Speare Pl','','','','kes1996@gmail.com','password','','','','','1(908)552-9855','10/1/2014 - 3/31/2015','10/01/2014','Grace',1111),(4284721,'Nathan Archer','','142 Davis Ave Apt 1','','','','archer.n@husky.neu.edu','password','','','','','1(805)835-5392','4/1/2015 - 9/30/2015','10/01/2014','Active',1111),(4287391,'Wenting Ma','','163 Maple St','','','','mawenting1995@gmail.com','password','','','','','1(617)893-3778','10/1/2014 - 3/31/2015','10/01/2014','Grace',1111),(4287573,'Yicong(Dennis) Guo','','73 Westland Ave','','','','guo.yic@husky.neu.edu','password','','1(909)908-3054','','','','10/1/2014 - 3/31/2015','10/01/2014','Grace',1111),(4451082,'Yuan Gao','','56 Queensberry St','apartment 6','','','gao.yuan@husky.neu.edu','password','','1(857)284-3560','','','','4/1/2015 - 9/30/2015','02/01/2015','Active',1111),(4461183,'Harshad S. Deshpande','','75 Saint Alphonsus St Apt 1406','','','','deshpande.h@husky.neu.edu','password','','','','','1(617)669-0336','1/1/2015 - 3/31/2015','01/01/2015','Grace',1111),(4461246,'Connell A. Dsouza','','1185 Boylston St Apt 38','','','','dsouza.c@husky.neu.edu','password','','1(857)891-9246','','','','4/1/2015 - 9/30/2015','01/01/2015','Active',1111),(4465553,'Sagar Tambi','','#7188 450 Parker Street','','','','tambisagar@gmail.com','password','','','','','1(646)764-1222','4/1/2015 - 9/30/2015','02/01/2015','Active',1111),(4479562,'Vivian Zhang','','91 Westland Ave.','','','','viviannazhang@gmail.com','password','','','','','1(617)319-3788','4/1/2015 - 9/30/2015','02/01/2015','Active',1111),(4479572,'Gustavo J Sanoja Lopez','','388 Arborway','','','','gustavo.sanoja@gmail.com','password','','','','','1(857)200-7945','4/1/2015 - 9/30/2015','02/01/2015','Active',1111),(4479593,'Yingkun Zhu','','78 Gainsborough Street','unit 402E','','','yingkunz@gmail.com','password','','','','','1(857)264-7719','4/1/2015 - 9/30/2015','02/01/2015','Active',1111),(4484137,'Eric M Martinez','','26 Ridgewood Road','','','','martinez.er@husky.neu.edu','password','','','','','1(401)286-2257','4/1/2015 - 9/30/2015','02/01/2015','Active',1111),(4495066,'Rogelio A Simon','','14 Alleghany St.','Apt. 2','','','simon.rog@husky.neu.edu','password','','','','','1(432)254-6211','4/1/2015 - 9/30/2015','02/01/2015','Active',1111),(4506724,'Kartikeya Ladha','','500 parker street','#3870','','','ladha.k@husky.neu.edu','password','','','','','1(857)321-2985','4/1/2015 - 9/30/2015','02/01/2015','Active',1111),(4536883,'Amir Farjadian','','1330 Boylston St Unit 413','','','','farjadian.a@husky.neu.edu','password','','1(781)816-9012','','','','3/1/2015 - 3/31/2015','03/01/2015','Grace',1111);
/*!40000 ALTER TABLE `MemberTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoleRequest`
--

DROP TABLE IF EXISTS `RoleRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoleRequest` (
  `RoleRequestID` int(11) NOT NULL AUTO_INCREMENT,
  `MeetingID` int(11) NOT NULL,
  `RequestedBy` int(11) NOT NULL,
  `RequestedTo` int(11) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Message` int(11) DEFAULT NULL,
  `Status` varchar(10) NOT NULL,
  PRIMARY KEY (`RoleRequestID`),
  KEY `Meeting_idx` (`MeetingID`),
  KEY `Requestor_idx` (`RequestedBy`),
  KEY `Receiver_idx` (`RequestedTo`),
  CONSTRAINT `Meeting` FOREIGN KEY (`MeetingID`) REFERENCES `Meeting` (`MeetingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Receiver` FOREIGN KEY (`RequestedTo`) REFERENCES `MemberTable` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Requestor` FOREIGN KEY (`RequestedBy`) REFERENCES `MemberTable` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoleRequest`
--

LOCK TABLES `RoleRequest` WRITE;
/*!40000 ALTER TABLE `RoleRequest` DISABLE KEYS */;
INSERT INTO `RoleRequest` VALUES (1,8,2844821,99999,'toastmaster',NULL,'approved'),(2,8,2844821,99999,'toastmaster',NULL,'approved'),(3,8,2844821,99999,'aHCounter ',NULL,'approved'),(4,8,2844821,99999,'grammarian',NULL,'approved'),(5,8,99999,99999,'evaluator2',NULL,'approved');
/*!40000 ALTER TABLE `RoleRequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimerReport`
--

DROP TABLE IF EXISTS `TimerReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimerReport` (
  `TimerReportID` int(11) NOT NULL AUTO_INCREMENT,
  `MeetingID` int(11) NOT NULL,
  `Timer` int(11) NOT NULL,
  `RolePlayer` varchar(100) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `TimeTaken` varchar(20) NOT NULL,
  PRIMARY KEY (`TimerReportID`),
  KEY `meeting_idx` (`MeetingID`),
  KEY `fk_timerreport_timer_idx` (`Timer`),
  CONSTRAINT `fk_timerreport_meetingid` FOREIGN KEY (`MeetingID`) REFERENCES `Meeting` (`MeetingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_timerreport_timer` FOREIGN KEY (`Timer`) REFERENCES `MemberTable` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimerReport`
--

LOCK TABLES `TimerReport` WRITE;
/*!40000 ALTER TABLE `TimerReport` DISABLE KEYS */;
INSERT INTO `TimerReport` VALUES (1,6,99999,'Sandeep','Evaluator','00:09:09'),(2,6,99999,'Sandeep','Grammarian','0:10:04'),(3,6,99999,'Gen','Grammarian','00:07:01'),(4,6,99999,'Conrad','Eval','00:05:04'),(5,6,99999,'Sandy','Val','00:00:00'),(6,6,99999,'Sandeep','Evaluator','0:12:07');
/*!40000 ALTER TABLE `TimerReport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-24 17:17:01
