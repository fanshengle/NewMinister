//
//  NMShopCartBottomView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMShopCartBottomView.h"

@implementation NMShopCartBottomView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}


- (void)refresh{
    
    [self.allChooseBtn setImage:[UIImage imageNamed:@"car_chooseNormal"] forState:UIControlStateNormal];
    [self.allChooseLab setText:@"全选"];
    [self.goSettleBtn setTitle:@"去结算" forState:UIControlStateNormal];
    [self.priceLab setText:@"￥100.00"];
    [self.combinedLab setText:@"合计:"];
}

#pragma mark -- 全部选中按钮
- (UIButton *)allChooseBtn{
    
    if (!_allChooseBtn) {
        
        CGFloat width = 32.0;
        UIButton *allChooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        allChooseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [allChooseBtn addTarget:self action:@selector(chooseGoodAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:allChooseBtn];
        _allChooseBtn = allChooseBtn;
        [allChooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self);
            make.width.equalTo(@(width));
        }];
    }
    return _allChooseBtn;
}

#pragma mark -- 全选lab
- (UILabel *)allChooseLab{
    
    if (!_allChooseLab) {
        
        UILabel *allChooseLab = [[UILabel alloc] init];
        allChooseLab.text = @"全选";
        allChooseLab.font = NMSystemFont(14);
        allChooseLab.textColor = NM999999;
        [self addSubview:allChooseLab];
        _allChooseLab = allChooseLab;
        
        [allChooseLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.allChooseBtn.mas_right).offset(NM5);
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
    return _allChooseLab;
}

#pragma mark -- 创建立即购买按钮
- (UIButton *)goSettleBtn{
    
    if (!_goSettleBtn) {
        
        CGFloat width = NM110;
        CGFloat height = NM35;
        UIImageView *goSettleBackView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"car_BuyNow"]];
        [self addSubview:goSettleBackView];
        [goSettleBackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-NM15);
            make.centerY.equalTo(self.mas_centerY);
            make.width.equalTo(@(width));
            make.height.equalTo(@(height));
        }];
        
        //去结算按钮
        UIButton *goSettleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [goSettleBtn.titleLabel setFont:NMSystemFont(14)];
        [goSettleBtn setTitle:@"去结算" forState:UIControlStateNormal];
        [goSettleBtn setTitleColor:NMWhiteC forState:UIControlStateNormal];
        [goSettleBtn addTarget:self action:@selector(goSettleAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:goSettleBtn];
        _goSettleBtn = goSettleBtn;
        
        [goSettleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(goSettleBackView);
        }];
        
        //设置圆角
        [_goSettleBtn setCornerRadius:5.0];
    }
    return _goSettleBtn;
}

#pragma mark -- 创建具体金额lab
- (UILabel *)priceLab{
    
    if (!_priceLab) {
        
        UILabel *priceLab = [[UILabel alloc] init];
        priceLab.text = @"￥600.00";
        priceLab.font = NMSystemFont(17);
        priceLab.textColor = NMf10215;
        [self addSubview:priceLab];
        _priceLab = priceLab;
        
        [priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.goSettleBtn.mas_left).offset(-NM15);
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
    return _combinedLab;
}

#pragma mark -- 创建合计金额lab
- (UILabel *)combinedLab{
    
    if (!_combinedLab) {
        
        UILabel *combinedLab = [[UILabel alloc] init];
        combinedLab.text = @"合计:";
        combinedLab.font = NMBoldSystemFont(14);
        combinedLab.textColor = NM333333;
        [self addSubview:combinedLab];
        _combinedLab = combinedLab;
        
        [combinedLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.priceLab.mas_left);
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
    return _combinedLab;
}


- (void)goSettleAction:(UIButton *)button{
    
    if (self.GoSettleClickBlock) {
        
        self.GoSettleClickBlock();
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
