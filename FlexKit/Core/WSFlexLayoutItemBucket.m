//
//  WSFlexLayoutItemBucket.m
//  FlexDemo
//
//  Created by 余汪送 on 2019/5/29.
//  Copyright © 2019 capsule. All rights reserved.
//

#import "WSFlexLayoutItemBucket.h"
#import "YGLayout.h"

@implementation WSFlexLayoutItemBucket {
    NSMutableArray<WSFlexLayoutItem *> *_childrenArray;
}

+ (instancetype)bucketWithOwner:(WSFlexLayoutItem *)owner {
    return [[self alloc]initWithOwner:owner];
}

- (instancetype)initWithOwner:(WSFlexLayoutItem *)owner {
    if (self = [super init]) {
        _owner = owner;
    }
    return self;
}

- (void)setChildren:(NSArray<WSFlexLayoutItem *> *)children {
    if (children) {
        [self.childrenArray removeAllObjects];
        for (NSInteger i = 0; i < children.count; i++) {
            [self addChild:children[i]];
        }
    }
}

- (NSArray<WSFlexLayoutItem *> *)children {
    return [self.childrenArray copy];
}

- (NSMutableArray<WSFlexLayoutItem *> *)childrenArray {
    if (!_childrenArray) {
        _childrenArray = [NSMutableArray array];
    }
    return _childrenArray;
}

- (void)addChild:(WSFlexLayoutItem *)child {
    if (![child conformsToProtocol:@protocol(WSFlexLayoutItemProtocol)] ||
        [self.childrenArray containsObject:child]) {
        return;
    }
    child.parent = _owner;
    [self.childrenArray addObject:child];
}

- (void)removeChild:(WSFlexLayoutItem *)child {
    if (![child conformsToProtocol:@protocol(WSFlexLayoutItemProtocol)] ||
        [self.childrenArray containsObject:child]) {
        return;
    }
    [self.childrenArray removeObject:child];
}

@end
