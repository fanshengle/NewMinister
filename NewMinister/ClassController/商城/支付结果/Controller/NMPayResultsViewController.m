//
//  NMPayResultsViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/16.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMPayResultsViewController.h"

#import "NMGoodsWaterFlowCollectionViewCell.h"
#import "NMPayResultsReusableView.h"
#import "NMGoodsDetailsViewController.h"


@interface NMPayResultsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,NMWaterFlowCollectionViewLayoutDelegate>
{
    
    CGSize _headerSize;//断头的size
}
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSString *testStr;
@property (nonatomic,strong) NSString *testStr1;
@end

@implementation NMPayResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _headerSize = CGSizeMake(NMScreenWidth, NM240 + NM35);
    [self setDefaultNavTitle:@"支付结果"];
    [self.navBarView drawBottomLineWithColor:NMf1f1f1];
    [self collectionView];
    
    _testStr = @"我是士大夫看见很多思考辣椒粉哈师大符合了卡萨丁就恢复健康蓝色大海法律框架的十分快乐就好撒到了会计分录回复的索拉卡";
    _testStr1 = @"今天感冒去看医生，结果被人打了一顿，我就去报警，警察来了之后，问我被谁打了";
}

#pragma mark -- 懒加载创建collectionView
- (UICollectionView *)collectionView{
    if (!_collectionView) {

        //设置瀑布流布局
        NMWaterFlowCollectionViewLayout *layout = [NMWaterFlowCollectionViewLayout new];
        layout.columnCount = 2;
        layout.sectionInset = UIEdgeInsetsMake(0, NM10, NM10, NM10);
        layout.rowMargin = NM10;
        layout.columnMargin = NM10;
        layout.delegate = self;
        layout.headerReferenceSize = _headerSize;

        CGFloat collectionViewY = self.navBarView.height;
        CGFloat collectionViewHeight = NMScreenHeight - collectionViewY;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, collectionViewY, NMScreenWidth, collectionViewHeight) collectionViewLayout:layout];
        collectionView.backgroundColor = NMClearC;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.scrollsToTop = YES;
        collectionView.showsVerticalScrollIndicator = NO;
        _collectionView = collectionView;
        [self.view addSubview:collectionView];

        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([UICollectionReusableView class])];
        [_collectionView registerClass:[NMPayResultsReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([NMPayResultsReusableView class])];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
        [_collectionView registerClass:[NMGoodsWaterFlowCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([NMGoodsWaterFlowCollectionViewCell class])];

    }
    return _collectionView;
}

#pragma mark ————— UICollectionView代理方法 —————
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 100;
}

#pragma mark -- 返回headerSize
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    return _headerSize;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([UICollectionReusableView class]) forIndexPath:indexPath];
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]) {
        if (indexPath.section == 0) {

            NMPayResultsReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([NMPayResultsReusableView class]) forIndexPath:indexPath];

            [headerView refresh];
            reusableView = (UICollectionReusableView *)headerView;
        }else{
            reusableView.backgroundColor = NMWhiteC;
            //猜你喜欢lab
            UILabel *guessLikeLab = [[UILabel alloc] init];
            guessLikeLab.text = @"随便看看";
            guessLikeLab.textColor = NMFF5349;
            guessLikeLab.font = NMSystemFont(14);
            [reusableView addSubview:guessLikeLab];
            [guessLikeLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(reusableView);
            }];
        }
    }
    return reusableView;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NMGoodsWaterFlowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([NMGoodsWaterFlowCollectionViewCell class]) forIndexPath:indexPath];
    
    [cell.goodImgView setImage:[UIImage imageNamed:@"myUserLogo_Not"]];
    [cell.goodNameLab setText:@"宝宝感冒"];
    [cell.goodSalePriceLab setText:@"￥450"];
    [cell.goodOrgPriceLab setText:@"￥600"];
    if (indexPath.item == 3 || indexPath.item == 6) {
        cell.goodDescribeLab.text = _testStr;
    }else{
        
        cell.goodDescribeLab.text = _testStr1;
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NMGoodsDetailsViewController *vc = [[NMGoodsDetailsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark ————— NMWaterFlowCollectionViewLayout 代理 —————
- (CGFloat)waterFlowLayout:(NMWaterFlowCollectionViewLayout *)WaterFlowLayout heightForWidth:(CGFloat)width andIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cellWidth = (NMScreenWidth - NM15*2 - NM10)/2;
    NSString *text = @"";
    if (indexPath.item == 3 || indexPath.item == 6) {
        text = _testStr;
    }else{
        
        text = _testStr1;
    }
    CGFloat hobbyH = [text heightForFont:NMSystemFont(13) width:cellWidth-NM8*2];
    NMLog(@"%f",hobbyH);
    CGFloat cellHeight = cellWidth + hobbyH + 85.0;
    return cellHeight;
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
