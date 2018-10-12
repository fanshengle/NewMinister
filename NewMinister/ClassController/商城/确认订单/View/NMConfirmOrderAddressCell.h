//
//  NMConfirmOrderAddressCell.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMConfirmOrderAddressCell : UITableViewCell

@property (nonatomic,strong) UIImageView *noLeftImgView;//没有地址视图的左边img
@property (nonatomic,strong) UILabel *noAddAdressLab;//添加地址lab


@property (nonatomic,strong) UILabel *userNameLab;//收货人lab
@property (nonatomic,strong) UILabel *userPhoneLab;//电话号码lab
@property (nonatomic,strong) UILabel *addressLab;//收货地址lab
@property (nonatomic,strong) UIImageView *locationImgView;//定位图标



@property (nonatomic,strong) UIImageView *arrowIconImgView;//共有箭头img

@end
