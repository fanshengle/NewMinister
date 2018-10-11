//
//  NMShufflingCollectionViewCell.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/10.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMShufflingCollectionViewCell.h"

@interface NMShufflingCollectionViewCell()<SDCycleScrollViewDelegate>

@property (nonatomic,strong) SDCycleScrollView *shuffilingScrollView;
@end

@implementation NMShufflingCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
    }
    return self;
}

- (SDCycleScrollView *)shuffilingScrollView{
    
    if (!_shuffilingScrollView) {
        
        CGRect cellFrame = self.frame;
        //创建轮播滚动视图
        SDCycleScrollView *shuffilingScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, cellFrame.size.width, cellFrame.size.height) delegate:self placeholderImage:[UIImage imageNamed:@""]];
        //shuffilingScrollView.imageURLStringsGroup = imgUrlArr;
        shuffilingScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        shuffilingScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        shuffilingScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
        shuffilingScrollView.autoScrollTimeInterval = 3;
        [self addSubview:shuffilingScrollView];
        
        _shuffilingScrollView = shuffilingScrollView;
    }
    return _shuffilingScrollView;
}

#pragma mark --- 跑马灯代理方法
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    
}


@end
