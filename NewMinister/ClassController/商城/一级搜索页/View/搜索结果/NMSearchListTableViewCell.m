//
//  NMSearchListTableViewCell.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/3.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMSearchListTableViewCell.h"

@implementation NMSearchListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.layer.borderWidth = 0.5;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor =  NM999999.CGColor;
        
        _listNameLab = [[UILabel alloc] init];
        _listNameLab.font = NMSystemFont(12);
        _listNameLab.textColor =  NM999999;
        [self.contentView addSubview:_listNameLab];
        
        CGFloat jianJu15 = 15.0;
        [_listNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.mas_left).offset(jianJu15);
            make.centerY.equalTo(self.mas_centerY);
        }];
        
        _numberLab = [[UILabel alloc] init];
        _numberLab.font = NMSystemFont(12);
        _numberLab.textColor = NM999999;
        [self.contentView addSubview:_listNameLab];
        [_listNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self.mas_right).offset(jianJu15);
            make.centerY.equalTo(self.mas_centerY);
        }];
        
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
