//
//  NMPersonalMinePageTitleView.h
//  NewMinister
//
//  Created by Andy on 2018/10/12.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NMPersonalMinePageTitleView : UIView


@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, copy) void (^buttonSelected)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
