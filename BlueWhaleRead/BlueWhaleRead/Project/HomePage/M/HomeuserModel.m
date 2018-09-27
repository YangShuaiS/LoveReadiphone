//
//  HomeuserModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeuserModel.h"

@implementation HomeuserModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"item_id":@"id"};
}
@end
