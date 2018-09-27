//
//  JoinBookModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/8/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "JoinBookModel.h"

@implementation JoinBookModel
+ (void)InitializeModel{
    [JoinBookBageModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"studentBadgeBook":@"AllBookListModel"};
    }];

}

@end
