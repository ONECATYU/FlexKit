//
//  FeedTableViewCell.swift
//  Example
//
//  Created by 余汪送 on 2018/6/8.
//  Copyright © 2018年 capsule. All rights reserved.
//

import UIKit
import FlexKit

class FeedTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        return createLabel(fontSize: 15, textColor: .black)
    }()
    
    lazy var contentLabel: UILabel = {
        return createLabel(fontSize: 15, textColor: .darkGray)
    }()
    
    lazy var contentImgView = UIImageView()
    
    lazy var userNameLabel: UILabel = {
        return createLabel(fontSize: 12, textColor: .lightGray)
    }()
    
    lazy var timeLabel: UILabel = {
        return createLabel(fontSize: 12, textColor: .lightGray)
    }()
    
    var feed: Feed? {
        willSet {
            titleLabel.text = newValue?.title
            contentLabel.text = newValue?.content
            contentImgView.image = nil
            if let imageName = newValue?.imageName {
                var image: UIImage? = nil
                if (!imageName.isEmpty) {
                    image = UIImage(named: imageName)
                }
                contentImgView.image = image;
                let size = image?.size ?? .zero
                contentImgView.flexLayout.make.size(size)
            }
            userNameLabel.text = newValue?.username
            timeLabel.text = newValue?.time
            
            ///将子视图标记为脏的(需要重新计算布局)
            contentView.markSubViewsDirty()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.flexLayout.applyLayout(preservingOrigin: false)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var layoutSize = size
        layoutSize.height = CGFloat(YGUndefined);
        let size = contentView.flexLayout.calculateLayout(with: layoutSize)
        return size
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviewsLayout()
        fd_enforceFrameLayout = true
    }
    
    func setupSubviewsLayout() {
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLabel(fontSize: CGFloat,
                     textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textColor = textColor
        label.numberOfLines = 0
        return label
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
