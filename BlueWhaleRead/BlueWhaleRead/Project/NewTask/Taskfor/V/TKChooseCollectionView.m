//
//  TKChooseCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKChooseCollectionView.h"
#import "TKChooseCollectionViewCell.h"
@interface TKChooseCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation TKChooseCollectionView{
    TKChooseCollectionViewCell *lastcell;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        for (int i = 0; i < 54; i++) {
            NSString * rid = [NSString stringWithFormat:@"TKChooseCollectionViewCell%d",i];
            [self registerClass:[TKChooseCollectionViewCell class] forCellWithReuseIdentifier:rid];
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
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * rid = [NSString stringWithFormat:@"TKChooseCollectionViewCell%ld",indexPath.row];
    TKChooseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rid forIndexPath:indexPath];

    cell.model = _itemArray[indexPath.row];
    if (indexPath.row == 0) {
        _time = 0.5;
        _booknum = 1;
    }
    return cell;
}


-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    
//    TKChooseCollectionViewCell * cell = (TKChooseCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath]; //即为要得到的cell
    _time = 0.5 + 0.5*indexPath.row;
    _booknum = indexPath.row+1;
    for (TKbuiltModel * model in _itemArray) {
        model.style = @"0";
    }
    for (int i = 0; i < _itemArray.count; i++) {
        TKbuiltModel * model = _itemArray[i];
        if (i == indexPath.row) {
            model.style = @"1";
        }else{
            model.style = @"0";
        }
        [self reloadData];
    }

}


- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}

@end
