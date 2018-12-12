//
//  TKMytaskCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKMytaskCollectionView.h"
#import "TKMytaskCollectionViewCell.h"
#import "TAskForViewController.h"
@interface TKMytaskCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation TKMytaskCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[TKMytaskCollectionViewCell class] forCellWithReuseIdentifier:@"TKMytaskCollectionViewCell"];
        
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
    
    TKMytaskCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TKMytaskCollectionViewCell" forIndexPath:indexPath];
    cell.model = _itemArray[indexPath.row];
    return cell;
}


-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    TKMyListModel * model = _itemArray[indexPath.row];
    TAskForViewController * vc = [TAskForViewController new];
    vc.weizhi = @"1";
    vc.type = @"1";
    vc.studentMissionid = [NSString stringWithFormat:@"%@",model.studentMission.ssid];
    vc.missionid = [NSString stringWithFormat:@"%@",model.mission.ssid];
    vc.navtitle = model.mission.mission_name;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}

@end
