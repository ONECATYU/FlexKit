//
//  YGLayoutMaker+Swift.h
//  FlexKit
//
//  Created by 余汪送 on 2018/6/5.
//  Copyright © 2018年 capsule. All rights reserved.
//

#import "YGLayoutMaker.h"

#define YG_MAKER_PROPERTY_SWIFT(type, property) \
- (YGLayoutMaker *)property:(type)property

NS_ASSUME_NONNULL_BEGIN

@interface YGLayoutMaker (Swift)

YG_MAKER_PROPERTY_SWIFT(BOOL, isIncludedInLayout);

YG_MAKER_PROPERTY_SWIFT(BOOL, isEnabled);

YG_MAKER_PROPERTY_SWIFT(YGDirection, direction);
YG_MAKER_PROPERTY_SWIFT(YGFlexDirection, flexDirection);
YG_MAKER_PROPERTY_SWIFT(YGJustify, justifyContent);
YG_MAKER_PROPERTY_SWIFT(YGAlign, alignContent);
YG_MAKER_PROPERTY_SWIFT(YGAlign, alignItems);
YG_MAKER_PROPERTY_SWIFT(YGAlign, alignSelf);
YG_MAKER_PROPERTY_SWIFT(YGPositionType, position);
YG_MAKER_PROPERTY_SWIFT(YGWrap, flexWrap);
YG_MAKER_PROPERTY_SWIFT(YGOverflow, overflow);
YG_MAKER_PROPERTY_SWIFT(YGDisplay, display);

YG_MAKER_PROPERTY_SWIFT(CGFloat, flexGrow);
YG_MAKER_PROPERTY_SWIFT(CGFloat, flexShrink);
YG_MAKER_PROPERTY_SWIFT(YGValue, flexBasis);

YG_MAKER_PROPERTY_SWIFT(YGValue, left);
YG_MAKER_PROPERTY_SWIFT(YGValue, top);
YG_MAKER_PROPERTY_SWIFT(YGValue, right);
YG_MAKER_PROPERTY_SWIFT(YGValue, bottom);
YG_MAKER_PROPERTY_SWIFT(YGValue, start);
YG_MAKER_PROPERTY_SWIFT(YGValue, end);

YG_MAKER_PROPERTY_SWIFT(YGValue, marginLeft);
YG_MAKER_PROPERTY_SWIFT(YGValue, marginTop);
YG_MAKER_PROPERTY_SWIFT(YGValue, marginRight);
YG_MAKER_PROPERTY_SWIFT(YGValue, marginBottom);
YG_MAKER_PROPERTY_SWIFT(YGValue, marginStart);
YG_MAKER_PROPERTY_SWIFT(YGValue, marginEnd);
YG_MAKER_PROPERTY_SWIFT(YGValue, marginHorizontal);
YG_MAKER_PROPERTY_SWIFT(YGValue, marginVertical);
YG_MAKER_PROPERTY_SWIFT(YGValue, margin);

YG_MAKER_PROPERTY_SWIFT(YGValue, paddingLeft);
YG_MAKER_PROPERTY_SWIFT(YGValue, paddingTop);
YG_MAKER_PROPERTY_SWIFT(YGValue, paddingRight);
YG_MAKER_PROPERTY_SWIFT(YGValue, paddingBottom);
YG_MAKER_PROPERTY_SWIFT(YGValue, paddingStart);
YG_MAKER_PROPERTY_SWIFT(YGValue, paddingEnd);
YG_MAKER_PROPERTY_SWIFT(YGValue, paddingHorizontal);
YG_MAKER_PROPERTY_SWIFT(YGValue, paddingVertical);
YG_MAKER_PROPERTY_SWIFT(YGValue, padding);

YG_MAKER_PROPERTY_SWIFT(CGFloat, borderLeftWidth);
YG_MAKER_PROPERTY_SWIFT(CGFloat, borderTopWidth);
YG_MAKER_PROPERTY_SWIFT(CGFloat, borderRightWidth);
YG_MAKER_PROPERTY_SWIFT(CGFloat, borderBottomWidth);
YG_MAKER_PROPERTY_SWIFT(CGFloat, borderStartWidth);
YG_MAKER_PROPERTY_SWIFT(CGFloat, borderEndWidth);
YG_MAKER_PROPERTY_SWIFT(CGFloat, borderWidth);

YG_MAKER_PROPERTY_SWIFT(YGValue, width);
YG_MAKER_PROPERTY_SWIFT(YGValue, height);
YG_MAKER_PROPERTY_SWIFT(YGValue, minWidth);
YG_MAKER_PROPERTY_SWIFT(YGValue, minHeight);
YG_MAKER_PROPERTY_SWIFT(YGValue, maxWidth);
YG_MAKER_PROPERTY_SWIFT(YGValue, maxHeight);

YG_MAKER_PROPERTY_SWIFT(CGFloat, aspectRatio);

- (YGLayoutMaker *)markDirty;

- (YGLayoutMaker *)addChild:(id<YGLayoutDivProtocol>)child;
- (void)addChildren:(NSArray<id<YGLayoutDivProtocol>> *)children;

- (YGLayoutMaker *)removeChild:(id<YGLayoutDivProtocol>)child;
- (YGLayoutMaker *)removeFromParent;

@end

NS_ASSUME_NONNULL_END
