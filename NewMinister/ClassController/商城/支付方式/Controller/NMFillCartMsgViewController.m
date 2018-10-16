//
//  NMFillCartMsgViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMFillCartMsgViewController.h"
#import "NMFillCartMsgTableViewCell.h"
#import "NMFillCartMsgModel.h"

@interface NMFillCartMsgViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIButton *allDeleteTextBtn;
@property (nonatomic,strong) NSMutableArray *cartMsgListArr;

@property (nonatomic,strong) NSString *nameTxtField;
@property (nonatomic,strong) NSString *phoneTxtField;
@property (nonatomic,strong) NSString *idCartTxtField;


@end

@implementation NMFillCartMsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setDefaultNavTitle:@"填写信息"];
    
    NMFillCartMsgModel *model = [[NMFillCartMsgModel alloc] init];
    self.cartMsgListArr = [model enumToGetModelListArr];
    
    [self tableView];
}

#pragma mark -- 创建tableView
- (UITableView *)tableView{
    
    if (!_tableView) {
        
        CGFloat tableViewY = self.navBarView.height;
        CGFloat tableViewHeight = NMScreenHeight - tableViewY;
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableViewY, NMScreenWidth, tableViewHeight) style:UITableViewStyleGrouped];
        tableView.backgroundColor = NMf4f8fb;
        tableView.scrollEnabled = NO;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        [tableView registerClass:[NMFillCartMsgTableViewCell class] forCellReuseIdentifier:NSStringFromClass([NMFillCartMsgTableViewCell class])];
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

#pragma mark -- 返回sectionHeaderView
- (UIView *)returnSectionHeaderViewWithSection:(NSInteger)section{
    
    UIView *headerView = [[UIView alloc] init];
    
    NSString *textStr = @"信息智能加密,仅用于银行验证";
    if (section != 0) {
        
        textStr = @"请填写银行预留信息";
    }
    
    CGFloat left = NM15;
    UILabel *addBankCartLab = [[UILabel alloc] init];
    addBankCartLab.font = NMSystemFont(13);
    addBankCartLab.text = textStr;
    addBankCartLab.textColor = NM666666;
    [headerView addSubview:addBankCartLab];
    [addBankCartLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(headerView.mas_left).offset(left);
        make.top.bottom.equalTo(headerView);
    }];
    
    return headerView;
}


#pragma mark =============== 协议区 =============
#pragma mark -- UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _cartMsgListArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    CGFloat rowCount = 1;
    if (self.cartMsgListArr.count > section) {
        
        NSArray *arr = self.cartMsgListArr[section];
        rowCount = arr.count;
    }
    return rowCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  NM44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [self returnSectionHeaderViewWithSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return NM50;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NMFillCartMsgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NMFillCartMsgTableViewCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.cartMsgListArr.count > indexPath.section) {
        NSArray *listArr = self.cartMsgListArr[indexPath.section];
        if (listArr.count > indexPath.row) {
            NMFillCartMsgModel *model = listArr[indexPath.row];
            cell.model = model;
            
            cell.inputTxtField.tag = indexPath.row;
            [cell.inputTxtField addTarget:self action:@selector(txtFieldChange:) forControlEvents:UIControlEventEditingChanged];
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.row == 2) {
        
    }else{
        
        
    }
}

#pragma mark -- textField输入变化
- (void)txtFieldChange:(UITextField *)textField{
    
    if (textField.tag == 1) {//姓名
        
        _nameTxtField = textField.text;
    }else if (textField.tag == 2){//电话
        
        _idCartTxtField = textField.text;
    }else if (textField.tag == 3){//地址
        
        _phoneTxtField = textField.text;
    }
}


#pragma mark -------------------- Delegate
#pragma mark -- UITextFieldDelegate
#pragma mark -- 过滤特殊字符
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSUInteger proposedNewLength = textField.text.length - range.length + string.length;
    if ([ToolObject isInputRuleAndNumber:string] || [string isEqualToString:@""]) {
        if (textField.tag == 2) {//电话号码
            if (proposedNewLength > 11){
                
                return NO;//限制长度
            }
        }
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    if (textField.tag == 3) {//地址
        if (_nameTxtField.length > 0 && _phoneTxtField.length > 0 && _idCartTxtField.length > 0) {
            //[self applyOpenShopSendDataToServer];
        }
    }
    return YES;
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
