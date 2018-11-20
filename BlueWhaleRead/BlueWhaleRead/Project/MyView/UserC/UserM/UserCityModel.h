//
//  UserCityModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "UserCitySmolModel.h"
@interface UserCityModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) NSMutableArray *areaList;
+ (void)InitializeModel;
@end

