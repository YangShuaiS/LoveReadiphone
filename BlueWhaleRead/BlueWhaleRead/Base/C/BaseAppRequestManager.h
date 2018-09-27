//
//  BaseAppRequestManager.h
//  ZYlive
//
//  Created by 杨帅 on 2017/5/26.
//  Copyright © 2017年 杨帅. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface BaseAppRequestManager : AFHTTPSessionManager
+ (BaseAppRequestManager *)shareManager;

- (void)getNormaldataURL:(NSString *)URL dic:(NSDictionary *)dic andBlock:(void(^)(id responseObject,NSError * error))block;
- (void)PostNormaldataURL:(NSString *)URL dic:(NSDictionary *)dic andBlock:(void(^)(id responseObject,NSError * error))block;
@end
