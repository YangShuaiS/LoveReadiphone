//
//  UserLoginModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserLoginModel.h"

@implementation UserLoginModel
+ (void)InitializeModel{
    [UserLoginModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"levelList":@"levelListModel"};
    }];
}
@end
