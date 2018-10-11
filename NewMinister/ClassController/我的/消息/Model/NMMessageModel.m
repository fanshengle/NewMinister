//
//  NMMessageModel.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/10.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMessageModel.h"

@implementation NMMessageModel

- (instancetype)init{
    
    if (self = [super init]) {
        
        NSDictionary *msgHuozan = @{@"titleText":@"获赞和收藏",
                                  @"titleIcon": @"huozan_shoucang",
                                    @"count":@"1",
                                  @"arrowIcon":@"arrow_Icon"
                                  };
        NSDictionary *msgPinglun = @{@"titleText":@"评论和@",
                                   @"titleIcon":@"pinglun",
                                     @"count":@"0",
                                   @"arrowIcon":@"arrow_Icon"
                                   };
        NSDictionary *msgGuanzhu = @{@"titleText":@"关注",
                                @"titleIcon":@"guanzhu",
                                     @"count":@"0",
                                @"arrowIcon":@"arrow_Icon"
                                };
        NSDictionary *msgTongzhi = @{@"titleText":@"通知消息",
                                 @"titleIcon":@"tongzhi",
                                     @"count":@"1",
                                     @"time":@"今天12:00",
                                     @"TongZhiContent":@"你是我的那个人",
                                 @"arrowIcon":@"arrow_Icon"
                                 };
        NSDictionary *msgSixin = @{@"titleText":@"私信",
                                     @"titleIcon":@"sixin",
                                   @"count":@"0",
                                   @"isMsg":@"YES",
                                     @"arrowIcon":@"arrow_Icon"
                                     };
        NSArray *firstArr = @[msgHuozan,msgPinglun,msgGuanzhu,msgTongzhi];
        NSArray *secondArr = @[msgSixin];
        _msgListArr = @[firstArr,secondArr];
    }
    return self;
}

#pragma mark -- 遍历字典数组获得模型数组
- (NSMutableArray *)enumToGetModelListArr{
    
    NSMutableArray *sectionArr = [NSMutableArray array];
    for (NSArray *arr in _msgListArr) {
        NSMutableArray *listArr = [NSMutableArray array];
        for (NSDictionary *dic in arr) {
            
            NMMessageModel *msgM = [NMMessageModel mj_objectWithKeyValues:dic];
            [listArr addObject:msgM];
        }
        [sectionArr addObject:listArr];
    }
   
    return sectionArr;
}
@end
