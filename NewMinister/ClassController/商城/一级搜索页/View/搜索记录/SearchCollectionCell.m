//
//  SearchCollectionCell.m
//  SlowPurchase
//
//  Created by admin on 17/4/17.
//  Copyright © 2017年 housheng. All rights reserved.
//

#import "SearchCollectionCell.h"

@implementation SearchCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self createLableBtn];
    }
    return self;
}

#pragma mark -- 创建标签按钮
- (void)createLableBtn{

    CGFloat height = self.frame.size.height;
    _contentLab = [[UILabel alloc] init];
    _contentLab.textAlignment = NSTextAlignmentCenter;
    _contentLab.layer.cornerRadius = height/2.0f;
    _contentLab.layer.masksToBounds = YES;
    _contentLab.font = NMSystemFont(13);
    _contentLab.layer.borderWidth = 0.5;
    _contentLab.layer.borderColor = NMf1f1f1.CGColor;
    _contentLab.textColor = NM999999;
    [self.contentView addSubview:_contentLab];
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.contentView);
    }];
}


@end
