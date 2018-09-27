//
//  FiendOrMedalView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FiendOrMedalView.h"
#import "FriendIrMedalCollectionView.h"
@implementation FiendOrMedalView{
    FriendIrMedalCollectionView * collectView;
}
- (instancetype)initWithLayOut:(UICollectionViewFlowLayout *)layout{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addView:layout];
    }
    return self;
}

- (void)addView:(UICollectionViewLayout*)layout{
    WS(ws);
    collectView = [[FriendIrMedalCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:layout];
    
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(LENGTH(0));
        
    }];
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    collectView.nav = self.nav;
    collectView.itemarray = itemarray;
}
- (void)BanSliding{
//    collectView.bounds = NO;
    collectView.scrollEnabled = NO;
    collectView.inter = 4;
}
- (void)setInter:(NSInteger)inter{
    collectView.scrollEnabled = NO;
    collectView.inter = inter;

}
- (void)setFoundinter:(NSInteger)foundinter{
    _foundinter = foundinter;
    collectView.scrollEnabled = NO;
    collectView.foundinter = foundinter;
}
@end
