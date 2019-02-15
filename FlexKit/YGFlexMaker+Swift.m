//
//  YGFlexMaker+Swift.m
//  jscallnative
//
//  Created by 余汪送 on 2019/2/15.
//  Copyright © 2019 capsule. All rights reserved.
//

#import "YGFlexMaker+Swift.h"

#define YG_MAKER_PROPERTY_REALIZE_SWIFT(type, property) \
- (YGFlexMaker *)property:(type)property { \
self.flexLayout.property = property; \
return self; \
}

@implementation YGFlexMaker (Swift)

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

- (YGFlexMaker *)size:(CGSize)size {
    self.flexLayout.width = YGPointValue(size.width);
    self.flexLayout.height = YGPointValue(size.height);
    return self;
}

- (YGFlexMaker *)markDirty {
    [self.flexLayout markDirty];
    return self;
}

- (YGFlexMaker *)addChild:(_Nullable id<YGFlexDivProtocol>)child {
    if (!child) child = [[YGFlexDiv alloc]initWithView:nil];
    [self.flexLayout.flexDiv addChild:child.flexDiv];
    return child.flexDiv.yoga.make;
}

- (void)addChildren:(NSArray<id<YGFlexDivProtocol>> *)children {
    for (NSInteger i = 0; i < children.count; i++) {
        [self.flexLayout.flexDiv addChild:children[i].flexDiv];
    }
}

- (YGFlexMaker *)removeChild:(id<YGFlexDivProtocol>)child {
    [self.flexLayout.flexDiv removeChild: child.flexDiv];
    return self;
}

- (YGFlexMaker *)removeFromParent {
    [self.flexLayout.flexDiv removeFromParent];
    return self;
}

@end
