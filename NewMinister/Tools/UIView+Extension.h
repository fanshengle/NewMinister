//
//  UIView+Extension.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/8.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

#pragma mark -- 在视图顶部画线
- (void)drawTopLineWithColor:(UIColor *)color;

#pragma mark -- 在视图中间画线
- (void)drawMiddleLineWithColor:(UIColor *)color;

#pragma mark -- 在视图底部画线
- (void)drawBottomLineWithColor:(UIColor *)color;

#pragma mark -- 设置圆角
- (void)setCornerRadius:(CGFloat)radius;

#pragma mark -- 设置边框加圆角
- (void)setBorderWidth:(CGFloat)borderWidth BorderColor:(UIColor *)borderColor CornerRadius:(CGFloat)radius;

#pragma mark -- 设置带圆角的视图加阴影
- (void)setShadowColor:(UIColor *)color Radius:(CGFloat)shadowRadius Offset:(CGSize)shadowOffset Opacity:(CGFloat)shadowOpacity CornerRadius:(CGFloat)radius;

#pragma mark -- 设 置按钮的文字在上，图片在下


@end
