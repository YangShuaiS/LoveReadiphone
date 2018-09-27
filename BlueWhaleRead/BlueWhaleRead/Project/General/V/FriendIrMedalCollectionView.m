//
//  FriendIrMedalCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendIrMedalCollectionView.h"
#import "FriendOrMedalImageCollectionViewCell.h"
#import "FriendOrMedaliAndNameCollectionViewCell.h"
#import "FriendModredddCollectionViewCell.h"
#import "FriendViewController.h"

#import "MedalListXQViewController.h"

#import "FoundMedalCollectionViewCell.h"
@interface FriendIrMedalCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation FriendIrMedalCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[FriendOrMedalImageCollectionViewCell class] forCellWithReuseIdentifier:@"FriendOrMedalImageCollectionViewCell"];
        [self registerClass:[FriendOrMedaliAndNameCollectionViewCell class] forCellWithReuseIdentifier:@"FriendOrMedaliAndNameCollectionViewCell"];
        [self registerClass:[FriendModredddCollectionViewCell class] forCellWithReuseIdentifier:@"FriendModredddCollectionViewCell"];
        [self registerClass:[FoundMedalCollectionViewCell class] forCellWithReuseIdentifier:@"FoundMedalCollectionViewCell"];
        
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
    if (_inter == 0 || _itemarray.count < _inter) {
        if (_foundinter > 0) {
            return _foundinter;
        }else{
            return _itemarray.count;
        }
    }else{
        return _inter;
    }
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_inter == 0) {
        if (_foundinter == 0) {
            if ([_itemarray[0]isMemberOfClass:[ReadPeopleModel class]]||[_itemarray[0]isMemberOfClass:[CityBadgeListModel class]] || [_itemarray[0]isMemberOfClass:[BadgeOnlyImageModel class]]) {
                FriendOrMedalImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FriendOrMedalImageCollectionViewCell" forIndexPath:indexPath];
                if ([_itemarray[0]isMemberOfClass:[ReadPeopleModel class]]) {
                    cell.model = _itemarray[indexPath.row];
                }else if ([_itemarray[0]isMemberOfClass:[CityBadgeListModel class]]){
                    cell.badgeModel = _itemarray[indexPath.row];
                }else if ([_itemarray[0]isMemberOfClass:[BadgeOnlyImageModel class]]){
                    cell.badgeimagemodel = _itemarray[indexPath.row];
                    
                }
                return cell;
            }else{
                FriendOrMedaliAndNameCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FriendOrMedaliAndNameCollectionViewCell" forIndexPath:indexPath];
                if ([_itemarray[0]isMemberOfClass:[MedalBageFriendModel class]]) {
                    cell.friendMoedl = _itemarray[indexPath.row];
                }else if ([_itemarray[0]isMemberOfClass:[CityBadgeListModel class]]){
                    //            cell.badgeModel = _itemarray[indexPath.section];
                }
                return cell;
            }
        }else{
            FoundMedalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FoundMedalCollectionViewCell" forIndexPath:indexPath];
            if (_foundinter!=0&&_itemarray.count>indexPath.row) {
                cell.model = _itemarray[indexPath.row];
            }
            return cell;
        }
        
    }else{
        if (indexPath.row == _inter-1) {
            FriendModredddCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FriendModredddCollectionViewCell" forIndexPath:indexPath];
            return cell;
        }else{
        if ([_itemarray[0]isMemberOfClass:[ReadPeopleModel class]]||[_itemarray[0]isMemberOfClass:[CityBadgeListModel class]] || [_itemarray[0]isMemberOfClass:[BadgeOnlyImageModel class]]) {
            FriendOrMedalImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FriendOrMedalImageCollectionViewCell" forIndexPath:indexPath];
            if ([_itemarray[0]isMemberOfClass:[ReadPeopleModel class]]) {
                cell.model = _itemarray[indexPath.row];
            }else if ([_itemarray[0]isMemberOfClass:[CityBadgeListModel class]]){
                cell.badgeModel = _itemarray[indexPath.row];
            }else if ([_itemarray[0]isMemberOfClass:[BadgeOnlyImageModel class]]){
                cell.badgeimagemodel = _itemarray[indexPath.row];
            }
            return cell;
        }else{
            FriendOrMedaliAndNameCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FriendOrMedaliAndNameCollectionViewCell" forIndexPath:indexPath];
            if ([_itemarray[0]isMemberOfClass:[MedalBageFriendModel class]]) {
                cell.friendMoedl = _itemarray[indexPath.row];
            }else if ([_itemarray[0]isMemberOfClass:[CityBadgeListModel class]]){
                //            cell.badgeModel = _itemarray[indexPath.section];
            }
            return cell;
        }
    }
        
    }
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{

    if (_inter!=0&&indexPath.row==_inter -1) {
        
    }else{
        if (_foundinter == 0) {
            if ([_itemarray[indexPath.row]isMemberOfClass:[MedalBageFriendModel class]]) {
                FriendViewController * vc = [FriendViewController new];
                MedalBageFriendModel * model = _itemarray[indexPath.row];
                vc.itemid = model.ssid;
                [self.nav pushViewController:vc animated:YES];
            }
            
            if ([_itemarray[indexPath.row]isMemberOfClass:[ReadPeopleModel class]]) {
                FriendViewController * vc = [FriendViewController new];
                ReadPeopleModel * model = _itemarray[indexPath.row];
                vc.itemid = model.ssid;
                [self.nav pushViewController:vc animated:YES];
            }
            
            if ([_itemarray[indexPath.row]isMemberOfClass:[CityBadgeListModel class]]) {
                MedalListXQViewController * vc = [MedalListXQViewController new];
                CityBadgeListModel * model = _itemarray[indexPath.row];
                vc.itemid = model.ssid;
                [self.nav pushViewController:vc animated:YES];
            }
            if ([_itemarray[indexPath.row]isMemberOfClass:[BadgeOnlyImageModel class]]) {
                BadgeOnlyImageModel * model = _itemarray[indexPath.row];
                MedalListXQViewController * vc = [MedalListXQViewController new];
                vc.itemid = model.ssid;
                [self.nav pushViewController:vc animated:YES];
            }
            
        }else{
            if (_itemarray.count>indexPath.row) {
                BadgeOnlyImageModel * model = _itemarray[indexPath.row];
                MedalListXQViewController * vc = [MedalListXQViewController new];
                vc.itemid = model.ssid;
                [self.nav pushViewController:vc animated:YES];
            }
        }
        
//        if ([_itemarray[indexPath.row]isMemberOfClass:[BadgeOnlyImageModel class]]) {
//            FriendViewController * vc = [FriendViewController new];
//            BadgeOnlyImageModel * model = _itemarray[indexPath.row];
//            vc.itemid = model.ssid;
//            [self.nav pushViewController:vc animated:YES];
//        }
    }
}


- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.contentSize.height);
        make.width.mas_equalTo(ws.contentSize.width);

    }];

}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}
- (void)setInter:(NSInteger)inter{
    _inter = inter;
}
@end
