//
//  YGFlexDiv.h
//  jscallnative
//
//  Created by 余汪送 on 2019/2/15.
//  Copyright © 2019 capsule. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YGFlexLayout, YGFlexDiv;

NS_ASSUME_NONNULL_BEGIN

@protocol YGFlexDivProtocol <NSObject>

@property (nonatomic, readonly, strong) YGFlexDiv *flexDiv;

@end

@interface YGFlexDiv : NSObject <YGFlexDivProtocol>

@property (nonatomic, readonly, strong) YGFlexLayout *yoga;
@property (nonatomic, weak) UIView *view;

@property (nullable, nonatomic, readonly, weak) YGFlexDiv *parent;
@property (nonatomic, readonly, strong) NSArray<YGFlexDiv *> *children;

///是否禁止在setFrame方法中,更新view的frame
@property (nonatomic, assign) BOOL disableAutoApplyFrameToView;
@property (nonatomic, copy) void(^updateViewFrameBlock)(CGRect frame);

- (instancetype)initWithView:(nullable UIView *)view;

- (void)addChild:(YGFlexDiv *)child;
- (void)addChildren:(NSArray<YGFlexDiv *> *)children;

- (void)removeChild:(YGFlexDiv *)child;
- (void)removeFromParent;

- (void)markChildrenDirty;

///仿照UIView一些行为
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, assign) CGRect bounds;

@property (nonatomic, readonly, strong) NSArray<YGFlexDiv *> *subviews;

- (CGSize)sizeThatFits:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
