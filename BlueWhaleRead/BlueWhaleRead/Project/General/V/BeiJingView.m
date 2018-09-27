//
//  BeiJingView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BeiJingView.h"

@implementation BeiJingView
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
    self.layer.masksToBounds = YES;
    FLAnimatedImageView * backView = [FLAnimatedImageView new];
    backView.image = UIIMAGE(@"bg_书架_书籍详情大背景");
    backView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    FLAnimatedImageView * backView1 = [FLAnimatedImageView new];
    backView1.image = UIIMAGE(@"bg-石");
    backView1.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:backView1];
    [backView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    FLAnimatedImageView * down = [FLAnimatedImageView new];
    down.image = UIIMAGE(@"bg-鱼");
    [backView1 addSubview:down];
    [down mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(backView1);
        make.centerX.mas_equalTo(backView1);
        make.width.mas_equalTo(down.image.size.width/2);
        make.height.mas_equalTo(down.image.size.height/2);
    }];
    
    FLAnimatedImageView * left = [FLAnimatedImageView new];
    left.contentMode = UIViewContentModeScaleAspectFill;

    left.image = UIIMAGE(@"bg-左");
    [backView1 addSubview:left];
    [left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(backView1);
        make.left.mas_equalTo(backView1);
        make.width.mas_equalTo(left.image.size.width/2);
        make.height.mas_equalTo(left.image.size.height/2);
    }];
//    13718818919
    FLAnimatedImageView * right = [FLAnimatedImageView new];
    right.contentMode = UIViewContentModeScaleAspectFill;

    right.image = UIIMAGE(@"bg-右");
    [backView1 addSubview:right];
    [right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(backView1);
        make.right.mas_equalTo(backView1);
        make.width.mas_equalTo(right.image.size.width/2);
        make.height.mas_equalTo(right.image.size.height/2);
    }];
}
@end
