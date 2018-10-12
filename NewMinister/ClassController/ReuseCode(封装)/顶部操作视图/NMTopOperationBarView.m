//
//  NMTopOperationBarView.m
//  NewMinister
//
//  Created by 范声乐 on 2018/9/30.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMTopOperationBarView.h"

@interface NMTopOperationBarView()


@end

@implementation NMTopOperationBarView
/**
 顶部搜索视图风格
 isHaveLeft:是否有左边按钮
 rightTitle:最右边按钮lab的title
 rightImgStr:最右边按钮imgView的图片str
 */
- (instancetype)initTopSearchViewWithFrame:(CGRect)frame isHaveLeft:(BOOL)isHave rightTitle:(NSString *)title rightImgStr:(NSString *)imgStr{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = NMWhiteC;

        CGFloat viewHeight = frame.size.height;
        CGFloat left = 0;
        CGFloat top = 25.0f;
        CGFloat bottom = 5.0f;
        CGFloat height = viewHeight - top - bottom;
        //左边返回按钮
        CGFloat leftWidth = 0.0;
        if (isHave) {//有左边返回按钮
            
            leftWidth = 40.0;
            _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            _leftBtn.frame = CGRectMake(left, top, leftWidth, height);
            [_leftBtn setImage:[UIImage imageNamed:@"navBar_back"] forState:UIControlStateNormal];
            [self addSubview:_leftBtn];
        }
        
        //右边按钮
        CGFloat rightWidth = 0;
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (title != nil || imgStr != nil) {//有右边按钮
            
            if (title == nil){//标题为空
                
                [_rightBtn setImage:[UIImage imageNamed:imgStr] forState:UIControlStateNormal];
            }else{//图片字符为空
                
                [_rightBtn setTitle:title forState:UIControlStateNormal];
                [_rightBtn setTitleColor:NMadadad forState:UIControlStateNormal];
                [_rightBtn.titleLabel setFont:NMSystemFont(13)];
            }
            
            rightWidth = 50;
            CGFloat rightX = frame.size.width - rightWidth;
            _rightBtn.frame = CGRectMake(rightX, _leftBtn.top, rightWidth, _leftBtn.height);
            [self addSubview:_rightBtn];
        }
        
        CGFloat viewWidth = frame.size.width;
        CGFloat searchJianJu = 0;
        CGFloat searchWidth = 0;
        //搜索视图
        if (leftWidth == 0 && rightWidth == 0) {//没有左右按钮
            
            searchJianJu = NM15;
            searchWidth = frame.size.width - searchJianJu*2;
        }else if (leftWidth != 0 && rightWidth == 0){//有左按钮，没有右按钮
            
            searchJianJu = leftWidth;
            searchWidth = viewWidth - leftWidth - searchJianJu;
        }else if(leftWidth == 0 && rightWidth != 0){//没有左按钮，有右按钮
            
            searchJianJu = NM15;
            searchWidth = viewWidth - rightWidth - searchJianJu;
        }else{//左右按钮都有
            
            searchJianJu = leftWidth;
            searchWidth = viewWidth - leftWidth - rightWidth;
        }
        
        _searchView = [[UIView alloc] initWithFrame:CGRectMake(searchJianJu, top, searchWidth, height)];
        _searchView.backgroundColor = NMf1f1f1;
        [self addSubview:_searchView];
        //设置圆角
        [_searchView setCornerRadius:height/2.0];

        //在searchView上布局子视图
        [self setupSubviewsOnSearchView];
    }
    return self;
}

#pragma mark -- 在searchView上布局子视图
- (void)setupSubviewsOnSearchView{
    
    //左边搜索图标
    CGFloat width = 14;
    _leftImgView = [[UIImageView alloc] init];
    _leftImgView.contentMode = UIViewContentModeCenter;
    _leftImgView.image = [UIImage imageNamed:@"mail_SearchIconGray"];
    [_searchView addSubview:_leftImgView];
    [_leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.searchView);
        make.left.equalTo(self.searchView.mas_left).offset(self.left);
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
        make.right.equalTo(self.searchView.mas_right).offset(-self.left);
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

/**
 搜索页一级级搜索Controller的顶部搜索视图（一级搜索页面）
 没有最左边按钮的搜索视图
 title:最右边按钮lab的title
 imgStr:最右边按钮imgView的图片str
 */
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
 title和imgStr都为nil的时候没有右边按钮
 */
- (instancetype)initTopSearchViewHaveLeftBtnWithFrame:(CGRect)frame rightTitle:(NSString *)title rightImgStr:(NSString *)imgStr{
    
    if (self = [super initWithFrame:frame]) {
        
        CGFloat viewHeight = frame.size.height;
        self.backgroundColor = NMWhiteC;
        CGFloat left = NM10;
        CGFloat top = 25.0f;
        CGFloat bottom = 5.0f;
        
        //左边返回按钮
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
        
        //右边按钮
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
