//
//  NMGoodsClassifyViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/11.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMGoodsClassifyViewController.h"
#import "NMGoodsClassifyTableViewCell.h"
#import "NMGoodsClassifyCollectionViewCell.h"
#import "NMGoodsClassifyReusableView.h"
#import "NMSecondSearchViewController.h"

@interface NMGoodsClassifyViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
{
    
    CGSize _rightHeadSize;                      //右边collectionview的headViewSize;
    CGSize _rightItemSize;                      //右边collectionview的itemSize
    NSInteger _currentSelectIndex;              //当前点击cell的索引
    BOOL _isScrollDown;                         //是否往下滚动
}
@property (nonatomic,strong) NMTopOperationBarView *topSearchView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation NMGoodsClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self topSearchView];
    
    [self tableView];
    [self collectionView];
}


#pragma mark -- 创建顶部搜索视图
- (NMTopOperationBarView *)topSearchView{
    if (!_topSearchView) {
        
        CGFloat topViewHeight = 56.;
        NMTopOperationBarView *topSearchView = [[NMTopOperationBarView alloc] initTopSearchViewWithFrame:CGRectMake(0, 0, NMScreenWidth, topViewHeight) isHaveLeft:YES rightTitle:nil rightImgStr:nil];
        [self.view addSubview:topSearchView];
        //        [topSearchView.searchTextField becomeFirstResponder];
        //        topSearchView.searchTextField.delegate = self;
        //        [topSearchView.searchTextField addTarget:self action:@selector(txtFieldChange:) forControlEvents:UIControlEventEditingChanged];
        //        [topSearchView.allDeleteTextBtn addTarget:self action:@selector(deleteTextAction:) forControlEvents:UIControlEventTouchUpInside];
        //        [topSearchView.searchBtn addTarget:self action:@selector(searchGoodsAction:) forControlEvents:UIControlEventTouchUpInside];
        [topSearchView.leftBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        //        topSearchView.searchTextField.delegate = self;
        _topSearchView = topSearchView;
        
        //画线
        [_topSearchView drawBottomLineWithColor:NMf1f1f1];
    }
    return _topSearchView;
}

#pragma mark -- 创建左边的tableView
- (UITableView *)tableView{
    
    if (!_tableView) {
        CGFloat tableViewY = _topSearchView.height;
        CGFloat tableViewWidth = NM70;
        CGFloat tableViewHeight = NMScreenHeight - NMNavbarHeight;
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableViewY, tableViewWidth, tableViewHeight) style:UITableViewStyleGrouped];
        tableView.backgroundColor = NMWhiteC;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = NM47;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        [tableView registerClass:[NMGoodsClassifyTableViewCell class] forCellReuseIdentifier:NSStringFromClass([NMGoodsClassifyTableViewCell class])];
        [self.view addSubview:tableView];
        _tableView = tableView;
        [_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:_currentSelectIndex] animated:YES scrollPosition:UITableViewScrollPositionTop];
        
    }
    
    return _tableView;
}

#pragma mark -- 创建右边的collectionView
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        //打开collectionView悬停效果
        flowLayout.sectionHeadersPinToVisibleBounds = YES;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumInteritemSpacing = NM10;
        flowLayout.minimumLineSpacing = NM10;
        flowLayout.sectionInset = UIEdgeInsetsMake(NM10, NM10, NM10, NM10);
        
        CGFloat collectionViewX = _tableView.width + 1;
        CGFloat collectionViewY = _tableView.top;
        CGFloat collectionViewWidth = NMScreenWidth - collectionViewX;
        CGFloat collectionViewHeight = _tableView.height;
        
        //得到collectionview的itemSize
        CGFloat itemWidth = (collectionViewWidth - NM10*4)/3.0;
        CGFloat itemHeight = itemWidth + NM25;
        _rightItemSize = CGSizeMake(itemWidth, itemHeight);
        //得到collectionview的headviewSize
        _rightHeadSize = CGSizeMake(NMScreenWidth, NM30);

        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(collectionViewX, collectionViewY, collectionViewWidth,collectionViewHeight) collectionViewLayout:flowLayout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        [collectionView setBackgroundColor:[UIColor clearColor]];
        //注册cell
        [collectionView registerClass:[NMGoodsClassifyCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([NMGoodsClassifyCollectionViewCell class])];
        //注册分区头标题
        [collectionView registerClass:[NMGoodsClassifyReusableView class]
           forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                  withReuseIdentifier:@"CollectionViewHeaderView"];
        [self.view addSubview:collectionView];
        _collectionView = collectionView;
    }
    return _collectionView;
}


#pragma mark ------------------- Delegate
#pragma mark -- UITableView DataSource Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 1.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectZero];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectZero];
    if (10 > section) {
        
        footerView.frame = CGRectMake(0, 0, tableView.width, 1.0f);
        footerView.backgroundColor = NMf1f1f1;
    }
    return footerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NMGoodsClassifyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NMGoodsClassifyTableViewCell class]) forIndexPath:indexPath];
    if (10 > indexPath.section) {
        
        cell.firstCateName.text = [NSString stringWithFormat:@"%@",@"推荐专区"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _currentSelectIndex = indexPath.section;
    // http://stackoverflow.com/questions/22100227/scroll-uicollectionview-to-section-header-view
    // 解决点击 TableView 后 CollectionView 的 Header 遮挡问题。
    [self scrollToTopOfSection:_currentSelectIndex animated:YES];
    
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:_currentSelectIndex]
                          atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma mark -- 解决点击 TableView 后 CollectionView 的 Header 遮挡问题
- (void)scrollToTopOfSection:(NSInteger)section animated:(BOOL)animated{
    
    CGRect headerRect = [self frameForHeaderForSection:section];
    CGPoint topOfHeader = CGPointMake(0, headerRect.origin.y - _collectionView.contentInset.top);
    [self.collectionView setContentOffset:topOfHeader animated:animated];
}

#pragma mark -- 从collectionview的结构信息中获取头部header的结构信息，返回header的frame
- (CGRect)frameForHeaderForSection:(NSInteger)section{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
    UICollectionViewLayoutAttributes *attributes = [self.collectionView.collectionViewLayout layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
    return attributes.frame;
}

#pragma mark -- UICollectionView DataSource Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    
    if (10 > section) {
        
        return 10;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NMGoodsClassifyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([NMGoodsClassifyCollectionViewCell class]) forIndexPath:indexPath];
    if (10 > indexPath.section) {
        if (10 > indexPath.row) {
            
            cell.secondClassifyImgView.image = [UIImage imageNamed:@"myUserLogo_Not"];
            cell.secondClassifyName.text = @"手提背包";
        }

    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    

    return _rightItemSize;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    
    NMGoodsClassifyReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionViewHeaderView" forIndexPath:indexPath];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        
        if (10 > indexPath.section) {
            
            view.headTitleLab.text = [NSString stringWithFormat:@"%@",@"推荐专区"];
    
        }
    }
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (10 > section) {
        
        return _rightHeadSize;
    }
    return CGSizeZero;
}

#pragma mark -- CollectionView分区标题即将展示
- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    
    // 当前CollectionView滚动的方向向上，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的）
    if (!_isScrollDown && collectionView.dragging){
        
        [self selectRowAtIndexPath:indexPath.section];
    }
}

#pragma mark --  CollectionView分区标题展示结束
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(nonnull UICollectionReusableView *)view forElementOfKind:(nonnull NSString *)elementKind atIndexPath:(nonnull NSIndexPath *)indexPath{
    
    // 当前CollectionView滚动的方向向下，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的）
    if (_isScrollDown && collectionView.dragging){
        
        [self selectRowAtIndexPath:indexPath.section + 1];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    if (10 > indexPath.section) {
        
        if (10 > indexPath.row) {
            
            NMSecondSearchViewController *vc = [[NMSecondSearchViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

#pragma mark -- 当拖动CollectionView的时候，处理TableView
- (void)selectRowAtIndexPath:(NSInteger)index{
    
    _currentSelectIndex = index;
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

#pragma mark -- UIScrollView Delegate
// 标记一下CollectionView的滚动方向，是向上还是向下
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    static float lastOffsetY = 0;
    
    if (self.collectionView == scrollView){
        
        _isScrollDown = lastOffsetY < scrollView.contentOffset.y;
        lastOffsetY = scrollView.contentOffset.y;
    }
}



#pragma mark --------------按钮执行区
#pragma mark -- 返回按钮点击
- (void)backAction:(UIButton *)button{
    
    [self.navigationController popViewControllerAnimated:YES];
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
