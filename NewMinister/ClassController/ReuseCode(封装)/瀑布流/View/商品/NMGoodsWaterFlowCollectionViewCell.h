//
//  NMGoodsWaterFlowCollectionViewCell.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/3.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMGoodsWaterFlowCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *goodImgView;//商品图片
@property (strong, nonatomic) UILabel *goodNameLab;//商品名称
@property (strong, nonatomic) UILabel *goodDescribeLab;//商品描述
@property (strong, nonatomic) UILabel *goodSalePriceLab;//商品卖价
@property (strong, nonatomic) UILabel *goodOrgPriceLab;//商品原价
@property (strong, nonatomic) UILabel *snapUpLab;//限时抢购lab
@property (strong, nonatomic) UILabel *ziYinLab;//自营lab

@end
