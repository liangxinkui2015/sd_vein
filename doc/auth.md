# API认证部分
## 总体实现
API认证采用jwt模式，目前是每个微服务对请求的token进行解析。解析分为三个层级：
1. 认证 (authentication) , 如果有需要，通过解析token判断请求是否合法。
2. 授权 (authorization) ，如果有需要，通过解析token携带的权限判断请求是否有响应权限。
3. 获取数据，如果有需要，通过token携带的数据，取得发起请求的user id

由于在微服务体系下，每个服务使用的技术不同，所以具体实现代码也不同，但概念就是以上三点，请把握。

## 未来规划
auth统一由 api gateway 完成，具体业务代码不再关心认证。

目前已有方案，唯一的问题是本方案不能很好的放开某些endpoint，正在研究如何增加白名单。

## 开放的endpoint

### core：

* /features 离线验证同步时获取指静脉信息

### exam：

* /persons同步获取单个信息
* /person/snapshot同步获取快照信息
* /extraprops 帝维发送验证和验证结果获取 * /records 推送验证记录
* /person/full 离线上报人员

### visitor

全部放开
