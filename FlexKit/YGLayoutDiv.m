//
//  YGLayoutDiv.m
//  FlexKit
//
//  Created by 余汪送 on 2018/6/4.
//  Copyright © 2018年 capsule. All rights reserved.
//

#import "YGLayoutDiv.h"
#import "YGLayout+Private.h"
#import "YGLayoutMaker.h"

@interface YGLayoutDiv ()
@property (nonatomic, strong) NSMutableArray<YGLayoutDiv *> *childrenArray;
@property (nonatomic, weak) YGLayoutDiv *parentDiv;
@property (nonatomic, weak) UIView *superView;
@end

@implementation YGLayoutDiv

@synthesize yoga = _yoga;
@synthesize superView = _superView;

- (instancetype)initWithView:(UIView *)view {
    if (self = [super init]) {
        _view = view;
    }
    return self;
}

- (YGLayout *)yoga {
    if (!_yoga) {
        _yoga = [[YGLayout alloc]initWithVirtualView:self];
        _yoga.isEnabled = YES;
    }
    return _yoga;
}

- (YGLayoutMaker *)make {
    return self.yoga.make;
}

- (NSMutableArray<YGLayoutDiv *> *)childrenArray {
    if (!_childrenArray) _childrenArray = [NSMutableArray array];
    return _childrenArray;
}

- (YGLayoutDiv *)parent {
    return self.parentDiv;
}

- (NSArray *)children {
    return self.childrenArray;
}

- (CGRect)frame {
    if (!self.view || self.parent) return _frame;
    if ([[NSThread currentThread] isMainThread]) {
        return self.view.frame;
    } else {
        __block CGRect rect = _frame;
        dispatch_sync(dispatch_get_main_queue(), ^{
            rect = self.view.frame;
        });
        return rect;
    }
    return _frame;
}

- (void)addChild:(YGLayoutDiv *)child {
    if (!child) return;
    if (![child isKindOfClass:[YGLayoutDiv class]]) return;
    if ([self.childrenArray containsObject:child]) return;
    child.parentDiv = self;
    [self.childrenArray addObject:child];
    YGAddChildrenViewsToSuperViewHierarchy(self, child);
}

- (void)addChildren:(NSArray<YGLayoutDiv *> *)children {
    if (children.count == 0) return;
    for (NSInteger i = 0; i < children.count; i++) {
        [self addChild:children[i]];
    }
}

- (void)removeChild:(YGLayoutDiv *)child {
    if (!child) return;
    if ([self.childrenArray containsObject:child]) return;
    [self.childrenArray removeObject:child];
    if (child.view) {
        [child.view removeFromSuperview];
    }
}

- (void)removeFromParent {
    [self.parent removeChild:self];
}

- (YGLayoutMaker *)makeLayout:(YGMakeLayoutBlock)block {
    YGLayoutMaker *maker = self.yoga.make;
    if (block) block(maker);
    return maker;
}

- (UIView *)superView {
    if (!_superView) {
        _superView = YGGetSuperViewOfLayoutDivHierarchy(self);
    }
    return _superView;
}

static inline UIView *YGGetSuperViewOfLayoutDivHierarchy(YGLayoutDiv *div) {
    if (!div) return nil;
    YGLayoutDiv *parent = div.parent;
    if (parent.view) return parent.view;
    return YGGetSuperViewOfLayoutDivHierarchy(parent);
}

static inline void YGAddChildrenViewsToSuperViewHierarchy(YGLayoutDiv *div, YGLayoutDiv *child) {
    UIView *container = div.view? :div.superView;
    child.superView = container;
    if (child.view) {
        [child.view removeFromSuperview];
        [child.superView addSubview:child.view];
    } else {
        for (int i = 0; i < child.children.count; i++) {
            YGAddChildrenViewsToSuperViewHierarchy(child, child.children[i]);
        }
    }
}

#pragma mark YGLayoutDivProtocol
- (YGLayoutDiv *)layoutDiv {
    return self;
}

@end
