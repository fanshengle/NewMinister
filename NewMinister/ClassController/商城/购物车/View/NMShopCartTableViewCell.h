//
//  NMShopCartTableViewCell.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMShopCartTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIButton *chooseBtn;
@property (strong, nonatomic) IBOutlet UIImageView *goodImgView;
@property (strong, nonatomic) IBOutlet UILabel *goodNameLab;
@property (strong, nonatomic) IBOutlet UIButton *selectStyleBtn;
@property (strong, nonatomic) IBOutlet UILabel *priceLab;

@property (strong, nonatomic) IBOutlet UIView *countView;
@property (strong, nonatomic) IBOutlet UIButton *subtractBtn;
@property (strong, nonatomic) IBOutlet UIButton *addBtn;
@property (strong, nonatomic) IBOutlet UITextField *countTxtField;

@end
