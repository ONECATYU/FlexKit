//
//  YGLayoutDiv.h
//  FlexKit
//
//  Created by 余汪送 on 2018/6/4.
//  Copyright © 2018年 capsule. All rights reserved.
//

#import <UIKit/UIKit.h>

#define FK_MAIN_QUEUE_EXEC(...) \
if ([[NSThread currentThread] isMainThread])  \
__VA_ARGS__ \
else { \
dispatch_sync(dispatch_get_main_queue(), ^ \
__VA_ARGS__ \
); \
}

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

/**
 只会对一级子节点进行标记
 */
- (void)markChildrenDirty;

- (void)setUpdateFrameBlock:(void(^)(CGRect))updateFrameBlock;

@end

NS_ASSUME_NONNULL_END
