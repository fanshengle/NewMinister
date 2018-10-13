//
//  NMConfirmOrderBottomView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMConfirmOrderBottomView.h"

@implementation NMConfirmOrderBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = NMWhiteC;
        [self combinedLab];
        [self priceLab];
        [self buyNowBtn];
    }
    return self;
}

#pragma mark -- 创建合计金额lab
- (UILabel *)combinedLab{
    
    if (!_combinedLab) {
     
        UILabel *combinedLab = [[UILabel alloc] init];
        combinedLab.text = @"合计金额：";
        combinedLab.font = NMSystemFont(12);
        combinedLab.textColor = NM333333;
        [self addSubview:combinedLab];
        _combinedLab = combinedLab;
        
        [combinedLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(NM15);
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
    return _combinedLab;
}

#pragma mark -- 创建具体金额lab
- (UILabel *)priceLab{
    
    if (!_priceLab) {
        
        UILabel *priceLab = [[UILabel alloc] init];
        priceLab.text = @"￥600.00";
        priceLab.font = NMSystemFont(12);
        priceLab.textColor = NMf10215;
        [self addSubview:priceLab];
        _priceLab = priceLab;
        
        [priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.combinedLab.mas_right).offset(NM5);
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
    return _combinedLab;
}

#pragma mark -- 创建立即购买按钮
- (UIButton *)buyNowBtn{
    
    if (!_buyNowBtn) {
     
        CGFloat width = NM110;
        CGFloat height = NM35;
        UIImageView *buyNowBackView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"car_BuyNow"]];
        [self addSubview:buyNowBackView];
        [buyNowBackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-NM15);
            make.centerY.equalTo(self.mas_centerY);
            make.width.equalTo(@(width));
            make.height.equalTo(@(height));
        }];
        
        UIButton *buyNowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [buyNowBtn.titleLabel setFont:NMSystemFont(14)];
        [buyNowBtn setTitle:@"立即购买" forState:UIControlStateNormal];
        [buyNowBtn setTitleColor:NMWhiteC forState:UIControlStateNormal];
        [buyNowBtn addTarget:self action:@selector(buyNowAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:buyNowBtn];
        _buyNowBtn = buyNowBtn;
        
        [buyNowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(buyNowBackView);
        }];
        
        //设置圆角
        [_buyNowBtn setCornerRadius:5.0];
    }
    return _buyNowBtn;
}

#pragma mark -- 立即购买
- (void)buyNowAction:(UIButton *)button{
    
    if (self.BuyNowClickBlock) {
        
        self.BuyNowClickBlock(600);
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
