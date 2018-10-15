//
//  UIButton+Extension.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

#pragma mark -- 文字在左，图片在右,space设置两者间距
- (void)setLeftTextAndRightPictureWithSpace:(CGFloat)space;

#pragma mark -- 图片在左，文字在右,space设置两者间距
- (void)setLeftPictureAndRightTextWithSpace:(CGFloat)space;

#pragma mark -- 文字在上，图片在下,space设置两者间距
- (void)setTopTextAndBottomPictureWithSpace:(CGFloat)space;

#pragma mark -- 图片在上，文字在下,space设置两者间距
- (void)setTopPictureAndBottomTextWithSpace:(CGFloat)space;

@end
