//
//  NMOrderDetailsAddressView.m
//  NewMinister
//
//  Created by Andy on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMOrderDetailsAddressView.h"

@implementation NMOrderDetailsAddressView

- (instancetype)initWithFrame:(CGRect)frame namelabel:(NSString *)nameStr phonelabel:(NSString *)phoneStr addresslabel:(NSString *)addressStr{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor=[UIColor whiteColor];
        
        
        UIImageView  *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 54, 13, 15)];
        imageView.image=[UIImage imageNamed:@"car_Location"];
        [self addSubview:imageView];
        
        
        UILabel *namelabel = [[UILabel alloc] init];
        namelabel.frame = CGRectMake(41,21,NMScreenWidth/2-20,13);
        namelabel.text = [NSString stringWithFormat:@"收货人：%@",nameStr];
        namelabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
        namelabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [self addSubview:namelabel];
        
        
        UILabel *phonelabel = [[UILabel alloc] init];
        phonelabel.frame = CGRectMake(0,22,NMScreenWidth-41,11);
        phonelabel.text = phoneStr;
        phonelabel.textAlignment=NSTextAlignmentRight;
        phonelabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
        phonelabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [self addSubview:phonelabel];
        

        UILabel *addresslabel = [[UILabel alloc] init];
        addresslabel.frame = CGRectMake(41.5,48,NMScreenWidth-42-37,35);
        addresslabel.text =[NSString stringWithFormat:@"收货地址：%@",addressStr];
        addresslabel.numberOfLines = 0;
        addresslabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:11];
        addresslabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];\
        [self addSubview:addresslabel];

    }
    
    return self;
}

@end
