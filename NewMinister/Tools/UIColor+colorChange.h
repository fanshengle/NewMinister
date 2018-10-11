//
//  UIColor+colorChange.h
//  NewMinister
//
//  Created by 范声乐 on 2018/9/29.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (colorChange)

//设置十六进制颜色
/**
 十六进制颜色转换
 color:16进制整型，RGB值
 */
+ (UIColor *)colorWithHex:(NSInteger)hex;

/**
 十六进制颜色转换
 color:16进制字符串，RGB值
 */
+ (UIColor *)colorWithHexString: (NSString *)color;


@end
