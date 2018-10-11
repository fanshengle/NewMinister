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

@property (nonatomic, strong) NMCustomizeNavBarView *navBarView;

#pragma mark -- 设置默认导航栏
- (void)setDefaultNavTitle:(NSString *)title;

#pragma mark -- 返回上一级页面
- (void)popBeforeController;

@end
