//
//  SectionHeadReusableView.h
//  SlowPurchase
//
//  Created by admin on 17/4/17.
//  Copyright © 2017年 housheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchReusableView;
@protocol SearchReusableViewDelegate<NSObject>

- (void)deleteData:(SearchReusableView *)view;

@end

@interface SearchReusableView : UICollectionReusableView

@property (nonatomic, strong) UILabel *searchNameLab;
@property (nonatomic, strong) UIButton *deleteBtn;

@property (nonatomic, weak) id<SearchReusableViewDelegate> deleteDelegate;


- (void)setText:(NSString *)text;

@end
