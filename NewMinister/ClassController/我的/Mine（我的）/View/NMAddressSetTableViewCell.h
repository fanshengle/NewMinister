//
//  NMAddressSetTableViewCell.h
//  NewMinister
//
//  Created by Andy on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class NMStudent;

@interface NMAddressSetTableViewCell : UITableViewCell


-(void)initWithDic:(NSDictionary *)dic;


- (void)showStudentWith:(NMStudent *)stu;

@end

NS_ASSUME_NONNULL_END
