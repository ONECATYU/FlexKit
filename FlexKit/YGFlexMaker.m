//
//  YGFlexMaker.m
//  jscallnative
//
//  Created by 余汪送 on 2019/2/15.
//  Copyright © 2019 capsule. All rights reserved.
//

#import "YGFlexMaker.h"

#define YG_MAKER_PROPERTY_REALIZE(type, property) \
- (YGFlexMaker *(^)(type))property { \
return ^(type property) { \
self.flexLayout.property = property; \
return self; \
}; \
}

@implementation YGFlexLayout (YGFlexMaker)
- (YGFlexMaker *)make {
    return [[YGFlexMaker alloc]initWithLayout:self];
}
@end

@implementation YGFlexDiv (YGFlexMaker)

- (void)makeLayout:(void (^)(YGFlexMaker *make))block {
    if (block) {
        block(self.yoga.make);
    }
}

@end

@implementation YGFlexMaker

- (instancetype)initWithLayout:(YGFlexLayout *)flexLayout {
    if (self = [super init]) {
        _flexLayout = flexLayout;
        _flexLayout.isEnabled = YES;
    }
    return self;
}

YG_MAKER_PROPERTY_REALIZE(BOOL, isIncludedInLayout);

YG_MAKER_PROPERTY_REALIZE(BOOL, isEnabled)

YG_MAKER_PROPERTY_REALIZE(YGDirection, direction);
YG_MAKER_PROPERTY_REALIZE(YGFlexDirection, flexDirection);
YG_MAKER_PROPERTY_REALIZE(YGJustify, justifyContent);
YG_MAKER_PROPERTY_REALIZE(YGAlign, alignContent);
YG_MAKER_PROPERTY_REALIZE(YGAlign, alignItems);
YG_MAKER_PROPERTY_REALIZE(YGAlign, alignSelf);
YG_MAKER_PROPERTY_REALIZE(YGPositionType, position);
YG_MAKER_PROPERTY_REALIZE(YGWrap, flexWrap);
YG_MAKER_PROPERTY_REALIZE(YGOverflow, overflow);
YG_MAKER_PROPERTY_REALIZE(YGDisplay, display);

YG_MAKER_PROPERTY_REALIZE(CGFloat, flexGrow);
YG_MAKER_PROPERTY_REALIZE(CGFloat, flexShrink);
YG_MAKER_PROPERTY_REALIZE(YGValue, flexBasis);

YG_MAKER_PROPERTY_REALIZE(YGValue, left);
YG_MAKER_PROPERTY_REALIZE(YGValue, top);
YG_MAKER_PROPERTY_REALIZE(YGValue, right);
YG_MAKER_PROPERTY_REALIZE(YGValue, bottom);
YG_MAKER_PROPERTY_REALIZE(YGValue, start);
YG_MAKER_PROPERTY_REALIZE(YGValue, end);

YG_MAKER_PROPERTY_REALIZE(YGValue, marginLeft);
YG_MAKER_PROPERTY_REALIZE(YGValue, marginTop);
YG_MAKER_PROPERTY_REALIZE(YGValue, marginRight);
YG_MAKER_PROPERTY_REALIZE(YGValue, marginBottom);
YG_MAKER_PROPERTY_REALIZE(YGValue, marginStart);
YG_MAKER_PROPERTY_REALIZE(YGValue, marginEnd);
YG_MAKER_PROPERTY_REALIZE(YGValue, marginHorizontal);
YG_MAKER_PROPERTY_REALIZE(YGValue, marginVertical);
YG_MAKER_PROPERTY_REALIZE(YGValue, margin);

YG_MAKER_PROPERTY_REALIZE(YGValue, paddingLeft);
YG_MAKER_PROPERTY_REALIZE(YGValue, paddingTop);
YG_MAKER_PROPERTY_REALIZE(YGValue, paddingRight);
YG_MAKER_PROPERTY_REALIZE(YGValue, paddingBottom);
YG_MAKER_PROPERTY_REALIZE(YGValue, paddingStart);
YG_MAKER_PROPERTY_REALIZE(YGValue, paddingEnd);
YG_MAKER_PROPERTY_REALIZE(YGValue, paddingHorizontal);
YG_MAKER_PROPERTY_REALIZE(YGValue, paddingVertical);
YG_MAKER_PROPERTY_REALIZE(YGValue, padding);

YG_MAKER_PROPERTY_REALIZE(CGFloat, borderLeftWidth);
YG_MAKER_PROPERTY_REALIZE(CGFloat, borderTopWidth);
YG_MAKER_PROPERTY_REALIZE(CGFloat, borderRightWidth);
YG_MAKER_PROPERTY_REALIZE(CGFloat, borderBottomWidth);
YG_MAKER_PROPERTY_REALIZE(CGFloat, borderStartWidth);
YG_MAKER_PROPERTY_REALIZE(CGFloat, borderEndWidth);
YG_MAKER_PROPERTY_REALIZE(CGFloat, borderWidth);

YG_MAKER_PROPERTY_REALIZE(YGValue, width);
YG_MAKER_PROPERTY_REALIZE(YGValue, height);
YG_MAKER_PROPERTY_REALIZE(YGValue, minWidth);
YG_MAKER_PROPERTY_REALIZE(YGValue, minHeight);
YG_MAKER_PROPERTY_REALIZE(YGValue, maxWidth);
YG_MAKER_PROPERTY_REALIZE(YGValue, maxHeight);

YG_MAKER_PROPERTY_REALIZE(CGFloat, aspectRatio);

- (YGFlexMaker *(^)(CGSize))size {
    return ^(CGSize size) {
        self.flexLayout.width = YGPointValue(size.width);
        self.flexLayout.height = YGPointValue(size.height);
        return self;
    };
}

- (YGFlexMaker *(^)(void))markDirty {
    return ^(void) {
        [self.flexLayout markDirty];
        return self;
    };
}

- (YGFlexMaker *(^)(_Nullable id<YGFlexDivProtocol>))addChild {
    return ^(_Nullable id<YGFlexDivProtocol> child) {
        if (!child) child = [[YGFlexDiv alloc]initWithView:nil];
        [self.flexLayout.flexDiv addChild: child.flexDiv];
        return child.flexDiv.yoga.make;
    };
}


- (YGFlexDiv *)addChild:(_Nullable id<YGFlexDivProtocol>)child withMakeLayout:(void(^)(YGFlexMaker *make))block {
    if (!child) child = [[YGFlexDiv alloc]initWithView:nil];
    [self.flexLayout.flexDiv addChild:child.flexDiv];
    [child.flexDiv makeLayout:block];
    return child;
}

- (YGFlexDiv *)addChildWithMakeLayout:(void (^)(YGFlexMaker *make))block {
    YGFlexDiv *child = [[YGFlexDiv alloc]initWithView:nil];
    [self.flexLayout.flexDiv addChild:child.flexDiv];
    [child.flexDiv makeLayout:block];
    return child;
}

- (void(^)(NSArray<id<YGFlexDivProtocol>> *))addChildren {
    return ^(NSArray<id<YGFlexDivProtocol>> *children) {
        for (NSInteger i = 0; i < children.count; i++) {
            [self.flexLayout.flexDiv addChild:children[i].flexDiv];
        }
    };
}

- (YGFlexMaker *(^)(id<YGFlexDivProtocol>))removeChild {
    return ^(id<YGFlexDivProtocol> child) {
        [self.flexLayout.flexDiv removeChild:child.flexDiv];
        return self;
    };
}

- (YGFlexMaker *(^)(void))removeFromParent {
    return ^(void) {
        [self.flexLayout.flexDiv removeFromParent];
        return self;
    };
}

@end
