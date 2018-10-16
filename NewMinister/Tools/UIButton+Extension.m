//
//  UIButton+Extension.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

#pragma mark -- 文字在左，图片在右,space设置两者间距
- (void)setLeftTextAndRightPictureWithSpace:(CGFloat)space{
    
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//水平居中显示
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.frame.size.width - space, 0, self.imageView.frame.size.width);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, self.titleLabel.frame.size.width + space, 0, -self.titleLabel.frame.size.width);
}

#pragma mark -- 图片在左，文字在右,space设置两者间距
- (void)setLeftPictureAndRightTextWithSpace:(CGFloat)space{
    
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//水平居中显示
    self.titleEdgeInsets = UIEdgeInsetsMake(0, space, 0, 0);
    self.imageEdgeInsets = UIEdgeInsetsMake(0,-space, 0, 0);
}

#pragma mark -- 文字在上，图片在下,space设置两者间距
- (void)setTopTextAndBottomPictureWithSpace:(CGFloat)space{
    
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直居中显示
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.frame.size.width, self.imageView.frame.size.height + space,0.0);
    self.imageEdgeInsets = UIEdgeInsetsMake(self.titleLabel.frame.size.height + space, 0.0,0.0, -self.titleLabel.frame.size.width);
}

#pragma mark -- 图片在上，文字在下,space设置两者间距
- (void)setTopPictureAndBottomTextWithSpace:(CGFloat)space{
    
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直居中显示
    self.titleEdgeInsets = UIEdgeInsetsMake(self.imageView.frame.size.height + space, -self.imageView.frame.size.width, 0.0,0.0);
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0,self.titleLabel.frame.size.height + space, -self.titleLabel.frame.size.width);
}

@end
