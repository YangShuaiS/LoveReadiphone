//
//  BuyInvitationPeopleCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/24.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyInvitationPeopleCollectionView.h"
#import "BuyInvitationPeopleCollectionViewCell.h"

@interface BuyInvitationPeopleCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation BuyInvitationPeopleCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[BuyInvitationPeopleCollectionViewCell class] forCellWithReuseIdentifier:@"BuyInvitationPeopleCollectionViewCell"];
        
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
    return _itemarray.count + _addinter;
//    return 100;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BuyInvitationPeopleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BuyInvitationPeopleCollectionViewCell" forIndexPath:indexPath];
    if (indexPath.row <_itemarray.count) {
        cell.model = _itemarray[indexPath.row];
    }
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}
@end
