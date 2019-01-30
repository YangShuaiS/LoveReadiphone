//
//  AccountSettingsClick.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "AccountSettingsClick.h"
@implementation AccountSettingsClick{

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
    _imageview = [UIImageView new];
    _imageview.image = UIIMAGE(@"组 350");
    _imageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_imageview];
    [_imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(12));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(12));
        make.left.mas_equalTo(ws);
        make.width.and.height.mas_equalTo(LENGTH(30));
    }];
    
    _titlelabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,49,49) LabelFont:TextFontCu(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:_titlelabel];
    [_titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(ws.imageview.mas_right).with.offset(LENGTH(24));
//        make.right.mas_equalTo(ws).with.offset(-LENGTH(100));
    }];
    

    
    FLAnimatedImageView * rightview = [FLAnimatedImageView new];
    rightview.image = UIIMAGE(@"icon_个人资料_箭头");
    [self addSubview:rightview];
    [rightview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(8));
        make.height.mas_equalTo(LENGTH(14));
    }];
    
    _subtitlelabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,49,49) LabelFont:TextFontCu(16) TextAlignment:NSTextAlignmentRight Text:@""];
    [self addSubview:_subtitlelabel];
    [_subtitlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(ws.titlelabel.mas_right).with.offset(LENGTH(5));
        make.right.mas_equalTo(rightview.mas_left).with.offset(-LENGTH(5));
    }];
    
    UIView * v = [UIView new];
    v.backgroundColor = RGB(244,246,246);
    [self addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws).with.offset(-1);
        make.left.mas_equalTo(ws);;
        make.right.mas_equalTo(ws);
        make.height.mas_equalTo(1);
    }];
}

- (void)bangding{
    _subtitlelabel.textColor =RGB(2,49,49);
    _subtitlelabel.text = @"解绑";

}
- (void)weibangding{
    _subtitlelabel.textColor =RGB(82,199,198);
    _subtitlelabel.text = @"尚未绑定";
}
@end
