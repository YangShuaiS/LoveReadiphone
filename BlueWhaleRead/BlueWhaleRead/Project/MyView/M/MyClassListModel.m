//
//  MyClassListModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyClassListModel.h"

@implementation MyClassListModel
+ (void)InitializeModel{
    [MyClassListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"studentList":@"MyClassModel"};
    }];
    [MyClassModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"studentBadgeList":@"BadgeOnlyImageModel"};
    }];
}
@end
