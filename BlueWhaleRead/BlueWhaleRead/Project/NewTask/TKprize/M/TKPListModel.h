//
//  TKPListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKPListModel : BaseModel
@property (nonatomic, copy) NSString * periodsNum;
@property (nonatomic, strong) NSMutableArray *prizeList;//现在奖品

@end

NS_ASSUME_NONNULL_END
