//
//  NMPayWayViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/13.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMPayWayViewController.h"

#import "NMAddBankCartViewController.h"
#import "NMPayWayTableViewCell.h"
#import "NMPayWayModel.h"


@interface NMPayWayViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *payWayBtn;

@property (nonatomic, strong) NSMutableArray *payListArr;

@end

@implementation NMPayWayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setDefaultNavTitle:@"选择支付方式"];
    
    NMPayWayModel *model = [[NMPayWayModel alloc] init];
    self.payListArr = [model enumToGetModelListArr];
    
    [self tableView];
    [self setupBottomBarView];
}

#pragma mark -- 创建tableView
- (UITableView *)tableView{
    
    if (!_tableView) {
        
        CGFloat tableViewY = self.navBarView.height;
        CGFloat tableViewHeight = NMScreenHeight - tableViewY - NMBottomBarHeight;
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableViewY, NMScreenWidth, tableViewHeight) style:UITableViewStylePlain];
        tableView.backgroundColor = NMf4f8fb;
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

#pragma mark -- 设置底部确定视图
- (void)setupBottomBarView{
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.backgroundColor = NMFF5349;
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:NMWhiteC forState:UIControlStateNormal];
    [sureBtn.titleLabel setFont:NMSystemFont(14)];
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.equalTo(@(NMBottomBarHeight));
    }];
}
#pragma mark =============== 协议区 =============
#pragma mark -- UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.payListArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  NM50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NMPayWayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NMPayWayTableViewCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    if (self.payListArr.count > indexPath.row) {
        
        NMPayWayModel *model = self.payListArr[indexPath.row];
        cell.model = model;
        
        //block按钮回调
        NMWeakSelf(self)
        cell.payWayBlock = ^(UIButton *btn) {
            
            btn.selected = !btn.selected;
            weakself.payWayBtn = btn;
            
            if (indexPath.row == 2) {
                
                NMAddBankCartViewController *vc = [[NMAddBankCartViewController alloc] init];
                [weakself.navigationController pushViewController:vc animated:YES];
            }else{
                
            }
        };
    }
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



@end
