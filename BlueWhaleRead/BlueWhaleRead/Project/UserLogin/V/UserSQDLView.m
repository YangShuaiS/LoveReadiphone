//
//  UserSQDLView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/2.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserSQDLView.h"
#import "WXApi.h"
#import "WXApiObject.h"
#import "UserWXRWMDLVIew.h"
@interface UserSQDLView ()
@end
@implementation UserSQDLView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    BaseView * backview = [BaseView new];
    backview.backgroundColor = RGB(4,189,1);
    backview.layer.cornerRadius = LENGTH(25);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    backview.layer.shadowColor = RGB(82, 199, 198).CGColor;
    backview.layer.shadowOffset = CGSizeMake(0,2.5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    backview.layer.shadowRadius = LENGTH(15);
    backview.layer.shadowOpacity = 0.3;
    
    BaseLabel *dl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"微信登录"];
    [backview addSubview:dl];
    [dl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(backview);
    }];
    
    UIImageView * wx = [UIImageView new];
    wx.contentMode = UIViewContentModeScaleAspectFit;
    wx.image = UIIMAGE(@"微信icon");
    [backview addSubview:wx];
    [wx mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(dl);
        make.right.mas_equalTo(dl.mas_left).with.offset(-LENGTH(5));
        make.width.and.height.mas_equalTo(LENGTH(20));
    }];
    backview.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [backview addGestureRecognizer:tapGesture1];

}
- (void)tapGesture1{
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
        [self wxsq:SSDKPlatformSubTypeWechatSession];
    }else{
        UserWXRWMDLVIew * view = [UserWXRWMDLVIew new];
        [[self viewController].view addSubview:view];
        WS(ws);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo([ws viewController].view);
        }];
    }
}

- (void)push:(SSDKUser*)user{
    NSString * nianji  = [[NSUserDefaults standardUserDefaults] objectForKey:kNotificationNianJi];
    if (nianji == nil || [nianji isEqualToString:@""]) {
        nianji = @"1";
    }
    NSMutableDictionary * dic = (NSMutableDictionary *)user.rawData;
    [dic setObject:nianji forKey:@"level"];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString * url = [NSString stringWithFormat:@"%@%@?loginType=2&studentid=%@",ZSFWQ,JK_NEWZC,Me.ssid];
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
                Me = [MeModel mj_objectWithKeyValues:m.studentInfo];
                NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
                NSDictionary * dics = m.studentInfo;
                [usersDic setObject:dics forKey:UserMe];
                [usersDic writeToFile:filePatch atomically:YES];
                [[self viewController] dismissViewControllerAnimated:YES completion:^{
                    
                }];
            }
        } else {
            
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

- (void)qxwxsq:(SSDKPlatformType)platformType{
    //取消平台授权
    [ShareSDK cancelAuthorize:platformType result:^(NSError *error) {
    }];
}


@end
