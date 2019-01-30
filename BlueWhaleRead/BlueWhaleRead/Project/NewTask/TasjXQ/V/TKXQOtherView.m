//
//  TKXQOtherView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKXQOtherView.h"
#import "HomeModerateCollectView.h"
#define itemHeight LENGTH(170)

@implementation TKXQOtherView{
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
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((WIDTH - LENGTH(13)*2 -LENGTH(24)*2)/3,itemHeight);
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(13);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(0);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(24), 0, LENGTH(24));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[HomeModerateCollectView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
//        collectView.foundinter = 6;
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(10));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(20));
    }];
}
- (void)setModel:(TAKALLModel *)model{
    _model = model;
    collectView.itemarray = model.bookList;
}
@end
