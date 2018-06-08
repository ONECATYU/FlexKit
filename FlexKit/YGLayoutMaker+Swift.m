//
//  YGLayoutMaker+Swift.m
//  FlexKit
//
//  Created by 余汪送 on 2018/6/5.
//  Copyright © 2018年 capsule. All rights reserved.
//

#import "YGLayoutMaker+Swift.h"
#import "YGLayout+Private.h"

#define YG_MAKER_PROPERTY_REALIZE_SWIFT(type, property) \
- (YGLayoutMaker *)property:(type)property { \
self.yoga.property = property; \
return self; \
}

@implementation YGLayoutMaker (Swift)

YG_MAKER_PROPERTY_REALIZE_SWIFT(BOOL, isIncludedInLayout)

YG_MAKER_PROPERTY_REALIZE_SWIFT(BOOL, isEnabled)

YG_MAKER_PROPERTY_REALIZE_SWIFT(YGDirection, direction)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGFlexDirection, flexDirection)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGJustify, justifyContent)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGAlign, alignContent)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGAlign, alignItems)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGAlign, alignSelf)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGPositionType, position)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGWrap, flexWrap)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGOverflow, overflow)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGDisplay, display)

YG_MAKER_PROPERTY_REALIZE_SWIFT(CGFloat, flexGrow)
YG_MAKER_PROPERTY_REALIZE_SWIFT(CGFloat, flexShrink)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, flexBasis)

YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, left)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, top)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, right)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, bottom)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, start)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, end)

YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, marginLeft)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, marginTop)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, marginRight)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, marginBottom)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, marginStart)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, marginEnd)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, marginHorizontal)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, marginVertical)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, margin)

YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, paddingLeft)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, paddingTop)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, paddingRight)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, paddingBottom)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, paddingStart)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, paddingEnd)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, paddingHorizontal)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, paddingVertical)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, padding)

YG_MAKER_PROPERTY_REALIZE_SWIFT(CGFloat, borderLeftWidth)
YG_MAKER_PROPERTY_REALIZE_SWIFT(CGFloat, borderTopWidth)
YG_MAKER_PROPERTY_REALIZE_SWIFT(CGFloat, borderRightWidth)
YG_MAKER_PROPERTY_REALIZE_SWIFT(CGFloat, borderBottomWidth)
YG_MAKER_PROPERTY_REALIZE_SWIFT(CGFloat, borderStartWidth)
YG_MAKER_PROPERTY_REALIZE_SWIFT(CGFloat, borderEndWidth)
YG_MAKER_PROPERTY_REALIZE_SWIFT(CGFloat, borderWidth)

YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, width)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, height)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, minWidth)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, minHeight)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, maxWidth)
YG_MAKER_PROPERTY_REALIZE_SWIFT(YGValue, maxHeight)

YG_MAKER_PROPERTY_REALIZE_SWIFT(CGFloat, aspectRatio)

- (YGLayoutMaker *)markDirty {
    [self.yoga markDirty];
    return self;
}

- (YGLayoutMaker *)addChild:(id<YGLayoutDivProtocol>)child {
    [self.yoga.view addChild:child.layoutDiv];
    return child.layoutDiv.yoga.make;
}

- (void)addChildren:(NSArray<id<YGLayoutDivProtocol>> *)children {
    for (NSInteger i = 0; i < children.count; i++) {
        [self.yoga.view addChild:children[i].layoutDiv];
    }
}

- (YGLayoutMaker *)removeChild:(id<YGLayoutDivProtocol>)child {
    [self.yoga.view removeChild: child.layoutDiv];
    return self;
}

- (YGLayoutMaker *)removeFromParent {
    [self.yoga.view removeFromParent];
    return self;
}

@end
