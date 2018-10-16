//
//  NMPayWayTableViewCell.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/13.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NMPayWayModel.h"

typedef void (^ChoosePayWayBlock)(UIButton *btn);
@interface NMPayWayTableViewCell : UITableViewCell

@property (nonatomic,strong) NMPayWayModel *model;
@property (nonatomic,copy) ChoosePayWayBlock payWayBlock;
@end
