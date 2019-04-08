//
//  NKRClassificationCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NKRClassificationCollectionViewCell.h"

@implementation NKRClassificationCollectionViewCell{
    BaseLabel * label;
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
    bakimageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:bakimageview];
    [bakimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(59));
    }];
    
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(96,96,96) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"文学"];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->bakimageview.mas_bottom).with.offset(LENGTH(5));
        make.left.and.right.mas_equalTo(ws);
    }];
}

- (void)setModel:(NKRClassificationModel *)model{
    _model = model;
    [bakimageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTXIMAGEURL,model.img]]];
    label.text = model.name;
}

@end
