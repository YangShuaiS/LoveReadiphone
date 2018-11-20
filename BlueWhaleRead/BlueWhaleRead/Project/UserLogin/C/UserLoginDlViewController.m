//
//  UserLoginDlViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserLoginDlViewController.h"
#import "UserLoginTextFileView.h"
#import "UserLoginClickView.h"
#import "UserLoginUJMMViewController.h"
#import "UserLoginUJMMViewController.h"

#import "UserSQDLView.h"

@interface UserLoginDlViewController ()

@end

@implementation UserLoginDlViewController{
    UserLoginTextFileView * shoujihao;
    UserLoginTextFileView * wjmm;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addnav];
    
    WS(ws);
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,49,49) LabelFont:TextFontCu(25) TextAlignment:NSTextAlignmentCenter Text:@"账号登录"];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+44+LENGTH(26));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    shoujihao = [[UserLoginTextFileView alloc] initWithStyle:UserLoginTextFilePhone];
    shoujihao.titles = @"请输入手机号/学校账号";
    [self.view addSubview:shoujihao];
    [shoujihao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(52));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    wjmm = [[UserLoginTextFileView alloc] initWithStyle:UserLoginTextFileWjMM];
    wjmm.titles = @"请输入密码";
    wjmm.nav = self.navigationController;
    [self.view addSubview:wjmm];
    [wjmm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->shoujihao.mas_bottom).with.offset(LENGTH(14));
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
    
    UserLoginClickView * NewUser = [[UserLoginClickView alloc] initWithImage:@"" Text:@"登录" Style:UserLoginClickStyleNoml];
    NewUser.userInteractionEnabled = YES;
    [self.view addSubview:NewUser];
    [NewUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wj.mas_bottom).with.offset(LENGTH(42));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    [NewUser setBlock:^{
        [self dl];
    }];
    
//    UserSQDLView * sqdl = [UserSQDLView new];
//    sqdl.nav = self.navigationController;
//    [self.view addSubview:sqdl];
//    [sqdl mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(NewUser.mas_bottom).with.offset(LENGTH(80));
//        make.left.and.right.mas_equalTo(ws.view);
//    }];
    
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
- (void)dl{
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在登录...";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.view.window addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view.window);
    }];
    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_DENGLU];
    NSDictionary * dic = @{@"code":shoujihao.textField.text,@"password":wjmm.textField.text};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                NSString *filePatch = [BaseObject AddPathName:UserMe];
                Me = [MeModel mj_objectWithKeyValues:m.studentInfo];
                NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
                NSDictionary * dics = m.studentInfo;
                [usersDic setObject:dics forKey:UserMe];
                [usersDic writeToFile:filePatch atomically:YES];
                
                [mb hideAnimated:NO];
                NSNotification *notification =[NSNotification notificationWithName:kNotificationDenglu object:nil userInfo:nil];
                [[NSNotificationCenter defaultCenter] postNotification:notification];
            }else{
                mb.label.text = m.message;
                [mb hideAnimated:NO afterDelay:1];
            }
            
        }else{
            mb.label.text = @"网络请求失败";
            [mb hideAnimated:NO afterDelay:1];
        }
    }];
}
- (void)tapGesture2{
    [shoujihao.textField resignFirstResponder];
    [wjmm.textField resignFirstResponder];

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
