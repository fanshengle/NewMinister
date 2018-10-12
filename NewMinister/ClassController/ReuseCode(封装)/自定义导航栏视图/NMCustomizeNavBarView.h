//
//  NMCustomizeNavBarView.h
//  NewMinister
//
//  Created by 范声乐 on 2018/9/30.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NMCustomizeNavBarView : UIView

//标题栏设置
@property (nonatomic,strong) UIColor *navBackgroundColor;//导航视图的背景颜色
@property (nonatomic,strong) UIColor *navTitleColor;//导航标题颜色
@property (nonatomic,strong) UIFont *navTitleFont;//导航标题字体大小
@property (nonatomic,strong) NSString *navTitle;//导航标题

//左边按钮的属性设置
@property (nonatomic,strong) NSString *leftItemTitle;//导航左边按钮需要显示（名称字符）
@property (nonatomic,strong) NSString *leftItemImg;//导航左边按钮需要显示（图片字符）
@property (nonatomic,strong) UIColor *leftItemColor;//左边按钮标题颜色
@property (nonatomic,strong) UIFont *leftItemFont;//左边按钮标题字体大小
@property (nonatomic,assign) CGFloat leftItemWidth;//左边按钮宽度


//右边按钮的属性设置
@property (nonatomic,strong) NSString *rightItemTitle;//导航右边按钮需要显示（名称字符）
@property (nonatomic,strong) NSString *rightItemImg;//导航右边按钮需要显示（图片字符）
@property (nonatomic,strong) UIColor *rightItemColor;//右边按钮标题颜色
@property (nonatomic,strong) UIFont *rightItemFont;//又边按钮标题字体大小
@property (nonatomic,assign) CGFloat rightItemWidth;//右边按钮宽度

//控件
@property (nonatomic,strong) UIView *navBarView;
@property (nonatomic,strong) UIButton *leftBarItem;
@property (nonatomic,strong) UIButton *rightBarItem;
@property (nonatomic,strong) UILabel *titleBarLab;


#pragma mark -- 设置默认带有标题是否有左右按钮的导航栏

@end
