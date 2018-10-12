//
//  NMBaseViewController.h
//  NewMinister
//
//  Created by 范声乐 on 2018/9/27.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMCustomizeNavBarView.h"

@interface NMBaseViewController : UIViewController

/**
 *  修改状态栏颜色
 */
@property (nonatomic, assign) UIStatusBarStyle StatusBarStyle;

@property (nonatomic, strong) NMCustomizeNavBarView *navBarView; //自定义的导航栏

#pragma mark -- 设置默认导航栏(只有返回按钮和标题名称)
- (void)setDefaultNavTitle:(NSString *)title;

/**
 *  isPicture:为Yes，则右边按钮以图片展示，为No，则右边按钮以标题展示
 */
#pragma mark -- 设置导航栏(有返回按钮和标题名称和右边按钮)
- (void)setNavTitle:(NSString *)title rightBarItem:(NSString *)rightItemStr isPicture:(BOOL)isPicture;

#pragma mark -- 返回上一级页面
- (void)popBeforeController;

#pragma mark -- 导航栏右边按钮点击
- (void)rightBarItemClick;
@end
