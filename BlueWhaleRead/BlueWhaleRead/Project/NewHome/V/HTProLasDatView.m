//
//  HTProLasDatView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HTProLasDatView.h"

@implementation HTProLasDatView{
    UIView * backview;
    BaseLabel * paiming;
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
    backview = [UIView new];
    backview.layer.masksToBounds = YES;
    backview.layer.cornerRadius = LENGTH(25);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(0, LENGTH(46), 0, LENGTH(46)));
        make.height.mas_equalTo(LENGTH(50));
    }];
    paiming = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,163,81) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"与昨天排名相比"];
    [backview addSubview:paiming];
    [paiming mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->backview);
    }];
    
    jiantou = [UIImageView new];
    jiantou.contentMode = UIViewContentModeScaleAspectFit;
    [backview addSubview:jiantou];
    [jiantou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->paiming.mas_right).with.offset(LENGTH(20));
        make.centerY.mas_equalTo(self->backview);
        make.width.mas_equalTo(LENGTH(12));
        make.height.mas_equalTo(LENGTH(26));
    }];
}
- (void)setZt:(NSString *)zt{
    backview.backgroundColor = _colorarray[4];
    paiming.textColor = _colorarray[1];
    if ([zt isEqualToString:@"1"]) {
        jiantou.image = UIIMAGE(@"上升");
    }else{
        jiantou.image = UIIMAGE(@"下降");
    }
}
@end
