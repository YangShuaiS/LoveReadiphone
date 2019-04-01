//
//  LBTCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/22.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "LBTCollectionViewCell.h"

@implementation LBTCollectionViewCell{
    FLAnimatedImageView* imageview;
    UIView * backviews;
    BaseLabel * title;
    BaseLabel * subtitle;
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
    imageview = [FLAnimatedImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    backviews = [UIView new];
    [imageview addSubview:backviews];
    [backviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.mas_equalTo(self->imageview);
        make.height.mas_equalTo(LENGTH(66));
    }];
    
    title = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFontCu(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    [backviews addSubview:title];

    
    subtitle = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@""];
    subtitle.numberOfLines = 2;
    [backviews addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self->backviews).with.offset(-LENGTH(6));
        make.left.mas_equalTo(self->backviews).with.offset(LENGTH(7));
        make.right.mas_equalTo(self->backviews).with.offset(-LENGTH(7));
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self->subtitle.mas_top).with.offset(-LENGTH(5));
        make.left.mas_equalTo(self->backviews).with.offset(LENGTH(7));
        make.right.mas_equalTo(self->backviews).with.offset(-LENGTH(7));
    }];
    
    [backviews layoutIfNeeded];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = backviews.bounds;
    //    gradient.colors = @[(id)RGBA(0, 0, 0, 1),RGBA(0, 0, 0, 0)];
    UIColor * color1 = RGBA(0, 0, 0, 0.5);
    UIColor * color2 = RGBA(0, 0, 0, 0);
    gradient.colors = @[(id)color2.CGColor,(id)color1.CGColor];
    gradient.locations = @[@0, @1];
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(0, 1);
    [backviews.layer addSublayer:gradient];
    [backviews addSubview:title];
    [backviews addSubview:subtitle];
}

- (void)setModel:(LunboModel *)model{
    _model = model;
    [imageview sd_setImageWithURL:URLIMAGE(model.banner_img)];
    title.text = model.title;
    subtitle.text = model.banner_foreword;
}
- (void)layoutSubviews{
    [super layoutSubviews];
}
@end
