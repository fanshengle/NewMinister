//
//  NMAddressSetViewController.h
//  NewMinister
//
//  Created by Andy on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMBaseViewController.h"
#import "NMStudent.h"

NS_ASSUME_NONNULL_BEGIN

@interface NMAddressSetViewController : NMBaseViewController

@property (nonatomic, strong) NSMutableArray <NMStudent *> *dataArr;

@end

NS_ASSUME_NONNULL_END
