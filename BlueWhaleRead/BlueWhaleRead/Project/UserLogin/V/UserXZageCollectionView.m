//
//  UserXZageCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserXZageCollectionView.h"
#import "UserSZageCollectionViewCell.h"
@interface UserXZageCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation UserXZageCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[UserSZageCollectionViewCell class] forCellWithReuseIdentifier:@"UserSZageCollectionViewCell"];
        
        // 注册区头
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
        self.pagingEnabled = YES;
        _itemArray = [NSMutableArray array];
        for (int i = 0; i < 6; i++) {
            [_itemArray addObject:@"123"];
        }
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
    
    UserSZageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UserSZageCollectionViewCell" forIndexPath:indexPath];
    return cell;
}


-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    self.block([NSString stringWithFormat:@"%ld",indexPath.row]);
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
    for (int i = 0; i < 6; i++) {
        [_itemArray addObject:@"123"];
    }
    [self reloadData];
}
@end