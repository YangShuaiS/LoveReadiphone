//
//  BuyPackage.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/24.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BuyPackage : BaseModel
@property (nonatomic, assign) NSInteger click;
@property (nonatomic, assign) NSInteger yj;//原价
@property (nonatomic, assign) NSInteger price_times;//年度
@property (nonatomic, assign) NSInteger sfzdxf;//是否是自动续费
@property (nonatomic, copy) NSString * name;


@property (nonatomic, copy) NSString * apple_id;
@property (nonatomic, assign) CGFloat discount;
@property (nonatomic, assign) NSInteger discount_price;
@property (nonatomic, assign) NSInteger is_default;
@property (nonatomic, assign) NSInteger is_enable;
@property (nonatomic, assign) NSInteger is_renew;
@property (nonatomic, assign) NSInteger price_id;
@property (nonatomic, copy) NSString * ssid;

@end

NS_ASSUME_NONNULL_END
