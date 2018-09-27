//
//  CreatetimeModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/23.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface CreatetimeModel : BaseModel
@property(nonatomic,copy)NSString * date;//
@property(nonatomic,copy)NSString * day;//
@property(nonatomic,copy)NSString * hours;//
@property(nonatomic,copy)NSString * minutes;//
@property(nonatomic,copy)NSString * month;//
@property(nonatomic,copy)NSString * seconds;//
@property(nonatomic,copy)NSString * time;//
@property(nonatomic,copy)NSString * timezoneOffset;//
@property(nonatomic,copy)NSString * year;//

@end
