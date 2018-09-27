//
//  HomeInterestGroupView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeInterestGroupView.h"
#import "NavigationMenuView.h"
#import "HomeInterestGroupCollectionView.h"
#define itemWidth (WIDTH-LENGTH(33)*3-LENGTH(30)*2)/4
#define itemHeight itemWidth * 1.4183
@implementation HomeInterestGroupView{
    HomeInterestGroupCollectionView * collectView;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addView];
    }
    return self;
}
- (void)addView{
    WS(ws);
    
    NavigationMenuView * navMenu = [NavigationMenuView new];
    navMenu.style = NavMenuStyleAll;
    navMenu.leftTitle = @"热门兴趣小组";
    navMenu.rightTitle = @"查看全部";
    [navMenu setBlock:^{
        [self LookAll];
    }];
    [self addSubview:navMenu];
    
    [navMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(0);
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(30);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(30);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(33), 0, LENGTH(33));//上左下右

    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[HomeInterestGroupCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(navMenu.mas_bottom).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(31));
        
    }];
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    NSMutableArray * arr =[NSMutableArray array];
    for (LINSHI * model in itemarray) {
        [arr addObject:model];
        
    }
    for (LINSHI * model in itemarray) {
        [arr addObject:model];
        
    }
    collectView.itemarray = arr;
}

#pragma mark ------------------ 查看更多
- (void)LookAll{
    
}

@end
