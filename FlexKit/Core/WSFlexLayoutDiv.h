//
//  WSFlexLayoutDiv.h
//  FlexDemo
//
//  Created by 余汪送 on 2019/5/22.
//  Copyright © 2019 capsule. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSFlexLayoutItemProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface WSFlexLayoutDiv : NSObject <WSFlexLayoutItemProtocol>

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
