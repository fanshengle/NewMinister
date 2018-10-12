//
//  NMMineOrderListView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/4.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMineOrderListView.h"
#import "NMMineOrderViewController.h"

@interface NMMineOrderListView()
{
    
    NSArray *_orderTitleArr;
    NSArray *_orderImgArr;
    CGFloat _btnViewWidth;
}
@property (nonatomic,strong) UIView *firstView;
@property (nonatomic,strong) UIView *secondView;

@end

@implementation NMMineOrderListView


- (instancetype)init{
    
    if (self = [super init]) {
        //设置带圆角的阴影
        [self setShadowColor:NMBlackC Radius:4 Offset:CGSizeMake(5, 5) Opacity:0.5 CornerRadius:NM5];
        
        _orderTitleArr = @[@"待付款",@"待发货",@"待收货",@"待评价",@"售后/退款"];
        _orderImgArr = @[@"myWaitPay",@"myWaitSend",@"myWaitReceive",@"myWaitEvaluate",@"myAfterSales"];
        
        [self setupOrderFirstView];
        [self setupOrderSecondView];
    }
    return self;
}

#pragma mark -- 创建订单的第一部分视图
- (void)setupOrderFirstView{
    
    UIView *firstView = [[UIView alloc] init];
    [self addSubview:firstView];
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@(NM44));
    }];
    _firstView = firstView;
    
    //我的订单lab
    UILabel *myOrderLab = [[UILabel alloc] init];
    myOrderLab.font = NMSystemFont(12);
    myOrderLab.textAlignment = NSTextAlignmentLeft;
    myOrderLab.textColor = NM333333;
    myOrderLab.text = @"我的订单";
    [firstView addSubview:myOrderLab];
    [myOrderLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(firstView.mas_left).offset(NM15);
        make.centerY.equalTo(firstView);
    }];
    
    UIButton *allOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    allOrderBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [allOrderBtn setTitle:@"全部订单" forState:UIControlStateNormal];
    [allOrderBtn.titleLabel setFont:NMSystemFont(12)];
    [allOrderBtn setTitleColor:NM999999 forState:UIControlStateNormal];
    [allOrderBtn setImage:[UIImage imageNamed:@"more_arrow"] forState:UIControlStateNormal];
    [firstView addSubview:allOrderBtn];
    [allOrderBtn addTarget:self action:@selector(allOrderBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [allOrderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(firstView.mas_right).offset(-NM15);
        make.centerY.equalTo(firstView);
    }];
    //设置文字在左，图片在右
    allOrderBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -allOrderBtn.imageView.frame.size.width, 0, allOrderBtn.imageView.frame.size.width);
    allOrderBtn.imageEdgeInsets = UIEdgeInsetsMake(0, allOrderBtn.titleLabel.frame.size.width + 2.5, 0, -allOrderBtn.titleLabel.frame.size.width - 2.5);
    
    //画线
    [firstView drawBottomLineWithColor:NMf5f5f5];
}

#pragma mark -- 创建订单的第二部分视图
- (void)setupOrderSecondView{
    
    UIView *secondView = [[UIView alloc] init];
    [self addSubview:secondView];
    _secondView = secondView;
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.top.equalTo(self.firstView.mas_bottom);
    }];
    
    [self setupSecondViewOfSubviews];
}

#pragma mark -- 在第二部分视图上布置子视图
- (void)setupSecondViewOfSubviews{
    
    CGFloat count = _orderTitleArr.count;
    CGFloat jianJu = NM10;
    CGFloat width = (NMScreenWidth - NM15*2 - jianJu*(count + 1))/count;
    _btnViewWidth = width;
    NSString *titleStr = @"";
    NSString *imgStr = @"";
    for (int i = 0; i < count; i++) {
        
        titleStr = _orderTitleArr[i];
        imgStr = _orderImgArr[i];
        
        UIView *btnView = [[UIView alloc] init];
        btnView.tag = 100 + i;
        [_secondView addSubview:btnView];
        [btnView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.top.bottom.equalTo(self.secondView);
            make.width.equalTo(@(width));
            make.left.equalTo(@(jianJu + i*jianJu + i*width));
        }];
        
        [self setupSubviewOnBtnView:btnView index:i];
        [self setupRightRedLabOnView:btnView withIndex:i];
    }
    
    [self refreshOrderCount];
}

#pragma mark -- 在订单按钮视图上布局子视图
- (void)setupSubviewOnBtnView:(UIView *)orderView index:(NSInteger)index{
    
    NSString *titleStr = _orderTitleArr[index];
    NSString *imgStr = _orderImgArr[index];
    
    //上下间距
    CGFloat top = NM15;
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:imgStr];
    [orderView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(orderView.mas_top).offset(top);
        make.centerX.equalTo(orderView.mas_centerX);
    }];
    
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.text = titleStr;
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = NM333333;
    titleLab.font = NMSystemFont(12);
    [orderView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(orderView);
        make.bottom.equalTo(orderView.mas_bottom).offset(-top);
        make.centerX.equalTo(orderView.mas_centerX);
    }];
}

#pragma mark -- 创建小红点按钮
- (void)setupRightRedLabOnView:(UIView *)orderView withIndex:(NSInteger)i{
    
    UIFont *labFont = NMSystemFont(11);
    CGFloat itemWidth = _btnViewWidth;
    CGFloat rightRedLabHeight = 18.0;
    CGFloat half = rightRedLabHeight/2.0;
    
    //刚开始创建的时候默认，为空，宽度则为空
    NSString *orderCountStr = @"";
    CGFloat rightRedLabWidth = [ToolObject returnAdaptiveTextSizeWithText:orderCountStr calculateWidth:CGSizeMake(NMScreenWidth, rightRedLabHeight) calculateHeight:CGSizeZero font:labFont].width;
    
    CGFloat rightRedLabLeft = itemWidth/2.0 + 7;
    CGFloat rightRedLabTop = 6.5;
    UILabel *rightRedLab = [[UILabel alloc] initWithFrame:CGRectMake(rightRedLabLeft, rightRedLabTop, rightRedLabWidth, rightRedLabHeight)];
    rightRedLab.tag = 200 + i;
    rightRedLab.textColor = NMfa6a45;
    rightRedLab.font = labFont;
    rightRedLab.textAlignment = NSTextAlignmentCenter;
    rightRedLab.text = orderCountStr;
    [orderView addSubview:rightRedLab];
    //设置带边框圆角
    [rightRedLab setBorderWidth:1.0 BorderColor:NMfa6a45 CornerRadius:half];
}

#pragma mark ===============刷新数据层==============
#pragma mark -- 刷新订单数量
- (void)refreshOrderCount{
    
    NSString *count0 = @"1";
    NSString *count1 = @"20";
    NSString *count2 = @"199";
    NSString *count3 = @"50";
    NSString *count4 = @"100";
    
    //待付款
    UIView *view0 = (UIView *)[self viewWithTag:100];
    UILabel *lab0 = (UILabel *)[view0 viewWithTag:200];
    [self changeRightRedLabState:lab0 redLabCountText:count0];
    
    //待发货
    UIView *view1 = (UIView *)[self viewWithTag:101];
    UILabel *lab1 = (UILabel *)[view1 viewWithTag:201];
    [self changeRightRedLabState:lab1 redLabCountText:count1];
    
    //配送中
    UIView *view2 = (UIView *)[self viewWithTag:102];
    UILabel *lab2 = (UILabel *)[view2 viewWithTag:202];
    [self changeRightRedLabState:lab2 redLabCountText:count2];
    
    //待评价
    UIView *view3 = (UIView *)[self viewWithTag:103];
    UILabel *lab3 = (UILabel *)[view3 viewWithTag:203];
    [self changeRightRedLabState:lab3 redLabCountText:count3];
    
    //售后/退款
    UIView *view4 = (UIView *)[self viewWithTag:104];
    UILabel *lab4 = (UILabel *)[view4 viewWithTag:204];
    [self changeRightRedLabState:lab4 redLabCountText:count4];
}

#pragma mark -- 通过订单数量来改变小红点lab的frame，并赋值
- (void)changeRightRedLabState:(UILabel *)redLab redLabCountText:(NSString *)countText{
    
    //替换lab的frame
    CGRect frame = redLab.frame;
    CGFloat height = frame.size.height;
    CGFloat width = frame.size.width;
    NSString *labStr = @"";
    
    //countText必须符合以下条件，才能改变redLab，否则，不做任何改变
    if (countText != nil && ![countText isEqualToString:@""] && countText.integerValue != 0) {
        if (countText.integerValue > 99) {//数量超过99，默认显示99+
            
            labStr = @"99+";
            redLab.text = @"99+";
            width = [ToolObject returnAdaptiveTextSizeWithText:labStr calculateWidth:CGSizeMake(NMScreenWidth, height) calculateHeight:CGSizeZero font:redLab.font].width + 5.0;
            redLab.layer.cornerRadius = height/2.0;
        }else{
            
            labStr = countText;
            redLab.text = labStr;
            width = height;
        }
    }else{
        
        //回到初始化创建时的状态
        width = 0.0;
        height = frame.size.height;
    }
    
    //做出frame的改变
    redLab.frame = CGRectMake(frame.origin.x, frame.origin.y, width, height);
}

#pragma mark -- 所有订单点击事件
-(void)allOrderBtnClick:(UIButton *)sender{
    
    NMMineOrderViewController * mineOrderVC =[[NMMineOrderViewController alloc]init];
    id object = [self nextResponder];
    while (![object isKindOfClass:[UIViewController class]] && object != nil) {
        object = [object nextResponder];
    }
    UIViewController *superController = (UIViewController*)object;
    mineOrderVC.titleViewIndex=0;
    [superController.navigationController pushViewController:mineOrderVC animated:YES];
    
}
@end
