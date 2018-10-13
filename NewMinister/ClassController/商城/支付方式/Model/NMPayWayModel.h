//
//  NMPayWayModel.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/13.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMBaseModel.h"

@interface NMPayWayModel : NMBaseModel

@property (nonatomic,strong) NSString *titleText;
@property (nonatomic,strong) NSString *titleIcon;
@property (nonatomic,strong) NSString *chooseNormalIcon;//未选中
@property (nonatomic,strong) NSString *chooseSelectIcon;//选中


@property (nonatomic,strong) NSArray *payListArr;

#pragma mark -- 遍历字典数组获得模型数组
- (NSMutableArray *)enumToGetModelListArr;

@end
