//
//  NMShopCartViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMShopCartViewController.h"
#import "NMShopCartSectionHeaderView.h"
#import "NMShopCartTableViewCell.h"
#import "NMShopCartBottomView.h"

#import "NMGoodsDetailsViewController.h"
#import "NMPayResultsViewController.h"
@interface NMShopCartViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NMShopCartBottomView *bottomView;
@end

@implementation NMShopCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavTitle:@"购物车" rightBarItem:@"编辑" isPicture:NO];
    self.navBarView.rightItemColor = NMf10215;;

    [self tableView];
    [self bottomView];
}

#pragma mark -- 创建tableView
- (UITableView *)tableView{
    
    if (!_tableView) {
        
        CGFloat tableViewY = self.navBarView.height;
        CGFloat tableViewHeight = NMScreenHeight - tableViewY - NMBottomBarHeight;
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableViewY, NMScreenWidth, tableViewHeight) style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        
        [tableView registerClass:[NMShopCartSectionHeaderView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([NMShopCartSectionHeaderView class])];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([NMShopCartTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([NMShopCartTableViewCell class])];
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

#pragma mark -- 创建bottomView
- (NMShopCartBottomView *)bottomView{
    
    if (!_bottomView) {
        
        CGFloat bottomViewY = NMScreenHeight - NMBottomBarHeight;
        NMShopCartBottomView *bottomView = [[NMShopCartBottomView alloc] initWithFrame:CGRectMake(0, bottomViewY, NMScreenWidth, NMBottomBarHeight)];
        [self.view addSubview:bottomView];
        bottomView.backgroundColor = NMWhiteC;
        _bottomView = bottomView;
        
        NMWeakSelf(self)
        _bottomView.GoSettleClickBlock = ^{
            
            NMPayResultsViewController *vc = [[NMPayResultsViewController alloc] init];
            [weakself.navigationController pushViewController:vc animated:YES];
        };
        
        [_bottomView refresh];
    }
    return _bottomView;
}

#pragma mark =============== 协议区 =============
#pragma mark -- UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    CGFloat rowCount = 4;
    
    return rowCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  NM122;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NMShopCartSectionHeaderView *headerView = [[NMShopCartSectionHeaderView alloc] initWithReuseIdentifier:NSStringFromClass([NMShopCartSectionHeaderView class])];
    if (section == 0) {
        [headerView refreshIsHave:NO];
    }else{
        
        [headerView refreshIsHave:YES];
    }
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    CGFloat sectionHeight = 0;
    if (section == 0) {
        
        sectionHeight = NM44;
    }else{
        
        sectionHeight = NM44*2;
    }
    return sectionHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return NM10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NMShopCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NMShopCartTableViewCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.row == 2) {
        
    }else{
        
        
    }
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
