//
//  UserLoginUJMMViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserLoginUJMMViewController.h"
#import "UserLoginTextFileView.h"
#import "UserLoginClickView.h"
#import "UserLoginWJMMTwoViewController.h"
@interface UserLoginUJMMViewController (){
    UserLoginTextFileView * phone;
    UserLoginTextFileView * yzm;
    BaseLabel * emal;
}

@end

@implementation UserLoginUJMMViewController

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
    
    UserLoginClickView * NewUser = [[UserLoginClickView alloc] initWithImage:@"" Text:@"下一步" Style:UserLoginClickStyleNoml];
    NewUser.userInteractionEnabled = YES;
    [self.view addSubview:NewUser];
    [NewUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->yzm.mas_bottom).with.offset(LENGTH(42));
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

- (void)emalclick{
    
    NSString *urlStr = [NSString stringWithFormat:@"mailto://services@bowanjuan.com?subject=%@&body=%@",@"",@""];
    NSURL *url = [NSURL URLWithString:[urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    [[UIApplication sharedApplication] openURL:url];
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

- (void)next{
    
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
                    UserLoginWJMMTwoViewController * vc = [UserLoginWJMMTwoViewController new];
                    vc.phone = self->phone.textField.text;
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



// 使label能够成为响应事件，为了能接收到事件（能成为第一响应者）
//- (BOOL)canBecomeFirstResponder{
//    return YES;
//}
//// 可以控制响应的方法
//- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
//    return (action == @selector(copy:));
//}
////针对响应方法的实现，最主要的复制的两句代码
//- (void)copy:(id)sender{
//
//    //UIPasteboard：该类支持写入和读取数据，类似剪贴板
//    UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
//    pasteBoard.string = emal.text;
//}
// 处理长按事件
//- (void)longPre:(UILongPressGestureRecognizer *)recognizer{
//    [self becomeFirstResponder]; // 用于UIMenuController显示，缺一不可
//
//    //UIMenuController：可以通过这个类实现点击内容，或者长按内容时展示出复制等选择的项，每个选项都是一个UIMenuItem对象
//    UIMenuItem *copyLink = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copy:)];
//    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:copyLink, nil]];
//    [[UIMenuController sharedMenuController] setTargetRect:emal.frame inView:emal.superview];
//    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)tapGesture2{
    [yzm returnKeyboard];
    [phone returnKeyboard];
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
