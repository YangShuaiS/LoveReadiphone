//
//  NBCchannelView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCchannelView.h"
#import "NBCchannelCollectionView.h"
@implementation NBCchannelView{
    NBCchannelCollectionView * nfcc;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(160),LENGTH(86));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(12);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = 0;
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(22), 0, LENGTH(22));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    nfcc = [[NBCchannelCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    nfcc.more = YES;
    nfcc.zt = YES;
    [self addSubview:nfcc];
    [nfcc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(14), 0, LENGTH(14), 0));
        make.height.mas_equalTo(LENGTH(86)+LENGTH(14)+LENGTH(14));
    }];
}
- (void)setModel:(NBCALLModel *)model{
    _model = model;
    nfcc.nav = self.nav;
    nfcc.itemArray = model.themeTop;
}
@end
