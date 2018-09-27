//
//  CityTopBiaoreadBalanceModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface CityTopBiaoreadBalanceModel : BaseModel
@property (nonatomic, assign) NSInteger is_balance;//是否阅读均衡 0 不均衡
@property (nonatomic, copy) NSString * myLevel;
@property(nonatomic,assign)NSInteger myReadNum;
@property(nonatomic,strong) NSMutableArray * studentBalance;//
@property(nonatomic,strong) NSMutableArray * userReadInfo;//
@end
