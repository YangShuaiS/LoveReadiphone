//
//  LCBMilestone.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "LCBMilestone.h"

@implementation LCBMilestone
+ (void)InitializeModel{
    [LCBMilestone mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"milestone":@"LCBmilestoneModel"};
    }];
}
@end
