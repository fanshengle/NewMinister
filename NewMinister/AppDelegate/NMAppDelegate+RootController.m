//
//  NMAppDelegate+RootController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/9/27.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMAppDelegate+RootController.h"

#import "NMBaseNavigationController.h"
#import "NMBaseTabBarController.h"

@implementation NMAppDelegate (RootController)

#pragma mark -- 设置跟视图控制器
- (void)setUpRootViewController{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    NMBaseTabBarController *baseTabV = [[NMBaseTabBarController alloc] init];
    self.window.rootViewController = baseTabV;
}

@end
