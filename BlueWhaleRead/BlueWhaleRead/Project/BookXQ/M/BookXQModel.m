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
        return @{@"badgeList":@"CityBadgeListModel",@"bookReview":@"BookXQBookReview",@"readFriend":@"BookXQReadFriendModel",@"readThought":@"BookXQReadThoughtModel",@"bookBuyLink":@"BookBuyLinkModel",@"knowledgeTXList":@"knowledgeTXListModel",@"bannerknowledgeList":@"NKRKnowledgeModel"};
    }];
    [BookXQReadFriendModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgeList":@"CityBadgeListModel"};
    }];
    [BookXQbookModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgeList":@"CityBadgeListModel",@"tags":@"NBCclassificationModel"};
    }];
}
@end
