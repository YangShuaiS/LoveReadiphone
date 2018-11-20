//
//  GHPhonePasswordViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GHPhonePasswordViewController.h"
#import "UserLoginTextFileView.h"
#import "UserLoginClickView.h"
#import "GHPhoenTwoViewController.h"
#import "UserLoginUJMMViewController.h"
@interface GHPhonePasswordViewController ()

@end

@implementation GHPhonePasswordViewController{
    UserLoginTextFileView * wjmm;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addnav];
    WS(ws);
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,49,49) LabelFont:TextFontCu(25) TextAlignment:NSTextAlignmentCenter Text:@"输入现有密码"];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+44+LENGTH(26));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    wjmm = [[UserLoginTextFileView alloc] initWithStyle:UserLoginTextFileWjMM];
    wjmm.titles = @"请输入密码";
    wjmm.nav = self.navigationController;
    [self.view addSubview:wjmm];
    [wjmm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(30));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    BaseLabel * wj = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(155,177,176) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentRight Text:@"忘记密码？"];
    [self.view addSubview:wj];
    [wj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->wjmm.mas_bottom);
        make.right.mas_equalTo(self->wjmm).with.offset(0);
        make.height.mas_equalTo(LENGTH(50));
        make.width.mas_equalTo(LENGTH(100));
    }];
    wj.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(puswjmm)];
    //将手势添加到需要相应的view中去
    [wj addGestureRecognizer:tapGesture4];
    
    UserLoginClickView * NewUser = [[UserLoginClickView alloc] initWithImage:@"" Text:@"下一步" Style:UserLoginClickStyleNoml];
    NewUser.userInteractionEnabled = YES;
    [self.view addSubview:NewUser];
    [NewUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wj.mas_bottom).with.offset(LENGTH(42));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    [NewUser setBlock:^{
        [self xyb];
    }];
    
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [self.view addGestureRecognizer:tapGesture2];
}
- (void)tapGesture2{
    [wjmm.textField resignFirstResponder];
    
}
- (void)xyb{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_GHGHMM];

    NSDictionary * dic = @{@"studentid":Me.ssid,@"password":wjmm.textField.text};
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.view.window addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view.window);
    }];
        [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
            if (responseObject) {
                MyDeModel * model = [MyDeModel mj_objectWithKeyValues:responseObject];
                if ([model.code isEqual:@200]) {
                    GHPhoenTwoViewController * vc = [GHPhoenTwoViewController new];
                    vc.phone = self->_phone;
                    [self.navigationController pushViewController:vc animated:YES];
                    mb.label.text = model.message;
                    [mb hideAnimated:NO afterDelay:1];
                }else{
                    mb.label.text = model.message;
                    [mb hideAnimated:NO afterDelay:1];
                }
            }else{
                mb.label.text = @"网络请求失败";
                [mb hideAnimated:NO afterDelay:1];
            }
        }];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)puswjmm{
    UserLoginUJMMViewController * vc = [UserLoginUJMMViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
