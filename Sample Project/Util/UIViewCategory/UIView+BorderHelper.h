//
//  UIView+BorderHelper.h
//  iMade
//
//  Created by Thanh Nguyen Van on 7/27/14.
//  Copyright (c) 2014 Thanh's Home. All rights reserved.
//


@interface UIView (BorderHelper)

- (CALayer *)addBottomBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (CALayer *)addLeftBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (CALayer *)addRightBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (CALayer *)addTopBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (void)setBorderColor:(UIColor *) color andWidth:(CGFloat) width;
@end
