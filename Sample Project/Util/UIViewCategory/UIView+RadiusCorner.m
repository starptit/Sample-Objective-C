//
//  UIView+RadiusCorner.m
//  iMade
//
//  Created by Thanh Nguyen Van on 7/27/14.
//  Copyright (c) 2014 Thanh's Home. All rights reserved.
//

#import "UIView+RadiusCorner.h"

@implementation UIView (RadiusCorner)

- (void) roundCorner:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
}

- (void) circleCorner
{
    self.layer.cornerRadius = self.bounds.size.height / 2;
    self.clipsToBounds = YES;
}

@end
