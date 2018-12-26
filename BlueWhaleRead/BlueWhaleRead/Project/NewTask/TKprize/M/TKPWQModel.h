//
//  TKPWQModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "TKPWQpastLottery1InfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TKPWQModel : BaseModel
@property (nonatomic, copy) NSString * create_time;//时间
@property (nonatomic, copy) NSString * periodsNum;//期数
@property (nonatomic, strong) NSMutableArray *pastLottery1Info;//往期奖品

@end

NS_ASSUME_NONNULL_END
