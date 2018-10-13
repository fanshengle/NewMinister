//
//  NMPayWayModel.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/13.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMPayWayModel.h"

@implementation NMPayWayModel

- (instancetype)init{
    
    if (self = [super init]) {
        
        NSDictionary *payZFB = @{@"titleText":@"支付宝支付",
                                    @"titleIcon": @"car_zhiFuBaoPay",
                                    @"chooseNormalIcon":@"car_chooseNormal",
                                    @"chooseSelectIcon":@"car_chooseSelect"
                                    };
        NSDictionary *payWecat = @{@"titleText":@"微信支付",
                                     @"titleIcon":@"car_wecatPay",
                                     @"chooseNormalIcon":@"car_chooseNormal",
                                     @"chooseSelectIcon":@"car_chooseSelect"
                                     };
        NSDictionary *payUnion = @{@"titleText":@"银联支付",
                                     @"titleIcon":@"car_ unionpay@2x",
                                     @"chooseNormalIcon":@"car_chooseNormal",
                                     @"chooseSelectIcon":@"car_chooseSelect"
                                     };
        NSDictionary *payQQ = @{@"titleText":@"QQ钱包支付",
                                     @"titleIcon":@"car_qqWalletPay",
                                     @"chooseNormalIcon":@"car_chooseNormal",
                                     @"chooseSelectIcon":@"car_chooseSelect"
                                     };
        _payListArr = @[payZFB,payWecat,payUnion,payQQ];
    }
    return self;
}

#pragma mark -- 遍历字典数组获得模型数组
- (NSMutableArray *)enumToGetModelListArr{
    
    NSMutableArray *listArr = [NSMutableArray array];
    for (NSDictionary *dic in _payListArr) {
            
        NMPayWayModel *msgM = [NMPayWayModel mj_objectWithKeyValues:dic];
        [listArr addObject:msgM];
    }
    return listArr;
}
@end
