//
//  UserLoginGirlOrBoyView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserLoginGirlOrBoyView.h"

@implementation UserLoginGirlOrBoyView{
    UIImageView * topimageview;
    BaseLabel * xb;
    UIImageView * downimageview;
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
    [self addSubview:topimageview];
    [topimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(self->topimageview.mas_width);
    }];
    topimageview.backgroundColor = RANDOMCOLOR;
    
    xb = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(43,67,66) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"性别"];
    [self addSubview:xb];
    [xb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->topimageview.mas_bottom).with.offset(LENGTH(2));
        make.left.and.right.mas_equalTo(ws);
    }];
    
    downimageview = [UIImageView new];
    [self addSubview:downimageview];
    [downimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->xb.mas_bottom).with.offset(LENGTH(10));
        make.width.and.height.mas_equalTo(20);
        make.bottom.mas_equalTo(ws);
    }];
    downimageview.backgroundColor = RANDOMCOLOR;
}
@end
