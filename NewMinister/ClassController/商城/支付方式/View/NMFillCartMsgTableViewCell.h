//
//  NMFillCartMsgTableViewCell.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMFillCartMsgModel.h"
@interface NMFillCartMsgTableViewCell : UITableViewCell

@property (nonatomic,strong) NMFillCartMsgModel *model;
@property (nonatomic,strong) UITextField *inputTxtField;
@property (nonatomic,strong) UIButton *allDeleteTextBtn;
@end
