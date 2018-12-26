//
//  HTWeekProCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HTWeekProCollectionView.h"
#import "HTWeekProCollectionViewCell.h"
#import "HTWeekCollectionReusableView.h"
@interface HTWeekProCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation HTWeekProCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[HTWeekProCollectionViewCell class] forCellWithReuseIdentifier:@"HTWeekProCollectionViewCell"];
        
        // 注册区头
        [self registerClass:[HTWeekCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HTWeekCollectionReusableView"];

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
    return _itemArray.count;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray * arr = _itemArray[section];
    return arr.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HTWeekProCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HTWeekProCollectionViewCell" forIndexPath:indexPath];
    cell.indexPath = indexPath;
    NSArray * arr = _itemArray[indexPath.section];
    cell.model = arr[indexPath.row];
    return cell;
}


-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableView = nil;
    // 区头
    if (kind == UICollectionElementKindSectionHeader) {
        HTWeekCollectionReusableView *headerView = (HTWeekCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HTWeekCollectionReusableView" forIndexPath:indexPath];
        if (_inter == 0) {
            headerView.name = @"本周任务完成情况";
        }else{
            headerView.name = [NSString stringWithFormat:@"第%ld周",indexPath.section];
        }
        headerView.second = indexPath.section;
        reusableView = headerView;
    }
//    // 区尾
//    if (kind == UICollectionElementKindSectionFooter) {
//        CNCollectionReusableFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerIdentifier forIndexPath:indexPath];
//        reusableView = footerView;
//    }
    return reusableView;
}
// 设置区尾尺寸高度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size = CGSizeMake(WIDTH, LENGTH(33));
    return size;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    if (_inter == 0) {
        WS(ws);
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(ws.contentSize.height);
        }];
    }
    
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    _indext = scrollView.contentOffset.x/WIDTH;
//    NSInteger inter;
//    if (index == 0) {
//        inter = index;
//    }
//    if (index == _itemArray.count-1) {
//        inter = index;
//    }
}

@end
