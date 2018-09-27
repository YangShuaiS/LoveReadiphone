//
//  TagModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TagModel.h"

@implementation TagModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"item_id":@"id"};
}
@end
