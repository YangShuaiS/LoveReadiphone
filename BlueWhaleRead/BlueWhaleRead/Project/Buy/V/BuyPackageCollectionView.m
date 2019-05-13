//
//  BuyPackageCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/24.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyPackageCollectionView.h"
#import "BuyPackageCollectionViewCell.h"
@interface BuyPackageCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation BuyPackageCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[BuyPackageCollectionViewCell class] forCellWithReuseIdentifier:@"BuyPackageCollectionViewCell"];
        
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
    
    BuyPackageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BuyPackageCollectionViewCell" forIndexPath:indexPath];
    cell.model = _itemarray[indexPath.row];
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    for (BuyPackage *butmodel in _itemarray) {
        butmodel.click = 0;
    }
    BuyPackage * mo = _itemarray[indexPath.row];
    mo.click = 1;
    self.buyStyle(mo);
    [self reloadData];
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    for (NSInteger i = 0 ; i < itemarray.count; i++) {
        BuyPackage * mo = itemarray[i];
        if (mo.click == 1) {
            self.buyStyle(mo);
        }
    }
    [self reloadData];
}
@end
