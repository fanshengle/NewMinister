//
//  LayoutAapter.h
//  NewMinister
//
//  Created by 范声乐 on 2018/9/28.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#ifndef LayoutAapter_h
#define LayoutAapter_h


//获取系统对象
#define NMApplication            [UIApplication sharedApplication]
#define NMAppWindow              [UIApplication sharedApplication].delegate.window
#define NMShareAppDelegate       [AppDelegate shareAppDelegate]
#define NMRootViewController     [UIApplication sharedApplication].delegate.window.rootViewController
#define NMUserDefaults           [NSUserDefaults standardUserDefaults]
#define NMNotificationCenter     [NSNotificationCenter defaultCenter]

//取得屏幕的宽、高
#define NMScreenWidth            [UIScreen mainScreen].bounds.size.width
#define NMScreenHeight           [UIScreen mainScreen].bounds.size.height
#define NMScreenBounds           [UIScreen mainScreen].bounds

//适配的比例
#define Iphone6ScaleWidth        NMScreenWidth/375.0
//根据ip6的屏幕来拉伸(适配)
#define NMRealValue(with)        ((with)*(NMScreenWidth/375.0f))

//获取各个
#define NMStatusBarHeight        [[UIApplication sharedApplication] statusBarFrame].size.height                         //状态栏高度
#define NMNavbarHeight           ([[UIApplication sharedApplication] statusBarFrame].size.height>20?84:64)              //导航栏和标签栏的总高度
#define NMTabbarHeight           ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)              //底部Tabbar高度

#define NMBottomBarHeight         49.0//底部按钮视图高度

//#define NMTopBarHeight           (NMStatusBarHeight + NMNavBarHeight)                                                   //导航栏和标签栏的总高度


#define NM2  2.
#define NM3  3.
#define NM4  4.
#define NM5  5.
#define NM8  8.
#define NM10 10.
#define NM15 15.
#define NM20 20.
#define NM25 25.
#define NM30 30.
#define NM35 35.
#define NM40 40.

#define NM44 44.
#define NM47 47.
#define NM50 50.
#define NM55 55.
#define NM60 60.
#define NM70 70.
#define NM88 88.

#define NM110 110.
#define NM180 180.

#define SPCornerRadius 5.0f                                         //通用半径


#endif /* LayoutAapter_h */
