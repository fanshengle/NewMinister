//
//  NMBaseNavigationController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/9/27.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMBaseNavigationController.h"
#import "NMHomePageViewController.h"
#import "NMMallViewController.h"
#import "NMAllianceViewController.h"
#import "NMMineViewController.h"

@interface NMBaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation NMBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //默认开启系统右划返回
    self.interactivePopGestureRecognizer.enabled = YES;
    self.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark -- 整个项目为默认黑色，个别控制器为白色。
#pragma mark ==================代理区=================
//重写方法[pushViewController: animated:]
//可拦截NavigationController子控制器中所有的push操作，
//因此在其中设置一句隐藏代码，其他界面就都不用设置了。
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    //隐藏tabbar，一级界面上不隐藏，其他界面都隐藏)
    //一定要在push之前隐藏，否则无效，
    //所以，如果在调用 [super pushViewController: animated:] 后再写判断隐藏是无效的
    if ([viewController isKindOfClass:[NMHomePageViewController class]] || [viewController isKindOfClass:[NMMallViewController class]] || [viewController isKindOfClass:[NMAllianceViewController class]] || [viewController isKindOfClass:[NMMineViewController class]]) {
        viewController.hidesBottomBarWhenPushed = NO;
        
    }else{
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    //先调用父类push
    [super pushViewController:viewController animated:animated];
    //隐藏导航栏，
    //[viewController.navigationController setNavigationBarHidden:YES];
}

#pragma mark -- UIGestureRecognizerDelegate
//根视图禁用右划返回
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    NMLog(@"childViewControllers:%ld",self.childViewControllers.count);
    return self.childViewControllers.count == 1 ? NO : YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
