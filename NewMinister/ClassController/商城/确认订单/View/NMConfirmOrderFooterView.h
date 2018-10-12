//
//  NMConfirmOrderFooterView.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMConfirmOrderFooterView : UIView


@property (strong, nonatomic) IBOutlet UIView *couponView;
@property (strong, nonatomic) IBOutlet UIButton *chooseBtn;
@property (strong, nonatomic) IBOutlet UILabel *couponLab;
@property (strong, nonatomic) IBOutlet UILabel *preferentialLab;
@property (strong, nonatomic) IBOutlet UILabel *freightLab;
@property (strong, nonatomic) IBOutlet UILabel *totalCountLab;
@property (strong, nonatomic) IBOutlet UILabel *combinedLab;

- (void)refresh;

@end
