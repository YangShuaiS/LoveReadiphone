//
//  MonthstudentxqModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface MonthstudentxqModel : BaseModel
@property (nonatomic, copy) NSString * allReadNum;
@property (nonatomic, copy) NSString * avatar;
@property (nonatomic, copy) NSString * monthBadgeNum;
@property (nonatomic, copy) NSString * MonthReadNum;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * score;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, copy) NSString * ssid;

@property (nonatomic, strong) NSMutableArray *studentBadgeList;

@end
