//
//  PingLunModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/11.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PingLunModel : BaseModel
@property (nonatomic, copy) NSString * avatar;
@property (nonatomic, copy) NSString * comment_content;
@property (nonatomic, copy) NSString * comment_id;
@property (nonatomic, copy) NSString * comment_type;
@property (nonatomic, copy) NSString * create_time;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * status;
@property (nonatomic, copy) NSString * student_id;

@end

NS_ASSUME_NONNULL_END
