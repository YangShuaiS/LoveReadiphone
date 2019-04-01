//
//  NBTBookDanCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBTBookDanCollectionView.h"
#import "NBTBookDanCollectionViewCell.h"
#import "HomeActivityViewController.h"
@interface NBTBookDanCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation NBTBookDanCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        NSString * str = @"";
        for (int i = 0; i < 10; i++) {
            str = [NSString stringWithFormat:@"NBTBookDanCollectionViewCell%d",i];
            [self registerClass:[NBTBookDanCollectionViewCell class] forCellWithReuseIdentifier:str];
        }
        
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
    return _itemArray.count;
//    return 10;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * str = @"";
    for (int i = 0; i < 10; i++) {
        str = [NSString stringWithFormat:@"NBTBookDanCollectionViewCell%d",i];
    }
    
    NBTBookDanCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:str forIndexPath:indexPath];
//    cell.url = _itemArray[indexPath.row];
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
    [self reloadData];
}

@end
