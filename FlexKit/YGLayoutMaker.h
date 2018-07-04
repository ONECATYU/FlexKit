//
//  YGLayoutMaker.h
//  FlexLayoutTest
//
//  Created by 余汪送 on 2018/6/1.
//  Copyright © 2018年 capsule. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YGLayout.h"

@class YGLayoutMaker, YGLayoutDiv;

NS_ASSUME_NONNULL_BEGIN

typedef void(^YGMakeLayoutBlock)(YGLayoutMaker *make);


@interface YGLayout (YGLayoutMaker)
@property (nonatomic, readonly, strong) YGLayoutMaker *make;
@end


@interface YGLayoutDiv (YGLayoutMaker)
@property (nonatomic, readonly, weak) YGLayoutMaker *make;
- (void)makeLayout:(YGMakeLayoutBlock)block;
@end


@interface UIView (YGLayoutMaker)
- (void)makeLayout:(YGMakeLayoutBlock)block;
@end


@interface YGLayoutMaker : NSObject

@property (nonatomic, readonly, nullable, weak) YGLayout *yoga;

- (instancetype)initWithLayout:(YGLayout *)yoga;

- (YGLayoutDiv *)addChild:(nullable id<YGLayoutDivProtocol>)child withMakeLayout:(YGMakeLayoutBlock)block;
- (YGLayoutDiv *)addChildWithMakeLayout:(YGMakeLayoutBlock)block;

@end

NS_ASSUME_NONNULL_END

