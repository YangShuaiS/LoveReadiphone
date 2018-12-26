//
//  HTProLasDatView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HTProLasDatView.h"

@implementation HTProLasDatView{
    UIImageView * jiantou;
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
    UIView * backview = [UIView new];
    backview.backgroundColor = RGBA(255,255,255,0.3);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(0, LENGTH(38), 0, LENGTH(38)));
        make.height.mas_equalTo(LENGTH(24));
    }];
    BaseLabel * paiming = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(66,144,141) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"与昨天排名相比"];
    [backview addSubview:paiming];
    [paiming mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(backview);
    }];
    
    jiantou = [UIImageView new];
    jiantou.contentMode = UIViewContentModeScaleAspectFit;
    [backview addSubview:jiantou];
    [jiantou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(paiming.mas_right).with.offset(LENGTH(20));
        make.centerY.mas_equalTo(backview);
        make.width.mas_equalTo(LENGTH(8));
        make.height.mas_equalTo(LENGTH(19));
    }];
}
- (void)setZt:(NSString *)zt{
    if ([zt isEqualToString:@"1"]) {
        jiantou.image = UIIMAGE(@"上升");
    }else{
        jiantou.image = UIIMAGE(@"下降");
    }
}
@end
