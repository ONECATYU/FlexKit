//
//  WSFlexLayoutMaker.m
//  FlexDemo
//
//  Created by 余汪送 on 2019/5/29.
//  Copyright © 2019 capsule. All rights reserved.
//

#import "WSFlexLayoutMaker.h"
#import "YGLayout+Private.h"

@implementation YGLayout (WSFlexLayoutMaker)

- (WSFlexLayoutMaker *)make {
    return [[WSFlexLayoutMaker alloc]initWithYoga:self];
}

@end

@implementation WSFlexLayoutMaker

- (instancetype)initWithYoga:(YGLayout *)yoga {
    if (self = [super init]) {
        _yoga = yoga;
    }
    return self;
}

- (WSFlexLayoutItem *)addChild:(nullable WSFlexLayoutItem *)child withMakeLayout:(WSFlexLayoutMakerBlock)block {
    if (!child) {
        child = [[WSFlexLayoutDiv alloc]init];
    }
    if (block) {
        block(child.yoga.make);
    }
    [self.yoga.item addChild:child];
    return child;
}

- (WSFlexLayoutItem *)addChildWithMakeLayout:(WSFlexLayoutMakerBlock)block {
    return [self addChild:nil withMakeLayout:block];
}

@end


@implementation UIView (WSFlexLayoutMaker)
- (void)makeFlexLayout:(WSFlexLayoutMakerBlock)block {
    if (block) {
        block(self.yoga.make);
    }
}
@end

@implementation CALayer (WSFlexLayoutMaker)
- (void)makeFlexLayout:(WSFlexLayoutMakerBlock)block {
    if (block) {
        block(self.yoga.make);
    }
}
@end
