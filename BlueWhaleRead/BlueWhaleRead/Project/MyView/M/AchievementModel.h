//
//  AchievementModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "AchievementReportModel.h"
#import "AchievementreadBalanceModel.h"
#import "AchiemyBalanceModel.h"
#import "AchieuserReadInfoModel.h"
#import "AchieusersystemBalanceModel.h"
#import "AchiZBModel.h"
#import "AchieLeveModel.h"

#import "AchiereadPowerModel.h"//阅读能力

#import "AcherPowerreadNumModel.h"//阅读量
#import "AcherPowerNumModel.h"

#import "AcherSZSCModel.h"//识字识词
#import "AcherSzScNRModel.h"
@interface AchievementModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property(nonatomic,assign)NSInteger glossaryNum;//识词
@property(nonatomic,assign)NSInteger literacyNum;//识字
@property(nonatomic,assign)NSInteger myReadNum;//读书个数
@property (nonatomic, strong) NSMutableArray * report;
@property (nonatomic, strong) AchievementreadBalanceModel * readBalance;//阅读均衡
@property (nonatomic, strong) AchiereadPowerModel * readPower;//阅读能力
@property (nonatomic, strong) AcherPowerreadNumModel * readNum;//阅读能力
@property (nonatomic, strong) AcherSZSCModel * literacy;//识字
@property (nonatomic, strong) AcherSZSCModel * glossary;//识词

+ (void)InitializeModel;
@end
