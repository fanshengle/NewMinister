//
//  NMOrderDetailsStateView.m
//  NewMinister
//
//  Created by Andy on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMOrderDetailsStateView.h"

@implementation NMOrderDetailsStateView

- (instancetype)initWithFrame:(CGRect)frame imageView:(UIImage *)image stateString:(NSString *)stateString timeString:(NSString *)timeString{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView * imageview =[[UIImageView alloc]initWithFrame:self.frame];
        imageview.image=image;
        imageview.backgroundColor=[UIColor redColor];
        [self addSubview:imageview];
        
        UILabel *statelabel = [[UILabel alloc] init];
        statelabel.frame = CGRectMake(41.5,31,NMScreenWidth-41.5,13.5);
        statelabel.text = stateString;
        statelabel.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:14];
        statelabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        [self addSubview:statelabel];
        
        UILabel *timelabel = [[UILabel alloc] init];
        timelabel.frame = CGRectMake(41.5,54,NMScreenWidth-41.5,13.5);
        timelabel.text = timeString;
        timelabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
        timelabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        [self addSubview:timelabel];

    }
    
    return self;
}

@end
