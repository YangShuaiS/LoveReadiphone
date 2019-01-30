//
//  ZhiShiSHuQiuCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiSHuQiuCollectionViewCell.h"

@implementation ZhiShiSHuQiuCollectionViewCell{
    BaseLabel * label;
    UIImageView * imageview;
    UIImageView * suo;
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
    imageview = [UIImageView new];
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(ws);
//        make.top.and.bottom.and.left.mas_equalTo(ws);
//        make.width.mas_equalTo(self->imageview.mas_height);
        make.top.mas_equalTo(ws).with.offset(LENGTH(9));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(9));
        make.width.and.height.mas_equalTo(LENGTH(53));
    }];
    
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(102,102,102) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@""];
    label.numberOfLines = 2;
    [imageview addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->imageview).with.insets(UIEdgeInsetsMake(LENGTH(0), LENGTH(8), LENGTH(0), LENGTH(8)));
    }];
    
    suo = [UIImageView new];
    suo.contentMode = UIViewContentModeScaleAspectFit;
    suo.image = UIIMAGE(@"锁");
    [self addSubview:suo];
    [suo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.width.and.height.mas_equalTo(LENGTH(18));
        make.right.mas_equalTo(ws);
    }];
    suo.hidden = YES;
    
}

- (void)setModel:(ZhiShiShuFLOneModel *)model{
    _model = model;
    label.text = model.name;
    if ([model.status isEqualToString:@"1"]) {
        [imageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTX,model.logo]]];
        suo.hidden = YES;
        label.textColor = _colors;

    }else{
        [imageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTX,model.n_logo]]];
        suo.hidden = NO;
        label.textColor = RGB(167, 165, 163);

    }
    

}
@end
