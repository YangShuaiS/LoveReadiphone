//
//  MyBadgeListModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyBadgeListModel.h"

@implementation MyBadgeListModel
+ (void)InitializeModel{
    [MyBadgeListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgestudent":@"ReadPeopleModel",@"myBadge":@"MyBadgeXQModel"};
    }];
    [MyBadgeXQModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgeStudentList":@"MedalBageFriendModel",@"studentBadge":@"MedalStudenBookModel"};
    }];

}
@end
