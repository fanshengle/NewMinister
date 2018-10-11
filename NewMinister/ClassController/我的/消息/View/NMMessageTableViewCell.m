//
//  NMMessageTableViewCell.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/10.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMessageTableViewCell.h"

@interface NMMessageTableViewCell()

@property (nonatomic,strong) UIImageView *leftImgView;//名称左边图片
@property (nonatomic,strong) UILabel *listNameLab;//列表名称lab
@property (nonatomic,strong) UIImageView *rightArrowImgView;//右箭头图片

@property (nonatomic,strong) UILabel *tongZhiNameLab;//通知名称lab
@property (nonatomic,strong) UILabel *tongZhiContentLab;//通知内容lab

@property (nonatomic,strong) UILabel *countLab;//数量lab
@property (nonatomic,strong) UILabel *timeLab;//小红点lab
@property (nonatomic,strong) UILabel *tongZhiredDotLab;//小红点lab

@property (nonatomic,strong) UILabel *siXinRedDotLab;//私信的小红点lab

@end

@implementation NMMessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}


- (void)setModel:(NMMessageModel *)model{
    _model = model;
    
    [self.leftImgView setImage:[UIImage imageNamed:_model.titleIcon]];
    
    if (_model.time == nil || [_model.time isEqualToString:@""]) {//其他cell
        self.listNameLab.text = _model.titleText;

        if ([_model.count isEqualToString:@"0"] || _model.count == nil) {
            
            [self.rightArrowImgView setImage:[UIImage imageNamed:_model.arrowIcon]];
        }else{//数字lab
            
            self.countLab.text = _model.count;
        }
    }else{//通知的cell
        
        self.tongZhiNameLab.text = _model.titleText;
        self.tongZhiContentLab.text = _model.TongZhiContent;
        self.timeLab.text = _model.time;
        [self tongZhiredDotLab];
    }
    
    if ([_model.isMsg isEqualToString:@"YES"]) {//私信
        
        [self siXinRedDotLab];
    }
}

#pragma mark -- 左边图片
- (UIImageView *)leftImgView{
    if (!_leftImgView) {
        
        CGFloat width = 40.0;
        UIImageView *leftImgView = [[UIImageView alloc] init];
        [self addSubview:leftImgView];
        [leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(NM15);
            make.centerY.equalTo(self.mas_centerY);
            make.width.height.equalTo(@(width));
        }];
        _leftImgView = leftImgView;
    }
    return _leftImgView;
}

#pragma mark -- 列表名称lab
- (UILabel *)listNameLab{
    if (!_listNameLab) {
        
        UILabel *listNameLab = [[UILabel alloc] init];
        listNameLab.textColor = NM333333;
        listNameLab.font = NMSystemFont(14);
        [self addSubview:listNameLab];
        [listNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftImgView.mas_right).offset(NM15);
            make.centerY.equalTo(self.mas_centerY);
        }];
        _listNameLab = listNameLab;
    }
    return _listNameLab;
}

#pragma mark -- 右边箭头图片(默认显示，有消息了隐藏)
- (UIImageView *)rightArrowImgView{
    if (!_rightArrowImgView) {
        
        UIImageView *rightArrowImgView = [[UIImageView alloc] init];
        [self addSubview:rightArrowImgView];
        [rightArrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-NM15);
            make.centerY.equalTo(self.mas_centerY);
        }];
        _rightArrowImgView = rightArrowImgView;
    }
    return _rightArrowImgView;
}

#pragma mark -- 数量lab（有消息了显示，默认是隐藏的）
- (UILabel *)countLab{
    if (!_countLab) {
        
        CGFloat width = NM10;
        UILabel *countLab = [[UILabel alloc] init];
        countLab.backgroundColor = NMf10215;
        countLab.textColor = NMWhiteC;
        countLab.font = NMSystemFont(8);
        countLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:countLab];
        [countLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-NM15);
            make.centerY.equalTo(self.mas_centerY);
            make.width.height.equalTo(@(width));
        }];
        _countLab = countLab;
        //设置圆角
        [_countLab setCornerRadius:width/2.0];
    }
    return _countLab;
}


#pragma mark ---------通知cell独有控件

#pragma mark -- 通知名称lab
- (UILabel *)tongZhiNameLab{
    if (!_tongZhiNameLab) {
        
        UILabel *tongZhiNameLab = [[UILabel alloc] init];
        tongZhiNameLab.textColor = NM333333;
        tongZhiNameLab.font = NMSystemFont(14);
        [self addSubview:tongZhiNameLab];
        [tongZhiNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftImgView.mas_right).offset(NM15);
            make.top.equalTo(self.leftImgView);
        }];
        _tongZhiNameLab = tongZhiNameLab;
    }
    return _tongZhiNameLab;
}

#pragma mark -- 通知内容lab
- (UILabel *)tongZhiContentLab{
    if (!_tongZhiContentLab) {
        
        UILabel *tongZhiContentLab = [[UILabel alloc] init];
        tongZhiContentLab.textColor = NM999999;
        tongZhiContentLab.font = NMSystemFont(12);
        [self addSubview:tongZhiContentLab];
        [tongZhiContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftImgView.mas_right).offset(NM15);
            make.bottom.equalTo(self.leftImgView);
        }];
        _tongZhiContentLab = tongZhiContentLab;
    }
    return _tongZhiContentLab;
}

#pragma mark -- 时间lab（有消息了显示，默认是隐藏的）
- (UILabel *)timeLab{
    if (!_timeLab) {
        
        UILabel *timeLab = [[UILabel alloc] init];
        timeLab.textAlignment = NSTextAlignmentRight;
        timeLab.textColor = NM999999;
        timeLab.font = NMSystemFont(12);
        [self addSubview:timeLab];
        [timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-NM15);
            make.centerY.equalTo(self.tongZhiNameLab.mas_centerY);
        }];
        _timeLab = timeLab;
    }
    return _timeLab;
}

#pragma mark -- 通知小红点lab（有消息了显示，默认是隐藏的）
- (UILabel *)tongZhiredDotLab{
    if (!_tongZhiredDotLab) {
        
        CGFloat width = 7.0;
        UILabel *tongZhiredDotLab = [[UILabel alloc] init];
        tongZhiredDotLab.backgroundColor = NMf10215;
        [self addSubview:tongZhiredDotLab];
        [tongZhiredDotLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-NM15);
            make.centerY.equalTo(self.tongZhiContentLab.mas_centerY);
            make.width.height.equalTo(@(width));
        }];
        _tongZhiredDotLab = tongZhiredDotLab;
        //设置圆角
        [_tongZhiredDotLab setCornerRadius:width/2.0];
    }
    return _tongZhiredDotLab;
}


#pragma mark -----------私信独有
#pragma mark -- 私信小红点lab（有消息了显示，默认是隐藏的）
- (UILabel *)siXinRedDotLab{
    if (!_siXinRedDotLab) {
        
        CGFloat width = 7.0;
        UILabel *siXinRedDotLab = [[UILabel alloc] init];
        siXinRedDotLab.backgroundColor = NMf10215;
        [self addSubview:siXinRedDotLab];
        [siXinRedDotLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.rightArrowImgView.mas_left).offset(-NM5);
            make.centerY.equalTo(self.mas_centerY);
            make.width.height.equalTo(@(width));
        }];
        _siXinRedDotLab = siXinRedDotLab;
        //设置圆角
        [_siXinRedDotLab setCornerRadius:width/2.0];
    }
    return _siXinRedDotLab;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
