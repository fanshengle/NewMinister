//
//  NMCustomizeNavBarView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/9/30.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMCustomizeNavBarView.h"

//默认按钮的宽度
static const CGFloat barItemWidth = 40.0;
static const CGFloat barRightItemWidth = 40.0;

@implementation NMCustomizeNavBarView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.navBackgroundColor = NMWhiteC;
        self.navTitle = @"";
        self.navTitleFont = NMSystemFont(14);
        self.navTitleColor = NM333333;
        self.leftBtnStr = @"navBar_back";
        
        self.isHaveLeftItem = YES;
        self.isHaveRightItem = NO;
        self.backgroundColor = _navBackgroundColor;
    }
    return self;
}

#pragma mark -- 设置默认带有左边按钮和标题的导航栏
- (void)setupNavagationBar{
    
    UIView *navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, NMStatusBarHeight,  NMScreenWidth, NMNavbarHeight - NMStatusBarHeight)];
    [self addSubview:navBarView];
    _navBarView = navBarView;
    
    if (_isHaveLeftItem) {
        
        //左边返回按钮
        UIButton *leftBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBarItem.adjustsImageWhenHighlighted = NO;
        [leftBarItem setImage:[UIImage imageNamed:self.leftBtnStr] forState:UIControlStateNormal];
        [_navBarView addSubview:leftBarItem];
        _leftBarItem = leftBarItem;
        [leftBarItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self.navBarView);
            make.width.equalTo(@(barItemWidth));
        }];
    }
    
    if (_isHaveRightItem) {
        
        //右边返回按钮
        UIButton *rightBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBarItem.adjustsImageWhenHighlighted = NO;
        [rightBarItem setImage:[UIImage imageNamed:self.leftBtnStr] forState:UIControlStateNormal];
        [_navBarView addSubview:rightBarItem];
        _rightBarItem = rightBarItem;
        [rightBarItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(self.navBarView);
            make.width.equalTo(@(barRightItemWidth));
        }];
    }
    
    //标题
    UILabel *titleBarLab = [[UILabel alloc] init];
    titleBarLab.textAlignment = NSTextAlignmentCenter;
    titleBarLab.text = self.navTitle;
    titleBarLab.textColor = self.navTitleColor;
    titleBarLab.font = self.navTitleFont;
    [_navBarView addSubview:titleBarLab];
    _titleBarLab = titleBarLab;
    [titleBarLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_right).offset(barItemWidth);
        make.centerY.equalTo(self.navBarView.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-barRightItemWidth);
    }];
}

@end
