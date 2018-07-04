/**
 * Copyright (c) 2014-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "YGLayoutMaker.h"
#import <UIKit/UIKit.h>

@protocol YGLayoutDivProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Yoga) <YGLayoutDivProtocol>

/**
 The YGLayout that is attached to this view. It is lazily created.
 */
@property (nonatomic, readonly, strong) YGLayout *yoga;
/**
 Indicates whether or not Yoga is enabled
 */
@property (nonatomic, readonly, assign) BOOL isYogaEnabled;
/**
 Virtual div to join the layout
 */
@property (nonatomic, readonly, strong) YGLayoutDiv *layoutDiv;

/**
 It's only going to mark the first subView
 */
- (void)markSubViewsDirty;

@end

NS_ASSUME_NONNULL_END
