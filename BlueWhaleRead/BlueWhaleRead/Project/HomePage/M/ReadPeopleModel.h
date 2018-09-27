//
//  ReadPeopleModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface ReadPeopleModel : BaseModel
@property(nonatomic,copy)NSString * ssid;
@property(nonatomic,copy)NSString * avatar;
@property(nonatomic,assign)NSInteger sex;

@end
