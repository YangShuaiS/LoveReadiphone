//
//  HomeClassificationView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeClassificationView.h"
#import "HomeCkassifcationCollectionViewCell.h"

#import "MedalListViewController.h"
#import "BookListViewController.h"
#import "MyClassViewController.h"
#import "AchievementReportViewController.h"
#import "HomeActivityViewController.h"
@interface HomeClassificationView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation HomeClassificationView
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[HomeCkassifcationCollectionViewCell class] forCellWithReuseIdentifier:@"HomeCkassifcationCollectionViewCell"];
        
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
    return _itemArray.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

        HomeCkassifcationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCkassifcationCollectionViewCell" forIndexPath:indexPath];
    cell.model = _itemArray[indexPath.row];
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    TagModel * model = _itemArray[indexPath.row];
    if (model.seq == 1) {
        MedalListViewController * vc = [MedalListViewController new];
        vc.style = ViewControllerStyleXZXQ;
        [self.nav pushViewController:vc animated:YES];
    }
    if (model.seq == 2) {
        BookListViewController * vc = [BookListViewController new];
        [self.nav pushViewController:vc animated:YES];
    }
    if (model.seq == 3) {
        MyClassViewController * vc = [MyClassViewController new];
        [self.nav pushViewController:vc animated:YES];
    }
    if (model.seq == 4) {
        AchievementReportViewController * vc = [AchievementReportViewController new];
        [self.nav pushViewController:vc animated:YES];
    }
    if (model.seq == 5) {
        HomeActivityViewController * vc = [HomeActivityViewController new];
        vc.itemid = model.ssid;
        [self.nav pushViewController:vc animated:YES];
    }    
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
