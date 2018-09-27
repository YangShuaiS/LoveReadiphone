//
//  MyDeModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyDeModel.h"

@implementation MyDeModel
+ (void)InitializeModel{
    [MyDeModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"myBadgeList":@"BageLeveListModel"};
    }];
    
    [BageLeveListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"levelbadgeList":@"CityBadgeListModel"};
    }];
}
@end
