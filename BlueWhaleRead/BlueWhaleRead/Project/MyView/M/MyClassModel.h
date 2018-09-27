//
//  MyClassModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface MyClassModel : BaseModel
@property (nonatomic, copy) NSString * MonthReadNum;//月阅读量
@property (nonatomic, copy) NSString * allReadNum;//总阅读量
@property (nonatomic, copy) NSString * monthBadgeNum;//总阅读量


@property (nonatomic, copy) NSString * avatar;
@property (nonatomic, copy) NSString * level;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * score;//总积分
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * status;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, strong) NSMutableArray *studentBadgeList;
@end
