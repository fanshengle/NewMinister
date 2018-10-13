//
//  NMConfirmOrderAddressCell.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMConfirmOrderAddressCell.h"
@interface NMConfirmOrderAddressCell()

@property (nonatomic,strong) UIImageView *addressBackImgView;//地址视图的底部背景

@property (nonatomic,strong) UILabel *userNameLab;//收货人lab
@property (nonatomic,strong) UILabel *userPhoneLab;//电话号码lab
@property (nonatomic,strong) UILabel *addressLab;//收货地址lab

@end

@implementation NMConfirmOrderAddressCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


#pragma mark -- 没有地址时的视图
- (UIView *)noAddressView{
    
    if (!_noAddressView) {
     
        UIView *noAddressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        noAddressView.backgroundColor = NMWhiteC;
        [self addSubview:noAddressView];
        _noAddressView = noAddressView;
        
        CGFloat btnWidth = 160.0;
        CGFloat btnHeight = 23.;
        UIButton *noAddAdressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        noAddAdressBtn.bounds = CGRectMake(0, 0, btnWidth, btnHeight);
        noAddAdressBtn.center = noAddressView.center;
        [noAddAdressBtn setTitle:@"请添加收货人信息" forState:UIControlStateNormal];
        [noAddAdressBtn setTitleColor:NMf10215 forState:UIControlStateNormal];
        [noAddAdressBtn.titleLabel setFont:NMSystemFont(15)];
        [noAddAdressBtn setImage:[UIImage imageNamed:@"car_Becareful"] forState:UIControlStateNormal];
        [_noAddressView addSubview:noAddAdressBtn];
        //背景图
        [self setArrowIconView:_noAddressView];
        //右箭头
        [self addressBackImgView];
    }
    return _noAddressView;
}

#pragma mark -- 有地址时的视图
- (UIView *)haveAddressView{
    
    if (!_haveAddressView) {
        
        UIView *haveAddressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        haveAddressView.backgroundColor = NMWhiteC;
        [self addSubview:haveAddressView];
        _haveAddressView = haveAddressView;
        // 在右地址的视图上布局子视图
        [self setupSubviewOngAddressView];
        //背景图
        [self setArrowIconView:_noAddressView];
        //右箭头
        [self addressBackImgView];
    }
    return _haveAddressView;
}

#pragma mark -- 在右地址的视图上布局子视图
- (void)setupSubviewOngAddressView{

    CGFloat left = NM40;
    CGFloat top = NM15;
    
    //用户名称
    UILabel *userNameLab = [[UILabel alloc] init];
    userNameLab.textColor = NM333333;
    userNameLab.font = NMSystemFont(14);
    [_noAddressView addSubview:userNameLab];
    _userNameLab = userNameLab;
    [userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(left);
        make.top.equalTo(self).offset(top);
    }];
    //用户电话
    UILabel *userPhoneLab = [[UILabel alloc] init];
    userPhoneLab.textColor = NM333333;
    userPhoneLab.font = NMSystemFont(14);
    [_noAddressView addSubview:userPhoneLab];
    _userPhoneLab = userPhoneLab;
    [userPhoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-left);
        make.centerY.equalTo(userNameLab.mas_centerY);
    }];
    //用户收货地址
    UILabel *addressLab = [[UILabel alloc] init];
    addressLab.textColor = NM333333;
    addressLab.font = NMSystemFont(14);
    [_noAddressView addSubview:addressLab];
    _addressLab = addressLab;
    [userPhoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userNameLab);
        make.right.equalTo(userPhoneLab);
        make.bottom.equalTo(self).offset(-top);
    }];
    //定位图标
    UIImageView *locationImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"car_Location"]];
    [_noAddressView addSubview:locationImgView];
    [locationImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).offset(-NM15);
        make.centerY.equalTo(addressLab.mas_centerY);
    }];
}

#pragma mark -- 箭头视图
- (void)setArrowIconView:(UIView *)superView{
    
    UIImageView *arrowIconImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"car_ArrowGray"]];
    [superView addSubview:arrowIconImgView];
    [arrowIconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(superView);
        make.right.equalTo(superView.mas_right).offset(-NM15);
    }];
}

#pragma mark -- 地址视图的底部背景图
- (UIImageView *)addressBackImgView{
    
    if (!_addressBackImgView) {
        
        UIImageView *addressBackImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"car_addressBack"]];
        [self addSubview:addressBackImgView];
        _addressBackImgView = addressBackImgView;
        [addressBackImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
        }];
    }
    return _addressBackImgView;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
