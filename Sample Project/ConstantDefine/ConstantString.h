//
//  ConstantString.h
//  Sample Project
//
//  Created by _Genesis_ on 6/13/16.
//  Copyright © 2016 Genesis. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
- Define Constant String for whole Project
- Should use this instead of marco #define
 
 */

@interface ConstantString : NSObject

//sample string
extern NSString *const SAMPLE_STRING;
extern NSString *const BASE_URL;

@end
