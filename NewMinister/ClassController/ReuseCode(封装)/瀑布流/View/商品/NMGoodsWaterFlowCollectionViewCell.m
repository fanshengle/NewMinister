//
//  NMGoodsWaterFlowCollectionViewCell.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/3.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMGoodsWaterFlowCollectionViewCell.h"

@interface NMGoodsWaterFlowCollectionViewCell()

@property (nonatomic,assign) CGFloat cellWidth;
@end

@implementation NMGoodsWaterFlowCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = NMWhiteC;
        //设置视图阴影
        [self setShadowColor:NMBlackC Radius:5.0 Offset:CGSizeMake(5, 5) Opacity:0.5 CornerRadius:5.0];
        _cellWidth = frame.size.width;
        [self goodImgView];
        [self goodNameLab];
        [self goodDescribeLab];
        [self goodSalePriceLab];
        [self goodOrgPriceLab];
        [self snapUpLab];
        [self ziYinLab];
    }
    return self;
}

#pragma mark -- 商品图片
- (UIImageView *)goodImgView{
    
    if (!_goodImgView) {
        
        UIImageView *goodImgView = [[UIImageView alloc]init];
        goodImgView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:goodImgView];
        [goodImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.top.right.equalTo(self);
            make.height.equalTo(@(self.cellWidth));
        }];
        _goodImgView = goodImgView;
    }
    return _goodImgView;
}

#pragma mark -- 商品名称
- (UILabel *)goodNameLab{
    
    if (!_goodNameLab) {
        
        CGFloat jianJu = NM8;
        UILabel *goodNameLab = [[UILabel alloc]init];
        goodNameLab.textColor = NM333333;
        goodNameLab.font = NMSystemFont(13);
        [self addSubview:goodNameLab];
        [goodNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(jianJu);
            make.right.equalTo(self).offset(-jianJu);
            make.top.equalTo(self.goodImgView.mas_bottom).offset(NM5);
        }];
        _goodNameLab = goodNameLab;
    }
    return _goodNameLab;
}


#pragma mark -- 商品描述
- (UILabel *)goodDescribeLab{
    
    if (!_goodDescribeLab) {
        
        UILabel *goodDescribeLab = [[UILabel alloc]init];
        goodDescribeLab.numberOfLines = 0;
        goodDescribeLab.textColor = NM666666;
        goodDescribeLab.font = NMSystemFont(13);
        [self addSubview:goodDescribeLab];
        [goodDescribeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.right.equalTo(self.goodNameLab);
            make.top.equalTo(self.goodNameLab.mas_bottom).offset(NM8);
        }];
        _goodDescribeLab = goodDescribeLab;
    }
    return _goodDescribeLab;
}

#pragma mark -- 商品卖价
- (UILabel *)goodSalePriceLab{
    
    if (!_goodSalePriceLab) {
        
        UILabel *goodSalePriceLab = [[UILabel alloc]init];
        goodSalePriceLab.textColor = NMf10215;
        goodSalePriceLab.font = NMSystemFont(13);
        [self addSubview:goodSalePriceLab];
        [goodSalePriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.goodNameLab);
            make.top.equalTo(self.goodDescribeLab.mas_bottom).offset(NM8);
        }];
        _goodSalePriceLab = goodSalePriceLab;
    }
    return _goodSalePriceLab;
}

#pragma mark -- 商品原价
- (UILabel *)goodOrgPriceLab{
    
    if (!_goodOrgPriceLab) {
        
        UILabel *goodOrgPriceLab = [[UILabel alloc]init];
        goodOrgPriceLab.textColor = NM999999;
        goodOrgPriceLab.font = NMSystemFont(12);
        [self addSubview:goodOrgPriceLab];
        [goodOrgPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.goodSalePriceLab.mas_right).offset(NM8);
            make.centerY.equalTo(self.goodSalePriceLab.mas_centerY);
        }];
        
        _goodOrgPriceLab = goodOrgPriceLab;
        //在视图中间画线
        [_goodOrgPriceLab drawMiddleLineWithColor:NM333333];
    }
    return _goodOrgPriceLab;
}

#pragma mark -- 限时抢购
- (UILabel *)snapUpLab{
    
    if (!_snapUpLab) {
        
        CGFloat height = 13.0;
        UILabel *snapUpLab = [[UILabel alloc]init];
        snapUpLab.text = @"限时抢购";
        snapUpLab.backgroundColor = NMf10215;
        snapUpLab.textColor = NMWhiteC;
        snapUpLab.font = NMSystemFont(9);
        snapUpLab.textAlignment = NSTextAlignmentCenter;
        //获取字符串的宽度
        CGFloat textWidth = [snapUpLab.text widthForFont:NMSystemFont(9)] + NM10;
        [self addSubview:snapUpLab];
        [snapUpLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.goodNameLab);
            make.top.equalTo(self.goodSalePriceLab.mas_bottom).offset(NM8);
            make.width.equalTo(@(textWidth));
            make.height.equalTo(@(height));
        }];
        _snapUpLab = snapUpLab;
        //设置圆角
        [_snapUpLab setCornerRadius:2.0];
    }
    return _snapUpLab;
}

#pragma mark -- 限时抢购
- (UILabel *)ziYinLab{
    
    if (!_ziYinLab) {
        
        CGFloat height = 13.0;
        UILabel *ziYinLab = [[UILabel alloc]init];
        ziYinLab.text = @"自营";
        ziYinLab.backgroundColor = NMf10215;
        ziYinLab.textColor = NMWhiteC;
        ziYinLab.font = NMSystemFont(9);
        ziYinLab.textAlignment = NSTextAlignmentCenter;
        //获取字符串的宽度
        CGFloat textWidth = [ziYinLab.text widthForFont:NMSystemFont(9)] + NM10;
        [self addSubview:ziYinLab];
        [ziYinLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.snapUpLab.mas_right).offset(NM5);
            make.top.equalTo(self.snapUpLab);
            make.width.equalTo(@(textWidth));
            make.height.equalTo(@(height));
        }];
        _ziYinLab = ziYinLab;
        //设置圆角
        [_ziYinLab setCornerRadius:2.0];
    }
    return _ziYinLab;
}


@end
