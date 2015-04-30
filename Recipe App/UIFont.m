//
//  UIFont.m
//  Recipe App
//
//  Created by Douglas Voss on 4/30/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "UIFont.h"

@implementation UIFont (Utils)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

+ (UIFont *)systemFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"YOUR_TRUETYPE_FONT_NAME_HERE" size:size];
}

+ (UIFont *)lightSystemFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"YOUR_TRUETYPE_FONT_NAME_HERE" size:size];
}

+ (UIFont *)boldSystemFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"YOUR_TRUETYPE_FONT_NAME_HERE" size:size];
}

+ (UIFont *)preferredFontForTextStyle:(NSString *)style
{
    if ([style isEqualToString:UIFontTextStyleBody])
        return [UIFont systemFontOfSize:17];
    if ([style isEqualToString:UIFontTextStyleHeadline])
        return [UIFont boldSystemFontOfSize:17];
    if ([style isEqualToString:UIFontTextStyleSubheadline])
        return [UIFont systemFontOfSize:15];
    if ([style isEqualToString:UIFontTextStyleFootnote])
        return [UIFont systemFontOfSize:13];
    if ([style isEqualToString:UIFontTextStyleCaption1])
        return [UIFont systemFontOfSize:12];
    if ([style isEqualToString:UIFontTextStyleCaption2])
        return [UIFont systemFontOfSize:11];
    return [UIFont systemFontOfSize:17];
}

#pragma clang diagnostic pop

@end
