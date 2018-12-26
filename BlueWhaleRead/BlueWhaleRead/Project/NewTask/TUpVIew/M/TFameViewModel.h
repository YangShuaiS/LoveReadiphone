//
//  TFameViewModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "TFVUserModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TFameViewModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) TFVUserModel *student;//读书任务
@property (nonatomic, strong) NSMutableArray * studentRankList;

@end

NS_ASSUME_NONNULL_END
