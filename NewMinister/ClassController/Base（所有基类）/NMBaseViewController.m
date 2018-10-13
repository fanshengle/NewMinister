//
//  NMBaseViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/9/27.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMBaseViewController.h"

@interface NMBaseViewController ()

@property (strong, nonatomic) UIImageView *noDataView;

@end

@implementation NMBaseViewController

#pragma mark -- 设置状态栏风格
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return _StatusBarStyle;
}

#pragma mark -- 动态更新状态栏颜色
-(void)setStatusBarStyle:(UIStatusBarStyle)StatusBarStyle{
    _StatusBarStyle = StatusBarStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}

#pragma mark -- 所有状态栏默认不隐藏
- (BOOL)prefersStatusBarHidden{
    
    return NO;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = NMf4f8fb;
    //默认导航栏样式：黑字
    self.StatusBarStyle = UIStatusBarStyleDefault;
    
    //不需要系统为你设置边缘距离：iOS11以前automaticallyAdjustsScrollViewInsets设置为No，iOS11以上的新特性，这句代码必须设置，
    if (@available(iOS 11.0, *)) {
        
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }else {
        
        //automaticallyAdjustsScrollViewInsets根据按所在界面的status bar，navigationbar，与tabbar的高度，自动调整scrollview的inset,设置为no，不让viewController调整，我们自己修改布局即可~。该属性是针对scrollview及其子类的，例如tableView和collectionView，但是该属性只对控制器视图层级中第一个scrollview及其子类起作用，如果视图层级中存在多个scrollview及其子类，官方建议该属性设置为no，此时应该手动设置它的inseps:当你发现tableview莫名其妙地向下偏移导航栏的高度时，就是这个属性在作怪，将其设置为no即可
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

#pragma mark -- 创建navBarView
- (NMCustomizeNavBarView *)navBarView{
    
    if (!_navBarView) {
        
        NMCustomizeNavBarView *navBarView = [[NMCustomizeNavBarView alloc] initWithFrame:CGRectMake(0, 0, NMScreenWidth, NMNavbarHeight)];
        [self.view addSubview:navBarView];
        _navBarView = navBarView;
    }
    return _navBarView;
}

#pragma mark -- 设置导航栏(只有返回按钮和标题名称)
- (void)setDefaultNavTitle:(NSString *)title{

    self.navBarView.navTitle = title;
    if (self.navBarView.leftBarItem) {

        [self.navBarView.leftBarItem addTarget:self action:@selector(popBeforeController) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark -- 设置导航栏(有返回按钮和标题名称和右边按钮)
- (void)setNavTitle:(NSString *)title rightBarItem:(NSString *)rightItemStr isPicture:(BOOL)isPicture{
    
    [self setDefaultNavTitle:title];
    
    if (isPicture) {//右边按钮为图片
        
        self.navBarView.rightItemImg = rightItemStr;
    }else{
        
        self.navBarView.rightItemTitle = rightItemStr;
        self.navBarView.rightItemFont = NMSystemFont(13);
        self.navBarView.rightItemColor = NM333333;
    }
    
    if (self.navBarView.rightBarItem) {
        
        [self.navBarView.rightBarItem addTarget:self action:@selector(rightBarItemClick) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark -- 返回上一级页面
- (void)popBeforeController{
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- 导航栏右边按钮点击
- (void)rightBarItemClick{
    
    
}


@end
