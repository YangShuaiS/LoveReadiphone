//
//  DynamicModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/23.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "CreatetimeModel.h"
@interface DynamicModel : BaseModel
@property(nonatomic,copy)NSString * milestone;//里程碑
@property(nonatomic,copy)NSString * name;//勋章名
@property(nonatomic,copy)NSString * ssid;//里程碑id/勋章id
@property(nonatomic,copy)NSString * student_id;//用户id
//@property(nonatomic,strong) CreatetimeModel * create_time;//时间
@property(nonatomic,copy) NSString * create_time;

@end
