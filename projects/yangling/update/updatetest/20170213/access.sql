use access;
CREATE TABLE `DEVICE` (
	`ID` varchar(64) NOT NULL,
	`NAME` varchar(32) NOT NULL COMMENT '设备名称',
	`MODEL_CD` varchar(20) NOT NULL COMMENT '设备类型',
	`TYPE_CD` varchar(2) NOT NULL COMMENT '设备型号',
	`AREA_ID` varchar(32) DEFAULT NULL COMMENT '区域ID',
	`ISCOLLECT` char(1) NOT NULL COMMENT '是否支持采集',
	`ISATTENDANCE` char(1) NOT NULL COMMENT '是否支持考勤',
	`ATTACHMENT` json NOT NULL COMMENT 'json结构体',
	`ETAG` varchar(64) NOT NULL COMMENT '与核心库数据同步标记字段',
	PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
alter table ACCESS modify column WEEK json;
UPDATE ACCESS SET WEEK = '["1", "2", "3", "4", "5", "6", "0"]'
alter table ACCESS modify column BEGAN_DATE varchar(32) DEFAULT NULL;
alter table ACCESS modify column END_DATE varchar(32) DEFAULT NULL;
alter table ACCESS modify column BEGANTIME varchar(32) DEFAULT NULL;
alter table ACCESS modify column ENDTIME varchar(32) DEFAULT NULL;
