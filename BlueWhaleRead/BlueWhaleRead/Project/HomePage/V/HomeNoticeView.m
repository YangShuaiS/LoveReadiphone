//
//  HomeNoticeView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeNoticeView.h"

@implementation HomeNoticeView{
    BaseLabel * title;
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
    self.backgroundColor = RGB(254,141,140);
    WS(ws);
    FLAnimatedImageView * leftImageView = [FLAnimatedImageView new];
    leftImageView.image = UIIMAGE(@"icon_首页_作业通知喇叭");
    [self addSubview:leftImageView];
    [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
//        make.top.mas_equalTo(ws).with(LENGTH(14));
//        make.bottom.mas_equalTo(ws).with(-LENGTH(14));
        make.left.mas_equalTo(ws).with.offset(LENGTH(55));
        make.width.mas_equalTo(LENGTH(leftImageView.image.size.width));
        make.height.mas_equalTo(LENGTH(leftImageView.image.size.height));
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:WhitColor LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"老师留作业了老师留作业了老师留作业了"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(leftImageView.mas_right).with.offset(LENGTH(30));
        make.right.mas_equalTo(ws.mas_right).with.offset(-LENGTH(30));
    }];
    

}
@end
