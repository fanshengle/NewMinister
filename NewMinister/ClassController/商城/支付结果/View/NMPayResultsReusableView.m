//
//  NMPayResultsReusableView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/16.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMPayResultsReusableView.h"


@interface NMPayResultsReusableView()

@property (nonatomic,strong) UIButton *backHomeBtn;//返回商城首页按钮
@property (nonatomic,strong) UIButton *lookOrderBtn;//查看订单按钮
@property (nonatomic,strong) UILabel *describeLab;//描述展示
@property (nonatomic,strong) UILabel *payResultsLab;//支付成功lab
@property (nonatomic,strong) UIImageView *payResultsImg;//支付img

@property (nonatomic,strong) UIView *secondView;//第二部分，随便看看视图

@end

@implementation NMPayResultsReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = NMWhiteC;
    }
    return self;
}

- (void)refresh{
    
    [self.payResultsImg setImage:[UIImage imageNamed:@"car_paySuccess"]];
    self.payResultsLab.text = @"支付成功";
    NSString *labelText = @"我们将尽快发货,请卖家随时保持手机通讯畅通,方便快递小哥联系您";
//    NSString *labelText = @"请在24小时内完成支付\n否则订单将会被系统取消";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [paragraphStyle setLineSpacing:10];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.describeLab.attributedText = attributedString;

    [self.backHomeBtn setTitle:@"返回首页" forState:UIControlStateNormal];
    [self.lookOrderBtn setTitle:@"查看订单" forState:UIControlStateNormal];
    
    //添加第二部分视图
    [self secondView];
    //设置按钮图片与文字的间距
//    [_lookBtn setLeftPictureAndRightTextWithSpace:5];
}

#pragma mark -- 支付结果图片（失败、成功）
- (UIImageView *)payResultsImg{
    if (!_payResultsImg) {
        
        CGFloat width = 75.0;
        
        UIImageView *payResultsImg = [[UIImageView alloc] init];
        [self addSubview:payResultsImg];
        _payResultsImg = payResultsImg;
        [payResultsImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(NM20);
            make.centerX.equalTo(self.mas_centerX);
            make.width.height.equalTo(@(width));
        }];
    }
    return _payResultsImg;
}

#pragma mark -- 支付结果lab（失败、成功）
- (UILabel *)payResultsLab{
    
    if (!_payResultsLab) {
        
        UILabel *payResultsLab = [[UILabel alloc] init];
        payResultsLab.textColor = NMf10215;
        payResultsLab.textAlignment = NSTextAlignmentCenter;
        payResultsLab.font = NMSystemFont(15);
        [self addSubview:payResultsLab];
        _payResultsLab = payResultsLab;
        [payResultsLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(self.payResultsImg.mas_bottom).offset(NM5);
        }];
    }
    return _payResultsLab;
}

#pragma mark -- 描述支付结果lab
- (UILabel *)describeLab{
    
    if (!_describeLab) {
        
        CGFloat left = NM55;
        UILabel *describeLab = [[UILabel alloc] init];
        describeLab.textColor = NM666666;
        describeLab.textAlignment = NSTextAlignmentCenter;
        describeLab.font = NMSystemFont(13);
        describeLab.numberOfLines = 2;
        [self addSubview:describeLab];
        _describeLab = describeLab;
        [describeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(left);
            make.right.equalTo(self.mas_right).offset(-left);
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(self.payResultsLab.mas_bottom).offset(NM15);
        }];
    }
    return _describeLab;
}

#pragma mark -- 返回按钮
- (UIButton *)backHomeBtn{
    
    if (!_backHomeBtn) {
        
        CGFloat width = NM110;
        CGFloat height = NM35;
        UIButton *backHomeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backHomeBtn setTitle:@"返回首页" forState:UIControlStateNormal];
        [backHomeBtn setTitleColor:NMf10215 forState:UIControlStateNormal];
        [backHomeBtn.titleLabel setFont:NMSystemFont(14)];
        [self addSubview:backHomeBtn];
        _backHomeBtn = backHomeBtn;
        [backHomeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.describeLab.mas_left);
            make.top.equalTo(self.describeLab.mas_bottom).offset(NM15);
            make.width.equalTo(@(width));
            make.height.equalTo(@(height));
        }];
        
        //设置圆角
        [_backHomeBtn setBorderWidth:1.0 BorderColor:NMf10215 CornerRadius:5.0];
    }
    return _backHomeBtn;
}

#pragma mark -- 查看订单按钮
- (UIButton *)lookOrderBtn{
    
    if (!_lookOrderBtn) {
        
        UIButton *lookOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [lookOrderBtn setTitle:@"查看订单" forState:UIControlStateNormal];
        [lookOrderBtn setTitleColor:NM666666 forState:UIControlStateNormal];
        [lookOrderBtn.titleLabel setFont:NMSystemFont(14)];
        [self addSubview:lookOrderBtn];
        _lookOrderBtn = lookOrderBtn;
        [lookOrderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self.describeLab.mas_right);
            make.top.bottom.width.equalTo(self.backHomeBtn);
        }];
        //设置圆角
        [_lookOrderBtn setBorderWidth:1.0 BorderColor:NM999999 CornerRadius:5.0];
    }
    return _lookOrderBtn;
}


#pragma mark -- 创建随便看看视图
- (UIView *)secondView{
    
    if (!_secondView) {
        
        UIView *secondView = [[UIView alloc] init];
        [self addSubview:secondView];
        _secondView = secondView;
        [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self);
            make.height.equalTo(@(NM35));
        }];
        
        //间隔视图
        UIView *spaseView = [[UIView alloc] init];
        spaseView.backgroundColor = NMf4f8fb;
        [_secondView addSubview:spaseView];
        [spaseView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(secondView);
            make.height.equalTo(@(NM7));
        }];
        
        //随便看看视图
        UIView *lookView = [[UIView alloc] init];
        lookView.backgroundColor = NMWhiteC;
        [secondView addSubview:lookView];
        [lookView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(secondView);
            make.top.equalTo(spaseView.mas_bottom);
        }];
        
        //布局子视图
        [self setupSubviewOnLookView:lookView];
    }
    return _secondView;
}


#pragma mark -- 在随便看看视图上布局子控件
- (void)setupSubviewOnLookView:(UIView *)lookView{
    
    //随便看看
    CGFloat looBtnWidth = 80;
    UIButton *lookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    lookBtn.adjustsImageWhenHighlighted = NO;
    [lookBtn setTitle:@"随便看看" forState:UIControlStateNormal];
    [lookBtn setTitleColor:NMf10215 forState:UIControlStateNormal];
    [lookBtn.titleLabel setFont:NMSystemFont(14)];
    [lookBtn setImage:[UIImage imageNamed:@"mall_guessLike"] forState:UIControlStateNormal];
    [lookView addSubview:lookBtn];
    [lookBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(lookView);
        make.width.equalTo(@(looBtnWidth));
    }];
    //设置按钮图片与文字的间距
    [lookBtn setLeftPictureAndRightTextWithSpace:3];
    
    //左划线
    CGFloat width = NM15;
    UIView *leftLine = [[UIView alloc] init];
    leftLine.backgroundColor = NMf10215;
    [lookView addSubview:leftLine];
    [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lookBtn.mas_left).offset(-NM5);
        make.centerY.equalTo(lookView.mas_centerY);
        make.width.equalTo(@(width));
        make.height.equalTo(@(1.0));
    }];
    //右划线
    UIView *rightLine = [[UIView alloc] init];
    rightLine.backgroundColor = NMf10215;
    [lookView addSubview:rightLine];
    [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lookBtn.mas_right).offset(NM5);
        make.centerY.equalTo(lookView.mas_centerY);
        make.width.equalTo(@(width));
        make.height.equalTo(@(1.0));
    }];
    
}
@end
