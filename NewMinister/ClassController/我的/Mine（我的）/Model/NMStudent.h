//
//  NMStudent.h
//  NewMinister
//
//  Created by Andy on 2018/10/16.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NMStudent : NSObject

@property (nonatomic, copy) NSString *stuCode;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *sex;

+ (instancetype)studentWith: (NSString *)stuCode name: (NSString *)name sex: (NSString *)sex;

@end

NS_ASSUME_NONNULL_END
