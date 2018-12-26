//
//  TKPrizeModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "TKPListModel.h"
#import "TKPLModel.h"
#import "TKPWQModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TKPrizeModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) NSMutableArray *oldPrizeList;//以往任务
@property (nonatomic, strong) NSMutableArray *prizeList;//现在奖品

@property (nonatomic, strong) NSMutableArray *pastLotteryList;//往期奖品

@end

NS_ASSUME_NONNULL_END
