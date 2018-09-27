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
    imageView = [FLAnimatedImageView new];
    imageView.layer.shadowOpacity = 0.4;
    imageView.layer.shadowColor = [UIColor blackColor].CGColor;
    imageView.layer.shadowRadius = 2.f;
    imageView.layer.shadowOffset = CGSizeMake(0,0);
    imageView.image = UIIMAGE(@"发现_你的同学_书缺省位置");
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
    Title.numberOfLines = 2;
    [self addSubview:Title];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).with.offset(2);
        make.left.equalTo(ws.mas_left).with.offset(2);
        make.right.equalTo(ws.mas_right).with.offset(-2);
        make.height.equalTo(ws.mas_width).multipliedBy(1.417);
//        make.height.mas_equalTo(LENGTH(163));
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_bottom).with.offset(LENGTH(6));
//        make.bottom.equalTo(ws).with.offset(0);
        make.left.equalTo(ws.mas_left).with.offset(0);
        make.right.equalTo(ws.mas_right).with.offset(0);
    }];
}

- (void)setModel:(BookListModel *)model{
    _model = model;
    Title.text = model.name;
    [imageView sd_setImageWithURL:URLIMAGE(model.cover) placeholderImage:UIIMAGE(@"发现_你的同学_书缺省位置")];
}
@end
