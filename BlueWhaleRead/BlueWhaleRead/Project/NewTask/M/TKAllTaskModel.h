//
//  TKAllTaskModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "TKTaskListModel.h"

#import "TFameViewModel.h"
#import "TKPrizeModel.h"
#import "TAKALLModel.h"
#import "TKbuiltModel.h"

#import "TKMymissionListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TKAllTaskModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) NSMutableArray *missionList;//读书任务
+ (void)InitializeModel;

@end

NS_ASSUME_NONNULL_END
