//
//  DynamicList.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "DynamicModel.h"
@interface DynamicListModel : BaseModel
@property(nonatomic,copy)NSString * avatar;//用户头像
@property(nonatomic,copy)NSString * name;//用户名
@property(nonatomic,copy)NSString * ssid;
@property(nonatomic,assign)NSInteger sex;//性别
@property(nonatomic,strong) DynamicModel * dynamic;//动态信息    
@end
