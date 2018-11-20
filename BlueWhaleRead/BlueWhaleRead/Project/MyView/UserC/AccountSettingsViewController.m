//
//  AccountSettingsViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "AccountSettingsViewController.h"
#import "AccountSettingsClick.h"

#import "ChangethephoneViewController.h"
@interface AccountSettingsViewController ()

@end

@implementation AccountSettingsViewController{
    AccountSettingsClick * GHPhone;
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
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,49,49) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"当前账号"];
    [topview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topview).with.offset(LENGTH(18));
        make.centerX.mas_equalTo(topview);
    }];
    
    phone = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,49,49) LabelFont:TextFontCu(20) TextAlignment:NSTextAlignmentCenter Text:@""];
    [topview addSubview:phone];
    [phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(12));
        make.centerX.mas_equalTo(topview);
        make.bottom.mas_equalTo(topview).with.offset(-LENGTH(18));
    }];
    if (_phonetext.length == 11) {
        NSRange rangeone = {0,3};
        NSRange rangetwo = {7,4};
        NSString * str = [NSString stringWithFormat:@"%@****%@",[_phonetext substringWithRange:rangeone],[_phonetext substringWithRange:rangetwo]];
        phone.text = str;
    }else{
        phone.text = @"";
    }
    
    GHPhone = [AccountSettingsClick new];
    GHPhone.titlelabel.text = @"更换手机号";
    [self.view addSubview:GHPhone];
    [GHPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topview.mas_bottom).with.offset(LENGTH(27));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(28));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(28));
    }];
    GHPhone.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(GhPhone)];
    [GHPhone addGestureRecognizer:tap];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(denglu:) name:kNotificationGengHuanPhone object:nil];

}
- (void)denglu:(NSNotification *)text{
    _phonetext = text.userInfo[@"phone"];
    if (_phonetext.length == 11) {
        NSRange rangeone = {0,3};
        NSRange rangetwo = {7,4};
        NSString * str = [NSString stringWithFormat:@"%@****%@",[_phonetext substringWithRange:rangeone],[_phonetext substringWithRange:rangetwo]];
        phone.text = str;
    }else{
        phone.text = @"";
    }
}
- (void)GhPhone{
    ChangethephoneViewController * vc = [ChangethephoneViewController new];
    vc.phones = Me.phone;
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
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(43,67,66) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"账号/绑定设置"];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
