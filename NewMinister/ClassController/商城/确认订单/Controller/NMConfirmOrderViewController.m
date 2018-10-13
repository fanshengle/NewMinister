//
//  NMConfirmOrderViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMConfirmOrderViewController.h"
#import "NMPayWayViewController.h"

#import "NMConfirmOrderTableView.h"
#import "NMConfirmOrderBottomView.h"


@interface NMConfirmOrderViewController ()
@property (nonatomic, strong) NMConfirmOrderTableView *tableView;
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

#pragma mark -- 创建tableView
- (UITableView *)tableView{
    
    if (!_tableView) {
        
        CGFloat tableViewY = self.navBarView.height;
        CGFloat tableViewHeight = NMScreenHeight - tableViewY - NMBottomBarHeight;
        NMConfirmOrderTableView *tableView = [[NMConfirmOrderTableView alloc] initWithFrame:CGRectMake(0, tableViewY, NMScreenWidth, tableViewHeight) style:UITableViewStyleGrouped ddd:@""];
        tableView.backgroundColor = NMf4f8fb;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

#pragma mark -- 创建底部视图
- (NMConfirmOrderBottomView *)bottomView{
    
    if (!_bottomView) {
        
        CGFloat bottomTop = NMScreenHeight - NMTabbarHeight;
        NMConfirmOrderBottomView *bottomView = [[NMConfirmOrderBottomView alloc] initWithFrame:CGRectMake(0, bottomTop, NMScreenWidth, NMBottomBarHeight)];
        [self.view addSubview:bottomView];
        _bottomView = bottomView;
        NMWeakSelf(self);
        _bottomView.BuyNowClickBlock = ^(NSInteger price) {
          
            NMPayWayViewController *vc = [[NMPayWayViewController alloc] init];
            [weakself.navigationController pushViewController:vc animated:YES];
        };
    }
    return _bottomView;
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
