//
//  YDYCollectView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "YDYCollectView.h"
#import "YDYCollectionViewCell.h"
@interface YDYCollectView()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation YDYCollectView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[YDYCollectionViewCell class] forCellWithReuseIdentifier:@"YDYCollectionViewCell"];
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        // 设置是否允许滚动
        self.scrollEnabled = YES;
        //背景颜色
        self.backgroundColor = [UIColor whiteColor];
        self.pagingEnabled = YES;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        //自适应大小
        self.bounces = NO;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.scrollsToTop = NO;
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
    return _array.count;
}
    
    // 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YDYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YDYCollectionViewCell" forIndexPath:indexPath];
    cell.image = _array[indexPath.row];
    return cell;
}
    
-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    
}

- (void)setArray:(NSMutableArray *)array{
    _array = array;
    [self reloadData];
}
- (void)layoutSubviews{
    [super layoutSubviews];
}
@end
