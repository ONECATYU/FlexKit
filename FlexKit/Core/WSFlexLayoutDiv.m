//
//  WSFlexLayoutDiv.m
//  FlexDemo
//
//  Created by 余汪送 on 2019/5/22.
//  Copyright © 2019 capsule. All rights reserved.
//

#import "WSFlexLayoutDiv.h"
#import "YGLayout+Private.h"
#import "WSFlexLayoutItemBucket.h"

@interface WSFlexLayoutDiv ()
@property (nonatomic, strong) WSFlexLayoutItemBucket *itemBucket;
@end

@implementation WSFlexLayoutDiv

@synthesize yoga = _yoga;

- (WSFlexLayoutItemBucket *)itemBucket {
    if (!_itemBucket) {
        _itemBucket = [[WSFlexLayoutItemBucket alloc]initWithOwner:self];
    }
    return _itemBucket;
}

- (YGLayout *)yoga {
    if (!_yoga) {
        _yoga = [[YGLayout alloc]initWithItem:self];
        _yoga.isEnabled = YES;
    }
    return _yoga;
}

- (void)setChildren:(NSArray<WSFlexLayoutItem *> *)children {
    [self.itemBucket setChildren:children];
}

- (NSArray<WSFlexLayoutItem *> *)children {
    return self.itemBucket.children;
}

- (void)addChild:(WSFlexLayoutDiv *)child {
    [self.itemBucket addChild:child];
}

- (void)removeChild:(WSFlexLayoutDiv *)child {
    [self.itemBucket removeChild:child];
}

- (CGSize)measureItemWithSize:(CGSize)size {
    return size;
}

- (void)configureLayoutWithBlock:(void(^)(YGLayout *layout))block {
    if (block) {
        block(self.yoga);
    }
}


@end
