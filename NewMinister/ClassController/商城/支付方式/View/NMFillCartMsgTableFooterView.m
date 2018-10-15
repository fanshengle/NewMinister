//
//  NMFillCartMsgTableFooterView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMFillCartMsgTableFooterView.h"

@interface NMFillCartMsgTableFooterView()

@property (nonatomic,strong) UIView *firstView;

@end

@implementation NMFillCartMsgTableFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self setupFirstViewOnFooterView];
    }
    return self;
}

- (void)setupFirstViewOnFooterView{
    
    UIView *firstView = [[UIView alloc] init];
    [self addSubview:firstView];
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.equalTo(@(NM40));
    }];
    
    UIButton *secondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [secondBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [secondBtn setTitleColor:NMWhiteC forState:UIControlStateNormal];
    [secondBtn.titleLabel setFont:NMSystemFont(14)];
    [secondBtn setBackgroundColor:NMFF5349];
    [self addSubview:secondBtn];
    [secondBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(firstView.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self).offset(NM15);
        make.right.equalTo(self).offset(-NM15);
    }];
    
    [self setupSubviewsOnFirstView];
}

- (void)setupSubviewsOnFirstView{
    
    UIButton *chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [chooseBtn setImage:[UIImage imageNamed:@"car_chooseNormal"] forState:UIControlStateNormal];
    [chooseBtn setImage:[UIImage imageNamed:@"car_chooseSelect"] forState:UIControlStateSelected];
    [self.firstView addSubview:chooseBtn];
    [chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.firstView.mas_centerY);
        make.left.equalTo(self.firstView).offset(NM15);
    }];
    
    UILabel *agreeLab = [[UILabel alloc] init];
    agreeLab.text = @"同意";
    agreeLab.textColor = NM666666;
    agreeLab.font = NMSystemFont(13);
    [self.firstView addSubview:agreeLab];
    [agreeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(chooseBtn.mas_right).offset(NM10);
        make.centerY.equalTo(self.firstView.mas_centerY);
    }];
    
    UIButton *agreementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [agreementBtn setTitle:@"《银联用户服务协议》" forState:UIControlStateNormal];
    [agreementBtn setTitleColor:NM3692cd forState:UIControlStateNormal];
    [agreementBtn.titleLabel setFont:NMSystemFont(13)];
    [self.firstView addSubview:chooseBtn];
    [agreementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.firstView.mas_centerY);
        make.left.equalTo(agreeLab.mas_right).offset(NM10);
    }];
}
@end
