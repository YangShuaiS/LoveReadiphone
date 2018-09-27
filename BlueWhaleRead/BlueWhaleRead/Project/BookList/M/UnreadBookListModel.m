//
//  UnreadBookListModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UnreadBookListModel.h"

@implementation UnreadBookListModel
+ (void)InitializeModel{
    [UnreadBookListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"bookList":@"UnreadBookModel"};
    }];
    [UnreadBookModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"badgeList":@"CityBadgeListModel"};
    }];
}
@end
