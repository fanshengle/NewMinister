//
//  NMTopOperationBarView.h
//  NewMinister
//
//  Created by 范声乐 on 2018/9/30.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMTopOperationBarView : UIView


@property (nonatomic,strong) UIView *searchView;                                //搜索视图
@property (nonatomic,strong) UIImageView *leftImgView;                          //左边的搜索图标按钮
@property (nonatomic,strong) UITextField *searchTextField;                      //搜索输入框
@property (nonatomic,strong) UIButton *allDeleteTextBtn;                        //删除所有文本按钮

@property (nonatomic,strong) UIButton *searchBtn;                               //搜索按钮
@property (nonatomic,strong) UIButton *leftBtn;                                 //最左边按钮
@property (nonatomic,strong) UIButton *rightBtn;                                //最右边按钮

@property (nonatomic,strong) NSString *textPlaceholder;                         //文本占位符


/**
搜索页一级级搜索Controller的顶部搜索视图（一级搜索页面）
 没有最左边按钮的搜索视图
 title:最右边按钮lab的title
 imgStr:最右边按钮imgView的图片str
 */
- (instancetype)initTopSearchViewWithFrame:(CGRect)frame rightTitle:(NSString *)title rightImgStr:(NSString *)imgStr;

/**
 搜索页二级级搜索Controller的顶部搜索视图（二级搜索页面）
 有最左边按钮的搜索视图
 title:最右边按钮lab的title
 imgStr:最右边按钮imgView的图片str
 */
- (instancetype)initTopSearchViewHaveLeftBtnWithFrame:(CGRect)frame rightTitle:(NSString *)title rightImgStr:(NSString *)imgStr;

/**
 顶部搜索视图风格
 isHaveLeft:是否有左边按钮
 rightTitle:最右边按钮lab的title
 rightImgStr:最右边按钮imgView的图片str
 */
- (instancetype)initTopSearchViewWithFrame:(CGRect)frame isHaveLeft:(BOOL)isHave rightTitle:(NSString *)title rightImgStr:(NSString *)imgStr;

@end
