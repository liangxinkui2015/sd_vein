UPDATE 2016.11.27
---------------------
* veinlistener 优化日志输出，增加tcp连接超时6分钟,写入超时3秒
* visitor 修复client修改错误
* web 规则页面对应调整，新增规则支持多选设备
* doorcontroller 优化日志输出
* enterprise 修复删除手指bug
* padadapter 修复采集bug
* minio 官方镜像更新
* minioadapter 跟随官方镜像新
* veinverification 优化日志输出，现在会输出发生碰撞的特征信息验证
* 所有服务的日志控制变为毫秒级别

--------------------
* 更新以下命令到.bashrc中
* alias docker-stats='docker-compose ps|grep ${PWD##*/}|awk '\''{printf("%s ",$1)}'\''|xargs docker stats'
