//
//  NMOrderDetailsStateView.h
//  NewMinister
//
//  Created by Andy on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NMOrderDetailsStateView : UIView
- (instancetype)initWithFrame:(CGRect)frame imageView:(UIImage *)image stateString:(NSString *)stateString timeString:(NSString *)timeString;

@end

NS_ASSUME_NONNULL_END
