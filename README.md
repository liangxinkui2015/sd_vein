# SDKEJI VEIN PROJECT

## 版本 RELEASE

[版本说明](release/note.md)  

## 链接 LINKS

外网访问：[开发](http://vein.xiafeng.net)  [演示](https://demo.chinazjm.com)

内网访问：[开发](http://192.168.31.99/dev)  [测试](http://192.168.31.99/test)  [生产](http://192.168.31.98)  [guodian](http://192.168.31.99/guodian)  [yangling](http://192.168.31.99/yangling)  [zhongyuan](http://192.168.31.99/zhongyuan)  

协作：[JIRA](http://jira.xiafeng.net)  

容器构建：[Daocloud](https://dashboard.daocloud.io/)

API文档： [API Doc](http://docs.vein.apiary.io/)

## 文档 DOC

* [总体架构](doc/arch.md)

## 部署 DEPLOY

* [服务器部署指南](deploy/server.md)  

## 规范 RULES

* [RESTful API](rules/api.md)  
* [数据库 DB](rules/db.md)  
* [REDIS](rules/redis.md)  
* [队列命名 RABBIT](rules/rabbitmq.md)  
* [GOLANG](rules/golang.md)  
* [GIT](rules/git.md)  

## 技术 TECH

* [环境变量作为参数](tech/envconfig.md)
* [人员额外字段](tech/extra.md)

## 微服务 SERVICES

### 核心系统
[veincore](https://github.com/hyacinthus/veincore) 核心  
[veinlistener](https://coding.net/t/sdkeji/p/veinlistener/git) 指静脉设备适配  
[doorcontroller](https://coding.net/t/sdkeji/p/doorcontroller/git) 门禁控制器适配  
[veinenrollment](https://coding.net/t/sdkeji/p/veinenrollment/git) 采集  
[veinverification](https://github.com/hyacinthus/veinverification) veinverification 验证  

### 业务系统
[enterprise](https://coding.net/t/sdkeji/p/enterprise/git) 企业管理  
[access](https://coding.net/t/sdkeji/p/access/git) 门禁  
[attendance](https://coding.net/t/sdkeji/p/attendance/git) 考勤  
[visitor](https://coding.net/t/sdkeji/p/visitor/git) 访客  

payment 消费  
[poscontroller](https://coding.net/t/sdkeji/p/poscontroller/git) 属于消费的pos机控制器

[exam](https://coding.net/t/sdkeji/p/exam/git) 考试

### WEB前端
[web](https://coding.net/t/sdkeji/p/vein_web/git) 网页服务  

### 基础设施
[gateway](https://coding.net/t/sdkeji/p/gateway/git) API总线  
[veinlib](https://github.com/hyacinthus/veinlib) golang公用库  
mysql 数据库  
rabbitmq 队列  
redis 缓存  
minio 文件存储  
[minioadapter](https://coding.net/t/sdkeji/p/minioadapter/git) 文件存储适配  
[padadapter](https://coding.net/t/sdkeji/p/padadapter/git) 平板设备适配 （目前只有访客系统使用，计划废弃）
