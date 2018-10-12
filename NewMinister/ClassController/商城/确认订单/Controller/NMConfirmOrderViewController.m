//
//  NMConfirmOrderViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMConfirmOrderViewController.h"

@interface NMConfirmOrderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NMConfirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setDefaultNavTitle:@"确认下单"];
    self.navBarView.navBackgroundColor = NMf4f8fb;
}


#pragma mark -- 创建左边的tableView
- (UITableView *)tableView{
    
    if (!_tableView) {
        
        CGFloat tableViewY = self.navBarView.height;
        CGFloat tableViewWidth = NM70;
        CGFloat tableViewHeight = NMScreenHeight - NMNavbarHeight;
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableViewY, tableViewWidth, tableViewHeight) style:UITableViewStyleGrouped];
        tableView.backgroundColor = NMWhiteC;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = NM47;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        [tableView registerClass:[NMGoodsClassifyTableViewCell class] forCellReuseIdentifier:NSStringFromClass([NMGoodsClassifyTableViewCell class])];
        [self.view addSubview:tableView];
        _tableView = tableView;
        [_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:_currentSelectIndex] animated:YES scrollPosition:UITableViewScrollPositionTop];
        
    }
    
    return _tableView;
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
