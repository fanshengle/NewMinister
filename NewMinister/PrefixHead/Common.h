//
//  Common.h
//  NewMinister
//
//  Created by 范声乐 on 2018/9/28.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#ifndef Common_h
#define Common_h


//强弱引用
#define NMWeakSelf(type)        __weak typeof(type) weak##type = type;
#define NMStrongSelf(type)      __strong typeof(type) type = weak##type;

// 当前系统版本
#define CurrentSystemVersion    [[UIDevice currentDevice].systemVersion doubleValue]
//当前语言
#define CurrentLanguage         (［NSLocale preferredLanguages] objectAtIndex:0])

//拼接字符串
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]


#endif /* Common_h */
