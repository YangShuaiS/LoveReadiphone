//
//  GNPhoneYZMViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GNPhoneYZMViewController.h"
#import "UserLoginTextFileView.h"
#import "UserLoginClickView.h"
#import "GHPhoenTwoViewController.h"
@interface GNPhoneYZMViewController ()

@end

@implementation GNPhoneYZMViewController {
    UserLoginTextFileView * phone;
    UserLoginTextFileView * yzm;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addnav];
    
    WS(ws);
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,49,49) LabelFont:TextFontCu(25) TextAlignment:NSTextAlignmentCenter Text:@"输入验证码"];
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
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(30));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(50));
    }];
    phone.textField.text = _phongs;
    
    yzm = [[UserLoginTextFileView alloc] initWithStyle:UserLoginTextFileYZM];
    yzm.titles = @"请输入验证码";
    [self.view addSubview:yzm];
    [yzm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->phone.mas_bottom).with.offset(LENGTH(14));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    UserLoginClickView * NewUser = [[UserLoginClickView alloc] initWithImage:@"" Text:@"下一步" Style:UserLoginClickStyleNoml];
    NewUser.userInteractionEnabled = YES;
    [self.view addSubview:NewUser];
    [NewUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->yzm.mas_bottom).with.offset(LENGTH(56));
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
    [phone.textField resignFirstResponder];
    [yzm.textField resignFirstResponder];
}
- (void)xyb{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_JIAOYANYANZHENGMA];
    NSDictionary * dic = @{@"phone":phone.textField.text,@"code":yzm.textField.text};
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
    if ([BaseObject valiMobile:phone.textField.text]==NO) {
        mb.label.text = @"手机号格式错误";
        [mb hideAnimated:NO afterDelay:1];
    }else{
        [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
            if (responseObject) {
                MyDeModel * model = [MyDeModel mj_objectWithKeyValues:responseObject];
                if ([model.code isEqual:@200]) {
                    GHPhoenTwoViewController * vc = [GHPhoenTwoViewController new];
                    vc.phone = self->_phongs;
                    [self.navigationController pushViewController:vc animated:YES];
                }else if ([model.code isEqual:@Notloggedin]){
                    [self UpDengLu];
                }
                mb.label.text = model.message;
                [mb hideAnimated:NO afterDelay:1];
            }else{
                mb.label.text = @"网络请求失败";
                [mb hideAnimated:NO afterDelay:1];
            }
        }];
    }

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

@end
