//
//  NMShopCartBottomView.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMShopCartBottomView : UIView

@property (nonatomic,strong) UIButton *allChooseBtn;//全选按钮

@property (nonatomic,strong) UILabel *allChooseLab;//全选lab
@property (nonatomic,strong) UILabel *combinedLab;//合计金额
@property (nonatomic,strong) UILabel *priceLab;//具体金额

@property (nonatomic,strong) UIButton *goSettleBtn;//去结算按钮

@property (nonatomic,copy) void(^GoSettleClickBlock)(void);

- (void)refresh;

@end
