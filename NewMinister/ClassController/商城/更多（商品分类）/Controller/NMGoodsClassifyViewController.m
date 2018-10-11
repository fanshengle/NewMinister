//
//  NMGoodsClassifyViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/11.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMGoodsClassifyViewController.h"

@interface NMGoodsClassifyViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation NMGoodsClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark -- 创建左边的tableView
- (void)createLeftTableView{
    
    CGFloat tableViewY = _searchView.height;
    CGFloat tableViewWidth = 70.0*BIAOZHUN;
    CGFloat tableViewHeight = SPScreenHeight - SPNavbarHeight - SPTabbarHeight;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableViewY, tableViewWidth, tableViewHeight) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 44.0*BIAOZHUN;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    [_tableView registerClass:[NextMarketLeftTableViewCell class] forCellReuseIdentifier:NSStringFromClass([NextMarketLeftTableViewCell class])];
    [self.view addSubview:_tableView];
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
