//
//  TKstudentMissionModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKstudentMissionModel : BaseModel
@property (nonatomic, copy) NSString * completed_time;
@property (nonatomic, copy) NSString * receive_time;
@property (nonatomic, copy) NSString * score;
@property (nonatomic, copy) NSString * status;
@property (nonatomic, copy) NSString * ssid;

@end

NS_ASSUME_NONNULL_END
