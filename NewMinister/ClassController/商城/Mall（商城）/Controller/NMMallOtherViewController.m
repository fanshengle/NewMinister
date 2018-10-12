//
//  NMMailOtherViewController.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/2.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMMallOtherViewController.h"
#import "NMGoodsWaterFlowCollectionViewCell.h"

#import "NMGoodsDetailsViewController.h"

@interface NMMallOtherViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,NMWaterFlowCollectionViewLayoutDelegate>

@property (nonatomic,strong) SDCycleScrollView *shufflingScrollView;        //轮播滚动视图
@property (nonatomic,strong) UICollectionView *collectionView;  
@property (nonatomic,strong) NSString *testStr;
@property (nonatomic,strong) NSString *testStr1;

@end

@implementation NMMallOtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _testStr = @"我是士大夫看见很多思考辣椒粉哈师大符合了卡萨丁就恢复健康蓝色大海法律框架的十分快乐就好撒到了会计分录回复的索拉卡";
    _testStr1 = @"今天感冒去看医生，结果被人打了一顿，我就去报警，警察来了之后，问我被谁打了";
    [self collectionView];
}

#pragma mark -- 懒加载创建collectionView
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        
        //设置瀑布流布局
        NMWaterFlowCollectionViewLayout *layout = [NMWaterFlowCollectionViewLayout new];
        layout.columnCount = 2;
        layout.sectionInset = UIEdgeInsetsMake(0, NM15, 0, NM15);;
        layout.rowMargin = NM10;
        layout.columnMargin = NM10;
        layout.delegate = self;
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) collectionViewLayout:layout];
        collectionView.backgroundColor = NMClearC;
        [collectionView registerClass:[NMGoodsWaterFlowCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([NMGoodsWaterFlowCollectionViewCell class])];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [self.view addSubview:collectionView];
        collectionView.scrollsToTop = YES;
        _collectionView = collectionView;
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
