# FlexKit
YogaKit的插件，增加链式调用和虚拟div。YogaKit在面对复杂布局时，会导致视图层级增多。<br/>
不入侵YogaKit的代码，可以在项目中直接使用YogaKit,而完全不使用FlexKit.<br/>
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

///使用flexLayout而不是YogaKit中的contentView.yoga
///可以直接使用YogaKit，然后通过contentView.yoga来更新视图布局
contentView.flexLayout.applyLayout(preservingOrigin: false)
```    
