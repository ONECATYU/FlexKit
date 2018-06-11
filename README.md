# FlexKit
在YogaKit基础上，增加链式调用，虚拟div.<br/>
# 使用     
<img src='https://github.com/ONECATYU/FlexKit/blob/master/Images/screen-shot.png'/>   

```swift
        let container = ...
        let leftView = ...
        let titleLabel = ...
        let descLabel = ...
        
        let bottomLelftView = ...
        let bottomRightView = ...
        
        self.view.makeLayout { (make) in
            make.justifyContent(.center)
            make.addChild(container, withMakeLayout: { (make) in
                make.flexDirection(.row).padding(12)
                make.addChild(leftView)
                    .aspectRatio(1)
                    .width(120)
                
                make.addChild(nil, withMakeLayout: { (make) in
                    make.flexGrow(1)
                        .flexShrink(1)
                        .justifyContent(.spaceBetween)
                        .paddingLeft(12)
                    
                    make.addChild(nil, withMakeLayout: { (make) in
                        make.addChild(titleLabel)
                        make.addChild(descLabel).top(6)
                    })
                    
                    make.addChild(nil, withMakeLayout: { (make) in
                        make.flexDirection(.row)
                            .justifyContent(.spaceBetween)
                        
                        make.addChild(bottomLelftView)
                            .width(80)
                            .height(20)
                            .alignSelf(.flexEnd)
                        
                        make.addChild(bottomRightView)
                            .height(30)
                            .aspectRatio(1)
                    })
                })
            })
        }
        
```    
# 配合UITableView+FDTemplateLayoutCell使用     
参照demo

