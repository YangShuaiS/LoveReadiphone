//
//  UserYZMDLVViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserYZMDLVViewController.h"
#import "CodeInputView.h"
@interface UserYZMDLVViewController ()

@end

@implementation UserYZMDLVViewController{
    BaseLabel * yzm;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addnav];
    [self fasongyzm];
    WS(ws);
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,49,49) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"输入验证码"];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(NavHeight+LENGTH(50));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    BaseLabel * subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(144,160,160) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:[NSString stringWithFormat:@"已发送6位验证码至+86%@",_phone]];
    [self.view addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(18));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    CodeInputView *codeView = [[CodeInputView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, LENGTH(40)) inputType:6 selectCodeBlock:^(NSString * code) {
        if (code.length == 6) {
            [self dl:code];
        }
    }];
    codeView.userInteractionEnabled = YES;
    [self.view addSubview:codeView];
    [codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(subtitle.mas_bottom).with.offset(LENGTH(10));
        make.left.and.right.mas_equalTo(ws.view);
        make.height.mas_equalTo(LENGTH(40));
    }];
    
    yzm = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(167,167,167) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"已发送验证码"];
    yzm.backgroundColor = RGB(246,247,250);
    [self.view addSubview:yzm];
    yzm.layer.masksToBounds = YES;
    yzm.layer.cornerRadius = LENGTH(24);
    [yzm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(subtitle.mas_bottom).with.offset(LENGTH(110));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(48));
    }];
    yzm.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fasongyzm)];
    //将手势添加到需要相应的view中去
    [yzm addGestureRecognizer:tapGesture];
}
- (void)dl:(NSString *)code{
    if ([_laiyuan isEqualToString:@"phone"]) {
        [self genggaiphone:code];
    }else{
        [self denglu:code];
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)denglu:(NSString *)code{
//    JK_NEWZC
    NSString * nianji  = [[NSUserDefaults standardUserDefaults] objectForKey:kNotificationNianJi];
    if (nianji == nil || [nianji isEqualToString:@""]) {
        nianji = @"1";
    }
    NSString * url = [NSString stringWithFormat:@"%@%@?loginType=1&studentid=%@",ZSFWQ,JK_NEWZC,Me.ssid];
    NSDictionary * dic = @{@"phone":_phone,@"code":code,@"level":nianji};
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
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }];
}

- (void)genggaiphone:(NSString *)code{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_JIAOYANYANZHENGMA];
    NSDictionary * dic = @{@"phone":_phone,@"code":code};
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
    if ([BaseObject valiMobile:_phone]==NO) {
        mb.label.text = @"手机号格式错误";
        [mb hideAnimated:NO afterDelay:1];
    }else{
        [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
            if (responseObject) {
                MyDeModel * model = [MyDeModel mj_objectWithKeyValues:responseObject];
                if ([model.code isEqual:@200]) {
                    [self xiugaiphone];
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

- (void)xiugaiphone{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_GENGGAISHOUJIHAO];
    NSDictionary * dic = @{@"newPhone":_phone,@"studentid":Me.ssid};
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
                [self.navigationController popToRootViewControllerAnimated:YES];
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
- (void)fasongyzm{
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在发送验证码...";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo([[[UIApplication sharedApplication] delegate] window]);
    }];
    
    NSString * str;
    if ([_laiyuan isEqualToString:@"phone"]) {
        str = @"updatePhone";
    }else{
        str = @"login";
    }
    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FASONGYANZHENGMA];
    NSDictionary * dic = @{@"phone":_phone,@"from":str};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MyDeModel * model = [MyDeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData];
            }else{
                [self cxfs];
            }
            mb.label.text = model.message;
            [mb hideAnimated:NO afterDelay:1];
        }else{
            [self cxfs];
            mb.label.text = @"发送失败";
            [mb hideAnimated:NO afterDelay:1];
        }
    }];
}
- (void)UpData{
    yzm.userInteractionEnabled = NO;
    __block NSInteger time = 59; //倒计时时间
    yzm.textColor = RGB(167,167,167);
    yzm.backgroundColor = RGB(246,247,250);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮的样式
                [self cxfs];
            });
        }else{
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮的样式
                self->yzm.text = [NSString stringWithFormat:@"%.2ds后重新发送", seconds];
                self->yzm.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}
- (void)cxfs{
    yzm.userInteractionEnabled = YES;
    yzm.backgroundColor = RGB(82,199,198);
    yzm.textColor = RGB(255, 255, 255);
    yzm.text = @"重新发送";
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
        make.height.mas_equalTo(24);
        make.width.mas_equalTo(back.image.size.width);
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
