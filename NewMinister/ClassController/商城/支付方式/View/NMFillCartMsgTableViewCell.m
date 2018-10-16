//
//  NMFillCartMsgTableViewCell.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMFillCartMsgTableViewCell.h"

@interface NMFillCartMsgTableViewCell()

@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *contenLab;


@end

@implementation NMFillCartMsgTableViewCell


- (void)setModel:(NMFillCartMsgModel *)model{
    _model = model;
    
    self.titleLab.text = _model.titleText;
    if (_model.cartTypeText.length > 0) {
        
        self.contenLab.text = _model.cartTypeText;
    }else{
        
        [self.allDeleteTextBtn setImage:[UIImage imageNamed:_model.allDeleteIcon] forState:UIControlStateNormal];

        NSString *partStr = _model.placeholderStr;
        NSAttributedString *changeStr = [ToolObject ChangeStr:partStr part:partStr Color:NMf1f1f1];
        self.inputTxtField.attributedPlaceholder = changeStr;
        self.inputTxtField.tag = _model.cellRow;
        [self drawBottomLineWithColor:NMf1f1f1];
    }
}

- (UILabel *)titleLab{
    
    if (!_titleLab) {
        
        //标题lab
        CGFloat width = 43.0;
        UILabel *titleLab = [[UILabel alloc] init];
        titleLab.font = NMSystemFont(14);
        titleLab.textColor = NM333333;
        [self addSubview:titleLab];
        _titleLab = titleLab;
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(NM15);
            make.centerY.equalTo(self.mas_centerY);
            make.width.equalTo(@(width));
        }];
    }
    return _titleLab;
}

- (UILabel *)contenLab{
    
    if (!_contenLab) {
        
        //内容lab
        UILabel *contenLab = [[UILabel alloc] init];
        contenLab.font = NMSystemFont(14);
        contenLab.textColor = NMf10215;
        [self addSubview:contenLab];
        _contenLab = contenLab;
        [contenLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLab.mas_right).offset(NM20);
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
    return _contenLab;
}

- (UITextField *)inputTxtField{
    
    if (!_inputTxtField) {
        
        //输入卡号text
        UITextField *inputTxtField = [[UITextField alloc] init];
        inputTxtField.textColor = NM333333;
        inputTxtField.font = NMSystemFont(14);
        inputTxtField.delegate = self;
        [self addSubview:inputTxtField];
        _inputTxtField = inputTxtField;
        [inputTxtField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLab.mas_right).offset(NM20);
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
    return _inputTxtField;
}

- (UIButton *)allDeleteTextBtn{
    
    if (!_allDeleteTextBtn) {
        
        CGFloat btnWidth = NM40;
        //删除所有text按钮
        UIButton *allDeleteTextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //删除搜索框的全部内容
        allDeleteTextBtn.hidden = YES;
        [allDeleteTextBtn setImage:[UIImage imageNamed:@"allDelete"] forState:UIControlStateNormal];
        [allDeleteTextBtn addTarget:self action:@selector(deleteTextAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:allDeleteTextBtn];
        _allDeleteTextBtn = allDeleteTextBtn;
        [allDeleteTextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right);
            make.top.bottom.equalTo(self);
            make.width.equalTo(@(btnWidth));
        }];
    }
    return _allDeleteTextBtn;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
