//
//  MedalChooseABookCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalChooseABookCollectionView.h"
#import "MedalChoosCollectionViewCell.h"
#import "BookXqViewController.h"
@interface MedalChooseABookCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation MedalChooseABookCollectionView
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self registerClass:[MedalChoosCollectionViewCell class] forCellWithReuseIdentifier:@"MedalChoosCollectionViewCell"];
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
        _Booknumber = 0;
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
    return _Booknumber;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
        MedalChoosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MedalChoosCollectionViewCell" forIndexPath:indexPath];
    [cell cellCSH];
    if (_stylejia == 1) {
        [cell jiahao];
    }
    if (_itemArray.count > indexPath.row&&_itemArray.count !=0) {
        AllBookListModel * model = _itemArray[indexPath.row];
        if (model.is_read==1) {

        }else if (model.is_read == 2){

        }else{
            model.is_read = 1;
        }
        cell.allmodel = model;
    }
        return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    if (_stylejia == 1 && _itemArray.count<= indexPath.row) {
        self.block();
    }
    if (_itemArray.count > indexPath.row&&_itemArray.count !=0) {
        NSArray * contarray = self.nav.view.subviews;
        for (int i =0; i < contarray.count; i++) {
            UIView *controller = contarray[i];
            if ([controller isKindOfClass:[GeneralUpView class]]) {
                [controller removeFromSuperview];
            }
        }
        

        
        AllBookListModel * model = _itemArray[indexPath.row];
        BookXqViewController * vc = [BookXqViewController new];
        vc.loadId = model.ssid;
        [self.nav pushViewController:vc animated:YES];
    }
}


- (void)layoutSubviews{
    [super layoutSubviews];
//    CGFloat itemwidt = (self.frame.size.width-LENGTH(8)*7)/8;
//    CGFloat itemheight = itemwidt*1.1454545454545;
//
//    [self mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(itemheight);
////        make.width.mas_equalTo(ws.contentSize.width);
////
//    }];
    
}

//#pragma mark  定义每个UICollectionView的大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGFloat itemwidt = (self.frame.size.width-LENGTH(8)*7)/8;
//    CGFloat itemheight = itemwidt*1.1454545454545;
//    return  CGSizeMake(itemwidt, itemheight);
//}
- (void)setBooknumber:(NSInteger)Booknumber{
    _Booknumber = Booknumber;
    [self reloadData];
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}
- (void)setStylejia:(NSInteger)stylejia{
    _stylejia = stylejia;
}
@end
