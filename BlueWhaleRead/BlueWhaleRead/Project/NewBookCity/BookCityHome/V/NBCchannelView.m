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
    flowLayout.itemSize = CGSizeMake(WIDTH - LENGTH(44),LENGTH(165));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(0);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = 0;
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(0), 0, LENGTH(0));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    nfcc = [[NBCchannelCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    nfcc.pagingEnabled = YES;
    nfcc.more = YES;
    nfcc.zt = YES;
    [self addSubview:nfcc];
    [nfcc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(10), LENGTH(22), LENGTH(0), LENGTH(22)));
        make.height.mas_equalTo(LENGTH(165));
    }];
}
- (void)setModel:(NBCALLModel *)model{
    _model = model;
    nfcc.nav = self.nav;
    nfcc.itemArray = model.themeTop;
}
@end
