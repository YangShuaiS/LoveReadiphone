//
//  TKMyListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "TKstudentMissionModel.h"
#import "TKmissionModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TKMyListModel : BaseModel
@property (nonatomic, strong) TKstudentMissionModel * studentMission;
@property (nonatomic, strong) TKmissionModel * mission;


@end

NS_ASSUME_NONNULL_END
