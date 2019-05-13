//
//  BuyAllModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/24.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyAllModel.h"

@implementation BuyAllModel
+ (void)InitializeModel{
    [BuyAllModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"productInfoIos":@"PackageTypeModel",@"bookList":@"BookListModel",@"yuBookList":@"BookListModel",@"yuBannerList":@"NKRKnowledgeModel"};
    }];
    
    [PackageTypeModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"discount":@"BuyPackage"};
    }];
    [BuyYaoQingModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"invitedInfoList":@"PingLunModel",@"invitedStudentList":@"PingLunModel"};
    }];
    [BuyorderModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"myOrder":@"OrderModel"};
    }];
}
@end
