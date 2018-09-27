//
//  GeneralBookImageNumberCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GeneralBookImageNumberCollectionView.h"
#import "GeneralBookImageNumberCollectionViewCell.h"
@interface GeneralBookImageNumberCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation GeneralBookImageNumberCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[GeneralBookImageNumberCollectionViewCell class] forCellWithReuseIdentifier:@"GeneralBookImageNumberCollectionViewCell"];
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
    return _allinter;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
        GeneralBookImageNumberCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GeneralBookImageNumberCollectionViewCell" forIndexPath:indexPath];
//        if ([_itemarray[0]isMemberOfClass:[MedalBageFriendModel class]]) {
//            cell.friendMoedl = _itemarray[indexPath.row];
//        }else if ([_itemarray[0]isMemberOfClass:[CityBadgeListModel class]]){
//            //            cell.badgeModel = _itemarray[indexPath.section];
//        }
        return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.contentSize.height);
        make.width.mas_equalTo(ws.contentSize.width);
    }];
}
- (void)setAllinter:(NSInteger)allinter{
    _allinter = allinter;
}

- (void)setHaveinter:(NSInteger)haveinter{
    _haveinter = haveinter;
    [self reloadData];
}
@end
