//
//  YGFlexDiv.m
//  jscallnative
//
//  Created by 余汪送 on 2019/2/15.
//  Copyright © 2019 capsule. All rights reserved.
//

#import "YGFlexDiv.h"
#import "YGFlexLayout.h"

@interface YGFlexDiv ()

@property (nonatomic, strong) NSMutableArray *mChildren;

@end

@implementation YGFlexDiv

@synthesize yoga = _yoga;
@synthesize parent = _parent;
@synthesize frame = _frame;

- (instancetype)initWithView:(nullable UIView *)view {
    if (self = [super init]) {
        _view = view;
        _frame = view.frame;
        _bounds = view.bounds;
    }
    return self;
}

- (void)addChild:(YGFlexDiv *)child {
    if (!child) return;
    if (![child isKindOfClass:[YGFlexDiv class]]) return;
    if ([self.mChildren containsObject:child]) return;
    child->_parent = self;
    [self.mChildren addObject:child];
    YGAddChildrenViewsToSuperViewHierarchy(self, child);
}

- (void)addChildren:(NSArray<YGFlexDiv *> *)children {
    if (children.count == 0) return;
    for (NSInteger i = 0; i < children.count; i++) {
        [self addChild:children[i]];
    }
}

- (void)removeChild:(YGFlexDiv *)child {
    if (!child) return;
    if ([self.mChildren containsObject:child]) return;
    [self.mChildren removeObject:child];
    if (child.view) {
        [child.view removeFromSuperview];
    }
}

- (void)removeFromParent {
    [self.parent removeChild:self];
}

- (void)markChildrenDirty {
    for (YGFlexDiv *div in self.children) {
        if (div.children.count > 0) continue;
        [div.yoga markDirty];
    }
}

- (void)setFrame:(CGRect)frame {
    if (!self.parent.view) {
        frame.origin.x += self.parent.frame.origin.x;
        frame.origin.y += self.parent.frame.origin.y;
    }
    _frame = frame;
    _bounds = CGRectMake(0, 0, _frame.size.width, _frame.size.height);
    if (!_disableAutoApplyFrameToView) {
        _view.frame = _frame;
    }
    if (_updateViewFrameBlock) {
        _updateViewFrameBlock(_frame);
    }
}

- (CGRect)frame {
    if (!self.view || self.parent) {
        return _frame;
    }
    return self.view.frame;
}

- (CGRect)bounds {
    _bounds = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    return _bounds;
}

#pragma mark getter
- (YGFlexLayout *)yoga {
    if (!_yoga) {
        _yoga = [[YGFlexLayout alloc]initWithDiv:self];
        _yoga.isEnabled = YES;
    }
    return _yoga;
}

- (NSMutableArray *)mChildren {
    if (!_mChildren) {
        _mChildren = [NSMutableArray array];
    }
    return _mChildren;
}

- (NSArray<YGFlexDiv *> *)children {
    return [self.mChildren copy];
}

- (NSArray<YGFlexDiv *> *)subviews {
    return [self.mChildren copy];
}

- (CGSize)sizeThatFits:(CGSize)size {
    if (self.view) {
        return [self.view sizeThatFits: size];
    }
    return self.frame.size;
}

static inline UIView *YGGetSuperViewOfLayoutDivHierarchy(YGFlexDiv *div) {
    if (!div) return nil;
    YGFlexDiv *parent = div.parent;
    if (parent.view) return parent.view;
    return YGGetSuperViewOfLayoutDivHierarchy(parent);
}

static inline void YGAddChildrenViewsToSuperViewHierarchy(YGFlexDiv *div, YGFlexDiv *child) {
    UIView *container = div.view? :YGGetSuperViewOfLayoutDivHierarchy(div);
    if (child.view && !child.view.superview) {
        [container addSubview:child.view];
    } else {
        for (int i = 0; i < child.children.count; i++) {
            YGAddChildrenViewsToSuperViewHierarchy(child, child.children[i]);
        }
    }
}

- (YGFlexDiv *)flexDiv {
    return self;
}

@end
