//
//  NMConfirmOrderTableView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMConfirmOrderTableView.h"

#import "NMConfirmOrderHeaderView.h"
#import "NMConfirmOrderAddressCell.h"
#import "NMConfirmOrderGoodsCell.h"
#import "NMConfirmOrderFooterView.h"

@interface NMConfirmOrderTableView()<UITableViewDelegate,UITableViewDataSource>
{
    
    CGFloat _footerViewHeight;
}

@end

@implementation NMConfirmOrderTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style ddd:(NSString *)ddd{

    if (self = [super initWithFrame:frame style:style]) {
        _footerViewHeight = 190;
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsVerticalScrollIndicator = NO;


        [self registerClass:[NMConfirmOrderAddressCell class] forCellReuseIdentifier:NSStringFromClass([NMConfirmOrderAddressCell class])];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([NMConfirmOrderGoodsCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([NMConfirmOrderGoodsCell class])];
        
        [self registerClass:[NMConfirmOrderHeaderView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([NMConfirmOrderHeaderView class])];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([NMConfirmOrderFooterView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:NSStringFromClass([NMConfirmOrderFooterView class])];
    }
    return self;
}
#pragma mark =============== 协议区 =============
#pragma mark -- UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat rowHeight = 90;
    if (indexPath.section != 0) {
        rowHeight = NM70;
    }
    return rowHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc] init];
    if (section != 0) {
        
        NMConfirmOrderHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([NMConfirmOrderHeaderView class])];
        headerView.contentView.backgroundColor = NMWhiteC;
        headView = headerView;
        [headerView refresh];
    }
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    CGFloat headHeight = 0.01;
    if (section != 0) {
        headHeight = NM35;
    }
    return headHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *footView = [[UIView alloc] init];
    if (section != 0) {
        
        NMConfirmOrderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([NMConfirmOrderFooterView class])];
        footerView.backgroundColor = NMf4f8fb;
        [footerView refresh];
        footView = footerView;
    }
    return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    CGFloat footHeight = NM10;
    if (section != 0) {
        footHeight = _footerViewHeight;
    }
    return footHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (indexPath.section == 0) {//地址视图
        
        NMConfirmOrderAddressCell *addressCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NMConfirmOrderAddressCell class]) forIndexPath:indexPath];
        
        [addressCell noAddressView];
        cell = addressCell;
    }else{
        
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NMConfirmOrderGoodsCell class]) forIndexPath:indexPath];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    if (indexPath.section == 0) {
        
    }
}

@end
