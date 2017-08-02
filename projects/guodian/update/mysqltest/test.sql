use vein;
CREATE TABLE vein.CODE SELECT * FROM device.CODE;
CREATE TABLE vein.AREA SELECT * FROM device.AREA;
CREATE TABLE vein.DEVICE SELECT * FROM device.VEIN;
INSERT INTO `CODE` VALUES ('PRIVILEGE_CD', '1', '{\"core\": \"超级管理员\", \"exam\": \"考试管理\", \"access\": \"门禁管理\", \"payment\": \"消费管理\", \"visitor\": \"访客管理\", \"attendance\": \"考勤管理\", \"enterprise\": \"企业管理\", \"remotesite\": \"施工现场管理\"}');
