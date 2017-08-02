use access;
DROP TABLE IF EXISTS `DEVICE`;
CREATE TABLE `DEVICE` (
      `ID` varchar(64) NOT NULL,
      `NAME` varchar(64) NOT NULL,
      `TYPE_CD` char(255) NOT NULL,
      `MODEL_CD` varchar(20) NOT NULL,
      `AREA_ID` varchar(64) DEFAULT '1',
      `ATTACHMENT` json DEFAULT NULL,
      `ISCOLLECT` char(1) DEFAULT NULL,
      `ISATTENDANCE` char(1) DEFAULT NULL,
      `ETAG` varchar(36) DEFAULT NULL,
      `CARDSUPPORT` int(2) DEFAULT NULL,
      `deleted_at` datetime DEFAULT NULL,
      PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
alter table ACCESS modify column WEEK json;
UPDATE ACCESS SET WEEK = '["1", "2", "3", "4", "5", "6", "0"]';
alter table ACCESS modify column BEGAN_DATE varchar(32) DEFAULT NULL;
alter table ACCESS modify column END_DATE varchar(32) DEFAULT NULL;
alter table ACCESS modify column BEGANTIME varchar(32) DEFAULT NULL;
alter table ACCESS modify column ENDTIME varchar(32) DEFAULT NULL;
