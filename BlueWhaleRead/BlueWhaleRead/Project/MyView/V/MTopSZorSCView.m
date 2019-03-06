//
//  MTopSZorSCView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MTopSZorSCView.h"
#import "SZSCViewController.h"
@implementation MTopSZorSCView

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
    self.backgroundColor = RGBA(0, 0, 0, 0.6);
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xiaoshi)];
    [self addGestureRecognizer:tap];
    
    UIView * bakeview = [UIView new];
    bakeview.backgroundColor = [UIColor whiteColor];
    bakeview.layer.cornerRadius = LENGTH(10);
    bakeview.layer.masksToBounds = YES;
    [self addSubview:bakeview];
    [bakeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(298));
        make.height.mas_equalTo(LENGTH(288));
    }];
    
    BaseLabel * toplabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor whiteColor] LabelFont:TextFont(24) TextAlignment:NSTextAlignmentCenter Text:@"识字量测试"];
    toplabel.backgroundColor = RGB(112,221,212);
    [self addSubview:toplabel];
    
    BaseLabel * downlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor whiteColor] LabelFont:TextFont(24) TextAlignment:NSTextAlignmentCenter Text:@"识词量测试"];
    downlabel.backgroundColor = RGB(112,221,212);
    [self addSubview:downlabel];
    
    [toplabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(bakeview).with.offset(LENGTH(27));
        make.right.mas_equalTo(bakeview).with.offset(-LENGTH(27));
        make.top.mas_equalTo(bakeview).with.offset(LENGTH(71));
        make.height.mas_equalTo(LENGTH(60));
    }];
    
    [downlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(bakeview).with.offset(LENGTH(27)); 
        make.right.mas_equalTo(bakeview).with.offset(-LENGTH(27));
        make.top.mas_equalTo(toplabel.mas_bottom).with.offset(LENGTH(13));
        make.height.mas_equalTo(LENGTH(60));
    }];
    
    toplabel.userInteractionEnabled = YES;
    downlabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap0 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toplabel)];
    [toplabel addGestureRecognizer:tap0];
    
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(downlabel)];
    [downlabel addGestureRecognizer:tap1];
}

- (void)toplabel{
    if ([self.nav respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.nav.interactivePopGestureRecognizer.enabled = NO;
    }
    SZSCViewController * vc = [SZSCViewController new];
    vc.titles = @"识字量检测";
    [self.nav pushViewController:vc animated:YES];
    [self removeFromSuperview];

    
}

- (void)downlabel{
    if ([self.nav respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.nav.interactivePopGestureRecognizer.enabled = NO;
    }
    SZSCViewController * vc = [SZSCViewController new];
    vc.titles = @"识词量检测";
    [self.nav pushViewController:vc animated:YES];
    [self removeFromSuperview];

}

- (void)xiaoshi{
    [self removeFromSuperview];
}
@end
