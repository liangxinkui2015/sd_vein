# 服务器安装指南
蕊洁有详细的服务器安装文档，本文档只提供思路索引。

## 需求
* 理论上，只要是能安装`docker`的硬件都可以。
* 实际上，Windows版的docker影响到我们连接860时的RemoteAddr获取，需要特殊处理veinlistener应用。
* 目前，我们默认使用的都是 ubuntu 16.04 ，并没有测试其他的操作系统。

## 部署步骤
* 安装ssh
* 设定ip
* 安装zsh + ohmyzsh (可选，如果经常需要登这个服务器维护，zsh可以更好看好用一点)

* 安装 docker 和 docker-compose
* 将docker组加入ubuntu
* 安装docker加速器(可选，在线安装才需要)

* 准备docker-compose文件和配套的.env文件
* 准备mysql数据文件夹
* mysql备份脚本
* 备份crontab

### 项目结构
* Daocloud 负责自动部署 `dev` `testing` 环境, 在99上只有 ~/mysqlk_data 中有数据库存储

* 推荐项目结构，目前 云端的 cloud demo 环境，98的生产环境，送测环境，众源环境 是按照如下结构部署。

```
~/项目名称
~/项目名称/docker-compose.yml
~/项目名称/.env
~/项目名称/mysql_data
~/项目名称/minio_data
```

* 另外，目前国电，杨陵，送变电项目是按照如下规则部署的，有机会可以升级成新的结构。

```
~/compose
~/compose/项目名称/docker-compose.yml
~/compose/项目名称/.env
~/mysql_data
~/minio_data
```


### 离线部署
离线部署在安装软件包时需要离线安装包，另外docker镜像不是通过pull而是通过导入。

## 进阶说明
在不用docker的情况下，我们需要部署如下内容
* mysql/redis/rabbitmq 全平台支持，建议linux
* minio作为持久存储，建议参考官方文档
* veinverification 由于包含了一个.so 必须部署在Linux x64
* 其他所有的golang应用，均可编译为全平台版本
* 有一个python应用  posprinter 只测试了linux版本，需要python3和其安装依赖。
* 最后 还需要一个nginx作为gateway和webserver
