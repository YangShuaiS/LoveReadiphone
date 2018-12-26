//
//  TKTaskListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKTaskListModel : BaseModel
@property (nonatomic, copy) NSString * mission_background;
@property (nonatomic, copy) NSString * mission_name;
@property (nonatomic, copy) NSString * mission_type;
@property (nonatomic, copy) NSString * periods_num;
@property (nonatomic, copy) NSString * prize_name;
@property (nonatomic, copy) NSString * receiveNum;//领取人数
@property (nonatomic, copy) NSString * completedNum;//完成人数
@property (nonatomic, copy) NSString * selfBuildNum;//自建人数


@property (nonatomic, copy) NSString * ssid;


@end

NS_ASSUME_NONNULL_END
