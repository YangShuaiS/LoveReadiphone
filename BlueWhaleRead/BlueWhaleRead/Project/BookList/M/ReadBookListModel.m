//
//  ReadBookListModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ReadBookListModel.h"

@implementation ReadBookListModel
+ (void)InitializeModel{
    [ReadBookListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"bookList":@"ReadbookModel"};
    }];
    [ReadbookModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgeList":@"CityBadgeListModel"};
    }];
}
@end
