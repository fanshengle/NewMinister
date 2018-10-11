//
//  NMGoodsClassifyCollectionViewCell.m
//  NewMinister
//
//  Created by 范声乐 on 2018/10/11.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMGoodsClassifyCollectionViewCell.h"

@interface NMGoodsClassifyCollectionViewCell ()



@end

@implementation NMGoodsClassifyCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]){
        
        CGFloat jianJu2 = NM2;
        self.secondClassifyImgView = [[UIImageView alloc] initWithFrame:CGRectMake(jianJu2, jianJu2, self.frame.size.width - 2*jianJu2, self.frame.size.width - 2*jianJu2)];
        self.secondClassifyImgView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.secondClassifyImgView];
        
        CGFloat height20 = NM20;
        self.secondClassifyName = [[UILabel alloc] initWithFrame:CGRectMake(jianJu2, self.frame.size.width + jianJu2, self.frame.size.width - 2*jianJu2, height20)];
        self.secondClassifyName.font = NMSystemFont(12);
        self.secondClassifyName.textAlignment = NSTextAlignmentCenter;
        self.secondClassifyName.textColor = NM333333;
        [self.contentView addSubview:self.secondClassifyName];
    }
    return self;
}

//- (void)setModel:(secondClassModel *)model{
//
//    [self.secondClassifyImgView sd_setImageWithURL:[NSURL URLWithString:model.classifyImgUrl] placeholderImage:[UIImage imageNamed:SPGoodsDefaultImg]];
//    self.secondClassifyName.text = model.classifyName;
//}
@end
