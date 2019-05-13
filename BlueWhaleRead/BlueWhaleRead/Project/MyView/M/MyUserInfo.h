//
//  MyUserInfo.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface MyUserInfo : BaseModel
@property (nonatomic, copy) NSString * avatar;
@property (nonatomic, copy) NSString * level;
@property (nonatomic, copy) NSString * messageNum;//消息数
@property (nonatomic, copy) NSString * myRank;//我的排名
@property (nonatomic, copy) NSString * myReadNum;//我的读书数
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * score;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * praiseNum;//表扬数
@property(nonatomic,strong)MyClassTopModel * clazz;//班级
@property(nonatomic,strong)MyClassTopModel * grade;//班级
@property(nonatomic,strong)MyClassTopModel * school;//班级

@property (nonatomic, assign) NSInteger is_member;//0未开通,1开通
@property (nonatomic, copy) NSString * member_begin_time;
@property (nonatomic, copy) NSString * member_end_time;
@property (nonatomic, copy) NSDateComponents * begin_time;
@property (nonatomic, copy) NSDateComponents * end_time;

@end
