//
//  HomePage.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomePage.h"

@implementation HomePage
+ (void)InitializeModel{
    [HomePage mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"hotBadge":@"BadgeListModel",@"friendBook":@"BookFriendModel",@"classStudent":@"DynamicListModel",@"bannerList":@"LunboModel",@"iconList":@"TagModel",@"testImgList":@"TestImgListModel"};
    }];
    [BookFriendModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"studentList":@"MedalBageFriendModel"};
    }];
    [TypeListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"bookList":@"BookListModel"};
    }];
    [HomeuserModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgelist":@"HomebadgelistModel",@"milestone":@"HomemilestoneModel"};
    }];
}
@end
