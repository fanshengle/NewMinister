//
//  NMContentTableView.m
//  NewMinister
//
//  Created by Andy on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMContentTableView.h"
#import "NMMineOrderTabViewHeadView.h"
#import "NMMineOrderTabViewFooterView.h"
#import "NMMineOrderTableViewCell.h"
#import "NMOrderDetailsViewController.h"

@interface NMContentTableView()<UITableViewDataSource,UITableViewDelegate>


@end

static NSString *NNContentTableViewCellID = @"NNContentTableView";

@implementation NMContentTableView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = self;
        self.delegate=self;
        self.tableHeaderView=[UIView new];
        self.tableFooterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 60)];
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

- (void)didMoveToWindow {
    [super didMoveToWindow];
}
- (void)setContentOffset:(CGPoint)contentOffset {
    if (self.window) {
        [super setContentOffset:contentOffset];
    }
}
//返回每一行的cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
//返回分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
//区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 52;
}
//区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 67;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NMMineOrderTabViewHeadView * view=[[NMMineOrderTabViewHeadView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 52)];
    return view;
    
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    NMMineOrderTabViewFooterView * view=[[NMMineOrderTabViewFooterView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 70)];
    return view;
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NMOrderDetailsViewController * mineOrderVC =[[NMOrderDetailsViewController alloc]init];
    id object = [self nextResponder];
    while (![object isKindOfClass:[UIViewController class]] && object != nil) {
        object = [object nextResponder];
    }
    UIViewController *superController = (UIViewController*)object;
    [superController.navigationController pushViewController:mineOrderVC animated:YES];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identify = @"NMMineOrderTableViewCell";
    NMMineOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[NMMineOrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    return  cell;
}

@end
