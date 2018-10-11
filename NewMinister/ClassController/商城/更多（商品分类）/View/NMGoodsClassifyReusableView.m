//
//  NMGoodsClassifyReusableView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/11.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMGoodsClassifyReusableView.h"

@implementation NMGoodsClassifyReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        //self.backgroundColor = [SPf7f7f7 colorWithAlphaComponent:0.8];
        self.backgroundColor = [UIColor whiteColor];
        CGFloat jianJu10 = NM10;
        
        self.headTitleLab = [[UILabel alloc] init];
        self.headTitleLab.font = NMSystemFont(12);
        self.headTitleLab.textAlignment = NSTextAlignmentLeft;
        self.headTitleLab.textColor = NM333333;
        [self addSubview:self.headTitleLab];
        
        [self.headTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.mas_left).offset(jianJu10);
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
    return self;
}

@end
