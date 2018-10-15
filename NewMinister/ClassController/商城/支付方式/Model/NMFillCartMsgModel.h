//
//  NMFillCartMsgModel.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMBaseModel.h"

@interface NMFillCartMsgModel : NMBaseModel

@property (nonatomic,strong) NSString *titleText;
@property (nonatomic,strong) NSString *cartTypeText;//卡类型
@property (nonatomic,strong) NSString *placeholderStr;//占位符
@property (nonatomic,strong) NSString *allDeleteIcon;//删除按钮
@property (nonatomic,assign) NSInteger cellRow;//cell的当前行

@property (nonatomic,strong) NSArray *cartMsgListArr;

#pragma mark -- 遍历字典数组获得模型数组
- (NSMutableArray *)enumToGetModelListArr;
@end
