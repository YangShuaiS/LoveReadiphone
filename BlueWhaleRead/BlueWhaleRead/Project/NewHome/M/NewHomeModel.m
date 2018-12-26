//
//  NewHomeModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NewHomeModel.h"

@implementation NewHomeModel
+ (void)InitializeModel{
    [NewHomeModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"bannerList":@"LunboModel",@"proverb":@"NHProverbModel",@"missionList":@"NHmissionListModel"};
    }];
    [NHBookTagModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"bookList":@"BookListModel"};
    }];
    [NHthisWeekInfoModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"readBookInfo":@"NHthisReadbokModel"};
    }];
    
    //获奖提示视图
    [TKXSTaskXQModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"studentRankList":@"TFVUserModel",@"prizeList":@"TKXSHJPeopleModel"};
    }];
    [TKXSHJPeopleModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"studentList":@"TFVUserModel"};
    }];
    
    
    [HTShareModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"missionShareList":@"HTShareListModel"};
    }];
}
@end
