//
//  WSFlexLayoutMaker.h
//  FlexDemo
//
//  Created by 余汪送 on 2019/5/29.
//  Copyright © 2019 capsule. All rights reserved.
//

#import "UIView+FlexKit.h"
#import "CALayer+FlexKit.h"

@class WSFlexLayoutMaker;

NS_ASSUME_NONNULL_BEGIN
typedef void(^WSFlexLayoutMakerBlock)(WSFlexLayoutMaker *make);

@interface WSFlexLayoutMaker : NSObject
@property (nonatomic, weak, readonly) YGLayout *yoga;
- (instancetype)initWithYoga:(YGLayout *)yoga;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (WSFlexLayoutItem *)addChild:(nullable WSFlexLayoutItem *)child withMakeLayout:(WSFlexLayoutMakerBlock)block;
- (WSFlexLayoutItem *)addChildWithMakeLayout:(WSFlexLayoutMakerBlock)block
NS_SWIFT_NAME(addChild(withMakeLayout:));
@end
NS_ASSUME_NONNULL_END



NS_ASSUME_NONNULL_BEGIN
@interface YGLayout (WSFlexLayoutMaker)
@property (nonatomic, readonly) WSFlexLayoutMaker *make;
@end
NS_ASSUME_NONNULL_END



NS_ASSUME_NONNULL_BEGIN
@interface WSFlexLayoutDiv (WSFlexLayoutMaker)
- (void)makeFlexLayout:(WSFlexLayoutMakerBlock)block;
@end

@interface UIView (WSFlexLayoutMaker)
- (void)makeFlexLayout:(WSFlexLayoutMakerBlock)block;
@end

@interface CALayer (WSFlexLayoutMaker)
- (void)makeFlexLayout:(WSFlexLayoutMakerBlock)block;
@end
NS_ASSUME_NONNULL_END
