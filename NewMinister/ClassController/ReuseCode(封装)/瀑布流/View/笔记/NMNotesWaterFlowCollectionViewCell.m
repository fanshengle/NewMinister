//
//  NMNotesWaterFlowCollectionViewCell.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/3.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMNotesWaterFlowCollectionViewCell.h"

@interface NMNotesWaterFlowCollectionViewCell()

@property (nonatomic,assign) CGFloat cellWidth;

@end

@implementation NMNotesWaterFlowCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = NMWhiteC;
        //设置视图阴影
        //[self setShadowColor:NMBlackC Radius:5.0 Offset:CGSizeMake(5, 5) Opacity:0.5 CornerRadius:5.0];
        _cellWidth = frame.size.width;
        [self noteImgView];
        [self noteDescribeLab];
        [self userLogoImgView];
        [self collectBtn];
        [self userNameLab];
    }
    return self;
}

#pragma mark -- 用户头像图片
- (UIImageView *)userLogoImgView{
    
    if (!_userLogoImgView) {
        
        CGFloat width = 21.0;
        UIImageView *userLogoImgView = [[UIImageView alloc]init];
        userLogoImgView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:userLogoImgView];
        [userLogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.bottom.equalTo(self);
            make.width.height.equalTo(@(width));
        }];
        _userLogoImgView = userLogoImgView;
    }
    return _userLogoImgView;
}
//
//#pragma mark -- 用户收藏
//- (UIView *)collectView{
//
//    if (!_collectView) {
//
//        CGFloat width = 60.0;
//        UIView *collectView = [[UIView alloc]init];
//        [self addSubview:collectView];
//        [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.right.equalTo(self.noteImgView.mas_right);
//            make.top.bottom.equalTo(self.userLogoImgView);
//            make.width.equalTo(@(width));
//        }];
//        _collectView = collectView;
//
//        [_collectView addSubview:self.collectImgView];
//    }
//    return _userLogoImgView;
//}
//
//
//#pragma mark -- 用户头像图片
//- (UIImageView *)collectImgView{
//
//    if (!_userLogoImgView) {
//
//        CGFloat width = 21.0;
//        UIImageView *userLogoImgView = [[UIImageView alloc]init];
//        userLogoImgView.contentMode = UIViewContentModeScaleAspectFill;
//        [self addSubview:userLogoImgView];
//        [userLogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.left.equalTo(self.noteDescribeLab);
//            make.top.equalTo(self.noteDescribeLab.mas_bottom).offset(NM10);
//            make.width.height.equalTo(@(width));
//
//        }];
//        _userLogoImgView = userLogoImgView;
//    }
//    return _userLogoImgView;
//}

#pragma mark -- 收藏按钮
- (UIButton *)collectBtn{
    
    if (!_collectBtn) {
        
        CGFloat width = 60.0;
        UIButton *collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [collectBtn setTitleColor:NMf10215 forState:UIControlStateNormal];
        [collectBtn.titleLabel setFont:NMSystemFont(10)];
        [self addSubview:collectBtn];
        [collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self);
            make.top.bottom.equalTo(self.userLogoImgView);
            make.width.equalTo(@(width));
        }];
        _collectBtn = collectBtn;
    }
    return _collectBtn;
}


#pragma mark -- 用户名称
- (UILabel *)userNameLab{
    
    if (!_userNameLab) {
        
        CGFloat jianJu = NM5;
        UILabel *userNameLab = [[UILabel alloc]init];
        userNameLab.textColor = NM333333;
        userNameLab.font = NMSystemFont(11);
        [self addSubview:userNameLab];
        [userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.userLogoImgView.mas_right).offset(jianJu);
            make.right.equalTo(self.collectBtn.mas_left).offset(-jianJu);
            make.top.bottom.equalTo(self.userLogoImgView);
        }];
        _userNameLab = userNameLab;
    }
    return _userNameLab;
}

#pragma mark -- 笔记描述
- (UILabel *)noteDescribeLab{
    
    if (!_noteDescribeLab) {
        
        CGFloat jianJu = 0;
        UILabel *noteDescribeLab = [[UILabel alloc]init];
        noteDescribeLab.numberOfLines = 2;
        noteDescribeLab.textColor = NM333333;
        noteDescribeLab.font = NMSystemFont(12);
        [self addSubview:noteDescribeLab];
        [noteDescribeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(jianJu);
            make.right.equalTo(self).offset(-jianJu);
            make.bottom.equalTo(self.userLogoImgView.mas_top).offset(-NM8);
        }];
        _noteDescribeLab = noteDescribeLab;
    }
    return _noteDescribeLab;
}


#pragma mark -- 笔记图片
- (UIImageView *)noteImgView{
    
    if (!_noteImgView) {
        
        UIImageView *noteImgView = [[UIImageView alloc]init];
        noteImgView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:noteImgView];
        [noteImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.top.right.equalTo(self);
            make.bottom.equalTo(self.noteDescribeLab.mas_top).offset(-NM8);
        }];
        _noteImgView = noteImgView;
    }
    return _noteImgView;
}


@end
