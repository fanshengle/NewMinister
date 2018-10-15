//
//  NMBankCartViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMAddBankCartViewController.h"
#import "NMFillCartMsgViewController.h"

@interface NMAddBankCartViewController ()<UITextFieldDelegate>
{
    
    NSString *_textFieldStr;
}

@property (nonatomic,strong) UIButton *allDeleteTextBtn;
@property (nonatomic,strong) UITextField *carNumberTxtField;
@end

@implementation NMAddBankCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setDefaultNavTitle:@"添加银行卡"];
    
    [self setupAddBankCartView];
}
#pragma mark -- 创建添加银行卡视图
- (void)setupAddBankCartView{
    
    CGFloat bankCartHeight = NM50;
    CGFloat left = NM15;
    UILabel *addBankCartLab = [[UILabel alloc] init];
    addBankCartLab.font = NMSystemFont(13);
    addBankCartLab.text = @"请添加持卡人本人的银行卡";
    addBankCartLab.textColor = NM666666;
    [self.view addSubview:addBankCartLab];
    [addBankCartLab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view.mas_left).offset(left);
        make.top.equalTo(self.navBarView.mas_bottom);
        make.height.equalTo(@(bankCartHeight));
    }];
    
    //卡号视图
    CGFloat carNumberHeight = NM44;
    UIView *cardNumberView = [[UIView alloc] init];
    cardNumberView.backgroundColor = NMWhiteC;
    [self.view addSubview:cardNumberView];
    [cardNumberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(addBankCartLab.mas_bottom);
        make.height.equalTo(@(carNumberHeight));
    }];
    
    //卡号lab
    UILabel *carNumberLab = [[UILabel alloc] init];
    carNumberLab.font = NMSystemFont(14);
    carNumberLab.text = @"卡号";
    carNumberLab.textColor = NM333333;
    CGFloat width = [carNumberLab.text widthForFont:NMSystemFont(14)]+1;
    [cardNumberView addSubview:carNumberLab];
    [carNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(cardNumberView.mas_left).offset(left);
        make.centerY.equalTo(cardNumberView.mas_centerY);
        make.width.equalTo(@(width));
    }];
    
    CGFloat btnWidth = NM40;
    //删除所有text按钮
    UIButton *allDeleteTextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //删除搜索框的全部内容
    allDeleteTextBtn.hidden = YES;
    [allDeleteTextBtn setImage:[UIImage imageNamed:@"allDelete"] forState:UIControlStateNormal];
    [allDeleteTextBtn addTarget:self action:@selector(deleteTextAction:) forControlEvents:UIControlEventTouchUpInside];
    [cardNumberView addSubview:allDeleteTextBtn];
    _allDeleteTextBtn = allDeleteTextBtn;
    [allDeleteTextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(cardNumberView.mas_right);
        make.top.bottom.equalTo(cardNumberView);
        make.width.equalTo(@(btnWidth));
    }];
    
    //输入卡号text
    UITextField *carNumberTxtField = [[UITextField alloc] init];
    carNumberTxtField.textColor = NM333333;
    carNumberTxtField.font = NMSystemFont(14);
    carNumberTxtField.delegate = self;
    NSString *partStr = @"无需网银/免手续费";
    NSAttributedString *changeStr = [ToolObject ChangeStr:partStr part:partStr Color:NM999999];
    carNumberTxtField.attributedPlaceholder = changeStr;
    [carNumberTxtField addTarget:self action:@selector(txtFieldChange:) forControlEvents:UIControlEventEditingChanged];
    
    [cardNumberView addSubview:carNumberTxtField];
    _carNumberTxtField = carNumberTxtField;
    [carNumberTxtField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(carNumberLab.mas_right).offset(left);
        make.centerY.equalTo(cardNumberView.mas_centerY);
        make.right.equalTo(allDeleteTextBtn.mas_left);
    }];
    
    //下一步按钮
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.backgroundColor = NMFF5349;
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:NMWhiteC forState:UIControlStateNormal];
    [nextBtn.titleLabel setFont:NMSystemFont(14)];
    [nextBtn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(carNumberTxtField.mas_bottom).offset(carNumberHeight);
        make.left.equalTo(self.view.mas_left).offset(left);
        make.right.equalTo(self.view.mas_right).offset(-left);
        make.height.equalTo(@(NM40));
    }];
    //设置圆角
    [nextBtn setCornerRadius:5.0];
}

#pragma mark -- 文本代理

#pragma mark -- 搜索视图输入框字段变化
- (void)txtFieldChange:(UITextField *)textField{
    
    _textFieldStr = textField.text;
    if (![textField.text isEqualToString:@""]) {
    
        _allDeleteTextBtn.hidden = NO;
    }else{
    
        _allDeleteTextBtn.hidden = YES;
        //搜索全部商品
        [_carNumberTxtField resignFirstResponder];
    
        //删除文本内容时，刷新tableView列表数据
        //[self deleteTextRefreshTableList];
    }
}

#pragma makr ---------------- UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (![textField.text isEqualToString:@""] && textField.text.length >=1) {
    
        _allDeleteTextBtn.hidden = NO;
    }else{
    
        _allDeleteTextBtn.hidden = YES;
    }
        _textFieldStr = textField.text;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if([textField.text isEqualToString:@""] == NO && textField.text.length >=1){
    
        _allDeleteTextBtn.hidden = NO;
    }else{
    
        _allDeleteTextBtn.hidden = YES;
    }
    _textFieldStr = textField.text;
}

//点击键盘上的删除键，调用该方法
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    if([textField.text isEqualToString:@""]){//搜索全部商品
    
        _textFieldStr = textField.text;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    //    _textFieldStr = textField.text;
    //    //跳转到搜索商品的界面
    //    [self jumpSearchGoodsView];
    NMFillCartMsgViewController *vc = [[NMFillCartMsgViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
    return YES;
}

#pragma mark -- 过滤特殊字符，特殊字符输入不显示
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if ([ToolObject isInputRuleAndNumber:string] || [string isEqualToString:@""]) {
        
        return YES;
    }else{
        
        //正则匹配搜索关键字过滤特殊字符
        if ([ToolObject checkSearchKeyName:string]) {
            
            return YES;
        }else{
            
            return NO;
        }
    }
}


#pragma mark  ===========按钮点击去============
#pragma mark -- 下一步按钮点击
- (void)nextAction:(UIButton *)button{
    
    NMFillCartMsgViewController *vc = [[NMFillCartMsgViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}

#pragma mark -- 删除文本
- (void)deleteTextAction:(UIButton *)button{
    
    _textFieldStr = @"";
    _carNumberTxtField.text = _textFieldStr;
    _allDeleteTextBtn.hidden = YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
