//
//  UIColor+colorChange.m
//  NewMinister
//
//  Created by 范声乐 on 2018/9/29.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "UIColor+colorChange.h"

@implementation UIColor (colorChange)

+ (UIColor *)colorWithHex:(NSInteger)hex {
    return [UIColor colorWithRed:((float)((hex & 0xff0000) >> 16))/255.0 green:((float)((hex & 0x00ff00) >> 8))/255.0 blue:((float)(hex & 0x0000ff))/255.0 alpha:1.0];
}

+ (UIColor *) colorWithHexString: (NSString *)color{
    NSString *cStr = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if (cStr.length < 6) {
        
        return [UIColor clearColor];
    }else if (cStr.length != 6) {
        
        return [UIColor clearColor];
    }
    
    if ([cStr hasPrefix:@"0X"]) {
        cStr = [cStr substringFromIndex:2];
    }
    if ([cStr hasPrefix:@"#"]) {
        cStr = [cStr substringFromIndex:1];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rStr = [cStr substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gStr = [cStr substringWithRange:range];
    
    range.location = 4;
    NSString *bStr = [cStr substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rStr] scanHexInt:&r];
    [[NSScanner scannerWithString:gStr] scanHexInt:&g];
    [[NSScanner scannerWithString:bStr] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

@end
