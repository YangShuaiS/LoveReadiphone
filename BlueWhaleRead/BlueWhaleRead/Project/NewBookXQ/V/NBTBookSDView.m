//
//  NBTBookSDView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBTBookSDView.h"
#import "NBCBookDanCollectionView.h"
#define itemWidth LENGTH(218)
#define itemHeight LENGTH(202)
@implementation NBTBookSDView{
    NBCBookDanCollectionView * collectView;

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
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    //    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(15);
    //    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = 0;
    //    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(6), LENGTH(17), LENGTH(24), LENGTH(0));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    collectView = [[NBCBookDanCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(0));
        make.top.equalTo(jj.mas_bottom).with.offset(-LENGTH(6));
        make.right.equalTo(ws).with.offset(LENGTH(0));
        make.bottom.equalTo(ws).with.offset(-LENGTH(14));
        make.height.mas_equalTo(itemHeight+LENGTH(30));
    }];
}
- (void)setModel:(BookXQModel *)model{
    _model = model;
    if ([BaseObject ArratClass:model.book.tags]) {
        collectView.itemArray = model.book.tags;
        if (model.book.tags.count == 0) {
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
            }];
        }
    }else{
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }
}
@end
