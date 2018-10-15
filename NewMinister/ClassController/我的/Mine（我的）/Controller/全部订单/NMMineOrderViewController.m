//
//  NMMineOrderViewController.m
//  NewMinister
//
//  Created by Andy on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMineOrderViewController.h"
#import "NMPersonalMinePageTitleView.h"
#import "NMContentTableView.h"
#import "NMMineOrderTabViewHeadView.h"
#import "NMMineOrderTabViewFooterView.h"
#import "NMMineOrderTableViewCell.h"
#import "NMOrderDetailsViewController.h"



@interface NMMineOrderViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>



@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, weak) NMPersonalMinePageTitleView *titleView;


@property (nonatomic, strong) UITableView * allTableView;//全部订单
@property (nonatomic, strong) UITableView * payTableView;//a待付款
@property (nonatomic, strong) UITableView * deliverybleView;//待发货
@property (nonatomic, strong) UITableView * sendOutTableView;//已发货
@property (nonatomic, strong) UITableView * evaluationTableView;//待评价


@end

@implementation NMMineOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDefaultNavTitle:@"我的订单"];
    [self setupHeaderView];
    [self setupContentView];
    self.navBarView.navBackgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
}

- (void)setupHeaderView {
    
    NMPersonalMinePageTitleView *titleView = [[NMPersonalMinePageTitleView alloc] init];
    titleView.frame=CGRectMake(0, NMNavbarHeight, self.view.frame.size.width, 42);
    titleView.backgroundColor= [UIColor whiteColor];
    self.titleView= titleView;
    __weak typeof(self) weakSelf = self;
    titleView.titles= @[@"全部", @"待付款", @"待发货", @"已发货", @"待评价"];
    [self.view addSubview:titleView];
    titleView.selectedIndex= _titleViewIndex;
    titleView.buttonSelected= ^(NSInteger index){
        [weakSelf.scrollView setContentOffset:CGPointMake(NMScreenWidth * index, 0) animated:YES];
    };

}
// 主要内容
- (void)setupContentView {
    
    UIScrollView *scrollView= [[UIScrollView alloc] init];
    scrollView.frame=CGRectMake(0, CGRectGetMaxY(self.titleView.frame), NMScreenWidth, NMScreenHeight-self.titleView.size.height);
    scrollView.backgroundColor=[UIColor whiteColor];
    scrollView.delaysContentTouches= NO;
    self.scrollView= scrollView;
    scrollView.pagingEnabled= YES;
    scrollView.showsVerticalScrollIndicator= NO;
    scrollView.showsHorizontalScrollIndicator= NO;
    scrollView.delegate= self;
    scrollView.contentSize= CGSizeMake(NMScreenWidth * 5, 0);
    [self.view addSubview:_scrollView];
    
    _allTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, -35, NMScreenWidth, NMScreenHeight-_titleView.frame.size.height-NMNavbarHeight+35) style:UITableViewStyleGrouped];
    _allTableView.backgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
    _allTableView.dataSource = self;
    _allTableView.delegate=self;
    _allTableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    _allTableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 60)];
    _allTableView.showsVerticalScrollIndicator = NO;
    _allTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [scrollView addSubview:_allTableView];
    
    _payTableView =[[UITableView alloc]initWithFrame:CGRectMake(NMScreenWidth, -35, NMScreenWidth, NMScreenHeight-_titleView.frame.size.height-NMNavbarHeight+35) style:UITableViewStyleGrouped];
    _payTableView.backgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
    _payTableView.dataSource = self;
    _payTableView.delegate=self;
    _payTableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    _payTableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 60)];
    _payTableView.showsVerticalScrollIndicator = NO;
    _payTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [scrollView addSubview:_payTableView];


    _deliverybleView =[[UITableView alloc]initWithFrame:CGRectMake(NMScreenWidth*2, -35, NMScreenWidth, NMScreenHeight-_titleView.frame.size.height-NMNavbarHeight+35) style:UITableViewStyleGrouped];
    _deliverybleView.backgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
    _deliverybleView.dataSource = self;
    _deliverybleView.delegate=self;
    _deliverybleView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    _deliverybleView.tableFooterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 60)];
    _deliverybleView.showsVerticalScrollIndicator = NO;
    _deliverybleView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [scrollView addSubview:_deliverybleView];

    
    _sendOutTableView =[[UITableView alloc]initWithFrame:CGRectMake(NMScreenWidth*3, -35, NMScreenWidth, NMScreenHeight-_titleView.frame.size.height-NMNavbarHeight+35) style:UITableViewStyleGrouped];
    _sendOutTableView.backgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
    _sendOutTableView.dataSource = self;
    _sendOutTableView.delegate=self;
    _sendOutTableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    _sendOutTableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 60)];
    _sendOutTableView.showsVerticalScrollIndicator = NO;
    _sendOutTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [scrollView addSubview:_sendOutTableView];

    
    _evaluationTableView =[[UITableView alloc]initWithFrame:CGRectMake(NMScreenWidth*4, -35, NMScreenWidth, NMScreenHeight-_titleView.frame.size.height-NMNavbarHeight+35) style:UITableViewStyleGrouped];
    _evaluationTableView.backgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
    _evaluationTableView.dataSource = self;
    _evaluationTableView.delegate=self;
    _evaluationTableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    _evaluationTableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 60)];
    _evaluationTableView.showsVerticalScrollIndicator = NO;
    _evaluationTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [scrollView addSubview:_evaluationTableView];

}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        CGFloat contentOffsetX= scrollView.contentOffset.x;
        NSInteger pageNum= contentOffsetX / NMScreenWidth + 0.5;
        self.titleView.selectedIndex = pageNum;
    }
}

- (void)dealloc {
    NSLog(@"控制器已销毁");
}

//返回每一行的cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
//返回分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
//区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 52;
}
//区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 67;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NMMineOrderTabViewHeadView * view=[[NMMineOrderTabViewHeadView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 52)];
    return view;
    
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    NMMineOrderTabViewFooterView * view=[[NMMineOrderTabViewFooterView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 67)];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NMOrderDetailsViewController * mineOrderVC =[[NMOrderDetailsViewController alloc]init];
    [self.navigationController pushViewController:mineOrderVC animated:YES];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identify = @"NMMineOrderTableViewCell";
    NMMineOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[NMMineOrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    return  cell;
}

@end
