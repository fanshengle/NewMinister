//
//  NMFillCartMsgModel.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMFillCartMsgModel.h"

@implementation NMFillCartMsgModel

- (instancetype)init{
    
    if (self = [super init]) {
        
        NSDictionary *cartMsgType = @{@"titleText":@"卡类型",
                                      @"cartTypeText": @"招商银行 储蓄卡",
                                      @"allDeleteIcon":@"allDelete",
                                      };
        NSDictionary *cartMsgName = @{@"titleText":@"姓名",
                                 @"placeholderStr": @"持卡人姓名",
                                 @"allDeleteIcon":@"allDelete",
                                 };
        NSDictionary *cartMsgIdCard = @{@"titleText":@"身份证",
                                   @"placeholderStr":@"持卡人身份证",
                                   @"allDeleteIcon":@"allDelete",
                                   };
        NSDictionary *cartMsgPhone = @{@"titleText":@"手机号",
                                   @"placeholderStr":@"银行预留电话",
                                   @"allDeleteIcon":@"allDelete",
                                   };
        NSArray *firstArr = @[cartMsgType];
        NSArray *secondArr = @[cartMsgName,cartMsgIdCard,cartMsgPhone];
        _cartMsgListArr = @[firstArr,secondArr];
    }
    return self;
}

#pragma mark -- 遍历字典数组获得模型数组
- (NSMutableArray *)enumToGetModelListArr{
    
    NSMutableArray *sectionArr = [NSMutableArray array];
    for (NSArray *arr in _cartMsgListArr) {
        NSMutableArray *listArr = [NSMutableArray array];
        for (NSDictionary *dic in arr) {
            
            NMFillCartMsgModel *msgM = [NMFillCartMsgModel mj_objectWithKeyValues:dic];
            [listArr addObject:msgM];
        }
        [sectionArr addObject:listArr];
    }
    
    return sectionArr;
}
@end
