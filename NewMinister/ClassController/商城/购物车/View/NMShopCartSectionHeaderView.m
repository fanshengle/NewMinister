//
//  NMShopCartSectionHeaderView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMShopCartSectionHeaderView.h"

@interface NMShopCartSectionHeaderView()

@property (nonatomic,strong) UIView *firstView;//共有视图

@property (nonatomic,strong) UIButton *sectionChooseBtn;//头部section选中按钮
@property (nonatomic,strong) UIImageView *shopImgView;//店铺logo
@property (nonatomic,strong) UILabel *shopNameLab;//店铺名称lab
@property (nonatomic,strong) UIButton *jumpShopBtn;//跳转店铺btn

@property (nonatomic,strong) UIView *secondView;//店铺设置促销优惠时，才会显示
@property (nonatomic,strong) UILabel *cuXiaoLab;//促销lab
@property (nonatomic,strong) UILabel *couponLab;//具体优惠lab
@property (nonatomic,strong) UIButton *couDanBtn;//凑单按钮
@end

@implementation NMShopCartSectionHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if(self = [super initWithReuseIdentifier:reuseIdentifier]){
        
        
    }
    return self;
}

- (void)refreshIsHave:(BOOL)isHave{

    [self firstView];
    [self.sectionChooseBtn setImage:[UIImage imageNamed:@"car_chooseNormal"] forState:UIControlStateNormal];
    [self.sectionChooseBtn setImage:[UIImage imageNamed:@"car_chooseSelect"] forState:UIControlStateSelected];
    [self.shopImgView setImage:[UIImage imageNamed:@"car_ShopImg"]];
    [self.shopNameLab setText:@"水电费很快就"];
    [self.jumpShopBtn setImage:[UIImage imageNamed:@"car_ArrowGray"] forState:UIControlStateNormal];
    
    if (isHave) {
    
        [self secondView];
        [self.cuXiaoLab setText:@"促销"];
        [self.couponLab setText:@"在山东路附近减200元"];
        [self.couDanBtn setImage:[UIImage imageNamed:@"car_ArrowRed"] forState:UIControlStateNormal];
        [self.couDanBtn setTitle:@"凑单" forState:UIControlStateNormal];
        [self.couDanBtn setLeftTextAndRightPictureWithSpace:2.0];
    }
}



#pragma mark -- 创建共有视图
- (UIView *)firstView{
    
    if (!_firstView) {
        
        UIView *firstView = [[UIView alloc] init];
        firstView.backgroundColor = NMWhiteC;
        [self addSubview:firstView];
        _firstView = firstView;
        
        [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self);
            make.height.equalTo(@(NM44));
        }];
    }
    return _firstView;
}

#pragma mark -- 选中按钮
- (UIButton *)sectionChooseBtn{
    
    if (!_sectionChooseBtn) {
        
        CGFloat width = 32.0;
        UIButton *sectionChooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sectionChooseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [sectionChooseBtn addTarget:self action:@selector(chooseGoodAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.firstView addSubview:sectionChooseBtn];
        _sectionChooseBtn = sectionChooseBtn;
        [sectionChooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self.firstView);
            make.width.equalTo(@(width));
        }];
    }
    return _sectionChooseBtn;
}

#pragma mark -- 店铺logo
- (UIImageView *)shopImgView{
    if (!_shopImgView) {
        
        //店铺图片
        UIImageView *shopImgView = [[UIImageView alloc] init];
        shopImgView.contentMode = UIViewContentModeLeft;
        [self.firstView addSubview:shopImgView];
        _shopImgView = shopImgView;
        [shopImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.firstView.mas_centerY);
            make.left.equalTo(self.sectionChooseBtn.mas_right).offset(NM5);
        }];
    }
    return _shopImgView;
}

#pragma mark -- 店铺名称lab
- (UILabel *)shopNameLab{
    
    if (!_shopNameLab) {
        
        //配送方式lab
        UILabel *shopNameLab = [[UILabel alloc] init];
        shopNameLab.font = NMSystemFont(12);
        shopNameLab.textColor = NM333333;
        [self addSubview:shopNameLab];
        _shopNameLab = shopNameLab;
        [shopNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.shopImgView.mas_right).offset(NM5);
            make.centerY.equalTo(self.firstView.mas_centerY);
        }];
    }
    return _shopNameLab;
}

#pragma mark -- 跳转到店铺
- (UIButton *)jumpShopBtn{
    
    if (!_jumpShopBtn) {
        
        CGFloat width = 30.0;
        UIButton *jumpShopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [jumpShopBtn addTarget:self action:@selector(jumpShopAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.firstView addSubview:jumpShopBtn];
        _jumpShopBtn = jumpShopBtn;
        [jumpShopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.shopNameLab.mas_right);
            make.top.bottom.equalTo(self.firstView);
            make.width.equalTo(@(width));
        }];
    }
    return _jumpShopBtn;
}

#pragma mark -- 创建共有视图
- (UIView *)secondView{
    
    if (!_secondView) {
        
        UIView *secondView = [[UIView alloc] init];
        secondView.backgroundColor = NMfbf9f7;
        [self addSubview:secondView];
        _secondView = secondView;
        [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self);
            make.height.equalTo(@(NM44));
        }];
    }
    return _secondView;
}

#pragma mark -- 促销按钮
- (UILabel *)cuXiaoLab{
    
    if (!_cuXiaoLab) {
        
        CGFloat left = 32.0 + 5.0;
        CGFloat width = 30.0;
        CGFloat height = 15.0;
        UILabel *cuXiaoLab = [[UILabel alloc] init];
        cuXiaoLab.textAlignment = NSTextAlignmentCenter;
        cuXiaoLab.textColor = NMf10215;
        cuXiaoLab.font = NMSystemFont(10);
        [self.secondView addSubview:cuXiaoLab];
        _cuXiaoLab = cuXiaoLab;
        [cuXiaoLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.secondView.mas_left).offset(left);
            make.centerY.equalTo(self.secondView.mas_centerY);
            make.width.equalTo(@(width));
            make.height.equalTo(@(height));
        }];
        //设置圆角带边框
        [_cuXiaoLab setBorderWidth:1.0 BorderColor:NMf10215 CornerRadius:5.0];
    }
    return _cuXiaoLab;
}

#pragma mark -- 促销具体优惠按钮
- (UILabel *)couponLab{
    
    if (!_couponLab) {
        
        UILabel *couponLab = [[UILabel alloc] init];
        couponLab.textColor = NM999999;
        couponLab.font = NMSystemFont(11);
        [self.secondView addSubview:couponLab];
        _couponLab  = couponLab;
        [couponLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cuXiaoLab.mas_right).offset(NM5);
            make.centerY.equalTo(self.secondView.mas_centerY);
        }];
    }
    return _couponLab;
}

#pragma mark -- 跳转到店铺
- (UIButton *)couDanBtn{
    
    if (!_couDanBtn) {
        
        CGFloat width = 40.0;
        UIButton *couDanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        couDanBtn.titleLabel.font = NMSystemFont(11);
        [couDanBtn setTitleColor:NMf10215 forState:UIControlStateNormal];
        [couDanBtn addTarget:self action:@selector(couDanAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.secondView addSubview:couDanBtn];
        _couDanBtn = couDanBtn;
        [couDanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.secondView.mas_right).offset(-NM15);
            make.top.bottom.equalTo(self.secondView);
            make.width.equalTo(@(width));
        }];
    }
    return _couDanBtn;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
