//
//  WSFlexLayoutItemBucket.h
//  FlexDemo
//
//  Created by 余汪送 on 2019/5/29.
//  Copyright © 2019 capsule. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSFlexLayoutItemProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface WSFlexLayoutItemBucket : NSObject

@property (nonatomic, weak, readonly) WSFlexLayoutItem *owner;

@property (nonatomic, strong) NSArray<WSFlexLayoutItem *> *children;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWithOwner:(WSFlexLayoutItem *)owner;
+ (instancetype)bucketWithOwner:(WSFlexLayoutItem *)owner;

- (void)addChild:(WSFlexLayoutItem *)child;
- (void)removeChild:(WSFlexLayoutItem *)child;

@end

NS_ASSUME_NONNULL_END
