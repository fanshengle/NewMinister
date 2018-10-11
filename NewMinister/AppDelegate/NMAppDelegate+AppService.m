//
//  NMAppDelegate+AppService.m
//  NewMinister
//
//  Created by 范声乐 on 2018/9/27.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMAppDelegate+AppService.h"

@implementation NMAppDelegate (AppService)


+ (NMAppDelegate *)shareAppDelegate{
    
    return (NMAppDelegate *)[[UIApplication sharedApplication] delegate];
}

@end
