//
//  ZhiShiShuAnimalView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/4.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ZhiShiShuAnimalView.h"

@implementation ZhiShiShuAnimalView{
    UIView * view;
    BOOL one;
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
    one = NO;
    view = [UIView new];
    view.backgroundColor = RGBA(0, 0, 0, 0.4);
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
        make.width.and.height.mas_equalTo(10);
    }];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 5;
}
- (void)layoutSubviews{
    [super layoutSubviews];
//    view.layer.cornerRadius = view.frame.size.width/2;
//    NSLog(@"11");
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
    if (one == NO) {
        one = YES;
        [self animal];
    }
//    });
}
- (void)animal{
    WS(ws);
    [UIView animateWithDuration:1.0 animations:^{
        [self->view mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(ws.frame.size);
        }];
        [self->view layoutIfNeeded];
        self->view.layer.cornerRadius = self->view.frame.size.width/2;
    } completion:^(BOOL finished) {
        ws.block();
        [ws removeFromSuperview];
    }];
}
@end
