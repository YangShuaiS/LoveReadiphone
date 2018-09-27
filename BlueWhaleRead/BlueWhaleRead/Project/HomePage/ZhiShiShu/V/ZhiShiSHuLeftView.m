//
//  ZhiShiSHuLeftView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/17.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiSHuLeftView.h"

@implementation ZhiShiSHuLeftView{
    CAGradientLayer *gradient;
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
    self.backgroundColor = [UIColor clearColor];
    gradient = [CAGradientLayer layer];
    [self.layer addSublayer:gradient];

}
- (void)layoutSubviews{
    [super layoutSubviews];
    gradient.frame = self.bounds;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[UIColor magentaColor].CGColor,
                       (id)[UIColor cyanColor].CGColor,
                       (id)[UIColor greenColor].CGColor, nil];
//    gradient.startPoint = CGPointMake(0, 0);
//    gradient.endPoint = CGPointMake(1, 1);
    gradient.locations = @[@0.0, @0.5, @1];

}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];

}
@end
