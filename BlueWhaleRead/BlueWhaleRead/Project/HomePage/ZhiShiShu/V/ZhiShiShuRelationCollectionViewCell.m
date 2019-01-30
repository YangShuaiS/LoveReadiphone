//
//  ZhiShiShuRelationCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/17.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ZhiShiShuRelationCollectionViewCell.h"

@implementation ZhiShiShuRelationCollectionViewCell{
    BaseView * view;
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
    view = [BaseView new];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.centerY.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(24));
        make.height.mas_equalTo(LENGTH(2));
    }];
    
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51, 51, 51) LabelFont:TextFontCu(11) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->view.mas_right).with.offset(LENGTH(5));
        make.right.mas_equalTo(ws);
        make.top.and.bottom.mas_equalTo(ws);
    }];

}
- (void)setModel:(ZhiShiShuViTypeModel *)model{
    _model = model;
    view.backgroundColor = [BaseObject colorWithHexString:model.color];
    label.textColor = [BaseObject colorWithHexString:_textcolor];
    label.text = model.name;

}
- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    CGRect rect = [label.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 60) options:NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:LENGTH(11)]} context:nil];
    rect.size.width +=LENGTH(29);
    rect.size.height+=2;
    attributes.frame = rect;
    return attributes;
}

@end
