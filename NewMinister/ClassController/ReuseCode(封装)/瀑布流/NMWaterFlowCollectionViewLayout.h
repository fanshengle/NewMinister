//
//  NMWaterFlowCollectionViewLayout.h
//  NewMinister
//
//  Created by 范声乐 on 2018/10/3.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NMWaterFlowCollectionViewLayout;
@protocol NMWaterFlowCollectionViewLayoutDelegate;

/*
 为了体现封装性的特点,我们可以把一些数据设置为公共的，既可以提高扩展性和通用性，
 也便于外界按照自己的需求做必要的调整。
 */
@protocol NMWaterFlowCollectionViewLayoutDelegate <NSObject>

@required
-(CGFloat)waterFlowLayout:(NMWaterFlowCollectionViewLayout *) WaterFlowLayout heightForWidth:(CGFloat)width andIndexPath:(NSIndexPath *)indexPath;

@end

@interface NMWaterFlowCollectionViewLayout : UICollectionViewLayout

@property (assign,nonatomic) CGFloat columnMargin;//每一列item之间的列间距
@property (assign,nonatomic) CGFloat rowMargin;   //每一行item之间的行间距
@property (assign,nonatomic) UIEdgeInsets sectionInset;//设置于collectionView边缘的间距
@property (assign,nonatomic) NSInteger columnCount;//设置每一行排列的个数


@property (weak,nonatomic) id <NMWaterFlowCollectionViewLayoutDelegate> delegate; //设置代理

@end


