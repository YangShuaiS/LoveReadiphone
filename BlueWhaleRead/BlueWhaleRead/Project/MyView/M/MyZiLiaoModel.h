//
//  MyZiLiaoModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface MyZiLiaoModel : BaseModel
@property (nonatomic, strong) NSString * avatar;//头像
@property (nonatomic, strong) NSString * clazz;//班级
@property (nonatomic, strong) NSString * code;//学号
@property (nonatomic, strong) NSString * grade;//年级
@property (nonatomic, strong) NSString * level;//等级
@property (nonatomic, strong) NSString * name;//名
@property (nonatomic, strong) NSString * phone;//手机号
@property (nonatomic, strong) NSString * school;//学校
@property (nonatomic, strong) NSString * score;//总积分
@property (nonatomic, assign) NSInteger sex;//性别
@property (nonatomic, strong) NSString * ssid;//id

@end
