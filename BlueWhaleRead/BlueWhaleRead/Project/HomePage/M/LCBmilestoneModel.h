//
//  LCBmilestoneModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface LCBmilestoneModel : BaseModel
@property (nonatomic, copy) NSString * milestone;//里程碑id
@property (nonatomic, copy) NSString *  ssid;
@property (nonatomic, copy) NSString * stone;//里程碑书数
@property (nonatomic, copy) NSString * student_id;//学生id

@end
