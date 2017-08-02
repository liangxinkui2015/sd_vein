### 参考
* 各项规范优先参考 api.github.com

### 资源名称
* 增删改查统一使用资源的名词复数 比如 /users/:id
* 资源的子资源，父资源使用单数 比如 /user/privileges
* 个别动或状态可用形容词或动词结尾，资源用单数 /user/current  /user/search

### 属性名称
* 采用 camelCase

### POST返回
* POST方法请用 Location 头返回新增的资源地址
* 如果服务器产生了内容，比如ID，请返回最终的资源。

### 错误
```json
{
  "error": {
    "code": "BadArgument",
    "message": "Previous passwords may not be reused"
  }
}
```
