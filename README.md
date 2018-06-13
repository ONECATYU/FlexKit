# FlexKit
在YogaKit基础上，增加链式调用，虚拟div.<br/>
# 使用     
* 可配合UITableView+FDTemplateLayoutCell使用，避免手动计算高度    
<img src='https://github.com/ONECATYU/FlexKit/blob/master/Images/screen.gif'/>   

```swift
contentView.makeLayout { (make) in
    make.padding(12)
    make.addChild(self.titleLabel)
    make.addChild(self.contentLabel).marginTop(10)
    make.addChild(self.contentImgView).marginTop(10)
    make.addChild(nil, withMakeLayout: { (make) in
        make.flexDirection(.row).justifyContent(.spaceBetween).marginTop(10)
        make.addChild(self.userNameLabel)
        make.addChild(self.timeLabel)
    })
}
```    
