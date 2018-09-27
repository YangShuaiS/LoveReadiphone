//
//  GppdBookXinXingView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GppdBookXinXingView.h"

@implementation GppdBookXinXingView{
    BaseLabel * title;
    FLAnimatedImageView * xinxing;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}

- (void)addView{
    WS(ws);
    xinxing = [FLAnimatedImageView new];
    xinxing.image = UIIMAGE(@"icon_首页_里程碑");
    [self addSubview:xinxing];
    [xinxing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,114,0) LabelFont:[UIFont fontWithName:@"Jkaton" size:FontSize(LENGTHHEIGHT(54))] TextAlignment:NSTextAlignmentCenter Text:@"0"];
    [xinxing addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->xinxing);
    }];
}
- (void)setInter:(NSInteger)inter{
    _inter = inter;
    title.text = [NSString stringWithFormat:@"%ld",inter];
}
- (void)weiwancheng{
    xinxing.image = UIIMAGE(@"icon_我的里程碑_星1_灰");
    title.textColor = RGB(0x87, 0x87, 0x87);
}
@end
