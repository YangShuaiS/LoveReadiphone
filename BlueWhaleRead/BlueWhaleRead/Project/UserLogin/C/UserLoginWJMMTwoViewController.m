//
//  UserLoginWJMMTwoViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserLoginWJMMTwoViewController.h"
#import "UserLoginTextFileView.h"
#import "UserLoginClickView.h"
@interface UserLoginWJMMTwoViewController ()

@end

@implementation UserLoginWJMMTwoViewController{
    UserLoginTextFileView * mm;
    BaseLabel * emal;
    MBProgressHUD * mb;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addnav];
    WS(ws);
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,49,49) LabelFont:TextFontCu(25) TextAlignment:NSTextAlignmentCenter Text:@"找回密码"];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+44+LENGTH(26));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    mm = [[UserLoginTextFileView alloc] initWithStyle:UserLoginTextFileMM];
    mm.titles = @"设置新密码(6-12位数字或字母)";
    [self.view addSubview:mm];
    [mm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(52));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    UserLoginClickView * NewUser = [[UserLoginClickView alloc] initWithImage:@"" Text:@"确定" Style:UserLoginClickStyleNoml];
    NewUser.userInteractionEnabled = YES;
    [self.view addSubview:NewUser];
    [NewUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->mm.mas_bottom).with.offset(LENGTH(128));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    [NewUser setBlock:^{
        [self next];
    }];
    
    emal = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(82,199,198) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentCenter Text:@"services@bowanjuan.com"];
    [self.view addSubview:emal];
    [emal mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws.view).with.offset(-LENGTH(66));
        make.centerX.mas_equalTo(ws.view);
        //        make.height.mas_equalTo(30);
        //        make.width.mas_equalTo(WIDTH);
    }];
    emal.userInteractionEnabled = YES;
    UITapGestureRecognizer * emalclick = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(emalclick)];
    [emal addGestureRecognizer:emalclick];
    
    
    BaseLabel * yiwen = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(96,96,96) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentCenter Text:@"如有任何疑问，请与客服联系"];
    [self.view addSubview:yiwen];
    [yiwen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self->emal.mas_top).with.offset(-LENGTH(6));
        make.centerX.mas_equalTo(ws.view);
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
- (void)next{
    WS(ws);
    mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"";
    [mb showAnimated:YES];
    //        mb.removeFromSuperViewOnHide = NO;
    [self.view.window addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view.window);
    }];
    if (mm.textField.text.length>=6&&mm.textField.text.length<=12) {
        [self LoadData];
    }else{
        mb.mode = MBProgressHUDModeCustomView;
        mb.label.text = @"新密码长度不对";
        [mb hideAnimated:YES afterDelay:2];
    }

}

- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_WJMM];
    NSDictionary * dic = @{@"password":mm.textField.text,@"phone":_phone};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MyDeModel *model = [MyDeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                self->mb.mode = MBProgressHUDModeCustomView;
                self->mb.label.text = model.message;
                [self->mb hideAnimated:YES afterDelay:2];
                [self.navigationController popToRootViewControllerAnimated:YES];
            }else{
                self->mb.mode = MBProgressHUDModeCustomView;
                self->mb.label.text = model.message;
                [self->mb hideAnimated:YES afterDelay:2];
            }
        }else{
            self->mb.mode = MBProgressHUDModeCustomView;
            self->mb.label.text = @"网络连接失败";
            [self->mb hideAnimated:YES afterDelay:2];
        }
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


- (void)tapGesture2{
    [mm returnKeyboard];
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
