create database exam;
use exam;
DROP TABLE IF EXISTS `EXAMINATION`;
CREATE TABLE `EXAMINATION` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `SUBJECTID` varchar(500) DEFAULT NULL,
  `ROOMID` varchar(500) DEFAULT NULL,
  `DATE` varchar(10) DEFAULT NULL,
  `PERIOD` varchar(15) DEFAULT NULL,
  `SDID` longtext,
  `DEVICESID` varchar(500) DEFAULT NULL,
  `ARCHIVEFLAG` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for EXAMINATIONROOM
-- ----------------------------
DROP TABLE IF EXISTS `EXAMINATIONROOM`;
CREATE TABLE `EXAMINATIONROOM` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `MAXSTUDENTLIMIT` int(11) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for EXTRAPROP
-- ----------------------------
DROP TABLE IF EXISTS `EXTRAPROP`;
CREATE TABLE `EXTRAPROP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(18) DEFAULT NULL,
  `TYPE` varchar(8) DEFAULT NULL,
  `DESC` varchar(2) DEFAULT NULL,
  `WIDTH` int(10) DEFAULT NULL,
  `FORMAT` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for FEATURE
-- ----------------------------
DROP TABLE IF EXISTS `FEATURE`;
CREATE TABLE `FEATURE` (
  `ID` varchar(64) NOT NULL COMMENT '唯一主键',
  `PERSON_ID` varchar(64) NOT NULL COMMENT '被采集人员ID',
  `FINGER` varchar(32) DEFAULT NULL COMMENT '手指',
  PRIMARY KEY (`ID`),
  KEY `personid` (`PERSON_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for PERSON
-- ----------------------------
DROP TABLE IF EXISTS `PERSON`;
CREATE TABLE `PERSON` (
  `ID` varchar(36) NOT NULL,
  `IDCARD` varchar(18) NOT NULL,
  `NAME` varchar(8) NOT NULL,
  `SEX` varchar(2) NOT NULL,
  `NATION` varchar(10) DEFAULT NULL,
  `BIRTHDAY` varchar(10) DEFAULT NULL,
  `PHOTOURI` varchar(100) DEFAULT NULL,
  `IDCARDSTARTDATE` varchar(10) DEFAULT NULL,
  `IDCARDENDDATE` varchar(10) DEFAULT NULL,
  `VISAPLACE` varchar(50) DEFAULT NULL,
  `IDCARDADDRESS` varchar(200) DEFAULT NULL,
  `IDCARDCREDIBILITY` tinyint(4) DEFAULT NULL,
  `EMPLOYEEID` varchar(10) DEFAULT NULL,
  `CELLPHONE` varchar(15) DEFAULT NULL,
  `CATEGORY` varchar(50) DEFAULT NULL,
  `EXTRAPROP` longtext,
  `ETAG` varchar(36) DEFAULT NULL,
  `EROLLFLAG` varchar(2) DEFAULT NULL,
  `IMPORTFLAG` varchar(2) DEFAULT NULL,
  `IDCARDPHOTOURI` longtext,
  `deleted_at` datetime DEFAULT NULL,
  `CHARACTER` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for PERSON-bak
-- ----------------------------
DROP TABLE IF EXISTS `PERSON-bak`;
CREATE TABLE `PERSON-bak` (
  `SDID` varchar(36) NOT NULL,
  `IDNUMBER` varchar(18) NOT NULL,
  `NAME` varchar(8) NOT NULL,
  `SEX` varchar(2) NOT NULL,
  `NATION` varchar(10) DEFAULT NULL,
  `BIRTHDAY` varchar(10) DEFAULT NULL,
  `PHOTOURI` longtext,
  `BEGAN` varchar(10) DEFAULT NULL,
  `END` varchar(10) DEFAULT NULL,
  `VISAPLACE` varchar(50) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `PAPERS` varchar(50) DEFAULT NULL,
  `CATEGORY` varchar(50) DEFAULT NULL,
  `COMPANY` varchar(100) DEFAULT NULL,
  `LINKMAN` varchar(10) DEFAULT NULL,
  `PHONE` varchar(15) DEFAULT NULL,
  `COMPANY_PRINCIPAL` varchar(10) DEFAULT NULL,
  `WORKING_TICKET_ISSUED` varchar(50) DEFAULT NULL,
  `WORKING_PRINCIPAL` varchar(50) DEFAULT NULL,
  `SAFETY_OFFICER` varchar(50) DEFAULT NULL,
  `VERIFICATION_QUALIFICATION` varchar(20) DEFAULT NULL,
  `EROLLFLAG` varchar(2) DEFAULT NULL,
  `IMPORTFLAG` varchar(2) DEFAULT NULL,
  `ETAG` varchar(36) DEFAULT NULL,
  `FEATURECOUNT` int(11) DEFAULT NULL,
  `FEATUREFINGER` varchar(10) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`SDID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for PERSONTEMP
-- ----------------------------
DROP TABLE IF EXISTS `PERSONTEMP`;
CREATE TABLE `PERSONTEMP` (
  `SDID` varchar(36) NOT NULL,
  `IDNUMBER` varchar(18) NOT NULL,
  `NAME` varchar(8) NOT NULL,
  `SEX` varchar(2) NOT NULL,
  `NATION` varchar(10) DEFAULT NULL,
  `BIRTHDAY` varchar(10) DEFAULT NULL,
  `PHOTOURI` longtext,
  `BEGAN` varchar(10) DEFAULT NULL,
  `END` varchar(10) DEFAULT NULL,
  `VISAPLACE` varchar(50) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `PAPERS` varchar(50) DEFAULT NULL,
  `CATEGORY` varchar(50) DEFAULT NULL,
  `COMPANY` varchar(100) DEFAULT NULL,
  `LINKMAN` varchar(10) DEFAULT NULL,
  `PHONE` varchar(15) DEFAULT NULL,
  `COMPANY_PRINCIPAL` varchar(10) DEFAULT NULL,
  `WORKING_TICKET_ISSUED` varchar(50) DEFAULT NULL,
  `WORKING_PRINCIPAL` varchar(50) DEFAULT NULL,
  `SAFETY_OFFICER` varchar(50) DEFAULT NULL,
  `VERIFICATION_QUALIFICATION` varchar(20) DEFAULT NULL,
  `EROLLFLAG` varchar(2) DEFAULT NULL,
  `IMPORTFLAG` varchar(2) DEFAULT NULL,
  `ETAG` varchar(36) DEFAULT NULL,
  `FEATURECOUNT` int(11) DEFAULT NULL,
  `FEATUREFINGER` varchar(10) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`SDID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for RECORD
-- ----------------------------
DROP TABLE IF EXISTS `RECORD`;
CREATE TABLE `RECORD` (
  `ID` varchar(36) NOT NULL,
  `DEVICE_NAME` varchar(100) DEFAULT NULL,
  `DEVICE_ID` varchar(36) DEFAULT NULL,
  `SECRET` varchar(36) DEFAULT NULL,
  `PERSON_ID` varchar(36) DEFAULT NULL,
  `PERSON_NAME` varchar(100) DEFAULT NULL,
  `TIME` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SCORE
-- ----------------------------
DROP TABLE IF EXISTS `SCORE`;
CREATE TABLE `SCORE` (
  `ID` varchar(36) NOT NULL,
  `EXAMID` varchar(36) NOT NULL,
  `SDID` varchar(36) NOT NULL,
  `SCORE` float NOT NULL,
  `VERIFYFLAG` varchar(20) NOT NULL,
  `STATUS` varchar(20) DEFAULT NULL,
  `VERIFYTIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for SUBJECT
-- ----------------------------
DROP TABLE IF EXISTS `SUBJECT`;
CREATE TABLE `SUBJECT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `MAXIMUN` float DEFAULT NULL,
  `BORDERLINE` float DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
