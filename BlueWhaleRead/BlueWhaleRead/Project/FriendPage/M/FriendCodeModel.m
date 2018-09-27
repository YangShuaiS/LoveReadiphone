//
//  FriendCodeModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendCodeModel.h"

@implementation FriendCodeModel
+ (void)InitializeModel{
    [FriendCodeModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"friendReadList":@"AllBookListModel",@"friendBadgeList":@"BageLeveListModel"};
    }];
//    CityBadgeListModel
//    [BookXQReadFriendModel mj_setupObjectClassInArray:^NSDictionary *{
//        return @{@"badgeList":@"CityBadgeListModel"};
//    }];
}
@end
