//
//  HTShareModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "HTShareListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HTShareModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) NSMutableArray *missionShareList;//

@end

NS_ASSUME_NONNULL_END
