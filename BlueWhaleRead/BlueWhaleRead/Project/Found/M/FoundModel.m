//
//  FoundModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundModel.h"

@implementation FoundModel
+ (void)InitializeModel{
    [FoundModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"studentFriendList":@"FoundUserModel",@"myFriendBookList":@"FoundFriendBooKModel",@"classBookList":@"FoundLikeBookModel",@"bookThoughtList":@"FoundGoodArticleModel"};
    }];
    
    [FoundUserModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"myFriend":@"FoundUserModel"};
    }];
    
    [FoundFriendBooKModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgeList":@"BadgeOnlyImageModel",@"studentBook":@"BookListModel"};
    }];

    [FoundLikeBookModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"bookStudentList":@"ReadPeopleModel"};
    }];
    
    [FoundMonthModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"studentList":@"FoundbadgeRankModel"};
    }];

}
@end
