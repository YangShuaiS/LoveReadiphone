//
//  AchievementModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "AchievementModel.h"

@implementation AchievementModel
+ (void)InitializeModel{
    [AchievementModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"report":@"AchievementReportModel"};
    }];
    
    [AchievementreadBalanceModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"myBalance":@"AchiemyBalanceModel",@"userReadInfo":@"AchieuserReadInfoModel"};
    }];
    
    [AchieusersystemBalanceModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"catalogList":@"AchiZBModel",@"levelBalance":@"AchiZBModel"};
        
    }];
    [AchiZBModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"catalogLevel":@"AchieLeveModel"};
    }];
    
    [AcherPowerreadNumModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"classBook":@"AcherPowerNumModel",@"myMonthReadNum":@"AcherPowerNumModel"};
    }];
    [AcherSZSCModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"myMonthGlossary":@"AcherSzScNRModel",@"myMonthLiteracy":@"AcherSzScNRModel"};
    }];
    
}
@end
