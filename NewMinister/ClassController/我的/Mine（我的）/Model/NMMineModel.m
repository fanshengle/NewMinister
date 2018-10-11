//
//  NMMineModel.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/4.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMineModel.h"

@implementation NMMineModel


- (instancetype)init{
    
    if (self = [super init]) {
        
        NSDictionary *myNotes = @{@"titleText":@"我的随手记",
                                  @"titleIcon": @"myNotes",
                                   @"arrowIcon":@"arrow_Icon"
                                   };
        NSDictionary *myWallet = @{@"titleText":@"我的钱包",
                                   @"titleIcon":@"myWallet",
                                   @"arrowIcon":@"arrow_Icon"
                                   };
        NSDictionary *myMsg = @{@"titleText":@"我的消息",
                                    @"titleIcon":@"myNews",
                                    @"arrowIcon":@"arrow_Icon"
                                    };
        NSDictionary *myShop = @{@"titleText":@"我的店铺",
                                    @"titleIcon":@"myShop",
                                    @"arrowIcon":@"arrow_Icon"
                                    };
        NSDictionary *myEvaluate = @{@"titleText":@"我的评价",
                                  @"titleIcon":@"myEvaluate",
                                  @"arrowIcon":@"arrow_Icon"
                                  };
        NSDictionary *myService = @{@"titleText":@"客服中心",
                                    @"titleIcon":@"myService",
                                    @"arrowIcon":@"arrow_Icon"
                                    };
        NSDictionary *myInstall = @{@"titleText":@"设置",
                                    @"titleIcon":@"mySetUp",
                                    @"arrowIcon":@"arrow_Icon"
                                    };
        _mineListArr = @[myNotes,myWallet,myMsg,myShop,myEvaluate,myService,myInstall];
    }
    return self;
}

#pragma mark -- 遍历字典数组获得模型数组
- (NSMutableArray *)enumToGetModelListArr{
    
    NSMutableArray *listArr = [NSMutableArray array];
    for (NSDictionary *dic in self.mineListArr) {
        
        NMMineModel *mineM = [NMMineModel mj_objectWithKeyValues:dic];
        [listArr addObject:mineM];
    }
    return listArr;
}

@end
