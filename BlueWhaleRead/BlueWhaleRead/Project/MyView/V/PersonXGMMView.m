//
//  PersonXGMMView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonXGMMView.h"
#import "UserForgetTextFileView.h"

@implementation PersonXGMMView
{
    UserForgetTextFileView * yuanmima;
    UserForgetTextFileView * xinmima;
    UserForgetTextFileView * qrxinmima;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)addView{
    self.backgroundColor = RGB(255, 255, 255);
    WS(ws);
    yuanmima = [UserForgetTextFileView new];
    yuanmima.title = @"请输入原密码";
    yuanmima.secureTextEntry = YES;
    [self addSubview:yuanmima];
    [yuanmima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(66));
    }];
    [yuanmima setBlock:^(NSString *text) {
        [ws phone:text];
    }];
    
    BaseView * xian = [BaseView new];
    xian.backgroundColor = RGB(164,163,163);
    [self addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(self->yuanmima.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    
    xinmima = [UserForgetTextFileView new];
    xinmima.title = @"请输入新密码      6-18位数字与字母";
    xinmima.secureTextEntry = YES;
    [self addSubview:xinmima];
    [xinmima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->yuanmima.mas_bottom);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(66));
    }];
    [xinmima setBlock:^(NSString *text) {
        [ws phone:text];
    }];
    
    BaseView * xian1 = [BaseView new];
    xian1.backgroundColor = RGB(164,163,163);
    [self addSubview:xian1];
    [xian1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(self->xinmima.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    
    qrxinmima = [UserForgetTextFileView new];
    qrxinmima.title = @"请确认新密码";
    qrxinmima.secureTextEntry = YES;
    [self addSubview:qrxinmima];
    [qrxinmima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->xinmima.mas_bottom);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(66));
    }];
    [qrxinmima setBlock:^(NSString *text) {
        [ws phone:text];
    }];
    
    BaseView * xian2 = [BaseView new];
    xian2.backgroundColor = RGB(164,163,163);
    [self addSubview:xian2];
    [xian2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(self->qrxinmima.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    
}
- (void)returnKeyboard{
    [yuanmima returnKeyboard];
    [xinmima returnKeyboard];
    [qrxinmima returnKeyboard];
}

- (void)phone:(NSString *)str{
    
}

- (BOOL)yizhi{
    BOOL yizhi;
    if ([qrxinmima.textField.text isEqualToString:xinmima.textField.text]) {
        yizhi = YES;
    }else{
        yizhi = NO;
    }
    return yizhi;
}
- (NSArray *)XGMM{
    NSArray * arr = @[yuanmima.textField.text,xinmima.textField.text];
    return arr;
}
@end
