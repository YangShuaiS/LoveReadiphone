//
//  TAKALLModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "TAKmissionModel.h"
#import "TAKmissionRoleModel.h"
#import "TAKweeksInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TAKALLModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, assign) NSInteger is_receive;//是否领取 0 未领取
@property (nonatomic, copy) NSString * completed_time;//完成时间
@property (nonatomic, copy) NSString * received_time;//领取时间
@property (nonatomic, copy) NSString * missionStatus;//任务状态 1为进行中 2为已完成 3为已放弃
@property (nonatomic, strong) TAKmissionModel * mission;
@property (nonatomic, strong) TAKmissionRoleModel * missionRole;
@property (nonatomic, strong) TAKweeksInfoModel * weeksInfo;
@property (nonatomic, strong) NSMutableArray * bookList;

@property (nonatomic, copy) NSString * lottery_time;//领取时间
@property (nonatomic, copy) NSString * old_lottery_time;//领取时间

@end

NS_ASSUME_NONNULL_END
