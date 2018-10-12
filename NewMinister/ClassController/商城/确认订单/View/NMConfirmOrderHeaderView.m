//
//  NMConfirmOrderHeaderView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMConfirmOrderHeaderView.h"

@interface NMConfirmOrderHeaderView()

@end

@implementation NMConfirmOrderHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        self.backgroundColor = NMWhiteC;
    }
    return self;
}

#pragma mark -- 店铺logo
- (UIImageView *)shopImgView{
    if (!_shopImgView) {
        
        //店铺图片
        UIImageView *shopImgView = [[UIImageView alloc] init];
        shopImgView.contentMode = UIViewContentModeLeft;
        shopImgView.image = [UIImage imageNamed:@"car_ShopImg"];
        [self addSubview:shopImgView];
        _shopImgView = shopImgView;
        [shopImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.mas_centerY);
            make.left.equalTo(self.mas_left).offset(NM15);
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
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
    return _shopNameLab;
}


- (void)refresh{
    
    [_shopNameLab setText:@"周丽店"];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
