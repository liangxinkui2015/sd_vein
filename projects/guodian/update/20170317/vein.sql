use vein;
CREATE TABLE vein.CODE SELECT * FROM device.CODE;
CREATE TABLE vein.AREA SELECT * FROM device.AREA;
CREATE TABLE vein.DEVICE SELECT * FROM device.VEIN;
alter table DEVICE add ETAG varchar(36) DEFAULT NULL;
alter table DEVICE add deleted_at datetime DEFAULT NULL;
alter table DEVICE add ISATTENDANCE char(1) DEFAULT NULL; 
alter table DEVICE add CARDSUPPORT int(2) DEFAULT NULL;
INSERT INTO `CODE` VALUES ('PRIVILEGE_CD', '1', '{\"core\": \"超级管理员\", \"exam\": \"考试管理\", \"access\": \"门禁管理\", \"payment\": \"消费管理\", \"visitor\": \"访客管理\", \"attendance\": \"考勤管理\", \"enterprise\": \"企业管理\", \"remotesite\": \"施工现场管理\"}');

CREATE TABLE `PERSON` (
	   `ID` varchar(36) NOT NULL,
	   `IDCARD` varchar(18) DEFAULT NULL,
	   `NAME` varchar(20) DEFAULT NULL,
	   `SEX` varchar(4) DEFAULT NULL,
	   `NATION` varchar(10) DEFAULT NULL,
	   `BIRTHDAY` varchar(10) DEFAULT NULL,
	   `IDCARD_START_DATE` varchar(10) DEFAULT NULL,
	   `IDCARD_END_DATE` varchar(10) DEFAULT NULL,
	   `VISAPLACE` varchar(50) DEFAULT NULL,
	   `IDCARD_ADDRESS` varchar(100) DEFAULT NULL,
	   `IDCARDPHOTOURI` longtext,
	   `PHOTOURI` varchar(100) DEFAULT NULL,
	   `IDCARD_CREDIBILITY` varchar(2) DEFAULT NULL,
	   `EMPLOYEE_ID` varchar(36) DEFAULT NULL,
	   `CELLPHONE` varchar(15) DEFAULT NULL,
	   `CARDID` varchar(50) DEFAULT NULL,
	   `ETAG` varchar(36) NOT NULL,
	   PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO vein.PERSON (ID, IDCARD, NAME, SEX, CELLPHONE, EMPLOYEE_ID, ETAG) select ID, IDCARD, NAME, SEX_CD, CELLPHONE,EMPLOYEE_ID,'0' from enterprise.USER where ISDELETE='1';

UPDATE vein.PERSON SET PERSON.EMPLOYEE_ID = PERSON.`NAME`;
UPDATE enterprise.`USER` SET USER.EMPLOYEE_ID = USER.`NAME`;

INSERT INTO vein.PERSON (ID, IDCARD, NAME, SEX, CELLPHONE, ETAG) select id, idcard_number, name, sex, phone,'0' from visitor.visitor;

INSERT INTO enterprise.FEATURE(ID, USER_ID, FINGER) select ID, PERSON_ID, FINGER from vein.FEATURE where PERSON_TYPE='user';

CREATE TABLE `USER` (
       `ID` varchar(64) NOT NULL,
       `USERNAME` varchar(50) DEFAULT NULL,
       `PASSWORD` blob,
       `PRIVILEGES` json DEFAULT NULL,
       PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
