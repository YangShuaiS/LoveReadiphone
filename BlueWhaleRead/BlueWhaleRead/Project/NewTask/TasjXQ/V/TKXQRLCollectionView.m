//
//  TKXQRLCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKXQRLCollectionView.h"
#import "TKXQRLCollectionViewCell.h"
@interface TKXQRLCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation TKXQRLCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[TKXQRLCollectionViewCell class] forCellWithReuseIdentifier:@"TKXQRLCollectionViewCell"];
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
    return _itemArray.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TKXQRLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TKXQRLCollectionViewCell" forIndexPath:indexPath];
    cell.model = _itemArray[indexPath.row];
//    cell.indexPath = indexPath;
//    NSArray * arr = _itemArray[indexPath.section];
//    cell.model = arr[indexPath.row];
    return cell;
}


-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/WIDTH;
    NSInteger inter;
    if (index == 0) {
        inter = index;
        self.block(inter);
    }
    if (index == _itemArray.count-1) {
        inter = index;
        self.block(inter);
    }
}

@end
