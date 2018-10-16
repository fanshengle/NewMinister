//
//  NMStudentFMDNManager.h
//  NewMinister
//
//  Created by Andy on 2018/10/16.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@class NMStudent;

NS_ASSUME_NONNULL_BEGIN

@interface NMStudentFMDNManager : NSObject

// 添加
+ (BOOL)addStudent:(NMStudent *)student;

// 查询  如果 传空 默认会查询表中所有数据
+ (NSArray <NMStudent *> *)queryStudent:(NSString *)querySql;

// 删除  如果 传空 默认会删除表中所有数据
+ (BOOL)deleteStudent:(NSString *)deleteSql;

// 修改
+ (BOOL)updateStudent:(NSString *)updateSql;

@end

NS_ASSUME_NONNULL_END
