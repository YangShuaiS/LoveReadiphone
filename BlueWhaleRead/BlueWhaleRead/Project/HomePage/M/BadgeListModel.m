//
//  BadgeListModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BadgeListModel.h"

@implementation BadgeListModel
- (void)setValue:(id)value forKey:(NSString *)key{
    if ([key  isEqual: @"id"]) {
        key = @"item_id";
    }
    [super setValue:value forKey:key];
    
}
@end
