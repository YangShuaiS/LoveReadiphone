//
//  ArticleTwoDownView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/26.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ArticleTwoDownView.h"
#import "HomeModerateCollectView.h"

#define itemHeight LENGTH(170)

@implementation ArticleTwoDownView{
    HomeModerateCollectView * collectView;
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
    BaseLabel * twotitle = [[BaseLabel alloc] initWithTxteColor:RGB(31,31,31) LabelFont:TextFontCu(14) TextAlignment:NSTextAlignmentLeft Text:@"书籍推荐"];
    [self addSubview:twotitle];
    [twotitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(16));
        make.left.mas_equalTo(ws).with.offset(LENGTH(18));
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((WIDTH - LENGTH(13)*2 -LENGTH(24)*2)/3,itemHeight);
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(0);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(0);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(5), LENGTH(24), 0, LENGTH(24));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[HomeModerateCollectView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectView.foundinter = 6;
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(twotitle.mas_bottom).with.offset(LENGTH(16));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.mas_equalTo(ws);
    }];
}

- (void)setModel:(LunBoTuXQModel *)model{
    _model = model;
    collectView.itemarray = model.bookList;

}

- (void)setZhiShiSHUmodel:(ZhiShiShuModel *)ZhiShiSHUmodel{
    _ZhiShiSHUmodel = ZhiShiSHUmodel;
    collectView.itemarray = ZhiShiSHUmodel.data.bookList;

}

@end
