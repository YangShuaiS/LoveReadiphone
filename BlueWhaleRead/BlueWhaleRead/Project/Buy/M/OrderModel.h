//
//  OrderModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/5/7.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderModel : BaseModel
@property (nonatomic, copy) NSString * discount_id;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * is_renew;
@property (nonatomic, copy) NSString * order_amount;
@property (nonatomic, copy) NSString * order_number;
@property (nonatomic, copy) NSString * order_time;
@property (nonatomic, copy) NSString * outer_trade_no;
@property (nonatomic, copy) NSString * pay_method;
@property (nonatomic, copy) NSString * pay_status;
@property (nonatomic, copy) NSString * pay_type;
@property (nonatomic, assign) NSInteger payment_amount;
@property (nonatomic, copy) NSString * payment_time;
@property (nonatomic, copy) NSString * pre_invited_id;
@property (nonatomic, copy) NSString * product_name;
@property (nonatomic, copy) NSString * student_id;
@property (nonatomic, copy) NSString * trade_status;

@end

NS_ASSUME_NONNULL_END
