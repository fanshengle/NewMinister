//
//  NMMineHeaderView.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/4.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NMMineOrderListView.h"
#import "NMMineUserMsgView.h"

@interface NMMineHeaderView : UIView

@property (nonatomic,strong) UIImageView *backImgView;
@property (nonatomic,strong) NMMineUserMsgView *userMsgView;
@property (nonatomic,strong) NMMineOrderListView *orderListView;


@end
