//
//  NMOrderDetailsViewController.m
//  NewMinister
//
//  Created by Andy on 2018/10/13.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMOrderDetailsViewController.h"
#import "NMOrderDetailsTableViewCell.h"
#import "NMMineOrderTableViewCell.h"
#import "NMMineOrderTabViewHeadView.h"
#import "NMOrderDetailsView.h"
#import "NMOrderDetailsStateView.h"
#import "NMOrderDetailsAddressView.h"


@interface NMOrderDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIView *headView;

@end

@implementation NMOrderDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDefaultNavTitle:@"订单详情"];
    self.navBarView.navBackgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
    [self.view  addSubview:self.tableView];
    [self butView];
}
-(void)butView{
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tableView.frame), NMScreenWidth, 49)];
    bgview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgview];
    
    
    
    UIView *xview = [[UIView alloc] init];
    xview.frame = CGRectMake(0,0,NMScreenWidth,1);
    xview.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    [bgview addSubview:xview];
    
    
    UIButton * rigBut=[UIButton buttonWithType:UIButtonTypeSystem];
    [rigBut setTitle:@"取消订单" forState:UIControlStateNormal];
    rigBut.frame = CGRectMake(NMScreenWidth-91-15,6,91,35);
    rigBut.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    [rigBut setTintColor: [UIColor colorWithRed:241/255.0 green:2/255.0 blue:21/255.0 alpha:1]];
    rigBut.layer.cornerRadius = 5;//边框圆角大小
    rigBut.layer.masksToBounds = YES;
    rigBut.layer.borderColor = [UIColor colorWithRed:241/255.0 green:2/255.0 blue:21/255.0 alpha:1].CGColor;//边框颜色
    rigBut.layer.borderWidth = 1;//边框宽度
    [bgview addSubview:rigBut];
    
    UIButton * lefBut=[UIButton buttonWithType:UIButtonTypeSystem];
    [lefBut setTitle:@"立即购买" forState:UIControlStateNormal];
    lefBut.frame = CGRectMake(NMScreenWidth-91-91-25,6,91,35);
    lefBut.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    [lefBut setTintColor:   [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]];
    lefBut.layer.cornerRadius = 5;//边框圆角大小
    lefBut.layer.masksToBounds = YES;
    lefBut.layer.borderColor =  [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1].CGColor;//边框颜色
    lefBut.layer.borderWidth = 1;//边框宽度
    [bgview addSubview:lefBut];


}
#pragma mark -- 创建tableView
- (UITableView *)tableView{
    if (!_tableView) {
        
        UIView * headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 191)];
        headView.backgroundColor=[UIColor whiteColor];
        
        NMOrderDetailsStateView * detailsStateView =[[NMOrderDetailsStateView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 95) imageView:[UIImage imageNamed:@""] stateString:@"等待买家付款" timeString:@"剩21小时28分自动关闭"];
        [headView addSubview:detailsStateView];
        
        NMOrderDetailsAddressView *detailsAddressView=[[NMOrderDetailsAddressView alloc]initWithFrame:CGRectMake(0, 96, NMScreenWidth, 96) namelabel:@"张学友" phonelabel:@"18692620111" addresslabel:@"湖南省长沙市芙蓉区五里牌街道芙蓉区，长岛路天府华天北栋XX号"];
        [headView addSubview:detailsAddressView];

        

        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NMNavbarHeight, NMScreenWidth, NMScreenHeight-NMNavbarHeight-49) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 110;
        _tableView.tableHeaderView=headView;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _tableView;
}

//返回每一行的cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
//返回分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
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
    return 186+128;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NMMineOrderTabViewHeadView * view=[[NMMineOrderTabViewHeadView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 52)];
    return view;
    
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    NMOrderDetailsView * view=[[NMOrderDetailsView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 186+128)];
    return view;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identify = @"NMOrderDetailsTableViewCell";
    NMMineOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[NMMineOrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    return  cell;
}

@end
