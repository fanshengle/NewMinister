//
//  NMTabBarItemAnimationManger.h
//  NewMinister
//
//  Created by 范声乐 on 2018/9/28.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NMTabBarItemAnimationManager : NSObject


@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, strong) UIColor *textSelectedColor;
@property (nonatomic, strong) UIColor *iconSelectedColor;
@property (nonatomic, strong) UIColor *defaultTextColor;

/**
 当前点击barItem动画
 
 @param barIcon 图标
 @param barTitle title
 */
- (void)playAnimation:(UIImageView *)barIcon textLabel:(UILabel *)barTitle;

/**
 当前移除选中状态barItem动画
 
 @param barIcon 图标
 @param barTitle title
 */
- (void)deselectAnimation:(UIImageView *)barIcon textLabel:(UILabel *)barTitle;

/**
 当前为选中状态barItem动画
 
 @param barIcon 图标
 @param barTitle title
 */
- (void)selectedState:(UIImageView *)barIcon textLabel:(UILabel *)barTitle;

@end
