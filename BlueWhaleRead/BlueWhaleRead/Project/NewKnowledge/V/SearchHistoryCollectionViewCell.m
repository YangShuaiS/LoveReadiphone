//
//  SearchHistoryCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchHistoryCollectionViewCell.h"

@implementation SearchHistoryCollectionViewCell{
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
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = LENGTH(15);
    view.backgroundColor = RGB(248,248,248);
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(30));
    }];
    
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(31, 31, 31) LabelFont:TextFontCu(13) TextAlignment:NSTextAlignmentLeft Text:@""];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->view).with.insets(UIEdgeInsetsMake(LENGTH(8), LENGTH(14), LENGTH(8), LENGTH(14)));
    }];
    
}
- (void)setTitle:(NSString *)title{
    _title = title;
    label.text = title;

}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    CGRect rect = [label.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, LENGTH(60)) options:NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:TextFontCu(13)} context:nil];
    rect.size.width +=LENGTH(28);
    rect.size.height = LENGTH(30);
    attributes.frame = rect;
    return attributes;
}

@end
