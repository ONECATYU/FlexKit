//
//  WSFlexLayoutMaker+OC.m
//  FlexDemo
//
//  Created by 余汪送 on 2019/5/30.
//  Copyright © 2019 capsule. All rights reserved.
//

#import "WSFlexLayoutMaker+OC.h"
#import "YGLayout+Private.h"

#define WS_MAKER_SET_YOGA_NORMAL_PROPERTY(type, property) \
WS_MAKER_SET_YOGA_PROPERTY(type, property, self.yoga.property = property)

#define WS_MAKER_SET_YOGA_VALUE_PROPERTY(type, property) \
WS_MAKER_SET_YOGA_PROPERTY(type, property, self.yoga.property = [property toYGValue])

#define WS_MAKER_SET_YOGA_PROPERTY(type, property, ...) \
- (WSFlexLayoutMaker *(^)(type))property { \
return ^(type property) { \
__VA_ARGS__; \
return self; \
}; \
}


@implementation WSFlexLayoutMaker (OC)

WS_MAKER_SET_YOGA_NORMAL_PROPERTY(BOOL, isIncludedInLayout);

WS_MAKER_SET_YOGA_NORMAL_PROPERTY(BOOL, isEnabled);

WS_MAKER_SET_YOGA_NORMAL_PROPERTY(YGDirection, direction);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(YGFlexDirection, flexDirection);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(YGJustify, justifyContent);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(YGAlign, alignContent);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(YGAlign, alignItems);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(YGAlign, alignSelf);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(YGPositionType, position);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(YGWrap, flexWrap);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(YGOverflow, overflow);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(YGDisplay, display);

WS_MAKER_SET_YOGA_NORMAL_PROPERTY(CGFloat, flex);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(CGFloat, flexGrow);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(CGFloat, flexShrink);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, flexBasis);

WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, left);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, top);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, right);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, bottom);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, start);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, end);

WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, marginLeft);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, marginTop);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, marginRight);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, marginBottom);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, marginStart);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, marginEnd);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, marginHorizontal);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, marginVertical);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, margin);

WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, paddingLeft);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, paddingTop);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, paddingRight);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, paddingBottom);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, paddingStart);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, paddingEnd);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, paddingHorizontal);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, paddingVertical);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, padding);

WS_MAKER_SET_YOGA_NORMAL_PROPERTY(CGFloat, borderLeftWidth);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(CGFloat, borderTopWidth);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(CGFloat, borderRightWidth);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(CGFloat, borderBottomWidth);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(CGFloat, borderStartWidth);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(CGFloat, borderEndWidth);
WS_MAKER_SET_YOGA_NORMAL_PROPERTY(CGFloat, borderWidth);

WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, width);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, height);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, minWidth);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, minHeight);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, maxWidth);
WS_MAKER_SET_YOGA_VALUE_PROPERTY(id<YGValueProtocol>, maxHeight);

WS_MAKER_SET_YOGA_NORMAL_PROPERTY(CGFloat, aspectRatio);

- (WSFlexLayoutMaker * _Nonnull (^)(void))markDirty {
    return ^ {
        [self.yoga markDirty];
        return self;
    };
}

WS_MAKER_SET_YOGA_PROPERTY(CGSize, size, {
    self.yoga.width = YGPointValue(size.width);
    self.yoga.height = YGPointValue(size.height);
});

- (WSFlexLayoutMaker *(^)(WSFlexLayoutItem *))addChild {
    return ^(WSFlexLayoutItem *addChild) {
        [self.yoga.item addChild:addChild];
        return addChild.yoga.make;
    };
}

@end




///NSNumber
@implementation NSNumber (YGValue)
- (YGValue)toYGValue {
    return (YGValue) { .value = [self floatValue], .unit = YGUnitPoint };
}
@end

///NSString
@implementation NSString (YGValue)
- (YGValue)toYGValue {
    NSString *value = self;
    if ([value hasSuffix:@"%"]) {
        value = [value substringToIndex:value.length -1];
        return (YGValue) { .value = [value floatValue], .unit = YGUnitPercent };
    }
    return (YGValue) { .value = [value floatValue], .unit = YGUnitPoint };
}
@end
