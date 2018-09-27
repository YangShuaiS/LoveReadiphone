//
//  MedalListDetailModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalListDetailModel.h"

@implementation MedalListDetailModel
- (void)setValue:(id)value forKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        key = @"descriptions";
    }
    [super setValue:value forKey:key];
}
@end
