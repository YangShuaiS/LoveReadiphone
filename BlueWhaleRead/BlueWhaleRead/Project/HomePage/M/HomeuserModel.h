//
//  HomeuserModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface HomeuserModel : BaseModel
@property(nonatomic,copy)NSString * avatar;//用户头像
@property(nonatomic,copy)NSString * badgeNum;//勋章数
@property(nonatomic,copy)NSString * item_id;//用户id  id
@property(nonatomic,copy)NSString * level;//用户等级
@property(nonatomic,copy)NSString *  milestoneNum;//里程碑数
@property(nonatomic,copy)NSString * name;
@property(nonatomic,assign)NSInteger sex;//性别 1为男2为女


@property (nonatomic, strong) NSMutableArray *badgelist;
@property (nonatomic, strong) NSMutableArray *milestone;

@end
