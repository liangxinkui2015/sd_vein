## 代码格式
* 请使用 goimports 插件在保存时自动格式化
* 请使用 go lint and go vet 进行代码检查
* 请遵从 go 官方给出的 [review 建议](https://github.com/golang/go/wiki/CodeReviewComments)

## 命名
命名应该采用有意义的字符，尽量做到见名识意。

### 包名
包名统一采用小写单词，不得使用下划线或者混合大小写。

### 接口名
接口名统一以大写字母 "I" 开头，后续采用驼峰结构。

```golang
	type IHuman interface{
	}
```

### 结构体名
结构体名统一采用驼峰命名结构，不得出现下划线，结合是否可导出确定首字母大小写。

```golang
	type Human struct {
	}
```

### 常量
常量统一采用驼峰结构命名，结合是否可导出确定首字母大小写。可导出常量与不可导出常量应该分开声明，不得出现在同一常量声明块内。

```golang
	// 不可导出常量
	const (
		genderMale   = 1
		gednerFemale = 2
	)

	// 可导出常量
	const (
		GenderMale   = 1
		GenderFemale = 2
	)
```

### 变量
#### 全局变量
采用驼峰结构命名，结合是否可导出确定首字母大小写，不得出现下划线。可导出变量与不可导出变量应该分开声明，不得出现在同一变量声明块内。

#### 形参
采用驼峰结构命名，首字母必须小写，不得出现下划线。

#### 局部变量
采用驼峰结构命名，首字母必须小写，不得出现下线线。

### 函数（方法）
* 采用驼峰结构命名，结合是否可导出确定首字母大小写，不得出现下划线；
* 返回值必须命名，采用驼峰结构命名，首字母必须小写，不得出现下划线；
* 方法的接收者统一命名 this，接收者类型统一采用指针，特殊情况除外；
* 如果接收者是 map, slice 或者 chan，则不要用指针传递；

如下所示：

```golang
	// addition 这是一个包可见的函数，用于计算两个 int 类型的和
	func addition(param1, param2 int) (sum int) {
		sum = param1 + pram2
		return sum
	}
```
