//
//  NMConfirmOrderFooterView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMConfirmOrderFooterView.h"

@implementation NMConfirmOrderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)refresh{
    
    self.preferentialLab.text = @"-￥100.0";
    self.freightLab.text = @"￥10";
    self.totalCountLab.text = NSStringFormat(@"共%@件商品",@"3");
    self.combinedLab.text = @"￥600.00";
}


- (IBAction)chooseAction:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
