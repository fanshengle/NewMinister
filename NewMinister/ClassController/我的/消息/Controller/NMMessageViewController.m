//
//  NMMessageViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/10.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMessageViewController.h"
#import "NMMessageTableViewCell.h"
#import "NMMessageModel.h"

@interface NMMessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *sectionListArr;

@end

@implementation NMMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NMMessageModel *msgM = [[NMMessageModel alloc] init];
    self.sectionListArr = [msgM enumToGetModelListArr];
    
    [self setDefaultNavTitle:@"消息"];
    [self tableView];
}


#pragma mark -- 创建tableView
- (UITableView *)tableView{
    
    if (!_tableView) {
        
        CGFloat tableViewHeight = NMScreenHeight - NMNavbarHeight;
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NMNavbarHeight, NMScreenWidth, tableViewHeight) style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        tableView.sectionFooterHeight = 0.01;
        [self.view addSubview:tableView];
        _tableView = tableView;
        [_tableView registerClass:[NMMessageTableViewCell class] forCellReuseIdentifier:NSStringFromClass([NMMessageTableViewCell class])];
    }
    return _tableView;
}


#pragma mark ------------UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.sectionListArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger rowCount = 0;
    if (self.sectionListArr.count > section) {
        
        NSArray *arr = self.sectionListArr[section];
        rowCount = arr.count;
    }
    return rowCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return NM60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerView = [[UIView alloc] init];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return NM10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NMMessageTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NMMessageTableViewCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.sectionListArr.count > indexPath.section) {
        NSArray *listArr = self.sectionListArr[indexPath.section];
        if (listArr.count > indexPath.row) {
            
            cell.model = listArr[indexPath.row];
        }
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
