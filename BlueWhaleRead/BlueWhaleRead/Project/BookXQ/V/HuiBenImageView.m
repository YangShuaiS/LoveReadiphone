//
//  HuiBenImageView.m
//  DiaoYanDemoS
//
//  Created by 杨帅 on 2018/11/16.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HuiBenImageView.h"

@implementation HuiBenImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}

- (void)addview{
//    [self mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(WIDTH);
//        make.height.mas_equalTo(HEIGHT);
//    }];
    WS(ws);
    _imageview = [FLAnimatedImageView new];
    _imageview.contentMode = UIViewContentModeScaleAspectFit;
    _imageview.backgroundColor = [UIColor clearColor];
    [self addSubview:_imageview];
    _imageview.userInteractionEnabled = YES;
    [_imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

@end
