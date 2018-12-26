//
//  TKMymissionListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "TKMyListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TKMymissionListModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) NSMutableArray *missionList;//读书任务

@end

NS_ASSUME_NONNULL_END
