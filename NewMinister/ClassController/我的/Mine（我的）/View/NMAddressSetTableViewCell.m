//
//  NMAddressSetTableViewCell.m
//  NewMinister
//
//  Created by Andy on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMAddressSetTableViewCell.h"
#import "NMStudent.h"

@interface NMAddressSetTableViewCell()
@property (nonatomic, strong) UILabel *nameLabel;//名字
@property (nonatomic, strong) UILabel *phoneLabel;//电话
@property (nonatomic, strong) UILabel *addressLbale;//地址

@end

@implementation NMAddressSetTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(16,16,NMScreenWidth-16,13);
        _nameLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
        _nameLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [self addSubview:_nameLabel];
        
        _addressLbale = [[UILabel alloc] init];
        _addressLbale.frame = CGRectMake(15,CGRectGetMaxY(_nameLabel.frame)+11,NMScreenWidth-30,11.5);
        _addressLbale.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
        _addressLbale.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [self addSubview:_addressLbale];
        
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(15,CGRectGetMaxY(_addressLbale.frame)+18,NMScreenWidth-30,1);
        view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
        [self addSubview:view];
        
    }
    return self;
}
-(void)initWithDic:(NSDictionary *)dic
{
//    _nameLabel.text = [NSString stringWithFormat:@"%@      %@",[dic objectForKey:@"name"],[dic objectForKey:@"phone"]];
//    _addressLbale.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"address"]];
}
- (void)showStudentWith:(NMStudent *)stu{
    
    _addressLbale.text = [NSString stringWithFormat:@"%@",stu.stuCode];
    _nameLabel.text=[NSString stringWithFormat:@"%@     %@",stu.name,stu.sex];
    
}

@end
