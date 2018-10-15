//
//  UIView+Extension.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/8.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

#pragma mark -- 在视图顶部画线
- (void)drawTopLineWithColor:(UIColor *)color{
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.equalTo(@(1.0));
    }];
}

#pragma mark -- 在视图左边画线
- (void)drawLeftLineWithColor:(UIColor *)color{
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.equalTo(@(1.0));
    }];
}

#pragma mark -- 在视图中间画线
- (void)drawMiddleLineWithColor:(UIColor *)color{
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(@(1.0));
    }];
}

#pragma mark -- 在视图右边画线
- (void)drawRightLineWithColor:(UIColor *)color{
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self);
        make.width.equalTo(@(1.0));
    }];
}
#pragma mark -- 在视图底部画线
- (void)drawBottomLineWithColor:(UIColor *)color{
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(@(1.0));
    }];
}

#pragma mark -- 设置圆角
- (void)setCornerRadius:(CGFloat)radius{
    
    [self.layer setCornerRadius:radius];
    [self.layer setMasksToBounds:YES];
}

#pragma mark -- 设置边框加圆角
- (void)setBorderWidth:(CGFloat)borderWidth BorderColor:(UIColor *)borderColor CornerRadius:(CGFloat)radius{
    
    [self.layer setBorderColor:borderColor.CGColor];
    [self.layer setBorderWidth:borderWidth];
    [self.layer setCornerRadius:radius];
    [self.layer setMasksToBounds:YES];
}


#pragma mark -- 设置带圆角的视图加阴影
- (void)setShadowColor:(UIColor *)color Radius:(CGFloat)shadowRadius Offset:(CGSize)shadowOffset Opacity:(CGFloat)shadowOpacity CornerRadius:(CGFloat)radius{
    
    self.layer.shadowColor = [color colorWithAlphaComponent:0.1].CGColor;
    self.layer.shadowRadius = shadowRadius;
    self.layer.shadowOffset = shadowOffset;
    self.layer.shadowOpacity = shadowOpacity;
    self.layer.cornerRadius = radius;

}
@end
