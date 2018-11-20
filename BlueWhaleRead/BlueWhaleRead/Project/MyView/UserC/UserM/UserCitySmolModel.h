//
//  UserCitySmolModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface UserCitySmolModel : BaseModel
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, strong) NSMutableArray *cityList;
@property (nonatomic, strong) NSMutableArray *areaList;

@end

