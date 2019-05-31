//
//  CALayer+FlexKit.m
//  FlexDemo
//
//  Created by 余汪送 on 2019/5/29.
//  Copyright © 2019 capsule. All rights reserved.
//

#import "CALayer+FlexKit.h"
#import "YGLayout+Private.h"
#import <objc/runtime.h>
#import "WSFlexLayoutItemBucket.h"

@implementation CALayer (FlexKit)

- (BOOL)isYogaEnabled {
    return objc_getAssociatedObject(self, @selector(yoga)) != nil;
}

- (YGLayout *)yoga {
    YGLayout *yoga = objc_getAssociatedObject(self, @selector(yoga));
    if (!yoga) {
        yoga = [[YGLayout alloc]initWithItem:self];
        yoga.isEnabled = YES;
        objc_setAssociatedObject(self, @selector(yoga), yoga, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return yoga;
}

- (WSFlexLayoutItemBucket *)itemBucket {
    WSFlexLayoutItemBucket *itemBucket = objc_getAssociatedObject(self, @selector(itemBucket));
    if (!itemBucket) {
        itemBucket = [[WSFlexLayoutItemBucket alloc]initWithOwner:self];
        objc_setAssociatedObject(self, @selector(itemBucket), itemBucket, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return itemBucket;
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

- (void)setParent:(WSFlexLayoutItem *)parent {
    objc_setAssociatedObject(self, @selector(parent), parent, OBJC_ASSOCIATION_ASSIGN);
}

- (WSFlexLayoutItem *)parent {
    return objc_getAssociatedObject(self, @selector(parent));
}

- (void)setFlexFrame:(CGRect)flexFrame {
    self.frame = _FlexLayoutSetLayerFrameOfItemHierarchy(self, flexFrame);
}

- (CGRect)flexFrame {
    return self.frame;
}

- (CGSize)measureItemWithSize:(CGSize)size {
    return [self preferredFrameSize];
}

- (void)configureLayoutWithBlock:(void(^)(YGLayout *layout))block {
    if (block) {
        block(self.yoga);
    }
}

static CGRect _FlexLayoutSetLayerFrameOfItemHierarchy(WSFlexLayoutItem *item, CGRect originRect) {
    if (item.parent &&
        ![item.parent isKindOfClass:[CALayer class]] &&
        ![item.parent isKindOfClass:[UIView class]]) {
        originRect.origin.x += item.parent.flexFrame.origin.x;
        originRect.origin.y += item.parent.flexFrame.origin.y;
        return _FlexLayoutSetLayerFrameOfItemHierarchy(item.parent, originRect);
    }
    return originRect;
}

@end
