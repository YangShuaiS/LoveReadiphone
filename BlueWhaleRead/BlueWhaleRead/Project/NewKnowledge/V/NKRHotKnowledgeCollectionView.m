//
//  NKRHotKnowledgeCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/5/16.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NKRHotKnowledgeCollectionView.h"
#import "NKRHotKnowledgeCollectionViewCell.h"
@interface NKRHotKnowledgeCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation NKRHotKnowledgeCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[NKRHotKnowledgeCollectionViewCell class] forCellWithReuseIdentifier:@"NKRHotKnowledgeCollectionViewCell"];
        
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        // 设置是否允许滚动
        self.scrollEnabled = YES;
        self.pagingEnabled = YES;
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
    
    NKRHotKnowledgeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NKRHotKnowledgeCollectionViewCell" forIndexPath:indexPath];
    cell.itemArray = _itemArray[indexPath.row];
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{

}


- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger currentPage = (scrollView.contentOffset.x /WIDTH);
    [self.delegatePage NBCBookDanPageControlindex:currentPage];
    
}

@end
