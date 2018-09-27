//
//  MonthPMModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "MonthstudentModel.h"
#import "MonthstudentxqModel.h"
@interface MonthPMModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;

@property (nonatomic, strong) MonthstudentModel *studentList;
+ (void)InitializeModel;

@end
