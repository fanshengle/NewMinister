//
//  NMNotesViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/3.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMNotesListViewController.h"

#import "NMNotesWaterFlowCollectionViewCell.h"

@interface NMNotesListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,NMWaterFlowCollectionViewLayoutDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSString *testStr;
@property (nonatomic,strong) NSString *testStr1;
@end

@implementation NMNotesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = NMWhiteC;
    _testStr = @"今天感冒去看医生，结果被人打了一顿，我就去报警，警察来了之后，问我被谁打了";

    [self collectionView];
}


#pragma mark -- 懒加载创建collectionView
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        
        //设置瀑布流布局
        NMWaterFlowCollectionViewLayout *layout = [NMWaterFlowCollectionViewLayout new];
        layout.columnCount = 2;
        layout.sectionInset = UIEdgeInsetsMake(0, NM15, 0, NM15);;
        layout.rowMargin = NM15;
        layout.columnMargin = NM15;
        layout.delegate = self;
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,  self.view.width, self.view.height) collectionViewLayout:layout];
        collectionView.backgroundColor = NMClearC;
        [collectionView registerClass:[NMNotesWaterFlowCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([NMNotesWaterFlowCollectionViewCell class])];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [self.view addSubview:collectionView];
        collectionView.scrollsToTop = YES;
        _collectionView = collectionView;
        
//        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
//        header.automaticallyChangeAlpha = YES;
//        header.lastUpdatedTimeLabel.hidden = YES;
//        header.stateLabel.hidden = YES;
//        _collectionView.mj_header = header;
//        
//        //底部刷新
//        _collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
         
    }
    return _collectionView;
}

#pragma mark ====================代理区=====================
#pragma mark ————— collection代理方法 —————
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 100;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NMNotesWaterFlowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([NMNotesWaterFlowCollectionViewCell class]) forIndexPath:indexPath];
    [cell.noteImgView setImage:[UIImage imageNamed:@"myUserLogo_Not"]];
    [cell.noteDescribeLab setText:_testStr];
    [cell.userLogoImgView setImage:[UIImage imageNamed:@"myUserLogo_Not"]];
    [cell.userNameLab setText:@"小朋友看了把持不住"];
    [cell.collectBtn setTitle:@"1000" forState:UIControlStateNormal];
    return cell;
}

#pragma mark ————— layout 代理 —————
-(CGFloat)waterFlowLayout:(NMWaterFlowCollectionViewLayout *)WaterFlowLayout heightForWidth:(CGFloat)width andIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cellWidth = (NMScreenWidth - NM15*3)/2;
    CGFloat imgHeight = cellWidth;
    if (indexPath.item == 3 || indexPath.item == 6) {
        imgHeight = cellWidth + 30.0;
    }
    CGFloat cellHeight = imgHeight + 66;
    return cellHeight;
}

//*******重写的时候需要走一句话
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    //标记cell
//    [self.collectionView setCurrentIndexPath:indexPath];
//
//    NMNotesWaterFlowCollectionViewCell *cell =(NMNotesWaterFlowCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
//
//    ProfileViewController *profileVC = [ProfileViewController new];
//    profileVC.headerImage = cell.imgView.image;
//    profileVC.isTransition = YES;
//    [self.navigationController pushViewController:profileVC animated:YES];

}


#pragma mark ====================方法执行区=====================

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
