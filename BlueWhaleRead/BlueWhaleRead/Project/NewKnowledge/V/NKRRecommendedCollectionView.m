//
//  NKRRecommendedCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NKRRecommendedCollectionView.h"
#import "NKRRecommendedCollectionViewCell.h"

#import "LBTViewController.h"
#import "ZhiShiShuShuViewController.h"
#import "ArticleViewController.h"
@interface NKRRecommendedCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation NKRRecommendedCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[NKRRecommendedCollectionViewCell class] forCellWithReuseIdentifier:@"NKRRecommendedCollectionViewCell"];
        
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        // 设置是否允许滚动
        self.scrollEnabled = YES;
        //背景颜色
        self.backgroundColor = [UIColor clearColor];
        //自适应大小
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.scrollsToTop = YES;
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
    if (_allinter == 0) {
        return _itemarray.count;
    }else{
        if (_itemarray.count >_allinter) {
            return _allinter;
        }else{
            return _itemarray.count;
        }
    }
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NKRRecommendedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NKRRecommendedCollectionViewCell" forIndexPath:indexPath];
    cell.bkzt = _bkzt;
    if (_style == 3 || _style == 4) {
        cell.style = 3;
    }else{
        cell.style = _style;
    }
    cell.model = _itemarray[indexPath.row];
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    NKRKnowledgeModel * model = _itemarray[indexPath.row];
    if (_bkzt == 1) {
        model.duigou = model.duigou == 1?0:1;
        [self reloadData];
    }else{
        if (model.related_type == 1) {
            if (model.banner_type == 1) {
                LBTViewController * vc = [LBTViewController new];
                vc.inter = 1;
                vc.itemid = model.ssid;
                [[self viewController].navigationController pushViewController:vc animated:YES];
            }else{
                ArticleViewController * vc = [ArticleViewController new];
                vc.itemid = model.ssid;
                [[self viewController].navigationController pushViewController:vc animated:YES];
            }
        }else if (model.related_type == 2){
            ZhiShiShuShuViewController * vc = [ZhiShiShuShuViewController new];
            vc.itemid = model.ssid;
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }else{
            
        }
    }
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}
- (void)setBkzt:(NSInteger)bkzt{
    _bkzt = bkzt;
    [self reloadData];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    if (_allinter!=0) {
        WS(ws);
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(ws.contentSize.height);
        }];
    }

}
@end
