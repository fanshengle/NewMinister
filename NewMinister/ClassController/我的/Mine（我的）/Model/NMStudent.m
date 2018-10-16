//
//  NMStudent.m
//  NewMinister
//
//  Created by Andy on 2018/10/16.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMStudent.h"

@implementation NMStudent
+ (instancetype)studentWith:(NSString *)stuCode name:(NSString *)name sex:(NSString *)sex{
    
    NMStudent *stu = [[NMStudent alloc]init];
    stu.stuCode = stuCode;
    stu.name = name;
    stu.sex = sex;
    
    return stu;
}

@end
