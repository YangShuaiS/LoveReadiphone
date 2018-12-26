//
//  HorizontalcalCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HorizontalcalCollectionView.h"
#import "HorizontalcalCollectionViewCell.h"
@interface HorizontalcalCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation HorizontalcalCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[HorizontalcalCollectionViewCell class] forCellWithReuseIdentifier:@"HorizontalcalCollectionViewCell"];
        
        // 注册区头
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
        self.pagingEnabled = YES;
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
    return _itemArray.count +_qishi;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HorizontalcalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HorizontalcalCollectionViewCell" forIndexPath:indexPath];
    if (_qishi>indexPath.row) {
        [cell wushuju];
    }else{
        cell.model = _itemArray[indexPath.row-_qishi];
    }
    return cell;
}


-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    
}



- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}
- (void)setIndext:(NSInteger)indext{
    _indext = indext;
    if (_indext == 0) {
        [self scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_indext inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
    }else if (_indext == 1){
        [self scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_indext inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
    }else if (_indext == 2){
        [self scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_indext inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
    }
}
@end
