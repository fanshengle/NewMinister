//
//  NMTabBarController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/9/27.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMBaseTabBarController.h"
#import "NMBaseNavigationController.h"

#import "NMHomePageViewController.h"
#import "NMMallViewController.h"
#import "NMPublishViewController.h"
#import "NMAllianceViewController.h"
#import "NMMineViewController.h"
#import "NMTabBar.h"

#import "NMTabBarItemAnimationManager.h"

@interface NMBaseTabBarController ()

@property(strong, nonatomic) NMTabBar *nmTabBar;
@property(strong, nonatomic) UITabBarItem *tagSelectItem;                               //用来标记上个选中的item
@property(strong, nonatomic) NSMutableArray *chiledViewControllers;
@property(strong, nonatomic) NSMutableArray *tabbarImgViewArr;
@property(strong, nonatomic) NSMutableArray *tabbarTitleLabArr;
@property(strong, nonatomic) NMTabBarItemAnimationManager *itemAnimationManager;         //用来管理item动画实现的类
@end

@implementation NMBaseTabBarController


- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.selectedViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.selectedViewController beginAppearanceTransition: YES animated: animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.selectedViewController beginAppearanceTransition: NO animated: animated];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configuringUIInformation];
    [self setupCustomtabbar];
    [self setupTabBarItemController];
    [self setupTabBarItemController];
    [self fetchTabbarOfSubviews];
}

#pragma mark ================ 设置或配置区

#pragma mark -- 配置tabbar视图的展示属性
- (void)configuringUIInformation{

    //设置背景色为白色
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
    //去掉tabbar默认的分割线
    [[UITabBar appearance] setShadowImage:[self imageWithColor:[UIColor clearColor]]];
}

#pragma mark -- 设置中间的自定义tabbar
- (void)setupCustomtabbar{
    
    self.nmTabBar = [[NMTabBar alloc]init];
    //用来标记选中的item
    self.tagSelectItem = self.nmTabBar.selectedItem;
    //使用kvc，将自定义的tabbar替换掉系统的tabbar
    [self setValue:self.nmTabBar forKeyPath:@"tabBar"];
    
    //在自定义的tabbar顶部加阴影
    [self dropShadowWithOffset:CGSizeMake(0, -3) radius:3 color:NMGrayC opacity:0.3];
}

#pragma mark -- 设置底部标签栏
- (void)setupTabBarItemController{
    
    NMHomePageViewController *homeVC = [[NMHomePageViewController alloc] init];
    NMMallViewController *mallVC = [[NMMallViewController alloc] init];
    NMAllianceViewController *allianceVC = [[NMAllianceViewController alloc] init];
    NMMineViewController *mineVC = [[NMMineViewController alloc] init];

    NSMutableArray *controllerArr = [NSMutableArray arrayWithObjects:homeVC, mallVC, allianceVC, mineVC, nil];
    NSMutableArray *normalImageArr = [NSMutableArray arrayWithArray:@[@"tabItem1Normal", @"tabItem2Normal", @"tabItem4Normal", @"tabItem5Normal"]];
    NSMutableArray *selectedImageArr = [NSMutableArray arrayWithArray:@[@"tabItem1Select", @"tabItem2Select", @"tabItem4Select", @"tabItem5Select"]];
    NSMutableArray *titleArr = [NSMutableArray arrayWithArray:@[@"首页", @"商城", @"品盟", @"我的"]];
    //存放所有的子视图控制器
    NSMutableArray *childVCArr = [NSMutableArray array];
    for (int  i = 0; i < controllerArr.count; i++) {
        
        UIViewController *childVc = controllerArr[i];
        NSString *title = titleArr[i];
        NSString *normalImgStr = normalImageArr[i];
        NSString *selectImgStr = selectedImageArr[i];
        NMBaseNavigationController *baseVC = [self addChildController:childVc title:title imageName:normalImgStr selectedImageName:selectImgStr tabItemTag:i];
        [childVCArr addObject:baseVC];
    }
    self.viewControllers = childVCArr;
}

#pragma mark -- 获取tabbar的子视图，并用数组保存，目的拿到完成动画的视图
- (void)fetchTabbarOfSubviews{
    
    self.tabbarImgViewArr = [NSMutableArray array];
    self.tabbarTitleLabArr = [NSMutableArray array];
    for (UIControl *tabbarButton in self.nmTabBar.subviews) {
        if ([tabbarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            for (UIView *barSubView in tabbarButton.subviews) {
                if ([barSubView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                    [self.tabbarImgViewArr addObject:barSubView];
                }
                if ([barSubView isKindOfClass:[UILabel class]]) {
                    [self.tabbarTitleLabArr addObject:barSubView];
                }
            }
        }
    }
}

#pragma mark -- 将所有模块的viewController添加到tabBarController中
- (NMBaseNavigationController *)addChildController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName tabItemTag:(NSInteger)tag{

    childController.title = title;
    childController.tabBarItem.tag = tag;
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //用来调整标题位置的偏移量。
//    [childController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    // 设置一下选中tabbar文字颜色
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : NM999999}forState:UIControlStateNormal];
    // 设置一下选中tabbar文字颜色
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : NMf10315}forState:UIControlStateSelected];
    NMBaseNavigationController *baseNav = [[NMBaseNavigationController alloc] initWithRootViewController:childController];
    //隐藏导航栏
    baseNav.navigationBarHidden = YES;
    return baseNav;
}

#pragma mark -- 获取当前视图上下文，将tabbar的背景图色设置为白色
- (UIImage *)imageWithColor:(UIColor *)color{
    
// 一个像素
//    CGRect rect = CGRectMake(0, 0, 1, 1);
//    // 开启上下文
//    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
//    [color setFill];
//    UIRectFill(rect);
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark -- tabbar顶部加线条阴影
- (void)dropShadowWithOffset:(CGSize)offset radius:(CGFloat)radius color:(UIColor *)color opacity:(CGFloat)opacity{
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.tabBar.bounds);
    self.nmTabBar.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
    
    self.nmTabBar.layer.shadowColor = [color colorWithAlphaComponent:0.5].CGColor;
    self.nmTabBar.layer.shadowOffset = offset;
    self.nmTabBar.layer.shadowRadius = radius;
    self.nmTabBar.layer.shadowOpacity = opacity;
    self.nmTabBar.clipsToBounds = NO;
}


#pragma mark =================== 协议区
/**
 点击TabBarItem代理
 
 @param tabBar tabBar
 @param item 当前点击Item
 */

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    if (item.tag != self.tagSelectItem.tag) {//点击不同的item
        
        [self.itemAnimationManager playAnimation:[self.tabbarImgViewArr objectAtIndex:item.tag] textLabel:[self.tabbarTitleLabArr objectAtIndex:item.tag]];
        [self.itemAnimationManager deselectAnimation:[self.tabbarImgViewArr objectAtIndex:self.tagSelectItem.tag] textLabel:[self.tabbarTitleLabArr objectAtIndex:self.tagSelectItem.tag]];
        //item为当前选中item，tagSelectItem为上一个item,替换上一个选中item
        self.tagSelectItem = item;
    }else{//点击同一个item
        [self.itemAnimationManager selectedState:[self.tabbarImgViewArr objectAtIndex:item.tag] textLabel:[self.tabbarTitleLabArr objectAtIndex:item.tag]];
    }
}

#pragma mark -- 懒加载，初始化item动画管理类
- (NMTabBarItemAnimationManager *)itemAnimationManager{
    
    if (!_itemAnimationManager) {
        
        _itemAnimationManager = [[NMTabBarItemAnimationManager alloc] init];
    }
    return _itemAnimationManager;
}


#pragma mark ================== 功能区
#pragma mark -- 改变tabbarItem的选中索引
- (void)changeTabbarItemSelectIndex:(NSInteger)index{
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
