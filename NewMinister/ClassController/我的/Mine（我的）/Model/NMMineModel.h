//
//  NMMineModel.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/4.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMBaseModel.h"

@interface NMMineModel : NMBaseModel

@property (nonatomic,strong) NSString *titleText;
@property (nonatomic,strong) NSString *titleIcon;
@property (nonatomic,strong) NSString *arrowIcon;
@property (nonatomic,strong) NSArray *mineListArr;

#pragma mark -- 遍历字典数组获得模型数组
- (NSMutableArray *)enumToGetModelListArr;

@end
