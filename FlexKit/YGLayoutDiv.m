//
//  YGLayoutDiv.m
//  FlexKit
//
//  Created by 余汪送 on 2018/6/4.
//  Copyright © 2018年 capsule. All rights reserved.
//

#import "YGLayoutDiv.h"
#import "YGLayout+Private.h"

@interface YGLayoutDiv ()
@property (nonatomic, strong) NSMutableArray<YGLayoutDiv *> *childrenArray;
@property (nonatomic, weak) YGLayoutDiv *parentDiv;
@property (nonatomic, weak) UIView *superView;
@property (nonatomic, copy) void(^updateFrameBlock)(CGRect frame);
@end

@implementation YGLayoutDiv

@synthesize yoga = _yoga;
@synthesize superView = _superView;
@synthesize frame = _frame;

- (instancetype)initWithView:(UIView *)view {
    if (self = [super init]) {
        _view = view;
        _frame = view.frame;
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

- (void)setFrame:(CGRect)frame {
    YGLayoutDiv *parent = self.parent;
    if (!parent.view) {
        frame.origin.x += parent.frame.origin.x;
        frame.origin.y += parent.frame.origin.y;
    }
    _frame = frame;
    FK_MAIN_QUEUE_EXEC({
        if (self.updateFrameBlock) self.updateFrameBlock(frame);
    })
}

- (CGRect)frame {
    if (!self.view || self.parent) return _frame;
    __block CGRect rect = _frame;
    FK_MAIN_QUEUE_EXEC({
        rect = self.view.frame;
    })
    return rect;
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
    YGNodeRemoveChild(self.yoga.node, child.yoga.node);
}

- (void)removeFromParent {
    [self.parent removeChild:self];
}

- (void)markChildrenDirty {
    for (YGLayoutDiv *div in self.children) {
        if (div.children.count > 0) continue;
        [div.yoga markDirty];
    }
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
    if (child.view && !child.view.superview) {
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
