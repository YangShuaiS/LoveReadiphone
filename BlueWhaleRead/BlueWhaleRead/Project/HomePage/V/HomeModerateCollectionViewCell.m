//
//  HomeModerateCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeModerateCollectionViewCell.h"

@implementation HomeModerateCollectionViewCell{
    FLAnimatedImageView * imageView;
    BaseLabel * Title;
    UIView * yy;
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
    UIView * yinyig = [UIView new];
    yinyig.backgroundColor = [UIColor whiteColor];
    [self addSubview:yinyig];
    [yinyig mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).with.offset(LENGTH(4));
        make.left.equalTo(ws.mas_left).with.offset(LENGTH(4));
        make.right.equalTo(ws.mas_right).with.offset(-LENGTH(4));
        make.height.equalTo(yinyig.mas_width).multipliedBy(1.4283333333);
    }];
    yinyig.layer.shadowOpacity = 0.16;
    yinyig.layer.shadowColor = [UIColor blackColor].CGColor;
    yinyig.layer.shadowRadius = LENGTH(4);
    yinyig.layer.shadowOffset = CGSizeMake(0,0);
    yinyig.layer.cornerRadius = LENGTH(5);
    
    yy = [UIView new];
    yy.backgroundColor = [UIColor whiteColor];
    [self addSubview:yy];
    [yy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).with.offset(LENGTH(4));
        make.left.equalTo(ws.mas_left).with.offset(LENGTH(4));
        make.right.equalTo(ws.mas_right).with.offset(-LENGTH(4));
        make.height.equalTo(self->yy.mas_width).multipliedBy(1.4283333333);
    }];

    
    imageView = [FLAnimatedImageView new];
//    imageView.backgroundColor = [UIColor whiteColor];
    imageView.image = UIIMAGE(@"发现_你的同学_书缺省位置");
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [yy addSubview:imageView];
    
//    imageView.layer.shadowOpacity = 0.4;
//    imageView.layer.shadowColor = [UIColor blackColor].CGColor;
//    imageView.layer.shadowRadius = 2.f;
//    imageView.layer.shadowOffset = CGSizeMake(0,0);
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
    Title.numberOfLines = 1;
    [self addSubview:Title];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->yy);
//        make.top.equalTo(ws.mas_top).with.offset(2);
//        make.left.equalTo(ws.mas_left).with.offset(2);
//        make.right.equalTo(ws.mas_right).with.offset(-2);
//        make.height.equalTo(ws.mas_width).multipliedBy(1.417);
//        make.height.mas_equalTo(LENGTH(163));
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->yy.mas_bottom).with.offset(LENGTH(6));
//        make.bottom.equalTo(ws).with.offset(0);
        make.left.equalTo(ws.mas_left).with.offset(0);
        make.right.equalTo(ws.mas_right).with.offset(0);
    }];
    
    UIImageView * xian = [UIImageView new];
    xian.image = UIIMAGE(@"书线");
    [yy addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.and.left.mas_equalTo(self->yy);
        make.width.mas_equalTo(LENGTH(9));
    }];
}

- (void)setModel:(BookListModel *)model{
    _model = model;
    Title.text = model.name;
    [imageView sd_setImageWithURL:URLIMAGE(model.cover) placeholderImage:UIIMAGE(@"发现_你的同学_书缺省位置")];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:yy.bounds byRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopRight cornerRadii:CGSizeMake(LENGTH(5),LENGTH(5))];
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = yy.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    yy.layer.mask = maskLayer;
}
@end
