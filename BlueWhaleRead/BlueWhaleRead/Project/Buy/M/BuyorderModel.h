//
//  BuyorderModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/5/7.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BuyorderModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) NSMutableArray *myOrder;//订单
@end

NS_ASSUME_NONNULL_END
