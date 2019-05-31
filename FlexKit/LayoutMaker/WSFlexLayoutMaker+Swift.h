//
//  WSFlexLayoutMaker+Swift.h
//  FlexDemo
//
//  Created by 余汪送 on 2019/5/30.
//  Copyright © 2019 capsule. All rights reserved.
//

#import "WSFlexLayoutMaker.h"

NS_ASSUME_NONNULL_BEGIN

#define WS_MAKER_SWIFT_FUNC(type, name) \
- (WSFlexLayoutMaker *)name:(type)name

@interface WSFlexLayoutMaker (Swift)

WS_MAKER_SWIFT_FUNC(BOOL, isIncludedInLayout);

WS_MAKER_SWIFT_FUNC(BOOL, isEnabled);

WS_MAKER_SWIFT_FUNC(YGDirection, direction);
WS_MAKER_SWIFT_FUNC(YGFlexDirection, flexDirection);
WS_MAKER_SWIFT_FUNC(YGJustify, justifyContent);
WS_MAKER_SWIFT_FUNC(YGAlign, alignContent);
WS_MAKER_SWIFT_FUNC(YGAlign, alignItems);
WS_MAKER_SWIFT_FUNC(YGAlign, alignSelf);
WS_MAKER_SWIFT_FUNC(YGPositionType, position);
WS_MAKER_SWIFT_FUNC(YGWrap, flexWrap);
WS_MAKER_SWIFT_FUNC(YGOverflow, overflow);
WS_MAKER_SWIFT_FUNC(YGDisplay, display);

WS_MAKER_SWIFT_FUNC(CGFloat, flex);
WS_MAKER_SWIFT_FUNC(CGFloat, flexGrow);
WS_MAKER_SWIFT_FUNC(CGFloat, flexShrink);
WS_MAKER_SWIFT_FUNC(YGValue, flexBasis);

WS_MAKER_SWIFT_FUNC(YGValue, left);
WS_MAKER_SWIFT_FUNC(YGValue, top);
WS_MAKER_SWIFT_FUNC(YGValue, right);
WS_MAKER_SWIFT_FUNC(YGValue, bottom);
WS_MAKER_SWIFT_FUNC(YGValue, start);
WS_MAKER_SWIFT_FUNC(YGValue, end);

WS_MAKER_SWIFT_FUNC(YGValue, marginLeft);
WS_MAKER_SWIFT_FUNC(YGValue, marginTop);
WS_MAKER_SWIFT_FUNC(YGValue, marginRight);
WS_MAKER_SWIFT_FUNC(YGValue, marginBottom);
WS_MAKER_SWIFT_FUNC(YGValue, marginStart);
WS_MAKER_SWIFT_FUNC(YGValue, marginEnd);
WS_MAKER_SWIFT_FUNC(YGValue, marginHorizontal);
WS_MAKER_SWIFT_FUNC(YGValue, marginVertical);
WS_MAKER_SWIFT_FUNC(YGValue, margin);

WS_MAKER_SWIFT_FUNC(YGValue, paddingLeft);
WS_MAKER_SWIFT_FUNC(YGValue, paddingTop);
WS_MAKER_SWIFT_FUNC(YGValue, paddingRight);
WS_MAKER_SWIFT_FUNC(YGValue, paddingBottom);
WS_MAKER_SWIFT_FUNC(YGValue, paddingStart);
WS_MAKER_SWIFT_FUNC(YGValue, paddingEnd);
WS_MAKER_SWIFT_FUNC(YGValue, paddingHorizontal);
WS_MAKER_SWIFT_FUNC(YGValue, paddingVertical);
WS_MAKER_SWIFT_FUNC(YGValue, padding);

WS_MAKER_SWIFT_FUNC(CGFloat, borderLeftWidth);
WS_MAKER_SWIFT_FUNC(CGFloat, borderTopWidth);
WS_MAKER_SWIFT_FUNC(CGFloat, borderRightWidth);
WS_MAKER_SWIFT_FUNC(CGFloat, borderBottomWidth);
WS_MAKER_SWIFT_FUNC(CGFloat, borderStartWidth);
WS_MAKER_SWIFT_FUNC(CGFloat, borderEndWidth);
WS_MAKER_SWIFT_FUNC(CGFloat, borderWidth);

WS_MAKER_SWIFT_FUNC(YGValue, width);
WS_MAKER_SWIFT_FUNC(YGValue, height);
WS_MAKER_SWIFT_FUNC(YGValue, minWidth);
WS_MAKER_SWIFT_FUNC(YGValue, minHeight);
WS_MAKER_SWIFT_FUNC(YGValue, maxWidth);
WS_MAKER_SWIFT_FUNC(YGValue, maxHeight);

WS_MAKER_SWIFT_FUNC(CGFloat, aspectRatio);

- (WSFlexLayoutMaker *)markDirty;

WS_MAKER_SWIFT_FUNC(CGSize, size);

WS_MAKER_SWIFT_FUNC(WSFlexLayoutItem *, addChild);

@end

NS_ASSUME_NONNULL_END
