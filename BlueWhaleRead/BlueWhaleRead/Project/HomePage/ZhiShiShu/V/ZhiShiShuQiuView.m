//
//  ZhiShiShuQiuView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuQiuView.h"
#import "ZhiShiSHuQiuCollectionViewCell.h"
#import "ZhiShiShuShuViewController.h"
@interface ZhiShiShuQiuView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation ZhiShiShuQiuView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[ZhiShiSHuQiuCollectionViewCell class] forCellWithReuseIdentifier:@"ZhiShiSHuQiuCollectionViewCell"];
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
        return _itemarray.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
        ZhiShiSHuQiuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZhiShiSHuQiuCollectionViewCell" forIndexPath:indexPath];
    cell.model = _itemarray[indexPath.row];
        return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    ZhiShiShuShuViewController * vc = [ZhiShiShuShuViewController new];
    ZhiShiShuFLOneModel * model = _itemarray[indexPath.row];
    vc.itemid =model.knowledge._id;
    [self.nav pushViewController:vc animated:YES];
   
}


- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [UIView animateWithDuration:0.1 animations:^{
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(1);
//            make.width.mas_equalTo(100);
        }];
        [self.superview layoutSubviews];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(ws.contentSize.height);
                make.width.mas_equalTo(ws.contentSize.width);
            }];
            [self.superview layoutSubviews];
        } completion:^(BOOL finished) {
            
        }];

    }];

    
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}
@end
