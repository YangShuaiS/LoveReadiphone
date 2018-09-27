



//
//  HomeClassIfCation.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeClassIfCation.h"
#import "HomeClassificationView.h"
@implementation HomeClassIfCation{
    HomeClassificationView * homeFL;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        WS(ws);
        self.backgroundColor = [UIColor whiteColor];
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(WIDTH/5,LENGTH(90));
        //定义每个UICollectionView 横向的间距
        flowLayout.minimumLineSpacing = 0;
        //定义每个UICollectionView 纵向的间距
        flowLayout.minimumInteritemSpacing = 0;
        //定义每个UICollectionView 的边距距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        homeFL = [[HomeClassificationView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
        [self addSubview:homeFL];
        [homeFL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws);
        }];

    }
    return self;
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    homeFL.itemArray = itemArray;
}
- (void)setNav:(UINavigationController *)nav{
    homeFL.nav = nav;
}
@end
