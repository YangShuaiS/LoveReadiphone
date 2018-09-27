//
//  BookXQModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookXQModel.h"

@implementation BookXQModel
+ (void)InitializeModel{
    [BookXQModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgeList":@"CityBadgeListModel",@"bookReview":@"BookXQBookReview",@"readFriend":@"BookXQReadFriendModel",@"readThought":@"BookXQReadThoughtModel"};
    }];
    [BookXQReadFriendModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgeList":@"CityBadgeListModel"};
    }];
    [BookXQbookModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgeList":@"CityBadgeListModel"};
    }];
}
@end
