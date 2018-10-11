//
//  SearchCollectionCell.h
//  SlowPurchase
//
//  Created by admin on 17/4/17.
//  Copyright © 2017年 housheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchCollectionCell;

@protocol SearchCollectionCellDelegate <NSObject>

- (void)selectButttonClick:(SearchCollectionCell *)cell;

@end


@interface SearchCollectionCell : UICollectionViewCell

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic, weak) id<SearchCollectionCellDelegate> selectDelegate;


@end
