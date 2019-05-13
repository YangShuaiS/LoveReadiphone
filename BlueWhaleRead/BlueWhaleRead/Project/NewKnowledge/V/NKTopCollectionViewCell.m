//
//  NKTopCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/8.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NKTopCollectionViewCell.h"

@implementation NKTopCollectionViewCell
{
    BaseLabel * label;
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
    label = [[BaseLabel alloc] initWithTxteColor:RGB(0, 0, 0) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)setModel:(NKRClassificationModel *)model{
    _model = model;
    label.text = model.name;
}
@end
