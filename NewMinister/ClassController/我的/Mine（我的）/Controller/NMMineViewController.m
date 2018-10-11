//
//  NMMineViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/9/28.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMineViewController.h"

#import "NMMineTableViewCell.h"
#import "NMMineHeaderView.h"

#import "NMMineModel.h"
@interface NMMineViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>{
    
    CGFloat _headerViewHeight;
}


@property (nonatomic,strong) NMMineHeaderView *headerView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *cellListArr;
@property (nonatomic,strong) NMMineModel *mineModel;

@end

@implementation NMMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置白色字体
    self.StatusBarStyle = UIStatusBarStyleLightContent;
    
    NMMineModel *mineModel = [[NMMineModel alloc] init];
    self.cellListArr = [mineModel enumToGetModelListArr];

    [self tableView];
    self.view.backgroundColor = [UIColor blueColor];
}

#pragma mark -- 创建tableView的headerView
- (NMMineHeaderView *)headerView{
    
    if (!_headerView) {
        
        _headerViewHeight = 300.0;
        NMMineHeaderView *headerView = [[NMMineHeaderView alloc] initWithFrame:CGRectMake(0, -_headerViewHeight, NMScreenWidth, _headerViewHeight)];
        _headerView = headerView;
    }
    
    return _headerView;
}

#pragma mark -- 创建tableView
- (UITableView *)tableView{
    
    if (!_tableView) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, NMScreenWidth, NMScreenHeight - NMTabbarHeight) style:UITableViewStylePlain];
        tableView.backgroundColor = NMWhiteC;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.showsHorizontalScrollIndicator = NO;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.scrollsToTop = YES;
        
        [tableView addSubview:self.headerView];
        tableView.contentInset = UIEdgeInsetsMake(_headerView.height, 0, 0, 0);

        [self.view addSubview:tableView];
        [tableView registerClass:[NMMineTableViewCell class] forCellReuseIdentifier:NSStringFromClass([NMMineTableViewCell class])];
        _tableView = tableView;
    }
    return _tableView;
}

#pragma mark ————— tableview 代理 —————

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _cellListArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return NM44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NMMineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NMMineTableViewCell class]) forIndexPath:indexPath];
    cell.model = _cellListArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            NMLog(@"点击了 我的钱包");
            break;
        case 1:
            NMLog(@"点击了 我的任务");
            break;
        case 2:
            NMLog(@"点击了 我的好友");
            break;
        case 3:
            NMLog(@"点击了 我的等级");
            break;
        default:
            break;
    }
}



#pragma mark ————— scrollView 代理 —————
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat offset = scrollView.contentOffset.y ;
    CGFloat totalOffsetY = scrollView.contentInset.top + offset;
    NMLog(@"offset    %.f   totalOffsetY %.f",offset,totalOffsetY);
    if (totalOffsetY < 0) {
        
        _headerView.frame = CGRectMake(0, offset, self.view.width, _headerViewHeight - totalOffsetY);
//        CGRect msgFrame = _headerView.userMsgView.frame;
//        _headerView.userMsgView.frame = CGRectMake(0, offset, self.view.width, msgFrame.size.height);
//        CGRect orderFrame = _headerView.userMsgView.frame;
//        _headerView.orderListView.frame = CGRectMake(0, msgFrame.origin.y + offset, self.view.width, orderFrame.size.height);
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
