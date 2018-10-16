//
//  NMShopCartTableViewCell.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMShopCartTableViewCell.h"

@implementation NMShopCartTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [_selectStyleBtn setLeftTextAndRightPictureWithSpace:2.0];
}

- (IBAction)chooseAction:(id)sender {

}
- (IBAction)selectStyleAction:(id)sender {
    
}
- (IBAction)subtractAction:(id)sender {
    
}
- (IBAction)addAction:(id)sender {
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
