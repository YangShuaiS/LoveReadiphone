//
//  TAKmissionModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "TAKJPModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TAKmissionModel : BaseModel
@property (nonatomic, copy) NSString * completed_num;//完成人数
@property (nonatomic, copy) NSString * excellent_prize_id;//新手任务优胜奖id
@property (nonatomic, copy) NSString * excellent_prize_num;//新手任务优胜奖数量
@property (nonatomic, copy) NSString * first_prize_id;//一等奖id
@property (nonatomic, copy) NSString * first_prize_num;//一等奖数量
@property (nonatomic, copy) NSString * mission_background;//任务背景图
@property (nonatomic, copy) NSString * mission_content_img;//任务内容头部图
@property (nonatomic, copy) NSString * mission_info;//任务简介
@property (nonatomic, copy) NSString * mission_name;//任务名
@property (nonatomic, copy) NSString * mission_type;//任务类型
@property (nonatomic, copy) NSString * missionAssessment;//任务评估 新手任务为 1 上升0 下降 普通任务 直接为用户的分数
@property (nonatomic, copy) NSString * rankInfo;//于昨日相比
@property (nonatomic, copy) NSString * second_prize_id;//二等奖id
@property (nonatomic, copy) NSString * second_prize_num;//二等奖数量
@property (nonatomic, copy) NSString * ssid;//任务id
@property (nonatomic, copy) NSString * third_prize_id;//三等奖id
@property (nonatomic, copy) NSString * third_prize_num;//三等奖数量
@property (nonatomic, copy) NSString * periods_num;//期数

@property (nonatomic, assign) CGFloat userRatio;//用户进度

@property (nonatomic, strong) TAKJPModel * first_prize;
@property (nonatomic, strong) TAKJPModel * second_prize;
@property (nonatomic, strong) TAKJPModel * third_prize;


@end

NS_ASSUME_NONNULL_END
