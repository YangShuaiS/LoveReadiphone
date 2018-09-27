//
//  UserlLoginTextFileView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserlLoginTextFileView.h"
#import "UserLoginShruView.h"
#import "UserLoginForgetMMOneViewController.h"
@implementation UserlLoginTextFileView{
    UserLoginShruView * zhanghao;
    UserLoginShruView * mima;

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
    zhanghao = [UserLoginShruView new];
    zhanghao.image = UIIMAGE(@"icon_登录_密码");
    zhanghao.title = @"请输入账号";
    [self addSubview:zhanghao];
    [zhanghao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(60));
    }];
    
    BaseView * xian = [BaseView new];
    xian.backgroundColor = RGB(216,213,213);
    [self addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(self->zhanghao.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    
    mima = [UserLoginShruView new];
    mima.image = UIIMAGE(@"icon_登录_用户名");
    mima.title = @"请输入密码";
    mima.textField.secureTextEntry = YES;
    [self addSubview:mima];
    [mima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->zhanghao.mas_bottom);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(60));
    }];
    BaseButton * wjmm = [BaseButton buttonWithType:UIButtonTypeCustom];
    [wjmm addTarget:self action:@selector(wjmm) forControlEvents:UIControlEventTouchUpInside];
    [wjmm setTitleColor:RGB(98,95,95) forState:UIControlStateNormal];
    [wjmm setTitle:@"忘记密码?" forState:UIControlStateNormal];
    wjmm.titleLabel.font = TextFont(13);
    [mima addSubview:wjmm];
    [wjmm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->mima.mas_centerY);
        make.right.mas_equalTo(self->mima.mas_right).with.offset(-LENGTH(8));
    }];
}
- (void)returnKeyboard{
    [zhanghao returnKeyboard];
    [mima returnKeyboard];
}
- (void)wjmm{
    UserLoginForgetMMOneViewController * vc = [UserLoginForgetMMOneViewController new];
    [self.nav pushViewController:vc animated:YES];
}
- (NSString *)ZhangHao{
    return zhanghao.textField.text;
}
- (NSString *)MiMa{
    return mima.textField.text;

}
@end
