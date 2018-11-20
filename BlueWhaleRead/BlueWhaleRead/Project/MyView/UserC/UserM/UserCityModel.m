//
//  UserCityModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserCityModel.h"

@implementation UserCityModel
+ (void)InitializeModel{
    [UserCityModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"areaList":@"UserCitySmolModel"};
    }];
    [UserCitySmolModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"areaList":@"UserCitySmolModel",@"cityList":@"UserCitySmolModel"};
    }];
}
@end
