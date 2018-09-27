//
//  MedalListModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalListModel.h"

@implementation MedalListModel
+ (void)InitializeModel{
    [MedalListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgeList":@"MedalBadgeListModel"};
    }];
    [MedalBadgeListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"studentList":@"MedalBageFriendModel"};
    }];
}

@end
