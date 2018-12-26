//
//  TKXSTaskXQModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "TKXSHJPeopleModel.h"
#import "TKXSAllPeopleModel.h"
#import "TFVUserModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TKXSTaskXQModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;

@property (nonatomic, copy) NSString * first_prize_num;
@property (nonatomic, copy) NSString * second_prize_num;
@property (nonatomic, copy) NSString * third_prize_num;
@property (nonatomic, copy) NSString * periods_num;

@property (nonatomic, strong) NSMutableArray * prizeList;




//@property (nonatomic, strong) TKXSHJPeopleModel * firstPrize;
//@property (nonatomic, strong) TKXSHJPeopleModel * secondPrize;
//@property (nonatomic, strong) TKXSHJPeopleModel * thirdPrize;
@property (nonatomic, strong) NSMutableArray * studentRankList;
@property (nonatomic, strong) TFVUserModel *student;//读书任务
@property (nonatomic, strong) TKXSAllPeopleModel * studentid;//读书任务

@property (nonatomic, strong) NHMmissionModel * mission;

@end

NS_ASSUME_NONNULL_END
