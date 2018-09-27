//
//  MyBadgeListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "MyBadgeXQModel.h"
@interface MyBadgeListModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;



@property(nonatomic,strong)CityBadgeListModel * badge;//本周勋章
@property(nonatomic,strong)NSMutableArray * badgestudent;//本周勋章领取的人
@property(nonatomic,strong)NSMutableArray * myBadge;//我的勋章
+ (void)InitializeModel;

@end
