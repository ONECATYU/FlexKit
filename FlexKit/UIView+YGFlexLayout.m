//
//  UIView+YGFlexLayout.m
//  jscallnative
//
//  Created by 余汪送 on 2019/2/15.
//  Copyright © 2019 capsule. All rights reserved.
//

#import "UIView+YGFlexLayout.h"
#import <objc/runtime.h>

@implementation UIView (YGFlexLayout)

- (YGFlexLayout *)flexLayout {
    return self.flexDiv.yoga;
}

- (YGFlexDiv *)flexDiv {
    YGFlexDiv *div = objc_getAssociatedObject(self, @selector(flexDiv));
    if (!div) {
        div = [[YGFlexDiv alloc]initWithView:self];
        objc_setAssociatedObject(self, @selector(flexDiv), div, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return div;
}

- (BOOL)isFlexEnabled {
    YGFlexDiv *div = objc_getAssociatedObject(self, @selector(flexDiv));
    return div.yoga != nil;
}

- (void)markSubViewsDirty {
    if (!self.isFlexEnabled) return;
    for (UIView *subView in self.subviews) {
        if (!subView.isFlexEnabled) continue;
        if (subView.flexDiv.children.count > 0) continue;
        [subView.flexLayout markDirty];
    }
}

- (void)makeLayout:(void(^)(YGFlexMaker *make))block {
    if (block) {
        [self.flexDiv makeLayout:block];
    }
}

@end
