//
//  NBCclassificationCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCclassificationCollectionView.h"
#import "NBCclassificationCollectionViewCell.h"
#import "BookCityViewController.h"
@interface NBCclassificationCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation NBCclassificationCollectionView{
    NSInteger cshgs;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[NBCclassificationCollectionViewCell class] forCellWithReuseIdentifier:@"NBCclassificationCollectionViewCell"];
        
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
        
        cshgs = 6;
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
    return cshgs;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NBCclassificationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NBCclassificationCollectionViewCell" forIndexPath:indexPath];
    if (_itemarray.count == cshgs) {
        cell.model = _itemarray[indexPath.row];
    }
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    if (_itemarray.count == cshgs) {
        NBCclassificationModel * model = _itemarray[indexPath.row];
        BookCityViewController * vc = [BookCityViewController new];
        NSIndexPath * indpath = [NSIndexPath indexPathForRow:0 inSection:[model.ssid intValue]];
        vc.inpath = indpath;
        vc.cata = [NSString stringWithFormat:@"10%@",model.ssid];
        [self.nav pushViewController:vc animated:YES];
    }
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    cshgs = itemarray.count;
    [self reloadData];
}

@end
