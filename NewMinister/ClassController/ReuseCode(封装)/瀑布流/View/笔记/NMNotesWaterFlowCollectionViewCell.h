//
//  NMNotesWaterFlowCollectionViewCell.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/3.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMNotesWaterFlowCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *noteImgView;//笔记图片
@property (strong, nonatomic) UILabel *noteDescribeLab;//笔记描述
@property (strong, nonatomic) UIImageView *userLogoImgView;//用户头像
@property (strong, nonatomic) UILabel *userNameLab;//用户名称

@property (strong, nonatomic) UIView *collectView;//收藏按钮视图
@property (strong, nonatomic) UIImageView *collectImgView;//收藏爱心图标
@property (strong, nonatomic) UILabel *collectCountLab;//收藏数量lab
@property (strong, nonatomic) UIButton *collectBtn;//收藏按钮



@end
