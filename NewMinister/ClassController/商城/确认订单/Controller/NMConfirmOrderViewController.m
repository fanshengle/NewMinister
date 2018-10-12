//
//  NMConfirmOrderViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMConfirmOrderViewController.h"
#import "NMConfirmOrderHeaderView.h"
#import "NMConfirmOrderAddressCell.h"
#import "NMConfirmOrderGoodsCell.h"
#import "NMConfirmOrderFooterView.h"
#import "NMConfirmOrderBottomView.h"

@interface NMConfirmOrderViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    
    CGFloat _footerViewHeight;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NMConfirmOrderHeaderView *headerView;
@property (nonatomic, strong) NMConfirmOrderFooterView *footerView;
@property (nonatomic, strong) NMConfirmOrderBottomView *bottomView;

@end

@implementation NMConfirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setDefaultNavTitle:@"确认下单"];
    self.navBarView.navBackgroundColor = NMf4f8fb;
    
    [self tableView];
    [self bottomView];
}

#pragma mark =============== 创建视图 =============
#pragma mark -- 创建底部视图
- (NMConfirmOrderHeaderView *)headerView{
    
    if (!_headerView) {
        
        NMConfirmOrderHeaderView *headerView = [[NMConfirmOrderHeaderView alloc] init];
        _headerView = headerView;
    }
    return _headerView;
}

#pragma mark -- 创建tableView
- (UITableView *)tableView{
    
    if (!_tableView) {
        
        CGFloat tableViewY = self.navBarView.height;
        CGFloat tableViewHeight = NMScreenHeight - tableViewY - NMStatusBarHeight;
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableViewY, NMScreenWidth, tableViewHeight) style:UITableViewStyleGrouped];
        tableView.backgroundColor = NMWhiteC;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = NM47;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        
        [tableView registerClass:[NMConfirmOrderAddressCell class] forCellReuseIdentifier:NSStringFromClass([NMConfirmOrderAddressCell class])];
        [tableView registerClass:[NMConfirmOrderGoodsCell class] forCellReuseIdentifier:NSStringFromClass([NMConfirmOrderGoodsCell class])];
        [self.view addSubview:tableView];
        
        _tableView = tableView;
    }
    return _tableView;
}

#pragma mark -- 创建底部视图
- (NMConfirmOrderFooterView *)footerView{
    
    if (!_footerView) {
        
        NMConfirmOrderFooterView *footerView = [[NMConfirmOrderFooterView alloc] init];
        _footerView = footerView;
    }
    return _footerView;
}

#pragma mark -- 创建底部视图
- (NMConfirmOrderBottomView *)bottomView{
    
    if (!_bottomView) {
        
        CGFloat bottomTop = NMScreenHeight - NMTabbarHeight;
        NMConfirmOrderBottomView *bottomView = [[NMConfirmOrderBottomView alloc] initWithFrame:CGRectMake(0, bottomTop, NMScreenWidth, NMTabbarHeight)];
        [self.view addSubview:bottomView];
        _bottomView = bottomView;
    }
    return _bottomView;
}

#pragma mark =============== 协议区 =============
#pragma mark -- UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 6;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }
    return 3;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CGFloat rowHeight = 90;
    if (indexPath.section != 0) {
        rowHeight = NM70;
    }
    return rowHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc] init];
    if (section != 0) {
        headView = self.headerView;
        [self.headerView refresh];
    }
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    CGFloat headHeight = 0.01;
    if (section != 0) {
        headHeight = NM35;
    }
    return headHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *footView = [[UIView alloc] init];
    if (section != 0) {
        footView = self.footerView;
        [self.footerView refresh];

    }
    return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    CGFloat footHeight = NM10;
    if (section != 0) {
        footHeight = _footerViewHeight;
    }
    return footHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (indexPath.section == 0) {//地址视图
        
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NMConfirmOrderAddressCell class]) forIndexPath:indexPath];
    }else{
        
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NMConfirmOrderGoodsCell class]) forIndexPath:indexPath];
    }
    return cell;
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
