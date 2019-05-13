//
//  NKTopFLView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/8.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NKTopFLView.h"
#import "NKTopCollectionView.h"

@implementation NKTopFLView{
    NKTopCollectionView * collectView;

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
    self.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
            flowLayout.itemSize = CGSizeMake(WIDTH/6,LENGTH(30));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(0);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(0);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(0), 0, LENGTH(0));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[NKTopCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
        make.width.mas_equalTo(WIDTH);
        make.height.mas_equalTo(LENGTH(30));
    }];
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0,5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowRadius = 3.5;
    self.layer.shadowOpacity = 0.17;
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    collectView.itemarray = itemarray;
}
@end
