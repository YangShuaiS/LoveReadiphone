//
//  ZhiShiShuRelationCollectionVIew.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/17.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ZhiShiShuRelationCollectionVIew.h"
#import "ZhiShiShuRelationCollectionViewCell.h"
@interface ZhiShiShuRelationCollectionVIew ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation ZhiShiShuRelationCollectionVIew

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[ZhiShiShuRelationCollectionViewCell class] forCellWithReuseIdentifier:@"ZhiShiShuRelationCollectionViewCell"];
        
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        // 设置是否允许滚动
        self.scrollEnabled = YES;
        //背景颜色
        self.backgroundColor = [UIColor clearColor];
        //自适应大小
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.scrollsToTop = NO;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
}
    return self;
}
#pragma mark *** UICollectionViewDataSource ***
// 设置组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _itemarray.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZhiShiShuRelationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZhiShiShuRelationCollectionViewCell" forIndexPath:indexPath];
    cell.textcolor = _textcolor;
    cell.model = _itemarray[indexPath.row];
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{

}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.contentSize.height);
    }];
}
@end
