//
//  ChangethephoneViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ChangethephoneViewController.h"
#import "UserLoginClickView.h"
#import "GHPhonePasswordViewController.h"
#import "GNPhoneYZMViewController.h"
@interface ChangethephoneViewController ()

@end

@implementation ChangethephoneViewController{
    BaseLabel * emal;
    BaseLabel * phone;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addnav];
    
    
    WS(ws);
    BaseView * topview = [BaseView new];
    topview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topview];
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(LENGTH(18)+StatusBar+44);
        make.left.mas_equalTo(LENGTH(25));
        make.right.mas_equalTo(-LENGTH(25));
        //        make.height.mas_equalTo(LENGTH(92));
    }];
    
    topview.layer.shadowColor = RGB(26, 26, 26).CGColor;
    topview.layer.shadowOffset = CGSizeMake(0,3);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    topview.layer.shadowRadius = LENGTH(20);
    topview.layer.shadowOpacity = 0.14;
    
    UIImageView * phoneimage = [UIImageView new];
    phoneimage.image = UIIMAGE(@"组 261");
    [topview addSubview:phoneimage];
    [phoneimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(LENGTH(20));
        make.centerX.mas_equalTo(topview);
        make.width.and.height.mas_equalTo(LENGTH(76));
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(155,177,176) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"当前账号"];
    [topview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneimage.mas_bottom).with.offset(LENGTH(8));
        make.centerX.mas_equalTo(topview);
    }];
    
    phone = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(82,199,198) LabelFont:TextFontCu(25) TextAlignment:NSTextAlignmentCenter Text:@""];
    [topview addSubview:phone];
    [phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(8));
        make.centerX.mas_equalTo(topview);
        make.bottom.mas_equalTo(topview).with.offset(-LENGTH(26));
    }];
    if (_phones.length == 11) {
        NSRange rangeone = {0,3};
        NSRange rangetwo = {7,4};
        NSString * str = [NSString stringWithFormat:@"%@****%@",[_phones substringWithRange:rangeone],[_phones substringWithRange:rangetwo]];
        phone.text = str;
    }else{
        
    }


    
    BaseLabel * yiwen = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,75,74) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentLeft Text:@"·更换手机号不会影响您之前账户信息\n·如有任何疑问，请与客服联系"];
    yiwen.numberOfLines = 2;
    [self.view addSubview:yiwen];
    [yiwen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topview.mas_bottom).with.offset(LENGTH(28));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    emal = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(82,199,198) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentCenter Text:@"services@bowanjuan.com"];
    [self.view addSubview:emal];
    [emal mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(yiwen.mas_bottom).with.offset(LENGTH(2));
        make.left.mas_equalTo(yiwen.mas_left).with.offset(LENGTH(2));
    }];
    emal.userInteractionEnabled = YES;
    UITapGestureRecognizer * emalclick = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(emalclick)];
    [emal addGestureRecognizer:emalclick];
    
    
    UserLoginClickView * NewUser = [[UserLoginClickView alloc] initWithImage:@"" Text:@"通过密码验证" Style:UserLoginClickStyleNoml];
    NewUser.userInteractionEnabled = YES;
    [self.view addSubview:NewUser];
    [NewUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->emal.mas_bottom).with.offset(LENGTH(64));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    [NewUser setBlock:^{
        [self yuanmima];
    }];
    
    UserLoginClickView * DL = [[UserLoginClickView alloc] initWithImage:@"" Text:@"通过短信验证码验证" Style:UserLoginClickStyleNoml];
    [DL whitherBacler];
    DL.userInteractionEnabled = YES;
    [self.view addSubview:DL];
    [DL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NewUser.mas_bottom).with.offset(LENGTH(20));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    [DL setBlock:^{
        [self yzm];
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(denglu:) name:kNotificationGengHuanPhone object:nil];

}
- (void)denglu:(NSNotification *)text{
    _phones = text.userInfo[@"phone"];
    if (_phones.length == 11) {
        NSRange rangeone = {0,3};
        NSRange rangetwo = {7,4};
        NSString * str = [NSString stringWithFormat:@"%@****%@",[_phones substringWithRange:rangeone],[_phones substringWithRange:rangetwo]];
        phone.text = str;
    }else{
        
    }
}
- (void)yuanmima{
    GHPhonePasswordViewController * vc = [GHPhonePasswordViewController new];
    vc.phone = _phones;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)yzm{
    GNPhoneYZMViewController * vc = [GNPhoneYZMViewController new];
    vc.phongs = _phones;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark ----------- 返回
- (void)addnav{
    WS(ws);
    BaseView * backview = [BaseView new];
    backview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar);
        make.left.and.right.mas_equalTo(ws.view);
        make.height.mas_equalTo(44);
    }];
    
    UIImageView * back = [UIImageView new];
    back.image = UIIMAGE(@"backhei");
    [backview addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(backview);
        make.left.mas_equalTo(backview).with.offset(19);
    }];
    
    BaseButton * backbutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [backbutton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [backview addSubview:backbutton];
    [backbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backview);
        make.left.mas_equalTo(backview);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(50);
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(43,67,66) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"更换手机号"];
    [backview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(backview);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(150);
    }];
}
- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)emalclick{
    
    NSString *urlStr = [NSString stringWithFormat:@"mailto://services@bowanjuan.com?subject=%@&body=%@",@"",@""];
    NSURL *url = [NSURL URLWithString:[urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    [[UIApplication sharedApplication] openURL:url];
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
