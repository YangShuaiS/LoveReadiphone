//
//  HomeModerateCollectView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeModerateCollectView.h"
#import "HomeModerateCollectionViewCell.h"

#import "BookXqViewController.h"
@interface HomeModerateCollectView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation HomeModerateCollectView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[HomeModerateCollectionViewCell class] forCellWithReuseIdentifier:@"HomeModerateCollectionViewCell"];
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
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
    if (_foundinter ==0) {
        return _itemarray.count;
    }else{
        return _foundinter;
    }
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeModerateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeModerateCollectionViewCell" forIndexPath:indexPath];
    if (_itemarray.count>indexPath.row) {
        cell.model = _itemarray[indexPath.row];
    }
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    if (_itemarray.count>indexPath.row) {
    BookXqViewController * vc = [BookXqViewController new];
    BookListModel * model = _itemarray[indexPath.row];
    vc.loadId = model.ssid;
    [self.nav pushViewController:vc animated:YES];
    }
}


- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.contentSize.height);
    }];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}

- (void)setFoundinter:(NSInteger)foundinter{
    _foundinter = foundinter;
}
@end
