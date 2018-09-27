//
//  FoundbadgeRankModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface FoundbadgeRankModel : BaseModel
@property (nonatomic, copy) NSString * avatar;
@property (nonatomic, copy) NSString * monthBadgeNum;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * ssid;
@property(nonatomic,assign)NSInteger sex;

@property (nonatomic, copy) NSString * badges;


@end
