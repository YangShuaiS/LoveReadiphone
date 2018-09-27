//
//  HomeFriendReadingCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeFriendReadingCollectionView.h"
#import "HomeFriendCollectionViewCell.h"

#import "BookXqViewController.h"
@interface HomeFriendReadingCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation HomeFriendReadingCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[HomeFriendCollectionViewCell class] forCellWithReuseIdentifier:@"HomeFriendCollectionViewCell"];
        
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
    if (_itemarray.count>=3) {
        return 3;
    }else{
        return _itemarray.count;
    }
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeFriendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeFriendCollectionViewCell" forIndexPath:indexPath];
    [cell color];
    if (cell.nav == nil) {
        cell.nav = self.nav;
    }
    cell.model = _itemarray[indexPath.row];

    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    BookFriendModel * model = _itemarray[indexPath.row];
    BookXqViewController * vc = [BookXqViewController new];
    vc.loadId = model.ssid;
    [self.nav pushViewController:vc animated:YES];
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
@end
