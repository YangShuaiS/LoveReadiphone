//
//  NBTBookSDView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBTBookSDView.h"
#import "NBTBookDanCollectionView.h"
#import "JYEqualCellSpaceFlowLayout.h"
@implementation NBTBookSDView{
    NBTBookDanCollectionView * collectView;

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
    self.backgroundColor = RGB(255, 255, 255);
    self.layer.masksToBounds = YES;
    WS(ws);
    UIImageView * leftimageview = [UIImageView new];
    leftimageview.contentMode = UIViewContentModeScaleAspectFit;
    leftimageview.image = UIIMAGE(@"椭圆1");
    [self addSubview:leftimageview];
    [leftimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(6));
        make.left.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(leftimageview.image.size.width), LENGTH(leftimageview.image.size.height)));
    }];
    
    BaseLabel * jj = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@"相关书单"];
    [self addSubview:jj];
    [jj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(12));
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
    }];
    
    JYEqualCellSpaceFlowLayout *flowLayout = [[JYEqualCellSpaceFlowLayout alloc] initWithType:AlignWithCenter betweenOfCell:5.0];
    //    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    flowLayout.estimatedItemSize = CGSizeMake(20, 60);  // layout约束这边必须要用estimatedItemSize才能实现自适应,使用itemSzie无效
    
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(10);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(10);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(10), 0, LENGTH(10));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[NBTBookDanCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(jj.mas_bottom).with.offset(LENGTH(12));
        make.left.and.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(19));
    }];
    
}
- (void)setModel:(BookXQModel *)model{
    _model = model;
    collectView.itemArray = model.book.tags;
}
@end
