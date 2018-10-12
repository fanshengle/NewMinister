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

@property (nonatomic,assign) BOOL isHaveLeftItem;//是否有左边按钮 默认yes
@property (nonatomic,assign) BOOL isHaveRightItem;//是否有右边按钮 默认no

#pragma mark -- 设置默认带有标题是否有左右按钮的导航栏
/**
 ishaveLeft:是否有
 */
- (void)setupNavagationBar;

@end
