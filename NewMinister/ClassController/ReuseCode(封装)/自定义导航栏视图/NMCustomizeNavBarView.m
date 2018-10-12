//
//  NMCustomizeNavBarView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/9/30.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMCustomizeNavBarView.h"

@implementation NMCustomizeNavBarView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        //必须先走这一步
        [self navBarView];

        self.navBackgroundColor = NMWhiteC;
        self.navTitle = @"";
        self.navTitleFont = NMSystemFont(14);
        self.navTitleColor = NM333333;
        
        self.leftItemWidth = NM40;
        self.leftItemImg = @"navBar_back";
        self.leftItemFont = NMSystemFont(13);
        self.leftItemColor = NM333333;
        
        self.rightItemWidth = NM50;
    }
    return self;
}

#pragma mark -- 标题栏设置
- (void)setNavBackgroundColor:(UIColor *)navBackgroundColor{
    
    _navBackgroundColor = navBackgroundColor;
    self.backgroundColor = _navBackgroundColor;
}

- (void)setNavTitleColor:(UIColor *)navTitleColor{
    _navTitleColor = navTitleColor;
    self.titleBarLab.textColor = _navTitleColor;
}

- (void)setNavTitleFont:(UIFont *)navTitleFont{
    _navTitleFont = navTitleFont;
    self.titleBarLab.font = _navTitleFont;
}

- (void)setNavTitle:(NSString *)navTitle{
    _navTitle = navTitle;
    self.titleBarLab.text = _navTitle;
}

#pragma mark -- 左边按钮设置
- (void)setLeftItemImg:(NSString *)leftItemImg{
    
    _leftItemImg = leftItemImg;
    [self.leftBarItem setImage:[UIImage imageNamed:_leftItemImg] forState:UIControlStateNormal];
}

- (void)setLeftItemTitle:(NSString *)leftItemTitle{
    
    _leftItemTitle = leftItemTitle;
    [self.leftBarItem setTitle:_leftItemTitle forState:UIControlStateNormal];
}

- (void)setLeftItemFont:(UIFont *)leftItemFont{
    
    _leftItemFont = leftItemFont;
    [self.leftBarItem.titleLabel setFont:_leftItemFont];
}

- (void)setLeftItemColor:(UIColor *)leftItemColor{
    
    _leftItemColor = leftItemColor;
    [self.leftBarItem setTitleColor:_leftItemColor forState:UIControlStateNormal];
}

#pragma mark -- 右边按钮设置
- (void)setRightItemImg:(NSString *)rightItemImg{
    
    _rightItemImg = rightItemImg;
    [self.rightBarItem setImage:[UIImage imageNamed:_rightItemImg] forState:UIControlStateNormal];
}

- (void)setRightItemTitle:(NSString *)rightItemTitle{
    
    _rightItemTitle = rightItemTitle;
    [self.rightBarItem setTitle:_rightItemTitle forState:UIControlStateNormal];
}

- (void)setRightItemFont:(UIFont *)rightItemFont{
    
    _rightItemFont = rightItemFont;
    [self.rightBarItem.titleLabel setFont:_rightItemFont];
}

- (void)setRightItemColor:(UIColor *)rightItemColor{
    
    _rightItemColor = rightItemColor;
    [self.rightBarItem setTitleColor:_rightItemColor forState:UIControlStateNormal];
}

#pragma mark -------创建视图区
#pragma mark -- 设置默认带有左边按钮和标题的导航栏
- (UIView *)navBarView{
    if (!_navBarView) {
        
        UIView *navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, NMStatusBarHeight,  NMScreenWidth, NMNavbarHeight - NMStatusBarHeight)];
        [self addSubview:navBarView];
        _navBarView = navBarView;
    }
    return _navBarView;
}

#pragma mark -- 创建导航栏左边按钮
- (UIButton *)leftBarItem{
    
    if (!_leftBarItem) {
        
        //左边返回按钮
        UIButton *leftBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBarItem.adjustsImageWhenHighlighted = NO;
        [_navBarView addSubview:leftBarItem];
        _leftBarItem = leftBarItem;
        [leftBarItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self.navBarView);
            make.width.equalTo(@(self.leftItemWidth));
        }];
    }
    return _leftBarItem;
}

#pragma mark -- 创建导航栏标题lab
- (UILabel *)titleBarLab{
    
    if (!_titleBarLab) {
        
        //标题
        UILabel *titleBarLab = [[UILabel alloc] init];
        titleBarLab.textAlignment = NSTextAlignmentCenter;
        titleBarLab.text = self.navTitle;
        titleBarLab.textColor = self.navTitleColor;
        titleBarLab.font = self.navTitleFont;
        [_navBarView addSubview:titleBarLab];
        _titleBarLab = titleBarLab;
        [titleBarLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(self.leftItemWidth);
            make.centerY.equalTo(self.navBarView.mas_centerY);
            make.right.equalTo(self.mas_right).offset(-self.rightItemWidth);
        }];
    }
    return _titleBarLab;
}

#pragma mark -- 创建导航栏右边按钮
- (UIButton *)rightBarItem{
    
    if (!_rightBarItem) {
        
        //右边返回按钮
        UIButton *rightBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBarItem.adjustsImageWhenHighlighted = NO;
        [_navBarView addSubview:rightBarItem];
        _rightBarItem = rightBarItem;
        [rightBarItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(self.navBarView);
            make.width.equalTo(@(self.rightItemWidth));
        }];
    }
    return _rightBarItem;
}


@end
