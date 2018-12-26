//
//  HTprogressView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HTprogressView.h"

@implementation HTprogressView{
    UIView * downView;
    UIView * upView;
    
    NSMutableArray * labelarray;
    NSMutableArray * yuanquanarrat;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        labelarray = [NSMutableArray array];
        yuanquanarrat = [NSMutableArray array];
        [self addview];
    }
    return self;
}

- (void)addview{
    WS(ws);
    downView = [UIView new];
    downView.backgroundColor = RGB(193,194,242);
    downView.layer.cornerRadius = LENGTH(5);
    downView.layer.masksToBounds = YES;
    [self addSubview:downView];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(12));
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.height.mas_equalTo(LENGTH(10));
    }];
    

    
    BaseLabel * label25 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"25%"];
    [self addSubview:label25];
    [label25 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->downView.mas_bottom).with.offset(LENGTH(9));
        make.bottom.mas_equalTo(ws);
        make.centerX.mas_equalTo(self->downView).multipliedBy(0.5);
    }];
    
    
    BaseLabel * label50 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"50%"];
    [self addSubview:label50];
    [label50 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->downView.mas_bottom).with.offset(LENGTH(9));
        make.centerX.mas_equalTo(self->downView).multipliedBy(1);
    }];
    
    BaseLabel * label75 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"75%"];
    [self addSubview:label75];
    [label75 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->downView.mas_bottom).with.offset(LENGTH(9));
        make.centerX.mas_equalTo(self->downView).multipliedBy(1.5);
    }];
    
    BaseLabel * label100 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"100%"];
    [self addSubview:label100];
    [label100 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->downView.mas_bottom).with.offset(LENGTH(9));
        make.bottom.mas_equalTo(ws);
        make.centerX.mas_equalTo(self->downView).multipliedBy(2);
    }];
    [labelarray addObject:label25];
    [labelarray addObject:label50];
    [labelarray addObject:label75];
    [labelarray addObject:label100];
    
    [self addYuanQuan:label25 BackView:downView];
    [self addYuanQuan:label50 BackView:downView];
    [self addYuanQuan:label75 BackView:downView];
    [self addYuanQuan:label100 BackView:downView];
}

- (void)addYuanQuan:(BaseLabel *)label BackView:(UIView *)view{
    CGFloat w = 0.0;
    if ([label.text isEqualToString:@"25%"]) {
        w = LENGTH(34)*0.7;
    }else if ([label.text isEqualToString:@"50%"]){
        w = LENGTH(34)*0.8;
    }else if ([label.text isEqualToString:@"75%"]){
        w = LENGTH(34)*0.9;
    }else if ([label.text isEqualToString:@"100%"]){
        w = LENGTH(34);
    }
    
    UIView * yuanquan = [UIView new];
    yuanquan.backgroundColor = view.backgroundColor;
    yuanquan.layer.cornerRadius = w/2;
    yuanquan.layer.masksToBounds = YES;
    [self addSubview:yuanquan];
    [yuanquan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(label);
        make.centerY.mas_equalTo(view);
        make.width.and.height.mas_equalTo(w);
    }];
    [yuanquanarrat addObject:yuanquan];
    
}

- (void)setWc:(BOOL)wc{
    _wc = wc;
    if (wc == YES) {
        downView.backgroundColor = RGB(205,130,253);
        for (BaseLabel * label in labelarray) {
            label.text = @"";
        }
        for (UIView * v in yuanquanarrat) {
            v.backgroundColor = downView.backgroundColor;
        }
    }
}
- (void)setJindu:(CGFloat)jindu{
    _jindu = jindu;
    CGFloat bili = jindu/100.00;
    downView.hidden = YES;
    WS(ws);
    if (upView != nil) {
        [upView removeFromSuperview];
    }
    for (UIView * v in yuanquanarrat) {
        v.backgroundColor = downView.backgroundColor;
    }
    upView = [UIView new];
    upView.backgroundColor = RGB(205,130,253);
    upView.layer.cornerRadius = LENGTH(5);
    upView.layer.masksToBounds = YES;
    [self addSubview:upView];
    [upView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(12));
        make.left.mas_equalTo(ws);
        //        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.height.mas_equalTo(LENGTH(10));
        make.width.mas_equalTo(self->downView).multipliedBy(bili);
    }];
    if (bili>=0.25) {
        UIView * yuan = yuanquanarrat[0];
        yuan.backgroundColor = upView.backgroundColor;
    }
    if (bili>=0.5) {
        UIView * yuan = yuanquanarrat[1];
        yuan.backgroundColor = upView.backgroundColor;
    }
    
    if (bili>=0.75) {
        UIView * yuan = yuanquanarrat[2];
        yuan.backgroundColor = upView.backgroundColor;
    }
    
    if (bili>=1.00) {
        UIView * yuan = yuanquanarrat[3];
        yuan.backgroundColor = upView.backgroundColor;
    }
}
@end
