//
//  UserWXRWMDLVIew.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserWXRWMDLVIew.h"
#import "WechatAuthSDK.h"
#import "NSString+Coding.h"

static NSString *kAccessToken = @"access_token";
static NSString *KAccessExpires_in = @"KAccessExpires_in";
static NSString *kTicket = @"kTicket";
static NSString *KTicketExpires_in = @"KTicketExpires_in";

NSString *const kWXAppID = @"wx5b092cd426a86253";
NSString *const kWXAppSecret = @"b75713455aff3c9c7fd54405e0a7523b";

@interface UserWXRWMDLVIew ()<WechatAuthAPIDelegate>
@property (nonatomic, strong) WechatAuthSDK *authSDK;

@end

@implementation UserWXRWMDLVIew{
    UIImageView * imageview;
    BaseLabel * label;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    self.backgroundColor = RGBA(0, 0, 0, 0.8);
    self.authSDK = [[WechatAuthSDK alloc] init];
    self.authSDK.delegate = self;
    [self getAccessToken:^(NSString *token) {
        NSLog(@"%@",token);
        [self loadSDKTicket:token];
    }];
    WS(ws);
    imageview = [UIImageView new];
    imageview.backgroundColor = [UIColor whiteColor];
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
        make.width.and.height.mas_equalTo(LENGTH(200));
    }];
    
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"微信扫码登录\n博万卷"];
    label.numberOfLines = 0;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.mas_centerX);
        make.top.mas_equalTo(self->imageview.mas_bottom).with.offset(LENGTH(5));
    }];

}

- (void)getAccessToken:(void(^)(NSString *token))completHandle {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault synchronize];
    NSString *token = [userDefault objectForKey:kAccessToken];
    if (!token.length) {
        [self getAccessTokenFromNet:completHandle];
    }else {
        NSTimeInterval expires_in = [[userDefault objectForKey:KAccessExpires_in] floatValue];
        NSTimeInterval curTimeInterval = [NSDate date].timeIntervalSince1970;
        NSTimeInterval time = curTimeInterval - expires_in;
        if (time > 7100) {
            [self getAccessTokenFromNet:completHandle];
        }else {
            completHandle(token);
        }
    }
    
}

- (void)getAccessTokenFromNet:(void(^)(NSString *token))completHandle {
    NSDictionary *dict = @{
                           @"grant_type":@"client_credential",
                           @"appid":kWXAppID,
                           @"secret":kWXAppSecret
                           };
    [[BaseAppRequestManager manager] getNormaldataURL:@"https://api.weixin.qq.com/cgi-bin/token" dic:dict andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            completHandle(responseObject[kAccessToken]);
        }
    }];
}

- (void)loadSDKTicket:(NSString *)token {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault synchronize];
    NSString *ticket = [userDefault objectForKey:kTicket];
    if (!ticket.length) {
        [self loadTicketFromNet:token complet:^(NSString *ticket) {
            [self createSignature:ticket];
        }];
    }else {
        NSTimeInterval expires_in = [[userDefault objectForKey:KTicketExpires_in] floatValue];
        NSTimeInterval curTimeInterval = [NSDate date].timeIntervalSince1970;
        NSTimeInterval time = curTimeInterval - expires_in;
        if (time > 7100) {
            [self loadTicketFromNet:token complet:^(NSString *ticket) {
                [self createSignature:ticket];
            }];
        }else {
            [self createSignature:ticket];
        }
    }
    
}
- (void)loadTicketFromNet:(NSString *)token complet:(void(^)(NSString *ticket))completHandle {
    NSDictionary *dict = @{
                           @"access_token":token,
                           @"type":@(2)
                           };
    [[BaseAppRequestManager manager] getNormaldataURL:@"https://api.weixin.qq.com/cgi-bin/ticket/getticket" dic:dict andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NSString *ticket = responseObject[@"ticket"];
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            [userDefault setObject:ticket forKey:kTicket];
            [userDefault synchronize];
            [userDefault setObject:[NSString stringWithFormat:@"%.0f",[NSDate date].timeIntervalSince1970] forKey:KTicketExpires_in];
            [userDefault synchronize];
            completHandle(ticket);
        }
    }];
}

- (void)createSignature:(NSString *)ticket {
    NSString *timeStr = [NSString stringWithFormat:@"%.0f",[NSDate date].timeIntervalSince1970];
    NSString *sinStr = [[NSString stringWithFormat:@"appid=%@&noncestr=%@&sdk_ticket=%@&timestamp=%@",kWXAppID,timeStr,ticket,timeStr]sha1];
    // appid=appid&noncestr=noncestr&sdk_ticket=-p3A5zVP95IuafPhzA6lRR95_F9nZEBfJ_n4E9t8ZFWKJTDPOwccVQhHCwDBmvLkayF_jh-m9HOExhumOziDWA&timestamp=1417508194
    NSLog(@"%@",sinStr);
    [self loadQRCode:sinStr timeStamp:timeStr];
}
- (void)loadQRCode:(NSString *)signature timeStamp:(NSString *)timeStamp {
    
    [self.authSDK Auth:kWXAppID nonceStr:timeStamp timeStamp:timeStamp scope:@"snsapi_userinfo," signature:signature schemeData:nil];
    
}
- (void)onAuthGotQrcode:(UIImage *)image {
    imageview.image = image;
}
-(void)onAuthFinish:(int)errCode AuthCode:(NSString *)authCode {
    if (errCode == 0) {
        NSDictionary *dict = @{
                               @"appid":kWXAppID,
                               @"secret":kWXAppSecret,
                               @"code":authCode,
                               @"grant_type":@"authorization_code"
                               };
        [[BaseAppRequestManager manager] getNormaldataURL:@"https://api.weixin.qq.com/sns/oauth2/access_token" dic:dict andBlock:^(id responseObject, NSError *error) {
            if (responseObject) {
                NSDictionary *dict = @{
                                       @"openid" : responseObject[@"openid"],
                                       @"access_token" : responseObject[@"access_token"]
                                       };
                [self creatUser:dict];
            }
        }];
    }else {
        
    }
}
- (void)onQrcodeScanned {
    
    label.text = @"扫描成功\n请在微信中点击确认即可登录";
}
#pragma mark --创建用户
- (void)creatUser:(NSDictionary *)dict {

    [[BaseAppRequestManager manager] getNormaldataURL:@"https://api.weixin.qq.com/sns/userinfo" dic:dict andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            [self removeFromSuperview];
        }
    }];
}

- (void)dealloc {
}

@end
