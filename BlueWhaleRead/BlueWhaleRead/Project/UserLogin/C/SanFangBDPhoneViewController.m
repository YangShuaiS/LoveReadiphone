//
//  SanFangBDPhoneViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/2.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "SanFangBDPhoneViewController.h"
#import "UserLoginTextFileView.h"
#import "UserLoginClickView.h"
@interface SanFangBDPhoneViewController ()

@end

@implementation SanFangBDPhoneViewController{
    UserLoginTextFileView * phone;
    UserLoginTextFileView * yzm;
    UserLoginTextFileView * mima;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addnav];
    WS(ws);
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,49,49) LabelFont:TextFontCu(25) TextAlignment:NSTextAlignmentCenter Text:@"绑定手机号"];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+44+LENGTH(26));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    phone = [[UserLoginTextFileView alloc] initWithStyle:UserLoginTextFilePhoneAndYZM];
    phone.titles = @"请输入手机号";
    phone.vc = self;
    [self.view addSubview:phone];
    [phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(52));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    yzm = [[UserLoginTextFileView alloc] initWithStyle:UserLoginTextFileYZM];
    yzm.titles = @"请输入验证码";
    [self.view addSubview:yzm];
    [yzm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->phone.mas_bottom).with.offset(LENGTH(14));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    mima = [[UserLoginTextFileView alloc] initWithStyle:UserLoginTextFileMM];
    mima.titles = @"设置密码(6-12位数字或字母)";
    [self.view addSubview:mima];
    [mima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->yzm.mas_bottom).with.offset(LENGTH(14));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    UserLoginClickView * NewUser = [[UserLoginClickView alloc] initWithImage:@"" Text:@"完成" Style:UserLoginClickStyleNoml];
    NewUser.userInteractionEnabled = YES;
    [self.view addSubview:NewUser];
    [NewUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->mima.mas_bottom).with.offset(LENGTH(42));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    [NewUser setBlock:^{
        [self pushDL];
    }];
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [self.view addGestureRecognizer:tapGesture2];
    
}
#pragma mark ----------- 返回
- (void)addnav{
    WS(ws);
    UIImageView * back = [UIImageView new];
    back.image = UIIMAGE(@"backhei");
    [self.view addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+14);
        make.left.mas_equalTo(ws.view).with.offset(19);
    }];
    BaseButton * backbutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [backbutton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backbutton];
    [backbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar);
        make.left.mas_equalTo(ws.view);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(50);
    }];
}
- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushDL{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
