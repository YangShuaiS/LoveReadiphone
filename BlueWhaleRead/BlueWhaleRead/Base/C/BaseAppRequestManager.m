//
//  BaseAppRequestManager.m
//  ZYlive
//
//  Created by 杨帅 on 2017/5/26.
//  Copyright © 2017年 杨帅. All rights reserved.
//

#import "BaseAppRequestManager.h"
//static NSString * const BasURLString = ZSFWQ;
static BaseAppRequestManager * manger = nil;
@implementation BaseAppRequestManager
#pragma mark - 创建请求者
+ (BaseAppRequestManager *)shareManager{
    static dispatch_once_t onceToken;//里面代码块只执行一次
    dispatch_once(&onceToken, ^{
        if (manger == nil) {
            manger = [self BaseManager:manger];
        }
    });

    return manger;
}
+ (BaseAppRequestManager *)BaseManager:(BaseAppRequestManager*)mangers{
    mangers = [BaseAppRequestManager manager];
    
//    mangers.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//  mangers.securityPolicy.allowInvalidCertificates = YES;
//    [mangers.securityPolicy setValidatesDomainName:NO];

    //3.请求
    mangers.requestSerializer = [AFJSONRequestSerializer serializer]; // 上传普通格式
    mangers.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
//    AFHTTPRequestSerializer *requestSerializer =  [AFJSONRequestSerializer serializer];
//    NSDictionary *headerFieldValueDictionary = @{@"version":@"1.0"};
//    if (headerFieldValueDictionary != nil) {
//        for (NSString *httpHeaderField in headerFieldValueDictionary.allKeys) {
//            NSString *value = headerFieldValueDictionary[httpHeaderField];
//            [requestSerializer setValue:value forHTTPHeaderField:httpHeaderField];
//        }
//    }
//    mangers.requestSerializer = requestSerializer;
    
    mangers.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@" /json",@"text/json", @"text/plain", @"text/html",@"application/json",nil];
    mangers.requestSerializer.timeoutInterval = 30;
    [mangers.securityPolicy setAllowInvalidCertificates:YES];
    [mangers setSecurityPolicy:[BaseAppRequestManager customSecurityPolicy]];

    return mangers;
}
#pragma mark - GET请求正常数据

- (void)getNormaldataURL:(NSString *)URL dic:(NSDictionary *)dic andBlock:(void(^)(id responseObject,NSError * error))block{
    
    dispatch_queue_t RequestDataQueue = dispatch_queue_create("RequestDataQueueCONCURRENT", DISPATCH_QUEUE_CONCURRENT);//并发队列,请求数据
    dispatch_async(RequestDataQueue, ^{
        [[BaseAppRequestManager shareManager] GET:URL parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // 请求成功
            if(responseObject){
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                dispatch_async(dispatch_get_main_queue(), ^{
                    block(dict,nil);
                });
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    block(nil, nil);
                });
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                block(nil, error);
            });
        }];
    });
    
}


- (void)PostNormaldataURL:(NSString *)URL dic:(NSDictionary *)dic andBlock:(void(^)(id responseObject,NSError * error))block{
    
    [[BaseAppRequestManager shareManager] POST:URL parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        // 拼接data到请求体，这个block的参数是遵守AFMultipartFormData协议的。
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        // 这里可以获取到目前的数据请求的进度
//        MJExtensionLog(@"######%f",1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功，解析数据
        if(responseObject){
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            block(dict,nil);
        } else {
            block(nil, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        block(nil, error);

    }];

  
}

+ (AFSecurityPolicy *)customSecurityPolicy
{
    //先导入证书，找到证书的路径
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"api.piaojuhui.net" ofType:@"cer"];
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    //AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    //如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = YES;
    NSSet *set = [[NSSet alloc] initWithObjects:certData, nil];
    securityPolicy.pinnedCertificates = set;
    
    return securityPolicy;
}
@end
