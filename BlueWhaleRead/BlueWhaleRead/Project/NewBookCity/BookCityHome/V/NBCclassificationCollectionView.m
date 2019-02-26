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

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return UIEdgeInsetsMake(0, LENGTH(22)+LENGTH(6)+LENGTH(51), 0, LENGTH(22)+LENGTH(6)+LENGTH(51));//上左下右
    }else{
        return UIEdgeInsetsMake(LENGTH(12), LENGTH(22), 0, LENGTH(22));//上左下右
    }
}
// 设置组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _itemarray.count;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSMutableArray * arr = _itemarray[section];
    return arr.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NBCclassificationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NBCclassificationCollectionViewCell" forIndexPath:indexPath];
    cell.model = _itemarray[indexPath.section][indexPath.row];
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
        NBCclassificationModel * model = _itemarray[indexPath.section][indexPath.row];
        BookCityViewController * vc = [BookCityViewController new];
        NSIndexPath * indpath = [NSIndexPath indexPathForRow:0 inSection:[model.ssid intValue]];
        vc.inpath = indpath;
        vc.cata = [NSString stringWithFormat:@"10%@",model.ssid];
        [self.nav pushViewController:vc animated:YES];
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    NSMutableArray * onearray = [NSMutableArray array];
    NSMutableArray * twoarray = [NSMutableArray array];
    for (NBCclassificationModel * model in itemarray) {
        if (onearray.count <2) {
            [onearray addObject:model];
        }else{
            [twoarray addObject:model];
        }
    }
    _itemarray = [NSMutableArray array];
    [_itemarray addObject:onearray];
    [_itemarray addObject:twoarray];
    [self reloadData];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.contentSize.height);
    }];
}
@end
