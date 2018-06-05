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
@end

@implementation YGLayoutDiv

@synthesize yoga = _yoga;
@synthesize bindingView = _bindingView;
@synthesize superView = _superView;

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
    if (!self.bindingView || self.parent) return _frame;
    if ([[NSThread currentThread] isMainThread]) {
        return self.bindingView.frame;
    } else {
        __block CGRect rect = _frame;
        dispatch_sync(dispatch_get_main_queue(), ^{
            rect = self.bindingView.frame;
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
}

- (void)removeFromParent {
    [self.parent removeChild:self];
}

- (void)bindingView:(UIView *)view {
    _bindingView = view;
}

- (void)addChildrenBindingViewToSuperView {
    UIView *superView = self.bindingView;
    if (!superView) superView = self.superView;
    for (NSInteger i = 0; i < self.children.count; i++) {
        YGLayoutDiv *child = self.children[i];
        if (child.bindingView && !child.bindingView.superview) {
            [superView addSubview:child.bindingView];
        }
        [child addChildrenBindingViewToSuperView];
    }
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

static UIView *YGGetSuperViewOfLayoutDivHierarchy(YGLayoutDiv *div) {
    if (!div) return nil;
    if (div.bindingView.superview)  return div.bindingView.superview;
    YGLayoutDiv *parent = div.parent;
    if (parent.bindingView) return parent.bindingView;
    return YGGetSuperViewOfLayoutDivHierarchy(parent);
}

#pragma mark YGLayoutDivProtocol
- (YGLayoutDiv *)layoutDiv {
    return self;
}

@end
