//
//  FoundBookCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/8/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundBookCollectionViewCell.h"

@implementation FoundBookCollectionViewCell
{
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
    imageView.image = UIIMAGE(ZHANWEITUSHU);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(21) TextAlignment:NSTextAlignmentCenter Text:CHANGWENZI];
    [self addSubview:Title];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).with.offset(0);
        make.left.equalTo(ws.mas_left).with.offset(0);
        make.right.equalTo(ws.mas_right).with.offset(0);
        make.height.equalTo(ws.mas_width).multipliedBy(1.417);
        //        make.height.mas_equalTo(LENGTH(163));
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(self->imageView.mas_bottom).with.offset(LENGTH(12));
        make.bottom.equalTo(ws).with.offset(0);
        make.left.equalTo(ws.mas_left).with.offset(0);
        make.right.equalTo(ws.mas_right).with.offset(0);
    }];
}

- (void)setModel:(BookListModel *)model{
    _model = model;
    Title.text = model.name;
    [imageView sd_setImageWithURL:URLIMAGE(model.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
}
@end
