
//
//  UserXZageView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserXZageView.h"
#import "UserXZageCollectionView.h"
@implementation UserXZageView{
    UserXZageCollectionView * collection;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    self.backgroundColor = [UIColor whiteColor];
    WS(ws);
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(87,87,87) LabelFont:TextFont(21) TextAlignment:NSTextAlignmentCenter Text:@"你所在的年级？"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(NavHeight+LENGTH(48));
        make.centerX.mas_equalTo(ws);
    }];
    
    BaseLabel * subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(160,160,160) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"智能推荐适合孩子的内容"];
    [self addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(8));
        make.centerX.mas_equalTo(ws);
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(88),LENGTH(52));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(20);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(12);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(0), LENGTH(40), 0, LENGTH(40));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collection = [[UserXZageCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collection];
    [collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(subtitle.mas_bottom).with.offset(LENGTH(80));
        make.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(10));
    }];
    [collection setBlock:^(NSString * _Nonnull str) {
        ws.block(str);
        [ws remoview];
    }];
}

- (void)remoview{
    [self removeFromSuperview];
}
@end
