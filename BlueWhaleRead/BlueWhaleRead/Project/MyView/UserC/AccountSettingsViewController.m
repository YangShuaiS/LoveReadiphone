//
//  AccountSettingsViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "AccountSettingsViewController.h"
#import "AccountSettingsClick.h"

#import "GHPhoneViewController.h"

#import "WXApi.h"
#import "WXApiObject.h"
#import "UserWXRWMDLVIew.h"
@interface AccountSettingsViewController ()

@end

@implementation AccountSettingsViewController{
    AccountSettingsClick * GHPhone;
    AccountSettingsClick * bangdingweixin;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addnav];
    NSString * phonestr;
    if (Me.phone.length == 11) {
        phonestr = Me.phone;
        NSRange rangeone = {0,3};
        NSRange rangetwo = {7,4};
        NSString * str = [NSString stringWithFormat:@"%@****%@",[phonestr substringWithRange:rangeone],[phonestr substringWithRange:rangetwo]];
        phonestr = str;
    }else{
        phonestr = @"";
    }
    WS(ws);
    GHPhone = [AccountSettingsClick new];
    GHPhone.imageview.image = UIIMAGE(@"组 350");
    GHPhone.titlelabel.text = @"更换手机号";
    GHPhone.subtitlelabel.text = phonestr;
    [self.view addSubview:GHPhone];
    [GHPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(NavHeight);
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(28));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(28));
    }];
    GHPhone.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(GhPhone)];
    [GHPhone addGestureRecognizer:tap];
    
    bangdingweixin = [AccountSettingsClick new];
    bangdingweixin.imageview.image = UIIMAGE(@"组 345");
    bangdingweixin.titlelabel.text = @"微信登录";
    if ([Me.openid isEqualToString:@""]) {
        [bangdingweixin weibangding];
    }else{
        [bangdingweixin bangding];
    }
    [self.view addSubview:bangdingweixin];
    [bangdingweixin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->GHPhone.mas_bottom);
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(28));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(28));
    }];
    bangdingweixin.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bangdingweixin)];
    [bangdingweixin addGestureRecognizer:tap1];
    BaseLabel * label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(155,177,176) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"绑定后可使用微信快捷登录本账号"];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->bangdingweixin.mas_bottom).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(30));
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(denglu:) name:kNotificationGengHuanPhone object:nil];

}
- (void)denglu:(NSNotification *)text{
    NSString * phonestr = text.userInfo[@"phone"];
    if (_phonetext.length == 11) {
        NSRange rangeone = {0,3};
        NSRange rangetwo = {7,4};
        NSString * str = [NSString stringWithFormat:@"%@****%@",[_phonetext substringWithRange:rangeone],[_phonetext substringWithRange:rangetwo]];
        phonestr = str;
    }else{
        phonestr = @"";
    }
}
- (void)GhPhone{
    GHPhoneViewController * vc = [GHPhoneViewController new];
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


- (void)bangdingweixin{
    if ([Me.openid isEqualToString:@""]) {
        [self bangding];
    }else{
        [self jiebang];
    }

}

- (void)bangding{
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
        [self wxsq:SSDKPlatformSubTypeWechatSession];
    }else{
        UserWXRWMDLVIew * view = [UserWXRWMDLVIew new];
        [self.view.window addSubview:view];
        WS(ws);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.view.window);
        }];
    }
}
- (void)push:(
              SSDKUser*)user{
    [[MBProgressHUDYS SharedMBProgressHUDYS] addview:self.view.window];
    [[MBProgressHUDYS SharedMBProgressHUDYS] shoumessage:@"正在绑定微信"];
    NSMutableDictionary * dic = (NSMutableDictionary *)user.rawData;
    NSString * openid = dic[@"openid"];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString * url = [NSString stringWithFormat:@"%@%@?studentid=%@",ZSFWQ,JK_BDWX,Me.ssid];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:nil error:nil];
    request.timeoutInterval= 30;
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)jsonData.length] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:jsonData];
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                 @"text/html",
                                                 @"text/json",
                                                 @"text/javascript",
                                                 @"text/plain",
                                                 nil];
    manager.responseSerializer = responseSerializer;
    [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:dict];
            if ([m.code isEqual:@200]) {
                NSString *filePatch = [BaseObject AddPathName:UserMe];
                NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
                NSMutableDictionary *dics = dataDictionary[UserMe];
                NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
                dics[@"openid"] = openid;
                [usersDic setObject:dics forKey:UserMe];
                [usersDic writeToFile:filePatch atomically:YES];
                Me = [MeModel mj_objectWithKeyValues:dics];

                [self.navigationController popViewControllerAnimated:YES];
            }
            [[MBProgressHUDYS SharedMBProgressHUDYS] shoumessage:m.message];
            [[MBProgressHUDYS SharedMBProgressHUDYS] hideAnimated:NO afterDelay:1];
        } else {
            [[MBProgressHUDYS SharedMBProgressHUDYS] shoumessage:@"失败"];
            [[MBProgressHUDYS SharedMBProgressHUDYS] hideAnimated:NO afterDelay:1];
        }
    }] resume];
}
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


- (void)wxsq:(SSDKPlatformType)platformType{
#pragma mark - 调用获取用户授权信息
    [ShareSDK getUserInfo:platformType
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
               switch (state) {
                   case SSDKResponseStateSuccess:
                   {
                       [self push:user];
                       break;
                   }
                   case SSDKResponseStateFail:
                   {
                       UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"授权失败"
                                                                           message:[NSString stringWithFormat:@"%@",error]
                                                                          delegate:nil
                                                                 cancelButtonTitle:@"确认"
                                                                 otherButtonTitles: nil];
                       [alertView show];
                       break;
                   }
                       break;
                   case SSDKResponseStateCancel:
                   {
                       
                       UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"授权取消"
                                                                           message:nil
                                                                          delegate:nil
                                                                 cancelButtonTitle:@"确认"
                                                                 otherButtonTitles: nil];
                       [alertView show];
                       break;
                   }
                   default:
                       break;
               }
           }];
    
}

- (void)jiebang{
    [[MBProgressHUDYS SharedMBProgressHUDYS] addview:self.view.window];
    [[MBProgressHUDYS SharedMBProgressHUDYS] shoumessage:@"正在解绑绑微信"];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_JBWX];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                NSString *filePatch = [BaseObject AddPathName:UserMe];
                NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
                NSMutableDictionary *dics = dataDictionary[UserMe];
                NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
                dics[@"openid"] = @"";
                [usersDic setObject:dics forKey:UserMe];
                [usersDic writeToFile:filePatch atomically:YES];
                Me = [MeModel mj_objectWithKeyValues:dics];
                [self.navigationController popViewControllerAnimated:YES];
            }
            [[MBProgressHUDYS SharedMBProgressHUDYS] shoumessage:m.message];
            [[MBProgressHUDYS SharedMBProgressHUDYS] hideAnimated:NO afterDelay:1];
        }else{
            [[MBProgressHUDYS SharedMBProgressHUDYS] shoumessage:@"失败"];
            [[MBProgressHUDYS SharedMBProgressHUDYS] hideAnimated:NO afterDelay:1];
        }
    }];

    
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
