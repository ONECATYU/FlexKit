/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the LICENSE
 * file in the root directory of this source tree.
 */
#import "YGLayout.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FlexKit) <WSFlexLayoutItemProtocol>

@property (nonatomic, readonly, assign) BOOL isYogaEnabled;

@property (nonatomic, strong, readonly) YGLayout *yoga;

@property (nonatomic, assign) CGRect flexFrame;

@property (nonatomic, weak) WSFlexLayoutItem *parent;
@property (nonatomic, strong) NSArray<WSFlexLayoutItem *> *children;

- (void)addChild:(WSFlexLayoutItem *)child;
- (void)removeChild:(WSFlexLayoutItem *)child;

- (CGSize)measureItemWithSize:(CGSize)size;

- (void)configureLayoutWithBlock:(void(^)(YGLayout *layout))block
NS_SWIFT_NAME(configureLayout(block:));

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN
@interface UIScrollView (FlexKit)
@property (nonatomic, assign) BOOL applyFlexFrameToContentSize;
@end
NS_ASSUME_NONNULL_END
