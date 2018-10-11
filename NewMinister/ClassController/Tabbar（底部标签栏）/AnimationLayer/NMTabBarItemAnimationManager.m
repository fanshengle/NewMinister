//
//  NMTabBarItemAnimationManger.m
//  NewMinister
//
//  Created by 范声乐 on 2018/9/28.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMTabBarItemAnimationManager.h"

@implementation NMTabBarItemAnimationManager

- (instancetype)init {
    if (self = [super init]) {
        
        self.duration = 0.25;
    }
    return self;
}

- (void)playAnimation:(UIImageView *)barIcon textLabel:(UILabel *)barTitle {
    
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = self.duration;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [barIcon.layer addAnimation:animation forKey:nil];
}

- (void)selectedState:(UIImageView *)barIcon textLabel:(UILabel *)barTitle {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.fromValue = @(-2);
    animation.toValue = @(2);
    animation.duration = self.duration;
    animation.autoreverses = YES;
    animation.repeatCount = 1;
    [barIcon.layer addAnimation:animation forKey:nil];
}

- (void)deselectAnimation:(UIImageView *)barIcon textLabel:(UILabel *)barTitle {
    
    CATransition *transiton = [CATransition animation];
    transiton.type = kCATransitionFade;
    transiton.duration = self.duration;
    transiton.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [barIcon.layer addAnimation:transiton forKey:nil];
}


@end
