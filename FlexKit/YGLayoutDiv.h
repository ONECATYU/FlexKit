//
//  YGLayoutDiv.h
//  FlexKit
//
//  Created by 余汪送 on 2018/6/4.
//  Copyright © 2018年 capsule. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YGLayout, YGLayoutMaker, YGLayoutDiv;

NS_ASSUME_NONNULL_BEGIN

typedef void(^YGMakeLayoutBlock)(YGLayoutMaker *make);


@protocol YGLayoutDivProtocol <NSObject>

- (YGLayoutDiv *)layoutDiv;

@end


@interface YGLayoutDiv : NSObject <YGLayoutDivProtocol>

@property (nonatomic, readonly, strong) YGLayout *yoga;
@property (nonatomic, readonly, weak) YGLayoutMaker *make;

@property (nullable, nonatomic, readonly, weak) YGLayoutDiv *parent;
@property (nonatomic, readonly, strong) NSArray<YGLayoutDiv *> *children;

@property (nonatomic, assign) CGRect frame;

@property (nullable, nonatomic, readonly, weak) UIView *view;

- (instancetype)initWithView:(UIView *)view;

- (void)addChild:(YGLayoutDiv *)child;
- (void)addChildren:(NSArray<YGLayoutDiv *> *)children;

- (void)removeChild:(YGLayoutDiv *)child;
- (void)removeFromParent;

- (YGLayoutMaker *)makeLayout:(YGMakeLayoutBlock)block;


@end

NS_ASSUME_NONNULL_END
