//
//  NBCBookDanCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/11.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NBCBookDanCollectionView.h"
#import "NBCBookDanCollectionViewCell.h"
#import "HomeActivityViewController.h"
@interface NBCBookDanCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation NBCBookDanCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[NBCBookDanCollectionViewCell class] forCellWithReuseIdentifier:@"NBCBookDanCollectionViewCell"];
        
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
    
    NBCBookDanCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NBCBookDanCollectionViewCell" forIndexPath:indexPath];
    cell.model = _itemArray[indexPath.row];
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    NBCclassificationModel * mode = _itemArray[indexPath.row];
    HomeActivityViewController * vc = [HomeActivityViewController new];
    vc.hiden = YES;
    vc.itemid = mode.ssid;
    [[self viewController].navigationController pushViewController:vc animated:YES];

}


- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger currentPage = (scrollView.contentOffset.x - LENGTH(17))/(LENGTH(218)+LENGTH(15));
    [self.delegatePage NBCBookDanPageControlindex:currentPage];

}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    
    
    NSInteger numberOfItems = [collectionView numberOfItemsInSection:0];
    
    CGFloat combinedItemWidth = (numberOfItems * collectionViewLayout.itemSize.width) + ((numberOfItems - 1)*collectionViewLayout.minimumInteritemSpacing);
    
    CGFloat padding = (collectionView.frame.size.width - combinedItemWidth)/2;
    
    padding = padding>0 ? padding :0 ;
    
    return UIEdgeInsetsMake(0, padding,0, padding);
    
}
@end
