//
//  NMTopOperationBarView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/9/30.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMTopOperationBarView.h"

@implementation NMTopOperationBarView

- (instancetype)initTopSearchViewWithFrame:(CGRect)frame rightTitle:(NSString *)title rightImgStr:(NSString *)imgStr{
    
    if (self = [super initWithFrame:frame]) {
        
        CGFloat viewHeight = frame.size.height;
        self.backgroundColor = NMWhiteC;
        CGFloat left = NM10;
        CGFloat top = 25.0f;
        CGFloat bottom = 5.0f;
        
        //查看消息按钮
        CGFloat mshWidth = 50.0;
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (!title) {//为空
            
            [_rightBtn setImage:[UIImage imageNamed:imgStr] forState:UIControlStateNormal];
        }else{
            
            [_rightBtn setTitle:title forState:UIControlStateNormal];
            [_rightBtn setTitleColor:NMadadad forState:UIControlStateNormal];
            [_rightBtn.titleLabel setFont:NMSystemFont(13)];
        }
        [self addSubview:_rightBtn];
        [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right);
            make.top.equalTo(self.mas_top).offset(top);
            make.bottom.equalTo(self.mas_bottom).offset(-bottom);
            make.width.equalTo(@(mshWidth));
        }];
        
        //搜索视图
        CGFloat searchViewHeight = viewHeight - top - bottom;
        _searchView = [[UIView alloc] init];
        _searchView.layer.cornerRadius = searchViewHeight/2.0f;
        _searchView.layer.masksToBounds = YES;
        _searchView.backgroundColor = NMf1f1f1;
        [self addSubview:_searchView];
        [_searchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.rightBtn);
            make.left.equalTo(self.mas_left).offset(left);
            make.right.equalTo(self.rightBtn.mas_left);
        }];
        
        //左边搜索图标
        CGFloat width = 14;
        _leftImgView = [[UIImageView alloc] init];
        _leftImgView.contentMode = UIViewContentModeCenter;
        _leftImgView.image = [UIImage imageNamed:@"mail_SearchIconGray"];
        [_searchView addSubview:_leftImgView];
        [_leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.searchView);
            make.left.equalTo(self.searchView.mas_left).offset(left);
            make.width.equalTo(@(width));
        }];
        
        //删除所有text按钮
        _allDeleteTextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //删除搜索框的全部内容
        _allDeleteTextBtn.hidden = YES;
        [_allDeleteTextBtn setImage:[UIImage imageNamed:@"allDelete"] forState:UIControlStateNormal];
        //[_allDeleteTextBtn addTarget:self action:@selector(deleteTextAction:) forControlEvents:UIControlEventTouchUpInside];
        [_searchView addSubview:_allDeleteTextBtn];
        [_allDeleteTextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.searchView.mas_right).offset(-left);
            make.top.bottom.equalTo(self.searchView);
            make.width.equalTo(@(width));
        }];
        
        //搜索框
        CGFloat textFieldLeft = 10.0;
        _searchTextField = [[UITextField alloc] init];
        _searchTextField.borderStyle = UITextBorderStyleNone;
        NSString *partStr = @"搜索商品/条码";
        NSAttributedString *changeStr = [ToolObject ChangeStr:partStr part:partStr Color:NMadadad];
        _searchTextField.attributedPlaceholder = changeStr;
        _searchTextField.font = NMSystemFont(12);
        _searchTextField.returnKeyType = UIReturnKeySearch;
        [_searchView addSubview:_searchTextField];
        [_searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftImgView.mas_right).offset(textFieldLeft);
            make.right.equalTo(self.allDeleteTextBtn.mas_left).offset(-textFieldLeft);
            make.top.bottom.equalTo(self.searchView);
        }];
    }
    return self;
}

/**
 搜索页二级级搜索Controller的顶部搜索视图（二级搜索页面）
 有最左边按钮的搜索视图
 title:最右边按钮lab的title
 imgStr:最右边按钮imgView的图片str
 */
- (instancetype)initTopSearchViewHaveLeftBtnWithFrame:(CGRect)frame rightTitle:(NSString *)title rightImgStr:(NSString *)imgStr{
    
    if (self = [super initWithFrame:frame]) {
        
        CGFloat viewHeight = frame.size.height;
        self.backgroundColor = NMWhiteC;
        CGFloat left = NM10;
        CGFloat top = 25.0f;
        CGFloat bottom = 5.0f;
        
        //返回按钮
        CGFloat leftWidth = 40.0;
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn setImage:[UIImage imageNamed:@"navBar_back"] forState:UIControlStateNormal];
        [self addSubview:_leftBtn];
        [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(0);
            make.top.equalTo(self.mas_top).offset(top);
            make.bottom.equalTo(self.mas_bottom).offset(-bottom);
            make.width.equalTo(@(leftWidth));
        }];
        
        //查看消息按钮
        CGFloat rightWidth = 50.0;
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (!title) {//为空
            
            [_rightBtn setImage:[UIImage imageNamed:imgStr] forState:UIControlStateNormal];
        }else{
            
            [_rightBtn setTitle:title forState:UIControlStateNormal];
            [_rightBtn setTitleColor:NMadadad forState:UIControlStateNormal];
            [_rightBtn.titleLabel setFont:NMSystemFont(13)];
        }
        [self addSubview:_rightBtn];
        [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right);
            make.top.equalTo(self.mas_top).offset(top);
            make.bottom.equalTo(self.mas_bottom).offset(-bottom);
            make.width.equalTo(@(rightWidth));
        }];
        
        //搜索视图
        CGFloat searchViewHeight = viewHeight - top - bottom;
        _searchView = [[UIView alloc] init];
        _searchView.layer.cornerRadius = searchViewHeight/2.0f;
        _searchView.layer.masksToBounds = YES;
        _searchView.backgroundColor = NMf1f1f1;
        [self addSubview:_searchView];
        [_searchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.rightBtn);
            make.left.equalTo(self.leftBtn.mas_right).offset(0);
            make.right.equalTo(self.rightBtn.mas_left);
        }];
        
        //左边搜索图标
        CGFloat width = 14;
        _leftImgView = [[UIImageView alloc] init];
        _leftImgView.contentMode = UIViewContentModeCenter;
        _leftImgView.image = [UIImage imageNamed:@"mail_SearchIconGray"];
        [_searchView addSubview:_leftImgView];
        [_leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.searchView);
            make.left.equalTo(self.searchView.mas_left).offset(left);
            make.width.equalTo(@(width));
        }];
        
        //删除所有text按钮
        _allDeleteTextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //删除搜索框的全部内容
        _allDeleteTextBtn.hidden = YES;
        [_allDeleteTextBtn setImage:[UIImage imageNamed:@"allDelete"] forState:UIControlStateNormal];
        //[_allDeleteTextBtn addTarget:self action:@selector(deleteTextAction:) forControlEvents:UIControlEventTouchUpInside];
        [_searchView addSubview:_allDeleteTextBtn];
        [_allDeleteTextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.searchView.mas_right).offset(-left);
            make.top.bottom.equalTo(self.searchView);
            make.width.equalTo(@(width));
        }];
        
        //搜索框
        CGFloat textFieldLeft = 10.0;
        _searchTextField = [[UITextField alloc] init];
        _searchTextField.borderStyle = UITextBorderStyleNone;
        NSString *partStr = @"搜索商品/条码";
        NSAttributedString *changeStr = [ToolObject ChangeStr:partStr part:partStr Color:NMf1f1f1];
        _searchTextField.attributedPlaceholder = changeStr;
        _searchTextField.font = NMSystemFont(12);
        _searchTextField.returnKeyType = UIReturnKeySearch;
        [_searchView addSubview:_searchTextField];
        [_searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftImgView.mas_right).offset(textFieldLeft);
            make.right.equalTo(self.allDeleteTextBtn.mas_left).offset(-textFieldLeft);
            make.top.bottom.equalTo(self.searchView);
        }];
    }
    return self;
}

@end
