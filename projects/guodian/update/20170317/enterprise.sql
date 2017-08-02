use enterprise;
CREATE TABLE `FEATURE` (
	`ID` varchar(64) NOT NULL,
	`FINGER` varchar(16) NOT NULL COMMENT '指静脉手指(l2,l3,r2,r3)',
	`USER_ID` varchar(64) NOT NULL COMMENT '消费者ID',
	PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table USER add CARD_ID varchar(50);
