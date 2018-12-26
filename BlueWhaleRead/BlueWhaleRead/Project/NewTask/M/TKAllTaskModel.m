//
//  TKAllTaskModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKAllTaskModel.h"

@implementation TKAllTaskModel
+ (void)InitializeModel{
    [TKAllTaskModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"missionList":@"TKTaskListModel"};
    }];
    [TFameViewModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"studentRankList":@"TFVUserModel"};
    }];
    
    [TKPrizeModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"prizeList":@"TKPLModel",@"oldPrizeList":@"TKPListModel",@"pastLotteryList":@"TKPWQModel"};
    }];
    [TKPWQModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"pastLottery1Info":@"TKPWQpastLottery1InfoModel"};
    }];
    [TKPWQpastLottery1InfoModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"studentList":@"TKPstudentListModel"};
    }];
    
    
    
    [TKPListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"prizeList":@"TKPLModel"};
    }];
    [TAKweeksInfoModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"read_time":@"NHthisReadbokModel",@"weeks":@"NHTimeListModel"};
    }];
    
    
    [TAKALLModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"bookList":@"BookListModel"};
    }];
    
    [TKMymissionListModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"missionList":@"TKMyListModel"};
    }];
    
}
@end
