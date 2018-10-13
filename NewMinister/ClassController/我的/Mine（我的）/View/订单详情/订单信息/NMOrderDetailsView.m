//
//  NMOrderDetailsView.m
//  NewMinister
//
//  Created by Andy on 2018/10/13.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMOrderDetailsView.h"

@implementation NMOrderDetailsView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setUI];
    }
    
    return self;
}
-(void)setUI{
    
    self.backgroundColor=[UIColor whiteColor];
    
    UILabel *labelA = [[UILabel alloc] init];
    labelA.frame = CGRectMake(15.5,15,100,12.5);
    labelA.text = @"订单信息";
    labelA.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    labelA.textColor = [UIColor colorWithRed:241/255.0 green:2/255.0 blue:21/255.0 alpha:1];
    [self addSubview:labelA];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(15,37,NMScreenWidth-30,1);
    view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    [self addSubview:view];
    
    UILabel *labelB = [[UILabel alloc] init];
    labelB.frame = CGRectMake(15.5,53,100,11.5);
    labelB.text = @"商品总价";
    labelB.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    labelB.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    [self addSubview:labelB];
    
    
    UILabel *labelC = [[UILabel alloc] init];
    labelC.frame = CGRectMake(15.5,78,100,11.5);
    labelC.text = @"运费(快递)";
    labelC.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    labelC.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    [self addSubview:labelC];

    
    UILabel *labeD = [[UILabel alloc] init];
    labeD.frame = CGRectMake(15.5,104,100,11.5);
    labeD.text = @"品券";
    labeD.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    labeD.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    [self addSubview:labeD];

    UILabel *labelE = [[UILabel alloc] init];
    labelE.frame = CGRectMake(15.5,130,100,11.5);
    labelE.text = @"优惠促销";
    labelE.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    labelE.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    [self addSubview:labelE];
    
    UILabel *labelF = [[UILabel alloc] init];
    labelF.frame = CGRectMake(15.5,156,100,11.5);
    labelF.text = @"合计金额";
    labelF.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    labelF.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    [self addSubview:labelF];
    
    
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(labelF.frame)+16, NMScreenWidth, 10)];
    bgview.backgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
    [self addSubview:bgview];
    

    UILabel * numberlabel = [[UILabel alloc] init];
    numberlabel.frame = CGRectMake(15.5,CGRectGetMaxY(bgview.frame)+15,NMScreenWidth,11.5);
    numberlabel.text = @"订单编号：       56240526422";
    numberlabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    numberlabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    [self addSubview:numberlabel];
    
    
    UILabel * timelabel = [[UILabel alloc] init];
    timelabel.frame = CGRectMake(15.5,CGRectGetMaxY(bgview.frame)+40,NMScreenWidth,11.5);
    timelabel.text = @"提交时间：       56240526422";
    timelabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    timelabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    [self addSubview:timelabel];

    
    UILabel * paylabel = [[UILabel alloc] init];
    paylabel.frame = CGRectMake(15.5,CGRectGetMaxY(bgview.frame)+66,NMScreenWidth,11.5);
    paylabel.text = @"支付方式：       56240526422";
    paylabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    paylabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    [self addSubview:paylabel];

    
    UILabel * moneylabel = [[UILabel alloc] init];
    moneylabel.frame = CGRectMake(15.5,CGRectGetMaxY(bgview.frame)+92,NMScreenWidth,11.5);
    moneylabel.text = @"实付金额：       56240526422";
    moneylabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    moneylabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    [self addSubview:moneylabel];


    
}


@end
