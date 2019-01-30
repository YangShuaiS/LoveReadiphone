//
//  BookXqTopCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/18.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookXqTopCollectionView.h"
#import "BookXqTopCollectionViewCell.h"
#import "HomeActivityViewController.h"
@interface BookXqTopCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation BookXqTopCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[BookXqTopCollectionViewCell class] forCellWithReuseIdentifier:@"BookXqTopCollectionViewCell"];
        
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
        
        _all = 0;
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
    return _all;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BookXqTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BookXqTopCollectionViewCell" forIndexPath:indexPath];
    cell.model = _itemArray[indexPath.row];
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    BookDanModel * mode = _itemArray[indexPath.row];
    HomeActivityViewController * vc = [HomeActivityViewController new];
    vc.hiden = YES;
    vc.itemid = mode.ssid;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.contentSize.height);
    }];
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    _all = itemArray.count;
    [self reloadData];
}
@end
