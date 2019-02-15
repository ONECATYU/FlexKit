//
//  YGFlexLayout.m
//  jscallnative
//
//  Created by 余汪送 on 2019/2/15.
//  Copyright © 2019 capsule. All rights reserved.
//

#import "YGFlexLayout.h"
#import "UIView+Yoga.h"
#import "YGFlexMaker.h"

static YGConfigRef flexGlobalConfig;

@interface YGLayout ()

@property (nonatomic, assign, readonly) YGNodeRef node;
@property (nonatomic, weak, readonly) UIView *view;

- (instancetype)initWithView:(UIView *)view;

@end


@interface YGFlexLayout ()

@end

@implementation YGFlexLayout {
    YGNodeRef _node;
}

+ (void)initialize
{
    flexGlobalConfig = YGConfigNew();
    YGConfigSetExperimentalFeatureEnabled(flexGlobalConfig, YGExperimentalFeatureWebFlexBasis, true);
    YGConfigSetPointScaleFactor(flexGlobalConfig, 0);
}

- (instancetype)initWithDiv:(YGFlexDiv *)layoutDiv {
    if (self = [super initWithView:(id)layoutDiv]) {
        _flexDiv = layoutDiv;
        _node = YGNodeNewWithConfig(flexGlobalConfig);
        YGNodeSetContext(_node, (__bridge void *) layoutDiv);
    }
    return self;
}

- (void)applyLayout
{
    [self calculateLayoutWithSize:self.view.bounds.size];
    YGApplyLayoutToViewHierarchy(self.view, NO);
}

- (void)extracted:(BOOL)preserveOrigin {
    YGApplyLayoutToViewHierarchy(self.view, preserveOrigin);
}

- (void)applyLayoutPreservingOrigin:(BOOL)preserveOrigin
{
    [self calculateLayoutWithSize:self.view.bounds.size];
    [self extracted:preserveOrigin];
}

- (void)applyLayoutPreservingOrigin:(BOOL)preserveOrigin dimensionFlexibility:(YGDimensionFlexibility)dimensionFlexibility
{
    CGSize size = self.view.bounds.size;
    if (dimensionFlexibility & YGDimensionFlexibilityFlexibleWidth) {
        size.width = YGUndefined;
    }
    if (dimensionFlexibility & YGDimensionFlexibilityFlexibleHeight) {
        size.height = YGUndefined;
    }
    [self calculateLayoutWithSize:size];
    YGApplyLayoutToViewHierarchy(self.view, preserveOrigin);
}

static void YGApplyLayoutToViewHierarchy(UIView *view, BOOL preserveOrigin)
{
    NSCAssert([NSThread isMainThread], @"Framesetting should only be done on the main thread.");
    
    const YGLayout *yoga = view.yoga;
    
    if (!yoga.isIncludedInLayout) {
        return;
    }
    
    YGNodeRef node = yoga.node;
    const CGPoint topLeft = {
        YGNodeLayoutGetLeft(node),
        YGNodeLayoutGetTop(node),
    };
    
    const CGPoint bottomRight = {
        topLeft.x + YGNodeLayoutGetWidth(node),
        topLeft.y + YGNodeLayoutGetHeight(node),
    };
    
    const CGPoint origin = preserveOrigin ? view.frame.origin : CGPointZero;
    view.frame = (CGRect) {
        .origin = {
            .x = topLeft.x + origin.x,
            .y = topLeft.y + origin.y,
        },
        .size = {
            .width = bottomRight.x - topLeft.x,
            .height = bottomRight.y - topLeft.y,
        },
    };
    
    if (!yoga.isLeaf) {
        for (NSUInteger i=0; i<view.subviews.count; i++) {
            YGApplyLayoutToViewHierarchy(view.subviews[i], NO);
        }
    }
}

@end
