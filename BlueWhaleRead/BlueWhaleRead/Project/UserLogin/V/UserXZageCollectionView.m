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
@implementation UserXZageCollectionView{
    levelListModel * lastmodel;
    NSMutableArray * array;
    BaseLabel * label1;
    BaseLabel * label2;
    BaseLabel * label3;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[UserSZageCollectionViewCell class] forCellWithReuseIdentifier:@"UserSZageCollectionViewCell"];
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
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
            label1 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0,0,0) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@""];
            label2 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0,0,0) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@""];
            label3 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0,0,0) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@""];
    }
    return self;
}
#pragma mark *** UICollectionViewDataSource ***
// 设置组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return array.count;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSMutableArray * arr = array[section];
    return arr.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UserSZageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UserSZageCollectionViewCell" forIndexPath:indexPath];
    cell.model = array[indexPath.section][indexPath.row];
    return cell;
}


-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    lastmodel.zt = 0;
    levelListModel * model = array[indexPath.section][indexPath.row];
    model.zt = 1;
    lastmodel = model;
    [self reloadData];
    self.block([NSString stringWithFormat:@"%@",model.ssid]);
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

    for (int i = 0; i < _itemArray.count; i++) {
        levelListModel * model = _itemArray[i];
        if (i == 0) {
            lastmodel = model;
            model.zt = 1;
            self.block(model.ssid);
        }else{
            model.zt = 0;
        }
    }
    array = [NSMutableArray array];
    NSInteger now = 999;
    for (int i = 0; i < _itemArray.count; i++) {
        levelListModel * model = _itemArray[i];
        if (now == 999) {
            if (array.count == 0) {
                NSMutableArray * arr = [NSMutableArray array];
                [arr addObject:model];
                [array addObject:arr];
            }else{
                NSMutableArray * arr = array[array.count-1];
                [arr addObject:model];
                if (arr.count == 6) {
                    now = 3;
                }
            }
        }else{
            if (now == 3) {
                NSMutableArray * arr = [NSMutableArray array];
                [arr addObject:model];
                [array addObject:arr];
                now = 1;
            }else{
                NSMutableArray * arr = array[array.count-1];
                [arr addObject:model];
                if (arr.count == 3) {
                    now = 3;
                }
            }
        }
    }
    [self reloadData];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"forIndexPath:indexPath];
    header.backgroundColor = [UIColor whiteColor];
    if (indexPath.section ==0) {
        [header addSubview:label1];
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.mas_equalTo(header);
            make.left.mas_equalTo(header).with.offset(LENGTH(40));
        }];
        label1.text =@"小学";
    }else if (indexPath.section == 1){
        [header addSubview:label2];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.mas_equalTo(header);
            make.left.mas_equalTo(header).with.offset(LENGTH(40));        }];
        label2.text =@"初中";
    }else if (indexPath.section == 2){
        [header addSubview:label3];
        [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.mas_equalTo(header);
            make.left.mas_equalTo(header).with.offset(LENGTH(40));        }];
        label3.text =@"高中";
    }

    return header;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(WIDTH,LENGTH(30));
}
@end
