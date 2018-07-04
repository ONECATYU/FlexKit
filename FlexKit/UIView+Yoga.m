/**
 * Copyright (c) 2014-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "UIView+Yoga.h"
#import "YGLayout+Private.h"
#import <objc/runtime.h>

static const void *kYGYogaAssociatedKey = &kYGYogaAssociatedKey;

@implementation UIView (YogaKit)

- (YGLayout *)yoga {
  return self.layoutDiv.yoga;
}

- (YGLayoutDiv *)layoutDiv {
    YGLayoutDiv *div = objc_getAssociatedObject(self, @selector(layoutDiv));
    if (!div) {
        div = [[YGLayoutDiv alloc]initWithView:self];
        __weak typeof(self) weakSelf = self;
        [div setUpdateFrameBlock:^(CGRect frame) {
            weakSelf.frame = frame;
        }];
        objc_setAssociatedObject(self, @selector(layoutDiv), div, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return div;
}

- (BOOL)isYogaEnabled {
    YGLayoutDiv *div = objc_getAssociatedObject(self, @selector(layoutDiv));
    return div.yoga != nil;
}

- (void)markSubViewsDirty {
    if (!self.isYogaEnabled) return;
    for (UIView *subView in self.subviews) {
        if (!subView.isYogaEnabled) continue;
        if (subView.layoutDiv.children.count > 0) continue;
        [subView.yoga markDirty];
    }
}

@end
