//
//  ZhiShiSHuTanKuang.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/21.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiSHuTanKuang.h"

@implementation ZhiShiSHuTanKuang

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    self.backgroundColor = [UIColor redColor];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(0);
    }];
}
- (void)animatedstar{
    [UIView animateWithDuration:0.5 animations:^{
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(150);
        }];
        [self.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
//        [self removeFromSuperview];
    }];
}
- (void)animatedend{
    [UIView animateWithDuration:0.5 animations:^{
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
            make.height.mas_equalTo(0);
        }];
        [self.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];

    }];
}
@end
