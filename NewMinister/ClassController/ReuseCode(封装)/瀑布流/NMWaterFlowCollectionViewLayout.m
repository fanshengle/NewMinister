//
//  NMWaterFlowCollectionViewLayout.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/3.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMWaterFlowCollectionViewLayout.h"

//每一列item之间的间距
//static const CGFloat columnMargin = 10;
//每一行item之间的间距
//static const CGFloat rowMargin = 10;

@interface NMWaterFlowCollectionViewLayout()

/** 这个字典用来存储每一列item的高度 */
@property (strong,nonatomic)NSMutableDictionary *maxYDic;
/** 存放每一个item的布局属性 */
@property (strong,nonatomic)NSMutableArray *attrsArray;

@end

@implementation NMWaterFlowCollectionViewLayout

/** 懒加载 */
-(NSMutableDictionary *)maxYDic
{
    if (!_maxYDic)
    {
        _maxYDic = [NSMutableDictionary dictionary];
    }
    return _maxYDic;
}

/** 懒加载 */
-(NSMutableArray *)attrsArray
{
    if (!_attrsArray)
    {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

//初始化
-(instancetype)init
{
    if (self = [super init]){
        self.columnMargin = 10;
        self.rowMargin = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.columnCount = 3;
        self.headerReferenceSize = CGSizeZero;
    }
    return self;
}

////每一次布局前的准备工作
//-(void)prepareLayout
//{
//    [super prepareLayout];
//
//    //清空最大的y值
//    for (int i =0; i < self.columnCount; i++)
//    {
//        NSString *column = [NSString stringWithFormat:@"%d",i];
//        self.maxYDic[column] = @(self.sectionInset.top);
//    }
//
//    //计算所有item的属性
//    [self.attrsArray removeAllObjects];
//    NSInteger count = [self.collectionView numberOfItemsInSection:self.currentSection];
//    for (int i=0; i<count; i++){
//        
//        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:self.currentSection]];
//
//        [self.attrsArray addObject:attrs];
//    }
//}


//每一次布局前的准备工作
-(void)prepareLayout
{
    [super prepareLayout];
    
    //清空最大的y值
    for (int i =0; i < self.columnCount; i++)
    {
        NSString *column = [NSString stringWithFormat:@"%d",i];
        self.maxYDic[column] = @(self.sectionInset.top);
    }
    
    //计算所有item的属性
    [self.attrsArray removeAllObjects];
    
    //头部视图
    UICollectionViewLayoutAttributes * layoutHeader = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:[NSIndexPath indexPathWithIndex:0]];
    layoutHeader.frame =CGRectMake(0,0, self.headerReferenceSize.width, self.headerReferenceSize.height);
    [self.attrsArray addObject:layoutHeader];
    
    //遍历所有item
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i=0; i<count; i++){

        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];

        [self.attrsArray addObject:attrs];
    }
}


//设置collectionView滚动区域
-(CGSize)collectionViewContentSize
{
    //假设最长的那一列为第0列
    __block NSString *maxColumn = @"0";
    
    
    //遍历字典,找出最长的那一列
    [self.maxYDic enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
        
        if ([maxY floatValue] > [self.maxYDic[maxColumn] floatValue])
        {
            maxColumn = column;
        }
    }];
    //没有头部的所有item滚动区域
    //return CGSizeMake(0, [self.maxYDic[maxColumn]floatValue]+self.sectionInset.bottom);
    //包括段头headerView的高度
    return CGSizeMake(0, [self.maxYDic[maxColumn] floatValue] + self.sectionInset.bottom + self.headerReferenceSize.height);
}

//允许每一次重新布局
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

//布局每一个属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //假设最短的那一列为第0列
    __block NSString *minColumn = @"0";
    
    //遍历字典,找出最短的那一列
    [self.maxYDic enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
        
        if ([maxY floatValue] < [self.maxYDic[minColumn] floatValue])
        {
            minColumn = column;
        }
    }];
    
    //(origin = (x = 0, y = 0), size = (width = 375, height = 554))
    //计算每一个item的宽度和高度
    CGFloat width = (self.collectionView.frame.size.width - self.columnMargin*(self.columnCount - 1) - self.sectionInset.left - self.sectionInset.right) / self.columnCount;
    //调用协议delegate
    CGFloat height = [self.delegate waterFlowLayout:self heightForWidth:width andIndexPath:indexPath] ;
    
    //计算每一个item的位置
    CGFloat x = self.sectionInset.left + (width + self.columnMargin) * [minColumn floatValue];
    CGFloat y = [self.maxYDic[minColumn] floatValue] + self.rowMargin;
    
    //更新这一列的y值
    self.maxYDic[minColumn] = @(y + height);
    
    //创建布局属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //设置item的frame
    //attrs.frame = CGRectMake(x, y, width, height);
    
    //把瀑布流的Cell的起始位置从headerView的最大Y开始布局
    attrs.frame = CGRectMake(x, self.headerReferenceSize.height + y, width, height );
    return attrs;
}

/**
 *  这个方法会多次调用，cell的排布
 */
//布局所有item的属性,包括header、footer
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return [self.attrsArray copy];
}

@end
