//
//  WSFlexLayoutMaker+OC.h
//  FlexDemo
//
//  Created by 余汪送 on 2019/5/30.
//  Copyright © 2019 capsule. All rights reserved.
//

#import "WSFlexLayoutMaker.h"

#define WS_MAKER_OC_FUNC(type, name) \
- (WSFlexLayoutMaker *(^)(type))name \
NS_SWIFT_UNAVAILABLE("Use the swift extensions instead")

@protocol YGValueProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface WSFlexLayoutMaker (OC)

WS_MAKER_OC_FUNC(BOOL, isIncludedInLayout);

WS_MAKER_OC_FUNC(BOOL, isEnabled);

WS_MAKER_OC_FUNC(YGDirection, direction);
WS_MAKER_OC_FUNC(YGFlexDirection, flexDirection);
WS_MAKER_OC_FUNC(YGJustify, justifyContent);
WS_MAKER_OC_FUNC(YGAlign, alignContent);
WS_MAKER_OC_FUNC(YGAlign, alignItems);
WS_MAKER_OC_FUNC(YGAlign, alignSelf);
WS_MAKER_OC_FUNC(YGPositionType, position);
WS_MAKER_OC_FUNC(YGWrap, flexWrap);
WS_MAKER_OC_FUNC(YGOverflow, overflow);
WS_MAKER_OC_FUNC(YGDisplay, display);

WS_MAKER_OC_FUNC(CGFloat, flex);
WS_MAKER_OC_FUNC(CGFloat, flexGrow);
WS_MAKER_OC_FUNC(CGFloat, flexShrink);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, flexBasis);

WS_MAKER_OC_FUNC(id<YGValueProtocol>, left);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, top);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, right);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, bottom);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, start);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, end);

WS_MAKER_OC_FUNC(id<YGValueProtocol>, marginLeft);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, marginTop);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, marginRight);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, marginBottom);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, marginStart);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, marginEnd);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, marginHorizontal);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, marginVertical);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, margin);

WS_MAKER_OC_FUNC(id<YGValueProtocol>, paddingLeft);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, paddingTop);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, paddingRight);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, paddingBottom);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, paddingStart);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, paddingEnd);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, paddingHorizontal);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, paddingVertical);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, padding);

WS_MAKER_OC_FUNC(CGFloat, borderLeftWidth);
WS_MAKER_OC_FUNC(CGFloat, borderTopWidth);
WS_MAKER_OC_FUNC(CGFloat, borderRightWidth);
WS_MAKER_OC_FUNC(CGFloat, borderBottomWidth);
WS_MAKER_OC_FUNC(CGFloat, borderStartWidth);
WS_MAKER_OC_FUNC(CGFloat, borderEndWidth);
WS_MAKER_OC_FUNC(CGFloat, borderWidth);

WS_MAKER_OC_FUNC(id<YGValueProtocol>, width);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, height);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, minWidth);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, minHeight);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, maxWidth);
WS_MAKER_OC_FUNC(id<YGValueProtocol>, maxHeight);

WS_MAKER_OC_FUNC(CGFloat, aspectRatio);

WS_MAKER_OC_FUNC(void, markDirty);

WS_MAKER_OC_FUNC(CGSize, size);

WS_MAKER_OC_FUNC(WSFlexLayoutItem *, addChild);

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN
@protocol YGValueProtocol <NSObject>
- (YGValue)toYGValue;
@end

///NSNumber
@interface NSNumber (YGValue) <YGValueProtocol>
- (YGValue)toYGValue;
@end

///NSString
@interface NSString (YGValue) <YGValueProtocol>
- (YGValue)toYGValue;
@end
NS_ASSUME_NONNULL_END
