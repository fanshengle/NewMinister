//
//  NMMineOrderTabViewHeadView.m
//  NewMinister
//
//  Created by Andy on 2018/10/13.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMineOrderTabViewHeadView.h"

@implementation NMMineOrderTabViewHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setUI];
    }
        
    return self;
}
-(void)setUI{
    
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 52)];
    view.backgroundColor=[UIColor colorWithRed:244/255.0 green:248/255.0 blue:251/255.0 alpha:1];
    [self addSubview:view];
    
    UIView * bgview=[[UIView alloc]initWithFrame:CGRectMake(0, 10, NMScreenWidth, 42)];
    bgview.backgroundColor=[UIColor whiteColor];
    [view addSubview:bgview];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(15,24,14,13);
    imageView.image=[UIImage imageNamed:@"car_ShopImg.png"];
    [view addSubview:imageView];
    
    NSString * leflabelstr =[NSString stringWithFormat:@"ROCK的私家小店"];
    CGSize size = [leflabelstr sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0f]}];
    UILabel *leflabel = [[UILabel alloc] init];
    leflabel.frame = CGRectMake(34.5,25,size.width,11.5);
    leflabel.text = leflabelstr;
    leflabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    leflabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [view addSubview:leflabel];
    
    UILabel *riglabel = [[UILabel alloc] init];
    riglabel.frame = CGRectMake(0,25,NMScreenWidth-16,11.5);
    riglabel.text = @"等待买家付款";
    riglabel.textAlignment=NSTextAlignmentRight;
    riglabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    riglabel.textColor = [UIColor colorWithRed:241/255.0 green:2/255.0 blue:21/255.0 alpha:1];
    [view addSubview:riglabel];
    
    UIImageView *rigimageView = [[UIImageView alloc] init];
    rigimageView.frame = CGRectMake(CGRectGetMaxX(leflabel.frame)+5,25,14,13);
    rigimageView.image=[UIImage imageNamed:@"car_ArrowGray.png"];
    [view addSubview:rigimageView];

}
@end
