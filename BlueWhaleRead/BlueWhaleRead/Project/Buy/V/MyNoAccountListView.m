//
//  MyNoAccountListView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/26.
//  Copyright © 2019 YS. All rights reserved.
//

#import "MyNoAccountListView.h"

@implementation MyNoAccountListView

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
    UIImageView * imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = UIIMAGE(@"无订单");
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(162), LENGTH(102)));
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(171, 171, 171) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"暂无订单记录"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageView.mas_bottom).with.offset(LENGTH(18));
        make.centerX.mas_equalTo(ws);
    }];
}
@end
