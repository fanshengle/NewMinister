//
//  NMMallViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/9/28.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMallViewController.h"

#import "NMFirstSearchViewController.h"
#import "NMMallRecommendViewController.h"
#import "NMMallOtherViewController.h"

#import "NMMessageViewController.h"

@interface NMMallViewController ()<UITextFieldDelegate,UIScrollViewDelegate,SPPageMenuDelegate>
{
    
    CGFloat _topViewHeight;
    CGFloat _menuViewHeight;
    CGFloat _scrollViewHeight;
}

@property (nonatomic, strong) NMTopOperationBarView *topSearchView;                      //顶部搜索视图

@property (nonatomic, strong) SPPageMenu *pageMenuControllView;                         //分页控制菜单视图
@property (nonatomic, strong) UIScrollView *pageMenuScrollView;                         //分页联动菜单的滚动区域

@property (nonatomic, strong) NSArray *pageMenuTitleArr;                                //分页控制菜单标题数组
@property (nonatomic, strong) NSMutableArray *childControllersArr;                     //分页控制器数组

@end

@implementation NMMallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupAllViewHeight];
    
    [self topSearchView];
    [self pageMenuControllView];
    [self setupPageMenuController];
}

#pragma mark ====================视图UI搭建区=====================
#pragma mark -- 设置各视图的高度
- (void)setupAllViewHeight{
    
    _topViewHeight = 56.;
    _menuViewHeight = 32.;
    _scrollViewHeight = NMScreenHeight - _topViewHeight - _menuViewHeight - NMTabbarHeight;
}

#pragma mark -- 创建顶部搜索视图
- (NMTopOperationBarView *)topSearchView{
    if (!_topSearchView) {

        NMTopOperationBarView *topSearchView = [[NMTopOperationBarView alloc] initTopSearchViewWithFrame:CGRectMake(0, 0, NMScreenWidth, _topViewHeight) rightTitle:nil rightImgStr:@"mail_Msg"];
        [topSearchView.rightBtn addTarget:self action:@selector(lookMsgAction:) forControlEvents:UIControlEventTouchUpInside];
        topSearchView.searchTextField.delegate = self;
        [self.view addSubview:topSearchView];
        _topSearchView = topSearchView;
    }
    return _topSearchView;
}

#pragma mark -- 创建分页横向滚动菜单视图（下划线风格）
- (SPPageMenu *)pageMenuControllView{
    
    if (!_pageMenuControllView) {
        
        self.pageMenuTitleArr = @[@"推荐",@"影视中心",@"交通",@"电视剧",@"搞笑",@"综艺",@"更多"];
        
        //trackerStyle:跟踪器的样式
        SPPageMenu *pageMenuControllView = [SPPageMenu pageMenuWithFrame:CGRectMake(0, self.topSearchView.height, NMScreenWidth, _menuViewHeight) trackerStyle:SPPageMenuTrackerStyleLine];
        //隐藏分割线
        pageMenuControllView.dividingLine.hidden = YES;
        //配置样式
        pageMenuControllView.itemTitleFont = NMSystemFont(14);
        pageMenuControllView.unSelectedItemTitleFont = NMSystemFont(14);
        pageMenuControllView.selectedItemTitleFont = NMSystemFont(15);
        pageMenuControllView.unSelectedItemTitleColor = NM999999;
        pageMenuControllView.selectedItemTitleColor = NM333333;
        
        //传递数组，默认选中第0个
        [pageMenuControllView setItems:self.pageMenuTitleArr selectedItemIndex:0];
        
        // 设置代理
        pageMenuControllView.delegate = self;
        
        // 给pageMenuControllView传递外界的大scrollView，内部监听self.scrollView的滚动，从而实现让跟踪器跟随self.scrollView移动的效果
        pageMenuControllView.bridgeScrollView = self.pageMenuScrollView;
        [self.view addSubview:pageMenuControllView];
        _pageMenuControllView = pageMenuControllView;
    }
    return _pageMenuControllView;
}

#pragma mark -- 设置滚动区域范围
- (UIScrollView *)pageMenuScrollView {
    
    if (!_pageMenuScrollView) {
        
        //当前商品列表区域,给pageMenuControllView传递外界的大pageMenuScrollView，内部监听self._pageMenuScrollView的滚动，从而实现让跟踪器跟随self._pageMenuScrollView移动的效果
        
        UIScrollView *pageMenuScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, NM88, NMScreenWidth, _scrollViewHeight)];
        pageMenuScrollView.delegate = self;
        pageMenuScrollView.pagingEnabled = YES;
        pageMenuScrollView.showsHorizontalScrollIndicator = NO;
        pageMenuScrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:pageMenuScrollView];
        _pageMenuScrollView = pageMenuScrollView;
    }
    return  _pageMenuScrollView;
}


#pragma mark -- 设置分页菜单对应的分页控制器
- (void)setupPageMenuController{

    self.childControllersArr = [NSMutableArray array];
    NMBaseViewController *baseVC = [[NMBaseViewController alloc] init];
    NMMallRecommendViewController *recommendVC = [[NMMallRecommendViewController alloc] init];
    NMMallOtherViewController *otherVC = [[NMMallOtherViewController alloc] init];
    
    for (int i = 0; i < self.pageMenuTitleArr.count; i++) {
        
        if (i == 0) {//推荐下对应的vc
            
            baseVC = recommendVC;
        }else{
            
            baseVC = otherVC;
        }
        //给当前控制器添加子视图控制器
        [self addChildViewController:baseVC];
        // 控制器本来自带childViewControllers,但是遗憾的是该数组的元素顺序永远无法改变，只要是addChildViewController,都是添加到最后一个，而控制器不像数组那样，可以插入或删除任意位置，所以这里自己定义可变数组，以便插入(删除)(如果没有插入(删除)功能，直接用自带的childViewControllers即可)
        [self.childControllersArr addObject:baseVC];
    }
    
    // .selectedItemIndex就是选中的item下标,将分页控制器的view视图添加到pageMenuScrollView上
    if (self.pageMenuControllView.selectedItemIndex < self.childControllersArr.count) {//默认选中为推荐
        
        NMBaseViewController *vc = self.childControllersArr[self.pageMenuControllView.selectedItemIndex];
        [self.pageMenuScrollView addSubview:vc.view];
        vc.view.frame = CGRectMake(NMScreenWidth*self.pageMenuControllView.selectedItemIndex, 0.0, NMScreenWidth, _scrollViewHeight);
        self.pageMenuScrollView.contentOffset = CGPointMake(NMScreenWidth*self.pageMenuControllView.selectedItemIndex, 0);
        self.pageMenuScrollView.contentSize = CGSizeMake(self.pageMenuTitleArr.count*NMScreenWidth, 0);
    }
}

#pragma mark ====================代理方法区=====================
#pragma Mark -- SPPageMenuDelegate的代理方法
- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    NMLog(@"%zd------->%zd",fromIndex,toIndex);
    
    // 如果该代理方法是由拖拽self.scrollView而触发，说明self.scrollView已经在用户手指的拖拽下而发生偏移，此时不需要再用代码去设置偏移量，否则在跟踪模式为SPPageMenuTrackerFollowingModeHalf的情况下，滑到屏幕一半时会有闪跳现象。闪跳是因为外界设置的scrollView偏移和用户拖拽产生冲突
    if (!self.pageMenuScrollView.isDragging) { // 判断用户是否在拖拽scrollView
        // 如果fromIndex与toIndex之差大于等于2,说明跨界面移动了,此时不动画.
        if (labs(toIndex - fromIndex) >= 2) {
            [self.pageMenuScrollView setContentOffset:CGPointMake(NMScreenWidth * toIndex, 0) animated:NO];
        } else {
            [self.pageMenuScrollView setContentOffset:CGPointMake(NMScreenWidth * toIndex, 0) animated:YES];
        }
    }
    
    if (self.childControllersArr.count <= toIndex) {return;}
    
    UIViewController *targetViewController = self.childControllersArr[toIndex];
    // 如果已经加载过，就不再加载
    if ([targetViewController isViewLoaded]) return;
    
    targetViewController.view.frame = CGRectMake(NMScreenWidth * toIndex, 0, NMScreenWidth, _scrollViewHeight);
    [self.pageMenuScrollView addSubview:targetViewController.view];
}

#pragma mark ====================按钮点击执行区=====================
#pragma mark -- 查看消息按钮
- (void)lookMsgAction:(UIButton *)msgBtn{
    
    NMMessageViewController *msgVC = [[NMMessageViewController alloc] init];
    [self.navigationController pushViewController:msgVC animated:YES];
}

#pragma mark -- UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    //点击输入框push到一级搜索页面
    NMFirstSearchViewController *vc = [[NMFirstSearchViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
