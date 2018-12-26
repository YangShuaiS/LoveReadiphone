//
//  TKXSAllPeopleModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKXSAllPeopleModel : BaseModel
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * mission_name;
@property (nonatomic, copy) NSString * mission_type;
@property (nonatomic, copy) NSString * score;
@property (nonatomic, copy) NSString * next_mission;
@property (nonatomic, copy) NSString * next_mission_name;

@end

NS_ASSUME_NONNULL_END
