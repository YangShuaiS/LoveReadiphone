//
//  AchievementView.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface AchievementView : BaseView
@property(nonatomic,strong)NSString * name;

@property(nonatomic,assign)ChartStyle style;
@property(nonatomic,strong) AchievementreadBalanceModel * readBalance;
@property(nonatomic,strong) AchiereadPowerModel * readPower;//能力
@property (nonatomic, strong) AcherPowerreadNumModel * readNum;//阅读能力
@property (nonatomic, strong) AcherSZSCModel * literacy;//识字
@property (nonatomic, strong) AcherSZSCModel * glossary;//识词

@property(nonatomic,assign)NSInteger glossaryNum;//识词
@property(nonatomic,assign)NSInteger literacyNum;//识字
@property(nonatomic,assign)NSInteger myReadNum;//读书个数
@end
