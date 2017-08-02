# 人员额外字段设计

这个设计是用来应对 remotesite 系统中的需要平板展示额外字段的方案。同时也可以应用在客户需要自定义人员字段的场景。  
但是由于这个方案比较复杂，没有很好的贯彻执行。在此留作参考。

## 描述
在应用系统中，应该有一张表叫extra_props，描述人员的额外字段，此描述需要做增删改查接口。

```golang
// ExtraProp 额外属性描述
type ExtraProp struct {
    ID string // uuid
    Name string // 必填
    Type string // 默认string bool/string/number
    Desc string
    Width int // 可选，控制显示宽度
    Format string // 预留
}
```

## 人员扩展表
在应用中除了同步core的person，可以有一张person_extra表，存放人员的额外信息。在主表中有一个total_etag字段标识所有信息的修改。

```golang
// PersonExtra 人员额外属性
type PersonExtra struct {
    PersonID string
    ExtraPropID string
    Value string
}
```

## 应用人员对象处理
在应对人员查询时，应同时返回额外信息，在人员对象中有PersonExtras字段，为额外信息的列表，字段只有ExtraPropID和Value。

## 前端和客户端处理
在需要额外信息的页面，应先请求额外属性描述。用作布局处理。
