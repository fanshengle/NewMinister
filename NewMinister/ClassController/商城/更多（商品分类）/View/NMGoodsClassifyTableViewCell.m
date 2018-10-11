//
//  NMGoodsClassifyTableViewCell.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/11.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMGoodsClassifyTableViewCell.h"

@interface NMGoodsClassifyTableViewCell ()

@property (nonatomic, strong) UIView *selectRedView;

@end@implementation NMGoodsClassifyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = NMWhiteC;
        
        self.selectRedView = [[UIView alloc] init];
        self.selectRedView.backgroundColor = NMf10215;
        [self.contentView addSubview:self.selectRedView];
        
        //选中该分类时，选中色块视图
        CGFloat height = 16.0;
        CGFloat width = 3.0;
        [self.selectRedView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.centerY.equalTo(self.mas_centerY);
            make.width.equalTo(@(width));
            make.height.equalTo(@(height));
        }];
        
        self.firstCateName = [[UILabel alloc] init];
        self.firstCateName.numberOfLines = 1;
        self.firstCateName.font = NMSystemFont(13);
        self.firstCateName.textColor = NM666666;
        self.firstCateName.highlightedTextColor = NMf10215;
        self.firstCateName.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.firstCateName];
        [self.firstCateName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.selectRedView.mas_right);
            make.right.top.bottom.equalTo(self);
        }];
    }
    return self;
}

#pragma mark -- cell选中时调用
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    
    self.contentView.backgroundColor = selected ? NMWhiteC : NMWhiteC;
    self.highlighted = selected;
    self.firstCateName.highlighted = selected;
    self.selectRedView.hidden = !selected;
}
@end
