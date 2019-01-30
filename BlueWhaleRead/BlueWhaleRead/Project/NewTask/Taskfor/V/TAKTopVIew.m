//
//  TAKTopVIew.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TAKTopVIew.h"
#import "TakTaskJSView.h"
#import "TAKprizeView.h"
#import "TAKGZView.h"
#import "TakSZView.h"
@implementation TAKTopVIew{
    UIImageView * topimageview;
    TakTaskJSView * TKJS;
    TAKprizeView * jp;//奖品
    TAKGZView * gz;//规则
    TakSZView * sz;//设置

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
    topimageview = [UIImageView new];
    topimageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:topimageview];
    [topimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
//        make.height.mas_equalTo(LENGTH(115));
    }];
    
    TKJS = [TakTaskJSView new];
    [self addSubview:TKJS];
    [TKJS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->topimageview.mas_bottom).with.offset(LENGTH(16));
        make.left.and.right.mas_equalTo(ws);
    }];
    
    jp = [TAKprizeView new];
    [self addSubview:jp];
    [jp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->TKJS.mas_bottom).with.offset(LENGTH(20));
        make.left.and.right.mas_equalTo(ws);
    }];
    [jp removeFromSuperview];
    
    gz = [TAKGZView new];
    [self addSubview:gz];
    [gz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->jp.mas_bottom).with.offset(LENGTH(20));
        make.left.and.right.mas_equalTo(ws);
    }];
    
    sz = [TakSZView new];
    [self addSubview:sz];
    [sz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->gz.mas_bottom).with.offset(LENGTH(20));
        make.left.and.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
    }];
}
@end
