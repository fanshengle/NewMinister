//
//  NMMineOrderTableViewCell.m
//  NewMinister
//
//  Created by Andy on 2018/10/13.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMineOrderTableViewCell.h"

@implementation NMMineOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUI];
    }
    return self;
}
-(void)setUI{
    
    self.backgroundColor=[UIColor whiteColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 77)];
    bgview.backgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
    [self.contentView addSubview:bgview];
    
    UIImageView *nameimageView = [[UIImageView alloc] init];
    nameimageView.frame = CGRectMake(18.5,8,59,59);
    nameimageView.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:nameimageView];
    
    UILabel *namelabel = [[UILabel alloc] init];
    namelabel.frame = CGRectMake(92,11,166,10);
    namelabel.text = @"无印良品 MUJI 女式粗线条文长袖T恤";
    namelabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:10];
    namelabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [self.contentView addSubview:namelabel];
    
    UILabel *categorylabel = [[UILabel alloc] init];
    categorylabel.frame = CGRectMake(92,29,166,10.5);
    categorylabel.text = @"主要颜色：原色*横条，尺码：M";
    categorylabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:10];
    categorylabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [self.contentView addSubview:categorylabel];
    
    UILabel *clabel = [[UILabel alloc] init];
    clabel.frame = CGRectMake(94,43,32,10);
    clabel.text = @"七天退换";
    clabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:7];
    clabel.textColor = [UIColor colorWithRed:255/255.0 green:73/255.0 blue:88/255.0 alpha:1];
    clabel.layer.cornerRadius = 2;//边框圆角大小
    clabel.layer.masksToBounds = YES;
    clabel.layer.borderColor = [UIColor colorWithRed:255/255.0 green:73/255.0 blue:87/255.0 alpha:1].CGColor;//边框颜色
    clabel.layer.borderWidth = 1;//边框宽度
    [self.contentView addSubview:clabel];
    
    UILabel *moneylabel = [[UILabel alloc] init];
    moneylabel.frame = CGRectMake(0,11,NMScreenWidth-20,8);
    moneylabel.textAlignment=NSTextAlignmentRight;
    moneylabel.text = @"¥15.00";
    moneylabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:10];
    moneylabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [self.contentView addSubview:moneylabel];
    
    UILabel *numberlabel = [[UILabel alloc] init];
    numberlabel.frame = CGRectMake(0,CGRectGetMaxY(moneylabel.frame)+9,NMScreenWidth-20,8);
    numberlabel.textAlignment=NSTextAlignmentRight;
    numberlabel.text = @"x1";
    numberlabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    numberlabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];        [self.contentView addSubview:numberlabel];
    [self.contentView addSubview:numberlabel];

}

@end
