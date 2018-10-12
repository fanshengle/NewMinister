//
//  NMConfirmOrderHeaderView.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMConfirmOrderHeaderView : UIView

@property (nonatomic,strong) UIImageView *shopImgView;
@property (nonatomic,strong) UILabel *shopNameLab;

- (void)refresh;
@end
