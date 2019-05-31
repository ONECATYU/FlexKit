//
//  WSFlexLayoutMaker+Swift.m
//  FlexDemo
//
//  Created by 余汪送 on 2019/5/30.
//  Copyright © 2019 capsule. All rights reserved.
//

#import "WSFlexLayoutMaker+Swift.h"
#import "YGLayout+Private.h"

#define WS_MAKER_SET_YOGA_PROPERTY_SWIFT(type, property) \
- (WSFlexLayoutMaker *)property:(type)property { \
self.yoga.property = property; \
return self; \
}

@implementation WSFlexLayoutMaker (Swift)

WS_MAKER_SET_YOGA_PROPERTY_SWIFT(BOOL, isIncludedInLayout);

WS_MAKER_SET_YOGA_PROPERTY_SWIFT(BOOL, isEnabled);

WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGDirection, direction);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGFlexDirection, flexDirection);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGJustify, justifyContent);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGAlign, alignContent);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGAlign, alignItems);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGAlign, alignSelf);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGPositionType, position);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGWrap, flexWrap);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGOverflow, overflow);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGDisplay, display);

WS_MAKER_SET_YOGA_PROPERTY_SWIFT(CGFloat, flex);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(CGFloat, flexGrow);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(CGFloat, flexShrink);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, flexBasis);

WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, left);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, top);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, right);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, bottom);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, start);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, end);

WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, marginLeft);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, marginTop);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, marginRight);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, marginBottom);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, marginStart);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, marginEnd);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, marginHorizontal);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, marginVertical);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, margin);

WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, paddingLeft);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, paddingTop);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, paddingRight);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, paddingBottom);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, paddingStart);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, paddingEnd);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, paddingHorizontal);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, paddingVertical);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, padding);

WS_MAKER_SET_YOGA_PROPERTY_SWIFT(CGFloat, borderLeftWidth);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(CGFloat, borderTopWidth);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(CGFloat, borderRightWidth);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(CGFloat, borderBottomWidth);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(CGFloat, borderStartWidth);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(CGFloat, borderEndWidth);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(CGFloat, borderWidth);

WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, width);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, height);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, minWidth);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, minHeight);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, maxWidth);
WS_MAKER_SET_YOGA_PROPERTY_SWIFT(YGValue, maxHeight);

WS_MAKER_SET_YOGA_PROPERTY_SWIFT(CGFloat, aspectRatio);

- (WSFlexLayoutMaker *)markDirty {
    [self.yoga markDirty];
    return self;
}

- (WSFlexLayoutMaker *)size:(CGSize)size {
    self.yoga.width = YGPointValue(size.width);
    self.yoga.height = YGPointValue(size.height);
    return self;
}

- (WSFlexLayoutMaker *)addChild:(WSFlexLayoutItem *)addChild {
    [self.yoga.item addChild:addChild];
    return addChild.yoga.make;
}


@end
