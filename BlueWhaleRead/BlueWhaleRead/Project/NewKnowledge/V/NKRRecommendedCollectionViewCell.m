//
//  NKRRecommendedCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NKRRecommendedCollectionViewCell.h"
#import "YSInformationView.h"

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
    informagtion.model = model;
}
- (void)setStyle:(NSInteger)style{
    if (_style != 9999) {
        _style = 9999;
        informagtion.style = style;
    }
}

@end
