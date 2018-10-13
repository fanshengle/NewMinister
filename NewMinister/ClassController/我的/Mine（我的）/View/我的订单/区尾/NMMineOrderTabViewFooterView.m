//
//  NMMineOrderTabViewFooterView.m
//  NewMinister
//
//  Created by Andy on 2018/10/13.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMineOrderTabViewFooterView.h"

@implementation NMMineOrderTabViewFooterView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setUI];
    }
    
    return self;
}
-(void)setUI{
    
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 70)];
    view.backgroundColor=[UIColor whiteColor];
    [self addSubview:view];

    
    NSString * money =@"100.00";
    NSString *  number =@"88";
    NSString * str =[NSString stringWithFormat:@"共%@件商品 合计：¥%@",number,money];
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0,10,NMScreenWidth-20,10);
    label.text=str;
    label.textAlignment=NSTextAlignmentRight;
    label.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:10];
    label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [view addSubview:label];
    
    
    UIButton * rigBut=[UIButton buttonWithType:UIButtonTypeSystem];
    [rigBut setTitle:@"立即付款" forState:UIControlStateNormal];
    rigBut.frame = CGRectMake(NMScreenWidth-80,CGRectGetMaxY(label.frame)+15,60,20);
    rigBut.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    [rigBut setTintColor:  [UIColor colorWithRed:241/255.0 green:2/255.0 blue:21/255.0 alpha:1]];
    rigBut.layer.cornerRadius = 3;//边框圆角大小
    rigBut.layer.masksToBounds = YES;
    rigBut.layer.borderColor = [UIColor colorWithRed:241/255.0 green:2/255.0 blue:21/255.0 alpha:1].CGColor;//边框颜色
    rigBut.layer.borderWidth = 1;//边框宽度
    [view addSubview:rigBut];
    
    UIButton * lefBut=[UIButton buttonWithType:UIButtonTypeSystem];
    [lefBut setTitle:@"取消订单" forState:UIControlStateNormal];
    lefBut.frame = CGRectMake(NMScreenWidth-150,CGRectGetMaxY(label.frame)+15,60,20);
    lefBut.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    [lefBut setTintColor:   [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]];
    lefBut.layer.cornerRadius = 3;//边框圆角大小
    lefBut.layer.masksToBounds = YES;
    lefBut.layer.borderColor =  [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1].CGColor;//边框颜色
    lefBut.layer.borderWidth = 1;//边框宽度
    [view addSubview:lefBut];

}

@end
