//
//  MedalListBadgeInfoModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface MedalListBadgeInfoModel : BaseModel
@property (nonatomic, copy) NSString * badgeNum;//点两种人数
@property (nonatomic, copy) NSString * descriptions;//勋章任务说明
@property (nonatomic, copy) NSString * getBadgeNum;//获得的人数
@property (nonatomic, copy) NSString * info;//简介
@property (nonatomic, copy) NSString * logo;//勋章logo
@property (nonatomic, copy) NSString * name;//勋章名
@property (nonatomic, copy) NSString * ssid;//勋章id
@property (nonatomic, assign) NSInteger task_num;//需要读的书数
@property (nonatomic, assign) NSInteger is_completed;//状态


@property (nonatomic, strong) NSMutableArray * studentList;//学生列表

@end
