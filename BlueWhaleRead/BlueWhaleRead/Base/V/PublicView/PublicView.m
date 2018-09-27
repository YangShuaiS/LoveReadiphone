//
//  PublicView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PublicView.h"

@implementation PublicView{
    BaseView * DownView;
    FLAnimatedImageView * userImage;
    BaseLabel * title;
    
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addView];
    }
    return self;
}

- (void)addView{
    WS(ws);
    
    BaseView * backView = [BaseView new];
    backView.backgroundColor = [UIColor blackColor];
    backView.alpha = 0.3;
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    DownView = [BaseView new];
    DownView.backgroundColor = RGB(235,237,238);
    DownView.layer.masksToBounds = YES;
    DownView.layer.cornerRadius = LENGTH(15);
    [self addSubview:DownView];
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    [DownView addSubview:effectView];
    [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->DownView);
    }];
}
- (void)setModel:(PublicModel *)model{
    _model = model;
    switch (model.style) {
        case PopViewStylecancel:
            [self cancel];
            [self adduserimag];
            [self addtitle];
            [self addxian];
            [self addDwonLableOne];
            break;
        case PopViewStyleQueren:
            [self cancel];
            [self adduserimag];
            [self addtitle];
            [self addxian];
            [self addDwonLableTwo];
            break;
        default:
            break;
    }
}
- (void)cancel{
    WS(ws);
    [DownView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(470));
        make.height.mas_equalTo(LENGTH(270));
    }];
}

- (void)adduserimag{
    FLAnimatedImageView * UserImageView = [FLAnimatedImageView new];
    UserImageView.backgroundColor = RGB(235,237,238);
    UserImageView.layer.masksToBounds = YES;
    UserImageView.layer.cornerRadius = LENGTH(55);
    [self addSubview:UserImageView];
    [UserImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->DownView.mas_top).with.offset(-LENGTH(30));
        make.centerX.mas_equalTo(self->DownView.mas_centerX);
        make.width.mas_equalTo(LENGTH(110));
        make.height.mas_equalTo(LENGTH(110));
    }];
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    [UserImageView addSubview:effectView];
    [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UserImageView);
    }];
    
    
    userImage = [FLAnimatedImageView new];
    userImage.backgroundColor = RGB(179,179,179);
    userImage.layer.masksToBounds = YES;
    userImage.layer.cornerRadius = LENGTH(41);
    [self addSubview:userImage];
    [userImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(UserImageView);
        make.width.mas_equalTo(LENGTH(82));
        make.height.mas_equalTo(LENGTH(82));
    }];
}

- (void)addtitle{
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(14,13,13) LabelFont:TextFont(25) TextAlignment:NSTextAlignmentCenter Text:_model.title];
    title.numberOfLines = 0;
    [DownView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        if (self->userImage == nil) {
            make.centerY.mas_equalTo(self->DownView.mas_centerY).with.offset(-LENGTH(60));
        }else{
            make.top.mas_equalTo(self->userImage.mas_bottom).with.offset(LENGTH(30));
        }
        make.left.equalTo(self->DownView.mas_left).with.offset(LENGTH(0));
        make.right.equalTo(self->DownView.mas_right).with.offset(LENGTH(0));
    }];
}
- (void)addxian{
    BaseView * xian = [BaseView new];
    xian.backgroundColor = RGB(142,149,155);
    [self addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->DownView.mas_left);
        make.right.mas_equalTo(self->DownView.mas_right);
        make.height.mas_equalTo(1);
        make.bottom.mas_equalTo(self->DownView.mas_bottom).with.offset(-LENGTH(60));
    }];
}
- (void)addDwonLableOne{
    WS(ws);
    BaseLabel * onelabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(14,13,13) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:_model.onelabel];
    onelabel.userInteractionEnabled = YES;
    [DownView addSubview:onelabel];
    [onelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(self->DownView.mas_bottom);
        make.height.mas_equalTo(LENGTH(60));
    }];
    
    BaseButton * oneButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [oneButton addTarget:self action:@selector(oneButton) forControlEvents:UIControlEventTouchUpInside];
    [onelabel addSubview:oneButton];
    [oneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(onelabel);
    }];
}

- (void)addDwonLableTwo{
    WS(ws);
    BaseLabel * onelabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(14,13,13) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:_model.onelabel];
    onelabel.userInteractionEnabled = YES;
    [DownView addSubview:onelabel];

    
    BaseButton * oneButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [oneButton addTarget:self action:@selector(oneButton) forControlEvents:UIControlEventTouchUpInside];
    [onelabel addSubview:oneButton];
    
    BaseLabel * twolabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(14,13,13) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:_model.twolabel];
    twolabel.userInteractionEnabled = YES;
    [DownView addSubview:twolabel];
    
    
    BaseButton * twoButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [twoButton addTarget:self action:@selector(twoButton) forControlEvents:UIControlEventTouchUpInside];
    [twolabel addSubview:twoButton];
    
    [onelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->DownView.mas_left);
        make.right.mas_equalTo(twolabel.mas_left);
        make.bottom.mas_equalTo(self->DownView.mas_bottom);
        make.height.mas_equalTo(LENGTH(60));
        make.width.mas_equalTo(twolabel.mas_width);
    }];
    
    [oneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(onelabel);
    }];
    
    [twolabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(onelabel.mas_right);
        make.right.mas_equalTo(self->DownView.mas_right);
        make.bottom.mas_equalTo(self->DownView.mas_bottom);
        make.height.mas_equalTo(LENGTH(60));
        make.width.mas_equalTo(onelabel.mas_width);
    }];
    
    [twoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(twolabel);
    }];
}

- (void)oneButton{
    self.leftClick();
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)twoButton{
    self.rightClick();
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
