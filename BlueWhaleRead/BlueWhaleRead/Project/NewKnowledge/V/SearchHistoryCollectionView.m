//
//  SearchHistoryCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchHistoryCollectionView.h"
#import "SearchHistoryCollectionViewCell.h"
@interface SearchHistoryCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation SearchHistoryCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[SearchHistoryCollectionViewCell class] forCellWithReuseIdentifier:@"SearchHistoryCollectionViewCell"];
        
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        // 设置是否允许滚动
        self.scrollEnabled = NO;
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
    return _itemarray.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SearchHistoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SearchHistoryCollectionViewCell" forIndexPath:indexPath];
    cell.title = _itemarray[indexPath.row];
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    self.block(_itemarray[indexPath.row]);
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}
//- (CGSize) collectionView:(UICollectionView *)collectionView
//                   layout:(UICollectionViewLayout *)collectionViewLayout
//   sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSString * text = _itemarray[indexPath.row];
//    CGRect rect = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 60) options:NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:LENGTH(13)]} context:nil];
//    rect.size.width +=LENGTH(28);
//    rect.size.height = LENGTH(30);
//    return CGSizeMake(rect.size.width, rect.size.height);
//}


- (void)layoutSubviews{
    [super layoutSubviews];
//    WS(ws);
//    [self mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(ws.contentSize.height);
//    }];
}

@end
