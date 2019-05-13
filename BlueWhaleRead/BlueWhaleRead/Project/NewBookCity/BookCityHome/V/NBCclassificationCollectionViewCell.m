//
//  NBCclassificationCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCclassificationCollectionViewCell.h"

@implementation NBCclassificationCollectionViewCell{
//    BaseLabel * label;
    FLAnimatedImageView * bakimageview;

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
    bakimageview = [FLAnimatedImageView new];
//    bakimageview.backgroundColor = RGB(239, 239, 239);
//    bakimageview.layer.masksToBounds = YES;
//    bakimageview.layer.cornerRadius = LENGTH(8);
    [self addSubview:bakimageview];
    [bakimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
//    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@" 自然科普"];
//    [self addSubview:label];
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(ws);
//    }];
}

- (void)setModel:(NBCclassificationModel *)model{
    _model = model;
    [bakimageview sd_setImageWithURL:URLIMAGE(model.book_logo)];
//    label.text = model.name;
}
@end
