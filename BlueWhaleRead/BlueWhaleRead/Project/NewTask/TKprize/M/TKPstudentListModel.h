//
//  TKPstudentListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKPstudentListModel : BaseModel
@property (nonatomic, copy) NSString * avatar;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * student_video;

@end

NS_ASSUME_NONNULL_END
