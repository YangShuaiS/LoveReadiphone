//
//  AchievementreadBalanceModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "AchieclassBalanceModel.h"
#import "AchieusersystemBalanceModel.h"
@interface AchievementreadBalanceModel : BaseModel
@property (nonatomic, copy) NSString * myLevel;
@property (nonatomic, assign) NSInteger is_balance;//是否阅读均衡 0 不均衡
@property (nonatomic, strong) NSMutableArray * myBalance;//我的阅读均衡
@property (nonatomic, strong) AchieclassBalanceModel * classBalance;//班级阅读均衡
@property (nonatomic, strong) NSMutableArray * userReadInfo;//用户阅读信息
@property (nonatomic, strong) AchieusersystemBalanceModel * systemBalance;//占比

@end
