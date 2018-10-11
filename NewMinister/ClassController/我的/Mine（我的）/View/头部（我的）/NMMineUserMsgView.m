//
//  NMMineUserMsgView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/4.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMineUserMsgView.h"

@interface NMMineUserMsgView()

@end

@implementation NMMineUserMsgView

- (instancetype)init{
    
    if(self = [super init]){
        
        [self userContentBtn];
        [self userFocusBtn];
        [self userFansBtn];
        [self userLogoImgView];
        [self userLoginBtn];
        [self userDescribeLab];
    }
    return self;
}

- (UIImageView *)userLogoImgView{
    
    if (!_userLogoImgView) {
        
        UIImageView *userLogoImgView = [[UIImageView alloc] init];
        userLogoImgView.contentMode = UIViewContentModeCenter;
        userLogoImgView.image = [UIImage imageNamed:@"myUserLogo_Not"];
        [self addSubview:userLogoImgView];
        [userLogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(NM15);
            make.bottom.equalTo(self.userContentBtn.mas_top).offset(-NM15);
            make.height.width.equalTo(@(NM60));
        }];
        _userLogoImgView = userLogoImgView;
    }
    return _userLogoImgView;
}

- (UIButton *)userLoginBtn{
    
    if (!_userLoginBtn) {
        
        UIButton *userLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [userLoginBtn setTitle:@"登录/注册" forState:UIControlStateNormal];
        [userLoginBtn setTitleColor:NMWhiteC forState:UIControlStateNormal];
        [userLoginBtn.titleLabel setFont:NMSystemFont(20)];
        [self addSubview:userLoginBtn];
        [userLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.userLogoImgView.mas_right).offset(NM10);
            make.top.equalTo(self.userLogoImgView).offset(NM5);
        }];
        _userLoginBtn = userLoginBtn;
    }
    return _userLoginBtn;
}

- (UILabel *)userDescribeLab{
    
    if (!_userDescribeLab) {
        
        UILabel *userDescribeLab = [[UILabel alloc] init];
        userDescribeLab.text = @"我是一个好人来的";
        userDescribeLab.textColor = NMWhiteC;
        userDescribeLab.textAlignment = NSTextAlignmentLeft;
        userDescribeLab.font = NMSystemFont(12);
        [self addSubview:userDescribeLab];
        [userDescribeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.userLoginBtn);
            make.bottom.equalTo(self.userLogoImgView).offset(-NM5);
        }];
        _userDescribeLab = userDescribeLab;
    }
    return _userDescribeLab;
}

- (UIButton *)userContentBtn{
    
    if (!_userContentBtn) {
        
        UIButton *userContentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        userContentBtn.backgroundColor = NMBlueC;
        [userContentBtn setTitle:@" 0人\n内容" forState:UIControlStateNormal];
        [userContentBtn setTitleColor:NMWhiteC forState:UIControlStateNormal];
        [userContentBtn.titleLabel setFont:NMSystemFont(15)];
        userContentBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        userContentBtn.titleLabel.numberOfLines = 2;
        [self addSubview:userContentBtn];
        [userContentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(NM44);
            make.bottom.equalTo(self.mas_bottom).offset(-NM15);
            make.height.width.equalTo(@(NM40));
        }];
        _userContentBtn = userContentBtn;
    }
    return _userContentBtn;
}

- (UIButton *)userFocusBtn{
    
    if (!_userFocusBtn) {
        
        UIButton *userFocusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        userFocusBtn.backgroundColor = NMBlueC;
        [userFocusBtn setTitle:@" 0人\n关注" forState:UIControlStateNormal];
        [userFocusBtn setTitleColor:NMWhiteC forState:UIControlStateNormal];
        userFocusBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        userFocusBtn.titleLabel.numberOfLines = 2;
        [userFocusBtn.titleLabel setFont:NMSystemFont(15)];
        [self addSubview:userFocusBtn];
        [userFocusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self);
            make.top.bottom.width.equalTo(self.userContentBtn);
        }];
        _userFocusBtn = userFocusBtn;
    }
    return _userFocusBtn;
}

- (UIButton *)userFansBtn{
    
    if (!_userFansBtn) {
        
        UIButton *userContentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        userContentBtn.backgroundColor = NMBlueC;
        [userContentBtn setTitle:@" 0人\n粉丝" forState:UIControlStateNormal];
        [userContentBtn setTitleColor:NMWhiteC forState:UIControlStateNormal];
        [userContentBtn.titleLabel setFont:NMSystemFont(15)];
        userContentBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        userContentBtn.titleLabel.numberOfLines = 2;
        [self addSubview:userContentBtn];
        [userContentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self).offset(-NM44);
            make.top.bottom.width.equalTo(self.userContentBtn);
        }];
        _userContentBtn = userContentBtn;
    }
    return _userFansBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@end
