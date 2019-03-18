//
//  MMyViewCenterView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/16.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "MMyViewCenterView.h"
#import "MMyCollectionView.h"
@implementation MMyViewCenterView{
    MMyCollectionView * collection;
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
    WS(ws);
    self.backgroundColor = [UIColor clearColor];
    UIView * backview = [UIView new];
    backview.backgroundColor = RGBA(255, 255, 255, 1);
    backview.layer.cornerRadius = LENGTH(10);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(10));
    }];
    
    backview.layer.shadowColor = RGB(171, 171, 171).CGColor;
    backview.layer.shadowOffset = CGSizeMake(0,4);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    backview.layer.shadowRadius = LENGTH(8);
    backview.layer.shadowOpacity = 0.24;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((WIDTH-LENGTH(40))/3,LENGTH(105));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(0);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(0);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(0), LENGTH(0), LENGTH(0), LENGTH(0));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collection = [[MMyCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collection.decelerationRate = UIScrollViewDecelerationRateNormal;
    [backview addSubview:collection];
    [collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(backview);
        make.height.mas_equalTo(LENGTH(210));
    }];
    [collection setBlock:^(NSInteger inter) {
        ws.block(inter);
    }];
    
}

@end
