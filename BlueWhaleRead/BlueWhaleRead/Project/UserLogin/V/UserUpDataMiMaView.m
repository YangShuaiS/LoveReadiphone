//
//  UserUpDataMiMaView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserUpDataMiMaView.h"
#import "UserForgetTextFileView.h"

@implementation UserUpDataMiMaView{
    UserForgetTextFileView * zhanghao;
    UserForgetTextFileView * mima;
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
    zhanghao = [UserForgetTextFileView new];
    zhanghao.title = @"请输入新密码      6-18位数字与字母";
    zhanghao.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:zhanghao];
    [zhanghao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(66));
    }];
    [zhanghao setBlock:^(NSString *text) {
        [ws phone:text];
    }];
    
    BaseView * xian = [BaseView new];
    xian.backgroundColor = RGB(164,163,163);
    [self addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(self->zhanghao.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    
    mima = [UserForgetTextFileView new];
    mima.title = @"请确认新密码";
    mima.secureTextEntry = YES;
    [self addSubview:mima];
    [mima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->zhanghao.mas_bottom);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(66));
    }];
    [mima setBlock:^(NSString *text) {
        [ws phone:text];
    }];
    
    BaseView * xian1 = [BaseView new];
    xian1.backgroundColor = RGB(164,163,163);
    [self addSubview:xian1];
    [xian1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(self->mima.mas_bottom);
        make.height.mas_equalTo(1);
    }];

}
- (void)returnKeyboard{
    [zhanghao returnKeyboard];
    [mima returnKeyboard];
}

- (void)phone:(NSString *)str{

}

- (BOOL)yizhi{
    BOOL yizhi;
    if ([zhanghao.textField.text isEqualToString:mima.textField.text]) {
        yizhi = YES;
    }else{
        yizhi = NO;
    }
    return yizhi;
}

- (NSArray *)XGMM{
    NSArray * arr = @[zhanghao.textField.text];
    return arr;
}
@end
