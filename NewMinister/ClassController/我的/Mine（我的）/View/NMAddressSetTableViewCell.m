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
        
        
        UIImageView * deteleimageview=[[UIImageView alloc]initWithFrame:CGRectMake(NMScreenWidth-41-11, CGRectGetMaxY(view.frame)+16, 13, 13)];
        deteleimageview.image=[UIImage imageNamed:@"detele"];
        [self addSubview:deteleimageview];

        UILabel *detelelabel = [[UILabel alloc] init];
        detelelabel.frame = CGRectMake(CGRectGetMaxX(deteleimageview.frame)+4,CGRectGetMaxY(view.frame)+17,22,11);
        detelelabel.text = @"删除";
        detelelabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:11];
        detelelabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        [self addSubview:detelelabel];


        UIImageView * bjimageview=[[UIImageView alloc]initWithFrame:CGRectMake(NMScreenWidth-96-13, CGRectGetMaxY(view.frame)+16, 13, 13)];
        bjimageview.image=[UIImage imageNamed:@"bianji"];
        [self addSubview:bjimageview];
        
        UILabel *bjlabel = [[UILabel alloc] init];
        bjlabel.frame = CGRectMake(CGRectGetMaxX(bjimageview.frame)+4,CGRectGetMaxY(view.frame)+17,22,11);
        bjlabel.text = @"编辑";
        bjlabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:11];
        bjlabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        [self addSubview:bjlabel];
        
        UIButton *  but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.frame=CGRectMake(15, CGRectGetMaxY(view.frame), 38, 48);
        [but setImage:[UIImage imageNamed:@"car_chooseNormal"] forState:UIControlStateNormal];
        [self addSubview:but];
        

        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(CGRectGetMaxX(but.frame),CGRectGetMaxY(view.frame)+18,66,11);
        label.text = @"设为默认地址";
        label.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:11];
        label.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        [self addSubview:label];
        
        UIView * deteleview =[[UIView alloc]initWithFrame:CGRectMake(NMScreenWidth-55, CGRectGetMaxY(view.frame)+2, 40, 44)];
        deteleview.backgroundColor=[UIColor clearColor];
        [self addSubview:deteleview];
        
        UIView * bjview =[[UIView alloc]initWithFrame:CGRectMake(NMScreenWidth-110, CGRectGetMaxY(view.frame)+2, 40, 44)];
        bjview.backgroundColor=[UIColor clearColor];
        [self addSubview:bjview];

        UITapGestureRecognizer *detelevGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(deteleviewAction:)];
        [deteleview addGestureRecognizer:detelevGesturRecognizer];

        
        UITapGestureRecognizer *bjGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bjviewAction:)];
        [bjview addGestureRecognizer:bjGesturRecognizer];

    }
    return self;
}
-(void)deteleviewAction:(id)tap{
    
    //删除
}
-(void)bjviewAction:(id)tap{
    
    //编辑
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
