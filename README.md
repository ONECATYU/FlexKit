# FlexKit
* 支持虚拟div,避免导致视图增多问题。  
* 支持scrollView contentSize。设置scrollView.applyFlexFrameToContentSize = true   
* 支持CALayer布局，UIView和CALayer混合布局。  
* 根据node树，UIView/CALayer自动添加到父视图。在布局结束后，调用view.yoga.adjustsViewHierarchy()    
# 使用     
* 可配合UITableView+FDTemplateLayoutCell使用，避免手动计算高度    
<img src='https://github.com/ONECATYU/FlexKit/blob/master/Images/screen.gif'/>   

```swift
contentView.makeFlexLayout { (make) in
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

contentView.yoga.applyLayout(preservingOrigin: false)

//OC中通过@100/@"50%",分别设置数值或者百分比
make.width(@100).height(@"50%");
```    
