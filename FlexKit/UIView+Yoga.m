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
        div = [[YGLayoutDiv alloc]init];
        [div bindingView:self];
        objc_setAssociatedObject(self, @selector(layoutDiv), div, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return div;
}

- (BOOL)isYogaEnabled {
    YGLayoutDiv *div = objc_getAssociatedObject(self, @selector(layoutDiv));
    return div.yoga != nil;
}

- (void)makeLayout:(YGMakeLayoutBlock)block {
    [self.layoutDiv makeLayout: block];
}

@end