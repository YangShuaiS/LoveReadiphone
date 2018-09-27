//
//  AchiZBModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface AchiZBModel : BaseModel
@property(nonatomic,copy)NSString * name;
@property(nonatomic,copy)NSString * ssid;

@property(nonatomic,copy)NSString * level;
@property (nonatomic, strong) NSMutableArray * catalogLevel;//用户阅读信息

@end
