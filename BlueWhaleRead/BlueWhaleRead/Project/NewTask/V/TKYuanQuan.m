//
//  TKYuanQuan.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/10.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "TKYuanQuan.h"

@implementation TKYuanQuan

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
    _wview = [UIView new];
    _wview.layer.masksToBounds = YES;
    _wview.layer.cornerRadius = LENGTH(4);
    [self addSubview:_wview];
    [_wview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
        make.width.and.height.mas_equalTo(LENGTH(8));
    }];
    
    _nview = [UIView new];
    _nview.backgroundColor = [UIColor whiteColor];
    _nview.layer.masksToBounds = YES;
    _nview.layer.cornerRadius = LENGTH(3);
    [_wview addSubview:_nview];
    [_nview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.wview).with.insets(UIEdgeInsetsMake(LENGTH(2), LENGTH(2), LENGTH(2), LENGTH(2)));
    }];
}
@end
