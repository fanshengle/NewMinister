//
//  NMMineHeaderView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/4.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMineHeaderView.h"

@interface NMMineHeaderView()

@property (nonatomic,assign) CGFloat userMsgViewHeight;
@property (nonatomic,assign) CGFloat orderViewHeight;

@end

@implementation NMMineHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _orderViewHeight = 122;
        _userMsgViewHeight = frame.size.height - _orderViewHeight;
        
        [self backImgView];
        [self orderListView];
        [self userMsgView];
    }
    return self;
}

#pragma mark -- 设置头部视图的背景图片
- (UIImageView *)backImgView{
    
    if (!_backImgView) {
        
        UIImageView *backImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myBackImg"]];
        [self addSubview:backImgView];
        [backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.bottom.equalTo(self.mas_bottom).offset(-NM10);
        }];
        _backImgView = backImgView;
    }
    return _backImgView;
}

#pragma mark -- 创建用户基本资料视图
- (NMMineUserMsgView *)userMsgView{
    
    if (!_userMsgView) {

        NMMineUserMsgView *userMsgView = [[NMMineUserMsgView alloc] init];

        [self addSubview:userMsgView];
        //不能将顶部边界作为约束，不然视图会不能滚动
        [userMsgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.equalTo(self.orderListView.mas_top);
            make.height.equalTo(@(self.userMsgViewHeight));
        }];
        _userMsgView = userMsgView;
    }
    return _userMsgView;
}

#pragma mark -- 创建订单列表视图
- (NMMineOrderListView *)orderListView{
    
    if (!_orderListView) {
        
        NMMineOrderListView *orderListView = [[NMMineOrderListView alloc] init];
        orderListView.backgroundColor = [UIColor whiteColor];
        [self addSubview:orderListView];
        [orderListView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(NM15);
            make.right.equalTo(self).offset(-NM15);
            make.bottom.equalTo(self.backImgView);
            make.height.equalTo(@(self.orderViewHeight));
        }];
        _orderListView = orderListView;
    }
    return _orderListView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
