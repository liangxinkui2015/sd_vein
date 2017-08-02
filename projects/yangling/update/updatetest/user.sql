use vein;
CREATE TABLE `USER` (
        `ID` varchar(36),
        `USERNAME` varchar(50),
        `PASSWORD` varchar(100),
        `PRIVILEGES` json,
        `PERSONID` varchar(64),
        PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
