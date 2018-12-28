//
//  UserSQDLView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/2.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserSQDLView.h"
#import "SanFangBDPhoneViewController.h"
#import "WXApi.h"
#import "WXApiObject.h"
#import "UserWXRWMDLVIew.h"
#import "UserLoginPerfectViewController.h"
@interface UserSQDLView ()
@end
@implementation UserSQDLView{
    NSMutableArray * viewarray;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self qxwxsq:SSDKPlatformSubTypeWechatSession];
        [self qxwxsq:SSDKPlatformSubTypeQQFriend];
        [self addview];
    }
    return self;
}
- (void)addview{
    viewarray = [NSMutableArray array];
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
        FLAnimatedImageView * wxview = [FLAnimatedImageView new];
        wxview.image = UIIMAGE(@"组 291");
        wxview.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:wxview];
        [viewarray addObject:wxview];
        wxview.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wxsq)];
        [wxview addGestureRecognizer:tap];
    }else{
        
    }
    
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"mqqapi://"]]) {
        FLAnimatedImageView * qqview = [FLAnimatedImageView new];
        qqview.image = UIIMAGE(@"组 276");
        qqview.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:qqview];
        [viewarray addObject:qqview];
        qqview.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(qqsq)];
        [qqview addGestureRecognizer:tap];
    }else{
        
    }
    
    if (viewarray.count > 0) {
        WS(ws);
        BaseLabel * lab = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(155,177,176) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"使用第三方登录"];
        [self addSubview:lab];
        
        BaseView * leftxian = [BaseView new];
        leftxian.backgroundColor = RGB(155,177,176);
        [self addSubview:leftxian];
        
        BaseView * rightxian = [BaseView new];
        rightxian.backgroundColor = RGB(155,177,176);
        [self addSubview:rightxian];
        
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws);
            make.left.and.right.mas_equalTo(ws);
            make.centerX.mas_equalTo(ws);
        }];
        if (viewarray.count == 1) {
            FLAnimatedImageView * oneview  = viewarray[0];
            [oneview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(ws);
                make.top.mas_equalTo(lab.mas_bottom).with.offset(LENGTH(16));
                make.bottom.mas_equalTo(ws);
                make.width.and.height.mas_equalTo(LENGTH(30));
            }];
            
            [leftxian mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(oneview);
                make.right.mas_equalTo(oneview.mas_left).with.offset(-LENGTH(18));
                make.width.mas_equalTo(LENGTH(90));
                make.height.mas_equalTo(1);
            }];
            [rightxian mas_makeConstraints:^(MASConstraintMaker *make) { 
                make.centerY.mas_equalTo(oneview);
                make.left.mas_equalTo(oneview.mas_right).with.offset(LENGTH(18));
                make.width.mas_equalTo(LENGTH(90));
                make.height.mas_equalTo(1);
            }];
        }else if (viewarray.count == 2){
            FLAnimatedImageView * oneview  = viewarray[0];
            [oneview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(ws).with.offset(-LENGTH(23));
                make.top.mas_equalTo(lab.mas_bottom).with.offset(LENGTH(16));
                make.bottom.mas_equalTo(ws);
                make.width.and.height.mas_equalTo(LENGTH(30));
            }];
            FLAnimatedImageView * twoview  = viewarray[1];
            [twoview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(ws).with.offset(LENGTH(23));
                make.top.mas_equalTo(lab.mas_bottom).with.offset(LENGTH(16));
                make.width.and.height.mas_equalTo(LENGTH(30));
            }];
            
            [leftxian mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(oneview);
                make.right.mas_equalTo(oneview.mas_left).with.offset(-LENGTH(18));
                make.width.mas_equalTo(LENGTH(36));
                make.height.mas_equalTo(1);
            }];
            [rightxian mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(twoview);
                make.left.mas_equalTo(twoview.mas_right).with.offset(LENGTH(18));
                make.width.mas_equalTo(LENGTH(36));
                make.height.mas_equalTo(1);
            }];

        }
    }
}
- (void)clickyes{
    for (FLAnimatedImageView * view in viewarray) {
        view.userInteractionEnabled = YES;
    }
}
- (void)clickyno{
    for (FLAnimatedImageView * view in viewarray) {
        view.userInteractionEnabled = YES;
    }
}
- (void)wxsq{
    [self clickyno];
    [self wxsq:SSDKPlatformSubTypeWechatSession];
}

- (void)qqsq{
    [self clickyno];
//    [self wxsq:SSDKPlatformSubTypeQQFriend];
    UserWXRWMDLVIew * view = [UserWXRWMDLVIew new];
    [self.window addSubview:view];
    WS(ws);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.window);
    }];
}

- (void)push:(SSDKUser*)user{
    [self clickyes];
    NSDictionary * dic = user.rawData;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_WXDL];
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
            }else if([m.code isEqual:@201]){
                UserLoginPerfectViewController * vc = [UserLoginPerfectViewController new];
                vc.dict = dic;
                [[self viewController].navigationController pushViewController:vc animated:YES];
            }
            NSLog(@"123");
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
