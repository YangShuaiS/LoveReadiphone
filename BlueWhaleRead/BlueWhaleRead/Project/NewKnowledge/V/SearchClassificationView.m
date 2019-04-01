
//
//  SearchClassificationView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchClassificationView.h"
#import "NKRRecommendedCollectionView.h"
#define itemWidth LENGTH(162)
#define itemHeight LENGTH(162*0.610561)+LENGTH(15)+LENGTH(20)+LENGTH(5)+LENGTH(16)
@implementation SearchClassificationView

{
    NKRRecommendedCollectionView * collectView;
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
    BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFontCu(14) TextAlignment:NSTextAlignmentLeft Text:@"知识图"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
        make.top.mas_equalTo(ws).with.offset(LENGTH(14));
    }];
    
    UIImageView * imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = UIIMAGE(@"箭头");
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.centerY.mas_equalTo(title);
        make.size.mas_equalTo(CGSizeMake(LENGTH(20), LENGTH(20)));
        
    }];
    
    UIView * click = [UIView new];
    [self addSubview:click];
    [click mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.bottom.mas_equalTo(title.mas_bottom).with.offset(LENGTH(17));
        make.right.mas_equalTo(ws);
        make.left.mas_equalTo(imageView.mas_left).with.offset(-LENGTH(17));
    }];
    
    click.userInteractionEnabled = YES;
    UITapGestureRecognizer *backtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    //将手势添加到需要相应的view中去
    [click addGestureRecognizer:backtap];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    //    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(15);
    //    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = 0;
    //    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(17), 0, LENGTH(17));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[NKRRecommendedCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectView.style = 3;
    collectView.allinter = 4;
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(0));
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(17));
        make.right.equalTo(ws).with.offset(LENGTH(0));
        make.bottom.equalTo(ws).with.offset(-LENGTH(14));
        make.height.mas_equalTo(itemHeight);
    }];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    collectView.itemarray = itemarray;
}
- (void)click{
    self.pushblock(2);
}
@end
