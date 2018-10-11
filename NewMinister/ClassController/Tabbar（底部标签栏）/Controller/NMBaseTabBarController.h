//
//  NMTabBarController.h
//  NewMinister
//
//  Created by 范声乐 on 2018/9/27.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMBaseTabBarController : UITabBarController


/**
 通过self.selectIndex改变tabbar当前controller时调用
 类似 self.selectIndex = index 功能
 @param index 想要选择某个controller
 */
- (void)changeTabbarItemSelectIndex:(NSInteger)index;


@end
