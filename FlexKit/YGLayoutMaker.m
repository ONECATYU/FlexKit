//
//  YGLayoutMaker.m
//  FlexLayoutTest
//
//  Created by 余汪送 on 2018/6/1.
//  Copyright © 2018年 capsule. All rights reserved.
//

#import "YGLayoutMaker.h"
#import "YGLayout+Private.h"
#import "UIView+Yoga.h"

@implementation YGLayout (YGLayoutMaker)

- (YGLayoutMaker *)make {
    return [[YGLayoutMaker alloc]initWithLayout:self];
}

@end



@implementation YGLayoutDiv (YGLayoutMaker)

- (YGLayoutMaker *)make {
    return self.yoga.make;
}

- (void)makeLayout:(YGMakeLayoutBlock)block {
    YGLayoutMaker *maker = self.yoga.make;
    if (block) block(maker);
}

@end


@implementation UIView (YGLayoutMaker)

- (void)makeLayout:(YGMakeLayoutBlock)block {
    [self.layoutDiv makeLayout: block];
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



