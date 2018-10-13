//
//  NMPayWayViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/13.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMPayWayViewController.h"
#import "NMPayWayTableViewCell.h"
#import "NMPayWayModel.h"

@interface NMPayWayViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NMPayWayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setDefaultNavTitle:@"选择支付方式"];
}

#pragma mark -- 创建tableView
- (UITableView *)tableView{
    
    if (!_tableView) {
        
        CGFloat tableViewY = self.navBarView.height;
        CGFloat tableViewHeight = NMScreenHeight - tableViewY - NMBottomBarHeight;
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableViewY, NMScreenWidth, tableViewHeight) style:UITableViewStyleGrouped];
        tableView.scrollEnabled = NO;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        
        [tableView registerClass:[NMPayWayTableViewCell class] forCellReuseIdentifier:NSStringFromClass([NMPayWayTableViewCell class])];
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

#pragma mark =============== 协议区 =============
#pragma mark -- UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NMPayWayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NMPayWayTableViewCell class]) forIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 0) {
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
