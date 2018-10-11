//
//  NMCustomizeNavBarView.h
//  NewMinister
//
//  Created by 范声乐 on 2018/9/30.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NMCustomizeNavBarView : UIView

@property (nonatomic,strong) UIColor *navBackgroundColor;//导航视图的背景颜色
@property (nonatomic,strong) UIColor *navTitleColor;//导航标题颜色
@property (nonatomic,strong) UIFont *navTitleFont;//导航标题字体大小

@property (nonatomic,strong) NSString *navTitle;//导航标题
@property (nonatomic,strong) NSString *leftBtnStr;//导航左边按钮需要显示（图片或名称字符）
@property (nonatomic,strong) NSString *rightBtnStr;//导航右边按钮需要显示（图片或名称字符）

@property (nonatomic,strong) UIView *navBarView;
@property (nonatomic,strong) UIButton *leftBarItem;
@property (nonatomic,strong) UIButton *rightBarItem;
@property (nonatomic,strong) UILabel *titleBarLab;

#pragma mark -- 设置默认带有左边按钮和标题的导航栏
- (void)setupNavagationDefaultBar;


@end
