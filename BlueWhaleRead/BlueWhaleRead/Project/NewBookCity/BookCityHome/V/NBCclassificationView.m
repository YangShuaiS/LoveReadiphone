//
//  NBCclassificationView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCclassificationView.h"
#import "NBCclassificationCollectionView.h"
#define itemWidth LENGTH(98)
#define itemHeight LENGTH(98)
@implementation NBCclassificationView{
    NBCclassificationCollectionView * collectView;
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
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
//    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(12);
//    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = 0;
//    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(16), 0, LENGTH(16));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[NBCclassificationCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(0));
        make.top.equalTo(ws).with.offset(LENGTH(8));
        make.right.equalTo(ws).with.offset(LENGTH(0));
        make.bottom.equalTo(ws).with.offset(-LENGTH(14));
        make.height.mas_equalTo(itemHeight);
    }];
}

- (void)setModel:(NBCALLModel *)model{
    _model = model;
    collectView.nav =self.nav;
    collectView.itemarray = model.catalogList;
}

@end
