//
//  ColorHex.h
//  NewMinister
//
//  Created by 范声乐 on 2018/9/28.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#ifndef ColorHex_h
#define ColorHex_h

//系统颜色
#define NMWhiteC           [UIColor whiteColor]
#define NMClearC           [UIColor clearColor]
#define NMBlackC           [UIColor blackColor]
#define NMGrayC            [UIColor grayColor]
#define NMLighteGrayC      [UIColor lightGrayColor]
#define NMBlueC            [UIColor blueColor]
#define NMRedC             [UIColor redColor]

//随机色生成
#define NMRandomColor      KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)
//16进制RGB转颜色
#define NMColorHex(RGB)    [UIColor colorWithHex:RGB]

/**
 配置商城首页的字体颜色
 */
#define NMf4f8fb [UIColor colorWithHexString:@"f4f8fb"]

#define NMf10315 [UIColor colorWithHexString:@"f10315"]
#define NM999999 [UIColor colorWithHexString:@"999999"]
#define NMf1f1f1 [UIColor colorWithHexString:@"f1f1f1"]
#define NM333333 [UIColor colorWithHexString:@"333333"]
#define NMadadad [UIColor colorWithHexString:@"adadad"]
#define NMf5f5f5 [UIColor colorWithHexString:@"f5f5f5"]
#define NMfa6a45 [UIColor colorWithHexString:@"fa6a45"]
#define NMf10215 [UIColor colorWithHexString:@"f10215"]
#define NM666666 [UIColor colorWithHexString:@"666666"]

#endif /* ColorHex_h */
