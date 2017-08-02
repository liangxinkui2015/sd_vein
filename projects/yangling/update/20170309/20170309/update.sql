use vein;
CREATE TABLE `USER` (
      `ID` varchar(64) NOT NULL,
      `USERNAME` varchar(50) DEFAULT NULL,
      `PASSWORD` blob,
      `PRIVILEGES` json DEFAULT NULL,
      PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table DEVICE add `CARDSUPPORT` int(2) DEFAULT NULL;
INSERT INTO `CODE` VALUES ('PRIVILEGE_CD', '1', '{\"core\": \"超级管理员\", \"exam\": \"考试管理\", \"access\": \"门禁管理\", \"payment\": \"消费管理\", \"visitor\": \"访客管理\", \"attendance\": \"考勤管理\", \"enterprise\": \"企业管理\"}');
use payment;
alter table DEVICE add `CARDID` varchar(50) DEFAULT NULL COMMENT '人员卡号';
alter table DEAL_RECORD modify column TRANSACTION_ID varchar(64) NOT NULL;
alter table DEVICE add `CARDSUPPORT` int(2) DEFAULT NULL;
alter table FAIL_DEAL_RECORD modify column TRANSACTION_ID varchar(64) NOT NULL;
use access;
alter table ACCESS modify column WEEK json DEFAULT NULL;
use attendance;
alter table POPULAR_RULE modify column DEVICE_LIST json DEFAULT NULL;
