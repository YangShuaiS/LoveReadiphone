//
//  HomeInterestGroupCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeInterestGroupCollectionView.h"
#import "HomeInterestGroupCollectionViewCell.h"
@interface HomeInterestGroupCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation HomeInterestGroupCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[HomeInterestGroupCollectionViewCell class] forCellWithReuseIdentifier:@"HomeInterestGroupCollectionViewCell"];
        
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
    
    HomeInterestGroupCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeInterestGroupCollectionViewCell" forIndexPath:indexPath];
    cell.model = _itemarray[indexPath.row];
    if (cell.nav == nil) {
        cell.nav = self.nav;
    }
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.contentSize.height);
    }];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}


@end
