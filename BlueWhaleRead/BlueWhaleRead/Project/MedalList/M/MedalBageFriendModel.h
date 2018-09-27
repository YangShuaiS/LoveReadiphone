//
//  MedalBageFriendModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface MedalBageFriendModel : BaseModel
@property (nonatomic, copy) NSString * avatar;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * ssid;//学生id
@property (nonatomic, assign) NSInteger sex;//性别

@end
