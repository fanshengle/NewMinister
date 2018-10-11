//
//  NMMessageModel.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/10.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMBaseModel.h"

@interface NMMessageModel : NMBaseModel

@property (nonatomic,strong) NSString *titleText;
@property (nonatomic,strong) NSString *titleIcon;
@property (nonatomic,strong) NSString *arrowIcon;

@property (nonatomic,strong) NSString *count;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *TongZhiContent;
@property (nonatomic,strong) NSString *isMsg;

@property (nonatomic,strong) NSArray *msgListArr;

#pragma mark -- 遍历字典数组获得模型数组
- (NSMutableArray *)enumToGetModelListArr;

@end
