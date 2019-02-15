//
//  SimpleExViewController.swift
//  Example
//
//  Created by 余汪送 on 2018/6/8.
//  Copyright © 2018年 capsule. All rights reserved.
//

import UIKit
import FlexKit

class SimpleItem: UIView {
    lazy var leftView = createView(backgroundColor: .orange)
    lazy var titleLabel = createLabel(fontSize: 15)
    lazy var descLabel = createLabel(fontSize: 12)
    
    lazy var bottomLelftView = createView(backgroundColor: .orange)
    lazy var bottomRightView = createView(backgroundColor: .orange)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        makeLayout { [weak self] (make) in
            make.flexDirection(.row).padding(12).marginVertical(0.5);
            make.addChild(self!.leftView)
                .aspectRatio(1)
                .width(120);
            
            make.addChild(nil, withMakeLayout: { (make) in
                make.flexGrow(1)
                    .flexShrink(1)
                    .justifyContent(.spaceBetween)
                    .paddingLeft(12);
                
                make.addChild(nil, withMakeLayout: { (make) in
                    make.addChild(self!.titleLabel);
                    make.addChild(self!.descLabel).top(6);
                })
                
                make.addChild(nil, withMakeLayout: { (make) in
                    make.flexDirection(.row)
                        .justifyContent(.spaceBetween);
                    
                    make.addChild(self!.bottomLelftView)
                        .width(80)
                        .height(20)
                        .alignSelf(.flexEnd);
                    
                    make.addChild(self!.bottomRightView)
                        .height(30)
                        .aspectRatio(1);
                })
            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLabel(fontSize: CGFloat) -> UILabel {
        let lab = UILabel()
        lab.backgroundColor = UIColor.orange
        lab.numberOfLines = 0
        lab.font = UIFont.systemFont(ofSize: fontSize)
        lab.textColor = UIColor.white
        return lab
    }
    
    func createView(backgroundColor: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        return view
    }
}

class SimpleExViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.flexDiv.disableAutoApplyFrameToView = true;
        scrollView.flexDiv.updateViewFrameBlock = {
            scrollView.contentSize = $0.size
        }
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.groupTableViewBackground
        view.addSubview(scrollView)
        title = "scrollView auto adjust content"
        
        for _ in 0..<20 {
            let item = SimpleItem()
            scrollView.flexLayout.make.addChild(item)
            item.titleLabel.text = "标题标题标题标题标题标题标题标题"
            item.descLabel.text = "简介简介简介简介简介简介简介简介"
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        scrollView.flexLayout.applyLayout(preservingOrigin: false, dimensionFlexibility: .flexibleHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
