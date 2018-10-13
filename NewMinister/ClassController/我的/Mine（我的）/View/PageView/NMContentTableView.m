//
//  NMContentTableView.m
//  NewMinister
//
//  Created by Andy on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMContentTableView.h"

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
    return 70;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 52)];
    view.backgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
    
    UIView * bgview=[[UIView alloc]initWithFrame:CGRectMake(0, 10, NMScreenWidth, 42)];
    bgview.backgroundColor=[UIColor whiteColor];
    [view addSubview:bgview];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(15,24,14,13);
    imageView.image=[UIImage imageNamed:@"car_ShopImg.png"];
    [view addSubview:imageView];
    
    NSString * leflabelstr =[NSString stringWithFormat:@"ROCK的私家小店"];
    CGSize size = [leflabelstr sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0f]}];
    UILabel *leflabel = [[UILabel alloc] init];
    leflabel.frame = CGRectMake(34.5,25,size.width,11.5);
    leflabel.text = leflabelstr;
    leflabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    leflabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [view addSubview:leflabel];
    
    UILabel *riglabel = [[UILabel alloc] init];
    riglabel.frame = CGRectMake(0,25,NMScreenWidth-16,11.5);
    riglabel.text = @"等待买家付款";
    riglabel.textAlignment=NSTextAlignmentRight;
    riglabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    riglabel.textColor = [UIColor colorWithRed:241/255.0 green:2/255.0 blue:21/255.0 alpha:1];
    [view addSubview:riglabel];
    
    UIImageView *rigimageView = [[UIImageView alloc] init];
    rigimageView.frame = CGRectMake(CGRectGetMaxX(leflabel.frame)+5,25,14,13);
    rigimageView.image=[UIImage imageNamed:@"car_ArrowGray.png"];
    [view addSubview:rigimageView];

    
    
    return view;
    
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 70)];
    view.backgroundColor=[UIColor whiteColor];
    return view;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:NNContentTableViewCellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NNContentTableViewCellID];
        cell.backgroundColor=[UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 77)];
        bgview.backgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
        [cell.contentView addSubview:bgview];
        
    }
    
    
    return cell;
}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView == self)
//    {
//        CGFloat sectionHeaderHeight = 20;
//        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
//            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
//            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//        }
//    }
//}

@end
