//
//  NMFirstSearchViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/2.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMFirstSearchViewController.h"

#import "SearchCollectionViewLayout.h"
#import "SearchCollectionCell.h"
#import "SearchReusableView.h"
#import "NMSearchListTableViewCell.h"
#import "NMSecondSearchViewController.h"

static NSString *const _headerViewId = @"HeadViewId";
static NSString *const _searchCollectionCell = @"SearchCollectionCell";

@interface NMFirstSearchViewController ()<UITextViewDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
{
    
    CGFloat _topViewHeight;
    CGFloat _menuViewHeight;
    CGFloat _scrollViewHeight;
}

@property (nonatomic,strong) NMTopOperationBarView *topSearchView;                      //顶部搜索视图
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *searchListArr;                             //搜索结果列表数组
@property (nonatomic,strong) NSMutableArray *collectionViewSectionArr;                  //

@end

@implementation NMFirstSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];

    [self topSearchView];
    [self tableView];
}

#pragma mark ====================创建视图区=====================

#pragma mark -- 创建顶部搜索视图
- (NMTopOperationBarView *)topSearchView{
    if (!_topSearchView) {
        
        _topViewHeight = 56.;
        NMTopOperationBarView *topSearchView = [[NMTopOperationBarView alloc] initTopSearchViewWithFrame:CGRectMake(0, 0, NMScreenWidth, _topViewHeight) rightTitle:@"取消" rightImgStr:nil];
        [topSearchView.searchTextField becomeFirstResponder];
//        topSearchView.searchTextField.delegate = self;
//        [topSearchView.searchTextField addTarget:self action:@selector(txtFieldChange:) forControlEvents:UIControlEventEditingChanged];
//        [topSearchView.allDeleteTextBtn addTarget:self action:@selector(deleteTextAction:) forControlEvents:UIControlEventTouchUpInside];
//        [topSearchView.searchBtn addTarget:self action:@selector(searchGoodsAction:) forControlEvents:UIControlEventTouchUpInside];
        [topSearchView.rightBtn addTarget:self action:@selector(cancelSearchAction:) forControlEvents:UIControlEventTouchUpInside];
        topSearchView.searchTextField.delegate = self;
        [self.view addSubview:topSearchView];
        _topSearchView = topSearchView;
    }
    return _topSearchView;
}

#pragma mark -- 创建tableView
- (UITableView *)tableView{
    
    if (!_tableView) {
        
        CGFloat tableViewHeight = NMScreenHeight - _topViewHeight;
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _topViewHeight, NMScreenWidth, tableViewHeight) style:UITableViewStyleGrouped];
        tableView.backgroundColor = NMWhiteC;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:tableView];
        _tableView = tableView;
        [_tableView registerClass:[NMSearchListTableViewCell class] forCellReuseIdentifier:NSStringFromClass([NMSearchListTableViewCell class])];
    }
    return _tableView;
}

#pragma mark -- 创建热门搜索和历史搜索视图的Collectionview
- (void)setupCollectionView{
    
    if (!_collectionView) {
        
        CGFloat collectionViewTop = _topViewHeight;
        CGFloat collectionViewLeft = NM10;
        CGFloat collectionViewWidth = NMScreenWidth - 2*collectionViewLeft;
        CGFloat collectionViewHeight = NMScreenHeight - collectionViewTop;
        SearchCollectionViewLayout *layout = [[SearchCollectionViewLayout alloc] init];
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(collectionViewLeft, collectionViewTop, collectionViewWidth, collectionViewHeight) collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.alwaysBounceVertical = YES;
        [self.view addSubview:collectionView];
        _collectionView = collectionView;
        
        //注册cell
        [collectionView registerClass:[SearchCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([SearchCollectionCell class])];
        //注册头部视图
        [collectionView registerClass:[SearchReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:_headerViewId];
    }else{
        
        [_collectionView reloadData];
    }
}
#pragma mark ====================代理方法区=====================

#pragma mark ====================代理方法区=====================
#pragma mark ====================代理方法区=====================
#pragma mark ====================代理方法区=====================
#pragma mark ====================代理方法区=====================

#pragma mark ====================代理方法区=====================

#pragma mark ====================按钮点击执行区=====================
- (void)cancelSearchAction:(UIButton *)btn{
    
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark ====================代理区=====================


#pragma mark -- UITableViewDelegate && UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _searchListArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44.0;;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NMSearchListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NMSearchListTableViewCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (_searchListArr.count > indexPath.row) {
        
//        goodsModel *model = _searchGoodsArr[indexPath.row];
//        cell.villageNameLab.text = [NSString stringWithFormat:@"%@",model.goodsName];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_searchListArr.count > indexPath.row) {
        
//        goodsModel *model = _searchGoodsArr[indexPath.row];
//        _textFieldStr = model.goodsName;
//        [self jumpSearchGoodsView];
    }
}

#pragma mark -- 搜索视图删除所有字段按钮点击
- (void)deleteTextAction:(id)sender{

    [_topSearchView.searchTextField resignFirstResponder];

    //_textFieldStr = @"";
//    _topSearchView.searchTextField.text = _textFieldStr;
//    _topSearchView.allDeleteTextBtn.hidden = YES;
//
//    //删除文本内容时，刷新tableView列表数据
//    [self deleteTextRefreshTableList];
}
#pragma mark -- 删除文本内容时，刷新tableView列表数据
- (void)deleteTextRefreshTableList{

    [_searchListArr removeAllObjects];
    [_tableView reloadData];

//    _noDataLab.hidden = YES;
//    _tableView.hidden = YES;
//    _collectionView.hidden = NO;
}

#pragma mark -- 搜索视图输入框字段变化
- (void)txtFieldChange:(UITextField *)textField{

//    _textFieldStr = textField.text;
//    if (![textField.text isEqualToString:@""]) {
//
//        _searchView.allDeleteTextBtn.hidden = NO;
//        //加载搜索数据
//        [self loadSearchGoodsData];
//    }else{
//
//        _searchView.allDeleteTextBtn.hidden = YES;
//        //搜索全部商品
//        [_searchView.searchTextField resignFirstResponder];
//
//        //删除文本内容时，刷新tableView列表数据
//        [self deleteTextRefreshTableList];
//    }
}

#pragma makr ---------------- UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
//    if (![textField.text isEqualToString:@""] && textField.text.length >=1) {
//
//        _searchView.allDeleteTextBtn.hidden = NO;
//    }else{
//
//        _searchView.allDeleteTextBtn.hidden = YES;
//    }
//    _textFieldStr = textField.text;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
//    if([textField.text isEqualToString:@""] == NO && textField.text.length >=1){
//
//        _searchView.allDeleteTextBtn.hidden = NO;
//    }else{
//
//        _searchView.allDeleteTextBtn.hidden = YES;
//    }
//    _textFieldStr = textField.text;
}

//点击键盘上的删除键，调用该方法
- (BOOL)textFieldShouldClear:(UITextField *)textField{

//    if([textField.text isEqualToString:@""]){//搜索全部商品
//
//        _textFieldStr = textField.text;
//    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];

//    _textFieldStr = textField.text;
//    //跳转到搜索商品的界面
//    [self jumpSearchGoodsView];
    NMSecondSearchViewController *vc = [[NMSecondSearchViewController alloc] init];
    vc.currentMenuSelectIndex = 0;
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
