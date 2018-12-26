//
//  NHMissionModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "NHMmissionModel.h"
#import "NHthisWeekInfoModel.h"
#import "TAKmissionRoleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NHMissionModel : BaseModel
@property (nonatomic, strong) NHthisWeekInfoModel * thisWeekInfo;
@property (nonatomic, strong) NHMmissionModel * mission;
@property (nonatomic, assign) NSString * userRatio;
@property (nonatomic, strong) TAKmissionRoleModel * missionRole;

@end

NS_ASSUME_NONNULL_END
