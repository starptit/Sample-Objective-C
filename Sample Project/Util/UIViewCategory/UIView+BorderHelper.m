//
//  UIView+BorderHelper.m
//  iMade
//
//  Created by Thanh Nguyen Van on 7/27/14.
//  Copyright (c) 2014 Thanh's Home. All rights reserved.
//

#import "UIView+BorderHelper.h"

@implementation UIView (BorderHelper)

- (CALayer *)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
    return border;
}

- (CALayer *)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
    return border;
}

- (CALayer *)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *borderLeft = [CALayer layer];
    borderLeft.backgroundColor = color.CGColor;
    
    borderLeft.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:borderLeft];
    return borderLeft;
}

- (CALayer *)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
    return border;
}

- (void)setBorderColor:(UIColor *) color andWidth:(CGFloat) width {
    self.layer.borderWidth = 1.f;
    self.layer.borderColor = color.CGColor;
}
@end
