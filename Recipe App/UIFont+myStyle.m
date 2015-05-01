//
//  UIFont+myStyle.m
//  Recipe App
//
//  Created by Douglas Voss on 4/30/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "UIFont+myStyle.h"

@implementation UIFont (Utils)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"



+ (UIFont *)systemFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:fontName size:size];
}

+ (UIFont *)lightSystemFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:fontName size:size];
}

+ (UIFont *)boldSystemFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:fontName size:size];
}

+ (UIFont *)preferredFontForTextStyle:(NSString *)style
{
    if ([style isEqualToString:UIFontTextStyleBody])
        return [UIFont systemFontOfSize:globalFontSize];
    if ([style isEqualToString:UIFontTextStyleHeadline])
        return [UIFont boldSystemFontOfSize:globalFontSize];
    if ([style isEqualToString:UIFontTextStyleSubheadline])
        return [UIFont systemFontOfSize:globalFontSize];
    if ([style isEqualToString:UIFontTextStyleFootnote])
        return [UIFont systemFontOfSize:globalFontSize];
    if ([style isEqualToString:UIFontTextStyleCaption1])
        return [UIFont systemFontOfSize:globalFontSize];
    if ([style isEqualToString:UIFontTextStyleCaption2])
        return [UIFont systemFontOfSize:globalFontSize];
    return [UIFont systemFontOfSize:globalFontSize];
}

#pragma clang diagnostic pop

@end
