//
//  SzScXuanXiangCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "SzScXuanXiangCollectionView.h"
#import "SzScXXCollectionViewCell.h"
@interface SzScXuanXiangCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation SzScXuanXiangCollectionView{
    SzScXXCollectionViewCell *clickcell;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[SzScXXCollectionViewCell class] forCellWithReuseIdentifier:@"SzScXXCollectionViewCell"];
        
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        // 设置是否允许滚动
        self.scrollEnabled = NO;
        //背景颜色
        self.backgroundColor = [UIColor clearColor];
        //自适应大小
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
    return _itemarray.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SzScXXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SzScXXCollectionViewCell" forIndexPath:indexPath];
    [cell backcolor];
    cell.nav = self.nav;
    cell.model = _itemarray[indexPath.row];
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    [clickcell backcolor];
    clickcell = (SzScXXCollectionViewCell*)[self cellForItemAtIndexPath:indexPath];
    [clickcell color];
    _yhxx = clickcell.model;
}



- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}
@end
