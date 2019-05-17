//
//  NKRRecommendedCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NKRRecommendedCollectionViewCell.h"
#import "YSInformationView.h"
#define itemWidth LENGTH(163)
#define itemHeight LENGTH(163)*0.552147+LENGTH(10)+LENGTH(14)
#define itemHeightone LENGTH(163)*0.552147+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12)
#define itemHeighttwo LENGTH(163)*1.423312+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12)
@implementation NKRRecommendedCollectionViewCell{
    YSInformationView * informagtion;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    informagtion = [YSInformationView new];
    [self addSubview:informagtion];
    [informagtion mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setModel:(NKRKnowledgeModel *)model{
    _model = model;
    if (_style != 9999 && model.style!=0)  {
        _style = 9999;
        informagtion.style = model.style;
    }
    informagtion.model = model;
}
- (void)setStyle:(NSInteger)style{
    if (_style != 9999) {
        _style = 9999;
        informagtion.style = style;
    }
}
- (void)setBkzt:(NSInteger)bkzt{
    _bkzt = bkzt;
    informagtion.bkzt = bkzt;
}
- (void)setSfsj:(NSInteger)sfsj{
    _sfsj = sfsj;
    if (sfsj == 1) {
        informagtion.backgroundColor = RANDOMCOLORALPHA(0.01);
    }
}
//- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
//    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
//    if (_model.style == 1) {
//        attributes.frame = CGRectMake(0, 0, itemWidth, itemHeighttwo);
//    }else if (_model.style == 2){
//        attributes.frame = CGRectMake(0, 0, itemWidth, itemHeight);
//    }else{
//        attributes.frame = CGRectMake(0, 0, itemWidth, itemHeightone);
//
//    }
//    return attributes;
//}

@end
