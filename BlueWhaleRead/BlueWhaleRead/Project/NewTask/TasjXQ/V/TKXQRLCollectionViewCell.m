//
//  TKXQRLCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKXQRLCollectionViewCell.h"
#import "HorizontalcalCollectionView.h"

@implementation TKXQRLCollectionViewCell{
    HorizontalcalCollectionView * collectionview;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    self.backgroundColor = [UIColor clearColor];
    
    WS(ws);
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((WIDTH-LENGTH(20))/7,LENGTH(55));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(0);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(0);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(0), LENGTH(0), 0, LENGTH(0));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectionview = [[HorizontalcalCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectionview];
    [collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(LENGTH(10));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(10));
        make.bottom.mas_equalTo(ws);
    }];
}

- (void)setModel:(TKXQRLModel *)model{
    _model = model;
    collectionview.qishi = model.qiwz;
    collectionview.itemArray = model.itemarray;
}
@end
