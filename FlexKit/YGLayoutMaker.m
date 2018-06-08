//
//  YGLayoutMaker.m
//  FlexLayoutTest
//
//  Created by 余汪送 on 2018/6/1.
//  Copyright © 2018年 capsule. All rights reserved.
//

#import "YGLayoutMaker.h"
#import "YGLayout+Private.h"

#define YG_MAKER_PROPERTY_REALIZE(type, property) \
- (YGLayoutMaker *(^)(type))property { \
return ^(type property) { \
self.yoga.property = property; \
return self; \
}; \
}

@implementation YGLayout (YGLayoutMaker)
- (YGLayoutMaker *)make {
    return [[YGLayoutMaker alloc]initWithLayout:self];
}
@end

@interface YGLayoutMaker ()
@end

@implementation YGLayoutMaker

- (instancetype)initWithLayout:(YGLayout *)yoga {
    if (self = [super init]) {
        _yoga = yoga;
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

- (YGLayoutMaker *(^)(void))markDirty {
    return ^(void) {
        [self.yoga markDirty];
        return self;
    };
}

- (YGLayoutMaker *(^)(id<YGLayoutDivProtocol>))addChild {
    return ^(id<YGLayoutDivProtocol> child) {
        [self.yoga.view addChild: child.layoutDiv];
        return child.layoutDiv.yoga.make;
    };
}

- (void(^)(NSArray<id<YGLayoutDivProtocol>> *))addChildren {
    return ^(NSArray<id<YGLayoutDivProtocol>> * children) {
        for (NSInteger i = 0; i < children.count; i++) {
            [self.yoga.view addChild:children[i].layoutDiv];
        }
    };
}

- (YGLayoutMaker *(^)(id<YGLayoutDivProtocol>))removeChild {
    return ^(id<YGLayoutDivProtocol> child) {
        [self.yoga.view removeChild: child.layoutDiv];
        return self;
    };
}

- (YGLayoutMaker *(^)(void))removeFromParent {
    return ^(void) {
        [self.yoga.view removeFromParent];
        return self;
    };
}

- (YGLayoutDiv *)addChild:(id<YGLayoutDivProtocol>)child withMakeLayout:(YGMakeLayoutBlock)block {
    if (!child) child = [[YGLayoutDiv alloc]init];
    [self.yoga.view addChild:child.layoutDiv];
    [child.layoutDiv makeLayout:block];
    return child;
}

- (YGLayoutDiv *)addChildWithMakeLayout:(YGMakeLayoutBlock)block {
    YGLayoutDiv *view = [[YGLayoutDiv alloc]init];
    [self.yoga.view addChild:view];
    [view makeLayout:block];
    return view;
}

@end



