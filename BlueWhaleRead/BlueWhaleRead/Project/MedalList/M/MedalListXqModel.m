//
//  MedalListXqModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalListXqModel.h"

@implementation MedalListXqModel
+ (void)InitializeModel{
    [MedalListXqModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"bookList":@"AllBookListModel",@"badgeStudentList":@"MedalStudentListModel",@"studentbookList":@"AllBookListModel"};
    }];
    [MedalListDetailModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"friendList":@"MedalBageFriendModel",@"bookList":@"AllBookListModel",@"getFriendList":@"AllGetFriendModel"};
    }];

    [MedalStudentListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgeStudentBookList":@"MedalStudenBookModel"};
    }];
    
    
    
    
    
    
    [MedalListBadgeInfoModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"studentList":@"MedalBageFriendModel"};
    }];
    
    [AllBookListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgeList":@"CityBadgeListModel"};
    }];
    
//    [AllGetFriendModel mj_setupObjectClassInArray:^NSDictionary *{
//        return @{@"friendBadgeList":@"CityBadgeListModel"};
//    }];
    
}
@end
