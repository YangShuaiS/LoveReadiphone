//
//  ZhiShiShuRelationView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuRelationView.h"
#import "ZhiShiShuRelationCollectionVIew.h"
#import "JYEqualCellSpaceFlowLayout.h"
@implementation ZhiShiShuRelationView{
    ZhiShiShuRelationCollectionVIew * collectView;
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
    JYEqualCellSpaceFlowLayout *flowLayout = [[JYEqualCellSpaceFlowLayout alloc] initWithType:AlignWithCenter betweenOfCell:5.0];
//    flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
    flowLayout.estimatedItemSize = CGSizeMake(20, 60);  // layout约束这边必须要用estimatedItemSize才能实现自适应,使用itemSzie无效

    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(10);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(10);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(20), 0, LENGTH(20));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView = [[ZhiShiShuRelationCollectionVIew alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    [self addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
        make.width.mas_equalTo(WIDTH);
    }];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    collectView.textcolor = _textcolor;
    collectView.itemarray = itemarray;
//    BaseLabel * lastlabel;
//    WS(ws);
//    for (ZhiShiShuViTypeModel * model in itemarray) {
//        BaseView * view = [BaseView new];
//        view.backgroundColor = [BaseObject colorWithHexString:model.color];
//        [self addSubview:view];
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            if (!lastlabel) {
//                make.left.mas_equalTo(ws);
//            }else{
//                make.left.mas_equalTo(lastlabel.mas_right).with.offset(LENGTH(10));
//            }
//            make.centerY.mas_equalTo(ws);
//            make.width.mas_equalTo(LENGTH(24));
//            make.height.mas_equalTo(LENGTH(2));
//        }];
//
//        BaseLabel * label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[BaseObject colorWithHexString:_textcolor] LabelFont:TextFontCu(11) TextAlignment:NSTextAlignmentLeft Text:model.name];
//        [self addSubview:label];
//        [label mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(view.mas_right).with.offset(LENGTH(5));
//            make.top.and.bottom.mas_equalTo(ws);
//        }];
//        lastlabel = label;
//    }
//    [lastlabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(ws);
//    }];
}
@end
