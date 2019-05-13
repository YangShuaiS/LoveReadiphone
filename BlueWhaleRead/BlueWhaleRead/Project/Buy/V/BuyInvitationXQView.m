//
//  BuyInvitationXQView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/26.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyInvitationXQView.h"

@implementation BuyInvitationXQView{
    UIView * backView;
    UIImageView * ewm;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}

- (void)addview{
    WS(ws);
    ws.now = 0;
    backView = [UIView new];
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.cornerRadius = LENGTH(10);
    backView.layer.shadowOpacity = 1;
    backView.layer.shadowColor = RGBA(213, 213, 213,1).CGColor;
    backView.layer.shadowRadius = LENGTH(16);
    backView.layer.shadowOffset = CGSizeMake(0,0);
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.bottom.mas_equalTo(ws);
    }];
    
    UIView * yjview = [UIView new];
    yjview.layer.cornerRadius = LENGTH(10);
    yjview.layer.masksToBounds = YES;
    [backView addSubview:yjview];
    [yjview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->backView);
        make.left.mas_equalTo(ws).with.offset(LENGTH(17));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.bottom.mas_equalTo(self->backView);
    }];
    
    UIImageView * backImageView = [UIImageView new];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.image = UIIMAGE(@"卡片");
    [yjview addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.right.and.left.mas_equalTo(yjview);
        make.height.mas_equalTo(LENGTH(417));
    }];
    
    UIImageView * touxiang = [UIImageView new];
    touxiang.contentMode = UIViewContentModeScaleAspectFit;
    touxiang.layer.cornerRadius = LENGTH(22);
    touxiang.layer.masksToBounds = YES;
    [backImageView addSubview:touxiang];
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backImageView).with.offset(LENGTH(15));
        make.left.mas_equalTo(backImageView).with.offset(LENGTH(36));
        make.size.mas_equalTo(CGSizeMake(LENGTH(44), LENGTH(44)));
    }];
    [touxiang sd_setImageWithURL:URLIMAGE(Me.avatar) placeholderImage:UIIMAGE(@"头像-大") completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        ws.now++;
    }];
    
    BaseLabel * name = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFontCu(16) TextAlignment:NSTextAlignmentLeft Text:Me.name];
    [backImageView addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(touxiang.mas_right).with.offset(LENGTH(6));
        make.centerY.mas_equalTo(touxiang);
    }];
    
    ewm = [UIImageView new];
    ewm.image = UIIMAGE(@"小程序");
    ewm.contentMode = UIViewContentModeScaleAspectFit;
    [yjview addSubview:ewm];
    [ewm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backImageView).with.offset(LENGTH(13));
        make.top.mas_equalTo(backImageView.mas_bottom).with.offset(LENGTH(9));
        make.bottom.mas_equalTo(yjview).with.offset(-LENGTH(9));
        make.size.mas_equalTo(CGSizeMake(LENGTH(53), LENGTH(53)));
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFontCu(13) TextAlignment:NSTextAlignmentLeft Text:@"博万卷"];
    [yjview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->ewm).with.offset(LENGTH(13));
        make.height.mas_equalTo(LENGTH(13));
        make.left.mas_equalTo(self->ewm.mas_right).with.offset(LENGTH(9));
    }];
    
    BaseLabel * subtitle = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"扫码即可助力好友获得免费季度会员。"];
    [yjview addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(6));
        make.height.mas_equalTo(LENGTH(12));
        make.left.mas_equalTo(self->ewm.mas_right).with.offset(LENGTH(9));
    }];
}

- (void)setLayerhiden:(BOOL)layerhiden{
    _layerhiden = layerhiden;
    if (layerhiden == NO) {
        backView.layer.masksToBounds = YES;
    }
}
- (void)setModel:(BuyYaoQingModel *)model{
    _model = model;
    WS(ws);
    [ewm sd_setImageWithURL:URLIMAGE(model.small_program_code) completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        ws.now++;
    }];
}
@end
