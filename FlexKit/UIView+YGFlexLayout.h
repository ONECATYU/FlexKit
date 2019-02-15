//
//  UIView+YGFlexLayout.h
//  jscallnative
//
//  Created by 余汪送 on 2019/2/15.
//  Copyright © 2019 capsule. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGFlexLayout.h"
#import "YGFlexMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YGFlexLayout) <YGFlexDivProtocol>

@property (nonatomic, readonly, strong) YGFlexLayout *flexLayout;
@property (nonatomic, readonly, strong) YGFlexDiv *flexDiv;
@property (nonatomic, readonly, assign) BOOL isFlexEnabled;

- (void)markSubViewsDirty;
- (void)makeLayout:(void(^)(YGFlexMaker *make))block;

@end

NS_ASSUME_NONNULL_END
