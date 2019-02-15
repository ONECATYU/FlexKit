//
//  YGFlexLayout.h
//  jscallnative
//
//  Created by 余汪送 on 2019/2/15.
//  Copyright © 2019 capsule. All rights reserved.
//

#import <YogaKit/YGLayout.h>
#import "YGFlexDiv.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGFlexLayout : YGLayout

@property (nonatomic, readonly, strong) YGFlexDiv *flexDiv;

- (instancetype)initWithDiv:(YGFlexDiv *)layoutDiv;

@end

NS_ASSUME_NONNULL_END
