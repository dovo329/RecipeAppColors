//
//  UIFont.h
//  Recipe App
//
//  Created by Douglas Voss on 4/30/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

@interface UIFont : NSObject

+ (UIFont *)systemFontOfSize:(CGFloat)size;

+ (UIFont *)lightSystemFontOfSize:(CGFloat)size;

+ (UIFont *)boldSystemFontOfSize:(CGFloat)size;

+ (UIFont *)preferredFontForTextStyle:(NSString *)style;

@end
