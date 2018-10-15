//
//  NMMineSetupViewController.m
//  NewMinister
//
//  Created by Andy on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMineSetupViewController.h"
#import "NMAddressSetViewController.h"

@interface NMMineSetupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation NMMineSetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setDefaultNavTitle:@"账号设置"];
    self.navBarView.navBackgroundColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    [self tableView];
    [self.view addSubview:self.tableView];
    [self setBut];
}
#pragma mark -- 创建tableView
- (UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NMNavbarHeight, NMScreenWidth, NMScreenHeight-NMNavbarHeight-49) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
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
-(void)setBut{
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0,CGRectGetMaxY(self.tableView.frame),NMScreenWidth,49);
    view.backgroundColor = [UIColor clearColor];
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,CGRectGetMaxY(self.tableView.frame),NMScreenWidth,49);
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 1);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:255/255.0 green:83/255.0 blue:73/255.0 alpha:1].CGColor,(__bridge id)[UIColor colorWithRed:244/255.0 green:57/255.0 blue:46/255.0 alpha:1].CGColor];
    gl.locations = @[@(0.0),@(1.0)];
    [self.view.layer addSublayer:gl];
    [self.view addSubview:view];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0,NMScreenHeight-30,NMScreenWidth,13);
    label.text = @"退出登录";
    label.textAlignment=NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:14];
    label.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    [self.view addSubview:label];
    
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [view addGestureRecognizer:tapGesturRecognizer];
    
}
-(void)tapAction:(id)tap
{
    NSLog(@"点击了tapView");
}


//返回每一行的cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 2;
    }else{
        return 3;
    }
}
//返回分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
//区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
//区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NMAddressSetViewController * VC =[[NMAddressSetViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * NNContentTableViewCellID =@"cellid";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:NNContentTableViewCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NNContentTableViewCellID];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    if (indexPath.section == 0) {
        
        NSArray * array =[NSArray arrayWithObjects:@"个人资料",@"地址管理",@"账户安全", nil];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [array objectAtIndex:indexPath.row]];

    }
    if (indexPath.section == 1) {
        NSArray * array =[NSArray arrayWithObjects:@"银行卡包",@"关于我们",@"意见反馈", nil];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [array objectAtIndex:indexPath.row]];

    }
    if (indexPath.section == 2) {
        NSArray * array =[NSArray arrayWithObjects:@"消息提醒",@"清楚缓存", nil];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [array objectAtIndex:indexPath.row]];
    }
    if (indexPath.row==0 || indexPath.row ==1) {
        
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(15,43,NMScreenWidth-30,1);
        view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
        [cell.contentView addSubview:view];
    }
    if (indexPath.section == 0 || indexPath.section == 1) {
        
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

    }
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    cell.textLabel.textColor=[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    return cell;
}

@end
