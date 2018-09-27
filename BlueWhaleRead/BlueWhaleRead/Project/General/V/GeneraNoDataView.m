//
//  GeneraNoDataView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GeneraNoDataView.h"

@implementation GeneraNoDataView{
    FLAnimatedImageView * imageView;
    BaseLabel * title;
    BaseLabel * clickTitle;
    FLAnimatedImageView * imageViewTwo;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)setStyle:(NoDtaaViewStyle)style{
    _style = style;
    switch (style) {
        case NoDtaaViewStyleImageLabel:
            [self addImageView];
            [self addTitle];
            [self NoDtaaViewStyleImageLabel];
            break;
        case NoDtaaViewStyleLabelClick:
            [self addTitle];
            [self addcliCkTitle];
            [self NoDtaaViewStyleLabelClick];
            break;
        case NoDtaaViewStyleImageLabelClick:
            [self addImageView];
            [self addTitle];
            [self addcliCkTitle];
            [self NoDtaaViewStyleImageLabelClick];
            break;
        case NoDtaaViewStyleUpData:
            [self addImageView];
            [self addTitle];
            [self addcliCkTitle];
            [self NoDtaaViewStyleUpData];
            break;
        case NoDtaaViewStyleBiaoGe:
            [self addImageArray];
            [self addTitle];
            [self NoDtaaViewStyleBiaoGe];
            break;
        default:
            break;
    }
}

- (void)NoDtaaViewStyleBiaoGe{
    WS(ws);
    if (_imageArray.count == 1) {
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(ws);
            make.top.mas_equalTo(ws).with.offset(LENGTH(40));
        }];
    }else if (_imageArray.count == 2){
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(ws).with.offset(-LENGTH(50));
            make.top.mas_equalTo(ws).with.offset(LENGTH(40));
        }];
        [imageViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(ws).with.offset(LENGTH(50));
            make.top.mas_equalTo(ws).with.offset(LENGTH(40));
        }];
    }
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(36));
        make.bottom.mas_equalTo(ws).with.offset(LENGTH(36));
    }];
}

- (void)NoDtaaViewStyleUpData{
    WS(ws);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(50));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(168));
        make.height.mas_equalTo(LENGTH(136));
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(36));
    }];
    
    [clickTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(60));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(200));
        make.height.mas_equalTo(LENGTH(50));
    }];
    clickTitle.textColor = RGB(23,167,162);
    clickTitle.backgroundColor = BEIJINGCOLOR;
    clickTitle.layer.borderColor = RGB(23, 167, 162).CGColor;
    clickTitle.layer.borderWidth = 2;
}
- (void)NoDtaaViewStyleImageLabelClick{
    WS(ws);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(50));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(116));
        make.height.mas_equalTo(LENGTH(116));
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(36));
    }];
    
    [clickTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(60));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(130));
        make.height.mas_equalTo(LENGTH(36));
    }];
    
    clickTitle.backgroundColor = RGB(90,196,192);
    clickTitle.textColor = WhitColor;
}

- (void)NoDtaaViewStyleImageLabel{
    WS(ws);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(50));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(116));
        make.height.mas_equalTo(LENGTH(116));
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->imageView.mas_bottom).with.offset(LENGTH(36));
    }];
}

- (void)NoDtaaViewStyleLabelClick{
    WS(ws);
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws).with.offset(LENGTH(140));
    }];
    
    [clickTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(60));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(130));
        make.height.mas_equalTo(LENGTH(36));
    }];
}

- (void)addImageView{
    imageView= [FLAnimatedImageView new];
    imageView.image = UIIMAGE(_image);
    [self addSubview:imageView];
}

- (void)addTitle{
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:_titlename];
    title.numberOfLines = 0;
    [self addSubview:title];
}
- (void)addcliCkTitle{
    clickTitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(9,187,180) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:_clickName];
    clickTitle.backgroundColor = WhitColor;
    clickTitle.layer.masksToBounds = YES;
    clickTitle.layer.cornerRadius = LENGTH(18);
    [self addSubview:clickTitle];
    
    clickTitle.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [clickTitle addGestureRecognizer:tap];
}
- (void)tap{
    self.block();
}
- (void)addImageArray{
    if (_imageArray.count == 1) {
        imageView= [FLAnimatedImageView new];
        imageView.image = UIIMAGE(_imageArray[0]);
        [self addSubview:imageView];
    }else if (_imageArray.count == 2){
        imageView= [FLAnimatedImageView new];
        imageView.image = UIIMAGE(_imageArray[0]);
        [self addSubview:imageView];
        
        imageViewTwo= [FLAnimatedImageView new];
        imageViewTwo.image = UIIMAGE(_imageArray[1]);
        [self addSubview:imageViewTwo];
    }
}
@end
