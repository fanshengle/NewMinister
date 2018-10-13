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



@interface NMMineOrderViewController ()<UIScrollViewDelegate>



@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, weak) NMPersonalMinePageTitleView *titleView;

@property (nonatomic, weak) NMContentTableView *allTableView;//全部订单

@property (nonatomic, weak) NMContentTableView *payTableView;//a待付款

@property (nonatomic, weak) NMContentTableView *deliverybleView;//待发货

@property (nonatomic, weak) NMContentTableView *sendOutTableView;//已发货

@property (nonatomic, weak) NMContentTableView *evaluationTableView;//待评价

@end

@implementation NMMineOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDefaultNavTitle:@"我的订单"];
    [self setupHeaderView];
    [self setupContentView];
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
    
    
    
    NMContentTableView *allTableView = [[NMContentTableView alloc] init];
    allTableView.backgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
    allTableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    self.allTableView= allTableView;
    [scrollView addSubview:allTableView];
    
    NMContentTableView *payTableView = [[NMContentTableView alloc] init];
    payTableView.frame=CGRectMake(NMScreenWidth, 0, NMScreenWidth, NMScreenHeight-_titleView.frame.size.height-NMNavbarHeight);
    payTableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    self.allTableView= payTableView;
    payTableView.backgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
    [scrollView addSubview:payTableView];

    NMContentTableView *deliverybleView = [[NMContentTableView alloc] init];
    deliverybleView.frame=CGRectMake(NMScreenWidth*2, 0, NMScreenWidth, NMScreenHeight-_titleView.frame.size.height-NMNavbarHeight);
    deliverybleView.separatorStyle= UITableViewCellSeparatorStyleNone;
    deliverybleView.backgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
    self.allTableView= allTableView;
    [scrollView addSubview:deliverybleView];

    NMContentTableView *sendOutTableView = [[NMContentTableView alloc] init];
    sendOutTableView.frame=CGRectMake(NMScreenWidth*3, 0, NMScreenWidth, NMScreenHeight-_titleView.frame.size.height-NMNavbarHeight);
    sendOutTableView.backgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
    sendOutTableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    self.allTableView= sendOutTableView;
    [scrollView addSubview:sendOutTableView];

    NMContentTableView *evaluationTableView = [[NMContentTableView alloc] init];
    evaluationTableView.frame=CGRectMake(NMScreenWidth*4, 0, NMScreenWidth, NMScreenHeight-_titleView.frame.size.height-NMNavbarHeight);
    evaluationTableView.backgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
    evaluationTableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    self.allTableView= evaluationTableView;
    [scrollView addSubview:evaluationTableView];

}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        CGFloat contentOffsetX       = scrollView.contentOffset.x;
        NSInteger pageNum            = contentOffsetX / NMScreenWidth + 0.5;
        self.titleView.selectedIndex = pageNum;
    }
}

- (void)dealloc {
    NSLog(@"控制器已销毁");
}


@end
