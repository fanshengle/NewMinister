//
//  NMTabBar.m
//  NewMinister
//
//  Created by 范声乐 on 2018/9/28.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMTabBar.h"

@implementation NMTabBar


- (instancetype)init{
    self = [super init];
    if (self) {
        //底部5个按钮
        NMPublishButton *tabbarItemBtn = [NMPublishButton publishButton];
        self.centerTabbarItemBtn = tabbarItemBtn;
        [self addSubview:tabbarItemBtn];
    }
    return self;
}

- (void)layoutSubviews{
    //一定要调用父类原有的布局方法，在这个基础上
    //再来调整5个按钮的位置
    [super layoutSubviews];
    
    self.centerTabbarItemBtn.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.3);
    
    int index = 0;
    CGFloat width = self.bounds.size.width / 5;
    //遍历tabBar中的所有子视图
    //只有当遍历到的子视图的类型是UITabBarButton
    //时，才代表找到的其他按钮，调整位置即可
    for (UIView *sub in self.subviews) {
        
        if ([sub isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            sub.frame = CGRectMake(index * width, self.bounds.origin.y, width, self.bounds.size.height - 2);
            index++;
            if (index == 2) {
                index++;
            }
        }
    }
}

//该方法通过调用每个子视图的pointInside:withEvent:方法遍历视图层次结构，以确定哪个子视图应该接收一个触摸事件。如果pointInside:withEvent:返回YES，则子视图的层次结构将被类似地遍历，直到找到包含指定点的最前端视图为止
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {

    if (self.isHidden == NO) {

        CGPoint newPoint = [self convertPoint:point toView:self.centerTabbarItemBtn];

        if ( [self.centerTabbarItemBtn pointInside:newPoint withEvent:event]) {
            
            return self.centerTabbarItemBtn;
        }else{

            return [super hitTest:point withEvent:event];
        }
    }

    else {
        return [super hitTest:point withEvent:event];
    }
}


@end
