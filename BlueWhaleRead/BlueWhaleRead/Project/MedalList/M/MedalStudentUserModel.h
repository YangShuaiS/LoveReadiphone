//
//  MedalStudentUserModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface MedalStudentUserModel : BaseModel
@property (nonatomic, copy) NSString * avatar;
@property (nonatomic, copy) NSString * level;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, assign) NSInteger sex;


@end
