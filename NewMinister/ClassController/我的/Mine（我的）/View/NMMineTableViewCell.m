//
//  NMMineTableViewCell.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/4.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMineTableViewCell.h"

@interface NMMineTableViewCell()

@property (nonatomic, strong) UIImageView *titleIcon;//标题图标
@property (nonatomic, strong) UILabel *titleLbl;//标题
@property (nonatomic, strong) UILabel *detaileLbl;//内容
@property (nonatomic, strong) UIImageView *arrowIcon;//右箭头图标

@end
@implementation NMMineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    
    }
    return self;
}

- (void)setModel:(NMMineModel *)model{
    if (model) {
        _model = model;
        
        [self.titleIcon setImage:[UIImage imageNamed:_model.titleIcon]];
        
        self.titleLbl.text = _model.titleText;
        
        [self.arrowIcon setImage:[UIImage imageNamed:_model.arrowIcon]];
    }
}

- (UIImageView *)titleIcon{
    if (!_titleIcon) {
        
        _titleIcon = [UIImageView new];
        [self addSubview:_titleIcon];
        [_titleIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(NM30);
            make.centerY.equalTo(self);
        }];
    }
    return _titleIcon;
}

- (UILabel *)titleLbl{
    
    if (!_titleLbl) {
        _titleLbl = [UILabel new];
        _titleLbl.font = NMSystemFont(15);
        _titleLbl.textColor = NM333333;
        [self addSubview:_titleLbl];
        [_titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleIcon.mas_right).offset(NM10);
            make.centerY.equalTo(self);
        }];
    }
    return _titleLbl;
}

- (UIImageView *)arrowIcon{
    if (!_arrowIcon) {
        
        _arrowIcon = [UIImageView new];
        [self addSubview:_arrowIcon];
        [_arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-NM30);
            make.centerY.equalTo(self);
        }];
    }
    return _arrowIcon;
}

//- (UILabel *)detaileLbl{
//    if (!_detaileLbl) {
//        _detaileLbl = [UILabel new];
//        _detaileLbl.font = NMSystemFont(12);
//        _detaileLbl.textColor = NMGrayC;
//        _detaileLbl.textAlignment = NSTextAlignmentRight;
//        [self addSubview:_detaileLbl];
//
//        [_detaileLbl mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.titleLbl.mas_right).offset(NM10);
//            make.centerY.equalTo(self);
//            make.right.equalTo(self.arrowIcon.mas_left).offset(-NM10);
//        }];
//    }
//    return _detaileLbl;
//}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
