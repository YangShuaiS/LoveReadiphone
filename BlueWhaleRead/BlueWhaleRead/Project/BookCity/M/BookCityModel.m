//
//  BookCityModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookCityModel.h"

@implementation BookCityModel
+ (void)InitializeModel{

    [BookCityModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"bookList":@"CityBookListModel",@"catalogList":@"CityTypeListModel",@"levels":@"BookFenjiModel",@"sort":@"CityOrderBookModel"};
    }];
    [CityTypeListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"child":@"CityTypeListModel"};
    }];
    [CityBookListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgeList":@"CityBadgeListModel"};
    }];
    
    [CityTopBiaoreadBalanceModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"studentBalance":@"AchiemyBalanceModel",@"userReadInfo":@"AchieuserReadInfoModel"};
    }];
}
@end
