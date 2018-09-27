//
//  LCBMilestone.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "LCBmilestoneModel.h"
@interface LCBMilestone : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, assign) NSInteger nextMilestone;//下一个里程碑书数
@property (nonatomic, copy) NSString * nextstone;//下一个里程碑id
@property (nonatomic, assign) NSInteger readnum;//用户已读书数

@property(nonatomic,strong)NSMutableArray * milestone;//里程碑信息

+ (void)InitializeModel;

@end
