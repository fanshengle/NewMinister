//
//  NMAddressSetViewController.m
//  NewMinister
//
//  Created by Andy on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMAddressSetViewController.h"
#import "NMAddressSetTableViewCell.h"
#import "NMNewAddressViewController.h"
#import "NMStudent.h"
#import "NMStudentFMDNManager.h"

@interface NMAddressSetViewController ()
<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;


@end

@implementation NMAddressSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDefaultNavTitle:@"地址管理"];
    self.navBarView.navBackgroundColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    [self tableView];
    [self.view addSubview:self.tableView];
    [self setBut];

    
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    NSArray *arr = [NMStudentFMDNManager queryStudent:nil];
    [self.dataArr removeAllObjects];
    [self.dataArr addObjectsFromArray:arr];
    NSLog(@"%@  %lu",_dataArr,(unsigned long)_dataArr.count);
    [_tableView reloadData];
    
}
#pragma mark -- 创建tableView
- (UITableView *)tableView{
    if (!_tableView) {
        
        UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, NMNavbarHeight, NMScreenWidth, 5)];
        view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"car_addressBack"]];
        [self.view addSubview:view];
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NMNavbarHeight+5, NMScreenWidth, NMScreenHeight-NMNavbarHeight-49-5) style:UITableViewStyleGrouped];
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
    label.text = @"添加新地址";
    label.textAlignment=NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:14];
    label.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    [self.view addSubview:label];
    
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [view addGestureRecognizer:tapGesturRecognizer];
    
}
-(void)tapAction:(id)tap
{
    NMNewAddressViewController * vc =[[NMNewAddressViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
//返回每一行的cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return 1;
}
//返回分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArr.count;
}
//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
}
//区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
        return 0.01;
    }else{
        return 5;
    }
}
//区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identify = @"NMAddressSetTableViewCell";
    NMAddressSetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[NMAddressSetTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    NMStudent *stu = self.dataArr[indexPath.section];
    [cell showStudentWith:stu];
    return  cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

}
- (NSMutableArray <NMStudent *> *)dataArr{
    
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    
    return _dataArr;
}

@end
