create database payment;
use payment;
-- ----------------------------
-- Table structure for ACCOUNT
-- ----------------------------
DROP TABLE IF EXISTS `ACCOUNT`;
CREATE TABLE `ACCOUNT` (
  `ID` varchar(64) NOT NULL,
  `CUSTOMER_ID` varchar(64) DEFAULT NULL COMMENT '主用户ID',
  `BALANCE` int(11) NOT NULL DEFAULT '0' COMMENT '账户余额（虚拟金额+现金金额）',
  `CASH` int(11) NOT NULL DEFAULT '0' COMMENT '现金余额（可提现金额）',
  `ALL_CONSUMPTION` int(11) NOT NULL DEFAULT '0' COMMENT '总消费金额（现金金额+虚拟金额）',
  `ALL_CASH` int(11) NOT NULL DEFAULT '0' COMMENT '总消费现金金额',
  `STATUS` char(1) NOT NULL DEFAULT '1' COMMENT '账户状态（1正常/2冻结）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for CUSTOMER
-- ----------------------------
DROP TABLE IF EXISTS `CUSTOMER`;
CREATE TABLE `CUSTOMER` (
  `ID` varchar(64) NOT NULL COMMENT '唯一主键',
  `NAME` varchar(32) NOT NULL COMMENT '姓名',
  `SEX` char(1) DEFAULT NULL COMMENT '性别，1男/2女',
  `IDCARD` varchar(32) DEFAULT NULL COMMENT '身份证号',
  `EMPLOYEE_ID` varchar(64) DEFAULT NULL COMMENT '员工工号',
  `CELLPHONE` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `ACCOUNT_ID` varchar(64) DEFAULT NULL COMMENT '账户ID',
  `RELATION` varchar(16) DEFAULT NULL COMMENT '与主账号关系，本人/父子/母子/夫妻等',
  `ETAG` varchar(64) NOT NULL DEFAULT 'test' COMMENT '数据库同步标志字段',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for DEAL_RECORD
-- ----------------------------
DROP TABLE IF EXISTS `DEAL_RECORD`;
CREATE TABLE `DEAL_RECORD` (
  `ID` varchar(64) NOT NULL,
  `ACCOUNT_ID` varchar(64) NOT NULL COMMENT '账户ID',
  `CUSTOMER_ID` varchar(64) NOT NULL COMMENT '消费者ID',
  `CUSTOMER_NAME` varchar(32) NOT NULL COMMENT '消费者姓名',
  `AMOUNT` int(11) NOT NULL DEFAULT '0' COMMENT '消费总金额',
  `VIRTUAL_MONEY` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟消费金额',
  `REAL_MONEY` int(11) NOT NULL DEFAULT '0' COMMENT '真实消费金额',
  `DEAL_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '交易时间',
  `MERCHANT_ID` varchar(64) NOT NULL COMMENT '商户ID',
  `MERCHANT_NAME` varchar(32) NOT NULL COMMENT '商户名称',
  `DEVICE_ID` varchar(64) NOT NULL COMMENT '设备ID',
  `DEVICE_NAME` varchar(32) NOT NULL COMMENT '设备名称',
  `TRANSACTION_ID` int(11) NOT NULL COMMENT '交易流水号',
  `REMARK` varchar(256) DEFAULT NULL COMMENT '备注',
  `OPERATOR` varchar(255) NOT NULL DEFAULT 'pos' COMMENT '默认是pos机消费，管理员充值时默认sysadmin这里标示操作人员',
  `TYPE` char(1) NOT NULL DEFAULT '1' COMMENT '交易记录类型，1消费/2退款/3充值',
  `STATUS` char(1) NOT NULL DEFAULT '1' COMMENT '是否支持撤销，1可撤销/2无法撤销，默认为1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for DEVICE
-- ----------------------------
DROP TABLE IF EXISTS `DEVICE`;
CREATE TABLE `DEVICE` (
  `ID` varchar(64) NOT NULL,
  `NAME` varchar(32) NOT NULL COMMENT '设备名称',
  `MODEL_CD` varchar(20) NOT NULL COMMENT '设备类型',
  `TYPE_CD` varchar(2) NOT NULL COMMENT '设备型号',
  `AREA_ID` varchar(64) DEFAULT NULL COMMENT '区域ID',
  `ISCOLLECT` char(1) NOT NULL COMMENT '是否支持采集',
  `ISATTENDANCE` char(1) NOT NULL COMMENT '是否支持考勤',
  `ATTACHMENT` json NOT NULL COMMENT 'json结构体',
  `ETAG` varchar(64) NOT NULL COMMENT '与核心库数据同步标记字段',
  `MERCHANT_ID` varchar(64) DEFAULT NULL COMMENT '商户ID',
  `RELIABLE` char(1) NOT NULL DEFAULT '1' COMMENT '是否是可靠设备，可靠设备是被用户认可并修改过的(1不可靠/2可靠)',
  PRIMARY KEY (`ID`),
  KEY `MERCHANT_ID` (`MERCHANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for FAIL_DEAL_RECORD
-- ----------------------------
DROP TABLE IF EXISTS `FAIL_DEAL_RECORD`;
CREATE TABLE `FAIL_DEAL_RECORD` (
  `ID` varchar(64) NOT NULL COMMENT '唯一主键',
  `TRANSACTION_ID` int(11) NOT NULL COMMENT '交易流水号',
  `ACCOUNT_ID` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `CUSTOMER_ID` varchar(64) DEFAULT NULL COMMENT '消费者ID',
  `CUSTOMER_NAME` varchar(64) DEFAULT NULL COMMENT '消费者姓名',
  `AMOUNT` int(11) NOT NULL COMMENT '交易金额',
  `DEAL_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '交易时间',
  `MERCHANT_ID` varchar(64) DEFAULT NULL COMMENT '商家ID',
  `MERCHANT_NAME` varchar(32) DEFAULT NULL COMMENT '商家名称',
  `DEVICE_ID` varchar(64) DEFAULT NULL COMMENT '设备ID',
  `DEVICE_NAME` varchar(32) DEFAULT NULL COMMENT '设备名称',
  `STATUS` char(1) NOT NULL COMMENT '交易失败类型：1失败/2超时',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for FEATURE
-- ----------------------------
DROP TABLE IF EXISTS `FEATURE`;
CREATE TABLE `FEATURE` (
  `ID` varchar(64) NOT NULL,
  `FINGER` varchar(16) NOT NULL COMMENT '指静脉手指(l2,l3,r2,r3)',
  `CUSTOMER_ID` varchar(64) NOT NULL COMMENT '消费者ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for MERCHANT
-- ----------------------------
DROP TABLE IF EXISTS `MERCHANT`;
CREATE TABLE `MERCHANT` (
  `ID` varchar(64) NOT NULL,
  `NAME` varchar(32) NOT NULL COMMENT '商家名称',
  `ADDRESS` varchar(128) DEFAULT NULL COMMENT '地址',
  `LINKMAN_NAME` varchar(32) DEFAULT NULL COMMENT '联系人姓名',
  `CELL_PHONE` varchar(32) DEFAULT NULL COMMENT '联系人电话',
  `REMARK` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
