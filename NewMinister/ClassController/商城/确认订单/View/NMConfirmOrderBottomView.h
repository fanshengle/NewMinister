//
//  NMConfirmOrderBottomView.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef void (^BuyNowClickBlock)(NSInteger price);

@interface NMConfirmOrderBottomView : UIView

@property (nonatomic,strong) UILabel *combinedLab;//合计金额
@property (nonatomic,strong) UILabel *priceLab;//具体金额

@property (nonatomic,strong) UIButton *buyNowBtn;//立即购买

@property (nonatomic,copy) void(^BuyNowClickBlock)(NSInteger price);//立即购买按钮（点击传参回调）

@end
