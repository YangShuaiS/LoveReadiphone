//
//  PackageTypeModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/5/6.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseModel.h"
#import "BuyYaoQingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PackageTypeModel : BaseModel
@property (nonatomic, assign) NSInteger model_type;
@property (nonatomic, assign) NSInteger price;
@property (nonatomic, assign) NSInteger price_times;
@property (nonatomic, assign) NSInteger price_type;
@property (nonatomic, assign) NSInteger ssid;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString * price_name;
@property (nonatomic, strong) BuyYaoQingModel * studentInvitedInfo;

@property (nonatomic, copy) NSMutableArray * discount;
@end

NS_ASSUME_NONNULL_END
