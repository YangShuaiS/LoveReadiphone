//
//  ZhiShiShuFLModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/16.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuFLModel.h"

@implementation ZhiShiShuFLModel

+ (void)InitializeModel{
    [ZhiShiShuFLModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"data":@"ZhiShiShuFLOneModel"};
    }];
    [ZhiShiShuFLOneModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"children":@"ZhiShiShuFLOneModel"};
    }];
}

@end
