//
//  NMAppDelegate+AppService.h
//  NewMinister
//
//  Created by 范声乐 on 2018/9/27.
//  Copyright © 2018年 范声乐. All rights reserved.
//

//app的服务管理类别
#import "NMAppDelegate.h"

/**
 包含第三方 和 应用内业务的实现，减轻入口代码压力
 */
@interface NMAppDelegate (AppService)

//单例
+ (NMAppDelegate *)shareAppDelegate;

@end
