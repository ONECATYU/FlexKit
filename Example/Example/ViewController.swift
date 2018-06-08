//
//  ViewController.swift
//  Example
//
//  Created by 余汪送 on 2018/6/5.
//  Copyright © 2018年 capsule. All rights reserved.
//

import UIKit
import FlexKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let container = createView(backgroundColor: .groupTableViewBackground)
        let leftView = createView(backgroundColor: .orange)
        let titleLabel = createLabel(fontSize: 15)
        let descLabel = createLabel(fontSize: 12)
        
        let bottomLelftView = self.createView(backgroundColor: .orange)
        let bottomRightView = self.createView(backgroundColor: .orange)
        
        self.view.makeLayout { (make) in
            make.justifyContent(.center);
            make.addChild(container, withMakeLayout: { (make) in
                make.flexDirection(.row).padding(12);
                make.addChild(leftView)
                    .aspectRatio(1)
                    .width(120);
                
                make.addChild(nil, withMakeLayout: { (make) in
                    make.flexGrow(1)
                        .flexShrink(1)
                        .justifyContent(.spaceBetween)
                        .paddingLeft(12);
                    
                    make.addChild(nil, withMakeLayout: { (make) in
                        make.addChild(titleLabel);
                        make.addChild(descLabel).top(6);
                    })
                    
                    make.addChild(nil, withMakeLayout: { (make) in
                        make.flexDirection(.row)
                            .justifyContent(.spaceBetween);
                        
                        make.addChild(bottomLelftView)
                            .width(80)
                            .height(20)
                            .alignSelf(.flexEnd);
                        
                        make.addChild(bottomRightView)
                            .height(30)
                            .aspectRatio(1);
                    })
                })
            })
        }
        
        titleLabel.text = "你好我是标题,下面是我的内容简介,↓↓↓";
        descLabel.text = "你好我是简介,上面是我的标题";
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.yoga.applyLayout(preservingOrigin: false)
    }
    
    func createLabel(fontSize: CGFloat) -> UILabel {
        let lab = UILabel()
        lab.backgroundColor = UIColor.orange
        lab.numberOfLines = 2
        lab.font = UIFont.systemFont(ofSize: fontSize)
        lab.textColor = UIColor.white
        return lab
    }
    
    func createView(backgroundColor: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        return view
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

