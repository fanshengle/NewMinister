//
//  NMStudentFMDNManager.m
//  NewMinister
//
//  Created by Andy on 2018/10/16.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMStudentFMDNManager.h"
#import "NMStudent.h"

#define STUDENT_TABLE @"STUDENT_TABLE.sqlite"

@implementation NMStudentFMDNManager
static FMDatabase *_fmdb;

/**
 使用FMDB要导入 libsqlite3.0.tbd
 */
+ (void)initialize {
    
    //拼接路径
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:STUDENT_TABLE];
    
    //初始化FMDB
    _fmdb = [FMDatabase databaseWithPath:filePath];
    
    //打开数据库
    [_fmdb open];
    
    //创建表
    BOOL isSucc = [_fmdb executeUpdate:@"create table if not exists t_STUDENT_TABLE(id integer primary key, stuCode text, name text, sex text);"];
//    NSLog(@"%d", isSucc);
}

//添加
+ (BOOL)addStudent:(NMStudent *)student {
    
    NSString *addSql = [NSString stringWithFormat:@"insert into t_STUDENT_TABLE(stuCode, name, sex) values ('%@','%@','%@');", student.stuCode, student.name, student.sex];
    
    BOOL isSuccess = [_fmdb executeUpdate:addSql];
    
    return isSuccess;
}

//查询
+ (NSArray <NMStudent *> *)queryStudent:(NSString *)querySql {
    
    if (querySql == nil) {
        querySql = @"select * from t_STUDENT_TABLE;";
    }
    
    NSMutableArray <NMStudent *> *students = [NSMutableArray array];
    FMResultSet *set = [_fmdb executeQuery:querySql];
    
    while ([set next]) {
        
        NSString *name = [set stringForColumn:@"name"];
        NSString *stuCode = [set stringForColumn:@"stuCode"];
        NSString *sex = [set stringForColumn:@"sex"];
        
        NMStudent *stu = [NMStudent studentWith:stuCode name:name sex:sex];
        [students addObject:stu];
    }
    return students;
}

+ (BOOL)deleteStudent:(NSString *)deleteSql {
    
    if (deleteSql == nil) {
        deleteSql = @"delete from t_STUDENT_TABLE";
    }
    
    BOOL isSuccess = [_fmdb executeUpdate:deleteSql];
    
    return isSuccess;
    
}

+ (BOOL)updateStudent:(NSString *)updateSql {
    
    if (updateSql == nil) {
        return NO;
    }
    
    BOOL isSuccess = [_fmdb executeUpdate:updateSql];
    
    return isSuccess;
}

@end
