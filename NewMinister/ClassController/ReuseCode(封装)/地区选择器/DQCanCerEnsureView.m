//
//  DQCanCerEnsureView.m
//  YBCommunity
//
//  Created by DQ on 16/9/8.
//  Copyright © 2016年 com.NiceMoment. All rights reserved.
//
#define HEX_COLOR(x_RGB) [UIColor colorWithRed:((float)((x_RGB & 0xFF0000) >> 16))/255.0 green:((float)((x_RGB & 0xFF00) >> 8))/255.0 blue:((float)(x_RGB & 0xFF))/255.0 alpha:1.0f]

#import "DQCanCerEnsureView.h"

@interface DQCanCerEnsureView ()

@property (nonatomic, strong) UILabel *titleLb;

@end
@implementation DQCanCerEnsureView

- (id)init{
    if (self=[super init]) {
        
        self.backgroundColor = HEX_COLOR(0xF2F2F2);
        [self creadtionAllSubView];

    }
    return self;
}

- (void)creadtionAllSubView{
    UIView *Sub = self;
    UIButton *CanCerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _titleLb = [UILabel new];
    UIButton *EnsureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [Sub addSubview:CanCerBtn];
    [Sub addSubview:_titleLb];
    [Sub addSubview:EnsureBtn];
    CanCerBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [CanCerBtn setTitle:@"取消" forState:UIControlStateNormal];
    [CanCerBtn setTitleColor:HEX_COLOR(0x666666) forState:UIControlStateNormal];
    [CanCerBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    EnsureBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [EnsureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [EnsureBtn setTitleColor:HEX_COLOR(0x666666) forState:UIControlStateNormal];
    [EnsureBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    _titleLb.font = [UIFont systemFontOfSize:17];
    _titleLb.textColor = HEX_COLOR(0x333333);
    _titleLb.textAlignment = NSTextAlignmentCenter;
    
    [CanCerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Sub.mas_left).offset(17);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(40);
        make.centerY.equalTo(Sub.mas_centerY);
        
    }];
    
    [EnsureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(Sub.mas_right).offset(-17);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(40);
        make.centerY.equalTo(Sub.mas_centerY);
        
    }];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(166);
        make.height.mas_equalTo(17);
        make.center.equalTo(Sub);
        
    }];
    [CanCerBtn addTarget:self action:@selector(ClickCancerAction:) forControlEvents:UIControlEventTouchUpInside];
    [EnsureBtn addTarget:self action:@selector(clickEnsureAction:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)setTitleText:(NSString *)title{

    _titleLb.text = title;
}
- (void)ClickCancerAction:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(ClickCancerDelegateFunction)]) {
        [self.delegate ClickCancerDelegateFunction];
    }

}
- (void)clickEnsureAction:(UIButton *)sender{
   
    if ([self.delegate respondsToSelector:@selector(ClickEnsureDelegateFunction)]) {
        [self.delegate ClickEnsureDelegateFunction];
    }

}
@end
