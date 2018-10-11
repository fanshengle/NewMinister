//
//  SectionHeadReusableView.m
//  SlowPurchase
//
//  Created by admin on 17/4/17.
//  Copyright © 2017年 housheng. All rights reserved.
//

#import "SearchReusableView.h"

@implementation SearchReusableView

- (id) initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat left = 0;
        _searchNameLab = [[UILabel alloc] init];
        _searchNameLab.textColor = NM333333;
        _searchNameLab.font = NMBoldSystemFont(14);
        [self addSubview:_searchNameLab];
        [_searchNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(left);
            make.top.bottom.equalTo(self);
        }];
        
        CGFloat right = 0;
        CGFloat width = 30.0f;
        //CGFloat height = self.height;
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteBtn setImage:[UIImage imageNamed:@"search_empty"] forState:UIControlStateNormal];
        [self addSubview:_deleteBtn];
        [_deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-right);
            make.top.bottom.equalTo(self);
            make.width.equalTo(@(width));
        }];
        
        [_deleteBtn addTarget:self action:@selector(deleteAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark -- 清空历史记录数据按钮
- (void)deleteAction:(id)sender{
    
    if ([self.deleteDelegate respondsToSelector:@selector(deleteData:)]) {
        [self.deleteDelegate deleteData:self];
    }
}

- (void)setText:(NSString *)text{
    
    self.searchNameLab.text = text;
}

@end
