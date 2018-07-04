//
//  YGLayoutMaker+OC.h
//  FlexKit
//
//  Created by 余汪送 on 2018/7/3.
//

#import "YGLayoutMaker.h"

#define YG_MAKER_PROPERTY(type, property) \
- (YGLayoutMaker *(^)(type))property NS_SWIFT_UNAVAILABLE("Use the extensions instead")

NS_ASSUME_NONNULL_BEGIN

@interface YGLayoutMaker (OC)

YG_MAKER_PROPERTY(BOOL, isIncludedInLayout);

YG_MAKER_PROPERTY(BOOL, isEnabled);

YG_MAKER_PROPERTY(YGDirection, direction);
YG_MAKER_PROPERTY(YGFlexDirection, flexDirection);
YG_MAKER_PROPERTY(YGJustify, justifyContent);
YG_MAKER_PROPERTY(YGAlign, alignContent);
YG_MAKER_PROPERTY(YGAlign, alignItems);
YG_MAKER_PROPERTY(YGAlign, alignSelf);
YG_MAKER_PROPERTY(YGPositionType, position);
YG_MAKER_PROPERTY(YGWrap, flexWrap);
YG_MAKER_PROPERTY(YGOverflow, overflow);
YG_MAKER_PROPERTY(YGDisplay, display);

YG_MAKER_PROPERTY(CGFloat, flexGrow);
YG_MAKER_PROPERTY(CGFloat, flexShrink);
YG_MAKER_PROPERTY(YGValue, flexBasis);

YG_MAKER_PROPERTY(YGValue, left);
YG_MAKER_PROPERTY(YGValue, top);
YG_MAKER_PROPERTY(YGValue, right);
YG_MAKER_PROPERTY(YGValue, bottom);
YG_MAKER_PROPERTY(YGValue, start);
YG_MAKER_PROPERTY(YGValue, end);

YG_MAKER_PROPERTY(YGValue, marginLeft);
YG_MAKER_PROPERTY(YGValue, marginTop);
YG_MAKER_PROPERTY(YGValue, marginRight);
YG_MAKER_PROPERTY(YGValue, marginBottom);
YG_MAKER_PROPERTY(YGValue, marginStart);
YG_MAKER_PROPERTY(YGValue, marginEnd);
YG_MAKER_PROPERTY(YGValue, marginHorizontal);
YG_MAKER_PROPERTY(YGValue, marginVertical);
YG_MAKER_PROPERTY(YGValue, margin);

YG_MAKER_PROPERTY(YGValue, paddingLeft);
YG_MAKER_PROPERTY(YGValue, paddingTop);
YG_MAKER_PROPERTY(YGValue, paddingRight);
YG_MAKER_PROPERTY(YGValue, paddingBottom);
YG_MAKER_PROPERTY(YGValue, paddingStart);
YG_MAKER_PROPERTY(YGValue, paddingEnd);
YG_MAKER_PROPERTY(YGValue, paddingHorizontal);
YG_MAKER_PROPERTY(YGValue, paddingVertical);
YG_MAKER_PROPERTY(YGValue, padding);

YG_MAKER_PROPERTY(CGFloat, borderLeftWidth);
YG_MAKER_PROPERTY(CGFloat, borderTopWidth);
YG_MAKER_PROPERTY(CGFloat, borderRightWidth);
YG_MAKER_PROPERTY(CGFloat, borderBottomWidth);
YG_MAKER_PROPERTY(CGFloat, borderStartWidth);
YG_MAKER_PROPERTY(CGFloat, borderEndWidth);
YG_MAKER_PROPERTY(CGFloat, borderWidth);

YG_MAKER_PROPERTY(YGValue, width);
YG_MAKER_PROPERTY(YGValue, height);
YG_MAKER_PROPERTY(YGValue, minWidth);
YG_MAKER_PROPERTY(YGValue, minHeight);
YG_MAKER_PROPERTY(YGValue, maxWidth);
YG_MAKER_PROPERTY(YGValue, maxHeight);

YG_MAKER_PROPERTY(CGFloat, aspectRatio);

- (YGLayoutMaker *(^)(CGSize))size
NS_SWIFT_UNAVAILABLE("Use the extensions instead");

- (YGLayoutMaker *(^)(void))markDirty
NS_SWIFT_UNAVAILABLE("Use the extensions instead");

- (YGLayoutMaker *(^)(id<YGLayoutDivProtocol>))addChild
NS_SWIFT_UNAVAILABLE("Use the extensions instead");
- (void(^)(NSArray<id<YGLayoutDivProtocol>> *))addChildren
NS_SWIFT_UNAVAILABLE("Use the extensions instead");

- (YGLayoutMaker *(^)(id<YGLayoutDivProtocol>))removeChild
NS_SWIFT_UNAVAILABLE("Use the extensions instead");
- (YGLayoutMaker *(^)(void))removeFromParent
NS_SWIFT_UNAVAILABLE("Use the extensions instead");

@end

NS_ASSUME_NONNULL_END
