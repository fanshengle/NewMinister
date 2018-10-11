//
//  NMBaseModel.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/4.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMBaseModel.h"

@implementation NMBaseModel

/**
 某些时候后台传过来的某个字段为空时，会出现崩溃，或者显示null。在model中添加如下代码可解决。
 空值替换为@""
 */
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([self isEmpty:oldValue]) {// 以字符串类型为例
        return  @"";
    }
    return oldValue;
}

#pragma mark -- 是否为空值
- (BOOL)isEmpty:(id)text{
    
    if ([text isEqual:[NSNull null]]) {
        return YES;
    }else if ([text isKindOfClass:[NSNull class]]){
        return YES;
    }else if (text == nil){
        return YES;
    }else if ([text isEqual:@"(null)"]){
        return YES;
    }
    return NO;
}

@end
