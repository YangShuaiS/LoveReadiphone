


//
//  ArticleThreeDownView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/26.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ArticleThreeDownView.h"
#import "NKRRecommendedCollectionView.h"
#define itemWidth LENGTH(162)
#define itemHeight1 LENGTH(162*0.610561)+LENGTH(15)+LENGTH(20)+LENGTH(5)+LENGTH(16)
@implementation ArticleThreeDownView{
    NKRRecommendedCollectionView * collectView1;
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
    BaseLabel * threetitle = [[BaseLabel alloc] initWithTxteColor:RGB(31,31,31) LabelFont:TextFontCu(14) TextAlignment:NSTextAlignmentLeft Text:@"知识图推荐"];
    [self addSubview:threetitle];
    [threetitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(16));
        make.left.mas_equalTo(ws).with.offset(LENGTH(18));
    }];
    
    UICollectionViewFlowLayout *flowLayout1 = [[UICollectionViewFlowLayout alloc] init];
    flowLayout1.itemSize = CGSizeMake(itemWidth,itemHeight1);
    //    //定义每个UICollectionView 横向的间距
    flowLayout1.minimumLineSpacing = LENGTH(15);
    //    //定义每个UICollectionView 纵向的间距
    flowLayout1.minimumInteritemSpacing = 0;
    //    //定义每个UICollectionView 的边距距
    flowLayout1.sectionInset = UIEdgeInsetsMake(0, LENGTH(17), 0, LENGTH(17));//上左下右
    flowLayout1.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectView1 = [[NKRRecommendedCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout1];
    collectView1.style = 3;
    collectView1.allinter = 4;
    [self addSubview:collectView1];
    [collectView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(threetitle.mas_bottom).with.offset(LENGTH(16));
        make.right.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(itemHeight1);
        make.bottom.equalTo(ws).with.offset(-LENGTH(18));
    }];
}

- (void)setModel:(LunBoTuXQModel *)model{
    _model = model;
    collectView1.itemarray = model.bannerKnowledgeList;

}

- (void)setZhiShiSHUmodel:(ZhiShiShuModel *)ZhiShiSHUmodel{
    _ZhiShiSHUmodel = ZhiShiSHUmodel;
    collectView1.itemarray = ZhiShiSHUmodel.data.bannerKnowledgeList;
}
@end
