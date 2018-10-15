//
//  NMPayWayTableViewCell.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/13.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMPayWayTableViewCell.h"


@interface NMPayWayTableViewCell()

@property (nonatomic,strong) UIImageView *payWayImgView;
@property (nonatomic,strong) UILabel *payWayNameLab;
@property (nonatomic,strong) UIButton *chooseBtn;

@end

@implementation NMPayWayTableViewCell

- (void)setModel:(NMPayWayModel *)model{
    
    _model = model;
    
    [self.payWayImgView setImage:[UIImage imageNamed:_model.titleIcon]];
    [self.chooseBtn setImage:[UIImage imageNamed:_model.chooseNormalIcon] forState:UIControlStateNormal];
    [self.chooseBtn setImage:[UIImage imageNamed:_model.chooseSelectIcon] forState:UIControlStateSelected];
    self.payWayNameLab.text = _model.titleText;

    //画线
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = NMf1f1f1;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.payWayImgView.mas_left);
        make.right.equalTo(self.chooseBtn.mas_right);
        make.top.equalTo(self.mas_top);
        make.height.equalTo(@(1.0));
    }];
}

#pragma mark -- 店铺logo
- (UIImageView *)payWayImgView{
    if (!_payWayImgView) {
        
        //店铺图片
        UIImageView *payWayImgView = [[UIImageView alloc] init];
        payWayImgView.contentMode = UIViewContentModeLeft;
        [self addSubview:payWayImgView];
        _payWayImgView = payWayImgView;
        [payWayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.mas_centerY);
            make.left.equalTo(self.mas_left).offset(NM15);
        }];
    }
    return _payWayImgView;
}

#pragma mark -- 店铺名称lab
- (UILabel *)payWayNameLab{
    
    if (!_payWayNameLab) {
        
        //配送方式lab
        UILabel *payWayNameLab = [[UILabel alloc] init];
        payWayNameLab.font = NMSystemFont(13);
        payWayNameLab.textColor = NM333333;
        [self addSubview:payWayNameLab];
        _payWayNameLab = payWayNameLab;
        [payWayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.payWayImgView.mas_right).offset(NM15);
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
    return _payWayNameLab;
}

- (UIButton *)chooseBtn{
    
    if (!_chooseBtn) {
        UIButton *chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [chooseBtn addTarget:self action:@selector(choosePayAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:chooseBtn];
        _chooseBtn = chooseBtn;
        [chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-NM15);
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
    return _chooseBtn;
}

#pragma mark -- 选择支付方式
- (void)choosePayAction:(UIButton *)button{
    
    if (self.payWayBlock) {
        
        self.payWayBlock(button);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
