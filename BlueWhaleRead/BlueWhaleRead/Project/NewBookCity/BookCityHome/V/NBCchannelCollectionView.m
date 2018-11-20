//
//  NBCchannelCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCchannelCollectionView.h"
#import "NBCchannelCollectionViewCell.h"
#import "LBTViewController.h"

#import "NBCMoreChannelViewController.h"
#import "NBCThemeViewController.h"
@interface NBCchannelCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation NBCchannelCollectionView{
    NSInteger cshgs;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[NBCchannelCollectionViewCell class] forCellWithReuseIdentifier:@"NBCchannelCollectionViewCell"];
        
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

        cshgs = 3+1;
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
        return cshgs;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NBCchannelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NBCchannelCollectionViewCell" forIndexPath:indexPath];
    if (_more == YES) {
    if (_itemArray.count == cshgs -1) {
            if (indexPath.row == cshgs-1) {
                cell.gd = @"1";
            }else{
                cell.model = _itemArray[indexPath.row];
            }
        }
    }else{
        if (_itemArray.count == cshgs ) {
        cell.model = _itemArray[indexPath.row];
        }
    }
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    if (_more == YES) {
        if (_itemArray.count == cshgs -1) {
            if (indexPath.row == cshgs-1) {
                NBCMoreChannelViewController * vc = [NBCMoreChannelViewController new];
                [self.nav pushViewController:vc animated:YES];
            }else{
                NBCclassificationModel * model = _itemArray[indexPath.row];
                NBCThemeViewController * vc = [NBCThemeViewController new];
                vc.bannerid = model.ssid;
                vc.imageurl = [NSString stringWithFormat:@"%@%@",IMAGEURL,model.banner_img]; 
                [self.nav pushViewController:vc animated:YES];
         }
        }
    }else{
        if (_itemArray.count == cshgs ) {
            if (_zt == YES) {
                NBCclassificationModel * model = _itemArray[indexPath.row];
                NBCThemeViewController * vc = [NBCThemeViewController new];
                vc.bannerid = model.ssid;
                vc.imageurl = [NSString stringWithFormat:@"%@%@",IMAGEURL,model.banner_img];
                [self.nav pushViewController:vc animated:YES];
            }else{
                NBCclassificationModel * model = _itemArray[indexPath.row];
                LBTViewController * vc = [LBTViewController new];
                vc.itemid = model.ssid;
                vc.imageurl = [NSString stringWithFormat:@"%@%@",IMAGEURL,model.banner_img];
                [self.nav pushViewController:vc animated:YES];
            }
        }
    }

}


- (void)layoutSubviews{
    [super layoutSubviews];

}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    if (_more == YES) {
        cshgs = itemArray.count+1;
    }else{
        cshgs = itemArray.count;
    }
    [self reloadData];
}

@end
