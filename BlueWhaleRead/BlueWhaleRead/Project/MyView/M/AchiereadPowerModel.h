//
//  AchiereadPowerModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "AcherPowerTYModel.h"
@interface AchiereadPowerModel : BaseModel
@property (nonatomic, assign) NSInteger is_power;//是否阅读均衡 0 不均衡
@property (nonatomic, assign) NSInteger ssid;//是否阅读均衡 0 不均衡
@property (nonatomic, strong) AcherPowerTYModel * clazzAbility;//班级
@property (nonatomic, strong) AcherPowerTYModel * myAbility;//我的本数
@property (nonatomic, strong) AcherPowerTYModel * overnum;//超出占比

@end
