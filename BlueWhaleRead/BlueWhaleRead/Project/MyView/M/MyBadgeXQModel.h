//
//  MyBadgeXQModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface MyBadgeXQModel : BaseModel

@property (nonatomic, strong) NSMutableArray *badgeStudentList;//MedalBageFriendModel 数据统一
@property(nonatomic,strong) CreatetimeModel * endtime;//结束时间
@property (nonatomic, copy) NSString * min_logo;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, assign) NSInteger task_num;
@property (nonatomic, strong) MedalBageFriendModel *student;//MedalBageFriendModel 数据统一
@property (nonatomic, strong) NSMutableArray *studentBadge;//MedalBageFriendModel 数据统一
@property (nonatomic, assign) NSInteger studentBadgeNum;//MedalBageFriendModel 数据统一
@property (nonatomic, assign) NSInteger book_count;//MedalBageFriendModel 数据统一


//"is_completed": 1,"remain_days": 121,           点亮中       剩余天数
//"is_completed": 2,"completed_time": "1997-03-21 12:00:00", 已完成  完成时间
//"is_completed": 3,"expiry_time": "2018-06-28 16:00:00",   已过期    过期时间

@property(nonatomic,assign)NSInteger is_completed;
@property (nonatomic, copy) NSString * remain_days;
@property (nonatomic, copy) NSString * expiry_time;
@property (nonatomic, copy) NSString * completed_time;
@end
